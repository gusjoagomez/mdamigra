package models

import (
	"time"

	"github.com/shopspring/decimal"
)

type Agenda struct {
	//gorm.Model       // adds ID, created_at etc.
	Id             int             `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Tipo_liq       string          `json:"tipo_liq" gorm:"type:varchar(5);column:tipo_liq"`
	Stipo_liq      uint            `json:"stipo_liq" gorm:"type:int4;column:stipo_liq"`
	Nro_legajo     uint            `json:"nro_legajo" gorm:"type:int4;column:nro_legajo"`
	Nro_cargo      uint            `json:"nro_cargo" gorm:"type:int4;column:nro_cargo"`
	Fecha_desde    time.Time       `json:"fecha_desde" gorm:"column:fecha_desde"`
	Fecha_hasta    time.Time       `json:"fecha_hasta" gorm:"column:fecha_hasta"`
	Anio_dev       uint            `json:"anio_dev" gorm:"type:int4;column:anio_dev"`
	Mes_dev        uint            `json:"mes_dev" gorm:"type:int4;column:mes_dev"`
	Cod_concepto   uint            `json:"cod_concepto" gorm:"type:int4;column:cod_concepto"`
	Concepto1      Concepto        `gorm:"foreignKey:Cod_concepto;references:Id"`
	Scod_concepto  uint            `json:"scod_concepto" gorm:"column:scod_concepto"`
	Cod_formula    uint            `json:"cod_formula" gorm:"type:int4;column:cod_formula"`
	Scod_formula   uint            `json:"scod_formula" gorm:"type:int4;column:scod_formula"`
	Cantidad       decimal.Decimal `json:"cantidad" gorm:"type:numeric(8,2);column:cantidad"`
	Imp_valor_unit decimal.Decimal `json:"imp_valor_unit" gorm:"type:numeric(10,2);column:imp_valor_unit"`
	Imp_concepto   decimal.Decimal `json:"imp_concepto" gorm:"type:numeric(10,2);column:imp_concepto"`
	Tot_concepto   decimal.Decimal `json:"tot_concepto" gorm:"type:numeric(15,6);column:tot_concepto"`
	Valor_alfa     string          `json:"valor_alfa" gorm:"type:varchar(30);column:valor_alfa"`
}

func (e *Agenda) TableName() string {
	return "public.agenda"
}
