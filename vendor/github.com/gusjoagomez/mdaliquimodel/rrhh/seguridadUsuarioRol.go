package models

type SeguridadUsuarioRol struct {
	//gorm.Model       // adds ID, created_at etc.
	UsuarioId         int              `json:"usuarioId" gorm:"type:int4;column:usuarioId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:UsuarioId;references:ID"`
	RolId             int              `json:"rolId" gorm:"type:int4;column:rolId"`
	SeguridadRol1     SeguridadRol     `gorm:"foreignKey:RolId;references:Id"`
}

func (e *SeguridadUsuarioRol) TableName() string {
	return "public.seguridadUsuarioRol"
}
