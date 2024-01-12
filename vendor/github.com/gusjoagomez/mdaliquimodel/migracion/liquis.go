package models

import (
	"time"
)

type Liquis struct {
	//gorm.Model       // adds ID, created_at etc.
	ID               uint       `json:"id" gorm:"primaryKey;not null;size:32;type:int4;column:id"`
	Created_at       time.Time  `json:"created_at" gorm:"column:created_at"`
	Updated_at       *time.Time `json:"updated_at" gorm:"column:updated_at"`
	Deleted_at       *time.Time `json:"deleted_at" gorm:"column:deleted_at"`
	Id_agr           uint       `json:"id_agr" gorm:"type:int8;column:id_agr"`
	Id_plaper        uint       `json:"id_plaper" gorm:"type:int4;column:id_plaper"`
	Aniomes_liq      string     `json:"aniomes_liq" gorm:"type:varchar(6);column:aniomes_liq"`
	Aniomes_dev      string     `json:"aniomes_dev" gorm:"type:varchar(6);column:aniomes_dev"`
	Aniomes_gan      string     `json:"aniomes_gan" gorm:"type:varchar(6);column:aniomes_gan"`
	Tipo_liq         uint       `json:"tipo_liq" gorm:"column:tipo_liq"`
	Stipo_liq        uint       `json:"stipo_liq" gorm:"column:stipo_liq"`
	Fecha_pago       time.Time  `json:"fecha_pago" gorm:"column:fecha_pago"`
	Descripcion      string     `json:"descripcion" gorm:"column:descripcion"`
	Anulacion        string     `json:"anulacion" gorm:"column:anulacion"`
	Fecha_liq        string     `json:"fecha_liq" gorm:"column:fecha_liq"`
	Id_estado        uint       `json:"id_estado" gorm:"column:id_estado"`
	Nro_legajo_desde uint       `json:"nro_legajo_desde" gorm:"type:int4;column:nro_legajo_desde"`
	Nro_legajo_hasta uint       `json:"nro_legajo_hasta" gorm:"type:int4;column:nro_legajo_hasta"`
	Fec_ini_proc     time.Time  `json:"fec_ini_proc" gorm:"column:fec_ini_proc"`
	Fec_fin_proc     *time.Time `json:"fec_fin_proc" gorm:"column:fec_fin_proc"`
}

func (e *Liquis) TableName() string {
	return "migracion.liquis"
}
