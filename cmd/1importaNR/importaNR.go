package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"math"
	"os"
	"strconv"
	"strings"
	"time"

	models "github.com/gusjoagomez/mdaliquimodel/migracion"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func main() {
	// fmt.Println("Nada por hacer - Ya se migraron los datos")
	// os.Exit(1)

	var fechaDesde, fechaHasta *time.Time

	// Ruta del archivo CSV a importar
	filePath := "/home/userdesa/go/src/mdamigra/antecedentesJ50/antecedentes_NR.csv"

	// Configurar la conexión a la base de datos PostgreSQL
	dsn := "host=localhost user=postgres password=password dbname=rrhh port=5432 sslmode=disable TimeZone=UTC"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect to the database")
	}

	// Auto-migrar el modelo Empleado a la base de datos (crear la tabla si no existe)
	db.AutoMigrate(&models.EmpleadoNR{})

	// Borra todos los registros de tabla resultado
	db.Where("1 = 1").Delete(&models.EmpleadoNR{})

	// Abrir el archivo CSV
	file, err := os.Open(filePath)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Crear un lector CSV para el archivo
	reader := csv.NewReader(file)
	reader.Comma = ';'

	// Leer la primera línea del archivo que contiene los nombres de los campos
	fieldNames, err := reader.Read()
	if err != nil {
		log.Fatal(err)
	}

	// Mapear los nombres de los campos a sus respectivos índices en el registro
	fieldIndexes := make(map[string]int)
	for i, fieldName := range fieldNames {
		fieldIndexes[fieldName] = i
	}

	// Leer los registros del archivo CSV
	//var empleado []Empleado
	cant := 0
	for {
		cant++

		record, err := reader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal(err)
		}
		if cant == 1 {
			continue
		}

		// Obtener los valores del registro utilizando los índices de los campos
		legajo, err := strconv.Atoi(record[fieldIndexes["legajo"]])
		if err != nil {
			log.Fatal(err)
		}
		cargo, err := strconv.Atoi(record[fieldIndexes["cargo"]])
		if err != nil {
			log.Fatal(err)
		}

		ape := record[fieldIndexes["apellidoNombre"]]
		apellidoNombre := toUTF8([]byte(ape))

		emp := record[fieldIndexes["empresa"]]
		empresa := toUTF8([]byte(emp))

		layoutfd := layoutDate(strings.TrimSpace(record[fieldIndexes["fechaDesde"]]))

		fmt.Println("layoutFD: ", layoutfd, record[fieldIndexes["fechaDesde"]])

		auxtime, err := time.Parse(layoutfd, record[fieldIndexes["fechaDesde"]])
		if err != nil {
			fechaDesde = nil
		} else {
			fechaDesde = &auxtime
		}

		layoutfh := layoutDate(strings.TrimSpace(record[fieldIndexes["fechaHasta"]]))
		fmt.Println("layoutFH: ", layoutfd, record[fieldIndexes["fechaHasta"]])

		auxtime2, err := time.Parse(layoutfh, record[fieldIndexes["fechaHasta"]])
		if err != nil {
			fechaHasta = nil
		} else {
			fechaHasta = &auxtime2
		}

		tipoAntiguedad := record[fieldIndexes["tipoAntiguedad"]]
		computaParaAntig := record[fieldIndexes["computaParaAntig"]]
		computaParaVacac := record[fieldIndexes["computaParaVacac"]]

		// Crear una instancia de Empleado con los valores obtenidos
		empleado := models.EmpleadoNR{
			Legajo:           legajo,
			Cargo:            cargo,
			ApellidoNombre:   apellidoNombre,
			Empresa:          empresa,
			FechaDesde:       fechaDesde,
			FechaHasta:       fechaHasta,
			TipoAntiguedad:   tipoAntiguedad,
			ComputaParaAntig: computaParaAntig,
			ComputaParaVacac: computaParaVacac,
		}
		result := db.Create(&empleado)
		if result.Error != nil {
			fmt.Println("**** ERROR AL IMPORTAR DATO ****")
			panic(result.Error)
		}

		if math.Mod(float64(cant), 1000) == 0 {
			fmt.Println("Procesados: ", cant)
		}

	}

	// Insertar los registros en la base de datos
	//db.Create(&empleados)

	fmt.Println("Importación completada.")
}

// transforma a UTF8
func toUTF8(iso8859_1_buf []byte) string {
	buf := make([]rune, len(iso8859_1_buf))
	for i, b := range iso8859_1_buf {
		buf[i] = rune(b)
	}
	return string(buf)
}

// construye el formato para aplicar conversion de fechas
func layoutDate(datestr string) string {
	var lday, lmonth string
	parts := strings.Split(datestr, "/")
	day := parts[0]
	if len(day) == 2 {
		lday = "02"
	} else {
		lday = "2"
	}

	month := parts[1]
	if len(month) == 2 {
		lmonth = "01"
	} else {
		lmonth = "1"
	}

	return lday + "/" + lmonth + "/" + "2006"
}
