package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"mdamigra/cmd/pkg/config"
	"os"
	"strconv"
	"strings"

	decimal "github.com/shopspring/decimal"

	"gorm.io/gorm"

	"time"

	modelsrrhh "github.com/gusjoagomez/mdaliquimodel/rrhh"
)

const (
	ID_IMPORTAR          = 100023
	DESCRIPCION_IMPORTAR = "Grupo planta personal"
	NUMERICO1            = "Cod.Planta personal"
	NUMERICO2            = "Cod.Grupo personal"
	NUMERICO3            = "Cod. Grupo uni."
	NUMERICO4            = "Cantidad"

	FILEPATH = "./grupos_plaper.csv"
)

type ItemPlaPer struct {
	Centidad       int
	Cplaper        int
	Cgruper        int
	Cgruuni        int
	Cantidad       int
	Planta_per     string
	Grupo_per      string
	Grupo_concepto string
}

type ItemAux struct {
	Id     int
	Nombre string
}

type ItemAuxDet struct {
	Id         int
	Nombre     string
	Auxentero1 int
}

func main() {

	config.Init("./config/config.conf")
	config.CreateConnections()

	db := config.DB("migracion") //RRHH

	existe := chequeaExistencia(db, ID_IMPORTAR)
	if existe == false {
		fmt.Println("Insertando en tablaAuxiliar ")
		existe = insertarEnTablaAuxiliar(db)
	}

	if existe {
		insertarTablaAuxiliarDetalle(db)
	} else {
		fmt.Println("No se puede insertar detalle. No existe en tablaAuxiliar")
		os.Exit(1)
	}

	log.Println("Migration exitosa!")
}

func chequeaExistencia(db *gorm.DB, id int) bool {

	var idEncontrado int

	sql := fmt.Sprintf("SELECT id FROM \"public\".\"tablaAuxiliar\" WHERE \"id\" = '%d'", id)

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

func traerListaAImportar(id int, db *gorm.DB) map[int]ItemAuxDet {
	var ret map[int]ItemAuxDet
	var codid, auxentero1 int
	var nombre string

	sql := fmt.Sprintf("SELECT id, nombre, \"auxEntero1\" FROM \"public\".general g  WHERE \"grupoId\" = %d", id)
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	ret = make(map[int]ItemAuxDet)
	for rows.Next() {
		err := rows.Scan(&codid, &nombre, &auxentero1)
		if err != nil {
			log.Fatal(err)
		}
		ret[codid] = ItemAuxDet{Id: codid, Nombre: nombre, Auxentero1: auxentero1}
	}
	return ret
}

func traerItemPlaPer(filePath string) []ItemPlaPer {

	var ret []ItemPlaPer

	log.Println("***# Leyendo archivo")
	// Abrir el archivo CSV
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Crear un lector CSV para el archivo
	reader := csv.NewReader(file)
	reader.Comma = ','
	reader.LazyQuotes = true

	// Leer los registros del archivo CSV
	line := 0
	//var empleado []Empleado
	for {
		line++
		record, err := reader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal("ERROR: ", err)
		}

		if line == 1 {
			continue
		}
		Centidad, _ := strconv.Atoi(record[0])
		Cplaper, _ := strconv.Atoi(record[1])
		Cgruper, _ := strconv.Atoi(record[2])
		Cgruuni, _ := strconv.Atoi(record[3])
		Cantidad, _ := strconv.Atoi(record[4])

		newItem := ItemPlaPer{
			Centidad:       Centidad,
			Cplaper:        Cplaper,
			Cgruper:        Cgruper,
			Cgruuni:        Cgruuni,
			Cantidad:       Cantidad,
			Planta_per:     toUTF8([]byte(record[5])),
			Grupo_per:      toUTF8([]byte(record[6])),
			Grupo_concepto: toUTF8([]byte(record[7])),
		}

		ret = append(ret, newItem)
	}
	return ret

}

func insertarEnTablaAuxiliar(db *gorm.DB) bool {
	var ret bool
	//----
	ahora := time.Now()
	RecTablaAuxiliar := modelsrrhh.TablaAuxiliar{
		Id:              ID_IMPORTAR,
		Activado:        true,
		CreadoEn:        ahora,
		ModificadoEn:    ahora,
		EliminadoEn:     ahora,
		ActivadoEn:      ahora,
		CodigoString:    "",
		CodigoInt:       "",
		Descripcion:     DESCRIPCION_IMPORTAR,
		Numerico1:       NUMERICO1,
		Numerico2:       NUMERICO2,
		Numerico3:       NUMERICO3,
		Numerico4:       NUMERICO4,
		Numerico5:       "",
		Numerico6:       "",
		Numerico7:       "",
		Numerico8:       "",
		Numerico9:       "",
		Numerico10:      "",
		Caracter1:       "",
		Caracter2:       "",
		Caracter3:       "",
		Descripcion1:    "",
		Descripcion2:    "",
		Descripcion3:    "",
		CreadoPorId:     -1,
		ModificadoPorId: -1,
		EliminadoPorId:  -1,
		ActivadoPorId:   -1,
	}
	if err := db.Create(&RecTablaAuxiliar).Error; err != nil {
		log.Fatalf("Error al insertar registro en tablaAuxiliar: %v", err)
		ret = false
	} else {
		ret = true
	}
	return ret
}

func insertarTablaAuxiliarDetalle(db *gorm.DB) bool {

	var ret bool
	ahora := time.Now()
	listaItems := traerItemPlaPer(FILEPATH)

	for _, record := range listaItems {

		fmt.Println("* Importando dato: ")
		fmt.Println(record)

		DescripcionSTR := strings.TrimSpace(record.Planta_per[:16]) + "-" + strings.TrimSpace(record.Grupo_per[:16]) + "-" + strings.TrimSpace(record.Grupo_concepto[:16])

		TAD := modelsrrhh.TablaAuxiliarDetalle{
			Activado:        true,
			CreadoEn:        ahora,
			ModificadoEn:    ahora,
			EliminadoEn:     ahora,
			ActivadoEn:      ahora,
			TablaAuxiliarId: ID_IMPORTAR,
			FechaDesde:      ahora,
			FechaHasta:      ahora,
			CodigoString:    "",
			CodigoInt:       record.Centidad,
			Descripcion:     DescripcionSTR,
			Numerico1:       decimal.NewFromInt(int64(record.Cplaper)),
			Numerico2:       decimal.NewFromInt(int64(record.Cgruper)),
			Numerico3:       decimal.NewFromInt(int64(record.Cgruuni)),
			Numerico4:       decimal.NewFromInt(int64(record.Cantidad)),
			Numerico5:       decimal.NewFromFloat(0.0),
			Numerico6:       decimal.NewFromFloat(0.0),
			Numerico7:       decimal.NewFromFloat(0.0),
			Numerico8:       decimal.NewFromFloat(0.0),
			Numerico9:       decimal.NewFromFloat(0.0),
			Numerico10:      decimal.NewFromFloat(0.0),
			Caracter1:       "",
			Caracter2:       "",
			Caracter3:       "",
			Descripcion1:    "",
			Descripcion2:    "",
			Descripcion3:    "",
			CreadoPorId:     -1,
			ModificadoPorId: -1,
			EliminadoPorId:  -1,
			ActivadoPorId:   -1,
		}
		fmt.Println("* Importando detalle: ", record.Planta_per)
		if err := db.Create(&TAD).Error; err != nil {
			log.Fatalf("Error al insertar registro en TablaAuxiliarDetalle: %v", err)
			ret = false
		} else {
			ret = true
		}
	} ///END FOR records
	return ret
}

func toUTF8(iso8859_1_buf []byte) string {
	buf := make([]rune, len(iso8859_1_buf))
	for i, b := range iso8859_1_buf {
		buf[i] = rune(b)
	}
	return string(buf)
}
