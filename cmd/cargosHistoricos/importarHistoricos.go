package main

import (
	"fmt"
	"log"

	"gorm.io/gorm"

	config "mdamigra/cmd/pkg/config"
	"time"

	models "github.com/gusjoagomez/mdaliquimodel/legajos"
)

type LegCategH struct {
	Legajo      int
	Cargo       int
	Fechacateg  time.Time
	Idcategoria int
}

func main() {

	config.Init("./config/config.conf")
	config.CreateConnections()
	db := config.DB("migracion")

	fmt.Println("INICIANDO EL PROCESO")
	fmt.Println("PROCESANDO...")

	//--- Trae los registros de la tabla que paso Sabrina
	sql := `SELECF distinct  l.legajo ,  l.cargo ,  l.fechaingcateg , g.id as idCategoria
			FROM  migracion.legcategh l 
		  		left join general g on g."auxEntero1" = l."codCateg"::int and g."grupoId"=1006
			ORDER BY legajo, cargo, idcategoria`
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	//--- RECORRE REGISTROS NEWROL ---
	for rows.Next() {
		var REC LegCategH
		err := rows.Scan(&REC.Legajo, &REC.Cargo, &REC.Fechacateg, &REC.Idcategoria)
		if err != nil {
			log.Fatal(err)
		}

		existe := existeCargo(db, REC.Legajo, REC.Cargo)
		if existe == false {
			insertarRegistroCargo(db, REC)
		}
	}

	fmt.Println("FIN DEL PROCESO")
}

// ----------------------------------------------
// Obtiene Nro.Empleado de empleados
// ----------------------------------------------
func traerIdEmpleado(db *gorm.DB, legajo int) int {

	var IdEmpleado int
	var Empleado models.Empleado
	if err := db.Where("legajo = ?", legajo).First(&empNR).Error; err != nil {
		IdEmpleado = -1
	} else {
		IdEmpleado = Empleado.Id
	}
	return IdEmpleado
}

// ----------------------------------------------
// Existe cargo en talba cargos
// ----------------------------------------------
func existeCargo(db *gorm.DB, legajo, cargo int) bool {

	var idEncontrado int

	sql := fmt.Sprintf("SELECT id FROM \"public\".\"cargo\" WHERE legajo = %d AND \"nroCargo\" = '%d'", legajo, cargo)
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&idEncontrado)
		if err != nil {
			log.Fatal(err)
		}
	}

	return (idEncontrado > 0)
}

// ----------------------------------------------
// importarRegistro de cargo
// persiste registro en tabla cargo
// ----------------------------------------------
func insertarRegistroCargo(db *gorm.DB, REC LegCategH) {
	var ret bool

	IdEmpleado := traerIdEmpleado(db, REC.Legajo)
	funcionPersonal := traerFuncionPersonal(db, REC.Legajo, REC.Fechacateg)

	fmt.Println("INSERTANDO (legajo,cargo,fechaCat,IdCategoria): ", REC.Legajo, REC.Cargo, REC.Fechacateg, REC.Idcategoria)

	ahora := time.Now()
	unCargo := models.Cargo{
		//Id:
		//ModificadoEn
		//EliminadoEn
		Activado:   true,
		CreadoEn:   ahora,
		ActivadoEn: ahora,
		Legajo:     REC.Legajo,
		NroCargo:   REC.Cargo,
		//NroNormaDeIngreso:
		FechaDeNormaDeIngreso: REC.Fechacateg,
		FechaIngresoAlCargo:   REC.Fechacateg,
		//FechaIngresoAntiguedad
		//FechaIngresoVacaciones
		//FechaDeEgreso
		//NroNormaDeDesvinculacion
		//FechaNormaDeDesvinculacion
		MarcaParaLiquidar:      'X',
		IdEmpleado:             IdEmpleado,
		IdPuesto:               4155,
		IdPlantaDePersonal:     3798, //sin informar
		IdGrupoDePersonal:      3801, //sin informar
		IdFuncionDePersonal:    funcionPersonal,
		IdGrupoDeLiquidacion:   3802, //sin informar
		IdSituacionDelEmpleado: 3806, //sin informar
		//IdDependencia:
		//IdNormaDeIngreso:
		IdMotivoDeIngreso: 3789, //sin informar
		//IdMotivoDeBaja:
		//IdNormaDeDesvinculacion:
		FechaVersionDesde: REC.Fechacateg,
		//FechaVersionHasta:
		IdCategoria: REC.Idcategoria,
		//IdDependenciaPresupuestaria:
		//FechaBaja:
		Observaciones: 'X',
		CreadoPorId:   -1,
		//ModificadoPorId
		//EliminadoPorId
		ActivadoPorId: -1,
	}

	if err := db.Create(&unCargo).Error; err != nil {
		log.Fatalf("Error al insertar cargo: %v", err)
		ret = false
	} else {
		ret = true
	}
	return ret
}

// ----------------------------------------------
// Obtiene Nro.Empleado de empleados
// ----------------------------------------------
func traerFuncionPersonal(db *gorm.DB, legajo int, fecha Date) Date {
	var funper int
	var Cargo models.Cargo
	err := db.Where("legajo = ? AND fechaIngresoAlCargo > ?", legajom, fecha).First(&Cargo).Error
	if err != nil {
		funper = -1
	} else {
		funper = Cargo.IdFuncionDePersonal
	}
	return funper
}
