package main

/*
IMPORTANTE: Antes de ejecutr este programa deberá truncar las tablas liquis y liqui_cons
*/

import (
	"fmt"
	"log"
	"mdamigra/cmd/pkg/config"

	decimal "github.com/shopspring/decimal"

	"gorm.io/gorm"

	"strconv"
	"time"

	models "github.com/gusjoagomez/mdaliquimodel/migracion"
)

// 100012 = Tipo liquidacion
//          78: MN-Normal y habitual
//          79: SA1-Aguinaldo primer semestre
//          80: SA1-Aguinaldo segundo semestre
//
// 100017 = Tipo empresa
// 	        135: D-Docentes
// 	        136: H-Horas catedra
// 	        137: P-Prejubilados
// 	        138: B-Becarios
// 	        139: L-Limpieza (camioneros)
// 	        140: A-Resto de empleados (planta, mensualiz, médicos)
//

const (
	TIPO_NN  = 78
	TIPO_SA1 = 79
	TIPO_SA2 = 80

	ESTADO_HIST = 1
	ESTADO_PROC = 2
	ESTADO_TERM = 3

	TIPO_EMP_D = 135
	TIPO_EMP_H = 136
	TIPO_EMP_P = 137
	TIPO_EMP_B = 138
	TIPO_EMP_L = 139
	TIPO_EMP_A = 140

	ESTADO_CERRADO = 149

	ID_TIPO_PLANTA    = 100019
	ID_GRUPO_PERSONAL = 100020
)

type LQ struct {
	TipoReg          int
	Mes              int
	Anio             int
	CodigoTipoPlanta int
}

type LQID struct {
	ID         int
	TipoReg    int
	Mes        int
	Anio       int
	CodTPlanta int
	TipoLiq    int
}

type concepto struct {
	id            int
	tipo_concepto int
	tipo_con_gan  int
}

func main() {

	var descrip, aniomesLiq, aniomesDev, aniomesPag, aniomesGan string
	var listaLiquis []LQID
	var Unidades decimal.Decimal
	var legajoId int
	var existeLegajo bool

	ahora := time.Now()

	config.Init("./config/config.conf")
	config.CreateConnections()

	dblegajos := config.DB("legajos")
	db := config.DB("migracion")

	codigoConceptos := getCodigosConcepto(db)

	listaLegajos := traerListaLegajos(dblegajos)

	listaPlanta := getListaIDs(ID_TIPO_PLANTA, db)
	//listaGrupoPlanta := getListaIDs(ID_GRUPO_PERSONAL, db)

	// Auto-migrate the GORM models to create the tables if they don't exist.
	if err := db.AutoMigrate(&models.Liquis{}, &models.LiquiCons{}, &models.DetallesHab{}); err != nil {
		log.Fatalf("failed to auto-migrate the models: %v", err)
	}

	// Paso 1: Select distinct de DetallesHab e inserta en tabla "liquis".
	var uniqueRecords []LQ

	if err := db.Model(&models.DetallesHab{}).Select("DISTINCT tipo_reg, mes, anio, codigo_tipo_planta").Order("tipo_reg, anio ,mes ").Scan(&uniqueRecords).Error; err != nil {
		log.Fatalf("Error al seleccionar valores de DetallesHab: %v", err)
	}

	for _, record := range uniqueRecords {
		//construye descipcion de la cabecera de liquidacioon
		aniostr := strconv.Itoa(int(record.Anio))
		messtr := strconv.Itoa(int(record.Mes))
		descrip = aniostr + "-" + messtr + " - Planta: " + strconv.Itoa(int(record.CodigoTipoPlanta))
		//tipoliq := record.TipoLiq

		// Trae el ID.Planta 
		IdPlaPer := listaPlanta[int(record.CodigoTipoPlanta)]
		//IdGrPlaPer := listaGrupoPlanta[int(record.CodigoGrupoPersonal)]

		//--- Si es SAC agrega detalle de SAC
		if record.TipoReg == 2 {
			descrip = "- SAC -" + descrip
		}

		//-- Construye descipcion
		primerDia := time.Date(int(record.Anio), time.Month(record.Mes), 1, 0, 0, 0, 0, time.UTC)
		ultimoDiaMes := getLastDayOfMonth(int(record.Anio), int(record.Mes))
		fechaLiquidacion := ultimoDiaMes.Add(-time.Hour * 724)
		tipoLiquidacion := traerTipoLiquidacion(record.TipoReg)
		//tipoEmpresa := traerTipoEmpresa(record.TipoEmp)
		fechaLiquidacionStr := fechaLiquidacion.Format("2006-01-02")

		aniomesLiq = fmt.Sprintf("%04d%02d", record.Anio, record.Mes)
		aniomesDev = fmt.Sprintf("%04d%02d", record.Anio, record.Mes)
		aniomesGan = fmt.Sprintf("%04d%02d", record.Anio, record.Mes)

		liqui := models.Liquis{
			Created_at:       ahora,
			Updated_at:       &ahora,
			Id_agr:           uint(1), //harcodeado 1
			Id_plaper:        uint(IdPlaPer),
			Aniomes_liq:      aniomesLiq,
			Aniomes_dev:      aniomesDev,
			Aniomes_gan:      aniomesGan,
			Tipo_liq:         uint(tipoLiquidacion),
			Stipo_liq:        uint(1), //harcodeado 1
			Fecha_pago:       ultimoDiaMes,
			Descripcion:      "Liquidacion: " + descrip,
			Anulacion:        "No",
			Fecha_liq:        fechaLiquidacionStr,
			Id_estado:        ESTADO_CERRADO,
			Nro_legajo_desde: 0,     //harcodeado 0
			Nro_legajo_hasta: 99999, //harcodeado 99999
			Fec_ini_proc:     primerDia,
			Fec_fin_proc:     &ultimoDiaMes,
		}

		if err := db.Create(&liqui).Error; err != nil {
			log.Fatalf("Error al insertar registro en liquis: %v", err)
		}
		unaliq := LQID{
			ID:         int(liqui.ID),
			TipoReg:    record.TipoReg,
			Mes:        record.Mes,
			Anio:       record.Anio,
			CodTPlanta: record.CodigoTipoPlanta,
			TipoLiq:    tipoLiquidacion,
		}
		listaLiquis = append(listaLiquis, unaliq)

	} ///END FOR records

	//
	//
	//
	//
	//-------------------------------------------------------------------
	// Paso 2: Ciclo en DetallesHab e Inserta en tabla "liqui_cons".
	//-------------------------------------------------------------------

	for _, lq := range listaLiquis {

		var detallesHabRecords []models.DetallesHab

		if err := db.Where("tipo_reg=? AND anio=? AND mes=? and codigo_tipo_planta=?", lq.TipoReg, lq.Anio, lq.Mes, lq.CodTPlanta).Find(&detallesHabRecords).Error; err != nil {
			log.Fatalf("Error al recuperar registros de DetallesHab: %v", err)
		}

		for _, detalleHab := range detallesHabRecords {

			cconce := detalleHab.CodigoConcepto
			CONCE := codigoConceptos[cconce]

			//Determina si es cero  las unidades
			isZero := detalleHab.Unidades.Equal(decimal.NewFromFloat(0.0))
			if isZero {
				Unidades = decimal.NewFromInt(1)
			} else {
				Unidades = detalleHab.Unidades
			}

			if detalleHab.AnomesRetroactivo == 0 {
				aniomesDev = fmt.Sprintf("%04d%02d", lq.Anio, lq.Mes)
			} else {
				aniomesDev = transformarDevengado(detalleHab.AnomesRetroactivo)
			}

			//trae el legajo_ID
			legajoId, existeLegajo = listaLegajos[detalleHab.Legajo]
			if existeLegajo == false {
				legajoId = 0
			}

			ImportUnitario := detalleHab.Importe.Div(Unidades)

			aniomesPag = fmt.Sprintf("%04d%02d", detalleHab.Anio, detalleHab.Mes)

			liquiCons := models.LiquiCons{
				Created_at:    ahora,
				Updated_at:    &ahora,
				Liqui_id:      uint(lq.ID),
				Legajo_id:     uint(legajoId),
				Nro_legajo:    uint(detalleHab.Legajo),
				Nro_cargo:     uint(detalleHab.Cargo),
				Aniomes_pag:   aniomesPag,
				Aniomes_dev:   aniomesDev,
				Fecha_desde:   ahora,
				Concepto_id:   uint(CONCE.id),
				Cantidad:      Unidades,
				Imp_unit:      ImportUnitario,
				Imp_item:      detalleHab.Importe,
				Tipo_concepto: uint(CONCE.tipo_concepto),
				Tipo_con_gan:  uint(CONCE.tipo_con_gan),
				Tipo_liq:      uint(lq.TipoLiq),
			}

			if err := db.Create(&liquiCons).Error; err != nil {
				log.Fatalf("Error al insertar recistros en liqui_cons: %v", err)
			}
		} //END for DetalleHab
	} //END for DetalleHab

	log.Println("Migration exitosa!")
}

func getLastDayOfMonth(year int, month int) time.Time {
	// Obtiene el primer dia del siguiente mes
	firstDayOfNextMonth := time.Date(year, time.Month(month+1), 1, 0, 0, 0, 0, time.UTC)

	// Resta 1 dia al primer dia del siguiente mes para obtener el ultimo dia del mes solicitado
	lastDayOfMonth := firstDayOfNextMonth.Add(-time.Hour * 24)

	// Retorna el ultimo dia del mes
	//return lastDayOfMonth.Day()
	return lastDayOfMonth
}

func traerTipoLiquidacion(tiporeg int) int {
	var ret int
	if tiporeg == 1 {
		ret = TIPO_NN
	} else if tiporeg == 2 {
		ret = TIPO_SA1
	} else if tiporeg == 3 {
		ret = TIPO_SA2
	}

	return ret
}

func traerTipoEmpresa(tipoemp string) int {
	ret := TIPO_EMP_A
	if tipoemp == "D" {
		ret = TIPO_EMP_D
	} else if tipoemp == "H" {
		ret = TIPO_EMP_H
	} else if tipoemp == "P" {
		ret = TIPO_EMP_P
	} else if tipoemp == "B" {
		ret = TIPO_EMP_B
	} else if tipoemp == "L" {
		ret = TIPO_EMP_L
	}
	return ret
}

func getCodigosConcepto(db *gorm.DB) map[int]concepto {
	var ret map[int]concepto
	var codcon, idcon, idtcon, idgan int
	sql := `select DISTINCT cod_concepto, id, id_tipo_concepto , id_ganancias  FROM "public".concepto  WHERE "eliminadoEn" IS NULL`
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	ret = make(map[int]concepto)
	for rows.Next() {
		err := rows.Scan(&codcon, &idcon, &idtcon, &idgan)
		if err != nil {
			log.Fatal(err)
		}

		ret[codcon] = concepto{id: idcon, tipo_concepto: idtcon, tipo_con_gan: idgan}

	}
	return ret
}

func getListaIDs(tipo int, db *gorm.DB) map[int]int {

	var ret map[int]int
	var codint, iddet int

	sql := `select "codigoInt" , id FROM "public"."tablaAuxiliarDetalle" tad WHERE tad."tablaAuxiliarId" = ` + strconv.Itoa(tipo)
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	ret = make(map[int]int)
	for rows.Next() {
		err := rows.Scan(&codint, &iddet)
		if err != nil {
			log.Fatal(err)
		}
		ret[codint] = iddet
	}
	return ret
}

func traerListaLegajos(db *gorm.DB) map[int]int {
	var ret map[int]int
	var legajo, idlegajo int

	sql := `select legajo , id FROM "public"."empleado" e WHERE 1=1`
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	ret = make(map[int]int)
	for rows.Next() {
		err := rows.Scan(&legajo, &idlegajo)
		if err != nil {
			log.Fatal(err)
		}
		ret[legajo] = idlegajo
	}

	return ret
}

func transformarDevengado(input int) string {
	var year, month int
	var yearmonth string

	if input < 100 || input > 9999 {
		return ""
	}

	year = 2000 + input%100 // Extrae ultimos 2 digitos de año
	month = (input / 100)   // Extrae primeros digitos del mes

	if month < 1 || month > 12 {
		return ""
	}

	yearmonth = fmt.Sprintf("%04d%02d", year, month)

	return yearmonth

}

/*
func transformarDevengado(input int) (year int, month int, yearmonth string) {
	if input < 100 || input > 9999 {
		return -1, -1, ""
	}

	year = 2000 + input%100 // Extrae ultimos 2 digitos de año
	month = (input / 100)   // Extrae primeros digitos del mes

	if month < 1 || month > 12 {
		return -1, -1, ""
	}

	yearmonth = fmt.Sprintf("%04d%02d", year, month)

	return year, month, yearmonth

}
*/
