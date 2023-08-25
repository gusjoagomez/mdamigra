package models

import (
	"time"
)

type TablaAuxiliar struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	CodigoString      string           `json:"codigoString" gorm:"type:varchar(250);column:codigoString"`
	CodigoInt         string           `json:"codigoInt" gorm:"type:varchar(40);column:codigoInt"`
	Descripcion       string           `json:"descripcion" gorm:"type:varchar(40);column:descripcion"`
	Numerico1         string           `json:"numerico1" gorm:"type:varchar(40);column:numerico1"`
	Numerico2         string           `json:"numerico2" gorm:"type:varchar(40);column:numerico2"`
	Numerico3         string           `json:"numerico3" gorm:"type:varchar(40);column:numerico3"`
	Numerico4         string           `json:"numerico4" gorm:"type:varchar(40);column:numerico4"`
	Numerico5         string           `json:"numerico5" gorm:"type:varchar(40);column:numerico5"`
	Numerico6         string           `json:"numerico6" gorm:"type:varchar(40);column:numerico6"`
	Numerico7         string           `json:"numerico7" gorm:"type:varchar(40);column:numerico7"`
	Numerico8         string           `json:"numerico8" gorm:"type:varchar(40);column:numerico8"`
	Numerico9         string           `json:"numerico9" gorm:"type:varchar(40);column:numerico9"`
	Numerico10        string           `json:"numerico10" gorm:"type:varchar(40);column:numerico10"`
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

func (e *TablaAuxiliar) TableName() string {
	return "public.tablaAuxiliar"
}
