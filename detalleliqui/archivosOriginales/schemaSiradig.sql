--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: siradig; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA siradig;


ALTER SCHEMA siradig OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extra_cargo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.extra_cargo (
    anio integer NOT NULL,
    mes integer NOT NULL,
    nro_legajo integer NOT NULL,
    nro_cargo integer NOT NULL,
    extraccion jsonb,
    fecha_ingreso date,
    fecha_egreso date,
    planta_personal integer,
    id_convenio integer
);


ALTER TABLE siradig.extra_cargo OWNER TO postgres;

--
-- Name: extra_siradig; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.extra_siradig (
    legajo integer NOT NULL,
    cuit bigint NOT NULL,
    anio integer NOT NULL,
    mes bigint NOT NULL,
    nrover integer NOT NULL,
    atributo character varying(30) NOT NULL,
    valoracum numeric(10,2),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL,
    estadoliq character varying(1)
);


ALTER TABLE siradig.extra_siradig OWNER TO postgres;

--
-- Name: f572_archivos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_archivos (
    id integer NOT NULL,
    filename character varying(100),
    periodo integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_archivos OWNER TO postgres;

--
-- Name: f572_archivos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_archivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_archivos_id_seq OWNER TO postgres;

--
-- Name: f572_archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_archivos_id_seq OWNED BY siradig.f572_archivos.id;


--
-- Name: f572_cargasfamilia; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_cargasfamilia (
    id integer NOT NULL,
    presentacion_id integer,
    tipodoc integer,
    nrodoc character varying(15),
    apellido character varying(100),
    nombre character varying(100),
    fechanac character varying(10),
    mesdesde integer,
    meshasta integer,
    parentesco integer,
    vigenteproxper character varying(1),
    fechalimite character varying(10),
    porcdeduccion integer
);


ALTER TABLE siradig.f572_cargasfamilia OWNER TO postgres;

--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_cargasfamilia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_cargasfamilia_id_seq OWNER TO postgres;

--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_cargasfamilia_id_seq OWNED BY siradig.f572_cargasfamilia.id;


--
-- Name: f572_datadicional; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_datadicional (
    id integer NOT NULL,
    presentacion_id integer,
    nombre character varying(300),
    mesdesde integer,
    meshasta integer,
    valor character varying(100)
);


ALTER TABLE siradig.f572_datadicional OWNER TO postgres;

--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_datadicional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_datadicional_id_seq OWNER TO postgres;

--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_datadicional_id_seq OWNED BY siradig.f572_datadicional.id;


--
-- Name: f572_deducciones; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deducciones (
    id integer NOT NULL,
    presentacion_id integer,
    tipo integer,
    tipodoc integer,
    nrodoc character varying(11),
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_deducciones OWNER TO postgres;

--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deducciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deducciones_id_seq OWNER TO postgres;

--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deducciones_id_seq OWNED BY siradig.f572_deducciones.id;


--
-- Name: f572_deduccionesdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deduccionesdetalle (
    id integer NOT NULL,
    deduccion_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_deduccionesdetalle OWNER TO postgres;

--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deduccionesdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deduccionesdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deduccionesdetalle_id_seq OWNED BY siradig.f572_deduccionesdetalle.id;


--
-- Name: f572_deduccionesperiodo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_deduccionesperiodo (
    id integer NOT NULL,
    deduccion_id integer,
    mesdesde integer,
    meshasta integer,
    montomensual numeric(13,2)
);


ALTER TABLE siradig.f572_deduccionesperiodo OWNER TO postgres;

--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_deduccionesperiodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_deduccionesperiodo_id_seq OWNER TO postgres;

--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_deduccionesperiodo_id_seq OWNED BY siradig.f572_deduccionesperiodo.id;


--
-- Name: f572_otrosempl; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_otrosempl (
    id integer NOT NULL,
    cuit bigint,
    denominacion character varying(100),
    presentacion_id integer
);


ALTER TABLE siradig.f572_otrosempl OWNER TO postgres;

--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_otrosempl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_otrosempl_id_seq OWNER TO postgres;

--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_otrosempl_id_seq OWNED BY siradig.f572_otrosempl.id;


--
-- Name: f572_otrosemplingaporte; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_otrosemplingaporte (
    id integer NOT NULL,
    otrosemp_id integer,
    mes integer,
    obrasoc numeric(13,2),
    segsoc numeric(13,2),
    sind numeric(13,2),
    ganbrut numeric(13,2),
    retgan numeric(13,2),
    retribnohab numeric(13,2),
    ajuste numeric(13,2),
    exenoalc numeric(13,2),
    sac numeric(13,2),
    horasextgr numeric(13,2),
    horasextex numeric(13,2),
    matdid numeric(13,2),
    gastosmovviat numeric(13,2)
);


ALTER TABLE siradig.f572_otrosemplingaporte OWNER TO postgres;

--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_otrosemplingaporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_otrosemplingaporte_id_seq OWNER TO postgres;

--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_otrosemplingaporte_id_seq OWNED BY siradig.f572_otrosemplingaporte.id;


--
-- Name: f572_presentacion; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_presentacion (
    id integer NOT NULL,
    cuit bigint,
    periodo integer,
    envio integer,
    nropresentacion integer,
    fechapresentacion character varying(11),
    emplcuit character varying(11),
    empltipodoc character varying(3),
    emplapellido character varying(100),
    emplnombre character varying(100),
    dirprovincia integer,
    dircp character varying(8),
    dirlocalidad character varying(60),
    dircalle character varying(40),
    dirnro character varying(6),
    dirpiso character varying(5),
    dirdpto character varying(5),
    file_id integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_presentacion OWNER TO postgres;

--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_presentacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_presentacion_id_seq OWNER TO postgres;

--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_presentacion_id_seq OWNED BY siradig.f572_presentacion.id;


--
-- Name: f572_presentacionb; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_presentacionb (
    id integer NOT NULL,
    cuit bigint,
    periodo integer,
    envio integer,
    nropresentacion integer,
    fechapresentacion character varying(11),
    emplcuit character varying(11),
    empltipodoc character varying(3),
    emplapellido character varying(100),
    emplnombre character varying(100),
    dirprovincia integer,
    dircp character varying(8),
    dirlocalidad character varying(60),
    dircalle character varying(40),
    dirnro character varying(6),
    dirpiso character varying(5),
    dirdpto character varying(5),
    agretcuit character varying(11),
    agretdenominacion character varying(200),
    file_id integer,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL
);


ALTER TABLE siradig.f572_presentacionb OWNER TO postgres;

--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_presentacionb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_presentacionb_id_seq OWNER TO postgres;

--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_presentacionb_id_seq OWNED BY siradig.f572_presentacionb.id;


--
-- Name: f572_relacionatributos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_relacionatributos (
    grupo character varying(10) NOT NULL,
    codigoafip character varying(25) NOT NULL,
    descripafip character varying(300),
    atributo character varying(25) DEFAULT ''::character varying NOT NULL,
    atributo_50 character varying(25) DEFAULT ''::character varying NOT NULL,
    porc boolean,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE siradig.f572_relacionatributos OWNER TO postgres;

--
-- Name: f572_relacionatributosgrp; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_relacionatributosgrp (
    obj character varying(7) NOT NULL,
    name character varying(100) NOT NULL,
    orderlist integer NOT NULL,
    property character varying(255),
    active boolean
);


ALTER TABLE siradig.f572_relacionatributosgrp OWNER TO postgres;

--
-- Name: f572_retperpagos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagos (
    id integer NOT NULL,
    presentacion_id integer,
    tipo character varying(2),
    tipodoc integer,
    nrodoc character varying(15),
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_retperpagos OWNER TO postgres;

--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagos_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagos_id_seq OWNED BY siradig.f572_retperpagos.id;


--
-- Name: f572_retperpagosdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagosdetalle (
    id integer NOT NULL,
    retperpago_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_retperpagosdetalle OWNER TO postgres;

--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagosdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagosdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagosdetalle_id_seq OWNED BY siradig.f572_retperpagosdetalle.id;


--
-- Name: f572_retperpagosperiodo; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_retperpagosperiodo (
    id integer NOT NULL,
    retperpago_id integer,
    mesdesde integer,
    meshasta integer,
    montomensual numeric(13,2)
);


ALTER TABLE siradig.f572_retperpagosperiodo OWNER TO postgres;

--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_retperpagosperiodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_retperpagosperiodo_id_seq OWNER TO postgres;

--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_retperpagosperiodo_id_seq OWNED BY siradig.f572_retperpagosperiodo.id;


--
-- Name: f572_sajustes; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_sajustes (
    id integer NOT NULL,
    presentacion_id integer,
    tipo character varying(2),
    cuit bigint,
    denominacion character varying(200),
    descbasica character varying(300),
    descadicional character varying(300),
    montototal numeric(13,2)
);


ALTER TABLE siradig.f572_sajustes OWNER TO postgres;

--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_sajustes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_sajustes_id_seq OWNER TO postgres;

--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_sajustes_id_seq OWNED BY siradig.f572_sajustes.id;


--
-- Name: f572_sajustesdetalle; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_sajustesdetalle (
    id integer NOT NULL,
    ajuste_id integer,
    nombre character varying(300),
    valor character varying(300)
);


ALTER TABLE siradig.f572_sajustesdetalle OWNER TO postgres;

--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_sajustesdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_sajustesdetalle_id_seq OWNER TO postgres;

--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_sajustesdetalle_id_seq OWNED BY siradig.f572_sajustesdetalle.id;


--
-- Name: f572_siradigconceptos; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_siradigconceptos (
    id integer NOT NULL,
    legajo bigint DEFAULT 0 NOT NULL,
    cuit bigint NOT NULL,
    anio integer NOT NULL,
    mes smallint NOT NULL,
    nrover integer NOT NULL,
    atributo character varying(30) NOT NULL,
    valor numeric(10,2),
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone NOT NULL,
    estadoliq character varying(1)
);


ALTER TABLE siradig.f572_siradigconceptos OWNER TO postgres;

--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_siradigconceptos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_siradigconceptos_id_seq OWNER TO postgres;

--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_siradigconceptos_id_seq OWNED BY siradig.f572_siradigconceptos.id;


--
-- Name: f572_siradiglogs; Type: TABLE; Schema: siradig; Owner: postgres
--

CREATE TABLE siradig.f572_siradiglogs (
    id integer NOT NULL,
    fechahora timestamp without time zone NOT NULL,
    tipo character varying(5) NOT NULL,
    descripcion character varying(255),
    referencia character varying(100),
    sessid character varying(100)
);


ALTER TABLE siradig.f572_siradiglogs OWNER TO postgres;

--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE; Schema: siradig; Owner: postgres
--

CREATE SEQUENCE siradig.f572_siradiglogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siradig.f572_siradiglogs_id_seq OWNER TO postgres;

--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE OWNED BY; Schema: siradig; Owner: postgres
--

ALTER SEQUENCE siradig.f572_siradiglogs_id_seq OWNED BY siradig.f572_siradiglogs.id;


--
-- Name: f572_archivos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_archivos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_archivos_id_seq'::regclass);


--
-- Name: f572_cargasfamilia id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia ALTER COLUMN id SET DEFAULT nextval('siradig.f572_cargasfamilia_id_seq'::regclass);


--
-- Name: f572_datadicional id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional ALTER COLUMN id SET DEFAULT nextval('siradig.f572_datadicional_id_seq'::regclass);


--
-- Name: f572_deducciones id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deducciones_id_seq'::regclass);


--
-- Name: f572_deduccionesdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deduccionesdetalle_id_seq'::regclass);


--
-- Name: f572_deduccionesperiodo id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo ALTER COLUMN id SET DEFAULT nextval('siradig.f572_deduccionesperiodo_id_seq'::regclass);


--
-- Name: f572_otrosempl id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl ALTER COLUMN id SET DEFAULT nextval('siradig.f572_otrosempl_id_seq'::regclass);


--
-- Name: f572_otrosemplingaporte id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte ALTER COLUMN id SET DEFAULT nextval('siradig.f572_otrosemplingaporte_id_seq'::regclass);


--
-- Name: f572_presentacion id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacion ALTER COLUMN id SET DEFAULT nextval('siradig.f572_presentacion_id_seq'::regclass);


--
-- Name: f572_presentacionb id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacionb ALTER COLUMN id SET DEFAULT nextval('siradig.f572_presentacionb_id_seq'::regclass);


--
-- Name: f572_retperpagos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagos_id_seq'::regclass);


--
-- Name: f572_retperpagosdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagosdetalle_id_seq'::regclass);


--
-- Name: f572_retperpagosperiodo id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo ALTER COLUMN id SET DEFAULT nextval('siradig.f572_retperpagosperiodo_id_seq'::regclass);


--
-- Name: f572_sajustes id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes ALTER COLUMN id SET DEFAULT nextval('siradig.f572_sajustes_id_seq'::regclass);


--
-- Name: f572_sajustesdetalle id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle ALTER COLUMN id SET DEFAULT nextval('siradig.f572_sajustesdetalle_id_seq'::regclass);


--
-- Name: f572_siradigconceptos id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradigconceptos ALTER COLUMN id SET DEFAULT nextval('siradig.f572_siradigconceptos_id_seq'::regclass);


--
-- Name: f572_siradiglogs id; Type: DEFAULT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradiglogs ALTER COLUMN id SET DEFAULT nextval('siradig.f572_siradiglogs_id_seq'::regclass);


--
-- Data for Name: extra_cargo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.extra_cargo (anio, mes, nro_legajo, nro_cargo, extraccion, fecha_ingreso, fecha_egreso, planta_personal, id_convenio) FROM stdin;
\.


--
-- Data for Name: extra_siradig; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.extra_siradig (legajo, cuit, anio, mes, nrover, atributo, valoracum, createdat, updatedat, estadoliq) FROM stdin;
\.


--
-- Data for Name: f572_archivos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_archivos (id, filename, periodo, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: f572_cargasfamilia; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_cargasfamilia (id, presentacion_id, tipodoc, nrodoc, apellido, nombre, fechanac, mesdesde, meshasta, parentesco, vigenteproxper, fechalimite, porcdeduccion) FROM stdin;
\.


--
-- Data for Name: f572_datadicional; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_datadicional (id, presentacion_id, nombre, mesdesde, meshasta, valor) FROM stdin;
\.


--
-- Data for Name: f572_deducciones; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deducciones (id, presentacion_id, tipo, tipodoc, nrodoc, denominacion, descbasica, descadicional, montototal) FROM stdin;
\.


--
-- Data for Name: f572_deduccionesdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deduccionesdetalle (id, deduccion_id, nombre, valor) FROM stdin;
\.


--
-- Data for Name: f572_deduccionesperiodo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_deduccionesperiodo (id, deduccion_id, mesdesde, meshasta, montomensual) FROM stdin;
\.


--
-- Data for Name: f572_otrosempl; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_otrosempl (id, cuit, denominacion, presentacion_id) FROM stdin;
\.


--
-- Data for Name: f572_otrosemplingaporte; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_otrosemplingaporte (id, otrosemp_id, mes, obrasoc, segsoc, sind, ganbrut, retgan, retribnohab, ajuste, exenoalc, sac, horasextgr, horasextex, matdid, gastosmovviat) FROM stdin;
\.


--
-- Data for Name: f572_presentacion; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_presentacion (id, cuit, periodo, envio, nropresentacion, fechapresentacion, emplcuit, empltipodoc, emplapellido, emplnombre, dirprovincia, dircp, dirlocalidad, dircalle, dirnro, dirpiso, dirdpto, file_id, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: f572_presentacionb; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_presentacionb (id, cuit, periodo, envio, nropresentacion, fechapresentacion, emplcuit, empltipodoc, emplapellido, emplnombre, dirprovincia, dircp, dirlocalidad, dircalle, dirnro, dirpiso, dirdpto, agretcuit, agretdenominacion, file_id, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: f572_relacionatributos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_relacionatributos (grupo, codigoafip, descripafip, atributo, atributo_50, porc, active) FROM stdin;
\.


--
-- Data for Name: f572_relacionatributosgrp; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_relacionatributosgrp (obj, name, orderlist, property, active) FROM stdin;
\.


--
-- Data for Name: f572_retperpagos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagos (id, presentacion_id, tipo, tipodoc, nrodoc, denominacion, descbasica, descadicional, montototal) FROM stdin;
\.


--
-- Data for Name: f572_retperpagosdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagosdetalle (id, retperpago_id, nombre, valor) FROM stdin;
\.


--
-- Data for Name: f572_retperpagosperiodo; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_retperpagosperiodo (id, retperpago_id, mesdesde, meshasta, montomensual) FROM stdin;
\.


--
-- Data for Name: f572_sajustes; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_sajustes (id, presentacion_id, tipo, cuit, denominacion, descbasica, descadicional, montototal) FROM stdin;
\.


--
-- Data for Name: f572_sajustesdetalle; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_sajustesdetalle (id, ajuste_id, nombre, valor) FROM stdin;
\.


--
-- Data for Name: f572_siradigconceptos; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_siradigconceptos (id, legajo, cuit, anio, mes, nrover, atributo, valor, createdat, updatedat, estadoliq) FROM stdin;
\.


--
-- Data for Name: f572_siradiglogs; Type: TABLE DATA; Schema: siradig; Owner: postgres
--

COPY siradig.f572_siradiglogs (id, fechahora, tipo, descripcion, referencia, sessid) FROM stdin;
\.


--
-- Name: f572_archivos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_archivos_id_seq', 1, false);


--
-- Name: f572_cargasfamilia_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_cargasfamilia_id_seq', 1, false);


--
-- Name: f572_datadicional_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_datadicional_id_seq', 1, false);


--
-- Name: f572_deducciones_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deducciones_id_seq', 1, false);


--
-- Name: f572_deduccionesdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deduccionesdetalle_id_seq', 1, false);


--
-- Name: f572_deduccionesperiodo_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_deduccionesperiodo_id_seq', 1, false);


--
-- Name: f572_otrosempl_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_otrosempl_id_seq', 1, false);


--
-- Name: f572_otrosemplingaporte_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_otrosemplingaporte_id_seq', 1, false);


--
-- Name: f572_presentacion_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_presentacion_id_seq', 1, false);


--
-- Name: f572_presentacionb_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_presentacionb_id_seq', 1, false);


--
-- Name: f572_retperpagos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagos_id_seq', 1, false);


--
-- Name: f572_retperpagosdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagosdetalle_id_seq', 1, false);


--
-- Name: f572_retperpagosperiodo_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_retperpagosperiodo_id_seq', 1, false);


--
-- Name: f572_sajustes_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_sajustes_id_seq', 1, false);


--
-- Name: f572_sajustesdetalle_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_sajustesdetalle_id_seq', 1, false);


--
-- Name: f572_siradigconceptos_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_siradigconceptos_id_seq', 1, false);


--
-- Name: f572_siradiglogs_id_seq; Type: SEQUENCE SET; Schema: siradig; Owner: postgres
--

SELECT pg_catalog.setval('siradig.f572_siradiglogs_id_seq', 1, false);


--
-- Name: extra_cargo extra_cargo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.extra_cargo
    ADD CONSTRAINT extra_cargo_pkey PRIMARY KEY (anio, mes, nro_legajo, nro_cargo);


--
-- Name: extra_siradig extra_siradig_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.extra_siradig
    ADD CONSTRAINT extra_siradig_pkey PRIMARY KEY (legajo, anio, mes, nrover, atributo);


--
-- Name: f572_archivos f572_archivos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_archivos
    ADD CONSTRAINT f572_archivos_pkey PRIMARY KEY (id);


--
-- Name: f572_cargasfamilia f572_cargasfamilia_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia
    ADD CONSTRAINT f572_cargasfamilia_pkey PRIMARY KEY (id);


--
-- Name: f572_datadicional f572_datadicional_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional
    ADD CONSTRAINT f572_datadicional_pkey PRIMARY KEY (id);


--
-- Name: f572_deducciones f572_deducciones_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones
    ADD CONSTRAINT f572_deducciones_pkey PRIMARY KEY (id);


--
-- Name: f572_deduccionesdetalle f572_deduccionesdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle
    ADD CONSTRAINT f572_deduccionesdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_deduccionesperiodo f572_deduccionesperiodo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo
    ADD CONSTRAINT f572_deduccionesperiodo_pkey PRIMARY KEY (id);


--
-- Name: f572_otrosempl f572_otrosempl_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl
    ADD CONSTRAINT f572_otrosempl_pkey PRIMARY KEY (id);


--
-- Name: f572_otrosemplingaporte f572_otrosemplingaporte_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte
    ADD CONSTRAINT f572_otrosemplingaporte_pkey PRIMARY KEY (id);


--
-- Name: f572_presentacion f572_presentacion_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacion
    ADD CONSTRAINT f572_presentacion_pkey PRIMARY KEY (id);


--
-- Name: f572_presentacionb f572_presentacionb_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_presentacionb
    ADD CONSTRAINT f572_presentacionb_pkey PRIMARY KEY (id);


--
-- Name: f572_relacionatributos f572_relacionatributos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_relacionatributos
    ADD CONSTRAINT f572_relacionatributos_pkey PRIMARY KEY (grupo, codigoafip);


--
-- Name: f572_relacionatributosgrp f572_relacionatributosgrp_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_relacionatributosgrp
    ADD CONSTRAINT f572_relacionatributosgrp_pkey PRIMARY KEY (obj);


--
-- Name: f572_retperpagos f572_retperpagos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos
    ADD CONSTRAINT f572_retperpagos_pkey PRIMARY KEY (id);


--
-- Name: f572_retperpagosdetalle f572_retperpagosdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle
    ADD CONSTRAINT f572_retperpagosdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_retperpagosperiodo f572_retperpagosperiodo_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo
    ADD CONSTRAINT f572_retperpagosperiodo_pkey PRIMARY KEY (id);


--
-- Name: f572_sajustes f572_sajustes_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes
    ADD CONSTRAINT f572_sajustes_pkey PRIMARY KEY (id);


--
-- Name: f572_sajustesdetalle f572_sajustesdetalle_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle
    ADD CONSTRAINT f572_sajustesdetalle_pkey PRIMARY KEY (id);


--
-- Name: f572_siradigconceptos f572_siradigconceptos_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradigconceptos
    ADD CONSTRAINT f572_siradigconceptos_pkey PRIMARY KEY (id);


--
-- Name: f572_siradiglogs f572_siradiglogs_pkey; Type: CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_siradiglogs
    ADD CONSTRAINT f572_siradiglogs_pkey PRIMARY KEY (id);


--
-- Name: f572_cargasfamilia fk_siradig_f572_cargasfamilia_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_cargasfamilia
    ADD CONSTRAINT fk_siradig_f572_cargasfamilia_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_datadicional fk_siradig_f572_datadicional_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_datadicional
    ADD CONSTRAINT fk_siradig_f572_datadicional_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_deducciones fk_siradig_f572_deducciones_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deducciones
    ADD CONSTRAINT fk_siradig_f572_deducciones_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_deduccionesdetalle fk_siradig_f572_deduccionesdetalle_f572_deducciones1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesdetalle
    ADD CONSTRAINT fk_siradig_f572_deduccionesdetalle_f572_deducciones1 FOREIGN KEY (deduccion_id) REFERENCES siradig.f572_deducciones(id);


--
-- Name: f572_deduccionesperiodo fk_siradig_f572_deduccionesperiodo_f572_deducciones1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_deduccionesperiodo
    ADD CONSTRAINT fk_siradig_f572_deduccionesperiodo_f572_deducciones1 FOREIGN KEY (deduccion_id) REFERENCES siradig.f572_deducciones(id);


--
-- Name: f572_otrosempl fk_siradig_f572_otrosempl_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosempl
    ADD CONSTRAINT fk_siradig_f572_otrosempl_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_otrosemplingaporte fk_siradig_f572_otrosemplingaporte_f572_otrosempl1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_otrosemplingaporte
    ADD CONSTRAINT fk_siradig_f572_otrosemplingaporte_f572_otrosempl1 FOREIGN KEY (otrosemp_id) REFERENCES siradig.f572_otrosempl(id);


--
-- Name: f572_retperpagos fk_siradig_f572_retperpagos_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagos
    ADD CONSTRAINT fk_siradig_f572_retperpagos_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_retperpagosdetalle fk_siradig_f572_retperpagosdetalle_f572_retperpagos1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosdetalle
    ADD CONSTRAINT fk_siradig_f572_retperpagosdetalle_f572_retperpagos1 FOREIGN KEY (retperpago_id) REFERENCES siradig.f572_retperpagos(id);


--
-- Name: f572_retperpagosperiodo fk_siradig_f572_retperpagosperiodo_f572_retperpagos1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_retperpagosperiodo
    ADD CONSTRAINT fk_siradig_f572_retperpagosperiodo_f572_retperpagos1 FOREIGN KEY (retperpago_id) REFERENCES siradig.f572_retperpagos(id);


--
-- Name: f572_sajustes fk_siradig_f572_sajustes_f572_presentacion1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustes
    ADD CONSTRAINT fk_siradig_f572_sajustes_f572_presentacion1 FOREIGN KEY (presentacion_id) REFERENCES siradig.f572_presentacion(id);


--
-- Name: f572_sajustesdetalle fk_siradig_f572_sajustesdetalle_f572_sajustes1; Type: FK CONSTRAINT; Schema: siradig; Owner: postgres
--

ALTER TABLE ONLY siradig.f572_sajustesdetalle
    ADD CONSTRAINT fk_siradig_f572_sajustesdetalle_f572_sajustes1 FOREIGN KEY (ajuste_id) REFERENCES siradig.f572_sajustes(id);


--
-- PostgreSQL database dump complete
--

