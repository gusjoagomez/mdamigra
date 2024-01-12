package main

import (
	"log"
	"time"

	models "github.com/gusjoagomez/mdaliquimodel/migracion"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Periodo struct {
	FechaInicio time.Time
	FechaFin    time.Time
}

var periodosGlobal []Periodo

func main() {

	// Define los periodos o rangos de fechas
	// desde 01/01/1900 al 31/12/1995
	// desde 01/01/1996 al 31/12/2012
	// desde 01/01/2013 al 31/12/2024
	periodosGlobal = []Periodo{
		{time.Date(1900, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(1995, 12, 31, 0, 0, 0, 0, time.UTC)},
		{time.Date(1996, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(2012, 12, 31, 0, 0, 0, 0, time.UTC)},
		{time.Date(2013, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(2024, 12, 31, 0, 0, 0, 0, time.UTC)},
	}

	dsn := "host=localhost user=postgres password=password dbname=rrhh port=5432 sslmode=disable TimeZone=UTC"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Error al conectarse a base de datos")
	}
	// Auto-migrar el modelo Empleado a la base de datos (crear la tabla si no existe)
	db.AutoMigrate(&models.EmpleadoRES{})

	// Borra todos los registros de tabla resultado
	db.Where("1 = 1").Delete(&models.EmpleadoRES{})

	importarDesdeJ50(db)
	importarDesdeNR(db)
}

// ----------------------------------------------
// importarDesdeJ50:
// importa Todos los registros desde tabla J50
// ----------------------------------------------
func importarDesdeJ50(db *gorm.DB) {
	var tipoAntiguedad string

	sql := `SELECT legajo, cargo, fecha_desde, fecha_hasta, empresa, computa_para_antig, computa_para_vacac, fecha_presentacion, fecha_aceptacion
	FROM migracion."empleadoJ50"`
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var empJ50 models.EmpleadoJ50
		err := rows.Scan(&empJ50.Legajo, &empJ50.Cargo, &empJ50.FechaDesde, &empJ50.FechaHasta, &empJ50.Empresa, &empJ50.ComputaParaAntig, &empJ50.ComputaParaVacac, &empJ50.FechaPresentacion, &empJ50.FechaAceptacion)
		if err != nil {
			log.Fatal(err)
		}

		var empNR models.EmpleadoNR
		if err := db.Where("legajo = ? AND cargo = ? AND fecha_desde = ?", empJ50.Legajo, empJ50.Cargo, empJ50.FechaDesde).First(&empNR).Error; err != nil {
			tipoAntiguedad = ""
		} else {
			tipoAntiguedad = empNR.TipoAntiguedad
		}

		empRES := models.EmpleadoRES{
			Legajo:            empJ50.Legajo,
			Cargo:             empJ50.Cargo,
			FechaDesde:        empJ50.FechaDesde,
			FechaHasta:        empJ50.FechaHasta,
			Empresa:           empJ50.Empresa,
			ComputaParaAntig:  empJ50.ComputaParaAntig,
			ComputaParaVacac:  empJ50.ComputaParaVacac,
			FechaPresentacion: empJ50.FechaPresentacion,
			FechaAceptacion:   empJ50.FechaAceptacion,
			TipoAntiguedad:    tipoAntiguedad,
		}

		if err := db.Create(&empRES).Error; err != nil {
			log.Printf("Falló al crear registro EmpleadoRES para Legajo: %d, Cargo: %d, FechaDesde: %s \n", empJ50.Legajo, empJ50.Cargo, empJ50.FechaHasta)
			continue
		}

		// Perform desired operations with the fetched and created records
		// fmt.Printf("Encontrado EmpleadoJ50: %+v\n", empJ50)
		// fmt.Printf("Creado EmpleadoRES: %+v\n", empRES)
	}
	// if err := rows.Err(); err != nil {
	// 	log.Fatal(err)
	// }

}

// ----------------------------------------------
// importarDesdeNR:
// importa Todos los registros desde tabla  de NR
// ----------------------------------------------
func importarDesdeNR(db *gorm.DB) {
	var FechaPresentacion, FechaAceptacion time.Time

	//--- Trae los registros que NO estan en J50 y solo estan en NR para agregarlos
	sql := `select en.legajo, en.cargo, en.apellido_nombre, en.empresa, en.fecha_desde, en.fecha_hasta, en.tipo_antiguedad, en.computa_para_antig, en.computa_para_vacac
	from migracion."empleadoJ50" ej right join migracion."empleadoNR" en on ej.legajo =en.legajo and ej.cargo= en.cargo and ej.fecha_desde =en.fecha_desde 
	where ej.legajo is null`
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	//--- RECORRE TABLA NEWROL ---
	for rows.Next() {
		var NR models.EmpleadoNR
		err := rows.Scan(&NR.Legajo, &NR.Cargo, &NR.ApellidoNombre, &NR.Empresa, &NR.FechaDesde, &NR.FechaHasta, &NR.TipoAntiguedad, &NR.ComputaParaAntig, &NR.ComputaParaVacac)
		if err != nil {
			log.Fatal(err)
		}

		//--- Evalua si el periodo Desde hasta abarca otros periodos segun lista de rangos de periodo.
		listaPer := GetPeriodosSuperpuestos(*NR.FechaDesde, *NR.FechaHasta, periodosGlobal)

		for _, periodo := range listaPer {

			FechaPresentacion = GetFechaAceptacion(periodo.FechaInicio, periodo.FechaFin)
			FechaAceptacion = periodo.FechaFin
			empRESx := models.EmpleadoRES{
				Legajo:            NR.Legajo,
				Cargo:             NR.Cargo,
				FechaDesde:        &periodo.FechaInicio,
				FechaHasta:        &periodo.FechaFin,
				Empresa:           NR.Empresa,
				ComputaParaAntig:  NR.ComputaParaAntig,
				ComputaParaVacac:  NR.ComputaParaVacac,
				FechaPresentacion: &FechaPresentacion,
				FechaAceptacion:   &FechaAceptacion,
				TipoAntiguedad:    NR.TipoAntiguedad,
			}
			if err := db.Create(&empRESx).Error; err != nil {
				log.Printf("Falló al crear registro EmpleadoRES para Legajo: %d, Cargo: %d , FechaDesde: %s \n", empRESx.Legajo, empRESx.Cargo, periodo.FechaInicio)
				continue
			}
		}
	}
}

func GetFechaAceptacion(fd, fh time.Time) time.Time {

	var fechaAceptacion time.Time
	fecha19951231 := time.Date(1995, time.December, 31, 0, 0, 0, 0, time.UTC)
	fecha20121231 := time.Date(2012, time.December, 31, 0, 0, 0, 0, time.UTC)

	if fd.Before(fecha19951231) && fh.Before(fecha19951231) {
		fechaAceptacion = fecha19951231
	} else if fd.Before(fecha20121231) && fh.Before(fecha20121231) {
		fechaAceptacion = fecha20121231
	} else {
		fechaAceptacion = fh
	}
	return fechaAceptacion
}

func GetPeriodosSuperpuestos(finicio, ffin time.Time, ages []Periodo) []Periodo {

	var superposedAges []Periodo

	for _, age := range ages {
		if finicio.Before(age.FechaFin) && ffin.After(age.FechaInicio) {
			superposedStartDate := finicio
			if age.FechaInicio.After(finicio) {
				superposedStartDate = age.FechaInicio
			}

			superposedEndDate := ffin
			if age.FechaFin.Before(ffin) {
				superposedEndDate = age.FechaFin
			}

			superposedAge := Periodo{
				FechaInicio: superposedStartDate,
				FechaFin:    superposedEndDate,
			}

			superposedAges = append(superposedAges, superposedAge)
		}
	}

	return superposedAges
}
