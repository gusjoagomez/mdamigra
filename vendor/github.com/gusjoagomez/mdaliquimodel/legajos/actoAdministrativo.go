package models

import (
	"time"
)

type ActoAdministrativo struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado               bool             `json:"activado" gorm:"column:activado"`
	CreadoEn               time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn           time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn            time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn             time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Id                     int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Legajo                 uint             `json:"legajo" gorm:"not null;type:int4;column:legajo"`
	IdEmpleado             uint             `json:"idEmpleado" gorm:"not null;type:int4;column:idEmpleado"`
	Empleado1              Empleado         `gorm:"foreignKey:IdEmpleado;references:Id"`
	NormaInicioFecha       time.Time        `json:"normaInicioFecha" gorm:"not null;type:timestamp;column:normaInicioFecha"`
	NormaInicioTipo        uint             `json:"normaInicioTipo" gorm:"not null;type:int4;column:normaInicioTipo"`
	General1               General          `gorm:"foreignKey:NormaInicioTipo;references:Id"`
	NormaInicioAnio        uint             `json:"normaInicioAnio" gorm:"not null;type:int4;column:normaInicioAnio"`
	NormaInicioNro         uint             `json:"normaInicioNro" gorm:"not null;type:int4;column:normaInicioNro"`
	ActoAdminTipo          uint             `json:"actoAdminTipo" gorm:"not null;type:int4;column:actoAdminTipo"`
	General2               General          `gorm:"foreignKey:ActoAdminTipo;references:Id"`
	ActoAdminAnio          uint             `json:"actoAdminAnio" gorm:"not null;type:int4;column:actoAdminAnio"`
	ActoAdminNro           uint             `json:"actoAdminNro" gorm:"not null;type:int4;column:actoAdminNro"`
	ActoAdminFechaIni      time.Time        `json:"actoAdminFechaIni" gorm:"not null;type:timestamp;column:actoAdminFechaIni"`
	ActoAdminFechaFin      time.Time        `json:"actoAdminFechaFin" gorm:"type:timestamp;column:actoAdminFechaFin"`
	ExpedienteIniAnio      uint             `json:"expedienteIniAnio" gorm:"type:int4;column:expedienteIniAnio"`
	ExpedienteIniMes       string           `json:"expedienteIniMes" gorm:"type:varchar(4);column:expedienteIniMes"`
	ExpedienteIniNroTram   uint             `json:"expedienteIniNroTram" gorm:"type:int4;column:expedienteIniNroTram"`
	ExpedienteIniNroCuerpo uint             `json:"expedienteIniNroCuerpo" gorm:"type:int4;column:expedienteIniNroCuerpo"`
	NormaFinFecha          time.Time        `json:"normaFinFecha" gorm:"type:timestamp;column:normaFinFecha"`
	NormaFinTipo           uint             `json:"normaFinTipo" gorm:"type:int4;column:normaFinTipo"`
	General3               General          `gorm:"foreignKey:NormaFinTipo;references:Id"`
	NormaFinAnio           uint             `json:"normaFinAnio" gorm:"type:int4;column:normaFinAnio"`
	NormaFinNro            uint             `json:"normaFinNro" gorm:"type:int4;column:normaFinNro"`
	ExpedienteFinAnio      uint             `json:"expedienteFinAnio" gorm:"type:int4;column:expedienteFinAnio"`
	ExpedienteFinMes       string           `json:"expedienteFinMes" gorm:"type:varchar(4);column:expedienteFinMes"`
	ExpedienteFinNroTram   uint             `json:"expedienteFinNroTram" gorm:"type:int4;column:expedienteFinNroTram"`
	ExpedienteFinNroCuerpo uint             `json:"expedienteFinNroCuerpo" gorm:"type:int4;column:expedienteFinNroCuerpo"`
	Detalle                string           `json:"detalle" gorm:"type:varchar(400);column:detalle"`
	CreadoPorId            int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1      SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId        int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2      SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId         int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3      SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId          int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4      SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

func (e *ActoAdministrativo) TableName() string {
	return "public.actoAdministrativo"
}
