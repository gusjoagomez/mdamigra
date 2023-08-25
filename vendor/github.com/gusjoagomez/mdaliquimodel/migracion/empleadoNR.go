package models

import (
	"time"
)

type EmpleadoNR struct {
	Legajo           int
	Cargo            int
	ApellidoNombre   string     `json:"apellido_nombre" gorm:"column:apellido_nombre;type:varchar(100); default:null"`
	Empresa          string     `json:"empresa" gorm:"column:empresa;type:varchar(100); default:null"`
	FechaDesde       *time.Time `json:"fecha_desde" gorm:"column:fecha_desde;type:date; default:null"`
	FechaHasta       *time.Time `json:"fecha_hasta" gorm:"column:fecha_hasta;type:date; default:null"`
	TipoAntiguedad   string     `json:"tipo_antiguedad" gorm:"column:tipo_antiguedad;type:varchar(3); default:null"`
	ComputaParaAntig string     `json:"computa_para_antig" gorm:"column:computa_para_antig;type:varchar(1); default:null"`
	ComputaParaVacac string     `json:"computa_para_vacac" gorm:"column:computa_para_vacac;type:varchar(1); default:null"`
	Procesado        string     `json:"procesado" gorm:"column:procesado;type:char(1); default:null"`
}

func (e *EmpleadoNR) TableName() string {
	return "migracion.empleadoNR"
}
