package models

type ProgenitorFamiliar struct {
	//gorm.Model       // adds ID, created_at etc.
	IdProgenitor uint       `json:"idProgenitor" gorm:"type:int4;column:idProgenitor"`
	Progenitor1  Progenitor `gorm:"foreignKey:IdProgenitor;references:Id"`
	IdFamiliar   uint       `json:"idFamiliar" gorm:"type:int4;column:idFamiliar"`
	Familiar1    Familiar   `gorm:"foreignKey:IdFamiliar;references:Id"`
}

func (e *ProgenitorFamiliar) TableName() string {
	return "public.progenitorFamiliar"
}
