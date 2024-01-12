package models

import (
	"time"
)

type Cargo struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado                    bool             `json:"activado" gorm:"column:activado"`
	CreadoEn                    time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn                time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn                 time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn                  time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                          uint             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo                      uint             `json:"legajo" gorm:"type:int4;column:legajo"`
	NroCargo                    uint             `json:"nroCargo" gorm:"not null;type:int4;column:nroCargo"`
	NroNormaDeIngreso           uint             `json:"nroNormaDeIngreso" gorm:"type:int4;column:nroNormaDeIngreso"`
	FechaDeNormaDeIngreso       time.Time        `json:"fechaDeNormaDeIngreso" gorm:"type:timestamp;column:fechaDeNormaDeIngreso"`
	FechaIngresoAlCargo         time.Time        `json:"fechaIngresoAlCargo" gorm:"not null;type:timestamp;column:fechaIngresoAlCargo"`
	FechaIngresoAntiguedad      time.Time        `json:"fechaIngresoAntiguedad" gorm:"type:timestamp;column:fechaIngresoAntiguedad"`
	FechaIngresoVacaciones      time.Time        `json:"fechaIngresoVacaciones" gorm:"type:timestamp;column:fechaIngresoVacaciones"`
	FechaDeEgreso               time.Time        `json:"fechaDeEgreso" gorm:"type:timestamp;column:fechaDeEgreso"`
	NroNormaDeDesvinculacion    uint             `json:"nroNormaDeDesvinculacion" gorm:"type:int4;column:nroNormaDeDesvinculacion"`
	FechaNormaDeDesvinculacion  time.Time        `json:"fechaNormaDeDesvinculacion" gorm:"type:timestamp;column:fechaNormaDeDesvinculacion"`
	MarcaParaLiquidar           string           `json:"marcaParaLiquidar" gorm:"not null;type:varchar(1);column:marcaParaLiquidar"`
	IdEmpleado                  uint             `json:"idEmpleado" gorm:"not null;type:int4;column:idEmpleado"`
	Empleado1                   Empleado         `gorm:"foreignKey:IdEmpleado;references:Id"`
	IdPuesto                    uint             `json:"idPuesto" gorm:"not null;type:int4;column:idPuesto"`
	General1                    General          `gorm:"foreignKey:IdPuesto;references:Id"`
	IdPlantaDePersonal          uint             `json:"idPlantaDePersonal" gorm:"not null;type:int4;column:idPlantaDePersonal"`
	General2                    General          `gorm:"foreignKey:IdPlantaDePersonal;references:Id"`
	IdGrupoDePersonal           uint             `json:"idGrupoDePersonal" gorm:"not null;type:int4;column:idGrupoDePersonal"`
	General3                    General          `gorm:"foreignKey:IdGrupoDePersonal;references:Id"`
	IdFuncionDePersonal         uint             `json:"idFuncionDePersonal" gorm:"not null;type:int4;column:idFuncionDePersonal"`
	General4                    General          `gorm:"foreignKey:IdFuncionDePersonal;references:Id"`
	IdGrupoDeLiquidacion        uint             `json:"idGrupoDeLiquidacion" gorm:"not null;type:int4;column:idGrupoDeLiquidacion"`
	General5                    General          `gorm:"foreignKey:IdGrupoDeLiquidacion;references:Id"`
	IdSituacionDelEmpleado      uint             `json:"idSituacionDelEmpleado" gorm:"not null;type:int4;column:idSituacionDelEmpleado"`
	General6                    General          `gorm:"foreignKey:IdSituacionDelEmpleado;references:Id"`
	IdDependencia               uint             `json:"idDependencia" gorm:"type:int4;column:idDependencia"`
	Dependencia1                Dependencia      `gorm:"foreignKey:IdDependencia;references:Id"`
	IdNormaDeIngreso            uint             `json:"idNormaDeIngreso" gorm:"not null;type:int4;column:idNormaDeIngreso"`
	General7                    General          `gorm:"foreignKey:IdNormaDeIngreso;references:Id"`
	IdMotivoDeIngreso           uint             `json:"idMotivoDeIngreso" gorm:"not null;type:int4;column:idMotivoDeIngreso"`
	General8                    General          `gorm:"foreignKey:IdMotivoDeIngreso;references:Id"`
	IdMotivoDeBaja              uint             `json:"idMotivoDeBaja" gorm:"type:int4;column:idMotivoDeBaja"`
	General9                    General          `gorm:"foreignKey:IdMotivoDeBaja;references:Id"`
	IdNormaDeDesvinculacion     uint             `json:"idNormaDeDesvinculacion" gorm:"type:int4;column:idNormaDeDesvinculacion"`
	General10                   General          `gorm:"foreignKey:IdNormaDeDesvinculacion;references:Id"`
	FechaVersionDesde           time.Time        `json:"fechaVersionDesde" gorm:"not null;type:timestamp;column:fechaVersionDesde"`
	FechaVersionHasta           time.Time        `json:"fechaVersionHasta" gorm:"type:timestamp;column:fechaVersionHasta"`
	IdCategoria                 uint             `json:"idCategoria" gorm:"type:int4;column:idCategoria"`
	General11                   General          `gorm:"foreignKey:IdCategoria;references:Id"`
	IdDependenciaPresupuestaria uint             `json:"idDependenciaPresupuestaria" gorm:"type:int4;column:idDependenciaPresupuestaria"`
	Dependencia2                Dependencia      `gorm:"foreignKey:IdDependenciaPresupuestaria;references:Id"`
	FechaBaja                   time.Time        `json:"fechaBaja" gorm:"type:timestamp;column:fechaBaja"`
	Observaciones               string           `json:"observaciones" gorm:"type:varchar(4000);column:observaciones"`
	CreadoPorId                 int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1           SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId             int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2           SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId              int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3           SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId               int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4           SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Cargo) TableName() string {
	return "public.cargo"
}
