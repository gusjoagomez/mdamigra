package models

import (
	"time"
)

type Grupo struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Nombre            string           `json:"nombre" gorm:"not null;type:varchar(250);column:nombre"`
	AuxCadena1        string           `json:"auxCadena1" gorm:"type:varchar(250);column:auxCadena1"`
	AuxCadena2        string           `json:"auxCadena2" gorm:"type:varchar(250);column:auxCadena2"`
	AuxEntero1        string           `json:"auxEntero1" gorm:"type:varchar(250);column:auxEntero1"`
	AuxEntero2        string           `json:"auxEntero2" gorm:"type:varchar(250);column:auxEntero2"`
	CreadoPorId       int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Grupo) TableName() string {
	return "public.grupo"
}
