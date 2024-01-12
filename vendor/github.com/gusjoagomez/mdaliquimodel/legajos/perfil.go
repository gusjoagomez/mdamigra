package models

import (
	"time"
)

type Perfil struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Url               string           `json:"url" gorm:"type:varchar(1500);column:url"`
	Observaciones     string           `json:"observaciones" gorm:"type:varchar(2500);column:observaciones"`
	DomicilioId       uint             `json:"domicilioId" gorm:"type:int4;column:domicilioId"`
	Domicilio1        Domicilio        `gorm:"foreignKey:DomicilioId;references:Id"`
	UsuarioId         int              `json:"usuarioId" gorm:"type:int4;column:usuarioId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:UsuarioId;references:ID"`
	CreadoPorId       int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario5 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Perfil) TableName() string {
	return "public.perfil"
}
