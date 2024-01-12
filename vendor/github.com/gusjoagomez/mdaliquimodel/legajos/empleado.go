package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type Empleado struct {
	//gorm.Model       // adds ID, created_at etc.
	Activado                bool             `json:"activado" gorm:"column:activado"`
	CreadoEn                time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
	ModificadoEn            time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
	EliminadoEn             time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
	ActivadoEn              time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
	Legajo                  uint             `json:"legajo" gorm:"not null;type:int4;column:legajo"`
	Id                      int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	NroDocumento            uint             `json:"nroDocumento" gorm:"not null;type:int4;column:nroDocumento"`
	Nombre                  string           `json:"nombre" gorm:"not null;type:varchar(50);column:nombre"`
	Apellido                string           `json:"apellido" gorm:"not null;type:varchar(50);column:apellido"`
	FechaNacimiento         time.Time        `json:"fechaNacimiento" gorm:"not null;type:timestamp;column:fechaNacimiento"`
	FechaIngreso            time.Time        `json:"fechaIngreso" gorm:"not null;type:timestamp;column:fechaIngreso"`
	FechaEgresoPrevisto     time.Time        `json:"fechaEgresoPrevisto" gorm:"type:timestamp;column:fechaEgresoPrevisto"`
	MarcaIncapacidad        string           `json:"marcaIncapacidad" gorm:"type:varchar(1);column:marcaIncapacidad"`
	FechaHastaIncapacidad   time.Time        `json:"fechaHastaIncapacidad" gorm:"type:timestamp;column:fechaHastaIncapacidad"`
	NroCuil                 string           `json:"nroCuil" gorm:"not null;type:varchar(13);column:nroCuil"`
	NroAfiliacionObraSocial uint             `json:"nroAfiliacionObraSocial" gorm:"type:int4;column:nroAfiliacionObraSocial"`
	NroCuentaBancaria       string           `json:"nroCuentaBancaria" gorm:"type:varchar(15);column:nroCuentaBancaria"`
	FechaDeBajaDelEmpleado  time.Time        `json:"fechaDeBajaDelEmpleado" gorm:"type:timestamp;column:fechaDeBajaDelEmpleado"`
	FechaVersionDesde       time.Time        `json:"fechaVersionDesde" gorm:"not null;type:timestamp;column:fechaVersionDesde"`
	FechaVersionHasta       time.Time        `json:"fechaVersionHasta" gorm:"type:timestamp;column:fechaVersionHasta"`
	PorcentajeIncapacidad   decimal.Decimal  `json:"porcentajeIncapacidad" gorm:"type:numeric(6,2);column:porcentajeIncapacidad"`
	IdTipoDoc               uint             `json:"idTipoDoc" gorm:"not null;type:int4;column:idTipoDoc"`
	General1                General          `gorm:"foreignKey:IdTipoDoc;references:Id"`
	IdSexo                  uint             `json:"idSexo" gorm:"type:int4;column:idSexo"`
	General2                General          `gorm:"foreignKey:IdSexo;references:Id"`
	IdGenero                uint             `json:"idGenero" gorm:"type:int4;column:idGenero"`
	General3                General          `gorm:"foreignKey:IdGenero;references:Id"`
	IdEstadoCivil           uint             `json:"idEstadoCivil" gorm:"type:int4;column:idEstadoCivil"`
	General4                General          `gorm:"foreignKey:IdEstadoCivil;references:Id"`
	IdPaisNacimiento        uint             `json:"idPaisNacimiento" gorm:"type:int4;column:idPaisNacimiento"`
	General5                General          `gorm:"foreignKey:IdPaisNacimiento;references:Id"`
	IdIdioma                uint             `json:"idIdioma" gorm:"type:int4;column:idIdioma"`
	General6                General          `gorm:"foreignKey:IdIdioma;references:Id"`
	IdGrupoSanguineo        uint             `json:"idGrupoSanguineo" gorm:"type:int4;column:idGrupoSanguineo"`
	General7                General          `gorm:"foreignKey:IdGrupoSanguineo;references:Id"`
	IdFactorRrh             uint             `json:"idFactorRrh" gorm:"type:int4;column:idFactorRrh"`
	General8                General          `gorm:"foreignKey:IdFactorRrh;references:Id"`
	IdObraSocial            uint             `json:"idObraSocial" gorm:"type:int4;column:idObraSocial"`
	General9                General          `gorm:"foreignKey:IdObraSocial;references:Id"`
	IdBanco                 uint             `json:"idBanco" gorm:"type:int4;column:idBanco"`
	General10               General          `gorm:"foreignKey:IdBanco;references:Id"`
	IdDomicilio             uint             `json:"idDomicilio" gorm:"type:int4;column:idDomicilio"`
	Domicilio1              Domicilio        `gorm:"foreignKey:IdDomicilio;references:Id"`
	CreadoPorId             int              `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
	SeguridadUsuario1       SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
	ModificadoPorId         int              `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
	SeguridadUsuario2       SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
	EliminadoPorId          int              `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
	SeguridadUsuario3       SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
	ActivadoPorId           int              `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
	SeguridadUsuario4       SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
}

// type Empleado struct {
// 	//gorm.Model       // adds ID, created_at etc.
// 	Activado                bool             `json:"activado" gorm:"column:activado"`
// 	CreadoEn                time.Time        `json:"creadoEn" gorm:"type:timestamp;column:creadoEn"`
// 	ModificadoEn            time.Time        `json:"modificadoEn" gorm:"type:timestamp;column:modificadoEn"`
// 	EliminadoEn             time.Time        `json:"eliminadoEn" gorm:"type:timestamp;column:eliminadoEn"`
// 	ActivadoEn              time.Time        `json:"activadoEn" gorm:"type:timestamp;column:activadoEn"`
// 	Legajo                  uint             `json:"legajo" gorm:"not null;type:int4;column:legajo"`
// 	Id                      int              `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
// 	NroDocumento            uint             `json:"nroDocumento" gorm:"not null;type:int4;column:nroDocumento"`
// 	Nombre                  string           `json:"nombre" gorm:"not null;type:varchar(50);column:nombre"`
// 	Apellido                string           `json:"apellido" gorm:"not null;type:varchar(50);column:apellido"`
// 	FechaNacimiento         time.Time        `json:"fechaNacimiento" gorm:"not null;type:timestamp;column:fechaNacimiento"`
// 	FechaIngreso            time.Time        `json:"fechaIngreso" gorm:"not null;type:timestamp;column:fechaIngreso"`
// 	FechaEgresoPrevisto     time.Time        `json:"fechaEgresoPrevisto" gorm:"type:timestamp;column:fechaEgresoPrevisto"`
// 	MarcaIncapacidad        string           `json:"marcaIncapacidad" gorm:"type:varchar(1);column:marcaIncapacidad"`
// 	FechaHastaIncapacidad   time.Time        `json:"fechaHastaIncapacidad" gorm:"type:timestamp;column:fechaHastaIncapacidad"`
// 	NroCuil                 string           `json:"nroCuil" gorm:"not null;type:varchar(13);column:nroCuil"`
// 	NroAfiliacionObraSocial uint             `json:"nroAfiliacionObraSocial" gorm:"type:int4;column:nroAfiliacionObraSocial"`
// 	NroCuentaBancaria       string           `json:"nroCuentaBancaria" gorm:"type:varchar(15);column:nroCuentaBancaria"`
// 	FechaDeBajaDelEmpleado  time.Time        `json:"fechaDeBajaDelEmpleado" gorm:"type:timestamp;column:fechaDeBajaDelEmpleado"`
// 	FechaVersionDesde       time.Time        `json:"fechaVersionDesde" gorm:"not null;type:timestamp;column:fechaVersionDesde"`
// 	FechaVersionHasta       time.Time        `json:"fechaVersionHasta" gorm:"type:timestamp;column:fechaVersionHasta"`
// 	PorcentajeIncapacidad   decimal.Decimal  `json:"porcentajeIncapacidad" gorm:"type:numeric(6,2);column:porcentajeIncapacidad"`
// 	IdTipoDoc               uint             `json:"idTipoDoc" gorm:"not null;type:int4;column:idTipoDoc"`
// 	General1                General          `gorm:"foreignKey:IdTipoDoc;references:Id"`
// 	IdSexo                  uint             `json:"idSexo" gorm:"type:int4;column:idSexo"`
// 	General2                General          `gorm:"foreignKey:IdSexo;references:Id"`
// 	IdGenero                uint             `json:"idGenero" gorm:"type:int4;column:idGenero"`
// 	General3                General          `gorm:"foreignKey:IdGenero;references:Id"`
// 	IdEstadoCivil           uint             `json:"idEstadoCivil" gorm:"type:int4;column:idEstadoCivil"`
// 	General4                General          `gorm:"foreignKey:IdEstadoCivil;references:Id"`
// 	IdPaisNacimiento        uint             `json:"idPaisNacimiento" gorm:"type:int4;column:idPaisNacimiento"`
// 	General5                General          `gorm:"foreignKey:IdPaisNacimiento;references:Id"`
// 	IdIdioma                uint             `json:"idIdioma" gorm:"type:int4;column:idIdioma"`
// 	General6                General          `gorm:"foreignKey:IdIdioma;references:Id"`
// 	IdGrupoSanguineo        uint             `json:"idGrupoSanguineo" gorm:"type:int4;column:idGrupoSanguineo"`
// 	General7                General          `gorm:"foreignKey:IdGrupoSanguineo;references:Id"`
// 	IdFactorRrh             uint             `json:"idFactorRrh" gorm:"type:int4;column:idFactorRrh"`
// 	General8                General          `gorm:"foreignKey:IdFactorRrh;references:Id"`
// 	IdObraSocial            uint             `json:"idObraSocial" gorm:"type:int4;column:idObraSocial"`
// 	General9                General          `gorm:"foreignKey:IdObraSocial;references:Id"`
// 	IdBanco                 uint             `json:"idBanco" gorm:"type:int4;column:idBanco"`
// 	General10               General          `gorm:"foreignKey:IdBanco;references:Id"`
// 	IdDomicilio             uint             `json:"idDomicilio" gorm:"type:int4;column:idDomicilio"`
// 	Domicilio1              Domicilio        `gorm:"foreignKey:IdDomicilio;references:Id"`
// 	CreadoPorId             uint             `json:"creadoPorId" gorm:"type:int4;column:creadoPorId"`
// 	SeguridadUsuario1       SeguridadUsuario `gorm:"foreignKey:CreadoPorId;references:ID"`
// 	ModificadoPorId         uint             `json:"modificadoPorId" gorm:"type:int4;column:modificadoPorId"`
// 	SeguridadUsuario2       SeguridadUsuario `gorm:"foreignKey:ModificadoPorId;references:ID"`
// 	EliminadoPorId          uint             `json:"eliminadoPorId" gorm:"type:int4;column:eliminadoPorId"`
// 	SeguridadUsuario3       SeguridadUsuario `gorm:"foreignKey:EliminadoPorId;references:ID"`
// 	ActivadoPorId           uint             `json:"activadoPorId" gorm:"type:int4;column:activadoPorId"`
// 	SeguridadUsuario4       SeguridadUsuario `gorm:"foreignKey:ActivadoPorId;references:ID"`
// }

func (e *Empleado) TableName() string {
	return "public.empleado"
}
