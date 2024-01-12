package models

import (
	"time"
)

type Familiar struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado              bool             `json:"activado" gorm:"column:activado"`
	CreadoEn              time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn          time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn           time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn            time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                    int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo                uint             `json:"legajo" gorm:"not null;type:int4;column:legajo"`
	CodParentesco         uint             `json:"codParentesco" gorm:"not null;type:int4;column:codParentesco"`
	General1              General          `gorm:"foreignKey:CodParentesco;references:Id"`
	IdTipoDoc             uint             `json:"idTipoDoc" gorm:"not null;type:int4;column:idTipoDoc"`
	General2              General          `gorm:"foreignKey:IdTipoDoc;references:Id"`
	NroDocumento          uint             `json:"nroDocumento" gorm:"not null;type:int4;column:nroDocumento"`
	NroCuil               string           `json:"nroCuil" gorm:"not null;type:varchar(13);column:nroCuil"`
	Apellido              string           `json:"apellido" gorm:"not null;type:varchar(50);column:apellido"`
	Nombre                string           `json:"nombre" gorm:"not null;type:varchar(50);column:nombre"`
	FechaNacimiento       time.Time        `json:"fechaNacimiento" gorm:"not null;type:timestamp;column:fechaNacimiento"`
	IdSexo                uint             `json:"idSexo" gorm:"not null;type:int4;column:idSexo"`
	General3              General          `gorm:"foreignKey:IdSexo;references:Id"`
	IdGenero              uint             `json:"idGenero" gorm:"not null;type:int4;column:idGenero"`
	General4              General          `gorm:"foreignKey:IdGenero;references:Id"`
	FechaAlta             time.Time        `json:"fechaAlta" gorm:"not null;type:timestamp;column:fechaAlta"`
	FechaBaja             time.Time        `json:"fechaBaja" gorm:"type:timestamp;column:fechaBaja"`
	MarcaIncapacidad      string           `json:"marcaIncapacidad" gorm:"type:varchar(1);column:marcaIncapacidad"`
	PorcentajeIncapacidad uint             `json:"porcentajeIncapacidad" gorm:"type:numeric(6,2);column:porcentajeIncapacidad"`
	FechaHastaIncapacidad time.Time        `json:"fechaHastaIncapacidad" gorm:"type:timestamp;column:fechaHastaIncapacidad"`
	CreadoPorId           int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1     SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId       int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2     SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId        int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3     SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId         int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4     SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Familiar) TableName() string {
	return "public.familiar"
}
