package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type TablaAuxiliarDetalle struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                uint             `json:"id" gorm:"primaryKey;index:tablaAuxiliarIdUnica2,priority:1,unique;not null;size:32;type:int4;column:id"`
	TablaAuxiliarId   uint             `json:"tablaAuxiliarId" gorm:"type:int4;column:tablaAuxiliarId"`
	TablaAuxiliar1    TablaAuxiliar    `gorm:"foreignKey:TablaAuxiliarId;references:Id"`
	FechaDesde        time.Time        `json:"fechaDesde" gorm:"index:tablaAuxiliarIdUnica2,priority:2,unique;type:timestamp;column:fechaDesde"`
	FechaHasta        time.Time        `json:"fechaHasta" gorm:"type:timestamp;column:fechaHasta"`
	CodigoString      string           `json:"codigoString" gorm:"index:tablaAuxiliarIdUnica2,priority:4,unique;type:varchar(250);column:codigoString"`
	CodigoInt         int              `json:"codigoInt" gorm:"index:tablaAuxiliarIdUnica2,priority:3,unique;type:int4;column:codigoInt"`
	Descripcion       string           `json:"descripcion" gorm:"type:varchar(50);column:descripcion"`
	Numerico1         decimal.Decimal  `json:"numerico1" gorm:"type:numeric(15,2);column:numerico1"`
	Numerico2         decimal.Decimal  `json:"numerico2" gorm:"type:numeric(15,2);column:numerico2"`
	Numerico3         decimal.Decimal  `json:"numerico3" gorm:"type:numeric(15,2);column:numerico3"`
	Numerico4         decimal.Decimal  `json:"numerico4" gorm:"type:numeric(15,2);column:numerico4"`
	Numerico5         decimal.Decimal  `json:"numerico5" gorm:"type:numeric(15,2);column:numerico5"`
	Numerico6         decimal.Decimal  `json:"numerico6" gorm:"type:numeric(15,2);column:numerico6"`
	Numerico7         decimal.Decimal  `json:"numerico7" gorm:"type:numeric(15,2);column:numerico7"`
	Numerico8         decimal.Decimal  `json:"numerico8" gorm:"type:numeric(15,2);column:numerico8"`
	Numerico9         decimal.Decimal  `json:"numerico9" gorm:"type:numeric(15,2);column:numerico9"`
	Numerico10        decimal.Decimal  `json:"numerico10" gorm:"type:numeric(15,2);column:numerico10"`
	Caracter1         string           `json:"caracter1" gorm:"type:varchar(20);column:caracter1"`
	Caracter2         string           `json:"caracter2" gorm:"type:varchar(20);column:caracter2"`
	Caracter3         string           `json:"caracter3" gorm:"type:varchar(20);column:caracter3"`
	Descripcion1      string           `json:"descripcion1" gorm:"type:varchar(20);column:descripcion1"`
	Descripcion2      string           `json:"descripcion2" gorm:"type:varchar(20);column:descripcion2"`
	Descripcion3      string           `json:"descripcion3" gorm:"type:varchar(20);column:descripcion3"`
	CreadoPorId       int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *TablaAuxiliarDetalle) TableName() string {
	return "public.tablaAuxiliarDetalle"
}
