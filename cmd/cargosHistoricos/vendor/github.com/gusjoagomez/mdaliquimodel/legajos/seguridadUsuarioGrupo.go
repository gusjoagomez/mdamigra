package models

type SeguridadUsuarioGrupo struct {
	//gorm.Model       // adds ID, created_at etc.
	UsuarioId         int              `json:"usuarioId" gorm:"type:int4;column:usuarioId"`
	SeguridadUsuario1 SeguridadUsuario `gorm:"foreignKey:UsuarioId;references:ID"`
	GrupoId           int              `json:"grupoId" gorm:"type:int4;column:grupoId"`
	SeguridadGrupo1   SeguridadGrupo   `gorm:"foreignKey:GrupoId;references:Id"`
}

func (e *SeguridadUsuarioGrupo) TableName() string {
	return "public.seguridadUsuarioGrupo"
}
