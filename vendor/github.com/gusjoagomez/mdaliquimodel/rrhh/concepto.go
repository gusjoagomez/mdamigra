package models

import (
	"time"
)

type Concepto struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado              bool                 `json:"activado" gorm:"column:activado"`
	CreadoEn              time.Time            `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn          time.Time            `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn           time.Time            `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn            time.Time            `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                    int                  `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Cod_concepto          uint                 `json:"cod_concepto" gorm:"type:int4;column:cod_concepto"`
	Fecha_desde           time.Time            `json:"fecha_desde" gorm:"type:timestamp;column:fecha_desde"`
	Fecha_hasta           time.Time            `json:"fecha_hasta" gorm:"type:timestamp;column:fecha_hasta"`
	Desc_conce            string               `json:"desc_conce" gorm:"type:varchar(50);column:desc_conce"`
	Desc_corta            string               `json:"desc_corta" gorm:"type:varchar(20);column:desc_corta"`
	Legajo_cargo          string               `json:"legajo_cargo" gorm:"type:varchar(2);column:legajo_cargo"`
	Imprime_cero          uint                 `json:"imprime_cero" gorm:"type:int4;column:imprime_cero"`
	Id_tipo_concepto      uint                 `json:"id_tipo_concepto" gorm:"type:int4;column:id_tipo_concepto"`
	TablaAuxiliarDetalle1 TablaAuxiliarDetalle `gorm:"foreignKey:Id_tipo_concepto;references:Id"`
	Id_ganancias          uint                 `json:"id_ganancias" gorm:"type:int4;column:id_ganancias"`
	TablaAuxiliarDetalle2 TablaAuxiliarDetalle `gorm:"foreignKey:Id_ganancias;references:Id"`
	Id_concepto_cant      uint                 `json:"id_concepto_cant" gorm:"type:int4;column:id_concepto_cant"`
	Concepto1             *Concepto            `gorm:"foreignKey:Id_concepto_cant;references:Id"`
	CreadoPorId           int                  `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1     SeguridadUsuario     `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId       int                  `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2     SeguridadUsuario     `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId        int                  `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3     SeguridadUsuario     `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId         int                  `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4     SeguridadUsuario     `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Concepto) TableName() string {
	return "public.concepto"
}
