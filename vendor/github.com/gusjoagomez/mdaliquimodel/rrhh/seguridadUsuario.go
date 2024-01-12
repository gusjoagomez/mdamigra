package models

import (
	"time"
)

type SeguridadUsuario struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool              `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time         `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time         `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time         `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time         `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	ID                int               `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Username          string            `json:"username" gorm:"not null;type:varchar(250);column:username"`
	Email             string            `json:"email" gorm:"type:varchar(250);column:email"`
	Nombre            string            `json:"nombre" gorm:"type:varchar(250);column:nombre"`
	Apellido          string            `json:"apellido" gorm:"type:varchar(250);column:apellido"`
	Password          string            `json:"password" gorm:"type:varchar(250);column:password"`
	Token             string            `json:"token" gorm:"type:varchar(250);column:token"`
	TokenTrimu        string            `json:"tokenTrimu" gorm:"type:varchar(250);column:tokenTrimu"`
	Opciones          string            `json:"opciones" gorm:"type:varchar(1000);column:opciones"`
	CambiarPassword   bool              `json:"cambiarPassword" gorm:"column:cambiarPassword"`
	CreadoPorId       int               `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 *SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int               `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 *SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int               `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 *SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int               `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 *SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *SeguridadUsuario) TableName() string {
	return "public.seguridadUsuario"
}
