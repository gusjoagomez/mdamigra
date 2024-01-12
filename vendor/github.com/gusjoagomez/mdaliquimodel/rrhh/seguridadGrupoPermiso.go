package models

type SeguridadGrupoPermiso struct {
	//gorm.Model       // adds ID, created_at etc.
	GrupoId           uint             `json:"grupoId" gorm:"type:int4;column:grupoId"`
	SeguridadGrupo1   SeguridadGrupo   `gorm:"foreignKey:GrupoId;references:Id"`
	PermisoId         uint             `json:"permisoId" gorm:"type:int4;column:permisoId"`
	SeguridadPermiso1 SeguridadPermiso `gorm:"foreignKey:PermisoId;references:Id"`
}

func (e *SeguridadGrupoPermiso) TableName() string {
	return "public.seguridadGrupoPermiso"
}
