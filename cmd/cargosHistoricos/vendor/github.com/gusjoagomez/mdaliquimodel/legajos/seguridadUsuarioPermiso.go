package models

type SeguridadUsuarioPermiso struct {
	//gorm.Model       // adds ID, created_at etc.
	UsuarioId         int              `json:"usuarioId" gorm:"type:int4;column:usuarioId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:UsuarioId;references:ID"`
	PermisoId         int              `json:"permisoId" gorm:"type:int4;column:permisoId"`
	SeguridadPermiso1 SeguridadPermiso `gorm:"foreignKey:PermisoId;references:Id"`
}

func (e *SeguridadUsuarioPermiso) TableName() string {
	return "public.seguridadUsuarioPermiso"
}
