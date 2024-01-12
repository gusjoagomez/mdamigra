package main

import (
	"bufio"
	"encoding/csv"
	"fmt"
	"log"
	config "mdamigra/cmd/pkg/config"
	"os"
	"path"
	"strconv"
	"strings"

	models "github.com/gusjoagomez/mdaliquimodel/migracion"
	"github.com/shopspring/decimal"

	"gorm.io/gorm"
)

func main() {

	var fileName string
	config.Init("./config/config.conf")
	config.CreateConnections()
	db := config.DB("migracion")

	// Auto-migrar el modelo Empleado a la base de datos (crear la tabla si no existe)
	db.AutoMigrate(&models.DetallesHab{})

	if checkExistFile() {
		fileName = os.Args[1]
	} else {
		os.Exit(1)
	}

	// Abriendo el CSV
	file, err := os.Open(fileName)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	log.Printf("Leyendo el archivo: %s\n", fileName)

	// Crea un reader CSV
	reader := bufio.NewReader(file)
	csvReader := csv.NewReader(reader)
	csvReader.Comma = ';'

	fmt.Println("* Importando datos...")
	// Lee y procesa el archivo CSV linea por linea
	lineNum := 0
	for {
		record, err := csvReader.Read()
		if err != nil {
			// Revisa errores
			if err.Error() == "EOF" {
				break // End of file
			} else {
				log.Fatal(err)
			}
		}
		lineNum++

		// Descarta procesar primera linea
		if lineNum == 1 {
			chequeaColumnas(record)
			continue
		}

		// Importa registro en base de datos
		if err := importRecord(fileName, record, db); err != nil {
			log.Printf("Error al importar registro en la linea %d: %v\n", lineNum, err)
		}
	}

	fmt.Println("El CSV importado con éxito")
}

func importRecord(filename string, record []string, db *gorm.DB) error {

	// fmt.Println("----Registro----")
	// fmt.Println(record)
	// fmt.Println("----------------")

	tipoRegistro, tipoEmp, mes, anio := tipoLiqFile(filename)

	legajocargo := record[0]
	legajostr := legajocargo[:len(legajocargo)-1]
	cargostr := string(legajocargo[len(legajocargo)-1])

	legajo, _ := strconv.Atoi(legajostr)
	cargo, _ := strconv.Atoi(cargostr)

	importestr := strings.TrimSpace(record[21])

	//-- IMPORTE
	if strings.Contains(importestr, ",") {
		if strings.Contains(importestr, ".") {
			importestr = strings.ReplaceAll(importestr, ",", "")
		} else {
			importestr = strings.ReplaceAll(importestr, ",", ".")
		}
	}

	//-- UNIDADES
	unidadesstr := strings.TrimSpace(record[20])
	if strings.Contains(unidadesstr, ",") {
		unidadesstr = strings.ReplaceAll(unidadesstr, ",", ".")
	}

	codigconceptostr := strings.TrimSpace(record[16])

	documento, _ := strconv.Atoi(strings.TrimSpace(record[2]))
	cuil, _ := strconv.Atoi(record[3])
	grupoLiquidacion, _ := strconv.Atoi(strings.TrimSpace(record[4]))
	codigoTipoPlanta, _ := strconv.Atoi(strings.TrimSpace(record[6]))
	codigoTipoPuesto, _ := strconv.Atoi(strings.TrimSpace(record[8]))
	codigoGrupoPersonal, _ := strconv.Atoi(strings.TrimSpace(record[10]))
	codigoFuncion, _ := strconv.Atoi(strings.TrimSpace(record[12]))
	codigoConcepto, _ := strconv.Atoi(codigconceptostr)
	codigoEntidad, _ := strconv.Atoi(strings.TrimSpace(record[18]))
	unidades, _ := strconv.ParseFloat(unidadesstr, 64)
	importe, _ := strconv.ParseFloat(importestr, 64)
	anomesRetroactivo, _ := strconv.Atoi(strings.TrimSpace(record[22]))
	escalafon, _ := strconv.Atoi(strings.TrimSpace(record[23]))
	categoria, _ := strconv.Atoi(strings.TrimSpace(record[24]))
	descConcepto := strings.ReplaceAll(strings.TrimSpace(record[17]), ",", ".")

	detallesHab := models.DetallesHab{
		TipoReg:                     tipoRegistro,
		Mes:                         mes,
		Anio:                        anio,
		TipoEmp:                     tipoEmp,
		Legajo:                      legajo,
		Cargo:                       cargo,
		NombreApellido:              toUTF8([]byte(record[1])),
		Documento:                   documento,
		Cuil:                        cuil,
		GrupoLiquidacion:            grupoLiquidacion,
		DescripcionGrupoLiquidacion: strings.TrimSpace(record[5]),
		CodigoTipoPlanta:            codigoTipoPlanta,
		DescripcionTipoPlanta:       strings.TrimSpace(record[7]),
		CodigoTipoPuesto:            codigoTipoPuesto,
		DescripcionTipoPuesto:       strings.TrimSpace(record[9]),
		CodigoGrupoPersonal:         codigoGrupoPersonal,
		DescripcionGrupoPersonal:    toUTF8([]byte(record[11])),
		CodigoFuncion:               codigoFuncion,
		DescripcionFuncion:          strings.TrimSpace(record[13]),
		Codep:                       strings.TrimSpace(record[14]),
		DescripcionCodep:            toUTF8([]byte(record[15])),
		CodigoConcepto:              codigoConcepto,
		DescripcionConcepto:         toUTF8([]byte(descConcepto)),
		CodigoEntidad:               codigoEntidad,
		DescripcionEntidad:          strings.TrimSpace(record[19]),
		Unidades:                    decimal.NewFromFloat(unidades),
		Importe:                     decimal.NewFromFloat(importe),
		AnomesRetroactivo:           anomesRetroactivo,
		Escalafon:                   escalafon,
		Categoria:                   categoria,
		Descripcion:                 toUTF8([]byte(record[25])),
	}

	return db.Create(&detallesHab).Error
}

func checkExistFile() bool {

	// Revisa si se pasó por parámetro el archivo
	if len(os.Args) < 2 {
		fmt.Println("Por favor, indicar el archivo a importar.")
		return false
	}
	// Obtiene el nombre de archivo en el argumento pasado
	fileName := os.Args[1]

	// Revisa que exista el archivo
	_, err := os.Stat(fileName)
	if err != nil {
		if os.IsNotExist(err) {
			fmt.Printf("NO existe archivo: '%s' .\n", fileName)
		} else {
			fmt.Printf("Error al chequear el archivo: %v\n", err)
		}
		return false
	}

	return true
}

// Return
// 1: liquidacion del mes, 2: SAC
// Tipo empresa
// Mes
// Anio
func tipoLiqFile(filename string) (int, string, int, int) {
	var ret int

	filelower := strings.ToLower(path.Base(filename))
	tmp := strings.Split(filelower, ".")
	filelower = tmp[0]

	if strings.Contains(filelower, "sac") {
		ret = 2
	} else {
		ret = 1
	}

	rec := strings.Split(filelower, "_")
	mes, _ := strconv.Atoi(rec[2])
	anio, _ := strconv.Atoi(rec[3])
	tipo := strings.ToUpper(rec[1])

	return ret, tipo, mes, anio
}

func chequeaColumnas(record []string) {
	cols := "LEGAJO;NOMBRE Y APELLIDO;DOCUMENTO;CUIL;GRUPO LIQUIDACION;DESCRIPCION GRUPO LIQUIDACION;CODIGO TIPO DE PLANTA;DESCRIPCION TIPO DE PLANTA;CODIGO TIPO DE PUESTO;DESCRIPCION TIPO DE PUESTO;CODIGO GRUPO PERSONAL;DESCRIPCION GRUPO PERSONAL;CODIGO DE FUNCION;DESCRIPCION FUNCION;CODEP;DESCRIPCION CODEP;CODIGO DE CONCEPTO;DESCRIPCION DE CONCEPTO;CODIGO DE ENTIDAD;DESCRIPCION DE ENTIDAD;UNIDADES;IMPORTE;ANO-MES RETROACTIVO;ESCALAFON;CATEGORIA;DESCRIPCION"
	oks := strings.Split(cols, ";")

	if len(oks) == len(record) {
		for i, c := range oks {
			okstr := strings.TrimSpace(c)
			rectr := strings.TrimSpace(record[i])
			if okstr != rectr {
				fmt.Println("La columna ", i, " NO es correcta: ", rectr, " Deberia ser: ", okstr)
				os.Exit(1)
			}
		}
	} else {
		fmt.Println("-----------")
		fmt.Printf("La cantidad de columnas en el archivo de datos NO es la correcta (%d):  %d", len(oks), len(record))
		fmt.Println("-----------")
		os.Exit(1)
	}

}

func toUTF8(iso8859_1_buf []byte) string {
	buf := make([]rune, len(iso8859_1_buf))
	for i, b := range iso8859_1_buf {
		buf[i] = rune(b)
	}
	return strings.TrimSpace(string(buf))
}
