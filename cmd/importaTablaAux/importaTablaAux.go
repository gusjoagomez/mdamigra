package main

import (
	"fmt"
	"log"
	"mdamigra/cmd/pkg/config"
	"os"
	"strings"

	decimal "github.com/shopspring/decimal"

	"gorm.io/gorm"

	"time"

	modelsrrhh "github.com/gusjoagomez/mdaliquimodel/rrhh"
)

const (
	GRUPO_ID_IMPORTAR = 1013
)

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

	ahora := time.Now()

	config.Init("./config/config.conf")
	config.CreateConnections()

	dblegajos := config.DB("legajos") //LEGAJOS
	db := config.DB("migracion")      //RRHH

	elementoImportar := traerItemTablaAuxiliar(GRUPO_ID_IMPORTAR, dblegajos)

	existe := chequeaExistencia(elementoImportar.Nombre, db)
	if existe == true {
		fmt.Println("Aparentemente YA existe ese concepto en tablaAuxiliar: ", elementoImportar.Nombre)
		os.Exit(0)
	}
	listaItems := traerListaAImportar(GRUPO_ID_IMPORTAR, dblegajos)

	///----
	RecTablaAuxiliar := modelsrrhh.TablaAuxiliar{
		Activado:        true,
		CreadoEn:        ahora,
		ModificadoEn:    ahora,
		EliminadoEn:     ahora,
		ActivadoEn:      ahora,
		CodigoString:    "",
		CodigoInt:       "",
		Descripcion:     elementoImportar.Nombre,
		Numerico1:       "",
		Numerico2:       "",
		Numerico3:       "",
		Numerico4:       "",
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
	}

	for _, record := range listaItems {

		fmt.Println("* Importando dato: ")
		fmt.Println(record)

		TAD := modelsrrhh.TablaAuxiliarDetalle{
			Activado:        true,
			CreadoEn:        ahora,
			ModificadoEn:    ahora,
			EliminadoEn:     ahora,
			ActivadoEn:      ahora,
			TablaAuxiliarId: uint(RecTablaAuxiliar.Id),
			FechaDesde:      ahora,
			FechaHasta:      ahora,
			CodigoString:    "",
			CodigoInt:       record.Auxentero1,
			Descripcion:     record.Nombre,
			Numerico1:       decimal.NewFromFloat(0.0),
			Numerico2:       decimal.NewFromFloat(0.0),
			Numerico3:       decimal.NewFromFloat(0.0),
			Numerico4:       decimal.NewFromFloat(0.0),
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
		fmt.Println("* Importando detalle: ", record.Nombre)
		if err := db.Create(&TAD).Error; err != nil {
			log.Fatalf("Error al insertar registro en TablaAuxiliarDetalle: %v", err)
		}
	} ///END FOR records

	log.Println("Migration exitosa!")
}

func traerItemTablaAuxiliar(id int, db *gorm.DB) ItemAux {
	var ret ItemAux
	var codid int
	var nombre string

	sql := fmt.Sprintf("select id, nombre from \"public\".grupo g  where id = %d", id)
	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	rows.Next()
	err = rows.Scan(&codid, &nombre)
	if err != nil {
		log.Fatal(err)
	}

	ret = ItemAux{Id: codid, Nombre: nombre}
	return ret
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

func chequeaExistencia(nombre string, db *gorm.DB) bool {

	var descripcion string

	nombre = strings.TrimSpace(nombre)
	sql := fmt.Sprintf("SELECT descripcion FROM \"public\".\"tablaAuxiliar\" WHERE \"descripcion\" = '%s'", nombre)

	rows, err := db.Raw(sql).Rows()
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&descripcion)
		if err != nil {
			log.Fatal(err)
		}
	}
	descripcion = strings.TrimSpace(descripcion)

	return (descripcion == nombre)
}
