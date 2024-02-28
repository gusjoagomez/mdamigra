package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"
	"strconv"
	"strings"
	"time"

	models "github.com/gusjoagomez/mdaliquimodel/migracion"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func main() {

	//	fmt.Println("Nada por hacer - Ya se migraron los datos")
	//	os.Exit(1)

	var fechaPresentacion *time.Time
	var fechaAceptacion *time.Time

	// Configurar la conexión a la base de datos PostgreSQL
	dsn := "host=localhost user=postgres password=password dbname=rrhh port=5432 sslmode=disable TimeZone=UTC"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect to the database")
	}

	// Auto-migrar el modelo Empleado a la base de datos (crear la tabla si no existe)
	db.AutoMigrate(&models.EmpleadoJ50{})

	// Ruta del archivo CSV a importar
	filePath := "/home/userdesa/go/src/mdamigra/antecedentesJ50/antecedentes_j50.csv"

	log.Println("***# leyendo archivo")
	// Abrir el archivo CSV
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Crear un lector CSV para el archivo
	reader := csv.NewReader(file)
	reader.Comma = ';'
	reader.LazyQuotes = true

	fmt.Println("Importando... <Esto puede demorar varios minutos>")
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

		// Convertir los valores del registro al modelo Empleado
		legajo, err := strconv.Atoi(record[0])
		if err != nil {
			log.Fatal(err)
		}
		cargo, err := strconv.Atoi(record[1])
		if err != nil {
			log.Fatal(err)
		}

		// convierte fecha desde a YYYYMMDD
		fechaDesde, err := time.Parse("20060102", record[2])
		if err != nil {
			log.Fatal(err)
		}
		// convierte fecha hasta a YYYYMMDD
		fechaHasta, err := time.Parse("20060102", record[3])
		if err != nil {
			log.Fatal(err)
		}

		empresa := toUTF8([]byte(record[4]))
		fmt.Println("EMPRESA: ", empresa)

		computaParaAntig := record[5]
		computaParaVacac := record[6]

		// convierte fecha presentacion a YYYYMMDD
		auxtime, err := time.Parse("20060102", strings.TrimSpace(record[7]))
		if err != nil {
			fechaPresentacion = nil
		} else {
			fechaPresentacion = &auxtime
		}

		// convierte fecha aceptacion a YYYYMMDD
		auxtime2, err := time.Parse("20060102", strings.TrimSpace(record[8]))
		if err != nil {
			fechaAceptacion = nil
		} else {
			fechaAceptacion = &auxtime2
		}

		empleado := models.EmpleadoJ50{
			Legajo:            legajo,
			Cargo:             cargo,
			FechaDesde:        &fechaDesde,
			FechaHasta:        &fechaHasta,
			Empresa:           empresa,
			ComputaParaAntig:  computaParaAntig,
			ComputaParaVacac:  computaParaVacac,
			FechaPresentacion: fechaPresentacion,
			FechaAceptacion:   fechaAceptacion,
		}
		//empleados = append(empleados, empleado)

		result := db.Create(&empleado)
		if result.Error != nil {
			fmt.Println("**** ERROR AL IMPORTAR DATO ****")
			panic(result.Error)
		}

		//fmt.Println("linea:", line, empleado)
	}

	// Insertar los registros en la base de datos

	fmt.Println("Importación completada.")
}

func toUTF8(iso8859_1_buf []byte) string {
	buf := make([]rune, len(iso8859_1_buf))
	for i, b := range iso8859_1_buf {
		buf[i] = rune(b)
	}
	return string(buf)
}
