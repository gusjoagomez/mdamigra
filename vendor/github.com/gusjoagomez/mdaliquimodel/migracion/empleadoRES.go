package models

import (
	"time"
)

type EmpleadoRES struct {
	Legajo            int        `json:"legajo" gorm:"column:legajo;type:int; primaryKey"`
	Cargo             int        `json:"cargo" gorm:"column:cargo;type:int; primaryKey"`
	FechaDesde        *time.Time `json:"fecha_desde" gorm:"column:fecha_desde;type:date;primaryKey"`
	FechaHasta        *time.Time `json:"fecha_hasta" gorm:"column:fecha_hasta;type:date; default:null"`
	Empresa           string     `json:"empresa" gorm:"column:empresa;type:varchar(100); default:null"`
	ComputaParaAntig  string     `json:"computa_para_antig" gorm:"column:computa_para_antig;type:varchar(1); default:null"`
	ComputaParaVacac  string     `json:"computa_para_vacac" gorm:"column:computa_para_vacac;type:varchar(1); default:null"`
	FechaPresentacion *time.Time `json:"fecha_presentacion" gorm:"column:fecha_presentacion;type:date; default:null"`
	FechaAceptacion   *time.Time `json:"fecha_aceptacion" gorm:"column:fecha_aceptacion;type:date; default:null"`
	TipoAntiguedad    string     `json:"tipo_antiguedad" gorm:"column:tipo_antiguedad;type:varchar(3); default:null"`
}

func (e *EmpleadoRES) TableName() string {
	return "migracion.empleadoRES"
}
