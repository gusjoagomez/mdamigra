package models

import (
	"time"
)

type Nodo struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado              bool                 `json:"activado" gorm:"column:activado"`
	CreadoEn              time.Time            `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn          time.Time            `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn           time.Time            `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn            time.Time            `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                    int                  `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	OperadorId            uint                 `json:"operadorId" gorm:"type:int4;column:operadorId"`
	TablaAuxiliarDetalle1 TablaAuxiliarDetalle `gorm:"foreignKey:OperadorId;references:Id"`
	Parametros            string               `json:"parametros" gorm:"type:varchar(100);column:parametros"`
	FormulaId             uint                 `json:"formulaId" gorm:"type:int4;column:formulaId"`
	Formula1              Formula              `gorm:"foreignKey:FormulaId;references:Id"`
	VersionId             uint                 `json:"versionId" gorm:"type:int4;column:versionId"`
	Version1              Version              `gorm:"foreignKey:VersionId;references:Id"`
	TerminoId             uint                 `json:"terminoId" gorm:"type:int4;column:terminoId"`
	Termino1              Termino              `gorm:"foreignKey:TerminoId;references:Id"`
	CodigoSubFormulaId    uint                 `json:"codigoSubFormulaId" gorm:"type:int4;column:codigoSubFormulaId"`
	Formula2              Formula              `gorm:"foreignKey:CodigoSubFormulaId;references:Id"`
	TipoTerminoId         uint                 `json:"tipoTerminoId" gorm:"type:int4;column:tipoTerminoId"`
	TablaAuxiliarDetalle2 TablaAuxiliarDetalle `gorm:"foreignKey:TipoTerminoId;references:Id"`
	TipoNodoId            uint                 `json:"tipoNodoId" gorm:"type:int4;column:tipoNodoId"`
	TablaAuxiliarDetalle3 TablaAuxiliarDetalle `gorm:"foreignKey:TipoNodoId;references:Id"`
	FuncionId             uint                 `json:"funcionId" gorm:"type:int4;column:funcionId"`
	TablaAuxiliarDetalle4 TablaAuxiliarDetalle `gorm:"foreignKey:FuncionId;references:Id"`
	NodoPadreId           uint                 `json:"nodoPadreId" gorm:"type:int4;column:nodoPadreId"`
	Nodo1                 *Nodo                `gorm:"foreignKey:NodoPadreId;references:Id"`
	CreadoPorId           int                  `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1     SeguridadUsuario     `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId       int                  `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2     SeguridadUsuario     `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId        int                  `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3     SeguridadUsuario     `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId         int                  `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4     SeguridadUsuario     `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Nodo) TableName() string {
	return "public.nodo"
}
