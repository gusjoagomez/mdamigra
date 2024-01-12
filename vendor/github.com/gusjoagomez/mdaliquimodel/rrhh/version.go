package models

import (
	"time"
)

type Version struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado              bool                 `json:"activado" gorm:"column:activado"`
	CreadoEn              time.Time            `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn          time.Time            `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn           time.Time            `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn            time.Time            `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                    int                  `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	FormulaId             uint                 `json:"formulaId" gorm:"type:int4;column:formulaId"`
	Formula1              Formula              `gorm:"foreignKey:FormulaId;references:Id"`
	FechaDesde            time.Time            `json:"fechaDesde" gorm:"type:timestamp;column:fechaDesde"`
	FechaHasta            time.Time            `json:"fechaHasta" gorm:"type:timestamp;column:fechaHasta"`
	Descripcion           string               `json:"descripcion" gorm:"type:varchar(50);column:descripcion"`
	Numero                uint                 `json:"numero" gorm:"type:int4;column:numero"`
	EstadoId              uint                 `json:"estadoId" gorm:"type:int4;column:estadoId"`
	TablaAuxiliarDetalle1 TablaAuxiliarDetalle `gorm:"foreignKey:EstadoId;references:Id"`
	CreadoPorId           int                  `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1     SeguridadUsuario     `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId       int                  `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2     SeguridadUsuario     `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId        int                  `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3     SeguridadUsuario     `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId         int                  `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4     SeguridadUsuario     `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Version) TableName() string {
	return "public.version"
}
