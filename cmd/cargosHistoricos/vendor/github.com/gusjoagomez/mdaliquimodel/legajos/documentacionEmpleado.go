package models

import (
	"time"
)

type DocumentacionEmpleado struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado             bool               `json:"activado" gorm:"column:activado"`
	CreadoEn             time.Time          `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn         time.Time          `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn          time.Time          `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn           time.Time          `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                   int                `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	RutaOrigen           string             `json:"rutaOrigen" gorm:"type:varchar(100);column:rutaOrigen"`
	NombreArchivo        string             `json:"nombreArchivo" gorm:"type:varchar(150);column:nombreArchivo"`
	Tamanio              uint               `json:"tamanio" gorm:"type:int4;column:tamanio"`
	TipoArchivo          string             `json:"tipoArchivo" gorm:"type:varchar(100);column:tipoArchivo"`
	NroLegajo            uint               `json:"nroLegajo" gorm:"type:int4;column:nroLegajo"`
	IdEmpleado           uint               `json:"idEmpleado" gorm:"type:int4;column:idEmpleado"`
	Empleado1            Empleado           `gorm:"foreignKey:IdEmpleado;references:Id"`
	IdTipoAdjunto        uint               `json:"idTipoAdjunto" gorm:"type:int4;column:idTipoAdjunto"`
	General1             General            `gorm:"foreignKey:IdTipoAdjunto;references:Id"`
	Observaciones        string             `json:"observaciones" gorm:"type:varchar(1000);column:observaciones"`
	IdActoAdministrativo uint               `json:"idActoAdministrativo" gorm:"type:int4;column:idActoAdministrativo"`
	ActoAdministrativo1  ActoAdministrativo `gorm:"foreignKey:IdActoAdministrativo;references:Id"`
	IdFamiliar           uint               `json:"idFamiliar" gorm:"type:int4;column:idFamiliar"`
	Familiar1            Familiar           `gorm:"foreignKey:IdFamiliar;references:Id"`
	CreadoPorId          uint               `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1    SeguridadUsuario   `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId      uint               `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2    SeguridadUsuario   `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId       uint               `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3    SeguridadUsuario   `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId        uint               `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4    SeguridadUsuario   `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *DocumentacionEmpleado) TableName() string {
	return "public.documentacionEmpleado"
}
