package main

import (
	"fmt"
	"time"
)

type Periodo struct {
	FechaInicio time.Time
	FechaFin    time.Time
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

func main() {

	// fechaDesde := "1988-08-01"
	// fechaHasta := "2013-02-28"

	fechaDesde := "1988-02-01"
	fechaHasta := "1988-07-31"

	initDate, _ := time.Parse("2006-01-02", fechaDesde)
	endDate, _ := time.Parse("2006-01-02", fechaHasta)

	periodos := []Periodo{
		{time.Date(1900, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(1995, 12, 31, 0, 0, 0, 0, time.UTC)},
		{time.Date(1996, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(2012, 12, 31, 0, 0, 0, 0, time.UTC)},
		{time.Date(2013, 1, 1, 0, 0, 0, 0, time.UTC), time.Date(2024, 12, 31, 0, 0, 0, 0, time.UTC)},
	}

	superposedAges := GetPeriodosSuperpuestos(initDate, endDate, periodos)
	for _, age := range superposedAges {
		fmt.Printf("Superposed Age: %s - %s\n", age.FechaInicio.Format("2006-01-02"), age.FechaFin.Format("2006-01-02"))
	}

}
