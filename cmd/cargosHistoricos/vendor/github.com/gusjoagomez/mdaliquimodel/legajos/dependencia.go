package models

import (
	"time"
)

type Dependencia struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado                 bool             `json:"activado" gorm:"column:activado"`
	CreadoEn                 time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn             time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn              time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn               time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                       int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	CodSecuenciaDepen        uint             `json:"codSecuenciaDepen" gorm:"not null;type:int4;column:codSecuenciaDepen"`
	CodDependencia           string           `json:"codDependencia" gorm:"not null;type:varchar(10);column:codDependencia"`
	DescripcionDeDependencia string           `json:"descripcionDeDependencia" gorm:"not null;type:varchar(100);column:descripcionDeDependencia"`
	IdDependenciaSuperior    uint             `json:"idDependenciaSuperior" gorm:"not null;type:int4;column:idDependenciaSuperior"`
	Dependencia1             *Dependencia     `gorm:"foreignKey:IdDependenciaSuperior;references:Id"`
	CodJurisdiccion          string           `json:"codJurisdiccion" gorm:"not null;type:varchar(3);column:codJurisdiccion"`
	CodSubjurisdiccion       string           `json:"codSubjurisdiccion" gorm:"not null;type:varchar(3);column:codSubjurisdiccion"`
	CodPrograma              string           `json:"codPrograma" gorm:"not null;type:varchar(3);column:codPrograma"`
	CodProyecto              string           `json:"codProyecto" gorm:"not null;type:varchar(3);column:codProyecto"`
	CodObra                  string           `json:"codObra" gorm:"not null;type:varchar(3);column:codObra"`
	FuenteFinanciamiento     string           `json:"fuenteFinanciamiento" gorm:"not null;type:varchar(3);column:fuenteFinanciamiento"`
	IdDomicilio              uint             `json:"idDomicilio" gorm:"not null;type:int4;column:idDomicilio"`
	Domicilio1               Domicilio        `gorm:"foreignKey:IdDomicilio;references:Id"`
	FechaVersionDesde        time.Time        `json:"fechaVersionDesde" gorm:"not null;type:timestamp;column:fechaVersionDesde"`
	FechaVersionHasta        time.Time        `json:"fechaVersionHasta" gorm:"type:timestamp;column:fechaVersionHasta"`
	Nivel                    string           `json:"nivel" gorm:"type:varchar(1);column:nivel"`
	IdNivel                  uint             `json:"idNivel" gorm:"type:int4;column:idNivel"`
	General1                 General          `gorm:"foreignKey:IdNivel;references:Id"`
	IdOrganismo              uint             `json:"idOrganismo" gorm:"type:int4;column:idOrganismo"`
	General2                 General          `gorm:"foreignKey:IdOrganismo;references:Id"`
	CreadoPorId              int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1        SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId          int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2        SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId           int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3        SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId            int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4        SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *Dependencia) TableName() string {
	return "public.dependencia"
}
