package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type Progenitor struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo            uint             `json:"legajo" gorm:"type:int4;column:legajo"`
	IdTipoDoc         uint             `json:"idTipoDoc" gorm:"not null;type:int4;column:idTipoDoc"`
	General1          General          `gorm:"foreignKey:IdTipoDoc;references:Id"`
	NroDocumento      uint             `json:"nroDocumento" gorm:"not null;type:int4;column:nroDocumento"`
	NroCuil           string           `json:"nroCuil" gorm:"not null;type:varchar(13);column:nroCuil"`
	Apellido          string           `json:"apellido" gorm:"not null;type:varchar(50);column:apellido"`
	Nombre            string           `json:"nombre" gorm:"not null;type:varchar(50);column:nombre"`
	Ingresos          decimal.Decimal  `json:"ingresos" gorm:"type:numeric(10,2);column:ingresos"`
	CreadoPorId       uint             `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   uint             `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    uint             `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     uint             `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Progenitor) TableName() string {
	return "public.progenitor"
}
