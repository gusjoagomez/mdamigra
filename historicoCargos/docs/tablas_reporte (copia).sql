
-- Sugerencia de datos -  Alta de Persona Asistida
create table asistido_alta(
	nombre_apellido varchar(100)  NOT NULL,
	tiene_dni varchar(50)  NOT NULL,
	motivo_no_dni varchar(255),
	tipo_doc varchar(100)  NOT NULL,
	nro_doc bigint  NOT NULL,
	cuil    bigint,
	identidad_genero varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL, 
	lugar_nacimiento varchar(50) NOT NULL,
	telefono_contacto varchar(50),
	nombre_contacto varchar(100) NOT NULL,
	fecha_ingreso date NOT NULL,
	situacion_persona varchar(50) NOT NULL,
	domicilio_calle varchar(100) NOT NULL,
	domicilio_numero integer NOT NULL,
	depto_casa varchar(50) NOT NULL,
	domicilio_partido varchar(50) NOT NULL,
	domicilio_provincia varchar(50) NOT NULL,
	situacion_hab  varchar(50) NOT NULL,
	situacion_hab_notrat  varchar(50) NOT NULL,
	nucleo_convivencia   varchar(50) NOT NULL,
	ocupacion varchar(50) NOT NULL,
	cobertura_medica varchar(50) NOT NULL,
	tiene_dificultad varchar(50) NOT NULL,
	posee_cud varchar(50)  NOT NULL,
	posse_pension_nocon varchar(50),
	plan_social varchar(50),
	nivel_estudios varchar(50) NOT NULL,
	esta_estudiando varchar(50) NOT NULL,
	tratamiento_previo varchar(50) NOT NULL,
	tratamiento_cuantos integer,
	dispositivos_tratamiento varchar(200),
	lugar_tratamiento varchar(50),
	tipo_tratamiento varchar(50),
	tiempo_tratamiento varchar(50),
	tratamiento_saludmental varchar(50) NOT NULL,
	desde_donde varchar(50) NOT NULL,
	sustancia_consumo varchar(50) NOT NULL,
	sustancia_consumo2 varchar(50) NOT NULL,
	frecuencia_consumo  varchar(50) NOT NULL,
	sugerencia_terapeutica  varchar(50) NOT NULL,
	sugerencia_terapeutica  varchar(100)  NOT NULL
);

-- Sugerencia de datos -  Seguimiento de Persona Asistida
create table asistido_seguimiento(
	nombre_apellido varchar(100) NOT NULL,
	nro_doc bigint NOT NULL,
	cuil    bigint,
	identidad_genero varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL, 
	edad integer NOT NULL,
	lugar_nacimiento varchar(50) NOT NULL,
	domicilio_calle varchar(100),
	domicilio_numero integer,
	depto_casa varchar(50),
	domicilio_partido varchar(50) NOT NULL,
	domicilio_provincia varchar(50) NOT NULL,
	telefono_contacto varchar(50) NOT NULL,
	telefono_referente varchar(50) NOT NULL,
	fecha_primer_consulta date NOT NULL,
	fecha_regostrp date NOT NULL,
	estado_activa varchar(10) NOT NULL,
	motivo_inactiva varchar(100) NOT NULL,
	cual_dispositivo varchar(100),
	dimension_psicosocial_freq varchar(100),
	dimension_psicosocial varchar(100) NOT NULL,
	dimension_inclusion varchar(100) NOT NULL,
	dimension_depocultural varchar(100) NOT NULL,
	dimension_salud_gral varchar(100) NOT NULL,
	prestacion_basica varchar(100) NOT NULL,
	articulo_psicosocio varchar(100) NOT NULL,
	articulo_legallaboeduc varchar(100) NOT NULL,
	articulo_depocultural varchar(100) NOT NULL,
	articulo_saludmental varchar(100) NOT NULL,
	articulo_ultimomes varchar(100) NOT NULL,
	subsidio_sedronar  varchar(100),
	observaciones varchar(512)
);

-- Alta de dispositivo
create table dispositivo_alta(
 	nombre varchar(100) not null,
 	tipo_dispositivo varchar(4) not null,
 	poblacion_edad varchar(50) not null,
 	poblacion_especifica varchar(50) not null
 );
 
 

CREATE TABLE dispositivo_seguimiento (
    fecha_realizacion DATE NOT NULL,
    id_dispositivo INT NOT NULL,
    nombre_coordinador TEXT NOT NULL,
    informe_mes VARCHAR(255) NOT NULL,
    horarios_funcionamiento VARCHAR(255) NOT NULL,
    trabajadores_mes INT NOT NULL,
    nombre_trabajador TEXT NOT NULL,
    rol_dispositivo VARCHAR(255) NOT NULL,
    formacion VARCHAR(255) NOT NULL,
    frecuencia_tarea_mes VARCHAR(255) NOT NULL,
    personas_alcance INT NOT NULL,
    personas_subsidio_Sedronar INT,
    actividades_dispositivo VARCHAR(255) NOT NULL,
    articulacion_instituciones VARCHAR(255) NOT NULL,
    detalle_modificaciones VARCHAR(255) NOT NULL,
    historias_clinicas TEXT,
    condiciones_ambientales TEXT,
    respeto_derechos_personas TEXT,
    servicio_internet VARCHAR(255),
    servicio_telefonico VARCHAR(255),
    accesibilidad_transporte VARCHAR(255),
    espacios_modificaciones VARCHAR(255)
);







----------------------------------------------------------

tiene_dni=array("Sï","No","No sabe","No se cuenta con esta información"),
motivo_no_dni=array("Nunca tuvo documento de identidad","Lo extravió/Se lo robaron","Está en trámite","No se cuenta con esta información","Otro motivo (campo abierto)"),
tipo_doc=array("Documento Único","Libreta de enrolamiento","Cédula de identidad","Pasaporte","Documento Extranjero","No sabe","No se cuenta con esta información","Otro (campo abierto)"),
identidad_genero=array("Mujer cis","Mujer trans/Travesti","No binario","Varón cis","Varón trans/Masculinidad trans","Otro","No se cuenta con esta información"),
situacion_persona=array("En acompañamiento","No asiste","Fue derivada","con subsidio personal de Sedronar");
situacion_hab=array("Habitación alquilada","Habitación cedida/prestada","Vivienda alquilada","Vivienda cedida/prestada","Vivienda propia","Institución/Comunidad terapéutica","Privado/a de la libertad","En riesgo de situación de calle","En situación de calle","Otra","No se cuenta con esta información")
situacion_hab_notrat=array("Habitación alquilada","Habitación cedida/prestada","Vivienda alquilada","Vivienda cedida/prestada","Vivienda propia","Institución/Comunidad terapéutica","Privado/a de la libertad","En riesgo de situación de calle","En situación de calle","Otra","No se cuenta con esta información")
nucleo_convivencia=array("Vive solo/a","Vive con familiares","Vive con otras personas que no son familiares","Vive con familiares y con otras personas","Otro núcleo de convivencia","No se cuenta con esta información");
	ocupacion=array("Trabajador/a registrado","Trabajador/a no registrado","Desempleado/a","Trabajador/a de la Economia popular","Jubilado/a o pensionado/a","No se cuenta con esta información")
	cobertura_medica varchar(50) NOT NULL,
	tiene_dificultad varchar(50) NOT NULL,
	posee_cud varchar(50)  NOT NULL,
	posse_pension_nocon varchar(50),
	plan_social varchar(50),
	nivel_estudios varchar(50) NOT NULL,
	esta_estudiando varchar(50) NOT NULL,
	tratamiento_previo varchar(50) NOT NULL,
	tratamiento_cuantos integer,
	dispositivos_tratamiento varchar(200),
	lugar_tratamiento varchar(50),
	tipo_tratamiento varchar(50),
	tiempo_tratamiento varchar(50),
	tratamiento_saludmental varchar(50) NOT NULL,
	desde_donde varchar(50) NOT NULL,
	sustancia_consumo varchar(50) NOT NULL,
	sustancia_consumo2 varchar(50) NOT NULL,
	frecuencia_consumo  varchar(50) NOT NULL,
	sugerencia_terapeutica  varchar(50) NOT NULL,
	sugerencia_terapeutica  varchar(100)  NOT NULL














