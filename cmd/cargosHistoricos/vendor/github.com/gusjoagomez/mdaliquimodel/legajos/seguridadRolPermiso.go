package models

type SeguridadRolPermiso struct {
	//gorm.Model       // adds ID, created_at etc.
	RolId             int              `json:"rolId" gorm:"type:int4;column:rolId"`
	SeguridadRol1     SeguridadRol     `gorm:"foreignKey:RolId;references:Id"`
	PermisoId         int              `json:"permisoId" gorm:"type:int4;column:permisoId"`
	SeguridadPermiso1 SeguridadPermiso `gorm:"foreignKey:PermisoId;references:Id"`
}

func (e *SeguridadRolPermiso) TableName() string {
	return "public.seguridadRolPermiso"
}
