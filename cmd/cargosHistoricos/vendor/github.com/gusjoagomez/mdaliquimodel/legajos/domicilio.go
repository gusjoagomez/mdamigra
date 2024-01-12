package models

import (
	"time"
)

type Domicilio struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado          bool             `json:"activado" gorm:"column:activado"`
	CreadoEn          time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn      time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn       time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn        time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	CodDomicilio      uint             `json:"codDomicilio" gorm:"not null;type:int4;column:codDomicilio"`
	Id                int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	IdCalle           uint             `json:"idCalle" gorm:"not null;type:int4;column:idCalle"`
	General1          General          `gorm:"foreignKey:IdCalle;references:Id"`
	Puerta            string           `json:"puerta" gorm:"not null;type:varchar(10);column:puerta"`
	Piso              string           `json:"piso" gorm:"type:varchar(10);column:piso"`
	DptoLocal         string           `json:"dptoLocal" gorm:"type:varchar(10);column:dptoLocal"`
	CodPos            uint             `json:"codPos" gorm:"type:int4;column:codPos"`
	IdLocalidad       uint             `json:"idLocalidad" gorm:"not null;type:int4;column:idLocalidad"`
	General2          General          `gorm:"foreignKey:IdLocalidad;references:Id"`
	IdPartido         uint             `json:"idPartido" gorm:"not null;type:int4;column:idPartido"`
	General3          General          `gorm:"foreignKey:IdPartido;references:Id"`
	IdProvincia       uint             `json:"idProvincia" gorm:"not null;type:int4;column:idProvincia"`
	General4          General          `gorm:"foreignKey:IdProvincia;references:Id"`
	IdEntreCalle1     uint             `json:"idEntreCalle1" gorm:"type:int4;column:idEntreCalle1"`
	General5          General          `gorm:"foreignKey:IdEntreCalle1;references:Id"`
	IdEntreCalle2     uint             `json:"idEntreCalle2" gorm:"type:int4;column:idEntreCalle2"`
	General6          General          `gorm:"foreignKey:IdEntreCalle2;references:Id"`
	NroTelefono1      string           `json:"nroTelefono1" gorm:"type:varchar(12);column:nroTelefono1"`
	NroTelefono2      string           `json:"nroTelefono2" gorm:"type:varchar(12);column:nroTelefono2"`
	Email             string           `json:"email" gorm:"type:varchar(50);column:email"`
	FechaVersionDesde time.Time        `json:"fechaVersionDesde" gorm:"not null;type:timestamp;column:fechaVersionDesde"`
	FechaVersionHasta time.Time        `json:"fechaVersionHasta" gorm:"type:timestamp;column:fechaVersionHasta"`
	CreadoPorId       int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId   int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2 SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId    int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3 SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId     int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4 SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
	EdificioTorreCasa string           `json:"edificioTorreCasa" gorm:"type:varchar(50);column:edificioTorreCasa"`
	IdMunicipio       uint             `json:"idMunicipio" gorm:"type:int4;column:idMunicipio"`
}

func (e *Domicilio) TableName() string {
	return "public.domicilio"
}
