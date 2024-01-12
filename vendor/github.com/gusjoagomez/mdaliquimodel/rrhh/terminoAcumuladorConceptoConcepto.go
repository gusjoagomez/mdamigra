package models

type TerminoAcumuladorConceptoConcepto struct {
	//gorm.Model       // adds ID, created_at etc.
	TerminoAcumuladorConceptoId uint                      `json:"terminoAcumuladorConceptoId" gorm:"type:int4;column:terminoAcumuladorConceptoId"`
	TerminoAcumuladorConcepto1  TerminoAcumuladorConcepto `gorm:"foreignKey:TerminoAcumuladorConceptoId;references:Id"`
	ConceptoId                  uint                      `json:"conceptoId" gorm:"type:int4;column:conceptoId"`
	Concepto1                   Concepto                  `gorm:"foreignKey:ConceptoId;references:Id"`
}

func (e *TerminoAcumuladorConceptoConcepto) TableName() string {
	return "public.terminoAcumuladorConceptoConcepto"
}
