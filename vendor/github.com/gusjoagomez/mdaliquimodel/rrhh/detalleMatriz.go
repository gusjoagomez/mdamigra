package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type DetalleMatriz struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                uint             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	FechaDesde        time.Time        `json:"fechaDesde" gorm:"type:timestamp;column:fechaDesde"`
	FechaHasta        time.Time        `json:"fechaHasta" gorm:"type:timestamp;column:fechaHasta"`
	Rango             decimal.Decimal  `json:"rango" gorm:"type:numeric(15,3);column:rango"`
	RetornaA          decimal.Decimal  `json:"retornaA" gorm:"type:numeric(15,2);column:retornaA"`
	RetornaB          decimal.Decimal  `json:"retornaB" gorm:"type:numeric(15,2);column:retornaB"`
	MatrizId          uint             `json:"matrizId" gorm:"type:int4;column:matrizId"`
	Matriz1           Matriz           `gorm:"foreignKey:MatrizId;references:Id"`
	CreadoPorId       int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *DetalleMatriz) TableName() string {
	return "public.detalleMatriz"
}
