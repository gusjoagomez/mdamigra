package models

import (
	"time"
)

type EmpleadoJ50 struct {
	Legajo            int
	Cargo             int
	FechaDesde        *time.Time `json:"fecha_desde" gorm:"column:fecha_desde;type:date; default:null"`
	FechaHasta        *time.Time `json:"fecha_hasta" gorm:"column:fecha_hasta;type:date; default:null"`
	Empresa           string     `json:"empresa" gorm:"column:empresa;type:varchar(100); default:null"`
	ComputaParaAntig  string     `json:"computa_para_antig" gorm:"column:computa_para_antig;type:varchar(1); default:null"`
	ComputaParaVacac  string     `json:"computa_para_vacac" gorm:"column:computa_para_vacac;type:varchar(1); default:null"`
	FechaPresentacion *time.Time `json:"fecha_presentacion" gorm:"column:fecha_presentacion;type:date; default:null"`
	FechaAceptacion   *time.Time `json:"fecha_aceptacion" gorm:"column:fecha_aceptacion;type:date; default:null"`
	Procesado         string     `json:"procesado" gorm:"column:procesado;type:char(1); default:null"`
}

func (e *EmpleadoJ50) TableName() string {
	return "migracion.empleadoJ50"
}
