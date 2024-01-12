package models

import (
	"time"
)

type TerminoAcumuladorFormula struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado                  bool                      `json:"activado" gorm:"column:activado"`
	CreadoEn                  time.Time                 `json:"creadoEn" gorm:"not null;type:timestamp;column:creadoEn"`
	ModificadoEn              time.Time                 `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn               time.Time                 `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn                time.Time                 `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                        int                       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	RelativoAbsolutoId        uint                      `json:"relativoAbsolutoId" gorm:"type:int4;column:relativoAbsolutoId"`
	TablaAuxiliarDetalle1     TablaAuxiliarDetalle      `gorm:"foreignKey:RelativoAbsolutoId;references:Id"`
	PeriodoId                 uint                      `json:"periodoId" gorm:"type:int4;column:periodoId"`
	TablaAuxiliarDetalle2     TablaAuxiliarDetalle      `gorm:"foreignKey:PeriodoId;references:Id"`
	CargoLegajoId             uint                      `json:"cargoLegajoId" gorm:"type:int4;column:cargoLegajoId"`
	TablaAuxiliarDetalle3     TablaAuxiliarDetalle      `gorm:"foreignKey:CargoLegajoId;references:Id"`
	OperacionId               uint                      `json:"operacionId" gorm:"type:int4;column:operacionId"`
	TablaAuxiliarDetalle4     TablaAuxiliarDetalle      `gorm:"foreignKey:OperacionId;references:Id"`
	FormulaId                 uint                      `json:"formulaId" gorm:"type:int4;column:formulaId"`
	Formula1                  Formula                   `gorm:"foreignKey:FormulaId;references:Id"`
	TerminoId                 uint                      `json:"terminoId" gorm:"type:int4;column:terminoId"`
	Termino1                  Termino                   `gorm:"foreignKey:TerminoId;references:Id"`
	MesDesde                  uint                      `json:"mesDesde" gorm:"type:int4;column:mesDesde"`
	MesHasta                  uint                      `json:"mesHasta" gorm:"type:int4;column:mesHasta"`
	BaseCalculoId             uint                      `json:"baseCalculoId" gorm:"type:int4;column:baseCalculoId"`
	TerminoAcumuladorFormula1 *TerminoAcumuladorFormula `gorm:"foreignKey:BaseCalculoId;references:Id"`
	AgregacionId              uint                      `json:"agregacionId" gorm:"type:int4;column:agregacionId"`
	TablaAuxiliarDetalle5     TablaAuxiliarDetalle      `gorm:"foreignKey:AgregacionId;references:Id"`
	CreadoPorId               int                       `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1         SeguridadUsuario          `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId           int                       `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2         SeguridadUsuario          `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId            int                       `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3         SeguridadUsuario          `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId             int                       `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4         SeguridadUsuario          `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *TerminoAcumuladorFormula) TableName() string {
	return "public.terminoAcumuladorFormula"
}
