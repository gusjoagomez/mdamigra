--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-1.pgdg110+1)
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
-- Name: siradig; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA siradig;


ALTER SCHEMA siradig OWNER TO admin;

--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: blackListTokenSeq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."blackListTokenSeq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."blackListTokenSeq" OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blackListToken; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."blackListToken" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer DEFAULT nextval('public."blackListTokenSeq"'::regclass) NOT NULL,
    token character varying(500) NOT NULL,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."blackListToken" OWNER TO admin;

--
-- Name: concepto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.concepto (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    cod_concepto integer,
    fecha_desde timestamp without time zone,
    fecha_hasta timestamp without time zone,
    desc_conce character varying(50),
    desc_corta character varying(20),
    legajo_cargo character varying(2),
    imprime_cero integer,
    id_tipo_concepto integer,
    id_ganancias integer,
    id_concepto_cant integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.concepto OWNER TO admin;

--
-- Name: concepto_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.concepto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concepto_id_seq OWNER TO admin;

--
-- Name: concepto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.concepto_id_seq OWNED BY public.concepto.id;


--
-- Name: conceptos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.conceptos (
    activado boolean,
    "creadoEn" timestamp with time zone,
    "modificadoEn" timestamp with time zone,
    "elminadoEn" timestamp with time zone,
    "activadoEn" timestamp with time zone,
    id integer NOT NULL,
    cod_concepto integer NOT NULL,
    fecha_desde timestamp with time zone NOT NULL,
    fecha_hasta timestamp with time zone,
    desc_conce text NOT NULL,
    desc_corta text NOT NULL,
    id_tipo_concepto integer NOT NULL,
    id_ganancias integer NOT NULL,
    legajo_cargo text NOT NULL,
    id_concepto_cant bigint,
    imprime_cero bigint NOT NULL,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.conceptos OWNER TO admin;

--
-- Name: conceptos_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.conceptos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conceptos_id_seq OWNER TO admin;

--
-- Name: conceptos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.conceptos_id_seq OWNED BY public.conceptos.id;


--
-- Name: detalleMatriz; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."detalleMatriz" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    rango double precision,
    "retornaA" numeric(12,2),
    "retornaB" numeric(12,2),
    "matrizId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."detalleMatriz" OWNER TO admin;

--
-- Name: detalleMatriz_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."detalleMatriz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."detalleMatriz_id_seq" OWNER TO admin;

--
-- Name: detalleMatriz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."detalleMatriz_id_seq" OWNED BY public."detalleMatriz".id;


--
-- Name: formula; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.formula (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "codigoFormula" integer,
    descripcion character varying(50),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.formula OWNER TO admin;

--
-- Name: formula_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.formula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formula_id_seq OWNER TO admin;

--
-- Name: formula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.formula_id_seq OWNED BY public.formula.id;


--
-- Name: general; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.general (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "grupoId" integer,
    "dependeId" integer,
    nombre character varying(250) NOT NULL,
    "nombreAbreviado" character varying(250),
    "auxCadena1" character varying(250),
    "auxCadena2" character varying(4000),
    "auxEntero1" integer,
    "auxEntero2" integer,
    "auxFecha1" timestamp without time zone,
    "auxFecha2" timestamp without time zone,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.general OWNER TO admin;

--
-- Name: general_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.general_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_id_seq OWNER TO admin;

--
-- Name: general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.general_id_seq OWNED BY public.general.id;


--
-- Name: grupo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.grupo (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    grupo character varying(250) NOT NULL,
    "auxCadena1" character varying(250),
    "auxCadena2" character varying(250),
    "auxEntero1" character varying(250),
    "auxEntero2" character varying(250),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.grupo OWNER TO admin;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO admin;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- Name: liqui_cons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.liqui_cons (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    liqui_id bigint,
    nro_legajo integer,
    nro_cargo integer,
    anio_liqui integer,
    anio_dev integer,
    mes_dev integer,
    fecha_desde timestamp with time zone,
    concepto_id bigint,
    cantidad text,
    imp_unit text,
    imp_item text,
    tipo_concepto bigint,
    tipo_conc_gan bigint
);


ALTER TABLE public.liqui_cons OWNER TO admin;

--
-- Name: liqui_cons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.liqui_cons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liqui_cons_id_seq OWNER TO admin;

--
-- Name: liqui_cons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.liqui_cons_id_seq OWNED BY public.liqui_cons.id;


--
-- Name: liquis; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.liquis (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id_agr bigint,
    id_plaper integer,
    id_gruper integer,
    anio_liq integer,
    mes_liq integer,
    anio_dev integer,
    mes_dev integer,
    anio_gan integer,
    mes_gan integer,
    tipo_liq text,
    stipo_liq smallint,
    fecha_pago timestamp with time zone,
    descripcion text,
    anulacion text,
    fecha_liq text,
    id_estado smallint,
    nro_legajo_desde integer,
    nro_legajo_hasta integer,
    fec_ini_proc timestamp with time zone,
    fec_fin_proc timestamp with time zone
);


ALTER TABLE public.liquis OWNER TO admin;

--
-- Name: liquis_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.liquis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liquis_id_seq OWNER TO admin;

--
-- Name: liquis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.liquis_id_seq OWNED BY public.liquis.id;


--
-- Name: matriz; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.matriz (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    descripcion character varying(250),
    "retornaA" character varying(250),
    "retornaB" character varying(250),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.matriz OWNER TO admin;

--
-- Name: matriz_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.matriz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matriz_id_seq OWNER TO admin;

--
-- Name: matriz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.matriz_id_seq OWNED BY public.matriz.id;


--
-- Name: nodo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.nodo (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "operadorId" integer,
    parametros character varying(100),
    "formulaId" integer,
    "versionId" integer,
    "terminoId" integer,
    "codigoSubFormulaId" integer,
    "tipoTerminoId" integer,
    "tipoNodoId" integer,
    "funcionId" integer,
    "nodoPadreId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.nodo OWNER TO admin;

--
-- Name: nodo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.nodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodo_id_seq OWNER TO admin;

--
-- Name: nodo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.nodo_id_seq OWNED BY public.nodo.id;


--
-- Name: seguridadGrupoSeq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."seguridadGrupoSeq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seguridadGrupoSeq" OWNER TO admin;

--
-- Name: seguridadGrupo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadGrupo" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer DEFAULT nextval('public."seguridadGrupoSeq"'::regclass) NOT NULL,
    nombre character varying(250) NOT NULL,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."seguridadGrupo" OWNER TO admin;

--
-- Name: seguridadGrupoPermiso; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadGrupoPermiso" (
    "grupoId" integer,
    "permisoId" integer
);


ALTER TABLE public."seguridadGrupoPermiso" OWNER TO admin;

--
-- Name: seguridadPermisoSeq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."seguridadPermisoSeq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seguridadPermisoSeq" OWNER TO admin;

--
-- Name: seguridadPermiso; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadPermiso" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer DEFAULT nextval('public."seguridadPermisoSeq"'::regclass) NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion character varying(250),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."seguridadPermiso" OWNER TO admin;

--
-- Name: seguridadRolSeq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."seguridadRolSeq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seguridadRolSeq" OWNER TO admin;

--
-- Name: seguridadRol; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadRol" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer DEFAULT nextval('public."seguridadRolSeq"'::regclass) NOT NULL,
    nombre character varying(250) NOT NULL,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."seguridadRol" OWNER TO admin;

--
-- Name: seguridadRolPermiso; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadRolPermiso" (
    "rolId" integer,
    "permisoId" integer
);


ALTER TABLE public."seguridadRolPermiso" OWNER TO admin;

--
-- Name: seguridadUsuarioSeq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."seguridadUsuarioSeq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."seguridadUsuarioSeq" OWNER TO admin;

--
-- Name: seguridadUsuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadUsuario" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer DEFAULT nextval('public."seguridadUsuarioSeq"'::regclass) NOT NULL,
    username character varying(250) NOT NULL,
    email character varying(250),
    nombre character varying(250),
    apellido character varying(250),
    password character varying(250),
    token character varying(250),
    "tokenTrimu" character varying(250),
    opciones character varying(1000),
    "cambiarPassword" boolean,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."seguridadUsuario" OWNER TO admin;

--
-- Name: seguridadUsuarioGrupo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadUsuarioGrupo" (
    "usuarioId" integer,
    "grupoId" integer
);


ALTER TABLE public."seguridadUsuarioGrupo" OWNER TO admin;

--
-- Name: seguridadUsuarioPermiso; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadUsuarioPermiso" (
    "usuarioId" integer,
    "permisoId" integer
);


ALTER TABLE public."seguridadUsuarioPermiso" OWNER TO admin;

--
-- Name: seguridadUsuarioRol; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."seguridadUsuarioRol" (
    "usuarioId" integer,
    "rolId" integer
);


ALTER TABLE public."seguridadUsuarioRol" OWNER TO admin;

--
-- Name: tablaAuxiliar; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."tablaAuxiliar" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "codigoString" character varying(250),
    "codigoInt" character varying(40),
    descripcion character varying(40),
    numerico1 character varying(40),
    numerico2 character varying(40),
    numerico3 character varying(40),
    numerico4 character varying(40),
    numerico5 character varying(40),
    numerico6 character varying(40),
    numerico7 character varying(40),
    numerico8 character varying(40),
    numerico9 character varying(40),
    numerico10 character varying(40),
    caracter1 character varying(20),
    caracter2 character varying(20),
    caracter3 character varying(20),
    descripcion1 character varying(20),
    descripcion2 character varying(20),
    descripcion3 character varying(20),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."tablaAuxiliar" OWNER TO admin;

--
-- Name: tablaAuxiliarDetalle; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."tablaAuxiliarDetalle" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "tablaAuxiliarId" integer,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    "codigoString" character varying(250),
    "codigoInt" integer,
    descripcion character varying(50),
    numerico1 numeric(12,2),
    numerico2 numeric(12,2),
    numerico3 numeric(12,2),
    numerico4 numeric(12,2),
    numerico5 numeric(12,2),
    numerico6 numeric(12,2),
    numerico7 numeric(12,2),
    numerico8 numeric(12,2),
    numerico9 numeric(12,2),
    numerico10 numeric(12,2),
    caracter1 character varying(20),
    caracter2 character varying(20),
    caracter3 character varying(20),
    descripcion1 character varying(20),
    descripcion2 character varying(20),
    descripcion3 character varying(20),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."tablaAuxiliarDetalle" OWNER TO admin;

--
-- Name: tablaAuxiliarDetalleOLD; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."tablaAuxiliarDetalleOLD" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "tablaAuxiliarId" integer,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    "codigoString" character varying(250),
    "codigoInt" integer,
    descripcion character varying(50),
    numerico1 double precision,
    numerico2 double precision,
    numerico3 double precision,
    numerico4 double precision,
    numerico5 double precision,
    numerico6 double precision,
    numerico7 double precision,
    numerico8 double precision,
    numerico9 double precision,
    numerico10 double precision,
    caracter1 character varying(20),
    caracter2 character varying(20),
    caracter3 character varying(20),
    descripcion1 character varying(20),
    descripcion2 character varying(20),
    descripcion3 character varying(20),
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."tablaAuxiliarDetalleOLD" OWNER TO admin;

--
-- Name: tablaAuxiliarDetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."tablaAuxiliarDetalle_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tablaAuxiliarDetalle_id_seq" OWNER TO admin;

--
-- Name: tablaAuxiliarDetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."tablaAuxiliarDetalle_id_seq" OWNED BY public."tablaAuxiliarDetalleOLD".id;


--
-- Name: tablaAuxiliar_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."tablaAuxiliar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tablaAuxiliar_id_seq" OWNER TO admin;

--
-- Name: tablaAuxiliar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."tablaAuxiliar_id_seq" OWNED BY public."tablaAuxiliar".id;


--
-- Name: tablaauxiliardetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tablaauxiliardetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablaauxiliardetalle_id_seq OWNER TO admin;

--
-- Name: tablaauxiliardetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tablaauxiliardetalle_id_seq OWNED BY public."tablaAuxiliarDetalle".id;


--
-- Name: termino; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.termino (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    descripcion character varying(50),
    nombre character varying(20),
    "tipoTerminoId" integer,
    "esPlaceholder" boolean,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.termino OWNER TO admin;

--
-- Name: terminoAcumuladorConcepto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAcumuladorConcepto" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "relativoAbsolutoId" integer,
    "periodoId" integer,
    "cargoLegajoId" integer,
    "operacionId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer,
    "baseCalculoId" integer,
    "mesDesde" integer,
    "mesHasta" integer,
    "agregacionId" integer
);


ALTER TABLE public."terminoAcumuladorConcepto" OWNER TO admin;

--
-- Name: terminoAcumuladorConceptoConcepto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAcumuladorConceptoConcepto" (
    "terminoAcumuladorConceptoId" integer,
    "conceptoId" integer
);


ALTER TABLE public."terminoAcumuladorConceptoConcepto" OWNER TO admin;

--
-- Name: terminoAcumuladorConcepto_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAcumuladorConcepto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAcumuladorConcepto_id_seq" OWNER TO admin;

--
-- Name: terminoAcumuladorConcepto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAcumuladorConcepto_id_seq" OWNED BY public."terminoAcumuladorConcepto".id;


--
-- Name: terminoAcumuladorFormula; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAcumuladorFormula" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "relativoAbsolutoId" integer,
    "periodoId" integer,
    "cargoLegajoId" integer,
    "operacionId" integer,
    "formulaId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer,
    "baseCalculoId" integer,
    "mesDesde" integer,
    "mesHasta" integer,
    "agregacionId" integer
);


ALTER TABLE public."terminoAcumuladorFormula" OWNER TO admin;

--
-- Name: terminoAcumuladorFormula_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAcumuladorFormula_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAcumuladorFormula_id_seq" OWNER TO admin;

--
-- Name: terminoAcumuladorFormula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAcumuladorFormula_id_seq" OWNED BY public."terminoAcumuladorFormula".id;


--
-- Name: terminoAcumuladorTipoCon; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAcumuladorTipoCon" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "tipoConceptoId" integer,
    "relativoAbsolutoId" integer,
    "periodoId" integer,
    "cargoLegajoId" integer,
    "operacionId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer,
    "baseCalculoId" integer,
    "mesDesde" integer,
    "mesHasta" integer,
    "agregacionId" integer
);


ALTER TABLE public."terminoAcumuladorTipoCon" OWNER TO admin;

--
-- Name: terminoAcumuladorTipoConGanancia; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAcumuladorTipoConGanancia" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "tipoGananciaId" integer,
    "relativoAbsolutoId" integer,
    "periodoId" integer,
    "cargoLegajoId" integer,
    "operacionId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer,
    "baseCalculoId" integer,
    "mesDesde" integer,
    "mesHasta" integer,
    "agregacionId" integer
);


ALTER TABLE public."terminoAcumuladorTipoConGanancia" OWNER TO admin;

--
-- Name: terminoAcumuladorTipoConGanancia_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAcumuladorTipoConGanancia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAcumuladorTipoConGanancia_id_seq" OWNER TO admin;

--
-- Name: terminoAcumuladorTipoConGanancia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAcumuladorTipoConGanancia_id_seq" OWNED BY public."terminoAcumuladorTipoConGanancia".id;


--
-- Name: terminoAcumuladorTipoCon_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAcumuladorTipoCon_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAcumuladorTipoCon_id_seq" OWNER TO admin;

--
-- Name: terminoAcumuladorTipoCon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAcumuladorTipoCon_id_seq" OWNED BY public."terminoAcumuladorTipoCon".id;


--
-- Name: terminoAtributo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAtributo" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "entidadId" integer,
    "atributoId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoAtributo" OWNER TO admin;

--
-- Name: terminoAtributo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAtributo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAtributo_id_seq" OWNER TO admin;

--
-- Name: terminoAtributo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAtributo_id_seq" OWNED BY public."terminoAtributo".id;


--
-- Name: terminoAuxiliar; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoAuxiliar" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    campo character varying(40),
    "tablaAuxiliarId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoAuxiliar" OWNER TO admin;

--
-- Name: terminoAuxiliar_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoAuxiliar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoAuxiliar_id_seq" OWNER TO admin;

--
-- Name: terminoAuxiliar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoAuxiliar_id_seq" OWNED BY public."terminoAuxiliar".id;


--
-- Name: terminoConcepto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoConcepto" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "conceptoCodigo" integer,
    "atributoId" integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoConcepto" OWNER TO admin;

--
-- Name: terminoConcepto_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoConcepto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoConcepto_id_seq" OWNER TO admin;

--
-- Name: terminoConcepto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoConcepto_id_seq" OWNED BY public."terminoConcepto".id;


--
-- Name: terminoConstanteChar; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoConstanteChar" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    valor character varying(20),
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoConstanteChar" OWNER TO admin;

--
-- Name: terminoConstanteChar_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoConstanteChar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoConstanteChar_id_seq" OWNER TO admin;

--
-- Name: terminoConstanteChar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoConstanteChar_id_seq" OWNED BY public."terminoConstanteChar".id;


--
-- Name: terminoConstanteDate; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoConstanteDate" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    valor timestamp without time zone,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoConstanteDate" OWNER TO admin;

--
-- Name: terminoConstanteDate_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoConstanteDate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoConstanteDate_id_seq" OWNER TO admin;

--
-- Name: terminoConstanteDate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoConstanteDate_id_seq" OWNED BY public."terminoConstanteDate".id;


--
-- Name: terminoConstanteFloat; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoConstanteFloat" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    valor numeric(12,2),
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoConstanteFloat" OWNER TO admin;

--
-- Name: terminoConstanteFloat_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoConstanteFloat_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoConstanteFloat_id_seq" OWNER TO admin;

--
-- Name: terminoConstanteFloat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoConstanteFloat_id_seq" OWNED BY public."terminoConstanteFloat".id;


--
-- Name: terminoConstanteInt; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoConstanteInt" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    valor integer,
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoConstanteInt" OWNER TO admin;

--
-- Name: terminoConstanteInt_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoConstanteInt_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoConstanteInt_id_seq" OWNER TO admin;

--
-- Name: terminoConstanteInt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoConstanteInt_id_seq" OWNED BY public."terminoConstanteInt".id;


--
-- Name: terminoMatriz; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoMatriz" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "terminoId" integer,
    retorna character varying(250),
    "matrizId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoMatriz" OWNER TO admin;

--
-- Name: terminoMatriz_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoMatriz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoMatriz_id_seq" OWNER TO admin;

--
-- Name: terminoMatriz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoMatriz_id_seq" OWNED BY public."terminoMatriz".id;


--
-- Name: terminoVariable; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."terminoVariable" (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    variable character varying(20),
    "terminoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public."terminoVariable" OWNER TO admin;

--
-- Name: terminoVariable_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."terminoVariable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."terminoVariable_id_seq" OWNER TO admin;

--
-- Name: terminoVariable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."terminoVariable_id_seq" OWNED BY public."terminoVariable".id;


--
-- Name: termino_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.termino_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.termino_id_seq OWNER TO admin;

--
-- Name: termino_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.termino_id_seq OWNED BY public.termino.id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.version (
    activado boolean,
    "creadoEn" timestamp without time zone NOT NULL,
    "modificadoEn" timestamp without time zone,
    "eliminadoEn" timestamp without time zone,
    "activadoEn" timestamp without time zone,
    id integer NOT NULL,
    "formulaId" integer,
    "fechaDesde" timestamp without time zone,
    "fechaHasta" timestamp without time zone,
    descripcion character varying(50),
    numero integer,
    "estadoId" integer,
    "creadoPorId" integer,
    "modificadoPorId" integer,
    "eliminadoPorId" integer,
    "activadoPorId" integer
);


ALTER TABLE public.version OWNER TO admin;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_id_seq OWNER TO admin;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.version_id_seq OWNED BY public.version.id;


--
-- Name: concepto id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto ALTER COLUMN id SET DEFAULT nextval('public.concepto_id_seq'::regclass);


--
-- Name: conceptos id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.conceptos ALTER COLUMN id SET DEFAULT nextval('public.conceptos_id_seq'::regclass);


--
-- Name: detalleMatriz id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz" ALTER COLUMN id SET DEFAULT nextval('public."detalleMatriz_id_seq"'::regclass);


--
-- Name: formula id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula ALTER COLUMN id SET DEFAULT nextval('public.formula_id_seq'::regclass);


--
-- Name: general id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general ALTER COLUMN id SET DEFAULT nextval('public.general_id_seq'::regclass);


--
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- Name: liqui_cons id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liqui_cons ALTER COLUMN id SET DEFAULT nextval('public.liqui_cons_id_seq'::regclass);


--
-- Name: liquis id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liquis ALTER COLUMN id SET DEFAULT nextval('public.liquis_id_seq'::regclass);


--
-- Name: matriz id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz ALTER COLUMN id SET DEFAULT nextval('public.matriz_id_seq'::regclass);


--
-- Name: nodo id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo ALTER COLUMN id SET DEFAULT nextval('public.nodo_id_seq'::regclass);


--
-- Name: tablaAuxiliar id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar" ALTER COLUMN id SET DEFAULT nextval('public."tablaAuxiliar_id_seq"'::regclass);


--
-- Name: tablaAuxiliarDetalle id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalle" ALTER COLUMN id SET DEFAULT nextval('public.tablaauxiliardetalle_id_seq'::regclass);


--
-- Name: tablaAuxiliarDetalleOLD id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD" ALTER COLUMN id SET DEFAULT nextval('public."tablaAuxiliarDetalle_id_seq"'::regclass);


--
-- Name: termino id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino ALTER COLUMN id SET DEFAULT nextval('public.termino_id_seq'::regclass);


--
-- Name: terminoAcumuladorConcepto id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto" ALTER COLUMN id SET DEFAULT nextval('public."terminoAcumuladorConcepto_id_seq"'::regclass);


--
-- Name: terminoAcumuladorFormula id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula" ALTER COLUMN id SET DEFAULT nextval('public."terminoAcumuladorFormula_id_seq"'::regclass);


--
-- Name: terminoAcumuladorTipoCon id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon" ALTER COLUMN id SET DEFAULT nextval('public."terminoAcumuladorTipoCon_id_seq"'::regclass);


--
-- Name: terminoAcumuladorTipoConGanancia id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia" ALTER COLUMN id SET DEFAULT nextval('public."terminoAcumuladorTipoConGanancia_id_seq"'::regclass);


--
-- Name: terminoAtributo id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo" ALTER COLUMN id SET DEFAULT nextval('public."terminoAtributo_id_seq"'::regclass);


--
-- Name: terminoAuxiliar id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar" ALTER COLUMN id SET DEFAULT nextval('public."terminoAuxiliar_id_seq"'::regclass);


--
-- Name: terminoConcepto id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto" ALTER COLUMN id SET DEFAULT nextval('public."terminoConcepto_id_seq"'::regclass);


--
-- Name: terminoConstanteChar id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar" ALTER COLUMN id SET DEFAULT nextval('public."terminoConstanteChar_id_seq"'::regclass);


--
-- Name: terminoConstanteDate id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate" ALTER COLUMN id SET DEFAULT nextval('public."terminoConstanteDate_id_seq"'::regclass);


--
-- Name: terminoConstanteFloat id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat" ALTER COLUMN id SET DEFAULT nextval('public."terminoConstanteFloat_id_seq"'::regclass);


--
-- Name: terminoConstanteInt id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt" ALTER COLUMN id SET DEFAULT nextval('public."terminoConstanteInt_id_seq"'::regclass);


--
-- Name: terminoMatriz id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz" ALTER COLUMN id SET DEFAULT nextval('public."terminoMatriz_id_seq"'::regclass);


--
-- Name: terminoVariable id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable" ALTER COLUMN id SET DEFAULT nextval('public."terminoVariable_id_seq"'::regclass);


--
-- Name: version id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version ALTER COLUMN id SET DEFAULT nextval('public.version_id_seq'::regclass);


--
-- Data for Name: blackListToken; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."blackListToken" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, token, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
\.


--
-- Data for Name: concepto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.concepto (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, cod_concepto, fecha_desde, fecha_hasta, desc_conce, desc_corta, legajo_cargo, imprime_cero, id_tipo_concepto, id_ganancias, id_concepto_cant, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-12-06 11:58:32.691726	\N	\N	2022-12-06 11:58:32.689784	1	999999	2022-12-01 00:00:00	\N	prueba	prueba	L	0	39	37	\N	-1	\N	\N	-1
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	175	980	2000-01-01 00:00:00	\N	IMP. A LAS GANANCIAS	IMP. A LAS GANANCIAS	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	176	329	2000-01-01 00:00:00	\N	BON.JORNADA PROLONG.	BON.JORNADA PROLONG.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	177	325	2000-01-01 00:00:00	\N	SEXTA JORNADA       	SEXTA JORNADA       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	178	486	2000-01-01 00:00:00	\N	CUOTA MUTUAL        	CUOTA MUTUAL        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	179	441	2000-01-01 00:00:00	\N	OBRA SOCIAL         	OBRA SOCIAL         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	180	43	2000-01-01 00:00:00	\N	PREMIO BARRIDO      	PREMIO BARRIDO      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	181	102	2000-01-01 00:00:00	\N	HORA CATEDRA        	HORA CATEDRA        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	182	173	2000-01-01 00:00:00	\N	CONECTIVIDAD NACIONA	CONECTIVIDAD NACIONA	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	183	41	2000-01-01 00:00:00	\N	PREMIO MANTENIMIENTO	PREMIO MANTENIMIENTO	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	184	400	2000-01-01 00:00:00	\N	AMEPORT AFIL.       	AMEPORT AFIL.       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	185	451	2000-01-01 00:00:00	\N	OBRA SOCIAL MERC.   	OBRA SOCIAL MERC.   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	186	131	2000-01-01 00:00:00	\N	BONIF.LEGISLATIVA   	BONIF.LEGISLATIVA   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	187	474	2000-01-01 00:00:00	\N	JUBILACION          	JUBILACION          	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	188	179	2000-01-01 00:00:00	\N	CUATRO MENSUALIDADES	CUATRO MENSUALIDADES	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	189	367	2000-01-01 00:00:00	\N	HORAS EXTRAS 50% MES	HORAS EXTRAS 50% MES	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	190	147	2000-01-01 00:00:00	\N	BONIF.ESPEC.MEDICA  	BONIF.ESPEC.MEDICA  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	191	386	2000-01-01 00:00:00	\N	RETEN. SUB.HIJO INC 	RETEN. SUB.HIJO INC 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	192	160	2000-01-01 00:00:00	\N	SUMA NO REM.COMPENS.	SUMA NO REM.COMPENS.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	193	473	2000-01-01 00:00:00	\N	CTA. INGRESO S.T.M.A	CTA. INGRESO S.T.M.A	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	194	412	2000-01-01 00:00:00	\N	RET COMP.ADI.HIJO   	RET COMP.ADI.HIJO   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	195	57	2000-01-01 00:00:00	\N	PRODUCTIVIDAD       	PRODUCTIVIDAD       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	196	141	2000-01-01 00:00:00	\N	BON.RET.DOC.MATERNAL	BON.RET.DOC.MATERNAL	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	197	387	2000-01-01 00:00:00	\N	DUPLO 25 AÂ¥OS       	DUPLO 25 AÂ¥OS      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	198	390	2000-01-01 00:00:00	\N	SUELDO ANUAL COMPLEM	SUELDO ANUAL COMPLEM	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	199	399	2000-01-01 00:00:00	\N	DIAS INASISTENCIA   	DIAS INASISTENCIA   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	200	113	2000-01-01 00:00:00	\N	BONIF.RURALISMO     	BONIF.RURALISMO     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	201	481	2000-01-01 00:00:00	\N	SEGURO SEPELIO      	SEGURO SEPELIO      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	202	990	2000-01-01 00:00:00	\N	EMBARGO POR ALIMENTO	EMBARGO POR ALIMENTO	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	203	68	2000-01-01 00:00:00	\N	AJUSTE COMIDA       	AJUSTE COMIDA       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	204	368	2000-01-01 00:00:00	\N	HORAS EXTRAS 100%MES	HORAS EXTRAS 100%MES	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	205	151	2000-01-01 00:00:00	\N	SUMA FIJA RETRIB.   	SUMA FIJA RETRIB.   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	206	411	2000-01-01 00:00:00	\N	COM.ADI.P/HIJO INC  	COM.ADI.P/HIJO INC  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	207	457	2000-01-01 00:00:00	\N	MUTRAMA AFIL.       	MUTRAMA AFIL.       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	208	106	2000-01-01 00:00:00	\N	TAREA PENOSA        	TAREA PENOSA        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	209	45	2000-01-01 00:00:00	\N	ADICIONAL 5 12 2 F  	ADICIONAL 5 12 2 F  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	210	59	2000-01-01 00:00:00	\N	PRESENTISMO         	PRESENTISMO         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	211	158	2000-01-01 00:00:00	\N	LICENCIA NO GOZADA  	LICENCIA NO GOZADA  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	212	38	2000-01-01 00:00:00	\N	ITEM 5 3 10         	ITEM 5 3 10         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	213	73	2000-01-01 00:00:00	\N	AJUSTE ITEM 5.3.11  	AJUSTE ITEM 5.3.11  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	214	35	2000-01-01 00:00:00	\N	FERIADO TRABAJADO   	FERIADO TRABAJADO   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	215	17	2000-01-01 00:00:00	\N	SUMA FIJO NO REMUNER	SUMA FIJO NO REMUNER	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	216	476	2000-01-01 00:00:00	\N	OBRA SOCIAL         	OBRA SOCIAL         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	217	430	2000-01-01 00:00:00	\N	SEGURO MERCADO      	SEGURO MERCADO      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	218	398	2000-01-01 00:00:00	\N	RECOBRO DE DIAS     	RECOBRO DE DIAS     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	219	396	2000-01-01 00:00:00	\N	HS.DE INASISTENCIA  	HS.DE INASISTENCIA  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	220	74	2000-01-01 00:00:00	\N	COMIDA Y VIATICOS   	COMIDA Y VIATICOS   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	221	105	2000-01-01 00:00:00	\N	TITULO              	TITULO              	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	222	338	2000-01-01 00:00:00	\N	PLUS ADIC.15%       	PLUS ADIC.15%       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	223	132	2000-01-01 00:00:00	\N	TAREA RIESGOSA      	TAREA RIESGOSA      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	224	108	2000-01-01 00:00:00	\N	FUNCION JERARQUICA  	FUNCION JERARQUICA  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	225	169	2000-01-01 00:00:00	\N	BONIF.X GRADO       	BONIF.X GRADO       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	226	39	2000-01-01 00:00:00	\N	FERIADO ESPECIAL REM	FERIADO ESPECIAL REM	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	227	163	2000-01-01 00:00:00	\N	B.REM.N/BON.DTO.PCIA	B.REM.N/BON.DTO.PCIA	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	228	462	2000-01-01 00:00:00	\N	I.P.S. 16 SAC       	I.P.S. 16 SAC       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	229	460	2000-01-01 00:00:00	\N	CTA.UNI.MUN.AVEL.SAC	CTA.UNI.MUN.AVEL.SAC	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	230	118	2000-01-01 00:00:00	\N	BONIF. ESPECIALIDAD 	BONIF. ESPECIALIDAD 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	231	128	2000-01-01 00:00:00	\N	DEDIC.EXCLUSIVA     	DEDIC.EXCLUSIVA     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	232	80	2000-01-01 00:00:00	\N	FORMACION PROFES    	FORMACION PROFES    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	233	383	2000-01-01 00:00:00	\N	AYUDA ESCOLAR       	AYUDA ESCOLAR       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	234	381	2000-01-01 00:00:00	\N	ASIG.NACIMIENTO     	ASIG.NACIMIENTO     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	235	389	2000-01-01 00:00:00	\N	ADIC.FIJO VACACIONES	ADIC.FIJO VACACIONES	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	236	480	2000-01-01 00:00:00	\N	CUOTA SINDICAL      	CUOTA SINDICAL      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	237	154	2000-01-01 00:00:00	\N	TITULO UNIVERSITARIO	TITULO UNIVERSITARIO	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	238	104	2000-01-01 00:00:00	\N	ANTIGUEDAD          	ANTIGUEDAD          	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	239	485	2000-01-01 00:00:00	\N	ADHER.O.SOCIAL NO IG	ADHER.O.SOCIAL NO IG	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	240	50	2000-01-01 00:00:00	\N	ADICIONAL 5 3 3 15% 	ADICIONAL 5 3 3 15% 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	241	12	2000-01-01 00:00:00	\N	SLDO BASICO MERCADO 	SLDO BASICO MERCADO 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	242	488	2000-01-01 00:00:00	\N	SEPELIO A.T.E       	SEPELIO A.T.E       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	243	170	2000-01-01 00:00:00	\N	BON.RET.MED.HTAL.A  	BON.RET.MED.HTAL.A  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	244	410	2000-01-01 00:00:00	\N	COMP.ADIC.POR HIJO  	COMP.ADIC.POR HIJO  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	245	146	2000-01-01 00:00:00	\N	B/R/N/B A.5 DTO.1432	B/R/N/B A.5 DTO.1432	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	246	364	2000-01-01 00:00:00	\N	EXTEN. EXTRA LABORAL	EXTEN. EXTRA LABORAL	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	247	149	2000-01-01 00:00:00	\N	INCENTIVO DOCENTE   	INCENTIVO DOCENTE   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	248	377	2000-01-01 00:00:00	\N	ASIG.POR HIJO       	ASIG.POR HIJO       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	249	71	2000-01-01 00:00:00	\N	ITEM 5.3.11         	ITEM 5.3.11         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	250	336	2000-01-01 00:00:00	\N	BON.HORARIO NOCTURNO	BON.HORARIO NOCTURNO	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	251	391	2000-01-01 00:00:00	\N	DIAS DE SUSPENSION  	DIAS DE SUSPENSION  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	252	379	2000-01-01 00:00:00	\N	ASIG.PRENATAL       	ASIG.PRENATAL       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	253	461	2000-01-01 00:00:00	\N	CUOTA A.T.E. SAC    	CUOTA A.T.E. SAC    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	254	458	2000-01-01 00:00:00	\N	CUOTA S.T.M.A. SAC  	CUOTA S.T.M.A. SAC  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	255	66	2000-01-01 00:00:00	\N	ANTIGUEDAD          	ANTIGUEDAD          	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	256	117	2000-01-01 00:00:00	\N	BONIF.X GRDIA.MEDICA	BONIF.X GRDIA.MEDICA	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	257	42	2000-01-01 00:00:00	\N	PREMIO RECOLECCION  	PREMIO RECOLECCION  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	258	397	2000-01-01 00:00:00	\N	REINTEGRO DS.INASIS.	REINTEGRO DS.INASIS.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	259	385	2000-01-01 00:00:00	\N	RETENCION SUB.HIJO  	RETENCION SUB.HIJO  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	260	366	2000-01-01 00:00:00	\N	HORAS EXTRAS 100%   	HORAS EXTRAS 100%   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	261	157	2000-01-01 00:00:00	\N	BON-EX-COMBATIENTE  	BON-EX-COMBATIENTE  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	262	110	2000-01-01 00:00:00	\N	FALLA DE CAJA       	FALLA DE CAJA       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	263	395	2000-01-01 00:00:00	\N	REINTEGRO HS.INASIST	REINTEGRO HS.INASIST	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	264	380	2000-01-01 00:00:00	\N	MATRIMONIO          	MATRIMONIO          	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	265	70	2000-01-01 00:00:00	\N	VIATICO ESPECIAL    	VIATICO ESPECIAL    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	266	47	2000-01-01 00:00:00	\N	HS EXTRAS 100%      	HS EXTRAS 100%      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	267	989	2000-01-01 00:00:00	\N	CUOTA ALIMENTARIA   	CUOTA ALIMENTARIA   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	268	442	2000-01-01 00:00:00	\N	I.P.S. 16           	I.P.S. 16           	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	269	388	2000-01-01 00:00:00	\N	VACACIONES          	VACACIONES          	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	270	479	2000-01-01 00:00:00	\N	OBRA SOCIAL NO IG   	OBRA SOCIAL NO IG   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	271	446	2000-01-01 00:00:00	\N	CTA.INGRESO SUMA    	CTA.INGRESO SUMA    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	272	81	2000-01-01 00:00:00	\N	DIFER.CATEGORIA     	DIFER.CATEGORIA     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	273	46	2000-01-01 00:00:00	\N	HS EXTRAS 50%       	HS EXTRAS 50%       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	274	440	2000-01-01 00:00:00	\N	I.P.S. 14           	I.P.S. 14           	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	275	130	2000-01-01 00:00:00	\N	GTOS REPRESENTACION 	GTOS REPRESENTACION 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	276	14	2000-01-01 00:00:00	\N	ANTIGUEDAD MERCADO  	ANTIGUEDAD MERCADO  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	277	365	2000-01-01 00:00:00	\N	HORAS EXTRAS 50%    	HORAS EXTRAS 50%    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	278	445	2000-01-01 00:00:00	\N	CTA. S.U.M.A.       	CTA. S.U.M.A.       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	279	123	2000-01-01 00:00:00	\N	COMP.SUPR.RURALISMO 	COMP.SUPR.RURALISMO 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	280	431	2000-01-01 00:00:00	\N	SINDICATO MERCADO   	SINDICATO MERCADO   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	281	393	2000-01-01 00:00:00	\N	SAC S/PREST.DINE.ILT	SAC S/PREST.DINE.ILT	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	282	112	2000-01-01 00:00:00	\N	BONIF.ENSE¥ANZA     	BONIF.ENSE¥ANZA     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	283	477	2000-01-01 00:00:00	\N	JUBILACION NO DED IG	JUBILACION NO DED IG	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	284	159	2000-01-01 00:00:00	\N	BONIFIC. RETRIBUTIVA	BONIFIC. RETRIBUTIVA	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	285	484	2000-01-01 00:00:00	\N	ADHERENTE O.SOCIAL  	ADHERENTE O.SOCIAL  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	286	472	2000-01-01 00:00:00	\N	A.T.E. CTA.SOC.     	A.T.E. CTA.SOC.     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	287	37	2000-01-01 00:00:00	\N	FERIADO LEY         	FERIADO LEY         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	288	112	2000-01-01 00:00:00	\N	BONIF.ENSEÂ¥ANZA     	BONIF.ENSEÂ¥ANZA    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	289	444	2000-01-01 00:00:00	\N	CUOTA U.P.C.N.      	CUOTA U.P.C.N.      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	290	107	2000-01-01 00:00:00	\N	ASIGNACION CARGO    	ASIGNACION CARGO    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	291	103	2000-01-01 00:00:00	\N	JORNADA COMPLETA    	JORNADA COMPLETA    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	292	413	2000-01-01 00:00:00	\N	RET.COMP.AD.HIJO INC	RET.COMP.AD.HIJO INC	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	293	331	2000-01-01 00:00:00	\N	BON.DIRECT.ASISTENC.	BON.DIRECT.ASISTENC.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	294	443	2000-01-01 00:00:00	\N	CUOTA S.T.M.A.      	CUOTA S.T.M.A.      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	295	465	2000-01-01 00:00:00	\N	I.P.S. 14 SAC       	I.P.S. 14 SAC       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	296	482	2000-01-01 00:00:00	\N	CUOTA SINDICAL NO IG	CUOTA SINDICAL NO IG	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	297	10	2000-01-01 00:00:00	\N	S.BASICO H.CAT.N/INS	S.BASICO H.CAT.N/INS	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	298	487	2000-01-01 00:00:00	\N	COMP.2%JUB.INSALUBRE	COMP.2%JUB.INSALUBRE	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	299	463	2000-01-01 00:00:00	\N	OBRA SOCIAL SAC     	OBRA SOCIAL SAC     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	300	183	2000-01-01 00:00:00	\N	SUMA FIJA N/RE.N/BON	SUMA FIJA N/RE.N/BON	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	301	448	2000-01-01 00:00:00	\N	CUOTA A.T.E.        	CUOTA A.T.E.        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	302	832	2000-01-01 00:00:00	\N	CREDITO DINERO      	CREDITO DINERO      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	303	134	2000-01-01 00:00:00	\N	BON.LAB.SUP.SEC.SAL.	BON.LAB.SUP.SEC.SAL.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	304	408	2000-01-01 00:00:00	\N	SUBSIDIO HIJO INCAP.	SUBSIDIO HIJO INCAP.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	305	162	2000-01-01 00:00:00	\N	B.REM.N/B DTO.1248  	B.REM.N/B DTO.1248  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	306	172	2000-01-01 00:00:00	\N	BON.EGRESO ESCALAFON	BON.EGRESO ESCALAFON	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	307	40	2000-01-01 00:00:00	\N	JORNADA LUNES       	JORNADA LUNES       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	308	16	2000-01-01 00:00:00	\N	PRESENTISMO         	PRESENTISMO         	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	309	327	2000-01-01 00:00:00	\N	BONIF.INSTRUMENTO   	BONIF.INSTRUMENTO   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	310	101	2000-01-01 00:00:00	\N	SUELDO BASICO       	SUELDO BASICO       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	311	116	2000-01-01 00:00:00	\N	ACTIVIDAD CRITICA   	ACTIVIDAD CRITICA   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	312	11	2000-01-01 00:00:00	\N	SDO BASICO HS.CAT.  	SDO BASICO HS.CAT.  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	313	58	2000-01-01 00:00:00	\N	ADICIONAL 16%       	ADICIONAL 16%       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	314	137	2000-01-01 00:00:00	\N	BON.RET.NO.BONIF.   	BON.RET.NO.BONIF.   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	315	53	2000-01-01 00:00:00	\N	ADIC 5.3.25 b) 2%   	ADIC 5.3.25 b) 2%   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	316	452	2000-01-01 00:00:00	\N	LEY 19032 MERC.     	LEY 19032 MERC.     	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	317	100	2000-01-01 00:00:00	\N	JORNAL              	JORNAL              	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	318	982	2000-01-01 00:00:00	\N	DEV.RET.GCIAS RG5008	DEV.RET.GCIAS RG5008	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	319	450	2000-01-01 00:00:00	\N	JUBILACION MERC.    	JUBILACION MERC.    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	320	387	2000-01-01 00:00:00	\N	DUPLO 25 A¥OS       	DUPLO 25 A¥OS       	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	321	52	2000-01-01 00:00:00	\N	ADIC 5.3.26 a) 10%  	ADIC 5.3.26 a) 10%  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	322	318	2000-01-01 00:00:00	\N	BON.FUNC.ORQ.SINFON.	BON.FUNC.ORQ.SINFON.	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	323	150	2000-01-01 00:00:00	\N	MOVILIDAD           	MOVILIDAD           	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	324	133	2000-01-01 00:00:00	\N	BONIF.RETRIB.MEDICOS	BONIF.RETRIB.MEDICOS	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	325	115	2000-01-01 00:00:00	\N	BONIF.COMPUTACION   	BONIF.COMPUTACION   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	326	459	2000-01-01 00:00:00	\N	CUOTA U.P.C.N. SAC  	CUOTA U.P.C.N. SAC  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	327	378	2000-01-01 00:00:00	\N	HIJO C/DISCAPACIDAD 	HIJO C/DISCAPACIDAD 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	328	67	2000-01-01 00:00:00	\N	COMIDA              	COMIDA              	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	329	447	2000-01-01 00:00:00	\N	CUOTA A.M.R.A.      	CUOTA A.M.R.A.      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	330	21	2000-01-01 00:00:00	\N	SLDO BASICO HS.INTER	SLDO BASICO HS.INTER	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	331	109	2000-01-01 00:00:00	\N	BONIF.X PTA.MEDICOS 	BONIF.X PTA.MEDICOS 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	332	182	2000-01-01 00:00:00	\N	ANT.PRE-JUBILATORIO 	ANT.PRE-JUBILATORIO 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	333	483	2000-01-01 00:00:00	\N	SEGURO SEPELIO NO IG	SEGURO SEPELIO NO IG	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	334	351	2000-01-01 00:00:00	\N	HS.EXT.REPRE.FISCAL 	HS.EXT.REPRE.FISCAL 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	335	406	2000-01-01 00:00:00	\N	ART.83 LEY 14656    	ART.83 LEY 14656    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	336	56	2000-01-01 00:00:00	\N	MULTIPLICIDAD TAREA 	MULTIPLICIDAD TAREA 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	337	76	2000-01-01 00:00:00	\N	PREST.DINERARIA ILT 	PREST.DINERARIA ILT 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	338	148	2000-01-01 00:00:00	\N	BON.RET.NO.BONIF    	BON.RET.NO.BONIF    	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	339	143	2000-01-01 00:00:00	\N	BONIFICACION RETRIB 	BONIFICACION RETRIB 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	340	178	2000-01-01 00:00:00	\N	SEIS MENSUALIDADES  	SEIS MENSUALIDADES  	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	341	449	2000-01-01 00:00:00	\N	PEOS ADHERENTE      	PEOS ADHERENTE      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	342	114	2000-01-01 00:00:00	\N	ASIG.CAJEROS        	ASIG.CAJEROS        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	343	16	2000-01-01 00:00:00	\N	PRESENTISMO.        	PRESENTISMO.        	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	344	126	2000-01-01 00:00:00	\N	TRABAJO EN EQUIPO   	TRABAJO EN EQUIPO   	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	345	69	2000-01-01 00:00:00	\N	FERIADO ESPECIAL NRE	FERIADO ESPECIAL NRE	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	346	30	2000-01-01 00:00:00	\N	SALARIO BASICO      	SALARIO BASICO      	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	347	168	2000-01-01 00:00:00	\N	BON.X CARGA HORARIA 	BON.X CARGA HORARIA 	C	-1	35	35	\N	\N	\N	-1	\N
t	2022-10-05 23:45:28.487409	2022-10-05 23:45:28.487409	\N	2022-10-05 23:45:28.487409	348	988	2000-01-01 00:00:00	\N	EMBARGO COMUN       	EMBARGO COMUN       	C	-1	35	35	\N	\N	\N	-1	\N
t	2023-04-18 08:45:19.577402	\N	\N	2023-04-18 08:45:19.566664	349	789456	2023-04-18 00:00:00	2023-04-18 00:00:00	prueba	prueba	l	1	39	37	\N	-1	\N	\N	-1
f	2023-04-20 13:17:34.454782	\N	2023-04-20 14:21:20.982847	2023-04-20 13:17:34.440812	351	303456	2023-04-20 00:00:00	\N	el telefono dice que tu no estas 	lalalalalalaa	l	0	39	37	\N	-1	\N	-1	-1
f	2023-04-20 13:06:28.311761	\N	2023-04-20 14:22:49.662166	2023-04-20 13:06:28.303863	350	1000	2023-04-01 00:00:00	2023-04-02 00:00:00	prueba crear concepto	prueba	l	0	39	37	\N	-1	\N	-1	-1
t	2023-04-24 11:47:17.29481	\N	\N	2023-04-24 11:47:17.276141	352	3003	2023-01-01 00:00:00	\N	Sumatoria 3003 para obra social 	Sumatoria 3003 	l	0	39	37	\N	-1	\N	\N	-1
t	2023-05-02 08:54:21.087742	\N	\N	2023-05-02 08:54:21.076214	353	30045	2023-01-01 00:00:00	2023-12-31 00:00:00	Prueba para creacion de conceptos	Obra social prueba 	l	0	39	38	\N	-1	\N	\N	-1
\.


--
-- Data for Name: conceptos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.conceptos (activado, "creadoEn", "modificadoEn", "elminadoEn", "activadoEn", id, cod_concepto, fecha_desde, fecha_hasta, desc_conce, desc_corta, id_tipo_concepto, id_ganancias, legajo_cargo, id_concepto_cant, imprime_cero, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
\.


--
-- Data for Name: detalleMatriz; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."detalleMatriz" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "fechaDesde", "fechaHasta", rango, "retornaA", "retornaB", "matrizId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-01-04 17:15:07.939041	\N	\N	2023-01-04 17:15:07.934779	1	2022-01-01 00:00:00	2023-01-01 00:00:00	10000	183201.00	30.00	1	-1	\N	\N	-1
t	2023-04-13 15:02:34.231829	2023-04-13 15:03:08.619995	\N	2023-04-13 15:02:34.225842	2	2023-01-01 00:00:00	2023-12-31 00:00:00	6181	6105.79	155328.00	2	-1	-1	\N	-1
t	2023-04-13 15:06:51.571177	\N	\N	2023-04-13 15:06:51.562383	3	2023-01-01 00:00:00	2023-12-31 00:00:00	6181	6105.79	155328.00	3	-1	\N	\N	-1
t	2023-04-17 09:19:14.369625	2023-04-17 09:19:39.717619	\N	2023-04-17 09:19:14.324172	4	2023-01-01 00:00:00	2023-01-02 00:00:00	132000	0.00	0.00	6	-1	-1	\N	-1
t	2023-04-17 09:19:39.729553	2023-04-17 09:20:04.857566	\N	2023-04-17 09:19:39.711061	5	2023-01-02 00:00:00	2023-01-03 00:00:00	156000	1.00	1.00	6	-1	-1	\N	-1
t	2023-04-17 09:20:04.871094	2023-04-17 09:20:43.937545	\N	2023-04-17 09:20:04.85106	6	2023-01-03 00:00:00	2023-01-04 00:00:00	176000	2.00	2.00	6	-1	-1	\N	-1
t	2023-04-17 09:20:43.950185	2023-04-17 09:29:46.520674	\N	2023-04-17 09:20:43.93136	7	2023-01-04 00:00:00	2023-01-05 00:00:00	200000	3.00	3.00	6	-1	-1	\N	-1
f	2023-04-17 09:29:46.548528	\N	2023-04-17 09:30:12.377666	2023-04-17 09:29:46.512637	8	2023-01-05 00:00:00	2023-12-31 00:00:00	11535	6105.79	54865.00	6	-1	\N	-1	-1
t	2023-04-27 09:14:39.365848	\N	\N	2023-04-27 09:14:39.363014	13	2023-01-01 00:00:00	2023-12-31 00:00:00	1000	0.00	80000.00	8	-1	\N	\N	-1
t	2023-04-27 09:15:37.858023	\N	\N	2023-04-27 09:15:37.853155	14	2023-01-01 00:00:00	2023-12-31 00:00:00	2000	80001.00	150000.00	8	-1	\N	\N	-1
t	2023-04-27 09:16:09.280105	\N	\N	2023-04-27 09:16:09.274943	15	2023-01-01 00:00:00	2023-12-31 00:00:00	3000	150001.00	300000.00	8	-1	\N	\N	-1
t	2023-04-17 09:32:20.726684	2023-05-02 13:36:06.452096	\N	2023-04-17 09:32:20.720541	9	2023-01-01 00:00:00	2023-01-02 00:00:00	177554	11465.00	0.00	7	-1	-1	\N	-1
t	2023-04-17 09:33:01.633397	2023-05-02 13:36:57.517387	\N	2023-04-17 09:33:01.598051	10	2023-01-02 00:00:00	2023-01-03 00:00:00	260403	7732.00	0.00	7	-1	-1	\N	-1
t	2023-04-17 09:33:49.868969	2023-05-02 13:37:29.306376	\N	2023-04-17 09:33:49.826509	11	2023-01-03 00:00:00	2023-01-04 00:00:00	300645	4675.00	0.00	7	-1	-1	\N	-1
t	2023-04-17 09:34:33.031581	2023-05-02 13:37:46.770751	\N	2023-04-17 09:34:32.996273	12	2023-01-04 00:00:00	2023-12-31 00:00:00	808124	2410.00	0.00	7	-1	-1	\N	-1
t	2023-05-03 12:37:51.380234	\N	\N	2023-05-03 12:37:51.374988	16	2023-01-01 00:00:00	2023-12-31 00:00:00	177554	11465.00	0.00	11	-1	\N	\N	-1
t	2023-05-03 12:38:24.65098	\N	\N	2023-05-03 12:38:24.646131	17	2023-01-01 00:00:00	2023-12-31 00:00:00	260403	7732.00	0.00	11	-1	\N	\N	-1
t	2023-05-03 12:39:09.567733	\N	\N	2023-05-03 12:39:09.562573	18	2023-01-01 00:00:00	2023-12-31 00:00:00	300645	4675.00	0.00	11	-1	\N	\N	-1
t	2023-05-03 12:39:41.624221	\N	\N	2023-05-03 12:39:41.621844	19	2023-01-01 00:00:00	2023-12-31 00:00:00	808124	2410.00	0.00	11	-1	\N	\N	-1
t	2023-06-22 15:28:37.54328	\N	\N	2023-06-22 15:28:37.540393	20	2023-06-01 00:00:00	2023-12-31 00:00:00	214699	13864.00	0.00	11	1	\N	\N	-1
\.


--
-- Data for Name: formula; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.formula (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "codigoFormula", descripcion, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.951545	\N	\N	2022-11-22 13:53:46.951415	3	3	FORMULA CHICA II	-1	\N	\N	-1
t	2022-12-02 23:33:14.869434	2022-12-03 20:25:28.634979	\N	2022-12-02 23:33:14.867904	4	90001	SAC PROYECTADO PARA GANANCIAS	-1	-1	\N	-1
t	2022-11-22 13:53:46.874317	2022-12-05 10:53:05.550544	\N	2022-11-22 13:53:46.874139	1	300000	FORMULA COMPLETA	-1	-1	\N	-1
t	2022-11-22 13:53:46.926172	2022-12-05 10:56:49.810464	\N	2022-11-22 13:53:46.92603	2	2	FORMULA CHICA	-1	-1	\N	-1
t	2023-01-16 22:22:52.767299	2023-01-17 18:24:25.123936	\N	2023-01-16 22:22:52.765914	9	1000003	1004-ANTIGUEDAD (ANTIG TOTAL)	-1	-1	\N	-1
t	2023-05-04 12:42:09.354343	2023-05-04 13:01:25.102716	\N	2023-05-04 12:42:09.349875	36	100200	formula camioneros	-1	-1	\N	-1
f	2023-04-27 15:49:24.112361	\N	2023-04-27 15:52:39.05143	2023-04-27 15:49:24.110194	31	243242	asdasdsa	-1	\N	-1	-1
f	2023-04-10 09:03:18.307522	2023-04-10 09:15:37.21772	2023-04-10 09:15:45.802545	2023-04-10 09:03:18.303373	15	5075	Obra social valor cancha	-1	-1	-1	-1
t	2023-04-10 12:58:43.18247	2023-05-04 09:18:11.199519	\N	2023-04-10 12:58:43.17816	27	5136	Obra social sac	-1	-1	\N	-1
t	2023-04-10 11:28:24.558588	2023-05-04 09:18:58.845056	\N	2023-04-10 11:28:24.556404	23	2002	Asignacion hijos	-1	-1	\N	-1
t	2023-04-17 13:56:04.547082	2023-05-04 13:06:35.007295	\N	2023-04-17 13:56:04.538923	29	30411	FOSOC	-1	-1	\N	-1
t	2023-05-04 12:11:45.319376	2023-05-04 13:08:06.434131	\N	2023-05-04 12:11:45.314877	35	3041	Formula obra social 	-1	-1	\N	-1
t	2023-04-27 20:09:50.576005	2023-04-27 20:23:18.350772	\N	2023-04-27 20:09:50.571912	32	1005	Ant fec hasta	-1	-1	\N	-1
f	2023-01-19 13:11:49.840037	2023-05-02 12:00:50.054136	2023-05-02 12:42:26.278527	2023-01-19 13:11:49.83876	11	9003	Calculo Horas Extras 	-1	-1	-1	-1
f	2023-03-13 08:29:08.465501	2023-04-10 08:46:58.586662	2023-05-02 12:43:02.117084	2023-03-13 08:29:08.358564	14	10	IPS SAC 	-1	-1	-1	-1
t	2023-01-16 22:04:26.595323	2023-05-28 17:25:22.513923	\N	2023-01-16 22:04:26.593644	8	1000002	1004-ANTIGUEDAD FECHA HASTA	-1	-1	\N	-1
f	2023-04-10 11:07:05.718804	2023-04-10 12:29:00.09065	2023-04-13 11:13:19.097786	2023-04-10 11:07:05.714458	19	5041	Obra social patronal	-1	-1	-1	-1
f	2023-04-10 09:15:00.923709	2023-04-11 15:05:07.246557	2023-04-13 11:51:57.490438	2023-04-10 09:15:00.919444	16	5075	Obra social valor cancha	-1	-1	-1	-1
f	2023-01-31 13:19:17.459776	2023-02-06 21:21:54.355034	2023-05-02 12:49:14.137339	2023-01-31 13:19:17.458525	12	4	AUXILIAR PRUEBA BORRAR	-1	-1	-1	-1
t	2023-05-28 22:33:37.985371	2023-05-28 22:52:40.482986	\N	2023-05-28 22:33:37.982505	37	1007	ANTIGUEDAD AL 1%	-1	-1	\N	-1
t	2023-04-27 20:39:25.466176	2023-04-27 21:07:36.39972	\N	2023-04-27 20:39:25.463849	33	1006	Antiguedad Fecha Hasta	-1	-1	\N	-1
f	2023-04-18 12:45:42.424238	2023-04-18 12:57:45.561243	2023-05-02 12:56:10.024989	2023-04-18 12:45:42.419981	30	87	Procedimiento FOSOC	-1	-1	-1	-1
t	2023-07-31 12:00:48.446873	2023-07-31 12:02:50.413784	\N	2023-07-31 12:00:48.444639	38	329	JORNADA PROLONGADA	1	1	\N	-1
t	2022-12-03 00:07:52.386196	2023-04-27 13:57:23.627775	\N	2022-12-03 00:07:52.384973	5	90002	Marca si aplica el aguinaldo para ganancias Massa	-1	-1	\N	-1
f	2022-12-05 11:11:01.413698	\N	2023-04-27 13:57:33.186256	2022-12-05 11:11:01.412199	6	1	BORRRAR PRUEBA TERMINO CONCEPTO	-1	\N	-1	-1
t	2023-04-10 11:19:20.607414	2023-05-02 13:28:44.839793	\N	2023-04-10 11:19:20.603321	22	2077	Asignacion por matrimonio	-1	-1	\N	-1
f	2023-04-10 11:49:52.580239	2023-04-10 12:12:47.647954	2023-05-04 10:40:38.243097	2023-04-10 11:49:52.577999	25	20800	Ayuda escolar	-1	-1	-1	-1
t	2023-04-10 12:43:24.944318	2023-05-04 10:42:34.936267	\N	2023-04-10 12:43:24.940122	26	20801	Ayuda escolar 2080 1	-1	-1	\N	-1
t	2023-04-10 11:10:04.122442	2023-05-03 15:13:16.315149	\N	2023-04-10 11:10:04.118264	20	1003	Asignacion hijo incapacitados	-1	-1	\N	-1
t	2023-04-10 10:33:36.511383	2023-05-04 08:55:00.545778	\N	2023-04-10 10:33:36.507085	18	5052	Valor hora extra 	-1	-1	\N	-1
t	2023-05-02 10:27:06.294994	\N	\N	2023-05-02 10:27:06.29078	34	96666	PRUEBA	-1	\N	\N	-1
t	2023-01-16 21:56:34.213991	2023-05-02 10:32:11.139792	\N	2023-01-16 21:56:34.2125	7	1004	Antiguedad total en años	-1	-1	\N	-1
t	2023-04-17 10:34:52.671499	2023-05-04 11:45:41.098269	\N	2023-04-17 10:34:52.666695	28	20802	Formula para ayuda escolar 	-1	-1	\N	-1
f	2023-02-27 11:28:28.750404	\N	2023-05-02 11:45:36.766403	2023-02-27 11:28:28.748937	13	7	prueba_hora_extra 	-1	\N	-1	-1
t	2023-04-10 11:38:37.123694	2023-05-04 08:59:29.923383	\N	2023-04-10 11:38:37.119151	24	2078	Asignacion por nacimiento	-1	-1	\N	-1
t	2023-04-10 11:16:02.085685	2023-05-04 08:59:59.454729	\N	2023-04-10 11:16:02.082699	21	2076	Asignacion prenatal	-1	-1	\N	-1
t	2023-01-19 10:59:22.803145	2023-05-04 11:51:18.296378	\N	2023-01-19 10:59:22.801768	10	1001	BASICO	-1	-1	\N	-1
f	2023-04-10 09:25:19.595448	2023-05-04 09:06:00.741519	2023-05-04 12:00:09.653544	2023-04-10 09:25:19.591345	17	3041	Obra social	-1	-1	-1	-1
\.


--
-- Data for Name: general; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.general (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "grupoId", "dependeId", nombre, "nombreAbreviado", "auxCadena1", "auxCadena2", "auxEntero1", "auxEntero2", "auxFecha1", "auxFecha2", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.408578	\N	\N	2022-11-22 13:53:46.408315	1	1009	\N	Mail envio de password	MAIL_ENVIO_CLAVE	Solicitud de envio de password	\N	\N	\N	\N	\N	-1	\N	\N	-1
\.


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.grupo (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, grupo, "auxCadena1", "auxCadena2", "auxEntero1", "auxEntero2", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.400886	\N	\N	2022-11-22 13:53:46.400547	1009	Tipo Mails	\N	\N	\N	\N	-1	\N	\N	-1
\.


--
-- Data for Name: liqui_cons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.liqui_cons (id, created_at, updated_at, deleted_at, liqui_id, nro_legajo, nro_cargo, anio_liqui, anio_dev, mes_dev, fecha_desde, concepto_id, cantidad, imp_unit, imp_item, tipo_concepto, tipo_conc_gan) FROM stdin;
\.


--
-- Data for Name: liquis; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.liquis (id, created_at, updated_at, deleted_at, id_agr, id_plaper, id_gruper, anio_liq, mes_liq, anio_dev, mes_dev, anio_gan, mes_gan, tipo_liq, stipo_liq, fecha_pago, descripcion, anulacion, fecha_liq, id_estado, nro_legajo_desde, nro_legajo_hasta, fec_ini_proc, fec_fin_proc) FROM stdin;
\.


--
-- Data for Name: matriz; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.matriz (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, descripcion, "retornaA", "retornaB", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-12-06 12:02:33.418945	2023-01-19 11:25:16.686325	\N	2022-12-06 12:02:33.417637	1	base imponible ganancias	base imponible	porcentaje	-1	-1	\N	-1
f	2023-04-13 15:01:38.228278	\N	2023-04-13 15:03:31.243147	2023-04-13 15:01:38.223062	2	Valor	Minimo	Maximo	-1	\N	-1	-1
t	2023-04-13 15:03:58.956	2023-04-13 15:26:55.802459	\N	2023-04-13 15:03:58.951921	3	Rango 2077	Minimo	Maximo	-1	-1	\N	-1
f	2023-04-13 15:10:44.695549	2023-04-13 15:27:21.909802	2023-05-02 12:39:17.465188	2023-04-13 15:10:44.691463	4	Rango 20021	Minimo	Maximo	-1	-1	-1	-1
f	2023-04-13 15:32:27.914732	\N	2023-05-02 12:39:20.343674	2023-04-13 15:32:27.910612	5	Rango 20021 prueba	Minimo	Maximo	-1	\N	-1	-1
f	2023-04-27 09:13:55.444671	\N	2023-05-02 13:31:44.358387	2023-04-27 09:13:55.44235	8	Asignacion de salarios familiares	Minimo	Maximo	-1	\N	-1	-1
f	2023-04-17 09:30:46.97438	2023-05-02 14:16:40.211176	2023-05-03 12:33:16.126418	2023-04-17 09:30:46.958787	7	Rango 2002	Salario Familiar		-1	-1	-1	-1
f	2023-04-17 09:10:45.561051	\N	2023-05-04 10:18:58.054835	2023-04-17 09:10:45.557912	6	Sumatoria 10520	Minimo	Maximo	-1	\N	-1	-1
f	2023-05-02 14:17:21.299117	\N	2023-05-04 10:21:13.161938	2023-05-02 14:17:21.295008	10	Rango 2003	Salario hijo discapacitado		-1	\N	-1	-1
f	2023-05-04 10:22:28.507159	\N	2023-05-04 10:24:01.822403	2023-05-04 10:22:28.502956	12	Codigo Categoria 	Basico		-1	\N	-1	-1
f	2023-05-04 10:24:21.338581	2023-05-04 10:25:19.921425	2023-05-04 10:28:30.661637	2023-05-04 10:24:21.334461	13	Basico	Categoria		-1	-1	-1	-1
t	2023-05-02 14:14:08.038263	2023-06-22 15:18:07.071987	\N	2023-05-02 14:14:08.033008	9	Salario hijo discapacitado	Salario hijo discapacitado		-1	1	\N	-1
t	2023-05-03 12:37:01.916916	2023-07-03 13:10:18.372273	\N	2023-05-03 12:37:01.912372	11	Salario familiar	Salario Familiar		-1	1	\N	-1
t	2023-07-03 14:53:59.228739	2023-07-03 14:54:13.829712	\N	2023-07-03 14:53:59.22671	14	SALARIO	SALARIO FAMILIAR	BASE	-1	-1	\N	-1
t	2023-07-03 14:59:40.363673	\N	\N	2023-07-03 14:59:40.359581	15	SALARIO FAMILIAR	BASE	SALARIO	-1	\N	\N	-1
t	2023-07-03 15:01:57.529806	\N	\N	2023-07-03 15:01:57.525482	16	SALARIO HIJO 	BASE MINIMO	BASE MAXIMO	-1	\N	\N	-1
\.


--
-- Data for Name: nodo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.nodo (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "operadorId", parametros, "formulaId", "versionId", "terminoId", "codigoSubFormulaId", "tipoTerminoId", "tipoNodoId", "funcionId", "nodoPadreId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.959905	\N	\N	2022-11-22 13:53:46.959653	13	\N	\N	3	3	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.965508	\N	\N	2022-11-22 13:53:46.960214	14	22	\N	3	3	\N	\N	16	4	\N	13	-1	\N	\N	-1
t	2022-11-22 13:53:46.971046	\N	\N	2022-11-22 13:53:46.96588	15	24	\N	3	3	\N	\N	18	4	\N	13	-1	\N	\N	-1
f	2022-11-22 13:53:46.882688	\N	2022-11-25 13:46:13.617362	2022-11-22 13:53:46.882476	1	\N	\N	1	1	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-11-22 13:53:46.883032	\N	2022-11-25 13:46:13.629763	2022-11-22 13:53:46.882889	2	23	\N	1	1	\N	\N	\N	6	\N	1	-1	\N	-1	-1
f	2022-11-22 13:53:46.892911	\N	2022-11-25 13:46:13.639475	2022-11-22 13:53:46.883201	3	21	\N	1	1	\N	\N	19	4	\N	2	-1	\N	-1	-1
f	2022-11-22 13:53:46.898382	\N	2022-11-25 13:46:13.650959	2022-11-22 13:53:46.893216	4	27	\N	1	1	\N	\N	13	4	\N	2	-1	\N	-1	-1
f	2022-11-22 13:53:46.898959	\N	2022-11-25 13:46:13.661035	2022-11-22 13:53:46.898744	5	\N	\N	1	1	\N	\N	\N	6	\N	1	-1	\N	-1	-1
f	2022-11-22 13:53:46.899624	\N	2022-11-25 13:46:13.669708	2022-11-22 13:53:46.899443	6	\N	\N	1	1	\N	\N	\N	6	\N	5	-1	\N	-1	-1
f	2022-11-22 13:53:46.907473	\N	2022-11-25 13:46:13.677832	2022-11-22 13:53:46.89989	7	21	\N	1	1	\N	\N	20	4	\N	6	-1	\N	-1	-1
f	2022-11-22 13:53:46.91177	\N	2022-11-25 13:46:13.68669	2022-11-22 13:53:46.907754	8	28	\N	1	1	\N	\N	18	4	\N	6	-1	\N	-1	-1
f	2022-11-22 13:53:46.916489	\N	2022-11-25 13:46:13.695612	2022-11-22 13:53:46.912055	9	24	\N	1	1	\N	\N	11	4	\N	5	-1	\N	-1	-1
f	2022-12-02 23:33:14.894849	\N	2022-12-02 23:59:21.051699	2022-12-02 23:33:14.888163	25	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-02 23:33:14.902933	\N	2022-12-02 23:59:21.232995	2022-12-02 23:33:14.895069	26	22	\N	4	4	\N	\N	\N	8	\N	25	-1	\N	-1	-1
f	2022-12-02 23:33:14.906193	\N	2022-12-02 23:59:21.353724	2022-12-02 23:33:14.903161	27	22	\N	4	4	\N	\N	\N	\N	\N	26	-1	\N	-1	-1
f	2022-12-02 23:33:14.910508	\N	2022-12-02 23:59:21.386275	2022-12-02 23:33:14.906453	28	22	\N	4	4	1	\N	19	4	\N	27	-1	\N	-1	-1
f	2022-12-02 23:33:14.914321	\N	2022-12-02 23:59:21.670059	2022-12-02 23:33:14.910803	29	\N	\N	4	4	\N	\N	\N	\N	\N	27	-1	\N	-1	-1
f	2022-12-02 23:33:14.91767	\N	2022-12-02 23:59:21.761457	2022-12-02 23:33:14.914611	30	22	\N	4	4	\N	\N	\N	\N	\N	26	-1	\N	-1	-1
f	2022-12-02 23:33:14.921192	\N	2022-12-02 23:59:21.81921	2022-12-02 23:33:14.917886	31	22	\N	4	4	\N	\N	\N	\N	\N	30	-1	\N	-1	-1
f	2022-12-02 23:33:14.924679	\N	2022-12-02 23:59:21.874862	2022-12-02 23:33:14.921532	32	\N	\N	4	4	\N	\N	\N	\N	\N	30	-1	\N	-1	-1
f	2022-12-02 23:33:14.927484	\N	2022-12-02 23:59:21.943306	2022-12-02 23:33:14.92488	33	22	\N	4	4	\N	\N	\N	\N	\N	26	-1	\N	-1	-1
f	2022-12-02 23:33:14.92999	\N	2022-12-02 23:59:22.013723	2022-12-02 23:33:14.927684	34	22	\N	4	4	\N	\N	\N	\N	\N	33	-1	\N	-1	-1
f	2022-12-02 23:33:14.932744	\N	2022-12-02 23:59:22.19648	2022-12-02 23:33:14.930159	35	\N	\N	4	4	\N	\N	\N	\N	\N	33	-1	\N	-1	-1
f	2022-12-02 23:33:14.935869	\N	2022-12-02 23:59:22.224907	2022-12-02 23:33:14.932964	36	22	\N	4	4	\N	\N	\N	\N	\N	26	-1	\N	-1	-1
f	2022-12-02 23:33:14.939014	\N	2022-12-02 23:59:22.363849	2022-12-02 23:33:14.936095	37	22	\N	4	4	\N	\N	\N	\N	\N	36	-1	\N	-1	-1
f	2022-12-02 23:33:14.942179	\N	2022-12-02 23:59:22.410187	2022-12-02 23:33:14.939227	38	\N	\N	4	4	\N	\N	\N	\N	\N	36	-1	\N	-1	-1
f	2022-12-02 23:33:14.945168	\N	2022-12-02 23:59:22.456967	2022-12-02 23:33:14.942417	39	22	\N	4	4	\N	\N	\N	\N	\N	26	-1	\N	-1	-1
f	2022-12-02 23:33:14.948103	\N	2022-12-02 23:59:22.514015	2022-12-02 23:33:14.945442	40	22	\N	4	4	\N	\N	\N	\N	\N	39	-1	\N	-1	-1
f	2022-12-02 23:33:14.950756	\N	2022-12-02 23:59:22.562551	2022-12-02 23:33:14.948337	41	\N	\N	4	4	\N	\N	\N	\N	\N	39	-1	\N	-1	-1
f	2022-12-02 23:59:22.605038	\N	2022-12-03 00:02:11.308833	2022-12-02 23:59:22.602675	42	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-02 23:59:22.610418	\N	2022-12-03 00:02:11.319736	2022-12-02 23:59:22.605233	43	22	\N	4	4	\N	\N	\N	8	\N	42	-1	\N	-1	-1
f	2022-12-02 23:59:22.61298	\N	2022-12-03 00:02:11.329658	2022-12-02 23:59:22.610646	44	22	\N	4	4	\N	\N	\N	\N	\N	43	-1	\N	-1	-1
f	2022-12-02 23:59:22.617168	\N	2022-12-03 00:02:11.341125	2022-12-02 23:59:22.613148	45	22	\N	4	4	1	\N	19	4	\N	44	-1	\N	-1	-1
f	2022-12-02 23:59:22.621288	\N	2022-12-03 00:02:11.352502	2022-12-02 23:59:22.617389	46	51	\N	4	4	2	\N	16	4	\N	44	-1	\N	-1	-1
f	2022-12-02 23:59:22.624426	\N	2022-12-03 00:02:11.362158	2022-12-02 23:59:22.621589	47	22	\N	4	4	\N	\N	\N	\N	\N	43	-1	\N	-1	-1
f	2022-12-02 23:59:22.626868	\N	2022-12-03 00:02:11.3721	2022-12-02 23:59:22.624613	48	22	\N	4	4	\N	\N	\N	\N	\N	47	-1	\N	-1	-1
f	2022-12-02 23:59:22.629135	\N	2022-12-03 00:02:11.381021	2022-12-02 23:59:22.627025	49	\N	\N	4	4	\N	\N	\N	\N	\N	47	-1	\N	-1	-1
f	2022-12-02 23:59:22.631306	\N	2022-12-03 00:02:11.392498	2022-12-02 23:59:22.629296	50	22	\N	4	4	\N	\N	\N	\N	\N	43	-1	\N	-1	-1
f	2022-12-02 23:59:22.633957	\N	2022-12-03 00:02:11.402339	2022-12-02 23:59:22.63149	51	22	\N	4	4	\N	\N	\N	\N	\N	50	-1	\N	-1	-1
f	2022-12-02 23:59:22.637049	\N	2022-12-03 00:02:11.412221	2022-12-02 23:59:22.634173	52	\N	\N	4	4	\N	\N	\N	\N	\N	50	-1	\N	-1	-1
f	2022-12-02 23:59:22.640206	\N	2022-12-03 00:02:11.422233	2022-12-02 23:59:22.637258	53	22	\N	4	4	\N	\N	\N	\N	\N	43	-1	\N	-1	-1
f	2022-12-02 23:59:22.642821	\N	2022-12-03 00:02:11.431967	2022-12-02 23:59:22.640457	54	22	\N	4	4	\N	\N	\N	\N	\N	53	-1	\N	-1	-1
f	2022-12-02 23:59:22.645932	\N	2022-12-03 00:02:11.441019	2022-12-02 23:59:22.643126	55	\N	\N	4	4	\N	\N	\N	\N	\N	53	-1	\N	-1	-1
f	2022-12-02 23:59:22.648813	\N	2022-12-03 00:02:11.45292	2022-12-02 23:59:22.646141	56	22	\N	4	4	\N	\N	\N	\N	\N	43	-1	\N	-1	-1
f	2022-12-02 23:59:22.651652	\N	2022-12-03 00:02:11.464045	2022-12-02 23:59:22.649013	57	22	\N	4	4	\N	\N	\N	\N	\N	56	-1	\N	-1	-1
f	2022-12-02 23:59:22.654241	\N	2022-12-03 00:02:11.473075	2022-12-02 23:59:22.651849	58	\N	\N	4	4	\N	\N	\N	\N	\N	56	-1	\N	-1	-1
f	2022-12-03 00:02:11.488986	\N	2022-12-03 00:04:50.526849	2022-12-03 00:02:11.486307	59	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:02:11.494325	\N	2022-12-03 00:04:50.536938	2022-12-03 00:02:11.489209	60	22	\N	4	4	\N	\N	\N	8	\N	59	-1	\N	-1	-1
f	2022-12-03 00:02:11.49703	\N	2022-12-03 00:04:50.547755	2022-12-03 00:02:11.494581	61	22	\N	4	4	\N	\N	\N	\N	\N	60	-1	\N	-1	-1
f	2022-12-03 00:02:11.50255	\N	2022-12-03 00:04:50.558618	2022-12-03 00:02:11.497195	62	22	\N	4	4	1	\N	19	4	\N	61	-1	\N	-1	-1
f	2022-12-03 00:02:11.507732	\N	2022-12-03 00:04:50.569547	2022-12-03 00:02:11.502772	63	51	\N	4	4	2	\N	16	4	\N	61	-1	\N	-1	-1
f	2022-12-03 00:02:11.510835	\N	2022-12-03 00:04:50.579709	2022-12-03 00:02:11.507922	64	22	\N	4	4	\N	\N	\N	\N	\N	60	-1	\N	-1	-1
f	2022-12-03 00:02:11.513546	\N	2022-12-03 00:04:50.593242	2022-12-03 00:02:11.51104	65	22	\N	4	4	\N	\N	\N	6	\N	64	-1	\N	-1	-1
f	2022-12-03 00:02:11.517477	\N	2022-12-03 00:04:50.602629	2022-12-03 00:02:11.513729	66	22	\N	4	4	3	\N	10	4	\N	65	-1	\N	-1	-1
f	2022-12-03 00:02:11.521912	\N	2022-12-03 00:04:50.610745	2022-12-03 00:02:11.517697	67	23	\N	4	4	4	\N	10	4	\N	65	-1	\N	-1	-1
f	2022-11-25 13:46:13.702712	\N	2022-12-05 10:53:05.594211	2022-11-25 13:46:13.70075	16	\N	\N	1	1	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-11-25 13:46:13.712537	\N	2022-12-05 10:53:05.609223	2022-11-25 13:46:13.702928	17	23	\N	1	1	\N	\N	\N	6	\N	16	-1	\N	-1	-1
f	2022-11-25 13:46:13.717535	\N	2022-12-05 10:53:05.618744	2022-11-25 13:46:13.712771	18	21	\N	1	1	\N	\N	19	4	\N	17	-1	\N	-1	-1
f	2022-11-25 13:46:13.722195	\N	2022-12-05 10:53:05.628366	2022-11-25 13:46:13.717755	19	27	\N	1	1	\N	\N	13	4	\N	17	-1	\N	-1	-1
f	2022-11-25 13:46:13.725607	\N	2022-12-05 10:53:05.638474	2022-11-25 13:46:13.722416	20	\N	\N	1	1	\N	\N	\N	6	\N	16	-1	\N	-1	-1
f	2022-11-25 13:46:13.728971	\N	2022-12-05 10:53:05.647997	2022-11-25 13:46:13.725811	21	\N	\N	1	1	\N	\N	\N	6	\N	20	-1	\N	-1	-1
f	2022-11-25 13:46:13.733799	\N	2022-12-05 10:53:05.657429	2022-11-25 13:46:13.729196	22	21	\N	1	1	\N	\N	20	4	\N	21	-1	\N	-1	-1
f	2022-11-25 13:46:13.738461	\N	2022-12-05 10:53:05.666427	2022-11-25 13:46:13.734008	23	28	\N	1	1	\N	\N	18	4	\N	21	-1	\N	-1	-1
f	2022-11-25 13:46:13.743537	\N	2022-12-05 10:53:05.6758	2022-11-25 13:46:13.738702	24	24	\N	1	1	\N	\N	11	4	\N	20	-1	\N	-1	-1
f	2022-11-22 13:53:46.931446	\N	2022-12-05 10:54:27.88188	2022-11-22 13:53:46.931232	10	\N	\N	2	2	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-11-22 13:53:46.938428	\N	2022-12-05 10:54:27.889849	2022-11-22 13:53:46.931722	11	22	\N	2	2	\N	\N	16	4	\N	10	-1	\N	-1	-1
f	2022-11-22 13:53:46.942604	\N	2022-12-05 10:54:27.897668	2022-11-22 13:53:46.938709	12	24	\N	2	2	\N	\N	18	4	\N	10	-1	\N	-1	-1
f	2022-12-03 00:02:11.525432	\N	2022-12-03 00:04:50.618772	2022-12-03 00:02:11.522203	68	\N	\N	4	4	\N	\N	\N	\N	\N	64	-1	\N	-1	-1
f	2022-12-03 00:02:11.528774	\N	2022-12-03 00:04:50.631635	2022-12-03 00:02:11.525654	69	22	\N	4	4	\N	\N	\N	\N	\N	60	-1	\N	-1	-1
f	2022-12-03 00:02:11.532531	\N	2022-12-03 00:04:50.641378	2022-12-03 00:02:11.528987	70	22	\N	4	4	\N	\N	\N	\N	\N	69	-1	\N	-1	-1
f	2022-12-03 00:02:11.53578	\N	2022-12-03 00:04:50.651567	2022-12-03 00:02:11.532915	71	\N	\N	4	4	\N	\N	\N	\N	\N	69	-1	\N	-1	-1
f	2022-12-03 00:02:11.538639	\N	2022-12-03 00:04:50.659833	2022-12-03 00:02:11.535984	72	22	\N	4	4	\N	\N	\N	\N	\N	60	-1	\N	-1	-1
f	2022-12-03 00:02:11.542009	\N	2022-12-03 00:04:50.668503	2022-12-03 00:02:11.538829	73	22	\N	4	4	\N	\N	\N	\N	\N	72	-1	\N	-1	-1
f	2022-12-03 00:02:11.544655	\N	2022-12-03 00:04:50.677353	2022-12-03 00:02:11.542205	74	\N	\N	4	4	\N	\N	\N	\N	\N	72	-1	\N	-1	-1
f	2022-12-03 00:02:11.54709	\N	2022-12-03 00:04:50.686155	2022-12-03 00:02:11.544833	75	22	\N	4	4	\N	\N	\N	\N	\N	60	-1	\N	-1	-1
f	2022-12-03 00:02:11.550479	\N	2022-12-03 00:04:50.695464	2022-12-03 00:02:11.547287	76	22	\N	4	4	\N	\N	\N	\N	\N	75	-1	\N	-1	-1
f	2022-12-03 00:02:11.554056	\N	2022-12-03 00:04:50.7024	2022-12-03 00:02:11.550702	77	\N	\N	4	4	\N	\N	\N	\N	\N	75	-1	\N	-1	-1
f	2022-12-03 00:07:52.397636	\N	2022-12-03 00:12:00.834462	2022-12-03 00:07:52.39539	97	\N	\N	5	5	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:07:52.402709	\N	2022-12-03 00:12:00.844923	2022-12-03 00:07:52.397831	98	22	\N	5	5	6	\N	21	4	\N	97	-1	\N	-1	-1
f	2022-12-03 00:07:52.406398	\N	2022-12-03 00:12:00.854349	2022-12-03 00:07:52.402947	99	\N	\N	5	5	\N	\N	\N	\N	\N	97	-1	\N	-1	-1
f	2023-04-27 20:03:23.318998	\N	2023-04-27 21:14:57.274679	2023-04-27 20:03:23.316669	1084	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 20:03:23.350275	\N	2023-04-27 21:14:57.409875	2023-04-27 20:03:23.344182	1089	22	\N	7	7	\N	\N	\N	9	50	1088	-1	\N	-1	-1
f	2022-12-03 00:04:50.71433	\N	2022-12-03 00:14:02.007743	2022-12-03 00:04:50.711717	78	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:04:50.718598	\N	2022-12-03 00:14:02.021947	2022-12-03 00:04:50.714541	79	22	\N	4	4	\N	\N	\N	8	\N	78	-1	\N	-1	-1
f	2022-12-03 00:04:50.721742	\N	2022-12-03 00:14:02.032714	2022-12-03 00:04:50.718779	80	22	\N	4	4	\N	\N	\N	\N	\N	79	-1	\N	-1	-1
f	2022-12-03 00:04:50.726773	\N	2022-12-03 00:14:02.044808	2022-12-03 00:04:50.721952	81	22	\N	4	4	1	\N	19	4	\N	80	-1	\N	-1	-1
f	2022-12-03 00:04:50.732306	\N	2022-12-03 00:14:02.05557	2022-12-03 00:04:50.72697	82	51	\N	4	4	2	\N	16	4	\N	80	-1	\N	-1	-1
f	2022-12-03 00:04:50.735868	\N	2022-12-03 00:14:02.066643	2022-12-03 00:04:50.732656	83	22	\N	4	4	\N	\N	\N	\N	\N	79	-1	\N	-1	-1
f	2022-12-03 00:04:50.738474	\N	2022-12-03 00:14:02.077588	2022-12-03 00:04:50.736132	84	22	\N	4	4	\N	\N	\N	6	\N	83	-1	\N	-1	-1
f	2022-12-03 00:04:50.74385	\N	2022-12-03 00:14:02.08851	2022-12-03 00:04:50.738637	85	22	\N	4	4	3	\N	10	4	\N	84	-1	\N	-1	-1
f	2022-12-03 00:04:50.748874	\N	2022-12-03 00:14:02.099682	2022-12-03 00:04:50.744094	86	23	\N	4	4	4	\N	10	4	\N	84	-1	\N	-1	-1
f	2022-12-03 00:04:50.753846	\N	2022-12-03 00:14:02.109621	2022-12-03 00:04:50.749114	87	25	\N	4	4	5	\N	16	4	\N	83	-1	\N	-1	-1
f	2022-12-03 00:04:50.757666	\N	2022-12-03 00:14:02.119051	2022-12-03 00:04:50.754219	88	22	\N	4	4	\N	\N	\N	\N	\N	79	-1	\N	-1	-1
f	2022-12-03 00:04:50.761286	\N	2022-12-03 00:14:02.12974	2022-12-03 00:04:50.757908	89	22	\N	4	4	\N	\N	\N	\N	\N	88	-1	\N	-1	-1
f	2022-12-03 00:04:50.764495	\N	2022-12-03 00:14:02.139783	2022-12-03 00:04:50.761496	90	\N	\N	4	4	\N	\N	\N	\N	\N	88	-1	\N	-1	-1
f	2022-12-03 00:04:50.76814	\N	2022-12-03 00:14:02.150056	2022-12-03 00:04:50.764699	91	22	\N	4	4	\N	\N	\N	\N	\N	79	-1	\N	-1	-1
f	2022-12-03 00:04:50.771637	\N	2022-12-03 00:14:02.160651	2022-12-03 00:04:50.768412	92	22	\N	4	4	\N	\N	\N	\N	\N	91	-1	\N	-1	-1
f	2022-12-03 00:04:50.775042	\N	2022-12-03 00:14:02.171103	2022-12-03 00:04:50.771872	93	\N	\N	4	4	\N	\N	\N	\N	\N	91	-1	\N	-1	-1
f	2022-12-03 00:04:50.778318	\N	2022-12-03 00:14:02.181195	2022-12-03 00:04:50.775273	94	22	\N	4	4	\N	\N	\N	\N	\N	79	-1	\N	-1	-1
f	2022-12-03 00:04:50.781101	\N	2022-12-03 00:14:02.19327	2022-12-03 00:04:50.778536	95	22	\N	4	4	\N	\N	\N	\N	\N	94	-1	\N	-1	-1
f	2022-12-03 00:04:50.783839	\N	2022-12-03 00:14:02.209044	2022-12-03 00:04:50.781303	96	\N	\N	4	4	\N	\N	\N	\N	\N	94	-1	\N	-1	-1
f	2022-12-03 00:14:02.223031	\N	2022-12-03 19:58:01.020924	2022-12-03 00:14:02.219578	103	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:14:02.231427	\N	2022-12-03 19:58:01.030532	2022-12-03 00:14:02.223426	104	22	\N	4	4	\N	\N	\N	8	\N	103	-1	\N	-1	-1
f	2022-12-03 00:14:02.23572	\N	2022-12-03 19:58:01.039018	2022-12-03 00:14:02.231771	105	22	\N	4	4	\N	\N	\N	\N	\N	104	-1	\N	-1	-1
f	2022-12-03 00:14:02.2425	\N	2022-12-03 19:58:01.047199	2022-12-03 00:14:02.235956	106	22	\N	4	4	1	\N	19	4	\N	105	-1	\N	-1	-1
f	2022-12-03 00:14:02.249286	\N	2022-12-03 19:58:01.055208	2022-12-03 00:14:02.242772	107	51	\N	4	4	2	\N	16	4	\N	105	-1	\N	-1	-1
f	2022-12-03 00:14:02.253669	\N	2022-12-03 19:58:01.063456	2022-12-03 00:14:02.249589	108	22	\N	4	4	\N	\N	\N	\N	\N	104	-1	\N	-1	-1
f	2022-12-03 00:14:02.257786	\N	2022-12-03 19:58:01.07067	2022-12-03 00:14:02.253966	109	22	\N	4	4	\N	\N	\N	6	\N	108	-1	\N	-1	-1
f	2022-12-03 00:14:02.264111	\N	2022-12-03 19:58:01.079636	2022-12-03 00:14:02.258079	110	22	\N	4	4	3	\N	10	4	\N	109	-1	\N	-1	-1
f	2022-12-03 00:14:02.269925	\N	2022-12-03 19:58:01.087734	2022-12-03 00:14:02.264352	111	23	\N	4	4	4	\N	10	4	\N	109	-1	\N	-1	-1
f	2022-12-03 00:14:02.276832	\N	2022-12-03 19:58:01.095714	2022-12-03 00:14:02.270148	112	25	\N	4	4	5	\N	16	4	\N	108	-1	\N	-1	-1
f	2022-12-03 00:14:02.28125	\N	2022-12-03 19:58:01.104155	2022-12-03 00:14:02.277096	113	22	\N	4	4	\N	\N	\N	\N	\N	104	-1	\N	-1	-1
f	2022-12-03 00:14:02.285682	\N	2022-12-03 19:58:01.11286	2022-12-03 00:14:02.281616	114	22	\N	4	4	\N	5	\N	5	\N	113	-1	\N	-1	-1
f	2022-12-03 00:14:02.291167	\N	2022-12-03 19:58:01.121112	2022-12-03 00:14:02.286003	115	51	\N	4	4	8	\N	17	4	\N	113	-1	\N	-1	-1
f	2022-12-03 00:14:02.295303	\N	2022-12-03 19:58:01.129275	2022-12-03 00:14:02.291453	116	22	\N	4	4	\N	\N	\N	\N	\N	104	-1	\N	-1	-1
f	2022-12-03 00:14:02.299716	\N	2022-12-03 19:58:01.137404	2022-12-03 00:14:02.295551	117	22	\N	4	4	\N	\N	\N	\N	\N	116	-1	\N	-1	-1
f	2022-12-03 00:14:02.303438	\N	2022-12-03 19:58:01.14622	2022-12-03 00:14:02.29997	118	\N	\N	4	4	\N	\N	\N	\N	\N	116	-1	\N	-1	-1
f	2022-12-03 00:14:02.307566	\N	2022-12-03 19:58:01.155973	2022-12-03 00:14:02.303689	119	22	\N	4	4	\N	\N	\N	\N	\N	104	-1	\N	-1	-1
f	2022-12-03 00:14:02.311416	\N	2022-12-03 19:58:01.16657	2022-12-03 00:14:02.307898	120	22	\N	4	4	\N	\N	\N	\N	\N	119	-1	\N	-1	-1
f	2022-12-03 00:14:02.315845	\N	2022-12-03 19:58:01.175249	2022-12-03 00:14:02.311788	121	\N	\N	4	4	\N	\N	\N	\N	\N	119	-1	\N	-1	-1
f	2022-12-03 19:58:01.201202	\N	2022-12-03 19:59:47.568791	2022-12-03 19:58:01.198728	122	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 19:58:01.206921	\N	2022-12-03 19:59:47.593636	2022-12-03 19:58:01.2015	123	22	\N	4	4	\N	\N	\N	8	\N	122	-1	\N	-1	-1
f	2022-12-03 19:58:01.209287	\N	2022-12-03 19:59:47.60496	2022-12-03 19:58:01.20714	124	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.211445	\N	2022-12-03 19:59:47.615187	2022-12-03 19:58:01.209436	125	22	\N	4	4	\N	\N	\N	6	\N	124	-1	\N	-1	-1
f	2022-12-03 19:58:01.215226	\N	2022-12-03 19:59:47.674998	2022-12-03 19:58:01.211626	126	22	\N	4	4	9	\N	19	4	\N	125	-1	\N	-1	-1
f	2022-12-03 19:58:01.218672	\N	2022-12-03 19:59:47.683493	2022-12-03 19:58:01.215415	127	51	\N	4	4	10	\N	18	4	\N	125	-1	\N	-1	-1
f	2022-12-03 19:58:01.221841	\N	2022-12-03 19:59:47.694452	2022-12-03 19:58:01.218858	128	\N	\N	4	4	\N	\N	\N	6	\N	124	-1	\N	-1	-1
f	2022-12-03 19:58:01.224667	\N	2022-12-03 19:59:47.705993	2022-12-03 19:58:01.22212	129	\N	\N	4	4	\N	\N	\N	6	\N	128	-1	\N	-1	-1
f	2022-12-03 19:58:01.228575	\N	2022-12-03 19:59:47.717689	2022-12-03 19:58:01.224841	130	22	\N	4	4	11	\N	10	4	\N	129	-1	\N	-1	-1
f	2022-12-03 19:58:01.23217	\N	2022-12-03 19:59:47.780652	2022-12-03 19:58:01.22883	131	\N	\N	4	4	\N	\N	\N	\N	\N	129	-1	\N	-1	-1
f	2022-12-03 19:58:01.236283	\N	2022-12-03 19:59:47.795335	2022-12-03 19:58:01.232401	132	25	\N	4	4	12	\N	16	4	\N	128	-1	\N	-1	-1
f	2022-12-03 19:58:01.240207	\N	2022-12-03 19:59:47.806335	2022-12-03 19:58:01.236514	133	25	\N	4	4	13	\N	16	4	\N	128	-1	\N	-1	-1
f	2022-12-03 19:58:01.243393	\N	2022-12-03 19:59:47.869353	2022-12-03 19:58:01.240425	134	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.246402	\N	2022-12-03 19:59:47.877827	2022-12-03 19:58:01.243596	135	22	\N	4	4	\N	\N	\N	\N	\N	134	-1	\N	-1	-1
f	2022-12-03 19:58:01.249178	\N	2022-12-03 19:59:47.886009	2022-12-03 19:58:01.246594	136	\N	\N	4	4	\N	\N	\N	\N	\N	134	-1	\N	-1	-1
f	2022-12-03 19:58:01.251723	\N	2022-12-03 19:59:47.893607	2022-12-03 19:58:01.249369	137	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.254391	\N	2022-12-03 19:59:47.900498	2022-12-03 19:58:01.251893	138	22	\N	4	4	\N	\N	\N	\N	\N	137	-1	\N	-1	-1
f	2022-12-03 19:58:01.256702	\N	2022-12-03 19:59:47.907926	2022-12-03 19:58:01.254561	139	\N	\N	4	4	\N	\N	\N	\N	\N	137	-1	\N	-1	-1
f	2022-12-03 19:58:01.259112	\N	2022-12-03 19:59:47.915271	2022-12-03 19:58:01.256883	140	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.261422	\N	2022-12-03 19:59:47.923643	2022-12-03 19:58:01.25928	141	22	\N	4	4	\N	\N	\N	\N	\N	140	-1	\N	-1	-1
f	2022-12-03 19:58:01.263748	\N	2022-12-03 19:59:47.934145	2022-12-03 19:58:01.261615	142	\N	\N	4	4	\N	\N	\N	\N	\N	140	-1	\N	-1	-1
f	2022-12-03 19:58:01.265955	\N	2022-12-03 19:59:47.941861	2022-12-03 19:58:01.263896	143	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.268283	\N	2022-12-03 19:59:47.949896	2022-12-03 19:58:01.266136	144	22	\N	4	4	\N	\N	\N	\N	\N	143	-1	\N	-1	-1
f	2022-12-03 19:58:01.271295	\N	2022-12-03 19:59:47.959435	2022-12-03 19:58:01.268461	145	\N	\N	4	4	\N	\N	\N	\N	\N	143	-1	\N	-1	-1
f	2022-12-03 19:58:01.274552	\N	2022-12-03 19:59:48.024898	2022-12-03 19:58:01.271531	146	22	\N	4	4	\N	\N	\N	\N	\N	123	-1	\N	-1	-1
f	2022-12-03 19:58:01.277813	\N	2022-12-03 19:59:48.045366	2022-12-03 19:58:01.274785	147	22	\N	4	4	\N	\N	\N	\N	\N	146	-1	\N	-1	-1
f	2022-12-03 19:58:01.28078	\N	2022-12-03 19:59:48.06404	2022-12-03 19:58:01.278072	148	\N	\N	4	4	\N	\N	\N	\N	\N	146	-1	\N	-1	-1
f	2022-12-03 19:59:48.081655	\N	2022-12-03 20:06:16.136464	2022-12-03 19:59:48.079067	149	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 19:59:48.086142	\N	2022-12-03 20:06:16.145154	2022-12-03 19:59:48.081852	150	22	\N	4	4	\N	\N	\N	8	\N	149	-1	\N	-1	-1
f	2022-12-03 19:59:48.088909	\N	2022-12-03 20:06:16.153656	2022-12-03 19:59:48.086328	151	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.091822	\N	2022-12-03 20:06:16.161543	2022-12-03 19:59:48.089149	152	22	\N	4	4	\N	\N	\N	6	\N	151	-1	\N	-1	-1
f	2022-12-03 19:59:48.096202	\N	2022-12-03 20:06:16.169813	2022-12-03 19:59:48.092018	153	22	\N	4	4	9	\N	19	4	\N	152	-1	\N	-1	-1
f	2022-12-03 19:59:48.100808	\N	2022-12-03 20:06:16.178499	2022-12-03 19:59:48.09639	154	51	\N	4	4	10	\N	18	4	\N	152	-1	\N	-1	-1
f	2022-12-03 19:59:48.103382	\N	2022-12-03 20:06:16.187056	2022-12-03 19:59:48.101023	155	\N	\N	4	4	\N	\N	\N	6	\N	151	-1	\N	-1	-1
f	2022-12-03 19:59:48.105623	\N	2022-12-03 20:06:16.195835	2022-12-03 19:59:48.103533	156	\N	\N	4	4	\N	\N	\N	6	\N	155	-1	\N	-1	-1
f	2022-12-03 19:59:48.109234	\N	2022-12-03 20:06:16.204987	2022-12-03 19:59:48.105772	157	22	\N	4	4	11	\N	10	4	\N	156	-1	\N	-1	-1
f	2022-12-03 00:12:00.874247	\N	2023-04-27 13:57:23.723355	2022-12-03 00:12:00.866529	101	22	\N	5	5	6	\N	21	4	\N	100	-1	\N	-1	-1
f	2022-12-03 19:59:48.111836	\N	2022-12-03 20:06:16.213656	2022-12-03 19:59:48.109381	158	\N	\N	4	4	\N	\N	\N	\N	\N	156	-1	\N	-1	-1
f	2022-12-03 19:59:48.116276	\N	2022-12-03 20:06:16.225988	2022-12-03 19:59:48.112039	159	25	\N	4	4	12	\N	16	4	\N	155	-1	\N	-1	-1
f	2022-12-03 19:59:48.121247	\N	2022-12-03 20:06:16.235222	2022-12-03 19:59:48.116493	160	25	\N	4	4	13	\N	16	4	\N	155	-1	\N	-1	-1
f	2022-12-03 19:59:48.124064	\N	2022-12-03 20:06:16.244178	2022-12-03 19:59:48.12147	161	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.126693	\N	2022-12-03 20:06:16.253029	2022-12-03 19:59:48.124248	162	22	\N	4	4	\N	\N	\N	6	\N	161	-1	\N	-1	-1
f	2022-12-03 19:59:48.129404	\N	2022-12-03 20:06:16.26168	2022-12-03 19:59:48.126886	163	22	\N	4	4	\N	5	\N	5	\N	162	-1	\N	-1	-1
f	2022-12-03 19:59:48.132891	\N	2022-12-03 20:06:16.270204	2022-12-03 19:59:48.129599	164	51	\N	4	4	14	\N	17	4	\N	162	-1	\N	-1	-1
f	2022-12-03 19:59:48.135675	\N	2022-12-03 20:06:16.284077	2022-12-03 19:59:48.133111	165	\N	\N	4	4	\N	\N	\N	\N	\N	161	-1	\N	-1	-1
f	2022-12-03 19:59:48.13839	\N	2022-12-03 20:06:16.292365	2022-12-03 19:59:48.135862	166	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.140724	\N	2022-12-03 20:06:16.300661	2022-12-03 19:59:48.138578	167	22	\N	4	4	\N	\N	\N	\N	\N	166	-1	\N	-1	-1
f	2022-12-03 19:59:48.143376	\N	2022-12-03 20:06:16.30863	2022-12-03 19:59:48.140891	168	\N	\N	4	4	\N	\N	\N	\N	\N	166	-1	\N	-1	-1
f	2022-12-03 19:59:48.145946	\N	2022-12-03 20:06:16.317726	2022-12-03 19:59:48.14358	169	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.148341	\N	2022-12-03 20:06:16.326074	2022-12-03 19:59:48.146137	170	22	\N	4	4	\N	\N	\N	\N	\N	169	-1	\N	-1	-1
f	2022-12-03 19:59:48.15053	\N	2022-12-03 20:06:16.335174	2022-12-03 19:59:48.148519	171	\N	\N	4	4	\N	\N	\N	\N	\N	169	-1	\N	-1	-1
f	2022-12-03 19:59:48.15364	\N	2022-12-03 20:06:16.343646	2022-12-03 19:59:48.15076	172	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.15682	\N	2022-12-03 20:06:16.356551	2022-12-03 19:59:48.153963	173	22	\N	4	4	\N	\N	\N	\N	\N	172	-1	\N	-1	-1
f	2022-12-03 19:59:48.159201	\N	2022-12-03 20:06:16.365914	2022-12-03 19:59:48.157003	174	\N	\N	4	4	\N	\N	\N	\N	\N	172	-1	\N	-1	-1
f	2022-12-03 19:59:48.161689	\N	2022-12-03 20:06:16.374738	2022-12-03 19:59:48.159363	175	22	\N	4	4	\N	\N	\N	\N	\N	150	-1	\N	-1	-1
f	2022-12-03 19:59:48.164162	\N	2022-12-03 20:06:16.382653	2022-12-03 19:59:48.161898	176	22	\N	4	4	\N	\N	\N	\N	\N	175	-1	\N	-1	-1
f	2022-12-03 19:59:48.166898	\N	2022-12-03 20:06:16.391269	2022-12-03 19:59:48.164339	177	\N	\N	4	4	\N	\N	\N	\N	\N	175	-1	\N	-1	-1
f	2022-12-03 20:06:16.409632	\N	2022-12-03 20:08:40.011471	2022-12-03 20:06:16.407442	178	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 20:06:16.41399	\N	2022-12-03 20:08:40.020897	2022-12-03 20:06:16.409821	179	22	\N	4	4	\N	\N	\N	8	\N	178	-1	\N	-1	-1
f	2022-12-03 20:06:16.417015	\N	2022-12-03 20:08:40.029847	2022-12-03 20:06:16.414166	180	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.420148	\N	2022-12-03 20:08:40.038187	2022-12-03 20:06:16.417263	181	22	\N	4	4	\N	\N	\N	6	\N	180	-1	\N	-1	-1
f	2022-12-03 20:06:16.424668	\N	2022-12-03 20:08:40.046859	2022-12-03 20:06:16.420416	182	22	\N	4	4	9	\N	19	4	\N	181	-1	\N	-1	-1
f	2022-12-03 20:06:16.429421	\N	2022-12-03 20:08:40.05684	2022-12-03 20:06:16.424854	183	51	\N	4	4	10	\N	18	4	\N	181	-1	\N	-1	-1
f	2022-12-03 20:06:16.432522	\N	2022-12-03 20:08:40.066864	2022-12-03 20:06:16.429625	184	24	\N	4	4	\N	\N	\N	6	\N	180	-1	\N	-1	-1
f	2022-12-03 20:06:16.435223	\N	2022-12-03 20:08:40.079884	2022-12-03 20:06:16.432789	185	\N	\N	4	4	\N	\N	\N	6	\N	184	-1	\N	-1	-1
f	2022-12-03 20:06:16.43984	\N	2022-12-03 20:08:40.095818	2022-12-03 20:06:16.435427	186	22	\N	4	4	11	\N	10	4	\N	185	-1	\N	-1	-1
f	2022-12-03 20:06:16.44256	\N	2022-12-03 20:08:40.113515	2022-12-03 20:06:16.440036	187	\N	\N	4	4	\N	\N	\N	\N	\N	185	-1	\N	-1	-1
f	2022-12-03 20:06:16.447203	\N	2022-12-03 20:08:40.13267	2022-12-03 20:06:16.442743	188	25	\N	4	4	12	\N	16	4	\N	184	-1	\N	-1	-1
f	2022-12-03 20:06:16.451788	\N	2022-12-03 20:08:40.15335	2022-12-03 20:06:16.447395	189	25	\N	4	4	13	\N	16	4	\N	184	-1	\N	-1	-1
f	2022-12-03 20:06:16.454563	\N	2022-12-03 20:08:40.170712	2022-12-03 20:06:16.45199	190	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.457089	\N	2022-12-03 20:08:40.185118	2022-12-03 20:06:16.454803	191	22	\N	4	4	\N	\N	\N	6	\N	190	-1	\N	-1	-1
f	2022-12-03 20:06:16.459544	\N	2022-12-03 20:08:40.200453	2022-12-03 20:06:16.457272	192	22	\N	4	4	\N	5	\N	5	\N	191	-1	\N	-1	-1
f	2022-12-03 20:06:16.463746	\N	2022-12-03 20:08:40.215979	2022-12-03 20:06:16.459715	193	51	\N	4	4	14	\N	17	4	\N	191	-1	\N	-1	-1
f	2022-12-03 20:06:16.466453	\N	2022-12-03 20:08:40.228488	2022-12-03 20:06:16.46392	194	24	\N	4	4	\N	\N	\N	6	\N	190	-1	\N	-1	-1
f	2022-12-03 20:06:16.469243	\N	2022-12-03 20:08:40.241642	2022-12-03 20:06:16.466641	195	\N	\N	4	4	\N	\N	\N	6	\N	194	-1	\N	-1	-1
f	2022-12-03 20:06:16.472049	\N	2022-12-03 20:08:40.250655	2022-12-03 20:06:16.469466	196	\N	\N	4	4	\N	\N	\N	6	\N	195	-1	\N	-1	-1
f	2022-12-03 20:06:16.474621	\N	2022-12-03 20:08:40.260578	2022-12-03 20:06:16.472228	197	\N	\N	4	4	\N	\N	\N	6	\N	196	-1	\N	-1	-1
f	2022-12-03 20:06:16.477761	\N	2022-12-03 20:08:40.268187	2022-12-03 20:06:16.474786	198	22	\N	4	4	16	\N	13	4	\N	197	-1	\N	-1	-1
f	2022-12-03 20:06:16.481296	\N	2022-12-03 20:08:40.276064	2022-12-03 20:06:16.477932	199	52	\N	4	4	17	\N	12	4	\N	197	-1	\N	-1	-1
f	2022-12-03 20:06:16.484058	\N	2022-12-03 20:08:40.283342	2022-12-03 20:06:16.481533	200	\N	\N	4	4	\N	\N	\N	\N	\N	196	-1	\N	-1	-1
f	2022-12-03 20:06:16.486623	\N	2022-12-03 20:08:40.290779	2022-12-03 20:06:16.484234	201	\N	\N	4	4	\N	\N	\N	\N	\N	195	-1	\N	-1	-1
f	2022-12-03 20:06:16.490298	\N	2022-12-03 20:08:40.297782	2022-12-03 20:06:16.486805	202	25	\N	4	4	15	\N	16	4	\N	194	-1	\N	-1	-1
f	2022-12-03 20:06:16.492906	\N	2022-12-03 20:08:40.305406	2022-12-03 20:06:16.490507	203	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.495798	\N	2022-12-03 20:08:40.31321	2022-12-03 20:06:16.493072	204	22	\N	4	4	\N	\N	\N	\N	\N	203	-1	\N	-1	-1
f	2022-12-03 20:06:16.498567	\N	2022-12-03 20:08:40.321854	2022-12-03 20:06:16.496023	205	\N	\N	4	4	\N	\N	\N	\N	\N	203	-1	\N	-1	-1
f	2022-12-03 20:06:16.501018	\N	2022-12-03 20:08:40.330426	2022-12-03 20:06:16.498755	206	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.503493	\N	2022-12-03 20:08:40.338074	2022-12-03 20:06:16.501186	207	22	\N	4	4	\N	\N	\N	\N	\N	206	-1	\N	-1	-1
f	2022-12-03 20:06:16.506125	\N	2022-12-03 20:08:40.345819	2022-12-03 20:06:16.503709	208	\N	\N	4	4	\N	\N	\N	\N	\N	206	-1	\N	-1	-1
f	2022-12-03 20:06:16.508601	\N	2022-12-03 20:08:40.35372	2022-12-03 20:06:16.506326	209	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.511097	\N	2022-12-03 20:08:40.361	2022-12-03 20:06:16.508788	210	22	\N	4	4	\N	\N	\N	\N	\N	209	-1	\N	-1	-1
f	2022-12-03 20:06:16.51398	\N	2022-12-03 20:08:40.368442	2022-12-03 20:06:16.511294	211	\N	\N	4	4	\N	\N	\N	\N	\N	209	-1	\N	-1	-1
f	2022-12-03 20:06:16.516959	\N	2022-12-03 20:08:40.376595	2022-12-03 20:06:16.51418	212	22	\N	4	4	\N	\N	\N	\N	\N	179	-1	\N	-1	-1
f	2022-12-03 20:06:16.5195	\N	2022-12-03 20:08:40.384313	2022-12-03 20:06:16.517152	213	22	\N	4	4	\N	\N	\N	\N	\N	212	-1	\N	-1	-1
f	2022-12-03 20:06:16.522191	\N	2022-12-03 20:08:40.393749	2022-12-03 20:06:16.51967	214	\N	\N	4	4	\N	\N	\N	\N	\N	212	-1	\N	-1	-1
f	2022-12-03 20:08:40.407116	\N	2022-12-03 20:10:21.172028	2022-12-03 20:08:40.405164	215	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 20:08:40.411142	\N	2022-12-03 20:10:21.183487	2022-12-03 20:08:40.407283	216	22	\N	4	4	\N	\N	\N	8	\N	215	-1	\N	-1	-1
f	2022-12-03 20:08:40.413613	\N	2022-12-03 20:10:21.193758	2022-12-03 20:08:40.411313	217	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.415776	\N	2022-12-03 20:10:21.202225	2022-12-03 20:08:40.413771	218	22	\N	4	4	\N	\N	\N	6	\N	217	-1	\N	-1	-1
f	2022-12-03 20:08:40.419908	\N	2022-12-03 20:10:21.211125	2022-12-03 20:08:40.415931	219	22	\N	4	4	9	\N	19	4	\N	218	-1	\N	-1	-1
f	2022-12-03 20:08:40.424566	\N	2022-12-03 20:10:21.220104	2022-12-03 20:08:40.42009	220	51	\N	4	4	10	\N	18	4	\N	218	-1	\N	-1	-1
f	2022-12-03 20:08:40.427157	\N	2022-12-03 20:10:21.228892	2022-12-03 20:08:40.424756	221	24	\N	4	4	\N	\N	\N	6	\N	217	-1	\N	-1	-1
f	2022-12-03 20:08:40.429628	\N	2022-12-03 20:10:21.237156	2022-12-03 20:08:40.427334	222	\N	\N	4	4	\N	\N	\N	6	\N	221	-1	\N	-1	-1
f	2022-12-03 20:08:40.434214	\N	2022-12-03 20:10:21.245126	2022-12-03 20:08:40.429802	223	22	\N	4	4	11	\N	10	4	\N	222	-1	\N	-1	-1
f	2022-12-03 20:08:40.43732	\N	2022-12-03 20:10:21.252228	2022-12-03 20:08:40.434464	224	\N	\N	4	4	\N	\N	\N	\N	\N	222	-1	\N	-1	-1
f	2022-12-03 20:08:40.442242	\N	2022-12-03 20:10:21.260337	2022-12-03 20:08:40.437551	225	25	\N	4	4	12	\N	16	4	\N	221	-1	\N	-1	-1
f	2022-12-03 20:08:40.446507	\N	2022-12-03 20:10:21.268581	2022-12-03 20:08:40.442454	226	25	\N	4	4	13	\N	16	4	\N	221	-1	\N	-1	-1
f	2022-12-03 20:08:40.44956	\N	2022-12-03 20:10:21.278486	2022-12-03 20:08:40.446697	227	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.452439	\N	2022-12-03 20:10:21.288124	2022-12-03 20:08:40.44979	228	22	\N	4	4	\N	\N	\N	6	\N	227	-1	\N	-1	-1
f	2022-12-03 20:08:40.455025	\N	2022-12-03 20:10:21.296169	2022-12-03 20:08:40.452642	229	22	\N	4	4	\N	5	\N	5	\N	228	-1	\N	-1	-1
f	2022-12-03 20:08:40.459478	\N	2022-12-03 20:10:21.304133	2022-12-03 20:08:40.455208	230	51	\N	4	4	14	\N	17	4	\N	228	-1	\N	-1	-1
f	2022-12-03 20:08:40.462531	\N	2022-12-03 20:10:21.312372	2022-12-03 20:08:40.459666	231	24	\N	4	4	\N	\N	\N	6	\N	227	-1	\N	-1	-1
f	2022-12-03 20:08:40.46528	\N	2022-12-03 20:10:21.32047	2022-12-03 20:08:40.462738	232	\N	\N	4	4	\N	\N	\N	6	\N	231	-1	\N	-1	-1
f	2022-12-03 20:08:40.467867	\N	2022-12-03 20:10:21.328573	2022-12-03 20:08:40.465491	233	\N	\N	4	4	\N	\N	\N	6	\N	232	-1	\N	-1	-1
f	2022-12-03 20:08:40.470623	\N	2022-12-03 20:10:21.337148	2022-12-03 20:08:40.46806	234	\N	\N	4	4	\N	\N	\N	6	\N	233	-1	\N	-1	-1
f	2022-12-03 20:08:40.475109	\N	2022-12-03 20:10:21.345462	2022-12-03 20:08:40.470833	235	22	\N	4	4	16	\N	13	4	\N	234	-1	\N	-1	-1
f	2022-12-03 20:08:40.479631	\N	2022-12-03 20:10:21.353397	2022-12-03 20:08:40.475321	236	52	\N	4	4	17	\N	12	4	\N	234	-1	\N	-1	-1
f	2022-12-03 20:08:40.486494	\N	2022-12-03 20:10:21.372569	2022-12-03 20:08:40.48296	238	23	\N	4	4	19	\N	10	4	\N	232	-1	\N	-1	-1
f	2022-12-03 20:08:40.491736	\N	2022-12-03 20:10:21.380242	2022-12-03 20:08:40.486703	239	25	\N	4	4	15	\N	16	4	\N	231	-1	\N	-1	-1
f	2022-12-03 20:08:40.494671	\N	2022-12-03 20:10:21.389245	2022-12-03 20:08:40.491949	240	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.497602	\N	2022-12-03 20:10:21.398501	2022-12-03 20:08:40.494867	241	22	\N	4	4	\N	\N	\N	\N	\N	240	-1	\N	-1	-1
f	2022-12-03 20:08:40.500438	\N	2022-12-03 20:10:21.410031	2022-12-03 20:08:40.497806	242	\N	\N	4	4	\N	\N	\N	\N	\N	240	-1	\N	-1	-1
f	2022-12-03 20:08:40.502938	\N	2022-12-03 20:10:21.421878	2022-12-03 20:08:40.500626	243	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.505269	\N	2022-12-03 20:10:21.433188	2022-12-03 20:08:40.503117	244	22	\N	4	4	\N	\N	\N	\N	\N	243	-1	\N	-1	-1
f	2022-12-03 20:08:40.509817	\N	2022-12-03 20:10:21.45328	2022-12-03 20:08:40.507693	246	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.512167	\N	2022-12-03 20:10:21.463045	2022-12-03 20:08:40.509971	247	22	\N	4	4	\N	\N	\N	\N	\N	246	-1	\N	-1	-1
f	2022-12-03 20:08:40.514993	\N	2022-12-03 20:10:21.47366	2022-12-03 20:08:40.512357	248	\N	\N	4	4	\N	\N	\N	\N	\N	246	-1	\N	-1	-1
f	2022-12-03 20:08:40.517457	\N	2022-12-03 20:10:21.4857	2022-12-03 20:08:40.515184	249	22	\N	4	4	\N	\N	\N	\N	\N	216	-1	\N	-1	-1
f	2022-12-03 20:08:40.519639	\N	2022-12-03 20:10:21.498052	2022-12-03 20:08:40.517612	250	22	\N	4	4	\N	\N	\N	\N	\N	249	-1	\N	-1	-1
f	2022-12-03 20:08:40.521881	\N	2022-12-03 20:10:21.505513	2022-12-03 20:08:40.519785	251	\N	\N	4	4	\N	\N	\N	\N	\N	249	-1	\N	-1	-1
f	2022-12-03 20:08:40.482784	\N	2022-12-03 20:10:21.36129	2022-12-03 20:08:40.479801	237	53	\N	4	4	18	\N	10	4	\N	233	-1	\N	-1	-1
f	2022-12-03 20:08:40.50754	\N	2022-12-03 20:10:21.443016	2022-12-03 20:08:40.505439	245	\N	\N	4	4	\N	\N	\N	\N	\N	243	-1	\N	-1	-1
f	2022-12-03 20:10:21.512097	\N	2022-12-03 20:11:55.443285	2022-12-03 20:10:21.510415	252	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 20:10:21.516577	\N	2022-12-03 20:11:55.460922	2022-12-03 20:10:21.512281	253	22	\N	4	4	\N	\N	\N	8	\N	252	-1	\N	-1	-1
f	2022-12-03 20:10:21.519228	\N	2022-12-03 20:11:55.473045	2022-12-03 20:10:21.51677	254	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.521862	\N	2022-12-03 20:11:55.488563	2022-12-03 20:10:21.519411	255	22	\N	4	4	\N	\N	\N	6	\N	254	-1	\N	-1	-1
f	2022-12-03 20:10:21.52663	\N	2022-12-03 20:11:55.5043	2022-12-03 20:10:21.522066	256	22	\N	4	4	9	\N	19	4	\N	255	-1	\N	-1	-1
f	2022-12-03 20:10:21.531792	\N	2022-12-03 20:11:55.517742	2022-12-03 20:10:21.526835	257	51	\N	4	4	10	\N	18	4	\N	255	-1	\N	-1	-1
f	2022-12-03 20:10:21.534401	\N	2022-12-03 20:11:55.530529	2022-12-03 20:10:21.531997	258	24	\N	4	4	\N	\N	\N	6	\N	254	-1	\N	-1	-1
f	2022-12-03 20:10:21.537054	\N	2022-12-03 20:11:55.545622	2022-12-03 20:10:21.53458	259	\N	\N	4	4	\N	\N	\N	6	\N	258	-1	\N	-1	-1
f	2022-12-03 20:10:21.541272	\N	2022-12-03 20:11:55.557244	2022-12-03 20:10:21.537241	260	22	\N	4	4	11	\N	10	4	\N	259	-1	\N	-1	-1
f	2022-12-03 20:10:21.544026	\N	2022-12-03 20:11:55.565916	2022-12-03 20:10:21.541478	261	\N	\N	4	4	\N	\N	\N	\N	\N	259	-1	\N	-1	-1
f	2022-12-03 20:10:21.548693	\N	2022-12-03 20:11:55.575619	2022-12-03 20:10:21.544229	262	25	\N	4	4	12	\N	16	4	\N	258	-1	\N	-1	-1
f	2022-12-03 20:10:21.553582	\N	2022-12-03 20:11:55.584228	2022-12-03 20:10:21.548969	263	25	\N	4	4	13	\N	16	4	\N	258	-1	\N	-1	-1
f	2022-12-03 20:10:21.55656	\N	2022-12-03 20:11:55.592354	2022-12-03 20:10:21.55382	264	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.558991	\N	2022-12-03 20:11:55.601234	2022-12-03 20:10:21.556727	265	22	\N	4	4	\N	\N	\N	6	\N	264	-1	\N	-1	-1
f	2022-12-03 20:10:21.56163	\N	2022-12-03 20:11:55.611267	2022-12-03 20:10:21.559225	266	22	\N	4	4	\N	5	\N	5	\N	265	-1	\N	-1	-1
f	2022-12-03 20:10:21.566176	\N	2022-12-03 20:11:55.621767	2022-12-03 20:10:21.56181	267	51	\N	4	4	14	\N	17	4	\N	265	-1	\N	-1	-1
f	2022-12-03 20:10:21.568864	\N	2022-12-03 20:11:55.63302	2022-12-03 20:10:21.566405	268	24	\N	4	4	\N	\N	\N	6	\N	264	-1	\N	-1	-1
f	2022-12-03 20:10:21.571918	\N	2022-12-03 20:11:55.644304	2022-12-03 20:10:21.569118	269	\N	\N	4	4	\N	\N	\N	6	\N	268	-1	\N	-1	-1
f	2022-12-03 20:10:21.574858	\N	2022-12-03 20:11:55.65411	2022-12-03 20:10:21.572137	270	\N	\N	4	4	\N	\N	\N	6	\N	269	-1	\N	-1	-1
f	2022-12-03 20:10:21.57789	\N	2022-12-03 20:11:55.663012	2022-12-03 20:10:21.575119	271	\N	\N	4	4	\N	\N	\N	6	\N	270	-1	\N	-1	-1
f	2022-12-03 20:10:21.582896	\N	2022-12-03 20:11:55.672025	2022-12-03 20:10:21.578115	272	22	\N	4	4	16	\N	13	4	\N	271	-1	\N	-1	-1
f	2022-12-03 20:10:21.587404	\N	2022-12-03 20:11:55.681328	2022-12-03 20:10:21.583101	273	52	\N	4	4	17	\N	12	4	\N	271	-1	\N	-1	-1
f	2022-12-03 20:10:21.591837	\N	2022-12-03 20:11:55.690125	2022-12-03 20:10:21.587597	274	53	\N	4	4	18	\N	10	4	\N	270	-1	\N	-1	-1
f	2022-12-03 20:10:21.596961	\N	2022-12-03 20:11:55.69961	2022-12-03 20:10:21.592046	275	23	\N	4	4	19	\N	10	4	\N	269	-1	\N	-1	-1
f	2022-12-03 20:10:21.602202	\N	2022-12-03 20:11:55.708782	2022-12-03 20:10:21.597228	276	25	\N	4	4	15	\N	16	4	\N	268	-1	\N	-1	-1
f	2022-12-03 20:10:21.605103	\N	2022-12-03 20:11:55.718292	2022-12-03 20:10:21.602409	277	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.607896	\N	2022-12-03 20:11:55.727223	2022-12-03 20:10:21.605314	278	22	\N	4	4	\N	\N	\N	6	\N	277	-1	\N	-1	-1
f	2022-12-03 20:10:21.61061	\N	2022-12-03 20:11:55.73626	2022-12-03 20:10:21.608098	279	22	\N	4	4	\N	\N	\N	\N	\N	278	-1	\N	-1	-1
f	2022-12-03 20:10:21.613251	\N	2022-12-03 20:11:55.744781	2022-12-03 20:10:21.61079	280	\N	\N	4	4	\N	\N	\N	\N	\N	278	-1	\N	-1	-1
f	2022-12-03 20:10:21.615684	\N	2022-12-03 20:11:55.753249	2022-12-03 20:10:21.613451	281	24	\N	4	4	\N	\N	\N	6	\N	277	-1	\N	-1	-1
f	2022-12-03 20:10:21.618452	\N	2022-12-03 20:11:55.761235	2022-12-03 20:10:21.61585	282	\N	\N	4	4	\N	\N	\N	\N	\N	281	-1	\N	-1	-1
f	2022-12-03 20:10:21.620987	\N	2022-12-03 20:11:55.770323	2022-12-03 20:10:21.618645	283	\N	\N	4	4	\N	\N	\N	\N	\N	281	-1	\N	-1	-1
f	2022-12-03 20:10:21.623785	\N	2022-12-03 20:11:55.780239	2022-12-03 20:10:21.621166	284	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.626391	\N	2022-12-03 20:11:55.78877	2022-12-03 20:10:21.623989	285	22	\N	4	4	\N	\N	\N	\N	\N	284	-1	\N	-1	-1
f	2022-12-03 20:10:21.629154	\N	2022-12-03 20:11:55.797239	2022-12-03 20:10:21.626677	286	\N	\N	4	4	\N	\N	\N	\N	\N	284	-1	\N	-1	-1
f	2022-12-03 20:10:21.63169	\N	2022-12-03 20:11:55.806605	2022-12-03 20:10:21.629346	287	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.634367	\N	2022-12-03 20:11:55.81569	2022-12-03 20:10:21.631861	288	22	\N	4	4	\N	\N	\N	\N	\N	287	-1	\N	-1	-1
f	2022-12-03 20:10:21.636859	\N	2022-12-03 20:11:55.824696	2022-12-03 20:10:21.634571	289	\N	\N	4	4	\N	\N	\N	\N	\N	287	-1	\N	-1	-1
f	2022-12-03 20:10:21.639526	\N	2022-12-03 20:11:55.833749	2022-12-03 20:10:21.637062	290	22	\N	4	4	\N	\N	\N	\N	\N	253	-1	\N	-1	-1
f	2022-12-03 20:10:21.642461	\N	2022-12-03 20:11:55.842817	2022-12-03 20:10:21.63973	291	22	\N	4	4	\N	\N	\N	\N	\N	290	-1	\N	-1	-1
f	2022-12-03 20:10:21.6452	\N	2022-12-03 20:11:55.851421	2022-12-03 20:10:21.642681	292	\N	\N	4	4	\N	\N	\N	\N	\N	290	-1	\N	-1	-1
f	2022-12-03 20:11:55.858827	\N	2022-12-03 20:25:28.670901	2022-12-03 20:11:55.857044	293	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 20:11:55.863989	\N	2022-12-03 20:25:28.691976	2022-12-03 20:11:55.859103	294	22	\N	4	4	\N	\N	\N	8	\N	293	-1	\N	-1	-1
f	2022-12-03 20:11:55.867332	\N	2022-12-03 20:25:28.710346	2022-12-03 20:11:55.864255	295	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:55.870394	\N	2022-12-03 20:25:28.728459	2022-12-03 20:11:55.867559	296	22	\N	4	4	\N	\N	\N	6	\N	295	-1	\N	-1	-1
f	2022-12-03 20:11:55.875114	\N	2022-12-03 20:25:28.745095	2022-12-03 20:11:55.870632	297	22	\N	4	4	9	\N	19	4	\N	296	-1	\N	-1	-1
f	2022-12-03 20:11:55.880895	\N	2022-12-03 20:25:28.762875	2022-12-03 20:11:55.875371	298	51	\N	4	4	10	\N	18	4	\N	296	-1	\N	-1	-1
f	2022-12-03 20:11:55.884014	\N	2022-12-03 20:25:28.783147	2022-12-03 20:11:55.881112	299	24	\N	4	4	\N	\N	\N	6	\N	295	-1	\N	-1	-1
f	2022-12-03 20:11:55.88732	\N	2022-12-03 20:25:28.800449	2022-12-03 20:11:55.884251	300	\N	\N	4	4	\N	\N	\N	6	\N	299	-1	\N	-1	-1
f	2022-12-03 20:11:55.892764	\N	2022-12-03 20:25:28.817829	2022-12-03 20:11:55.887563	301	22	\N	4	4	11	\N	10	4	\N	300	-1	\N	-1	-1
f	2022-12-03 20:11:55.895924	\N	2022-12-03 20:25:28.835118	2022-12-03 20:11:55.893005	302	\N	\N	4	4	\N	\N	\N	\N	\N	300	-1	\N	-1	-1
f	2022-12-03 20:11:55.900773	\N	2022-12-03 20:25:28.850476	2022-12-03 20:11:55.896173	303	25	\N	4	4	12	\N	16	4	\N	299	-1	\N	-1	-1
f	2022-12-03 20:11:55.905795	\N	2022-12-03 20:25:28.866471	2022-12-03 20:11:55.900971	304	25	\N	4	4	13	\N	16	4	\N	299	-1	\N	-1	-1
f	2022-12-03 20:11:55.909575	\N	2022-12-03 20:25:28.883043	2022-12-03 20:11:55.906028	305	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:55.912525	\N	2022-12-03 20:25:28.900549	2022-12-03 20:11:55.909798	306	22	\N	4	4	\N	\N	\N	6	\N	305	-1	\N	-1	-1
f	2022-12-03 20:11:55.915484	\N	2022-12-03 20:25:28.919551	2022-12-03 20:11:55.91273	307	22	\N	4	4	\N	5	\N	5	\N	306	-1	\N	-1	-1
f	2022-12-03 20:11:55.920644	\N	2022-12-03 20:25:28.935726	2022-12-03 20:11:55.915697	308	51	\N	4	4	14	\N	17	4	\N	306	-1	\N	-1	-1
f	2022-12-03 20:11:55.923407	\N	2022-12-03 20:25:28.950118	2022-12-03 20:11:55.920861	309	24	\N	4	4	\N	\N	\N	6	\N	305	-1	\N	-1	-1
f	2022-12-03 20:11:55.926538	\N	2022-12-03 20:25:28.965071	2022-12-03 20:11:55.923624	310	\N	\N	4	4	\N	\N	\N	6	\N	309	-1	\N	-1	-1
f	2022-12-03 20:11:55.929557	\N	2022-12-03 20:25:28.982534	2022-12-03 20:11:55.926763	311	\N	\N	4	4	\N	\N	\N	6	\N	310	-1	\N	-1	-1
f	2022-12-03 20:11:55.932729	\N	2022-12-03 20:25:29.001581	2022-12-03 20:11:55.929789	312	\N	\N	4	4	\N	\N	\N	6	\N	311	-1	\N	-1	-1
f	2022-12-03 20:11:55.938016	\N	2022-12-03 20:25:29.021478	2022-12-03 20:11:55.932934	313	22	\N	4	4	16	\N	13	4	\N	312	-1	\N	-1	-1
f	2022-12-03 20:11:55.943741	\N	2022-12-03 20:25:29.039205	2022-12-03 20:11:55.938307	314	52	\N	4	4	17	\N	12	4	\N	312	-1	\N	-1	-1
f	2022-12-03 20:11:55.948772	\N	2022-12-03 20:25:29.056795	2022-12-03 20:11:55.943948	315	53	\N	4	4	18	\N	10	4	\N	311	-1	\N	-1	-1
f	2022-12-03 20:11:55.95428	\N	2022-12-03 20:25:29.073575	2022-12-03 20:11:55.94901	316	23	\N	4	4	19	\N	10	4	\N	310	-1	\N	-1	-1
f	2022-12-03 20:11:55.95913	\N	2022-12-03 20:25:29.096957	2022-12-03 20:11:55.954536	317	25	\N	4	4	15	\N	16	4	\N	309	-1	\N	-1	-1
f	2022-12-03 20:11:55.962375	\N	2022-12-03 20:25:29.116064	2022-12-03 20:11:55.959351	318	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:55.965806	\N	2022-12-03 20:25:29.132565	2022-12-03 20:11:55.962623	319	22	\N	4	4	\N	\N	\N	6	\N	318	-1	\N	-1	-1
f	2022-12-03 20:11:55.968903	\N	2022-12-03 20:25:29.147952	2022-12-03 20:11:55.966046	320	22	\N	4	4	\N	5	\N	5	\N	319	-1	\N	-1	-1
f	2022-12-03 20:11:55.972338	\N	2022-12-03 20:25:29.162612	2022-12-03 20:11:55.969121	321	\N	\N	4	4	\N	\N	\N	\N	\N	319	-1	\N	-1	-1
f	2022-12-03 20:11:55.976143	\N	2022-12-03 20:25:29.176769	2022-12-03 20:11:55.972607	322	24	\N	4	4	\N	\N	\N	6	\N	318	-1	\N	-1	-1
f	2022-12-03 20:11:55.979211	\N	2022-12-03 20:25:29.193297	2022-12-03 20:11:55.976397	323	\N	\N	4	4	\N	\N	\N	\N	\N	322	-1	\N	-1	-1
f	2022-12-03 20:11:55.982079	\N	2022-12-03 20:25:29.209282	2022-12-03 20:11:55.979416	324	\N	\N	4	4	\N	\N	\N	\N	\N	322	-1	\N	-1	-1
f	2022-12-03 20:11:55.985766	\N	2022-12-03 20:25:29.224414	2022-12-03 20:11:55.98228	325	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:55.988976	\N	2022-12-03 20:25:29.23988	2022-12-03 20:11:55.986051	326	22	\N	4	4	\N	\N	\N	\N	\N	325	-1	\N	-1	-1
f	2022-12-03 20:11:55.992202	\N	2022-12-03 20:25:29.255064	2022-12-03 20:11:55.989196	327	\N	\N	4	4	\N	\N	\N	\N	\N	325	-1	\N	-1	-1
f	2022-12-03 20:11:55.995896	\N	2022-12-03 20:25:29.270702	2022-12-03 20:11:55.992522	328	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:55.998723	\N	2022-12-03 20:25:29.284455	2022-12-03 20:11:55.996131	329	22	\N	4	4	\N	\N	\N	\N	\N	328	-1	\N	-1	-1
f	2022-12-03 20:11:56.00204	\N	2022-12-03 20:25:29.298094	2022-12-03 20:11:55.998917	330	\N	\N	4	4	\N	\N	\N	\N	\N	328	-1	\N	-1	-1
f	2022-12-03 20:11:56.004959	\N	2022-12-03 20:25:29.310531	2022-12-03 20:11:56.002279	331	22	\N	4	4	\N	\N	\N	\N	\N	294	-1	\N	-1	-1
f	2022-12-03 20:11:56.008314	\N	2022-12-03 20:25:29.324898	2022-12-03 20:11:56.00527	332	22	\N	4	4	\N	\N	\N	\N	\N	331	-1	\N	-1	-1
f	2022-12-03 20:11:56.011279	\N	2022-12-03 20:25:29.339132	2022-12-03 20:11:56.008578	333	\N	\N	4	4	\N	\N	\N	\N	\N	331	-1	\N	-1	-1
t	2022-12-03 20:25:29.36376	\N	\N	2022-12-03 20:25:29.361862	334	\N	\N	4	4	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-12-03 20:25:29.367815	\N	\N	2022-12-03 20:25:29.363929	335	22	\N	4	4	\N	\N	\N	8	\N	334	-1	\N	\N	-1
t	2022-12-03 20:25:29.370072	\N	\N	2022-12-03 20:25:29.367985	336	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.372263	\N	\N	2022-12-03 20:25:29.370225	337	22	\N	4	4	\N	\N	\N	6	\N	336	-1	\N	\N	-1
t	2022-12-03 20:25:29.376397	\N	\N	2022-12-03 20:25:29.372418	338	22	\N	4	4	9	\N	19	4	\N	337	-1	\N	\N	-1
t	2022-12-03 20:25:29.381302	\N	\N	2022-12-03 20:25:29.376578	339	51	\N	4	4	10	\N	18	4	\N	337	-1	\N	\N	-1
t	2022-12-03 20:25:29.38398	\N	\N	2022-12-03 20:25:29.381522	340	24	\N	4	4	\N	\N	\N	6	\N	336	-1	\N	\N	-1
t	2022-12-03 20:25:29.386687	\N	\N	2022-12-03 20:25:29.384149	341	\N	\N	4	4	\N	\N	\N	6	\N	340	-1	\N	\N	-1
t	2022-12-03 20:25:29.391357	\N	\N	2022-12-03 20:25:29.386873	342	22	\N	4	4	11	\N	10	4	\N	341	-1	\N	\N	-1
t	2022-12-03 20:25:29.39421	\N	\N	2022-12-03 20:25:29.391559	343	\N	\N	4	4	\N	\N	\N	\N	\N	341	-1	\N	\N	-1
t	2022-12-03 20:25:29.399101	\N	\N	2022-12-03 20:25:29.394386	344	25	\N	4	4	12	\N	16	4	\N	340	-1	\N	\N	-1
t	2022-12-03 20:25:29.404025	\N	\N	2022-12-03 20:25:29.399304	345	25	\N	4	4	13	\N	16	4	\N	340	-1	\N	\N	-1
t	2022-12-03 20:25:29.4069	\N	\N	2022-12-03 20:25:29.404226	346	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.410322	\N	\N	2022-12-03 20:25:29.407064	347	22	\N	4	4	\N	\N	\N	6	\N	346	-1	\N	\N	-1
t	2022-12-03 20:25:29.413365	\N	\N	2022-12-03 20:25:29.410549	348	22	\N	4	4	\N	5	\N	5	\N	347	-1	\N	\N	-1
t	2022-12-03 20:25:29.418027	\N	\N	2022-12-03 20:25:29.413598	349	51	\N	4	4	14	\N	17	4	\N	347	-1	\N	\N	-1
t	2022-12-03 20:25:29.420888	\N	\N	2022-12-03 20:25:29.418221	350	24	\N	4	4	\N	\N	\N	6	\N	346	-1	\N	\N	-1
t	2022-12-03 20:25:29.423433	\N	\N	2022-12-03 20:25:29.421072	351	\N	\N	4	4	\N	\N	\N	6	\N	350	-1	\N	\N	-1
t	2022-12-03 20:25:29.425959	\N	\N	2022-12-03 20:25:29.423654	352	\N	\N	4	4	\N	\N	\N	6	\N	351	-1	\N	\N	-1
t	2022-12-03 20:25:29.428594	\N	\N	2022-12-03 20:25:29.426123	353	\N	\N	4	4	\N	\N	\N	6	\N	352	-1	\N	\N	-1
t	2022-12-03 20:25:29.433207	\N	\N	2022-12-03 20:25:29.428802	354	22	\N	4	4	16	\N	13	4	\N	353	-1	\N	\N	-1
t	2022-12-03 20:25:29.438293	\N	\N	2022-12-03 20:25:29.433423	355	52	\N	4	4	17	\N	12	4	\N	353	-1	\N	\N	-1
t	2022-12-03 20:25:29.4473	\N	\N	2022-12-03 20:25:29.44292	357	23	\N	4	4	19	\N	10	4	\N	351	-1	\N	\N	-1
t	2022-12-03 20:25:29.451638	\N	\N	2022-12-03 20:25:29.447501	358	25	\N	4	4	15	\N	16	4	\N	350	-1	\N	\N	-1
t	2022-12-03 20:25:29.454016	\N	\N	2022-12-03 20:25:29.451821	359	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.456218	\N	\N	2022-12-03 20:25:29.454171	360	22	\N	4	4	\N	\N	\N	6	\N	359	-1	\N	\N	-1
t	2022-12-03 20:25:29.458292	\N	\N	2022-12-03 20:25:29.456387	361	22	\N	4	4	\N	5	\N	5	\N	360	-1	\N	\N	-1
t	2022-12-03 20:25:29.461656	\N	\N	2022-12-03 20:25:29.458436	362	54	\N	4	4	20	\N	17	4	\N	360	-1	\N	\N	-1
t	2022-12-03 20:25:29.464071	\N	\N	2022-12-03 20:25:29.461841	363	24	\N	4	4	\N	\N	\N	6	\N	359	-1	\N	\N	-1
t	2022-12-03 20:25:29.471542	\N	\N	2022-12-03 20:25:29.467885	365	23	\N	4	4	22	\N	19	4	\N	363	-1	\N	\N	-1
t	2022-12-03 20:25:29.474104	\N	\N	2022-12-03 20:25:29.471751	366	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.476339	\N	\N	2022-12-03 20:25:29.474283	367	22	\N	4	4	\N	\N	\N	\N	\N	366	-1	\N	\N	-1
t	2022-12-03 20:25:29.478851	\N	\N	2022-12-03 20:25:29.476511	368	\N	\N	4	4	\N	\N	\N	\N	\N	366	-1	\N	\N	-1
t	2022-12-03 20:25:29.481244	\N	\N	2022-12-03 20:25:29.479034	369	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.483494	\N	\N	2022-12-03 20:25:29.481397	370	22	\N	4	4	\N	\N	\N	\N	\N	369	-1	\N	\N	-1
t	2022-12-03 20:25:29.485676	\N	\N	2022-12-03 20:25:29.483664	371	\N	\N	4	4	\N	\N	\N	\N	\N	369	-1	\N	\N	-1
t	2022-12-03 20:25:29.487864	\N	\N	2022-12-03 20:25:29.485839	372	22	\N	4	4	\N	\N	\N	\N	\N	335	-1	\N	\N	-1
t	2022-12-03 20:25:29.489974	\N	\N	2022-12-03 20:25:29.488016	373	22	\N	4	4	\N	\N	\N	\N	\N	372	-1	\N	\N	-1
t	2022-12-03 20:25:29.492484	\N	\N	2022-12-03 20:25:29.49012	374	\N	\N	4	4	\N	\N	\N	\N	\N	372	-1	\N	\N	-1
t	2022-12-05 10:53:05.68337	\N	\N	2022-12-05 10:53:05.681382	375	\N	\N	1	1	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-12-05 10:53:05.689739	\N	\N	2022-12-05 10:53:05.683624	376	23	\N	1	1	\N	\N	\N	6	\N	375	-1	\N	\N	-1
t	2022-12-05 10:53:05.694532	\N	\N	2022-12-05 10:53:05.689964	377	22	\N	1	1	\N	\N	18	4	\N	376	-1	\N	\N	-1
t	2022-12-05 10:53:05.699809	\N	\N	2022-12-05 10:53:05.694873	378	27	\N	1	1	\N	\N	13	4	\N	376	-1	\N	\N	-1
t	2022-12-05 10:53:05.703232	\N	\N	2022-12-05 10:53:05.70004	379	\N	\N	1	1	\N	\N	\N	6	\N	375	-1	\N	\N	-1
t	2022-12-05 10:53:05.706319	\N	\N	2022-12-05 10:53:05.703449	380	\N	\N	1	1	\N	\N	\N	6	\N	379	-1	\N	\N	-1
t	2022-12-05 10:53:05.711077	\N	\N	2022-12-05 10:53:05.706516	381	21	\N	1	1	\N	\N	20	4	\N	380	-1	\N	\N	-1
t	2022-12-05 10:53:05.715891	\N	\N	2022-12-05 10:53:05.711378	382	28	\N	1	1	\N	\N	18	4	\N	380	-1	\N	\N	-1
t	2022-12-05 10:53:05.721008	\N	\N	2022-12-05 10:53:05.716197	383	24	\N	1	1	\N	\N	11	4	\N	379	-1	\N	\N	-1
f	2022-12-05 10:54:27.905327	\N	2022-12-05 10:56:49.838553	2022-12-05 10:54:27.90332	384	\N	\N	2	2	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-05 10:54:27.910601	\N	2022-12-05 10:56:49.847866	2022-12-05 10:54:27.905525	385	22	\N	2	2	\N	\N	18	4	\N	384	-1	\N	-1	-1
f	2022-12-05 10:54:27.914356	\N	2022-12-05 10:56:49.85687	2022-12-05 10:54:27.910803	386	24	\N	2	2	\N	\N	18	4	\N	384	-1	\N	-1	-1
f	2022-12-05 10:56:49.864045	\N	2022-12-05 11:13:57.158332	2022-12-05 10:56:49.862155	387	\N	\N	2	2	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-05 10:56:49.870249	\N	2022-12-05 11:13:57.170802	2022-12-05 10:56:49.864283	388	22	\N	2	2	\N	\N	18	4	\N	387	-1	\N	-1	-1
f	2022-12-05 10:56:49.874919	\N	2022-12-05 11:13:57.179599	2022-12-05 10:56:49.870476	389	24	\N	2	2	\N	\N	18	4	\N	387	-1	\N	-1	-1
t	2022-12-03 20:25:29.442739	2022-12-11 18:08:02.3745	\N	2022-12-03 20:25:29.438502	356	53	\N	4	4	11	\N	10	4	\N	352	-1	-1	\N	-1
t	2022-12-03 20:25:29.467692	2022-12-11 17:53:43.026305	\N	2022-12-03 20:25:29.464227	364	22	\N	4	4	9	\N	19	4	\N	363	-1	-1	\N	-1
f	2022-12-05 11:11:01.426861	\N	2023-04-27 13:57:33.107373	2022-12-05 11:11:01.423128	391	22	\N	6	6	23	\N	18	4	\N	390	-1	\N	-1	-1
f	2022-12-05 11:11:01.429977	\N	2023-04-27 13:57:33.114843	2022-12-05 11:11:01.427066	392	\N	\N	6	6	\N	\N	\N	\N	\N	390	-1	\N	-1	-1
f	2023-01-16 21:56:34.223653	\N	2023-04-27 19:56:43.678689	2023-01-16 21:56:34.219384	393	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-16 22:22:52.774584	\N	2023-01-17 12:35:09.379974	2023-01-16 22:22:52.771874	403	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 12:35:09.396613	\N	2023-01-17 15:48:51.621455	2023-01-17 12:35:09.394463	404	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 12:35:09.406689	\N	2023-01-17 15:48:51.631767	2023-01-17 12:35:09.396841	405	22	\N	9	9	\N	\N	\N	9	49	404	-1	\N	-1	-1
f	2023-01-17 15:48:51.640891	\N	2023-01-17 15:49:42.448138	2023-01-17 15:48:51.638621	406	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 15:48:51.648978	\N	2023-01-17 15:49:42.457765	2023-01-17 15:48:51.641126	407	22	\N	9	9	\N	\N	\N	9	\N	406	-1	\N	-1	-1
f	2023-01-17 15:48:51.653515	\N	2023-01-17 15:49:42.468796	2023-01-17 15:48:51.649295	408	22	\N	9	9	\N	\N	\N	7	\N	407	-1	\N	-1	-1
f	2023-01-17 15:48:51.657213	\N	2023-01-17 15:49:42.480607	2023-01-17 15:48:51.653771	409	22	\N	9	9	\N	\N	\N	\N	\N	408	-1	\N	-1	-1
f	2023-01-17 15:48:51.66074	\N	2023-01-17 15:49:42.493853	2023-01-17 15:48:51.657412	410	22	\N	9	9	\N	\N	\N	\N	\N	409	-1	\N	-1	-1
f	2023-01-17 15:48:51.664562	\N	2023-01-17 15:49:42.505455	2023-01-17 15:48:51.660986	411	\N	\N	9	9	\N	\N	\N	\N	\N	409	-1	\N	-1	-1
f	2023-01-17 15:48:51.668199	\N	2023-01-17 15:49:42.516417	2023-01-17 15:48:51.664789	412	22	\N	9	9	\N	\N	\N	\N	\N	408	-1	\N	-1	-1
f	2023-01-17 15:48:51.671709	\N	2023-01-17 15:49:42.526791	2023-01-17 15:48:51.668423	413	22	\N	9	9	\N	\N	\N	\N	\N	412	-1	\N	-1	-1
f	2023-01-17 15:48:51.67597	\N	2023-01-17 15:49:42.536903	2023-01-17 15:48:51.671925	414	\N	\N	9	9	\N	\N	\N	\N	\N	412	-1	\N	-1	-1
f	2023-01-17 15:48:51.679773	\N	2023-01-17 15:49:42.547558	2023-01-17 15:48:51.676248	415	\N	\N	9	9	\N	\N	\N	\N	\N	407	-1	\N	-1	-1
f	2023-01-17 15:49:42.556463	\N	2023-01-17 15:58:06.843234	2023-01-17 15:49:42.553572	416	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 15:49:42.565509	\N	2023-01-17 15:58:06.855911	2023-01-17 15:49:42.556722	417	22	\N	9	9	\N	\N	\N	9	\N	416	-1	\N	-1	-1
f	2023-01-17 15:49:42.571123	\N	2023-01-17 15:58:06.867135	2023-01-17 15:49:42.565802	418	22	\N	9	9	\N	\N	\N	7	\N	417	-1	\N	-1	-1
f	2023-01-17 15:49:42.576127	\N	2023-01-17 15:58:06.878548	2023-01-17 15:49:42.571442	419	22	\N	9	9	\N	\N	\N	\N	\N	418	-1	\N	-1	-1
f	2023-01-17 15:49:42.581395	\N	2023-01-17 15:58:06.888761	2023-01-17 15:49:42.576456	420	22	\N	9	9	\N	\N	\N	6	\N	419	-1	\N	-1	-1
f	2023-01-17 15:49:42.5868	\N	2023-01-17 15:58:06.899117	2023-01-17 15:49:42.581652	421	\N	\N	9	9	\N	\N	\N	\N	\N	420	-1	\N	-1	-1
f	2023-01-17 15:49:42.594968	\N	2023-01-17 15:58:06.909035	2023-01-17 15:49:42.587139	422	\N	\N	9	9	\N	\N	\N	\N	\N	420	-1	\N	-1	-1
f	2023-01-17 15:49:42.600468	\N	2023-01-17 15:58:06.919288	2023-01-17 15:49:42.595316	423	\N	\N	9	9	\N	\N	\N	\N	\N	419	-1	\N	-1	-1
f	2023-01-17 15:49:42.606348	\N	2023-01-17 15:58:06.929547	2023-01-17 15:49:42.600847	424	22	\N	9	9	\N	\N	\N	\N	\N	418	-1	\N	-1	-1
f	2023-01-17 15:49:42.61116	\N	2023-01-17 15:58:06.940932	2023-01-17 15:49:42.606608	425	22	\N	9	9	\N	\N	\N	\N	\N	424	-1	\N	-1	-1
f	2023-01-17 15:49:42.615574	\N	2023-01-17 15:58:06.952311	2023-01-17 15:49:42.611478	426	\N	\N	9	9	\N	\N	\N	\N	\N	424	-1	\N	-1	-1
f	2023-01-17 15:49:42.619945	\N	2023-01-17 15:58:06.964681	2023-01-17 15:49:42.615793	427	\N	\N	9	9	\N	\N	\N	\N	\N	417	-1	\N	-1	-1
f	2023-01-17 15:58:06.989777	\N	2023-01-17 16:23:13.334847	2023-01-17 15:58:06.985745	428	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 15:58:06.998457	\N	2023-01-17 16:23:13.346139	2023-01-17 15:58:06.99012	429	22	\N	9	9	\N	\N	\N	9	\N	428	-1	\N	-1	-1
f	2023-01-17 15:58:07.003555	\N	2023-01-17 16:23:13.356674	2023-01-17 15:58:06.998798	430	22	\N	9	9	\N	\N	\N	7	\N	429	-1	\N	-1	-1
f	2023-01-17 15:58:07.008356	\N	2023-01-17 16:23:13.366018	2023-01-17 15:58:07.003795	431	22	\N	9	9	\N	\N	\N	\N	\N	430	-1	\N	-1	-1
f	2023-01-17 15:58:07.013162	\N	2023-01-17 16:23:13.375361	2023-01-17 15:58:07.008642	432	22	\N	9	9	\N	\N	\N	6	\N	431	-1	\N	-1	-1
f	2023-04-27 20:03:23.406408	\N	2023-04-27 21:14:57.582804	2023-04-27 20:03:23.401706	1097	\N	\N	7	7	\N	\N	\N	\N	\N	1085	-1	\N	-1	-1
f	2023-01-17 15:58:07.024726	\N	2023-01-17 16:23:13.395112	2023-01-17 15:58:07.019316	434	22	\N	9	9	25	\N	13	4	\N	433	-1	\N	-1	-1
f	2023-01-17 15:58:07.03939	\N	2023-01-17 16:23:13.415582	2023-01-17 15:58:07.033058	436	22	\N	9	9	26	\N	13	4	\N	435	-1	\N	-1	-1
f	2023-01-17 15:58:07.043722	\N	2023-01-17 16:23:13.42638	2023-01-17 15:58:07.03964	437	\N	\N	9	9	\N	\N	\N	\N	\N	431	-1	\N	-1	-1
f	2023-01-17 15:58:07.048592	\N	2023-01-17 16:23:13.437262	2023-01-17 15:58:07.043994	438	22	\N	9	9	\N	\N	\N	\N	\N	430	-1	\N	-1	-1
f	2023-01-17 15:58:07.05434	\N	2023-01-17 16:23:13.4471	2023-01-17 15:58:07.049059	439	22	\N	9	9	\N	\N	\N	\N	\N	438	-1	\N	-1	-1
f	2023-01-17 15:58:07.058682	\N	2023-01-17 16:23:13.456112	2023-01-17 15:58:07.054585	440	\N	\N	9	9	\N	\N	\N	\N	\N	438	-1	\N	-1	-1
f	2023-01-17 15:58:07.063072	\N	2023-01-17 16:23:13.465058	2023-01-17 15:58:07.058941	441	\N	\N	9	9	\N	\N	\N	\N	\N	429	-1	\N	-1	-1
f	2023-01-17 16:23:13.473214	\N	2023-01-17 16:24:27.307334	2023-01-17 16:23:13.470838	442	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 16:23:13.481462	\N	2023-01-17 16:24:27.317192	2023-01-17 16:23:13.473441	443	22	\N	9	9	\N	\N	\N	9	\N	442	-1	\N	-1	-1
f	2023-01-17 16:23:13.485589	\N	2023-01-17 16:24:27.32658	2023-01-17 16:23:13.481677	444	22	\N	9	9	\N	\N	\N	7	\N	443	-1	\N	-1	-1
f	2023-01-17 16:23:13.489162	\N	2023-01-17 16:24:27.336306	2023-01-17 16:23:13.485816	445	22	\N	9	9	\N	\N	\N	\N	\N	444	-1	\N	-1	-1
f	2023-01-17 16:23:13.4933	\N	2023-01-17 16:24:27.346386	2023-01-17 16:23:13.489367	446	22	\N	9	9	\N	\N	\N	6	\N	445	-1	\N	-1	-1
f	2023-01-17 16:23:13.497175	\N	2023-01-17 16:24:27.355542	2023-01-17 16:23:13.493606	447	22	\N	9	9	\N	\N	\N	9	\N	446	-1	\N	-1	-1
f	2023-01-17 16:23:13.503758	\N	2023-01-17 16:24:27.36558	2023-01-17 16:23:13.497388	448	22	\N	9	9	25	\N	13	4	\N	447	-1	\N	-1	-1
f	2023-01-17 16:23:13.508012	\N	2023-01-17 16:24:27.374779	2023-01-17 16:23:13.504063	449	51	\N	9	9	\N	\N	\N	9	\N	446	-1	\N	-1	-1
f	2023-01-17 16:23:13.514656	\N	2023-01-17 16:24:27.420369	2023-01-17 16:23:13.508241	450	22	\N	9	9	26	\N	13	4	\N	449	-1	\N	-1	-1
f	2023-01-17 16:23:13.519206	\N	2023-01-17 16:24:27.478028	2023-01-17 16:23:13.514892	451	\N	\N	9	9	\N	\N	\N	\N	\N	445	-1	\N	-1	-1
f	2023-01-17 16:23:13.522825	\N	2023-01-17 16:24:27.487742	2023-01-17 16:23:13.519434	452	22	\N	9	9	\N	\N	\N	\N	\N	444	-1	\N	-1	-1
f	2023-01-17 16:23:13.526558	\N	2023-01-17 16:24:27.496564	2023-01-17 16:23:13.523052	453	22	\N	9	9	\N	\N	\N	\N	\N	452	-1	\N	-1	-1
f	2023-01-17 16:23:13.530172	\N	2023-01-17 16:24:27.505995	2023-01-17 16:23:13.526816	454	\N	\N	9	9	\N	\N	\N	\N	\N	452	-1	\N	-1	-1
f	2023-01-17 16:23:13.533887	\N	2023-01-17 16:24:27.515363	2023-01-17 16:23:13.530391	455	\N	\N	9	9	\N	\N	\N	\N	\N	443	-1	\N	-1	-1
f	2023-01-17 16:24:27.523053	\N	2023-01-17 16:25:28.747687	2023-01-17 16:24:27.520737	456	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 16:24:27.529517	\N	2023-01-17 16:25:28.761855	2023-01-17 16:24:27.523265	457	22	\N	9	9	\N	\N	\N	9	\N	456	-1	\N	-1	-1
f	2023-01-17 16:24:27.533164	\N	2023-01-17 16:25:28.772909	2023-01-17 16:24:27.52972	458	22	\N	9	9	\N	\N	\N	7	\N	457	-1	\N	-1	-1
f	2023-01-17 16:24:27.537116	\N	2023-01-17 16:25:28.783645	2023-01-17 16:24:27.533364	459	22	\N	9	9	\N	\N	\N	\N	\N	458	-1	\N	-1	-1
f	2023-01-17 16:24:27.540411	\N	2023-01-17 16:25:28.795648	2023-01-17 16:24:27.537335	460	22	\N	9	9	\N	\N	\N	6	\N	459	-1	\N	-1	-1
f	2023-01-17 16:24:27.543714	\N	2023-01-17 16:25:28.805996	2023-01-17 16:24:27.540591	461	22	\N	9	9	\N	\N	\N	9	\N	460	-1	\N	-1	-1
f	2023-01-17 16:24:27.550946	\N	2023-01-17 16:25:28.818797	2023-01-17 16:24:27.543933	462	22	\N	9	9	25	\N	13	4	\N	461	-1	\N	-1	-1
f	2023-01-17 16:24:27.55452	\N	2023-01-17 16:25:28.830633	2023-01-17 16:24:27.551161	463	51	\N	9	9	\N	\N	\N	9	\N	460	-1	\N	-1	-1
f	2023-01-17 16:24:27.561252	\N	2023-01-17 16:25:28.840766	2023-01-17 16:24:27.554791	464	22	\N	9	9	26	\N	13	4	\N	463	-1	\N	-1	-1
f	2023-01-17 16:24:27.564761	\N	2023-01-17 16:25:28.851286	2023-01-17 16:24:27.561468	465	\N	\N	9	9	\N	\N	\N	6	\N	459	-1	\N	-1	-1
f	2023-01-17 16:24:27.576864	\N	2023-01-17 16:25:28.872477	2023-01-17 16:24:27.570402	467	22	\N	9	9	26	\N	13	4	\N	466	-1	\N	-1	-1
f	2023-01-17 16:24:27.580335	\N	2023-01-17 16:25:28.883551	2023-01-17 16:24:27.577093	468	\N	\N	9	9	\N	\N	\N	\N	\N	465	-1	\N	-1	-1
f	2023-01-17 16:24:27.583464	\N	2023-01-17 16:25:28.894208	2023-01-17 16:24:27.580543	469	22	\N	9	9	\N	\N	\N	\N	\N	458	-1	\N	-1	-1
f	2023-01-17 16:24:27.587172	\N	2023-01-17 16:25:28.904682	2023-01-17 16:24:27.58371	470	22	\N	9	9	\N	\N	\N	\N	\N	469	-1	\N	-1	-1
f	2023-01-17 16:24:27.590867	\N	2023-01-17 16:25:28.91592	2023-01-17 16:24:27.587389	471	\N	\N	9	9	\N	\N	\N	\N	\N	469	-1	\N	-1	-1
f	2023-01-17 16:24:27.594755	\N	2023-01-17 16:25:28.925446	2023-01-17 16:24:27.591111	472	\N	\N	9	9	\N	\N	\N	\N	\N	457	-1	\N	-1	-1
f	2023-01-17 16:25:28.933918	\N	2023-01-17 18:15:55.312652	2023-01-17 16:25:28.931444	473	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 16:25:28.941595	\N	2023-01-17 18:15:55.324477	2023-01-17 16:25:28.934178	474	22	\N	9	9	\N	\N	\N	9	\N	473	-1	\N	-1	-1
f	2023-01-17 15:58:07.032741	\N	2023-01-17 16:23:13.405542	2023-01-17 15:58:07.025078	435	51	\N	9	9	\N	\N	\N	9	61	432	-1	\N	-1	-1
f	2023-01-17 16:24:27.570182	\N	2023-01-17 16:25:28.862409	2023-01-17 16:24:27.565057	466	22	\N	9	9	\N	\N	\N	9	61	465	-1	\N	-1	-1
f	2023-01-16 22:04:26.615974	\N	2023-05-28 17:23:09.200993	2023-01-16 22:04:26.612882	396	\N	\N	8	8	\N	\N	\N	6	\N	395	-1	\N	-1	-1
f	2023-01-16 22:04:26.619597	\N	2023-05-28 17:23:09.2552	2023-01-16 22:04:26.616183	397	\N	\N	8	8	\N	\N	\N	6	\N	396	-1	\N	-1	-1
f	2023-01-16 22:04:26.627808	\N	2023-05-28 17:23:09.299974	2023-01-16 22:04:26.624526	399	\N	\N	8	8	\N	\N	\N	\N	\N	397	-1	\N	-1	-1
f	2023-01-16 22:04:26.631509	\N	2023-05-28 17:23:09.307138	2023-01-16 22:04:26.627999	400	\N	\N	8	8	\N	\N	\N	\N	\N	396	-1	\N	-1	-1
f	2023-01-16 22:04:26.634936	\N	2023-05-28 17:23:09.321664	2023-01-16 22:04:26.631731	401	\N	\N	8	8	\N	\N	\N	\N	\N	395	-1	\N	-1	-1
f	2023-01-16 22:04:26.638321	\N	2023-05-28 17:23:09.329327	2023-01-16 22:04:26.635154	402	\N	\N	8	8	\N	\N	\N	\N	\N	394	-1	\N	-1	-1
f	2023-01-17 16:25:28.946546	\N	2023-01-17 18:15:55.334875	2023-01-17 16:25:28.941948	475	22	\N	9	9	\N	\N	\N	7	\N	474	-1	\N	-1	-1
f	2023-01-17 16:25:28.953249	\N	2023-01-17 18:15:55.347511	2023-01-17 16:25:28.946845	476	22	\N	9	9	\N	\N	\N	\N	\N	475	-1	\N	-1	-1
f	2023-01-17 16:25:28.957492	\N	2023-01-17 18:15:55.35842	2023-01-17 16:25:28.953481	477	22	\N	9	9	\N	\N	\N	6	\N	476	-1	\N	-1	-1
f	2023-01-17 16:25:28.96281	\N	2023-01-17 18:15:55.372016	2023-01-17 16:25:28.957831	478	22	\N	9	9	\N	\N	\N	9	\N	477	-1	\N	-1	-1
f	2023-01-17 16:25:28.969916	\N	2023-01-17 18:15:55.383229	2023-01-17 16:25:28.963071	479	22	\N	9	9	25	\N	13	4	\N	478	-1	\N	-1	-1
f	2023-01-17 16:25:28.974655	\N	2023-01-17 18:15:55.393828	2023-01-17 16:25:28.970222	480	51	\N	9	9	\N	\N	\N	9	\N	477	-1	\N	-1	-1
f	2023-01-17 16:25:28.982135	\N	2023-01-17 18:15:55.406294	2023-01-17 16:25:28.974929	481	22	\N	9	9	26	\N	13	4	\N	480	-1	\N	-1	-1
f	2023-01-17 16:25:28.985905	\N	2023-01-17 18:15:55.41769	2023-01-17 16:25:28.982407	482	\N	\N	9	9	\N	\N	\N	6	\N	476	-1	\N	-1	-1
f	2023-01-17 16:25:28.989457	\N	2023-01-17 18:15:55.428676	2023-01-17 16:25:28.986103	483	22	\N	9	9	\N	\N	\N	9	\N	482	-1	\N	-1	-1
f	2023-01-17 16:25:28.996528	\N	2023-01-17 18:15:55.439347	2023-01-17 16:25:28.989677	484	22	\N	9	9	26	\N	13	4	\N	483	-1	\N	-1	-1
f	2023-01-17 16:25:29.00877	\N	2023-01-17 18:15:55.461531	2023-01-17 16:25:29.002919	486	22	\N	9	9	25	\N	13	4	\N	485	-1	\N	-1	-1
f	2023-01-17 16:25:29.012653	\N	2023-01-17 18:15:55.472532	2023-01-17 16:25:29.009058	487	22	\N	9	9	\N	\N	\N	\N	\N	475	-1	\N	-1	-1
f	2023-01-17 16:25:29.015973	\N	2023-01-17 18:15:55.483189	2023-01-17 16:25:29.012887	488	22	\N	9	9	\N	\N	\N	\N	\N	487	-1	\N	-1	-1
f	2023-01-17 16:25:29.01955	\N	2023-01-17 18:15:55.496305	2023-01-17 16:25:29.016163	489	\N	\N	9	9	\N	\N	\N	\N	\N	487	-1	\N	-1	-1
f	2023-01-17 16:25:29.023731	\N	2023-01-17 18:15:55.5074	2023-01-17 16:25:29.019876	490	\N	\N	9	9	\N	\N	\N	\N	\N	474	-1	\N	-1	-1
f	2023-01-17 18:15:55.520909	\N	2023-01-17 18:21:09.265943	2023-01-17 18:15:55.517723	491	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 18:15:55.527851	\N	2023-01-17 18:21:09.280366	2023-01-17 18:15:55.521135	492	22	\N	9	9	\N	\N	\N	9	\N	491	-1	\N	-1	-1
f	2023-01-17 18:15:55.532165	\N	2023-01-17 18:21:09.292322	2023-01-17 18:15:55.528098	493	22	\N	9	9	\N	\N	\N	7	\N	492	-1	\N	-1	-1
f	2023-01-17 18:15:55.536826	\N	2023-01-17 18:21:09.302754	2023-01-17 18:15:55.532476	494	22	\N	9	9	\N	\N	\N	\N	\N	493	-1	\N	-1	-1
f	2023-01-17 18:15:55.540213	\N	2023-01-17 18:21:09.313698	2023-01-17 18:15:55.53705	495	22	\N	9	9	\N	\N	\N	6	\N	494	-1	\N	-1	-1
f	2023-01-17 18:15:55.543697	\N	2023-01-17 18:21:09.325753	2023-01-17 18:15:55.540457	496	22	\N	9	9	\N	\N	\N	9	\N	495	-1	\N	-1	-1
f	2023-01-17 18:15:55.54987	\N	2023-01-17 18:21:09.337227	2023-01-17 18:15:55.543884	497	22	\N	9	9	25	\N	13	4	\N	496	-1	\N	-1	-1
f	2023-01-17 18:15:55.553701	\N	2023-01-17 18:21:09.347326	2023-01-17 18:15:55.550096	498	51	\N	9	9	\N	\N	\N	9	\N	495	-1	\N	-1	-1
f	2023-01-17 18:15:55.560862	\N	2023-01-17 18:21:09.357985	2023-01-17 18:15:55.55393	499	22	\N	9	9	26	\N	13	4	\N	498	-1	\N	-1	-1
f	2023-01-17 18:15:55.566665	\N	2023-01-17 18:21:09.369935	2023-01-17 18:15:55.561086	500	\N	\N	9	9	\N	\N	\N	6	\N	494	-1	\N	-1	-1
f	2023-01-17 18:15:55.570414	\N	2023-01-17 18:21:09.382806	2023-01-17 18:15:55.566905	501	22	\N	9	9	\N	\N	\N	9	\N	500	-1	\N	-1	-1
f	2023-01-17 18:15:55.578067	\N	2023-01-17 18:21:09.393504	2023-01-17 18:15:55.570656	502	22	\N	9	9	26	\N	13	4	\N	501	-1	\N	-1	-1
f	2023-01-17 18:15:55.583302	\N	2023-01-17 18:21:09.404205	2023-01-17 18:15:55.578565	503	23	\N	9	9	\N	\N	\N	9	\N	500	-1	\N	-1	-1
f	2023-01-17 18:15:55.591431	\N	2023-01-17 18:21:09.414093	2023-01-17 18:15:55.583631	504	22	\N	9	9	25	\N	13	4	\N	503	-1	\N	-1	-1
f	2023-01-17 18:15:55.59593	\N	2023-01-17 18:21:09.425201	2023-01-17 18:15:55.591817	505	22	\N	9	9	\N	\N	\N	\N	\N	493	-1	\N	-1	-1
f	2023-01-17 18:15:55.599452	\N	2023-01-17 18:21:09.440141	2023-01-17 18:15:55.59619	506	22	\N	9	9	\N	\N	\N	\N	\N	505	-1	\N	-1	-1
f	2023-01-17 18:15:55.603029	\N	2023-01-17 18:21:09.452325	2023-01-17 18:15:55.599691	507	\N	\N	9	9	\N	\N	\N	6	\N	505	-1	\N	-1	-1
f	2023-01-17 18:15:55.606247	\N	2023-01-17 18:21:09.462933	2023-01-17 18:15:55.603265	508	\N	\N	9	9	\N	\N	\N	6	\N	507	-1	\N	-1	-1
f	2023-01-17 18:15:55.609509	\N	2023-01-17 18:21:09.472788	2023-01-17 18:15:55.606477	509	\N	\N	9	9	\N	\N	\N	6	\N	508	-1	\N	-1	-1
f	2023-01-17 18:15:55.622018	\N	2023-01-17 18:21:09.497187	2023-01-17 18:15:55.615005	511	22	\N	9	9	26	\N	13	4	\N	510	-1	\N	-1	-1
f	2023-01-17 18:15:55.634311	\N	2023-01-17 18:21:09.520613	2023-01-17 18:15:55.627699	513	22	\N	9	9	25	\N	13	4	\N	512	-1	\N	-1	-1
f	2023-01-17 18:15:55.639809	\N	2023-01-17 18:21:09.53371	2023-01-17 18:15:55.634547	514	24	\N	9	9	27	\N	16	4	\N	508	-1	\N	-1	-1
f	2023-01-17 18:15:55.644176	\N	2023-01-17 18:21:09.54458	2023-01-17 18:15:55.64006	515	\N	\N	9	9	\N	\N	\N	\N	\N	507	-1	\N	-1	-1
f	2023-01-17 18:15:55.648042	\N	2023-01-17 18:21:09.555138	2023-01-17 18:15:55.644461	516	\N	\N	9	9	\N	\N	\N	\N	\N	492	-1	\N	-1	-1
f	2023-01-17 18:21:09.564135	\N	2023-01-17 18:24:25.163807	2023-01-17 18:21:09.561389	517	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 18:21:09.573335	\N	2023-01-17 18:24:25.175969	2023-01-17 18:21:09.564452	518	22	\N	9	9	\N	\N	\N	9	\N	517	-1	\N	-1	-1
f	2023-01-17 18:21:09.578526	\N	2023-01-17 18:24:25.186404	2023-01-17 18:21:09.573612	519	22	\N	9	9	\N	\N	\N	7	\N	518	-1	\N	-1	-1
f	2023-01-17 18:21:09.586807	\N	2023-01-17 18:24:25.197192	2023-01-17 18:21:09.578893	520	22	\N	9	9	\N	\N	\N	\N	\N	519	-1	\N	-1	-1
f	2023-01-17 18:21:09.595883	\N	2023-01-17 18:24:25.221709	2023-01-17 18:21:09.59182	522	22	\N	9	9	\N	\N	\N	9	\N	521	-1	\N	-1	-1
f	2023-01-17 18:21:09.604605	\N	2023-01-17 18:24:25.236262	2023-01-17 18:21:09.59613	523	22	\N	9	9	25	\N	13	4	\N	522	-1	\N	-1	-1
f	2023-01-17 18:21:09.591548	\N	2023-01-17 18:24:25.207471	2023-01-17 18:21:09.58712	521	22	\N	9	9	\N	\N	\N	6	\N	520	-1	\N	-1	-1
f	2023-01-17 18:21:09.610227	\N	2023-01-17 18:24:25.248154	2023-01-17 18:21:09.605045	524	51	\N	9	9	\N	\N	\N	9	\N	521	-1	\N	-1	-1
f	2023-01-17 18:21:09.618895	\N	2023-01-17 18:24:25.259082	2023-01-17 18:21:09.610528	525	22	\N	9	9	26	\N	13	4	\N	524	-1	\N	-1	-1
f	2023-01-17 18:21:09.6238	\N	2023-01-17 18:24:25.268594	2023-01-17 18:21:09.619152	526	\N	\N	9	9	\N	\N	\N	6	\N	520	-1	\N	-1	-1
f	2023-01-17 18:21:09.628913	\N	2023-01-17 18:24:25.278905	2023-01-17 18:21:09.624173	527	22	\N	9	9	\N	\N	\N	9	\N	526	-1	\N	-1	-1
f	2023-01-17 18:21:09.637551	\N	2023-01-17 18:24:25.288888	2023-01-17 18:21:09.629377	528	22	\N	9	9	26	\N	13	4	\N	527	-1	\N	-1	-1
f	2023-01-17 18:21:09.642511	\N	2023-01-17 18:24:25.299399	2023-01-17 18:21:09.637856	529	23	\N	9	9	\N	\N	\N	9	\N	526	-1	\N	-1	-1
f	2023-01-17 18:21:09.650228	\N	2023-01-17 18:24:25.308947	2023-01-17 18:21:09.642758	530	22	\N	9	9	25	\N	13	4	\N	529	-1	\N	-1	-1
f	2023-01-17 18:21:09.655666	\N	2023-01-17 18:24:25.317944	2023-01-17 18:21:09.650674	531	22	\N	9	9	\N	\N	\N	\N	\N	519	-1	\N	-1	-1
f	2023-01-17 18:21:09.660087	\N	2023-01-17 18:24:25.326288	2023-01-17 18:21:09.65592	532	22	\N	9	9	\N	\N	\N	\N	\N	531	-1	\N	-1	-1
f	2023-01-17 18:21:09.664175	\N	2023-01-17 18:24:25.336614	2023-01-17 18:21:09.660344	533	\N	\N	9	9	\N	\N	\N	6	\N	531	-1	\N	-1	-1
f	2023-01-17 18:21:09.66856	\N	2023-01-17 18:24:25.346674	2023-01-17 18:21:09.664421	534	\N	\N	9	9	\N	\N	\N	6	\N	533	-1	\N	-1	-1
f	2023-01-17 18:21:09.672501	\N	2023-01-17 18:24:25.358311	2023-01-17 18:21:09.668801	535	22	\N	9	9	\N	\N	\N	6	\N	534	-1	\N	-1	-1
f	2023-01-17 18:21:09.676394	\N	2023-01-17 18:24:25.371352	2023-01-17 18:21:09.672728	536	22	\N	9	9	\N	\N	\N	9	\N	535	-1	\N	-1	-1
f	2023-01-17 18:21:09.685332	\N	2023-01-17 18:24:25.38252	2023-01-17 18:21:09.676687	537	22	\N	9	9	26	\N	13	4	\N	536	-1	\N	-1	-1
f	2023-01-17 18:21:09.690013	\N	2023-01-17 18:24:25.393855	2023-01-17 18:21:09.685665	538	23	\N	9	9	\N	\N	\N	9	\N	535	-1	\N	-1	-1
f	2023-01-17 18:21:09.697391	\N	2023-01-17 18:24:25.404033	2023-01-17 18:21:09.690242	539	22	\N	9	9	25	\N	13	4	\N	538	-1	\N	-1	-1
f	2023-01-17 18:21:09.704879	\N	2023-01-17 18:24:25.417355	2023-01-17 18:21:09.69768	540	25	\N	9	9	5	\N	16	4	\N	534	-1	\N	-1	-1
f	2023-01-17 18:21:09.708914	\N	2023-01-17 18:24:25.429639	2023-01-17 18:21:09.705119	541	22	\N	9	9	\N	\N	\N	6	\N	533	-1	\N	-1	-1
f	2023-01-17 18:21:09.713045	\N	2023-01-17 18:24:25.44189	2023-01-17 18:21:09.709159	542	22	\N	9	9	\N	\N	\N	6	\N	541	-1	\N	-1	-1
f	2023-01-17 18:21:09.720685	\N	2023-01-17 18:24:25.452554	2023-01-17 18:21:09.713291	543	22	\N	9	9	5	\N	16	4	\N	542	-1	\N	-1	-1
f	2023-01-17 18:21:09.725707	\N	2023-01-17 18:24:25.463142	2023-01-17 18:21:09.720954	544	\N	\N	9	9	\N	\N	\N	\N	\N	542	-1	\N	-1	-1
f	2023-01-17 18:21:09.73084	\N	2023-01-17 18:24:25.473577	2023-01-17 18:21:09.725978	545	\N	\N	9	9	\N	\N	\N	\N	\N	542	-1	\N	-1	-1
f	2023-01-17 18:21:09.735799	\N	2023-01-17 18:24:25.484268	2023-01-17 18:21:09.731097	546	\N	\N	9	9	\N	\N	\N	\N	\N	541	-1	\N	-1	-1
f	2023-01-17 18:21:09.740645	\N	2023-01-17 18:24:25.493244	2023-01-17 18:21:09.736098	547	\N	\N	9	9	\N	\N	\N	\N	\N	518	-1	\N	-1	-1
t	2023-01-17 18:24:25.506878	\N	\N	2023-01-17 18:24:25.503869	548	\N	\N	9	9	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-01-17 18:24:25.513187	\N	\N	2023-01-17 18:24:25.507109	549	22	\N	9	9	\N	\N	\N	9	\N	548	-1	\N	\N	-1
t	2023-01-17 18:24:25.516918	\N	\N	2023-01-17 18:24:25.5134	550	22	\N	9	9	\N	\N	\N	7	\N	549	-1	\N	\N	-1
t	2023-01-17 18:24:25.520621	\N	\N	2023-01-17 18:24:25.517128	551	22	\N	9	9	\N	\N	\N	\N	\N	550	-1	\N	\N	-1
f	2023-01-17 18:15:55.627437	\N	2023-01-17 18:21:09.509002	2023-01-17 18:15:55.622267	512	23	\N	9	9	\N	\N	\N	9	61	509	-1	\N	-1	-1
f	2023-04-27 21:14:57.614969	\N	2023-04-27 21:19:39.091114	2023-04-27 21:14:57.606836	1244	22	\N	7	7	\N	\N	\N	9	\N	1243	-1	\N	-1	-1
t	2023-01-17 18:24:25.523873	\N	\N	2023-01-17 18:24:25.520872	552	22	\N	9	9	\N	\N	\N	6	\N	551	-1	\N	\N	-1
t	2023-01-17 18:24:25.527766	\N	\N	2023-01-17 18:24:25.52408	553	22	\N	9	9	\N	\N	\N	9	\N	552	-1	\N	\N	-1
t	2023-01-17 18:24:25.534486	\N	\N	2023-01-17 18:24:25.527979	554	22	\N	9	9	25	\N	13	4	\N	553	-1	\N	\N	-1
t	2023-01-17 18:24:25.542714	\N	\N	2023-01-17 18:24:25.53471	555	51	\N	9	9	\N	\N	\N	9	\N	552	-1	\N	\N	-1
t	2023-01-17 18:24:25.553118	\N	\N	2023-01-17 18:24:25.54311	556	22	\N	9	9	26	\N	13	4	\N	555	-1	\N	\N	-1
t	2023-01-17 18:24:25.558065	\N	\N	2023-01-17 18:24:25.553384	557	\N	\N	9	9	\N	\N	\N	6	\N	551	-1	\N	\N	-1
t	2023-01-17 18:24:25.562228	\N	\N	2023-01-17 18:24:25.558337	558	22	\N	9	9	\N	\N	\N	9	\N	557	-1	\N	\N	-1
t	2023-01-17 18:24:25.568738	\N	\N	2023-01-17 18:24:25.562481	559	22	\N	9	9	26	\N	13	4	\N	558	-1	\N	\N	-1
t	2023-01-17 18:24:25.572676	\N	\N	2023-01-17 18:24:25.568974	560	23	\N	9	9	\N	\N	\N	9	\N	557	-1	\N	\N	-1
t	2023-01-17 18:24:25.578966	\N	\N	2023-01-17 18:24:25.572898	561	22	\N	9	9	25	\N	13	4	\N	560	-1	\N	\N	-1
t	2023-01-17 18:24:25.582872	\N	\N	2023-01-17 18:24:25.579176	562	22	\N	9	9	\N	\N	\N	\N	\N	550	-1	\N	\N	-1
t	2023-01-17 18:24:25.586001	\N	\N	2023-01-17 18:24:25.583081	563	22	\N	9	9	\N	\N	\N	\N	\N	562	-1	\N	\N	-1
t	2023-01-17 18:24:25.589807	\N	\N	2023-01-17 18:24:25.58623	564	\N	\N	9	9	\N	\N	\N	6	\N	562	-1	\N	\N	-1
t	2023-01-17 18:24:25.593486	\N	\N	2023-01-17 18:24:25.590037	565	\N	\N	9	9	\N	\N	\N	6	\N	564	-1	\N	\N	-1
t	2023-01-17 18:24:25.596925	\N	\N	2023-01-17 18:24:25.593705	566	22	\N	9	9	\N	\N	\N	6	\N	565	-1	\N	\N	-1
t	2023-01-17 18:24:25.600477	\N	\N	2023-01-17 18:24:25.597132	567	22	\N	9	9	\N	\N	\N	9	\N	566	-1	\N	\N	-1
t	2023-01-17 18:24:25.606158	\N	\N	2023-01-17 18:24:25.600691	568	22	\N	9	9	26	\N	13	4	\N	567	-1	\N	\N	-1
t	2023-01-17 18:24:25.610217	\N	\N	2023-01-17 18:24:25.606398	569	23	\N	9	9	\N	\N	\N	9	\N	566	-1	\N	\N	-1
t	2023-01-17 18:24:25.615597	\N	\N	2023-01-17 18:24:25.610465	570	22	\N	9	9	25	\N	13	4	\N	569	-1	\N	\N	-1
t	2023-01-17 18:24:25.622068	\N	\N	2023-01-17 18:24:25.615784	571	25	\N	9	9	5	\N	16	4	\N	565	-1	\N	\N	-1
t	2023-01-17 18:24:25.625641	\N	\N	2023-01-17 18:24:25.622305	572	22	\N	9	9	\N	\N	\N	6	\N	564	-1	\N	\N	-1
t	2023-01-17 18:24:25.62909	\N	\N	2023-01-17 18:24:25.625859	573	22	\N	9	9	\N	\N	\N	6	\N	572	-1	\N	\N	-1
t	2023-01-17 18:24:25.635983	\N	\N	2023-01-17 18:24:25.629306	574	22	\N	9	9	5	\N	16	4	\N	573	-1	\N	\N	-1
t	2023-01-17 18:24:25.648147	\N	\N	2023-01-17 18:24:25.641563	576	22	\N	9	9	25	\N	13	4	\N	575	-1	\N	\N	-1
t	2023-01-17 18:24:25.653181	\N	\N	2023-01-17 18:24:25.648456	577	22	\N	9	9	28	\N	16	4	\N	573	-1	\N	\N	-1
t	2023-01-17 18:24:25.666118	\N	\N	2023-01-17 18:24:25.658629	579	22	\N	9	9	26	\N	13	4	\N	578	-1	\N	\N	-1
t	2023-01-17 18:24:25.670215	\N	\N	2023-01-17 18:24:25.666369	580	\N	\N	9	9	\N	\N	\N	\N	\N	549	-1	\N	\N	-1
f	2023-01-19 10:59:22.824966	\N	2023-01-19 11:09:33.034524	2023-01-19 10:59:22.822882	581	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-19 10:59:22.843308	\N	2023-01-19 11:09:33.046754	2023-01-19 10:59:22.825123	582	22	\N	10	10	29	\N	13	4	\N	581	-1	\N	-1	-1
f	2023-01-19 10:59:22.847937	\N	2023-01-19 11:09:33.055322	2023-01-19 10:59:22.843512	583	52	\N	10	10	30	\N	12	4	\N	581	-1	\N	-1	-1
f	2023-01-31 13:19:17.474316	\N	2023-02-06 19:30:50.90114	2023-01-31 13:19:17.471645	591	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-31 13:19:17.478798	\N	2023-02-06 19:30:50.92657	2023-01-31 13:19:17.47451	592	22	\N	12	12	33	\N	12	4	\N	591	-1	\N	-1	-1
f	2023-02-06 19:30:50.964201	\N	2023-02-06 19:45:18.845551	2023-02-06 19:30:50.962994	593	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:30:50.971141	\N	2023-02-06 19:45:18.890914	2023-02-06 19:30:50.964372	594	22	\N	12	12	33	\N	12	4	\N	593	-1	\N	-1	-1
f	2023-02-06 19:30:50.975292	\N	2023-02-06 19:45:18.935301	2023-02-06 19:30:50.971313	595	24	\N	12	12	34	\N	12	4	\N	593	-1	\N	-1	-1
f	2023-02-06 19:45:19.017999	\N	2023-02-06 19:47:20.582502	2023-02-06 19:45:19.01605	596	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:45:19.027198	\N	2023-02-06 19:47:20.591819	2023-02-06 19:45:19.018259	597	22	\N	12	12	33	\N	12	4	\N	596	-1	\N	-1	-1
f	2023-02-06 19:45:19.032978	\N	2023-02-06 19:47:20.6016	2023-02-06 19:45:19.027405	598	24	\N	12	12	34	\N	12	4	\N	596	-1	\N	-1	-1
f	2023-02-06 19:45:19.037817	\N	2023-02-06 19:47:20.611564	2023-02-06 19:45:19.033187	599	24	\N	12	12	35	\N	10	4	\N	596	-1	\N	-1	-1
f	2023-02-06 19:47:20.631754	\N	2023-02-06 19:49:04.247564	2023-02-06 19:47:20.630116	600	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:47:20.639889	\N	2023-02-06 19:49:04.284004	2023-02-06 19:47:20.631943	601	22	\N	12	12	33	\N	12	4	\N	600	-1	\N	-1	-1
f	2023-02-06 19:47:20.645392	\N	2023-02-06 19:49:04.294068	2023-02-06 19:47:20.640118	602	24	\N	12	12	34	\N	12	4	\N	600	-1	\N	-1	-1
f	2023-02-06 19:47:20.65056	\N	2023-02-06 19:49:04.302975	2023-02-06 19:47:20.645571	603	24	\N	12	12	35	\N	10	4	\N	600	-1	\N	-1	-1
f	2023-02-06 19:47:20.654246	\N	2023-02-06 19:49:04.313552	2023-02-06 19:47:20.650757	604	24	\N	12	12	36	\N	21	4	\N	600	-1	\N	-1	-1
f	2023-02-06 19:49:04.338705	\N	2023-02-06 19:53:07.551648	2023-02-06 19:49:04.337613	605	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:49:04.344669	\N	2023-02-06 19:53:07.566689	2023-02-06 19:49:04.338855	606	22	\N	12	12	33	\N	12	4	\N	605	-1	\N	-1	-1
f	2023-02-06 19:49:04.349207	\N	2023-02-06 19:53:07.581	2023-02-06 19:49:04.344839	607	24	\N	12	12	34	\N	12	4	\N	605	-1	\N	-1	-1
f	2023-02-06 19:49:04.353351	\N	2023-02-06 19:53:07.59413	2023-02-06 19:49:04.34938	608	24	\N	12	12	35	\N	10	4	\N	605	-1	\N	-1	-1
f	2023-02-06 19:49:04.357826	\N	2023-02-06 19:53:07.605651	2023-02-06 19:49:04.353519	609	24	\N	12	12	36	\N	21	4	\N	605	-1	\N	-1	-1
f	2023-02-06 19:49:04.361525	\N	2023-02-06 19:53:07.618465	2023-02-06 19:49:04.357996	610	24	\N	12	12	37	\N	19	4	\N	605	-1	\N	-1	-1
f	2023-02-06 19:53:07.643549	\N	2023-02-06 19:54:40.31219	2023-02-06 19:53:07.642188	611	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:53:07.650878	\N	2023-02-06 19:54:40.548163	2023-02-06 19:53:07.64374	612	22	\N	12	12	33	\N	12	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:53:07.65595	\N	2023-02-06 19:54:40.562241	2023-02-06 19:53:07.651097	613	24	\N	12	12	34	\N	12	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:53:07.660698	\N	2023-02-06 19:54:40.57212	2023-02-06 19:53:07.656177	614	24	\N	12	12	35	\N	10	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:53:07.665637	\N	2023-02-06 19:54:40.582515	2023-02-06 19:53:07.660913	615	24	\N	12	12	36	\N	21	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:53:07.670146	\N	2023-02-06 19:54:40.591936	2023-02-06 19:53:07.665818	616	24	\N	12	12	37	\N	19	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:53:07.67386	\N	2023-02-06 19:54:40.601534	2023-02-06 19:53:07.67034	617	24	\N	12	12	38	\N	18	4	\N	611	-1	\N	-1	-1
f	2023-02-06 19:54:40.620471	\N	2023-02-06 19:58:33.159596	2023-02-06 19:54:40.618926	618	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:54:40.627208	\N	2023-02-06 19:58:33.172347	2023-02-06 19:54:40.620727	619	22	\N	12	12	33	\N	12	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.632587	\N	2023-02-06 19:58:33.181573	2023-02-06 19:54:40.627397	620	24	\N	12	12	34	\N	12	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.637338	\N	2023-02-06 19:58:33.195577	2023-02-06 19:54:40.632828	621	24	\N	12	12	35	\N	10	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.642509	\N	2023-02-06 19:58:33.210708	2023-02-06 19:54:40.637554	622	24	\N	12	12	36	\N	21	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.647396	\N	2023-02-06 19:58:33.222839	2023-02-06 19:54:40.64273	623	24	\N	12	12	37	\N	19	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.65236	\N	2023-02-06 19:58:33.237634	2023-02-06 19:54:40.647584	624	24	\N	12	12	38	\N	18	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:54:40.655958	\N	2023-02-06 19:58:33.249109	2023-02-06 19:54:40.652584	625	24	\N	12	12	39	\N	14	4	\N	618	-1	\N	-1	-1
f	2023-02-06 19:58:33.271048	\N	2023-02-06 21:21:54.383567	2023-02-06 19:58:33.269878	626	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 19:58:33.281705	\N	2023-02-06 21:21:54.416551	2023-02-06 19:58:33.277676	628	24	\N	12	12	34	\N	12	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.285638	\N	2023-02-06 21:21:54.425739	2023-02-06 19:58:33.281863	629	24	\N	12	12	35	\N	10	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.289629	\N	2023-02-06 21:21:54.434734	2023-02-06 19:58:33.285795	630	24	\N	12	12	36	\N	21	4	\N	626	-1	\N	-1	-1
f	2023-01-19 11:09:33.072014	\N	2023-04-27 13:57:14.409382	2023-01-19 11:09:33.064748	585	22	\N	10	10	29	\N	13	4	\N	584	-1	\N	-1	-1
f	2023-01-19 11:09:33.077424	\N	2023-04-27 13:57:14.424434	2023-01-19 11:09:33.072209	586	52	\N	10	10	30	\N	12	4	\N	584	-1	\N	-1	-1
t	2023-01-17 18:24:25.641312	\N	\N	2023-01-17 18:24:25.636264	575	23	\N	9	9	\N	\N	\N	9	61	573	-1	\N	\N	-1
t	2023-01-17 18:24:25.65827	\N	\N	2023-01-17 18:24:25.653467	578	22	\N	9	9	\N	\N	\N	9	61	572	-1	\N	\N	-1
f	2023-01-19 13:11:49.853352	\N	2023-05-02 11:46:16.444484	2023-01-19 13:11:49.850738	587	\N	\N	11	11	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-19 13:11:49.856228	\N	2023-05-02 11:46:16.458475	2023-01-19 13:11:49.85352	588	25	\N	11	11	\N	\N	\N	6	\N	587	-1	\N	-1	-1
f	2023-01-19 13:11:49.864746	\N	2023-05-02 11:46:16.487499	2023-01-19 13:11:49.860896	590	52	\N	11	11	32	\N	12	4	\N	588	-1	\N	-1	-1
f	2023-02-06 19:58:33.294433	\N	2023-02-06 21:21:54.443467	2023-02-06 19:58:33.289793	631	24	\N	12	12	37	\N	19	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.299141	\N	2023-02-06 21:21:54.452359	2023-02-06 19:58:33.294644	632	24	\N	12	12	38	\N	18	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.303477	\N	2023-02-06 21:21:54.46322	2023-02-06 19:58:33.299322	633	24	\N	12	12	39	\N	14	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.306862	\N	2023-02-06 21:21:54.472788	2023-02-06 19:58:33.303663	634	24	\N	12	12	40	\N	16	4	\N	626	-1	\N	-1	-1
f	2023-02-06 19:58:33.277455	\N	2023-02-06 21:21:54.399635	2023-02-06 19:58:33.27121	627	22	\N	12	12	33	\N	12	4	\N	626	-1	\N	-1	-1
f	2023-03-13 08:29:09.215173	\N	2023-03-13 08:33:28.973393	2023-03-13 08:29:09.065971	646	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-03-13 08:33:29.030051	\N	2023-03-13 08:40:41.008731	2023-03-13 08:33:29.024122	647	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-03-13 08:33:29.230093	\N	2023-03-13 08:40:41.032861	2023-03-13 08:33:29.030733	648	\N	\N	14	14	\N	\N	\N	\N	\N	647	-1	\N	-1	-1
f	2023-03-13 08:33:29.241983	\N	2023-03-13 08:40:41.040142	2023-03-13 08:33:29.230946	649	\N	\N	14	14	\N	\N	\N	\N	\N	647	-1	\N	-1	-1
f	2023-03-13 08:40:41.046483	\N	2023-03-13 08:42:21.827791	2023-03-13 08:40:41.043867	650	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-03-13 08:40:41.055137	\N	2023-03-13 08:42:21.842822	2023-03-13 08:40:41.046797	651	22	\N	14	14	\N	\N	\N	6	\N	650	-1	\N	-1	-1
f	2023-03-13 08:40:41.060506	\N	2023-03-13 08:42:21.85679	2023-03-13 08:40:41.05549	652	\N	\N	14	14	\N	\N	\N	\N	\N	651	-1	\N	-1	-1
f	2023-03-13 08:40:41.065258	\N	2023-03-13 08:42:21.870716	2023-03-13 08:40:41.060814	653	\N	\N	14	14	\N	\N	\N	\N	\N	651	-1	\N	-1	-1
f	2023-03-13 08:42:21.881888	\N	2023-03-13 08:55:17.866283	2023-03-13 08:42:21.876081	654	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-03-13 08:42:21.899405	\N	2023-03-13 08:55:17.88994	2023-03-13 08:42:21.882473	655	22	\N	14	14	\N	\N	\N	6	\N	654	-1	\N	-1	-1
f	2023-03-13 08:42:21.909539	\N	2023-03-13 08:55:17.913097	2023-03-13 08:42:21.899967	656	22	\N	14	14	\N	\N	\N	\N	\N	655	-1	\N	-1	-1
f	2023-03-13 08:55:17.93731	\N	2023-04-10 08:46:58.722449	2023-03-13 08:55:17.932808	657	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-03-13 08:55:18.031018	\N	2023-04-10 08:46:58.749735	2023-03-13 08:55:17.937776	658	25	\N	14	14	\N	\N	\N	6	\N	657	-1	\N	-1	-1
f	2023-03-13 08:55:18.038849	\N	2023-04-10 08:46:58.758323	2023-03-13 08:55:18.031548	659	\N	\N	14	14	\N	\N	\N	\N	\N	658	-1	\N	-1	-1
f	2023-03-13 08:55:18.045957	\N	2023-04-10 08:46:58.766012	2023-03-13 08:55:18.039314	660	\N	\N	14	14	\N	\N	\N	\N	\N	658	-1	\N	-1	-1
f	2023-04-10 09:03:18.353821	\N	2023-04-10 09:15:37.321706	2023-04-10 09:03:18.322712	665	\N	\N	15	15	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 09:03:18.364398	\N	2023-04-10 09:15:37.346497	2023-04-10 09:03:18.354555	666	24	\N	15	15	\N	\N	\N	6	\N	665	-1	\N	-1	-1
f	2023-04-10 09:03:18.384123	\N	2023-04-10 09:15:37.375084	2023-04-10 09:03:18.364979	667	24	\N	15	15	\N	\N	\N	6	\N	666	-1	\N	-1	-1
f	2023-04-10 09:03:18.395204	\N	2023-04-10 09:15:37.398668	2023-04-10 09:03:18.384805	668	\N	\N	15	15	\N	\N	\N	\N	\N	667	-1	\N	-1	-1
f	2023-04-10 09:03:18.413294	\N	2023-04-10 09:15:37.416656	2023-04-10 09:03:18.395803	669	51	\N	15	15	47	\N	20	4	\N	667	-1	\N	-1	-1
f	2023-04-10 09:03:18.425524	\N	2023-04-10 09:15:37.442685	2023-04-10 09:03:18.413881	670	\N	\N	15	15	\N	\N	\N	\N	\N	666	-1	\N	-1	-1
f	2023-04-10 09:15:37.495956	\N	2023-04-10 09:15:45.720322	2023-04-10 09:15:37.492814	677	\N	\N	15	15	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 09:15:37.504979	\N	2023-04-10 09:15:45.735011	2023-04-10 09:15:37.496329	678	24	\N	15	15	\N	\N	\N	6	\N	677	-1	\N	-1	-1
f	2023-04-10 09:15:37.510371	\N	2023-04-10 09:15:45.749716	2023-04-10 09:15:37.505353	679	24	\N	15	15	\N	\N	\N	6	\N	678	-1	\N	-1	-1
f	2023-04-10 09:15:37.515605	\N	2023-04-10 09:15:45.759984	2023-04-10 09:15:37.510797	680	\N	\N	15	15	\N	\N	\N	\N	\N	679	-1	\N	-1	-1
f	2023-04-10 09:15:37.540934	\N	2023-04-10 09:15:45.772533	2023-04-10 09:15:37.51593	681	51	\N	15	15	47	\N	20	4	\N	679	-1	\N	-1	-1
f	2023-04-10 09:15:37.550955	\N	2023-04-10 09:15:45.780714	2023-04-10 09:15:37.541341	682	51	\N	15	15	49	\N	16	4	\N	678	-1	\N	-1	-1
f	2023-04-10 09:15:00.954348	\N	2023-04-10 11:02:39.128376	2023-04-10 09:15:00.945833	671	\N	\N	16	16	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 09:15:00.963571	\N	2023-04-10 11:02:39.143816	2023-04-10 09:15:00.955046	672	24	\N	16	16	\N	\N	\N	6	\N	671	-1	\N	-1	-1
f	2023-04-10 09:15:00.972957	\N	2023-04-10 11:02:39.15258	2023-04-10 09:15:00.964229	673	24	\N	16	16	\N	\N	\N	6	\N	672	-1	\N	-1	-1
f	2023-04-10 09:15:00.982218	\N	2023-04-10 11:02:39.16049	2023-04-10 09:15:00.973555	674	\N	\N	16	16	\N	\N	\N	\N	\N	673	-1	\N	-1	-1
f	2023-04-10 09:15:00.998284	\N	2023-04-10 11:02:39.167764	2023-04-10 09:15:00.982825	675	51	\N	16	16	47	\N	20	4	\N	673	-1	\N	-1	-1
f	2023-04-10 09:15:01.019404	\N	2023-04-10 11:02:39.175509	2023-04-10 09:15:01.000459	676	51	\N	16	16	49	\N	16	4	\N	672	-1	\N	-1	-1
f	2023-04-10 09:25:19.616982	\N	2023-04-10 11:03:14.542871	2023-04-10 09:25:19.608938	683	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 09:25:19.626714	\N	2023-04-10 11:03:14.56656	2023-04-10 09:25:19.617589	684	22	\N	17	17	\N	\N	\N	6	\N	683	-1	\N	-1	-1
f	2023-04-10 09:25:19.644329	\N	2023-04-10 11:03:14.601309	2023-04-10 09:25:19.627283	685	22	\N	17	17	47	\N	20	4	\N	684	-1	\N	-1	-1
f	2023-04-10 09:25:19.662199	\N	2023-04-10 11:03:14.619274	2023-04-10 09:25:19.644983	686	\N	\N	17	17	\N	\N	\N	6	\N	684	-1	\N	-1	-1
f	2023-04-10 09:25:19.671611	\N	2023-04-10 11:03:14.639305	2023-04-10 09:25:19.662769	687	27	\N	17	17	\N	\N	\N	6	\N	686	-1	\N	-1	-1
f	2023-04-10 09:25:19.681271	\N	2023-04-10 11:03:14.653202	2023-04-10 09:25:19.672241	688	\N	\N	17	17	\N	\N	\N	\N	\N	687	-1	\N	-1	-1
f	2023-04-10 09:25:19.690701	\N	2023-04-10 11:03:14.667283	2023-04-10 09:25:19.68184	689	\N	\N	17	17	\N	\N	\N	\N	\N	687	-1	\N	-1	-1
f	2023-02-27 11:28:28.768547	\N	2023-05-02 11:45:36.709589	2023-02-27 11:28:28.760767	645	\N	\N	13	13	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 10:33:36.521802	\N	2023-05-02 12:05:27.754682	2023-04-10 10:33:36.517797	690	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 10:33:36.526548	\N	2023-05-02 12:05:27.77948	2023-04-10 10:33:36.522133	691	\N	\N	18	18	\N	\N	\N	6	\N	690	-1	\N	-1	-1
f	2023-04-10 11:07:05.763454	\N	2023-04-10 12:19:32.311182	2023-04-10 11:07:05.755408	708	24	\N	19	19	\N	\N	\N	6	\N	707	-1	\N	-1	-1
f	2023-04-10 11:07:05.77295	\N	2023-04-10 12:19:32.334496	2023-04-10 11:07:05.764137	709	24	\N	19	19	\N	\N	\N	6	\N	708	-1	\N	-1	-1
f	2023-04-10 11:02:39.181239	\N	2023-04-10 12:24:21.914275	2023-04-10 11:02:39.178652	694	\N	\N	16	16	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:02:39.191077	\N	2023-04-10 12:24:21.949633	2023-04-10 11:02:39.181542	695	24	\N	16	16	\N	\N	\N	6	\N	694	-1	\N	-1	-1
f	2023-04-10 11:02:39.196473	\N	2023-04-10 12:24:21.957815	2023-04-10 11:02:39.191366	696	24	\N	16	16	\N	\N	\N	6	\N	695	-1	\N	-1	-1
f	2023-04-10 11:02:39.201615	\N	2023-04-10 12:24:21.965029	2023-04-10 11:02:39.196757	697	\N	\N	16	16	\N	\N	\N	\N	\N	696	-1	\N	-1	-1
f	2023-04-10 11:02:39.210619	\N	2023-04-10 12:24:21.972214	2023-04-10 11:02:39.201901	698	51	\N	16	16	47	\N	20	4	\N	696	-1	\N	-1	-1
f	2023-04-10 11:03:14.678044	\N	2023-04-18 13:50:10.584002	2023-04-10 11:03:14.67236	700	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:03:14.694314	\N	2023-04-18 13:50:10.626223	2023-04-10 11:03:14.678646	701	22	\N	17	17	\N	\N	\N	6	\N	700	-1	\N	-1	-1
f	2023-04-10 11:03:14.711815	\N	2023-04-18 13:50:10.648005	2023-04-10 11:03:14.694903	702	22	\N	17	17	47	\N	20	4	\N	701	-1	\N	-1	-1
f	2023-04-10 11:03:14.721882	\N	2023-04-18 13:50:10.686666	2023-04-10 11:03:14.712474	703	\N	\N	17	17	\N	\N	\N	6	\N	701	-1	\N	-1	-1
f	2023-04-10 11:03:14.732628	\N	2023-04-18 13:50:10.711873	2023-04-10 11:03:14.722849	704	27	\N	17	17	\N	\N	\N	6	\N	703	-1	\N	-1	-1
f	2023-04-10 11:03:14.743341	\N	2023-04-18 13:50:10.778737	2023-04-10 11:03:14.733292	705	\N	\N	17	17	\N	\N	\N	\N	\N	704	-1	\N	-1	-1
f	2023-04-10 10:33:36.531066	\N	2023-05-02 12:05:27.793713	2023-04-10 10:33:36.526849	692	\N	\N	18	18	\N	\N	\N	\N	\N	691	-1	\N	-1	-1
f	2023-04-10 10:33:36.53586	\N	2023-05-02 12:05:27.808189	2023-04-10 10:33:36.531357	693	\N	\N	18	18	\N	\N	\N	\N	\N	691	-1	\N	-1	-1
f	2023-04-10 08:46:58.771787	\N	2023-05-02 12:43:02.037231	2023-04-10 08:46:58.769254	661	\N	\N	14	14	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 08:46:58.855187	\N	2023-05-02 12:43:02.06681	2023-04-10 08:46:58.849815	663	\N	\N	14	14	\N	\N	\N	\N	\N	662	-1	\N	-1	-1
f	2023-04-10 08:46:58.860695	\N	2023-05-02 12:43:02.081048	2023-04-10 08:46:58.855511	664	\N	\N	14	14	\N	\N	\N	\N	\N	662	-1	\N	-1	-1
f	2023-02-06 21:21:54.494458	\N	2023-05-02 12:49:13.796759	2023-02-06 21:21:54.493292	635	\N	\N	12	12	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-02-06 21:21:54.500882	\N	2023-05-02 12:49:13.810762	2023-02-06 21:21:54.494641	636	22	\N	12	12	33	\N	12	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.510684	\N	2023-05-02 12:49:13.827976	2023-02-06 21:21:54.505991	638	24	\N	12	12	35	\N	10	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.515232	\N	2023-05-02 12:49:13.839756	2023-02-06 21:21:54.510877	639	24	\N	12	12	36	\N	21	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.520765	\N	2023-05-02 12:49:13.852827	2023-02-06 21:21:54.51545	640	24	\N	12	12	37	\N	19	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.525508	\N	2023-05-02 12:49:13.867183	2023-02-06 21:21:54.52102	641	24	\N	12	12	38	\N	18	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.530562	\N	2023-05-02 12:49:13.880116	2023-02-06 21:21:54.525722	642	24	\N	12	12	39	\N	14	4	\N	635	-1	\N	-1	-1
f	2023-02-06 21:21:54.538766	\N	2023-05-02 12:49:13.911514	2023-02-06 21:21:54.535283	644	24	\N	12	12	41	\N	20	4	\N	635	-1	\N	-1	-1
f	2023-04-10 11:07:05.791598	\N	2023-04-10 12:19:32.361643	2023-04-10 11:07:05.782424	711	\N	\N	19	19	\N	\N	\N	\N	\N	710	-1	\N	-1	-1
f	2023-04-10 11:07:05.810197	\N	2023-04-10 12:19:32.379714	2023-04-10 11:07:05.792225	712	51	\N	19	19	58	\N	20	4	\N	710	-1	\N	-1	-1
f	2023-04-10 11:07:05.828959	\N	2023-04-10 12:19:32.394478	2023-04-10 11:07:05.810863	713	51	\N	19	19	49	\N	16	4	\N	708	-1	\N	-1	-1
f	2023-04-27 21:14:57.606507	\N	2023-04-27 21:19:39.082721	2023-04-27 21:14:57.603515	1243	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:14:57.629643	\N	2023-04-27 21:19:39.124597	2023-04-27 21:14:57.625223	1247	22	\N	7	7	\N	\N	\N	6	\N	1246	-1	\N	-1	-1
f	2023-04-27 21:14:57.642792	\N	2023-04-27 21:19:39.132216	2023-04-27 21:14:57.634664	1249	22	\N	7	7	86	\N	13	4	\N	1248	-1	\N	-1	-1
f	2023-04-27 21:14:57.653177	\N	2023-04-27 21:19:39.139748	2023-04-27 21:14:57.648781	1251	22	\N	7	7	\N	32	\N	5	\N	1250	-1	\N	-1	-1
f	2023-04-27 21:14:57.658621	\N	2023-04-27 21:19:39.150161	2023-04-27 21:14:57.653774	1252	\N	\N	7	7	\N	\N	\N	\N	\N	1247	-1	\N	-1	-1
f	2023-04-27 21:14:57.663011	\N	2023-04-27 21:19:39.157941	2023-04-27 21:14:57.658918	1253	24	\N	7	7	\N	\N	\N	\N	\N	1246	-1	\N	-1	-1
f	2023-04-27 21:14:57.667351	\N	2023-04-27 21:19:39.165366	2023-04-27 21:14:57.663303	1254	22	\N	7	7	\N	\N	\N	\N	\N	1245	-1	\N	-1	-1
f	2023-04-27 21:14:57.677115	\N	2023-04-27 21:19:39.185034	2023-04-27 21:14:57.667641	1255	22	\N	7	7	85	\N	\N	\N	\N	1254	-1	\N	-1	-1
f	2023-04-27 21:14:57.692121	\N	2023-04-27 21:19:39.205472	2023-04-27 21:14:57.677449	1256	24	\N	7	7	\N	\N	\N	\N	\N	1254	-1	\N	-1	-1
f	2023-04-27 21:14:57.701737	\N	2023-04-27 21:19:39.21347	2023-04-27 21:14:57.692795	1257	\N	\N	7	7	\N	\N	\N	\N	\N	1244	-1	\N	-1	-1
f	2023-04-27 21:14:57.63437	\N	2023-04-27 21:19:39.222036	2023-04-27 21:14:57.629935	1248	22	\N	7	7	\N	\N	\N	9	\N	1252	-1	\N	-1	-1
f	2023-04-27 21:14:57.64846	\N	2023-04-27 21:19:39.229971	2023-04-27 21:14:57.64312	1250	53	\N	7	7	\N	\N	\N	9	\N	1252	-1	\N	-1	-1
f	2023-04-27 21:19:39.237872	\N	2023-04-27 21:21:10.441007	2023-04-27 21:19:39.235178	1258	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:19:39.247929	\N	2023-04-27 21:21:10.45101	2023-04-27 21:19:39.238183	1259	22	\N	7	7	\N	\N	\N	9	\N	1258	-1	\N	-1	-1
f	2023-04-27 21:19:39.252794	\N	2023-04-27 21:21:10.460333	2023-04-27 21:19:39.248318	1260	22	\N	7	7	\N	\N	\N	7	\N	1259	-1	\N	-1	-1
f	2023-04-27 21:19:39.257279	\N	2023-04-27 21:21:10.470377	2023-04-27 21:19:39.253087	1261	22	\N	7	7	\N	\N	\N	\N	\N	1260	-1	\N	-1	-1
f	2023-04-27 21:19:39.261784	\N	2023-04-27 21:21:10.491438	2023-04-27 21:19:39.257576	1262	22	\N	7	7	\N	\N	\N	6	\N	1261	-1	\N	-1	-1
f	2023-04-27 21:19:39.266472	\N	2023-04-27 21:21:10.511915	2023-04-27 21:19:39.262081	1263	\N	\N	7	7	\N	\N	\N	\N	\N	1262	-1	\N	-1	-1
f	2023-04-27 21:19:39.271232	\N	2023-04-27 21:21:10.52252	2023-04-27 21:19:39.266815	1264	22	\N	7	7	\N	\N	\N	9	\N	1263	-1	\N	-1	-1
f	2023-04-27 21:19:39.281118	\N	2023-04-27 21:21:10.531561	2023-04-27 21:19:39.271531	1265	22	\N	7	7	86	\N	13	4	\N	1264	-1	\N	-1	-1
f	2023-04-27 21:19:39.286876	\N	2023-04-27 21:21:10.539962	2023-04-27 21:19:39.281484	1266	53	\N	7	7	\N	\N	\N	9	\N	1263	-1	\N	-1	-1
f	2023-04-27 21:19:39.291579	\N	2023-04-27 21:21:10.549239	2023-04-27 21:19:39.287194	1267	22	\N	7	7	\N	32	\N	5	\N	1266	-1	\N	-1	-1
f	2023-04-27 21:19:39.296407	\N	2023-04-27 21:21:10.55986	2023-04-27 21:19:39.291912	1268	24	\N	7	7	\N	\N	\N	6	\N	1261	-1	\N	-1	-1
f	2023-04-27 21:19:39.301327	\N	2023-04-27 21:21:10.570047	2023-04-27 21:19:39.296735	1269	\N	\N	7	7	\N	\N	\N	\N	\N	1268	-1	\N	-1	-1
f	2023-04-27 21:19:39.305812	\N	2023-04-27 21:21:10.579414	2023-04-27 21:19:39.301626	1270	\N	\N	7	7	\N	\N	\N	\N	\N	1268	-1	\N	-1	-1
f	2023-04-27 21:19:39.310508	\N	2023-04-27 21:21:10.587646	2023-04-27 21:19:39.306111	1271	22	\N	7	7	\N	\N	\N	\N	\N	1260	-1	\N	-1	-1
f	2023-04-27 21:19:39.323769	\N	2023-04-27 21:21:10.599853	2023-04-27 21:19:39.310827	1272	22	\N	7	7	85	\N	\N	\N	\N	1271	-1	\N	-1	-1
f	2023-04-27 21:19:39.329129	\N	2023-04-27 21:21:10.615063	2023-04-27 21:19:39.324168	1273	24	\N	7	7	\N	\N	\N	\N	\N	1271	-1	\N	-1	-1
f	2023-04-27 21:19:39.333756	\N	2023-04-27 21:21:10.623914	2023-04-27 21:19:39.329437	1274	\N	\N	7	7	\N	\N	\N	\N	\N	1259	-1	\N	-1	-1
f	2023-04-27 21:24:13.942105	\N	2023-04-27 21:26:05.060116	2023-04-27 21:24:13.92532	1310	22	\N	7	7	85	\N	\N	\N	\N	1309	-1	\N	-1	-1
f	2023-04-27 21:24:13.94674	\N	2023-04-27 21:26:05.083232	2023-04-27 21:24:13.942393	1311	24	\N	7	7	\N	\N	\N	6	\N	1309	-1	\N	-1	-1
f	2023-04-27 21:24:13.773719	\N	2023-04-27 21:26:05.104093	2023-04-27 21:24:13.768685	1294	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:24:13.790637	\N	2023-04-27 21:26:05.131435	2023-04-27 21:24:13.774595	1295	22	\N	7	7	\N	\N	\N	9	\N	1294	-1	\N	-1	-1
f	2023-04-27 21:24:13.799446	\N	2023-04-27 21:26:05.159008	2023-04-27 21:24:13.791231	1296	22	\N	7	7	\N	\N	\N	7	\N	1295	-1	\N	-1	-1
f	2023-04-27 21:24:13.817014	\N	2023-04-27 21:26:05.173256	2023-04-27 21:24:13.800104	1297	22	\N	7	7	\N	\N	\N	\N	\N	1296	-1	\N	-1	-1
f	2023-04-27 21:24:13.826228	\N	2023-04-27 21:26:05.18749	2023-04-27 21:24:13.817622	1298	22	\N	7	7	\N	\N	\N	6	\N	1297	-1	\N	-1	-1
f	2023-04-27 21:24:13.835134	\N	2023-04-27 21:26:05.205901	2023-04-27 21:24:13.826825	1299	\N	\N	7	7	\N	\N	\N	\N	\N	1298	-1	\N	-1	-1
f	2023-04-27 21:24:13.84396	\N	2023-04-27 21:26:05.219853	2023-04-27 21:24:13.835716	1300	22	\N	7	7	\N	\N	\N	9	\N	1299	-1	\N	-1	-1
f	2023-04-27 21:24:13.859862	\N	2023-04-27 21:26:05.245987	2023-04-27 21:24:13.844595	1301	22	\N	7	7	86	\N	13	4	\N	1300	-1	\N	-1	-1
f	2023-04-27 21:24:13.870109	\N	2023-04-27 21:26:05.293798	2023-04-27 21:24:13.86051	1302	53	\N	7	7	\N	\N	\N	9	\N	1299	-1	\N	-1	-1
f	2023-04-27 21:24:13.879155	\N	2023-04-27 21:26:05.311414	2023-04-27 21:24:13.87068	1303	22	\N	7	7	\N	32	\N	5	\N	1302	-1	\N	-1	-1
f	2023-04-27 21:24:13.888275	\N	2023-04-27 21:26:05.325143	2023-04-27 21:24:13.879766	1304	24	\N	7	7	\N	\N	\N	6	\N	1297	-1	\N	-1	-1
f	2023-04-27 21:24:13.897046	\N	2023-04-27 21:26:05.338407	2023-04-27 21:24:13.888862	1305	22	\N	7	7	\N	\N	\N	9	\N	1304	-1	\N	-1	-1
f	2023-04-27 21:24:13.906271	\N	2023-04-27 21:26:05.357673	2023-04-27 21:24:13.897682	1306	22	\N	7	7	\N	32	\N	5	\N	1305	-1	\N	-1	-1
f	2023-04-27 21:24:13.911461	\N	2023-04-27 21:26:05.371931	2023-04-27 21:24:13.906558	1307	23	\N	7	7	\N	\N	\N	9	\N	1304	-1	\N	-1	-1
f	2023-04-27 21:24:13.920085	\N	2023-04-27 21:26:05.38596	2023-04-27 21:24:13.911744	1308	22	\N	7	7	86	\N	13	4	\N	1307	-1	\N	-1	-1
f	2023-04-27 21:24:13.925033	\N	2023-04-27 21:26:05.400448	2023-04-27 21:24:13.920383	1309	22	\N	7	7	\N	\N	\N	\N	\N	1296	-1	\N	-1	-1
f	2023-04-27 21:24:13.951171	\N	2023-04-27 21:26:05.415161	2023-04-27 21:24:13.947024	1312	\N	\N	7	7	\N	\N	\N	6	\N	1311	-1	\N	-1	-1
f	2023-04-27 21:24:13.956589	\N	2023-04-27 21:26:05.429706	2023-04-27 21:24:13.951469	1313	\N	\N	7	7	\N	\N	\N	6	\N	1312	-1	\N	-1	-1
f	2023-04-27 21:24:13.961069	\N	2023-04-27 21:26:05.449033	2023-04-27 21:24:13.956894	1314	\N	\N	7	7	\N	\N	\N	\N	\N	1313	-1	\N	-1	-1
f	2023-04-27 21:24:13.965361	\N	2023-04-27 21:26:05.478684	2023-04-27 21:24:13.961353	1315	\N	\N	7	7	\N	\N	\N	\N	\N	1313	-1	\N	-1	-1
f	2023-04-27 21:24:13.969856	\N	2023-04-27 21:26:05.493217	2023-04-27 21:24:13.965646	1316	\N	\N	7	7	\N	\N	\N	\N	\N	1312	-1	\N	-1	-1
f	2023-04-27 21:24:13.974234	\N	2023-04-27 21:26:05.508866	2023-04-27 21:24:13.970139	1317	\N	\N	7	7	\N	\N	\N	\N	\N	1311	-1	\N	-1	-1
f	2023-04-27 21:24:13.981703	\N	2023-04-27 21:26:05.523551	2023-04-27 21:24:13.974517	1318	\N	\N	7	7	\N	\N	\N	\N	\N	1311	-1	\N	-1	-1
f	2023-04-27 21:24:13.987398	\N	2023-04-27 21:26:05.541235	2023-04-27 21:24:13.982004	1319	\N	\N	7	7	\N	\N	\N	\N	\N	1295	-1	\N	-1	-1
f	2023-04-27 23:33:19.274692	\N	2023-05-02 09:12:39.962503	2023-04-27 23:33:19.2593	1505	22	\N	7	7	86	\N	13	4	\N	1504	-1	\N	-1	-1
f	2023-04-27 23:33:19.587198	\N	2023-05-02 09:12:40.400659	2023-04-27 23:33:19.578738	1530	22	\N	7	7	\N	32	\N	5	\N	1529	-1	\N	-1	-1
f	2023-05-02 12:55:22.663722	\N	2023-05-02 12:56:01.775296	2023-05-02 12:55:22.648343	1648	22	\N	29	29	67	\N	19	4	\N	1647	-1	\N	-1	-1
f	2023-05-02 12:55:22.685115	\N	2023-05-02 12:56:01.789534	2023-05-02 12:55:22.664396	1649	27	\N	29	29	81	\N	20	4	\N	1647	-1	\N	-1	-1
f	2023-05-02 12:55:22.694654	\N	2023-05-02 12:56:01.803473	2023-05-02 12:55:22.685701	1650	\N	\N	29	29	\N	\N	\N	6	\N	1645	-1	\N	-1	-1
f	2023-05-02 12:55:22.703406	\N	2023-05-02 12:56:01.817168	2023-05-02 12:55:22.695218	1651	\N	\N	29	29	\N	\N	\N	6	\N	1650	-1	\N	-1	-1
f	2023-05-02 12:55:22.719541	\N	2023-05-02 12:56:01.830691	2023-05-02 12:55:22.70398	1652	22	\N	29	29	81	\N	20	4	\N	1651	-1	\N	-1	-1
f	2023-05-02 12:55:22.737045	\N	2023-05-02 12:56:01.845715	2023-05-02 12:55:22.720506	1653	23	\N	29	29	67	\N	19	4	\N	1651	-1	\N	-1	-1
f	2023-05-02 12:55:22.748432	\N	2023-05-02 12:56:01.860745	2023-05-02 12:55:22.737648	1654	22	\N	29	29	\N	\N	\N	\N	\N	1644	-1	\N	-1	-1
f	2023-05-02 12:55:22.766778	\N	2023-05-02 12:56:01.874137	2023-05-02 12:55:22.749002	1655	22	\N	29	29	77	\N	\N	\N	\N	1654	-1	\N	-1	-1
f	2023-05-02 12:55:22.777658	\N	2023-05-02 12:56:01.887456	2023-05-02 12:55:22.76735	1656	24	\N	29	29	\N	\N	\N	6	\N	1654	-1	\N	-1	-1
f	2023-05-02 12:55:22.793473	\N	2023-05-02 12:56:01.900936	2023-05-02 12:55:22.778221	1657	22	\N	29	29	76	\N	16	4	\N	1656	-1	\N	-1	-1
f	2023-05-03 15:12:58.853678	\N	2023-05-04 08:59:13.093166	2023-05-03 15:12:58.835435	1721	\N	\N	26	26	\N	\N	\N	6	\N	1720	-1	\N	-1	-1
f	2023-05-03 15:12:58.86523	\N	2023-05-04 08:59:13.107355	2023-05-03 15:12:58.854254	1722	\N	\N	26	26	\N	\N	\N	\N	\N	1721	-1	\N	-1	-1
f	2023-05-03 15:12:58.893756	\N	2023-05-04 08:59:13.135431	2023-05-03 15:12:58.875657	1724	22	\N	26	26	59	\N	16	4	\N	1723	-1	\N	-1	-1
f	2023-04-10 11:10:04.143541	\N	2023-05-02 12:57:28.988567	2023-04-10 11:10:04.134305	714	\N	\N	20	20	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:10:04.164132	\N	2023-05-02 12:57:29.019111	2023-04-10 11:10:04.155623	716	\N	\N	20	20	\N	\N	\N	\N	\N	715	-1	\N	-1	-1
f	2023-04-10 11:49:52.591193	\N	2023-04-10 12:12:47.707108	2023-04-10 11:49:52.587165	751	\N	\N	25	25	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:49:52.596219	\N	2023-04-10 12:12:47.715902	2023-04-10 11:49:52.5915	752	22	\N	25	25	\N	\N	\N	6	\N	751	-1	\N	-1	-1
f	2023-04-10 11:49:52.601058	\N	2023-04-10 12:12:47.724109	2023-04-10 11:49:52.596534	753	\N	\N	25	25	\N	\N	\N	\N	\N	752	-1	\N	-1	-1
f	2023-04-10 11:49:52.605475	\N	2023-04-10 12:12:47.731432	2023-04-10 11:49:52.601353	754	\N	\N	25	25	\N	\N	\N	6	\N	752	-1	\N	-1	-1
f	2023-04-10 11:49:52.609922	\N	2023-04-10 12:12:47.740173	2023-04-10 11:49:52.605777	755	22	\N	25	25	\N	\N	\N	6	\N	754	-1	\N	-1	-1
f	2023-04-10 11:49:52.614624	\N	2023-04-10 12:12:47.747522	2023-04-10 11:49:52.610215	756	\N	\N	25	25	\N	\N	\N	6	\N	755	-1	\N	-1	-1
f	2023-04-10 11:49:52.619754	\N	2023-04-10 12:12:47.755693	2023-04-10 11:49:52.614935	757	\N	\N	25	25	\N	\N	\N	\N	\N	756	-1	\N	-1	-1
f	2023-04-10 11:49:52.625103	\N	2023-04-10 12:12:47.762738	2023-04-10 11:49:52.620124	758	52	\N	25	25	\N	\N	\N	\N	\N	756	-1	\N	-1	-1
f	2023-04-10 11:49:52.629775	\N	2023-04-10 12:12:47.769972	2023-04-10 11:49:52.625404	759	\N	\N	25	25	\N	\N	\N	6	\N	755	-1	\N	-1	-1
f	2023-04-10 11:49:52.634238	\N	2023-04-10 12:12:47.776945	2023-04-10 11:49:52.630067	760	\N	\N	25	25	\N	\N	\N	\N	\N	759	-1	\N	-1	-1
f	2023-04-10 11:49:52.638667	\N	2023-04-10 12:12:47.783737	2023-04-10 11:49:52.63455	761	52	\N	25	25	\N	\N	\N	\N	\N	759	-1	\N	-1	-1
f	2023-04-10 11:49:52.643275	\N	2023-04-10 12:12:47.790878	2023-04-10 11:49:52.638957	762	52	\N	25	25	\N	\N	\N	\N	\N	754	-1	\N	-1	-1
f	2023-04-10 11:07:05.75479	\N	2023-04-10 12:19:32.290491	2023-04-10 11:07:05.731242	707	\N	\N	19	19	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:07:05.781852	\N	2023-04-10 12:19:32.348136	2023-04-10 11:07:05.77352	710	22	\N	19	19	\N	\N	\N	6	\N	709	-1	\N	-1	-1
f	2023-04-10 11:02:39.220296	\N	2023-04-10 12:24:21.979205	2023-04-10 11:02:39.210915	699	51	\N	16	16	49	\N	16	4	\N	695	-1	\N	-1	-1
f	2023-04-10 12:24:21.984883	\N	2023-04-10 12:25:37.881742	2023-04-10 12:24:21.982404	782	\N	\N	16	16	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:24:21.998278	\N	2023-04-10 12:25:37.889682	2023-04-10 12:24:21.985264	783	24	\N	16	16	\N	\N	\N	6	\N	782	-1	\N	-1	-1
f	2023-04-10 12:24:22.007465	\N	2023-04-10 12:25:37.899112	2023-04-10 12:24:21.998935	784	22	\N	16	16	\N	\N	\N	6	\N	783	-1	\N	-1	-1
f	2023-04-10 12:24:22.017085	\N	2023-04-10 12:25:37.90649	2023-04-10 12:24:22.00809	785	\N	\N	16	16	\N	\N	\N	\N	\N	784	-1	\N	-1	-1
f	2023-04-10 12:24:22.037074	\N	2023-04-10 12:25:37.915015	2023-04-10 12:24:22.02094	786	51	\N	16	16	47	\N	20	4	\N	784	-1	\N	-1	-1
f	2023-04-10 12:24:22.047526	\N	2023-04-10 12:25:37.923891	2023-04-10 12:24:22.037636	787	\N	\N	16	16	\N	\N	\N	\N	\N	783	-1	\N	-1	-1
f	2023-04-10 11:10:04.174206	\N	2023-05-02 12:57:29.033279	2023-04-10 11:10:04.164749	717	\N	\N	20	20	\N	\N	\N	6	\N	715	-1	\N	-1	-1
f	2023-04-10 12:19:32.405816	\N	2023-04-10 12:26:56.478307	2023-04-10 12:19:32.399541	775	\N	\N	19	19	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:19:32.441805	\N	2023-04-10 12:26:56.496801	2023-04-10 12:19:32.406441	776	24	\N	19	19	\N	\N	\N	6	\N	775	-1	\N	-1	-1
f	2023-04-10 12:19:32.451375	\N	2023-04-10 12:26:56.514878	2023-04-10 12:19:32.442409	777	22	\N	19	19	\N	\N	\N	6	\N	776	-1	\N	-1	-1
f	2023-04-10 12:19:32.473046	\N	2023-04-10 12:26:56.532756	2023-04-10 12:19:32.451959	778	22	\N	19	19	\N	\N	\N	6	\N	777	-1	\N	-1	-1
f	2023-04-10 12:19:32.481988	\N	2023-04-10 12:26:56.550474	2023-04-10 12:19:32.473623	779	\N	\N	19	19	\N	\N	\N	\N	\N	778	-1	\N	-1	-1
f	2023-04-10 12:19:32.500727	\N	2023-04-10 12:26:56.568444	2023-04-10 12:19:32.482583	780	51	\N	19	19	58	\N	20	4	\N	778	-1	\N	-1	-1
f	2023-04-10 12:19:32.514497	\N	2023-04-10 12:26:56.588353	2023-04-10 12:19:32.502641	781	\N	\N	19	19	\N	\N	\N	\N	\N	777	-1	\N	-1	-1
f	2023-04-10 12:26:56.604418	\N	2023-04-10 12:29:00.17005	2023-04-10 12:26:56.60139	794	\N	\N	19	19	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:26:56.613058	\N	2023-04-10 12:29:00.184886	2023-04-10 12:26:56.604749	795	24	\N	19	19	\N	\N	\N	6	\N	794	-1	\N	-1	-1
f	2023-04-10 11:10:04.183079	\N	2023-05-02 12:57:29.049689	2023-04-10 11:10:04.174778	718	24	\N	20	20	\N	\N	\N	6	\N	717	-1	\N	-1	-1
f	2023-04-10 12:25:37.929295	\N	2023-04-11 15:05:07.293408	2023-04-10 12:25:37.926868	788	\N	\N	16	16	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:25:37.942432	\N	2023-04-11 15:05:07.314762	2023-04-10 12:25:37.938055	790	22	\N	16	16	\N	\N	\N	6	\N	789	-1	\N	-1	-1
f	2023-04-10 12:25:37.947131	\N	2023-04-11 15:05:07.32242	2023-04-10 12:25:37.94272	791	\N	\N	16	16	\N	\N	\N	\N	\N	790	-1	\N	-1	-1
f	2023-04-10 12:25:37.955902	\N	2023-04-11 15:05:07.330116	2023-04-10 12:25:37.947453	792	51	\N	16	16	47	\N	20	4	\N	790	-1	\N	-1	-1
f	2023-04-10 12:25:37.964597	\N	2023-04-11 15:05:07.337483	2023-04-10 12:25:37.956275	793	51	\N	16	16	62	\N	16	4	\N	789	-1	\N	-1	-1
f	2023-04-10 11:19:20.628366	\N	2023-04-13 15:00:49.734985	2023-04-10 11:19:20.619999	731	\N	\N	22	22	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:19:20.648345	\N	2023-04-13 15:00:49.822763	2023-04-10 11:19:20.639604	733	\N	\N	22	22	\N	\N	\N	\N	\N	732	-1	\N	-1	-1
f	2023-04-10 11:19:20.658178	\N	2023-04-13 15:00:49.836013	2023-04-10 11:19:20.649214	734	\N	\N	22	22	\N	\N	\N	6	\N	732	-1	\N	-1	-1
f	2023-04-10 11:19:20.667497	\N	2023-04-13 15:00:49.850769	2023-04-10 11:19:20.65878	735	\N	\N	22	22	\N	\N	\N	\N	\N	734	-1	\N	-1	-1
f	2023-04-10 11:19:20.676255	\N	2023-04-13 15:00:49.86613	2023-04-10 11:19:20.668144	736	\N	\N	22	22	\N	\N	\N	\N	\N	734	-1	\N	-1	-1
f	2023-04-10 11:28:24.575353	\N	2023-04-13 15:30:39.791777	2023-04-10 11:28:24.56683	737	\N	\N	23	23	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:28:24.585302	\N	2023-04-13 15:30:39.809577	2023-04-10 11:28:24.58082	739	\N	\N	23	23	\N	\N	\N	6	\N	738	-1	\N	-1	-1
f	2023-04-10 11:28:24.589966	\N	2023-04-13 15:30:39.817298	2023-04-10 11:28:24.585599	740	\N	\N	23	23	\N	\N	\N	6	\N	739	-1	\N	-1	-1
f	2023-04-10 11:28:24.594555	\N	2023-04-13 15:30:39.824644	2023-04-10 11:28:24.59026	741	\N	\N	23	23	\N	\N	\N	\N	\N	740	-1	\N	-1	-1
f	2023-04-10 11:28:24.599248	\N	2023-04-13 15:30:39.83165	2023-04-10 11:28:24.594848	742	52	\N	23	23	\N	\N	\N	\N	\N	740	-1	\N	-1	-1
f	2023-04-10 11:28:24.604974	\N	2023-04-13 15:30:39.839459	2023-04-10 11:28:24.599547	743	52	\N	23	23	\N	\N	\N	\N	\N	739	-1	\N	-1	-1
f	2023-04-10 11:28:24.610009	\N	2023-04-13 15:30:39.846271	2023-04-10 11:28:24.605337	744	\N	\N	23	23	\N	\N	\N	\N	\N	738	-1	\N	-1	-1
f	2023-04-10 11:10:04.19192	\N	2023-05-02 12:57:29.063264	2023-04-10 11:10:04.183656	719	\N	\N	20	20	\N	\N	\N	\N	\N	718	-1	\N	-1	-1
f	2023-04-10 11:10:04.200994	\N	2023-05-02 12:57:29.076365	2023-04-10 11:10:04.192581	720	\N	\N	20	20	\N	\N	\N	\N	\N	718	-1	\N	-1	-1
f	2023-04-10 11:16:02.134273	\N	2023-05-02 13:28:11.169095	2023-04-10 11:16:02.095357	722	\N	\N	21	21	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:16:02.157006	\N	2023-05-02 13:28:11.214396	2023-04-10 11:16:02.134759	723	\N	\N	21	21	\N	\N	\N	6	\N	722	-1	\N	-1	-1
f	2023-04-10 11:16:02.170929	\N	2023-05-02 13:28:11.231907	2023-04-10 11:16:02.15796	724	\N	\N	21	21	\N	\N	\N	6	\N	723	-1	\N	-1	-1
f	2023-04-10 11:16:02.184423	\N	2023-05-02 13:28:11.261514	2023-04-10 11:16:02.171881	725	\N	\N	21	21	\N	\N	\N	6	\N	724	-1	\N	-1	-1
f	2023-04-10 11:16:02.192064	\N	2023-05-02 13:28:11.33862	2023-04-10 11:16:02.185171	726	\N	\N	21	21	\N	\N	\N	6	\N	725	-1	\N	-1	-1
f	2023-04-10 11:16:02.199349	\N	2023-05-02 13:28:11.380138	2023-04-10 11:16:02.19252	727	\N	\N	21	21	\N	\N	\N	\N	\N	726	-1	\N	-1	-1
f	2023-04-10 11:16:02.215892	\N	2023-05-02 13:28:11.474891	2023-04-10 11:16:02.208292	729	\N	\N	21	21	\N	\N	\N	\N	\N	724	-1	\N	-1	-1
f	2023-04-10 11:16:02.223957	\N	2023-05-02 13:28:11.542559	2023-04-10 11:16:02.216453	730	\N	\N	21	21	\N	\N	\N	\N	\N	723	-1	\N	-1	-1
f	2023-04-10 11:38:37.146267	\N	2023-05-04 08:59:30.001929	2023-04-10 11:38:37.13849	745	\N	\N	24	24	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:38:37.156084	\N	2023-05-04 08:59:30.052868	2023-04-10 11:38:37.146873	746	\N	\N	24	24	\N	\N	\N	6	\N	745	-1	\N	-1	-1
f	2023-04-10 11:38:37.164838	\N	2023-05-04 08:59:30.066237	2023-04-10 11:38:37.156662	747	\N	\N	24	24	\N	\N	\N	\N	\N	746	-1	\N	-1	-1
f	2023-04-10 11:38:37.183856	\N	2023-05-04 08:59:30.177603	2023-04-10 11:38:37.173982	749	\N	\N	24	24	\N	\N	\N	\N	\N	748	-1	\N	-1	-1
f	2023-04-10 11:38:37.205759	\N	2023-05-04 08:59:30.194518	2023-04-10 11:38:37.192564	750	52	\N	24	24	\N	\N	\N	\N	\N	748	-1	\N	-1	-1
f	2023-04-10 12:12:47.796127	\N	2023-05-04 10:40:38.113501	2023-04-10 12:12:47.793731	763	\N	\N	25	25	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:12:47.804657	\N	2023-05-04 10:40:38.126479	2023-04-10 12:12:47.796438	764	22	\N	25	25	\N	\N	\N	6	\N	763	-1	\N	-1	-1
f	2023-04-10 12:12:47.809199	\N	2023-05-04 10:40:38.148961	2023-04-10 12:12:47.804962	765	\N	\N	25	25	\N	\N	\N	\N	\N	764	-1	\N	-1	-1
f	2023-04-10 12:12:47.818896	\N	2023-05-04 10:40:38.172742	2023-04-10 12:12:47.813879	767	22	\N	25	25	\N	\N	\N	6	\N	766	-1	\N	-1	-1
f	2023-04-10 12:12:47.82342	\N	2023-05-04 10:40:38.180788	2023-04-10 12:12:47.819214	768	\N	\N	25	25	\N	\N	\N	6	\N	767	-1	\N	-1	-1
f	2023-04-10 12:12:47.827756	\N	2023-05-04 10:40:38.188518	2023-04-10 12:12:47.823706	769	\N	\N	25	25	\N	\N	\N	\N	\N	768	-1	\N	-1	-1
f	2023-04-10 12:12:47.859128	\N	2023-05-04 10:40:38.195452	2023-04-10 12:12:47.82807	770	52	\N	25	25	\N	\N	\N	\N	\N	768	-1	\N	-1	-1
f	2023-04-10 12:12:47.868251	\N	2023-05-04 10:40:38.202631	2023-04-10 12:12:47.859736	771	\N	\N	25	25	\N	\N	\N	6	\N	767	-1	\N	-1	-1
f	2023-04-10 12:12:47.87708	\N	2023-05-04 10:40:38.211495	2023-04-10 12:12:47.868836	772	\N	\N	25	25	\N	\N	\N	\N	\N	771	-1	\N	-1	-1
f	2023-04-10 12:12:47.894412	\N	2023-05-04 10:40:38.224951	2023-04-10 12:12:47.886238	774	52	\N	25	25	\N	\N	\N	\N	\N	766	-1	\N	-1	-1
f	2023-04-10 12:26:56.617875	\N	2023-04-10 12:29:00.201517	2023-04-10 12:26:56.61342	796	22	\N	19	19	\N	\N	\N	6	\N	795	-1	\N	-1	-1
f	2023-04-10 12:26:56.622931	\N	2023-04-10 12:29:00.213924	2023-04-10 12:26:56.618195	797	22	\N	19	19	\N	\N	\N	6	\N	796	-1	\N	-1	-1
f	2023-04-10 12:26:56.627694	\N	2023-04-10 12:29:00.227131	2023-04-10 12:26:56.623258	798	\N	\N	19	19	\N	\N	\N	\N	\N	797	-1	\N	-1	-1
f	2023-04-10 12:26:56.636412	\N	2023-04-10 12:29:00.240662	2023-04-10 12:26:56.628009	799	51	\N	19	19	58	\N	20	4	\N	797	-1	\N	-1	-1
f	2023-04-10 12:26:56.646123	\N	2023-04-10 12:29:00.254807	2023-04-10 12:26:56.636772	800	51	\N	19	19	62	\N	16	4	\N	796	-1	\N	-1	-1
f	2023-04-27 21:14:57.620104	\N	2023-04-27 21:19:39.108063	2023-04-27 21:14:57.61532	1245	22	\N	7	7	\N	\N	\N	7	\N	1244	-1	\N	-1	-1
f	2023-04-27 21:21:10.630233	\N	2023-04-27 21:24:13.493059	2023-04-27 21:21:10.627265	1275	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:21:10.640244	\N	2023-04-27 21:24:13.507287	2023-04-27 21:21:10.630612	1276	22	\N	7	7	\N	\N	\N	9	\N	1275	-1	\N	-1	-1
f	2023-04-27 21:21:10.646017	\N	2023-04-27 21:24:13.520198	2023-04-27 21:21:10.640649	1277	22	\N	7	7	\N	\N	\N	7	\N	1276	-1	\N	-1	-1
f	2023-04-27 21:21:10.652237	\N	2023-04-27 21:24:13.535031	2023-04-27 21:21:10.646367	1278	22	\N	7	7	\N	\N	\N	\N	\N	1277	-1	\N	-1	-1
f	2023-04-27 21:21:10.658234	\N	2023-04-27 21:24:13.550907	2023-04-27 21:21:10.652634	1279	22	\N	7	7	\N	\N	\N	6	\N	1278	-1	\N	-1	-1
f	2023-04-27 21:21:10.663	\N	2023-04-27 21:24:13.5646	2023-04-27 21:21:10.658615	1280	\N	\N	7	7	\N	\N	\N	\N	\N	1279	-1	\N	-1	-1
f	2023-04-27 21:21:10.668074	\N	2023-04-27 21:24:13.578132	2023-04-27 21:21:10.663282	1281	22	\N	7	7	\N	\N	\N	9	\N	1280	-1	\N	-1	-1
f	2023-04-27 21:21:10.67699	\N	2023-04-27 21:24:13.595096	2023-04-27 21:21:10.668359	1282	22	\N	7	7	86	\N	13	4	\N	1281	-1	\N	-1	-1
f	2023-04-27 21:21:10.681805	\N	2023-04-27 21:24:13.609876	2023-04-27 21:21:10.677295	1283	53	\N	7	7	\N	\N	\N	9	\N	1280	-1	\N	-1	-1
f	2023-04-27 21:21:10.68683	\N	2023-04-27 21:24:13.623144	2023-04-27 21:21:10.682096	1284	22	\N	7	7	\N	32	\N	5	\N	1283	-1	\N	-1	-1
f	2023-04-27 21:21:10.692318	\N	2023-04-27 21:24:13.639252	2023-04-27 21:21:10.687205	1285	24	\N	7	7	\N	\N	\N	6	\N	1278	-1	\N	-1	-1
f	2023-04-27 21:21:10.699561	\N	2023-04-27 21:24:13.653027	2023-04-27 21:21:10.692656	1286	22	\N	7	7	\N	\N	\N	9	63	1285	-1	\N	-1	-1
f	2023-04-27 21:21:10.704971	\N	2023-04-27 21:24:13.666872	2023-04-27 21:21:10.699909	1287	22	\N	7	7	\N	32	\N	5	\N	1286	-1	\N	-1	-1
f	2023-04-27 21:21:10.715872	\N	2023-04-27 21:24:13.680505	2023-04-27 21:21:10.70536	1288	23	\N	7	7	\N	\N	\N	9	63	1285	-1	\N	-1	-1
f	2023-04-27 21:21:10.741685	\N	2023-04-27 21:24:13.69868	2023-04-27 21:21:10.716349	1289	22	\N	7	7	86	\N	13	4	\N	1288	-1	\N	-1	-1
f	2023-04-27 21:21:10.748721	\N	2023-04-27 21:24:13.712501	2023-04-27 21:21:10.742097	1290	22	\N	7	7	\N	\N	\N	\N	\N	1277	-1	\N	-1	-1
f	2023-04-27 21:21:10.764054	\N	2023-04-27 21:24:13.730574	2023-04-27 21:21:10.749094	1291	22	\N	7	7	85	\N	\N	\N	\N	1290	-1	\N	-1	-1
f	2023-04-27 21:21:10.770812	\N	2023-04-27 21:24:13.749645	2023-04-27 21:21:10.764443	1292	24	\N	7	7	\N	\N	\N	\N	\N	1290	-1	\N	-1	-1
f	2023-04-27 21:21:10.776891	\N	2023-04-27 21:24:13.763348	2023-04-27 21:21:10.771196	1293	\N	\N	7	7	\N	\N	\N	\N	\N	1276	-1	\N	-1	-1
f	2023-04-27 23:33:19.369579	\N	2023-05-02 09:12:40.060337	2023-04-27 23:33:19.33625	1512	22	\N	7	7	86	\N	13	4	\N	1511	-1	\N	-1	-1
f	2023-05-02 09:12:40.425029	\N	2023-05-02 10:32:11.218956	2023-05-02 09:12:40.420242	1532	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 09:12:40.447013	\N	2023-05-02 10:32:11.23406	2023-05-02 09:12:40.425625	1533	22	\N	7	7	\N	\N	\N	9	\N	1532	-1	\N	-1	-1
f	2023-05-02 09:12:40.460104	\N	2023-05-02 10:32:11.247925	2023-05-02 09:12:40.447687	1534	22	\N	7	7	\N	\N	\N	7	\N	1533	-1	\N	-1	-1
f	2023-05-02 09:12:40.472005	\N	2023-05-02 10:32:11.261761	2023-05-02 09:12:40.460764	1535	22	\N	7	7	\N	\N	\N	\N	\N	1534	-1	\N	-1	-1
f	2023-05-02 09:12:40.482003	\N	2023-05-02 10:32:11.276914	2023-05-02 09:12:40.47267	1536	22	\N	7	7	\N	\N	\N	6	\N	1535	-1	\N	-1	-1
f	2023-05-02 09:12:40.492107	\N	2023-05-02 10:32:11.353368	2023-05-02 09:12:40.482592	1537	\N	\N	7	7	\N	\N	\N	\N	\N	1536	-1	\N	-1	-1
f	2023-05-02 09:12:40.501717	\N	2023-05-02 10:32:11.393746	2023-05-02 09:12:40.492698	1538	22	\N	7	7	\N	\N	\N	9	\N	1537	-1	\N	-1	-1
f	2023-05-02 09:12:40.525003	\N	2023-05-02 10:32:11.412782	2023-05-02 09:12:40.502368	1539	22	\N	7	7	86	\N	13	4	\N	1538	-1	\N	-1	-1
f	2023-05-02 09:12:40.537377	\N	2023-05-02 10:32:11.433306	2023-05-02 09:12:40.525678	1540	53	\N	7	7	\N	\N	\N	9	\N	1537	-1	\N	-1	-1
f	2023-05-02 09:12:40.546341	\N	2023-05-02 10:32:11.441672	2023-05-02 09:12:40.538059	1541	22	\N	7	7	\N	32	\N	5	\N	1540	-1	\N	-1	-1
f	2023-05-02 09:12:40.550919	\N	2023-05-02 10:32:11.449016	2023-05-02 09:12:40.546654	1542	24	\N	7	7	\N	\N	\N	6	\N	1535	-1	\N	-1	-1
f	2023-05-02 09:12:40.556941	\N	2023-05-02 10:32:11.456327	2023-05-02 09:12:40.551208	1543	22	\N	7	7	\N	\N	\N	9	50	1542	-1	\N	-1	-1
f	2023-05-02 09:12:40.561476	\N	2023-05-02 10:32:11.463636	2023-05-02 09:12:40.55724	1544	22	\N	7	7	\N	32	\N	5	\N	1543	-1	\N	-1	-1
f	2023-05-02 09:12:40.565871	\N	2023-05-02 10:32:11.471904	2023-05-02 09:12:40.561768	1545	23	\N	7	7	\N	\N	\N	9	\N	1542	-1	\N	-1	-1
f	2023-05-02 09:12:40.5756	\N	2023-05-02 10:32:11.479444	2023-05-02 09:12:40.566171	1546	22	\N	7	7	86	\N	13	4	\N	1545	-1	\N	-1	-1
f	2023-05-02 09:12:40.580694	\N	2023-05-02 10:32:11.487626	2023-05-02 09:12:40.575949	1547	22	\N	7	7	\N	\N	\N	\N	\N	1534	-1	\N	-1	-1
f	2023-05-02 09:12:40.590614	\N	2023-05-02 10:32:11.495041	2023-05-02 09:12:40.580983	1548	22	\N	7	7	85	\N	\N	\N	\N	1547	-1	\N	-1	-1
f	2023-05-02 09:12:40.595414	\N	2023-05-02 10:32:11.502434	2023-05-02 09:12:40.590937	1549	24	\N	7	7	\N	\N	\N	6	\N	1547	-1	\N	-1	-1
f	2023-05-02 09:12:40.600236	\N	2023-05-02 10:32:11.509616	2023-05-02 09:12:40.595702	1550	\N	\N	7	7	\N	\N	\N	6	\N	1549	-1	\N	-1	-1
f	2023-05-02 09:12:40.60474	\N	2023-05-02 10:32:11.516906	2023-05-02 09:12:40.600532	1551	\N	\N	7	7	\N	\N	\N	6	\N	1550	-1	\N	-1	-1
f	2023-05-02 09:12:40.609122	\N	2023-05-02 10:32:11.524172	2023-05-02 09:12:40.605032	1552	22	\N	7	7	\N	\N	\N	9	\N	1551	-1	\N	-1	-1
f	2023-05-02 09:12:40.613694	\N	2023-05-02 10:32:11.531523	2023-05-02 09:12:40.609405	1553	22	\N	7	7	\N	32	\N	5	\N	1552	-1	\N	-1	-1
f	2023-05-02 09:12:40.618098	\N	2023-05-02 10:32:11.5387	2023-05-02 09:12:40.613985	1554	23	\N	7	7	\N	\N	\N	9	\N	1551	-1	\N	-1	-1
f	2023-05-02 09:12:40.625877	\N	2023-05-02 10:32:11.546069	2023-05-02 09:12:40.618386	1555	22	\N	7	7	86	\N	13	4	\N	1554	-1	\N	-1	-1
f	2023-05-02 09:12:40.63466	\N	2023-05-02 10:32:11.553289	2023-05-02 09:12:40.626189	1556	25	\N	7	7	27	\N	16	4	\N	1550	-1	\N	-1	-1
f	2023-05-02 09:12:40.640286	\N	2023-05-02 10:32:11.561125	2023-05-02 09:12:40.635004	1557	22	\N	7	7	\N	\N	\N	6	\N	1549	-1	\N	-1	-1
f	2023-05-02 09:12:40.64973	\N	2023-05-02 10:32:11.572981	2023-05-02 09:12:40.640578	1558	22	\N	7	7	27	\N	16	4	\N	1557	-1	\N	-1	-1
f	2023-05-02 09:12:40.659648	\N	2023-05-02 10:32:11.581266	2023-05-02 09:12:40.65037	1559	23	\N	7	7	\N	\N	\N	9	\N	1557	-1	\N	-1	-1
f	2023-05-02 09:12:40.67474	\N	2023-05-02 10:32:11.598191	2023-05-02 09:12:40.660348	1560	22	\N	7	7	86	\N	13	4	\N	1559	-1	\N	-1	-1
f	2023-05-02 09:12:40.689816	\N	2023-05-02 10:32:11.607338	2023-05-02 09:12:40.675222	1561	22	\N	7	7	28	\N	16	4	\N	1557	-1	\N	-1	-1
f	2023-05-02 09:12:40.699043	\N	2023-05-02 10:32:11.617916	2023-05-02 09:12:40.690455	1562	22	\N	7	7	\N	\N	\N	6	\N	1549	-1	\N	-1	-1
f	2023-05-02 09:12:40.70745	\N	2023-05-02 10:32:11.627041	2023-05-02 09:12:40.699631	1563	22	\N	7	7	\N	\N	\N	9	\N	1562	-1	\N	-1	-1
f	2023-05-02 09:12:40.715794	\N	2023-05-02 10:32:11.636181	2023-05-02 09:12:40.708073	1564	22	\N	7	7	\N	32	\N	5	\N	1563	-1	\N	-1	-1
f	2023-05-02 09:12:40.731247	\N	2023-05-02 10:32:11.64933	2023-05-02 09:12:40.716482	1565	25	\N	7	7	27	\N	16	4	\N	1533	-1	\N	-1	-1
f	2023-04-10 11:10:04.155037	\N	2023-05-02 12:57:29.004562	2023-04-10 11:10:04.144743	715	24	\N	20	20	\N	\N	\N	6	\N	714	-1	\N	-1	-1
f	2023-05-02 14:40:07.242675	\N	2023-05-02 14:40:26.021808	2023-05-02 14:40:07.237583	1707	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 14:40:07.276659	\N	2023-05-02 14:40:26.035595	2023-05-02 14:40:07.243321	1708	22	\N	10	10	29	\N	13	4	\N	1707	-1	\N	-1	-1
f	2023-05-02 14:40:07.296613	\N	2023-05-02 14:40:26.050576	2023-05-02 14:40:07.277254	1709	\N	\N	10	10	30	\N	12	4	\N	1707	-1	\N	-1	-1
f	2023-05-03 15:12:58.911258	\N	2023-05-04 08:59:13.151231	2023-05-03 15:12:58.894397	1725	53	\N	26	26	61	\N	16	4	\N	1723	-1	\N	-1	-1
f	2023-05-02 13:28:11.595278	\N	2023-05-04 08:59:59.530412	2023-05-02 13:28:11.586302	1692	\N	\N	21	21	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 13:28:11.623453	\N	2023-05-04 08:59:59.545462	2023-05-02 13:28:11.595987	1693	\N	\N	21	21	\N	\N	\N	6	\N	1692	-1	\N	-1	-1
f	2023-05-02 13:28:11.636458	\N	2023-05-04 08:59:59.581197	2023-05-02 13:28:11.624178	1694	\N	\N	21	21	\N	\N	\N	6	\N	1693	-1	\N	-1	-1
f	2023-05-02 13:28:11.660486	\N	2023-05-04 08:59:59.612964	2023-05-02 13:28:11.649776	1696	\N	\N	21	21	\N	\N	\N	6	\N	1695	-1	\N	-1	-1
f	2023-05-02 13:28:11.670952	\N	2023-05-04 08:59:59.626975	2023-05-02 13:28:11.661119	1697	\N	\N	21	21	\N	\N	\N	\N	\N	1696	-1	\N	-1	-1
f	2023-05-02 13:28:11.680257	\N	2023-05-04 08:59:59.643412	2023-05-02 13:28:11.671538	1698	\N	\N	21	21	\N	\N	\N	\N	\N	1696	-1	\N	-1	-1
f	2023-05-02 13:28:11.696091	\N	2023-05-04 08:59:59.657783	2023-05-02 13:28:11.680832	1699	\N	\N	21	21	\N	\N	\N	\N	\N	1694	-1	\N	-1	-1
f	2023-05-02 13:28:11.709062	\N	2023-05-04 08:59:59.67257	2023-05-02 13:28:11.696725	1700	\N	\N	21	21	\N	\N	\N	\N	\N	1693	-1	\N	-1	-1
f	2023-04-10 12:43:24.976102	\N	2023-04-11 14:08:25.073552	2023-04-10 12:43:24.957826	808	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:43:24.987341	\N	2023-04-11 14:08:25.093488	2023-04-10 12:43:24.976824	809	\N	\N	26	26	\N	\N	\N	6	\N	808	-1	\N	-1	-1
f	2023-04-10 12:43:24.997457	\N	2023-04-11 14:08:25.107807	2023-04-10 12:43:24.988199	810	\N	\N	26	26	\N	\N	\N	\N	\N	809	-1	\N	-1	-1
f	2023-04-10 12:43:25.007418	\N	2023-04-11 14:08:25.121827	2023-04-10 12:43:24.998043	811	24	\N	26	26	\N	\N	\N	6	\N	809	-1	\N	-1	-1
f	2023-04-10 12:43:25.023638	\N	2023-04-11 14:08:25.149651	2023-04-10 12:43:25.007994	812	22	\N	26	26	59	\N	16	4	\N	811	-1	\N	-1	-1
f	2023-04-10 12:43:25.058321	\N	2023-04-11 14:08:25.163055	2023-04-10 12:43:25.032433	813	51	\N	26	26	61	\N	16	4	\N	811	-1	\N	-1	-1
f	2023-04-10 12:29:00.264601	\N	2023-04-13 11:13:18.795318	2023-04-10 12:29:00.259803	801	\N	\N	19	19	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:29:00.330188	\N	2023-04-13 11:13:18.826985	2023-04-10 12:29:00.265221	802	24	\N	19	19	\N	\N	\N	6	\N	801	-1	\N	-1	-1
f	2023-04-10 12:29:00.34037	\N	2023-04-13 11:13:18.852965	2023-04-10 12:29:00.33081	803	22	\N	19	19	\N	\N	\N	6	\N	802	-1	\N	-1	-1
f	2023-04-10 12:29:00.351106	\N	2023-04-13 11:13:18.880526	2023-04-10 12:29:00.341084	804	22	\N	19	19	\N	\N	\N	6	\N	803	-1	\N	-1	-1
f	2023-04-10 12:29:00.360304	\N	2023-04-13 11:13:18.909579	2023-04-10 12:29:00.351683	805	\N	\N	19	19	\N	\N	\N	\N	\N	804	-1	\N	-1	-1
f	2023-04-10 12:29:00.376252	\N	2023-04-13 11:13:18.938233	2023-04-10 12:29:00.360885	806	51	\N	19	19	58	\N	20	4	\N	804	-1	\N	-1	-1
f	2023-04-10 12:29:00.392704	\N	2023-04-13 11:13:19.029164	2023-04-10 12:29:00.376846	807	51	\N	19	19	62	\N	16	4	\N	802	-1	\N	-1	-1
f	2023-04-27 21:14:57.624923	\N	2023-04-27 21:19:39.116345	2023-04-27 21:14:57.62041	1246	22	\N	7	7	\N	\N	\N	\N	\N	1245	-1	\N	-1	-1
t	2023-05-02 10:27:06.322	\N	\N	2023-05-02 10:27:06.310389	1566	\N	\N	34	34	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 10:27:06.337655	\N	\N	2023-05-02 10:27:06.322701	1567	22	\N	34	34	\N	\N	\N	9	61	1566	-1	\N	\N	-1
t	2023-05-02 10:27:06.348244	\N	\N	2023-05-02 10:27:06.338673	1568	\N	\N	34	34	\N	\N	\N	\N	\N	1566	-1	\N	\N	-1
t	2023-05-02 10:32:11.656324	\N	\N	2023-05-02 10:32:11.653162	1569	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 10:32:11.673324	\N	\N	2023-05-02 10:32:11.667287	1571	22	\N	7	7	\N	\N	\N	7	\N	1570	-1	\N	\N	-1
t	2023-05-02 10:32:11.679665	\N	\N	2023-05-02 10:32:11.673679	1572	22	\N	7	7	\N	\N	\N	\N	\N	1571	-1	\N	\N	-1
t	2023-05-02 10:32:11.685946	\N	\N	2023-05-02 10:32:11.679992	1573	22	\N	7	7	\N	\N	\N	6	\N	1572	-1	\N	\N	-1
t	2023-05-02 10:32:11.693179	\N	\N	2023-05-02 10:32:11.686349	1574	\N	\N	7	7	\N	\N	\N	\N	\N	1573	-1	\N	\N	-1
t	2023-05-02 10:32:11.71218	\N	\N	2023-05-02 10:32:11.700101	1576	22	\N	7	7	86	\N	13	4	\N	1575	-1	\N	\N	-1
t	2023-05-02 10:32:11.726708	\N	\N	2023-05-02 10:32:11.720305	1578	22	\N	7	7	\N	32	\N	5	\N	1577	-1	\N	\N	-1
t	2023-05-02 10:32:11.734108	\N	\N	2023-05-02 10:32:11.727116	1579	24	\N	7	7	\N	\N	\N	6	\N	1572	-1	\N	\N	-1
t	2023-05-02 10:32:11.750147	\N	\N	2023-05-02 10:32:11.743742	1581	22	\N	7	7	\N	32	\N	5	\N	1580	-1	\N	\N	-1
t	2023-05-02 10:32:11.759411	\N	\N	2023-05-02 10:32:11.750582	1582	23	\N	7	7	\N	\N	\N	9	63	1579	-1	\N	\N	-1
t	2023-05-02 10:32:11.773238	\N	\N	2023-05-02 10:32:11.759836	1583	22	\N	7	7	86	\N	13	4	\N	1582	-1	\N	\N	-1
t	2023-05-02 10:32:11.782738	\N	\N	2023-05-02 10:32:11.773867	1584	22	\N	7	7	\N	\N	\N	\N	\N	1571	-1	\N	\N	-1
t	2023-05-02 10:32:11.798907	\N	\N	2023-05-02 10:32:11.783301	1585	22	\N	7	7	85	\N	\N	\N	\N	1584	-1	\N	\N	-1
t	2023-05-02 10:32:11.80781	\N	\N	2023-05-02 10:32:11.799488	1586	24	\N	7	7	\N	\N	\N	6	\N	1584	-1	\N	\N	-1
t	2023-05-02 10:32:11.818222	\N	\N	2023-05-02 10:32:11.808495	1587	\N	\N	7	7	\N	\N	\N	6	\N	1586	-1	\N	\N	-1
t	2023-05-02 10:32:11.82683	\N	\N	2023-05-02 10:32:11.818783	1588	\N	\N	7	7	\N	\N	\N	6	\N	1587	-1	\N	\N	-1
t	2023-05-02 10:32:11.844242	\N	\N	2023-05-02 10:32:11.8361	1590	22	\N	7	7	\N	32	\N	5	\N	1589	-1	\N	\N	-1
t	2023-05-02 10:32:11.869994	\N	\N	2023-05-02 10:32:11.853545	1592	22	\N	7	7	86	\N	13	4	\N	1591	-1	\N	\N	-1
t	2023-05-02 10:32:11.886059	\N	\N	2023-05-02 10:32:11.870594	1593	25	\N	7	7	27	\N	16	4	\N	1587	-1	\N	\N	-1
t	2023-05-02 10:32:11.900909	\N	\N	2023-05-02 10:32:11.886636	1594	22	\N	7	7	\N	\N	\N	6	\N	1586	-1	\N	\N	-1
t	2023-05-02 10:32:11.920937	\N	\N	2023-05-02 10:32:11.901526	1595	22	\N	7	7	27	\N	16	4	\N	1594	-1	\N	\N	-1
t	2023-05-02 10:32:11.948959	\N	\N	2023-05-02 10:32:11.932046	1597	22	\N	7	7	86	\N	13	4	\N	1596	-1	\N	\N	-1
t	2023-05-02 10:32:11.966093	\N	\N	2023-05-02 10:32:11.949586	1598	22	\N	7	7	28	\N	16	4	\N	1594	-1	\N	\N	-1
t	2023-05-02 10:32:11.977015	\N	\N	2023-05-02 10:32:11.966747	1599	22	\N	7	7	\N	\N	\N	6	\N	1586	-1	\N	\N	-1
t	2023-05-02 10:32:11.997795	\N	\N	2023-05-02 10:32:11.987308	1601	22	\N	7	7	\N	32	\N	5	\N	1600	-1	\N	\N	-1
t	2023-05-02 10:32:12.014254	\N	\N	2023-05-02 10:32:11.998426	1602	25	\N	7	7	27	\N	16	4	\N	1570	-1	\N	\N	-1
f	2023-04-11 14:08:25.172922	\N	2023-05-02 11:50:53.28529	2023-04-11 14:08:25.168279	826	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:00:50.219831	\N	2023-05-02 12:42:26.146013	2023-05-02 12:00:50.214757	1616	\N	\N	11	11	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:00:50.236364	\N	2023-05-02 12:42:26.17333	2023-05-02 12:00:50.220484	1617	25	\N	11	11	\N	\N	\N	6	\N	1616	-1	\N	-1	-1
f	2023-05-02 12:00:50.252637	\N	2023-05-02 12:42:26.187531	2023-05-02 12:00:50.236932	1618	22	\N	11	11	31	\N	19	4	\N	1617	-1	\N	-1	-1
f	2023-05-02 12:00:50.28517	\N	2023-05-02 12:42:26.203555	2023-05-02 12:00:50.253258	1619	52	\N	11	11	32	\N	12	4	\N	1617	-1	\N	-1	-1
f	2023-05-02 11:44:47.889794	\N	2023-05-02 12:44:50.579826	2023-05-02 11:44:47.883266	1603	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 11:44:47.913135	\N	2023-05-02 12:44:50.595447	2023-05-02 11:44:47.890382	1604	22	\N	10	10	29	\N	13	4	\N	1603	-1	\N	-1	-1
f	2023-05-02 11:44:47.945196	\N	2023-05-02 12:44:50.60927	2023-05-02 11:44:47.913711	1605	52	\N	10	10	30	\N	12	4	\N	1603	-1	\N	-1	-1
f	2023-04-25 14:13:11.875219	\N	2023-05-02 12:55:22.590891	2023-04-25 14:13:11.858144	1061	22	\N	29	29	76	\N	16	4	\N	1060	-1	\N	-1	-1
f	2023-05-02 12:55:22.601584	\N	2023-05-02 12:56:01.914172	2023-05-02 12:55:22.596657	1643	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:10:04.210995	\N	2023-05-02 12:57:29.106575	2023-04-10 11:10:04.201583	721	\N	\N	20	20	\N	\N	\N	\N	\N	717	-1	\N	-1	-1
f	2023-05-04 08:54:09.109257	\N	2023-05-04 08:55:00.656459	2023-05-04 08:54:09.104452	1734	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 08:54:09.126713	\N	2023-05-04 08:55:00.670502	2023-05-04 08:54:09.109854	1735	22	\N	18	18	\N	\N	\N	6	\N	1734	-1	\N	-1	-1
f	2023-05-04 08:54:09.143728	\N	2023-05-04 08:55:00.685318	2023-05-04 08:54:09.127355	1736	22	\N	18	18	67	\N	19	4	\N	1735	-1	\N	-1	-1
f	2023-05-04 08:54:09.162701	\N	2023-05-04 08:55:00.698752	2023-05-04 08:54:09.144378	1737	28	\N	18	18	90	\N	15	4	\N	1735	-1	\N	-1	-1
f	2023-05-03 15:12:58.834842	\N	2023-05-04 08:59:13.071333	2023-05-03 15:12:58.830185	1720	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:56:02.043364	\N	2023-05-04 09:11:04.414113	2023-05-02 12:56:02.034524	1660	22	\N	29	29	\N	\N	\N	\N	\N	1659	-1	\N	-1	-1
f	2023-05-02 12:56:02.053223	\N	2023-05-04 09:11:04.427945	2023-05-02 12:56:02.043926	1661	\N	\N	29	29	\N	\N	\N	6	\N	1660	-1	\N	-1	-1
f	2023-05-02 12:56:02.06198	\N	2023-05-04 09:11:04.442833	2023-05-02 12:56:02.053787	1662	22	\N	29	29	\N	\N	\N	6	\N	1661	-1	\N	-1	-1
f	2023-05-02 12:56:02.08709	\N	2023-05-04 09:11:04.456595	2023-05-02 12:56:02.062544	1663	22	\N	29	29	67	\N	19	4	\N	1662	-1	\N	-1	-1
f	2023-05-02 12:56:02.101528	\N	2023-05-04 09:11:04.501016	2023-05-02 12:56:02.096601	1665	\N	\N	29	29	\N	\N	\N	6	\N	1660	-1	\N	-1	-1
f	2023-05-02 12:56:02.106462	\N	2023-05-04 09:11:04.514546	2023-05-02 12:56:02.10181	1666	\N	\N	29	29	\N	\N	\N	6	\N	1665	-1	\N	-1	-1
f	2023-05-02 12:56:02.115037	\N	2023-05-04 09:11:04.528301	2023-05-02 12:56:02.106742	1667	22	\N	29	29	81	\N	20	4	\N	1666	-1	\N	-1	-1
f	2023-05-02 12:56:02.124834	\N	2023-05-04 09:11:04.552734	2023-05-02 12:56:02.115329	1668	23	\N	29	29	67	\N	19	4	\N	1666	-1	\N	-1	-1
f	2023-05-02 12:56:02.141977	\N	2023-05-04 09:11:04.565927	2023-05-02 12:56:02.125128	1669	22	\N	29	29	\N	\N	\N	\N	\N	1659	-1	\N	-1	-1
f	2023-05-02 12:56:02.153157	\N	2023-05-04 09:11:04.582099	2023-05-02 12:56:02.142265	1670	22	\N	29	29	77	\N	\N	\N	\N	1669	-1	\N	-1	-1
f	2023-05-02 12:56:02.158574	\N	2023-05-04 09:11:04.595636	2023-05-02 12:56:02.153444	1671	24	\N	29	29	\N	\N	\N	6	\N	1669	-1	\N	-1	-1
t	2023-05-02 10:32:11.699649	\N	\N	2023-05-02 10:32:11.693616	1575	22	\N	7	7	\N	\N	\N	9	50	1574	-1	\N	\N	-1
t	2023-05-02 10:32:11.719855	\N	\N	2023-05-02 10:32:11.712629	1577	53	\N	7	7	\N	\N	\N	9	50	1574	-1	\N	\N	-1
t	2023-05-02 10:32:11.835485	\N	\N	2023-05-02 10:32:11.827392	1589	22	\N	7	7	\N	\N	\N	9	50	1588	-1	\N	\N	-1
t	2023-05-02 10:32:11.852984	\N	\N	2023-05-02 10:32:11.844807	1591	23	\N	7	7	\N	\N	\N	9	50	1588	-1	\N	\N	-1
t	2023-05-02 10:32:11.743303	\N	\N	2023-05-02 10:32:11.73454	1580	22	\N	7	7	\N	\N	\N	9	63	1579	-1	\N	\N	-1
t	2023-05-02 10:32:11.931394	\N	\N	2023-05-02 10:32:11.921569	1596	23	\N	7	7	\N	\N	\N	9	63	1594	-1	\N	\N	-1
t	2023-05-02 10:32:11.986556	\N	\N	2023-05-02 10:32:11.977625	1600	22	\N	7	7	\N	\N	\N	9	63	1599	-1	\N	\N	-1
t	2023-05-02 10:32:11.666962	\N	\N	2023-05-02 10:32:11.656698	1570	22	\N	7	7	\N	\N	\N	9	49	1569	-1	\N	\N	-1
f	2023-04-10 12:58:43.202858	\N	2023-04-11 13:51:56.240223	2023-04-10 12:58:43.194655	814	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 12:58:43.213096	\N	2023-04-11 13:51:56.315122	2023-04-10 12:58:43.203481	815	\N	\N	27	27	\N	\N	\N	6	\N	814	-1	\N	-1	-1
f	2023-04-10 12:58:43.223145	\N	2023-04-11 13:51:56.332214	2023-04-10 12:58:43.213685	816	\N	\N	27	27	\N	\N	\N	\N	\N	815	-1	\N	-1	-1
f	2023-04-10 12:58:43.239626	\N	2023-04-11 13:51:56.345788	2023-04-10 12:58:43.223795	817	51	\N	27	27	63	\N	16	4	\N	815	-1	\N	-1	-1
f	2023-04-11 13:51:56.356117	\N	2023-04-11 14:07:22.36153	2023-04-11 13:51:56.351266	818	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-11 13:51:56.457723	\N	2023-04-11 14:07:22.370337	2023-04-11 13:51:56.356705	819	\N	\N	27	27	\N	\N	\N	6	\N	818	-1	\N	-1	-1
f	2023-04-11 13:51:56.47175	\N	2023-04-11 14:07:22.379208	2023-04-11 13:51:56.45834	820	\N	\N	27	27	\N	\N	\N	\N	\N	819	-1	\N	-1	-1
f	2023-04-11 13:51:56.48942	\N	2023-04-11 14:07:22.387548	2023-04-11 13:51:56.472383	821	51	\N	27	27	63	\N	16	4	\N	819	-1	\N	-1	-1
f	2023-04-10 12:25:37.937726	\N	2023-04-11 15:05:07.305651	2023-04-10 12:25:37.929602	789	24	\N	16	16	\N	\N	\N	6	\N	788	-1	\N	-1	-1
f	2023-04-11 15:05:07.342774	\N	2023-04-13 11:51:57.443947	2023-04-11 15:05:07.340322	832	\N	\N	16	16	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-11 15:05:07.360734	\N	2023-04-13 11:51:57.454382	2023-04-11 15:05:07.34308	833	22	\N	16	16	\N	\N	\N	6	\N	832	-1	\N	-1	-1
f	2023-04-11 15:05:07.370374	\N	2023-04-13 11:51:57.461876	2023-04-11 15:05:07.361112	834	22	\N	16	16	47	\N	20	4	\N	833	-1	\N	-1	-1
f	2023-04-11 15:05:07.380436	\N	2023-04-13 11:51:57.469136	2023-04-11 15:05:07.370737	835	53	\N	16	16	62	\N	16	4	\N	833	-1	\N	-1	-1
f	2023-04-10 11:19:20.639033	\N	2023-04-13 15:00:49.807007	2023-04-10 11:19:20.629022	732	\N	\N	22	22	\N	\N	\N	6	\N	731	-1	\N	-1	-1
f	2023-04-10 11:28:24.580529	\N	2023-04-13 15:30:39.800452	2023-04-10 11:28:24.575725	738	\N	\N	23	23	\N	\N	\N	6	\N	737	-1	\N	-1	-1
f	2023-04-13 15:30:39.88088	\N	2023-04-13 15:32:03.427898	2023-04-13 15:30:39.873455	842	\N	\N	23	23	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-13 15:30:39.894553	\N	2023-04-13 15:32:03.436257	2023-04-13 15:30:39.881316	843	\N	\N	23	23	\N	\N	\N	6	\N	842	-1	\N	-1	-1
f	2023-04-13 15:30:39.904101	\N	2023-04-13 15:32:03.443652	2023-04-13 15:30:39.895218	844	\N	\N	23	23	\N	\N	\N	6	\N	843	-1	\N	-1	-1
f	2023-04-13 15:30:39.913087	\N	2023-04-13 15:32:03.450905	2023-04-13 15:30:39.904676	845	\N	\N	23	23	\N	\N	\N	6	\N	844	-1	\N	-1	-1
f	2023-04-13 15:30:39.937653	\N	2023-04-13 15:32:03.4584	2023-04-13 15:30:39.913694	846	22	\N	23	23	70	\N	14	4	\N	845	-1	\N	-1	-1
f	2023-04-13 15:30:39.945648	\N	2023-04-13 15:32:03.466265	2023-04-13 15:30:39.938116	847	52	\N	23	23	\N	\N	\N	\N	\N	845	-1	\N	-1	-1
f	2023-04-13 15:30:39.95374	\N	2023-04-13 15:32:03.473442	2023-04-13 15:30:39.946058	848	52	\N	23	23	\N	\N	\N	\N	\N	844	-1	\N	-1	-1
f	2023-04-13 15:30:39.962262	\N	2023-04-13 15:32:03.480584	2023-04-13 15:30:39.954359	849	\N	\N	23	23	\N	\N	\N	\N	\N	843	-1	\N	-1	-1
f	2023-04-17 10:34:52.892686	\N	2023-04-17 10:48:08.186233	2023-04-17 10:34:52.884229	858	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-17 10:34:52.97784	\N	2023-04-17 10:48:08.238352	2023-04-17 10:34:52.893386	859	\N	\N	28	28	\N	\N	\N	6	\N	858	-1	\N	-1	-1
f	2023-04-17 10:34:52.986755	\N	2023-04-17 10:48:08.396943	2023-04-17 10:34:52.97823	860	22	\N	28	28	\N	\N	\N	7	\N	859	-1	\N	-1	-1
f	2023-04-17 10:34:52.991568	\N	2023-04-17 10:48:08.453449	2023-04-17 10:34:52.987072	861	22	\N	28	28	\N	\N	\N	\N	\N	860	-1	\N	-1	-1
f	2023-04-17 10:34:52.996182	\N	2023-04-17 10:48:08.470878	2023-04-17 10:34:52.991857	862	22	\N	28	28	\N	\N	\N	6	\N	861	-1	\N	-1	-1
f	2023-04-17 10:34:53.000639	\N	2023-04-17 10:48:08.487311	2023-04-17 10:34:52.996476	863	\N	\N	28	28	\N	\N	\N	6	\N	862	-1	\N	-1	-1
f	2023-04-17 10:34:53.008877	\N	2023-04-17 10:48:08.501198	2023-04-17 10:34:53.000935	864	22	\N	28	28	68	\N	19	4	\N	863	-1	\N	-1	-1
f	2023-04-17 10:34:53.01734	\N	2023-04-17 10:48:08.527716	2023-04-17 10:34:53.009181	865	26	\N	28	28	71	\N	16	4	\N	863	-1	\N	-1	-1
f	2023-04-17 10:34:53.024163	\N	2023-04-17 10:48:08.541397	2023-04-17 10:34:53.017741	866	30	\N	28	28	\N	\N	\N	6	\N	862	-1	\N	-1	-1
f	2023-04-17 10:34:53.032354	\N	2023-04-17 10:48:08.556802	2023-04-17 10:34:53.024455	867	22	\N	28	28	68	\N	19	4	\N	866	-1	\N	-1	-1
f	2023-04-17 10:34:53.039003	\N	2023-04-17 10:48:08.570755	2023-04-17 10:34:53.032697	868	29	\N	28	28	72	\N	16	4	\N	866	-1	\N	-1	-1
f	2023-04-17 10:34:53.043916	\N	2023-04-17 10:48:08.585605	2023-04-17 10:34:53.039324	869	24	\N	28	28	\N	\N	\N	\N	\N	861	-1	\N	-1	-1
f	2023-04-17 10:34:53.048782	\N	2023-04-17 10:48:08.599185	2023-04-17 10:34:53.044242	870	22	\N	28	28	\N	\N	\N	\N	\N	860	-1	\N	-1	-1
f	2023-04-17 10:34:53.151943	\N	2023-04-17 10:48:08.612761	2023-04-17 10:34:53.049063	871	22	\N	28	28	73	\N	\N	\N	\N	870	-1	\N	-1	-1
f	2023-04-17 10:34:53.215156	\N	2023-04-17 10:48:08.627205	2023-04-17 10:34:53.154571	872	24	\N	28	28	\N	\N	\N	\N	\N	870	-1	\N	-1	-1
f	2023-04-17 10:34:53.22516	\N	2023-04-17 10:48:08.640884	2023-04-17 10:34:53.215859	873	\N	\N	28	28	\N	\N	\N	\N	\N	858	-1	\N	-1	-1
f	2023-04-17 10:48:08.654514	\N	2023-04-17 15:26:04.286599	2023-04-17 10:48:08.649296	874	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-17 10:48:08.670967	\N	2023-04-17 15:26:04.307922	2023-04-17 10:48:08.655108	875	\N	\N	28	28	\N	\N	\N	6	\N	874	-1	\N	-1	-1
f	2023-04-17 10:48:08.683039	\N	2023-04-17 15:26:04.323211	2023-04-17 10:48:08.671525	876	22	\N	28	28	\N	\N	\N	7	\N	875	-1	\N	-1	-1
f	2023-04-17 10:48:08.692656	\N	2023-04-17 15:26:04.339112	2023-04-17 10:48:08.683603	877	22	\N	28	28	\N	\N	\N	\N	\N	876	-1	\N	-1	-1
f	2023-04-17 13:56:04.801491	\N	2023-04-18 12:56:25.525899	2023-04-17 13:56:04.695628	899	22	\N	29	29	77	\N	\N	\N	\N	898	-1	\N	-1	-1
f	2023-04-17 13:56:04.832586	\N	2023-04-18 12:56:25.54079	2023-04-17 13:56:04.80216	900	24	\N	29	29	\N	\N	\N	\N	\N	898	-1	\N	-1	-1
f	2023-04-11 14:08:25.191426	\N	2023-05-02 11:50:53.30054	2023-04-11 14:08:25.173499	827	\N	\N	26	26	\N	\N	\N	6	\N	826	-1	\N	-1	-1
f	2023-04-11 14:08:25.207009	\N	2023-05-02 11:50:53.313944	2023-04-11 14:08:25.191983	828	\N	\N	26	26	\N	\N	\N	\N	\N	827	-1	\N	-1	-1
f	2023-04-11 14:08:25.219432	\N	2023-05-02 11:50:53.329458	2023-04-11 14:08:25.207593	829	24	\N	26	26	\N	\N	\N	6	\N	827	-1	\N	-1	-1
f	2023-04-11 14:08:25.240343	\N	2023-05-02 11:50:53.344947	2023-04-11 14:08:25.220205	830	22	\N	26	26	59	\N	16	4	\N	829	-1	\N	-1	-1
f	2023-04-11 14:08:25.259233	\N	2023-05-02 11:50:53.358228	2023-04-11 14:08:25.24094	831	53	\N	26	26	61	\N	16	4	\N	829	-1	\N	-1	-1
f	2023-04-11 14:07:22.393347	\N	2023-05-02 12:44:24.024251	2023-04-11 14:07:22.390918	822	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-11 14:07:22.402254	\N	2023-05-02 12:44:24.038827	2023-04-11 14:07:22.393661	823	\N	\N	27	27	\N	\N	\N	6	\N	822	-1	\N	-1	-1
f	2023-04-11 14:07:22.407195	\N	2023-05-02 12:44:24.052825	2023-04-11 14:07:22.402546	824	\N	\N	27	27	\N	\N	\N	\N	\N	823	-1	\N	-1	-1
f	2023-04-11 14:07:22.415949	\N	2023-05-02 12:44:24.067722	2023-04-11 14:07:22.407478	825	53	\N	27	27	63	\N	16	4	\N	823	-1	\N	-1	-1
f	2023-04-13 15:00:49.87567	\N	2023-05-02 13:28:44.93055	2023-04-13 15:00:49.871139	836	\N	\N	22	22	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-13 15:00:49.892456	\N	2023-05-02 13:28:44.953212	2023-04-13 15:00:49.876341	837	\N	\N	22	22	\N	\N	\N	6	\N	836	-1	\N	-1	-1
f	2023-04-13 15:00:49.902798	\N	2023-05-02 13:28:45.003964	2023-04-13 15:00:49.893014	838	\N	\N	22	22	\N	\N	\N	\N	\N	837	-1	\N	-1	-1
f	2023-04-13 15:00:49.911697	\N	2023-05-02 13:28:45.097297	2023-04-13 15:00:49.903356	839	\N	\N	22	22	\N	\N	\N	6	\N	837	-1	\N	-1	-1
f	2023-04-13 15:00:49.92848	\N	2023-05-02 13:28:45.122136	2023-04-13 15:00:49.912313	840	22	\N	22	22	68	\N	19	4	\N	839	-1	\N	-1	-1
f	2023-04-13 15:00:49.938524	\N	2023-05-02 13:28:45.148214	2023-04-13 15:00:49.929065	841	\N	\N	22	22	\N	\N	\N	\N	\N	839	-1	\N	-1	-1
f	2023-04-13 15:32:03.485871	\N	2023-05-04 09:18:58.918874	2023-04-13 15:32:03.483489	850	\N	\N	23	23	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-13 15:32:03.494511	\N	2023-05-04 09:18:58.927249	2023-04-13 15:32:03.486173	851	\N	\N	23	23	\N	\N	\N	6	\N	850	-1	\N	-1	-1
f	2023-04-13 15:32:03.49935	\N	2023-05-04 09:18:58.934152	2023-04-13 15:32:03.494841	852	\N	\N	23	23	\N	\N	\N	6	\N	851	-1	\N	-1	-1
f	2023-04-13 15:32:03.503858	\N	2023-05-04 09:18:58.942223	2023-04-13 15:32:03.499642	853	\N	\N	23	23	\N	\N	\N	6	\N	852	-1	\N	-1	-1
f	2023-04-13 15:32:03.511863	\N	2023-05-04 09:18:58.949127	2023-04-13 15:32:03.504181	854	22	\N	23	23	70	\N	14	4	\N	853	-1	\N	-1	-1
f	2023-04-13 15:32:03.52336	\N	2023-05-04 09:18:58.955812	2023-04-13 15:32:03.512225	855	52	\N	23	23	\N	\N	\N	\N	\N	853	-1	\N	-1	-1
f	2023-04-13 15:32:03.528338	\N	2023-05-04 09:18:58.969818	2023-04-13 15:32:03.523734	856	52	\N	23	23	\N	\N	\N	\N	\N	852	-1	\N	-1	-1
f	2023-04-13 15:32:03.532999	\N	2023-05-04 09:18:58.976772	2023-04-13 15:32:03.528644	857	\N	\N	23	23	\N	\N	\N	\N	\N	851	-1	\N	-1	-1
f	2023-04-17 10:48:08.702086	\N	2023-04-17 15:26:04.35643	2023-04-17 10:48:08.693263	878	22	\N	28	28	\N	\N	\N	6	\N	877	-1	\N	-1	-1
f	2023-04-17 10:48:08.719637	\N	2023-04-17 15:26:04.373786	2023-04-17 10:48:08.70264	879	\N	\N	28	28	\N	\N	\N	6	\N	878	-1	\N	-1	-1
f	2023-04-17 10:48:08.737125	\N	2023-04-17 15:26:04.388675	2023-04-17 10:48:08.720311	880	22	\N	28	28	68	\N	19	4	\N	879	-1	\N	-1	-1
f	2023-04-17 10:48:08.754827	\N	2023-04-17 15:26:04.407817	2023-04-17 10:48:08.737731	881	28	\N	28	28	74	\N	20	4	\N	879	-1	\N	-1	-1
f	2023-04-17 10:48:08.76442	\N	2023-04-17 15:26:04.422258	2023-04-17 10:48:08.755395	882	30	\N	28	28	\N	\N	\N	6	\N	878	-1	\N	-1	-1
f	2023-04-17 10:48:08.792075	\N	2023-04-17 15:26:04.441642	2023-04-17 10:48:08.764977	883	22	\N	28	28	68	\N	19	4	\N	882	-1	\N	-1	-1
f	2023-04-17 10:48:08.809314	\N	2023-04-17 15:26:04.460526	2023-04-17 10:48:08.792665	884	29	\N	28	28	75	\N	16	4	\N	882	-1	\N	-1	-1
f	2023-04-17 10:48:08.818773	\N	2023-04-17 15:26:04.476957	2023-04-17 10:48:08.809886	885	\N	\N	28	28	\N	\N	\N	6	\N	877	-1	\N	-1	-1
f	2023-04-17 10:48:08.835298	\N	2023-04-17 15:26:04.491721	2023-04-17 10:48:08.819346	886	22	\N	28	28	68	\N	19	4	\N	885	-1	\N	-1	-1
f	2023-04-17 10:48:08.845461	\N	2023-04-17 15:26:04.506126	2023-04-17 10:48:08.83611	887	22	\N	28	28	\N	\N	\N	\N	\N	876	-1	\N	-1	-1
f	2023-04-17 10:48:08.866803	\N	2023-04-17 15:26:04.521196	2023-04-17 10:48:08.846019	888	22	\N	28	28	73	\N	\N	\N	\N	887	-1	\N	-1	-1
f	2023-04-17 10:48:08.877975	\N	2023-04-17 15:26:04.537107	2023-04-17 10:48:08.86747	889	24	\N	28	28	\N	\N	\N	6	\N	887	-1	\N	-1	-1
f	2023-04-17 10:48:08.887066	\N	2023-04-17 15:26:04.551451	2023-04-17 10:48:08.87853	890	\N	\N	28	28	\N	\N	\N	\N	\N	889	-1	\N	-1	-1
f	2023-04-17 10:48:08.897384	\N	2023-04-17 15:26:04.569741	2023-04-17 10:48:08.887922	891	\N	\N	28	28	\N	\N	\N	\N	\N	874	-1	\N	-1	-1
f	2023-04-18 12:45:42.496128	\N	2023-04-18 12:49:18.295597	2023-04-18 12:45:42.485076	919	\N	\N	30	30	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 12:45:42.517096	\N	2023-04-18 12:49:18.390365	2023-04-18 12:45:42.496768	920	22	\N	30	30	\N	\N	\N	7	\N	919	-1	\N	-1	-1
f	2023-04-18 12:45:42.526089	\N	2023-04-18 12:49:18.419577	2023-04-18 12:45:42.517728	921	22	\N	30	30	\N	\N	\N	\N	\N	920	-1	\N	-1	-1
f	2023-04-18 12:45:42.535101	\N	2023-04-18 12:49:18.445146	2023-04-18 12:45:42.526675	922	\N	\N	30	30	\N	\N	\N	6	\N	921	-1	\N	-1	-1
f	2023-04-18 12:45:42.552153	\N	2023-04-18 12:49:18.489297	2023-04-18 12:45:42.535669	923	22	\N	30	30	67	\N	19	4	\N	922	-1	\N	-1	-1
f	2023-04-18 12:45:42.56242	\N	2023-04-18 12:49:18.515239	2023-04-18 12:45:42.552729	924	\N	\N	30	30	\N	\N	\N	\N	\N	922	-1	\N	-1	-1
f	2023-04-18 12:45:42.571087	\N	2023-04-18 12:49:18.540207	2023-04-18 12:45:42.562987	925	\N	\N	30	30	\N	\N	\N	\N	\N	921	-1	\N	-1	-1
f	2023-04-18 12:45:42.5797	\N	2023-04-18 12:49:18.572015	2023-04-18 12:45:42.571653	926	22	\N	30	30	\N	\N	\N	\N	\N	920	-1	\N	-1	-1
f	2023-04-18 12:45:42.695318	\N	2023-04-18 12:49:18.597974	2023-04-18 12:45:42.580334	927	22	\N	30	30	78	\N	\N	\N	\N	926	-1	\N	-1	-1
f	2023-04-18 12:45:42.7183	\N	2023-04-18 12:49:18.627807	2023-04-18 12:45:42.695944	928	24	\N	30	30	\N	\N	\N	\N	\N	926	-1	\N	-1	-1
f	2023-04-17 13:56:04.6279	\N	2023-04-18 12:56:25.548525	2023-04-17 13:56:04.591109	892	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-17 13:56:04.63781	\N	2023-04-18 12:56:25.558505	2023-04-17 13:56:04.628644	893	22	\N	29	29	\N	\N	\N	7	\N	892	-1	\N	-1	-1
f	2023-04-17 13:56:04.647424	\N	2023-04-18 12:56:25.566156	2023-04-17 13:56:04.638365	894	22	\N	29	29	\N	\N	\N	\N	\N	893	-1	\N	-1	-1
f	2023-04-17 13:56:04.659515	\N	2023-04-18 12:56:25.577501	2023-04-17 13:56:04.64798	895	\N	\N	29	29	\N	\N	\N	6	\N	894	-1	\N	-1	-1
f	2023-04-17 13:56:04.676815	\N	2023-04-18 12:56:25.586536	2023-04-17 13:56:04.66035	896	22	\N	29	29	67	\N	19	4	\N	895	-1	\N	-1	-1
f	2023-04-17 13:56:04.686305	\N	2023-04-18 12:56:25.596786	2023-04-17 13:56:04.677521	897	24	\N	29	29	\N	\N	\N	\N	\N	894	-1	\N	-1	-1
f	2023-04-17 13:56:04.69507	\N	2023-04-18 12:56:25.606697	2023-04-17 13:56:04.686862	898	22	\N	29	29	\N	\N	\N	\N	\N	893	-1	\N	-1	-1
f	2023-04-18 12:49:18.726914	\N	2023-04-18 12:57:45.645711	2023-04-18 12:49:18.722606	929	\N	\N	30	30	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 12:49:18.743887	\N	2023-04-18 12:57:45.682466	2023-04-18 12:49:18.72749	930	22	\N	30	30	\N	\N	\N	7	\N	929	-1	\N	-1	-1
f	2023-04-18 12:49:18.754111	\N	2023-04-18 12:57:45.697473	2023-04-18 12:49:18.744575	931	22	\N	30	30	\N	\N	\N	\N	\N	930	-1	\N	-1	-1
f	2023-04-18 12:49:18.766026	\N	2023-04-18 12:57:45.710891	2023-04-18 12:49:18.754673	932	\N	\N	30	30	\N	\N	\N	6	\N	931	-1	\N	-1	-1
f	2023-04-18 12:49:18.786316	\N	2023-04-18 12:57:45.72695	2023-04-18 12:49:18.766656	933	22	\N	30	30	67	\N	19	4	\N	932	-1	\N	-1	-1
f	2023-04-18 12:49:18.801966	\N	2023-04-18 12:57:45.740507	2023-04-18 12:49:18.786987	934	27	\N	30	30	79	\N	16	4	\N	932	-1	\N	-1	-1
f	2023-04-18 12:49:18.814208	\N	2023-04-18 12:57:45.754083	2023-04-18 12:49:18.802553	935	\N	\N	30	30	\N	\N	\N	\N	\N	931	-1	\N	-1	-1
f	2023-04-18 12:49:18.824154	\N	2023-04-18 12:57:45.781477	2023-04-18 12:49:18.814907	936	22	\N	30	30	\N	\N	\N	\N	\N	930	-1	\N	-1	-1
f	2023-04-18 12:49:18.853117	\N	2023-04-18 12:57:45.795199	2023-04-18 12:49:18.824778	937	22	\N	30	30	78	\N	\N	\N	\N	936	-1	\N	-1	-1
f	2023-04-18 12:49:18.864637	\N	2023-04-18 12:57:45.810198	2023-04-18 12:49:18.853803	938	24	\N	30	30	\N	\N	\N	\N	\N	936	-1	\N	-1	-1
f	2023-04-18 12:56:25.615097	\N	2023-04-18 13:03:11.14583	2023-04-18 12:56:25.612277	939	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 12:56:25.623832	\N	2023-04-18 13:03:11.184529	2023-04-18 12:56:25.615413	940	22	\N	29	29	\N	\N	\N	7	\N	939	-1	\N	-1	-1
f	2023-04-18 12:56:25.628727	\N	2023-04-18 13:03:11.200445	2023-04-18 12:56:25.624214	941	22	\N	29	29	\N	\N	\N	\N	\N	940	-1	\N	-1	-1
f	2023-04-18 12:56:25.633401	\N	2023-04-18 13:03:11.215258	2023-04-18 12:56:25.629021	942	\N	\N	29	29	\N	\N	\N	6	\N	941	-1	\N	-1	-1
f	2023-04-18 12:56:25.642099	\N	2023-04-18 13:03:11.23266	2023-04-18 12:56:25.633722	943	22	\N	29	29	67	\N	19	4	\N	942	-1	\N	-1	-1
f	2023-04-18 12:56:25.658642	\N	2023-04-18 13:03:11.247592	2023-04-18 12:56:25.642439	944	24	\N	29	29	\N	\N	\N	6	\N	941	-1	\N	-1	-1
f	2023-04-18 12:56:25.663587	\N	2023-04-18 13:03:11.263706	2023-04-18 12:56:25.659026	945	\N	\N	29	29	\N	\N	\N	\N	\N	944	-1	\N	-1	-1
f	2023-04-18 12:56:25.668126	\N	2023-04-18 13:03:11.278307	2023-04-18 12:56:25.663893	946	22	\N	29	29	\N	\N	\N	\N	\N	940	-1	\N	-1	-1
f	2023-04-18 12:56:25.683344	\N	2023-04-18 13:03:11.310353	2023-04-18 12:56:25.678488	948	24	\N	29	29	\N	\N	\N	\N	\N	946	-1	\N	-1	-1
f	2023-04-18 12:57:45.850452	\N	2023-05-02 12:56:09.869943	2023-04-18 12:57:45.834376	950	22	\N	30	30	\N	\N	\N	7	\N	949	-1	\N	-1	-1
f	2023-04-18 12:57:45.861437	\N	2023-05-02 12:56:09.885148	2023-04-18 12:57:45.851025	951	22	\N	30	30	\N	\N	\N	\N	\N	950	-1	\N	-1	-1
f	2023-04-18 12:57:45.871089	\N	2023-05-02 12:56:09.898465	2023-04-18 12:57:45.862006	952	\N	\N	30	30	\N	\N	\N	6	\N	951	-1	\N	-1	-1
f	2023-04-18 12:57:45.90153	\N	2023-05-02 12:56:09.912684	2023-04-18 12:57:45.871666	953	22	\N	30	30	67	\N	19	4	\N	952	-1	\N	-1	-1
f	2023-04-18 12:57:45.915686	\N	2023-05-02 12:56:09.925943	2023-04-18 12:57:45.902213	954	\N	\N	30	30	\N	\N	\N	\N	\N	952	-1	\N	-1	-1
f	2023-04-18 12:57:45.933133	\N	2023-05-02 12:56:09.9391	2023-04-18 12:57:45.916411	955	\N	\N	30	30	\N	\N	\N	\N	\N	951	-1	\N	-1	-1
f	2023-04-18 12:57:45.942386	\N	2023-05-02 12:56:09.95682	2023-04-18 12:57:45.933804	956	22	\N	30	30	\N	\N	\N	\N	\N	950	-1	\N	-1	-1
f	2023-04-18 12:57:45.960909	\N	2023-05-02 12:56:09.970946	2023-04-18 12:57:45.942959	957	22	\N	30	30	78	\N	\N	\N	\N	956	-1	\N	-1	-1
f	2023-04-18 12:57:45.988427	\N	2023-05-02 12:56:09.984396	2023-04-18 12:57:45.961541	958	24	\N	30	30	\N	\N	\N	\N	\N	956	-1	\N	-1	-1
f	2023-04-17 15:26:04.580657	\N	2023-05-04 09:00:30.549106	2023-04-17 15:26:04.575597	901	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-17 15:26:04.620151	\N	2023-05-04 09:00:30.579336	2023-04-17 15:26:04.609173	903	22	\N	28	28	\N	\N	\N	7	\N	902	-1	\N	-1	-1
f	2023-04-17 15:26:04.630247	\N	2023-05-04 09:00:30.594064	2023-04-17 15:26:04.620774	904	22	\N	28	28	\N	\N	\N	\N	\N	903	-1	\N	-1	-1
f	2023-04-17 15:26:04.639699	\N	2023-05-04 09:00:30.607698	2023-04-17 15:26:04.630809	905	22	\N	28	28	\N	\N	\N	6	\N	904	-1	\N	-1	-1
f	2023-04-17 15:26:04.649881	\N	2023-05-04 09:00:30.625429	2023-04-17 15:26:04.64041	906	\N	\N	28	28	\N	\N	\N	6	\N	905	-1	\N	-1	-1
f	2023-04-17 15:26:04.674358	\N	2023-05-04 09:00:30.639262	2023-04-17 15:26:04.650509	907	22	\N	28	28	68	\N	19	4	\N	906	-1	\N	-1	-1
f	2023-04-17 15:26:04.705666	\N	2023-05-04 09:00:30.670115	2023-04-17 15:26:04.69412	909	30	\N	28	28	\N	\N	\N	6	\N	905	-1	\N	-1	-1
f	2023-04-17 15:26:04.724731	\N	2023-05-04 09:00:30.688948	2023-04-17 15:26:04.706803	910	22	\N	28	28	68	\N	19	4	\N	909	-1	\N	-1	-1
f	2023-04-17 15:26:04.754965	\N	2023-05-04 09:00:30.703211	2023-04-17 15:26:04.725307	911	29	\N	28	28	75	\N	16	4	\N	909	-1	\N	-1	-1
f	2023-04-17 15:26:04.79316	\N	2023-05-04 09:00:30.717214	2023-04-17 15:26:04.755636	912	\N	\N	28	28	\N	\N	\N	6	\N	904	-1	\N	-1	-1
f	2023-04-17 15:26:04.825057	\N	2023-05-04 09:00:30.732169	2023-04-17 15:26:04.793786	913	22	\N	28	28	68	\N	19	4	\N	912	-1	\N	-1	-1
f	2023-04-17 15:26:04.841553	\N	2023-05-04 09:00:30.745531	2023-04-17 15:26:04.825765	914	22	\N	28	28	\N	\N	\N	\N	\N	903	-1	\N	-1	-1
f	2023-04-17 15:26:04.880104	\N	2023-05-04 09:00:30.77815	2023-04-17 15:26:04.871316	916	24	\N	28	28	\N	\N	\N	6	\N	914	-1	\N	-1	-1
f	2023-04-17 15:26:04.889145	\N	2023-05-04 09:00:30.792408	2023-04-17 15:26:04.880735	917	\N	\N	28	28	\N	\N	\N	\N	\N	916	-1	\N	-1	-1
f	2023-04-17 15:26:04.898195	\N	2023-05-04 09:00:30.805944	2023-04-17 15:26:04.889724	918	\N	\N	28	28	\N	\N	\N	\N	\N	901	-1	\N	-1	-1
f	2023-04-18 12:56:25.678047	\N	2023-04-18 13:03:11.292612	2023-04-18 12:56:25.668434	947	22	\N	29	29	77	\N	\N	\N	\N	946	-1	\N	-1	-1
f	2023-04-27 21:30:57.568081	\N	2023-04-27 21:31:47.358669	2023-04-27 21:30:57.563718	1342	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:30:57.579249	\N	2023-04-27 21:31:47.368716	2023-04-27 21:30:57.568714	1343	22	\N	7	7	\N	\N	\N	9	\N	1342	-1	\N	-1	-1
f	2023-04-27 21:30:57.588518	\N	2023-04-27 21:31:47.376825	2023-04-27 21:30:57.579861	1344	22	\N	7	7	\N	\N	\N	7	\N	1343	-1	\N	-1	-1
f	2023-04-27 21:30:57.598137	\N	2023-04-27 21:31:47.38512	2023-04-27 21:30:57.589083	1345	22	\N	7	7	\N	\N	\N	\N	\N	1344	-1	\N	-1	-1
f	2023-04-27 21:30:57.606944	\N	2023-04-27 21:31:47.393194	2023-04-27 21:30:57.598704	1346	22	\N	7	7	\N	\N	\N	6	\N	1345	-1	\N	-1	-1
f	2023-04-27 21:30:57.615605	\N	2023-04-27 21:31:47.402414	2023-04-27 21:30:57.607505	1347	\N	\N	7	7	\N	\N	\N	\N	\N	1346	-1	\N	-1	-1
f	2023-04-27 21:30:57.624533	\N	2023-04-27 21:31:47.411129	2023-04-27 21:30:57.616233	1348	22	\N	7	7	\N	\N	\N	9	\N	1347	-1	\N	-1	-1
f	2023-04-27 21:30:57.640675	\N	2023-04-27 21:31:47.463318	2023-04-27 21:30:57.625113	1349	22	\N	7	7	86	\N	13	4	\N	1348	-1	\N	-1	-1
f	2023-04-27 21:30:57.650127	\N	2023-04-27 21:31:47.471498	2023-04-27 21:30:57.641264	1350	53	\N	7	7	\N	\N	\N	9	\N	1347	-1	\N	-1	-1
f	2023-04-27 21:30:57.65863	\N	2023-04-27 21:31:47.485199	2023-04-27 21:30:57.650692	1351	22	\N	7	7	\N	32	\N	5	\N	1350	-1	\N	-1	-1
f	2023-04-27 21:30:57.663418	\N	2023-04-27 21:31:47.493112	2023-04-27 21:30:57.65892	1352	24	\N	7	7	\N	\N	\N	6	\N	1345	-1	\N	-1	-1
f	2023-04-27 21:30:57.667769	\N	2023-04-27 21:31:47.50153	2023-04-27 21:30:57.663722	1353	22	\N	7	7	\N	\N	\N	9	\N	1352	-1	\N	-1	-1
f	2023-04-27 21:30:57.674201	\N	2023-04-27 21:31:47.509957	2023-04-27 21:30:57.668843	1354	22	\N	7	7	\N	32	\N	5	\N	1353	-1	\N	-1	-1
f	2023-04-27 21:30:57.678551	\N	2023-04-27 21:31:47.521095	2023-04-27 21:30:57.67449	1355	23	\N	7	7	\N	\N	\N	9	\N	1352	-1	\N	-1	-1
f	2023-04-27 21:30:57.686274	\N	2023-04-27 21:31:47.528549	2023-04-27 21:30:57.678831	1356	22	\N	7	7	86	\N	13	4	\N	1355	-1	\N	-1	-1
f	2023-04-27 21:30:57.694009	\N	2023-04-27 21:31:47.538231	2023-04-27 21:30:57.686582	1357	22	\N	7	7	\N	\N	\N	\N	\N	1344	-1	\N	-1	-1
f	2023-04-27 21:30:57.703446	\N	2023-04-27 21:31:47.548388	2023-04-27 21:30:57.694303	1358	22	\N	7	7	85	\N	\N	\N	\N	1357	-1	\N	-1	-1
f	2023-04-27 21:30:57.708038	\N	2023-04-27 21:31:47.55722	2023-04-27 21:30:57.703744	1359	24	\N	7	7	\N	\N	\N	6	\N	1357	-1	\N	-1	-1
f	2023-04-27 21:30:57.712342	\N	2023-04-27 21:31:47.567722	2023-04-27 21:30:57.708328	1360	\N	\N	7	7	\N	\N	\N	6	\N	1359	-1	\N	-1	-1
f	2023-04-27 21:30:57.717164	\N	2023-04-27 21:31:47.577598	2023-04-27 21:30:57.712629	1361	\N	\N	7	7	\N	\N	\N	6	\N	1360	-1	\N	-1	-1
f	2023-04-27 21:30:57.722987	\N	2023-04-27 21:31:47.588595	2023-04-27 21:30:57.717451	1362	22	\N	7	7	\N	\N	\N	9	64	1361	-1	\N	-1	-1
f	2023-04-27 21:30:57.727352	\N	2023-04-27 21:31:47.598141	2023-04-27 21:30:57.723268	1363	22	\N	7	7	\N	32	\N	5	\N	1362	-1	\N	-1	-1
f	2023-04-27 21:30:57.733205	\N	2023-04-27 21:31:47.613899	2023-04-27 21:30:57.727634	1364	23	\N	7	7	\N	\N	\N	9	64	1361	-1	\N	-1	-1
f	2023-04-27 21:30:57.741268	\N	2023-04-27 21:31:47.672292	2023-04-27 21:30:57.73349	1365	22	\N	7	7	86	\N	13	4	\N	1364	-1	\N	-1	-1
f	2023-04-27 21:30:57.746017	\N	2023-04-27 21:31:47.686634	2023-04-27 21:30:57.741562	1366	\N	\N	7	7	\N	\N	\N	\N	\N	1360	-1	\N	-1	-1
f	2023-04-27 21:30:57.750316	\N	2023-04-27 21:31:47.702772	2023-04-27 21:30:57.746302	1367	\N	\N	7	7	\N	\N	\N	\N	\N	1359	-1	\N	-1	-1
f	2023-04-27 21:30:57.754631	\N	2023-04-27 21:31:47.717062	2023-04-27 21:30:57.750596	1368	\N	\N	7	7	\N	\N	\N	\N	\N	1359	-1	\N	-1	-1
f	2023-04-27 21:30:57.759082	\N	2023-04-27 21:31:47.731566	2023-04-27 21:30:57.75492	1369	\N	\N	7	7	\N	\N	\N	\N	\N	1343	-1	\N	-1	-1
f	2023-04-27 21:31:47.757205	\N	2023-04-27 21:33:45.707738	2023-04-27 21:31:47.737489	1370	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:31:47.785909	\N	2023-04-27 21:33:45.715648	2023-04-27 21:31:47.757845	1371	22	\N	7	7	\N	\N	\N	9	\N	1370	-1	\N	-1	-1
f	2023-04-27 21:31:47.7918	\N	2023-04-27 21:33:45.723791	2023-04-27 21:31:47.786309	1372	22	\N	7	7	\N	\N	\N	7	\N	1371	-1	\N	-1	-1
f	2023-04-27 21:31:47.798337	\N	2023-04-27 21:33:45.737962	2023-04-27 21:31:47.792212	1373	22	\N	7	7	\N	\N	\N	\N	\N	1372	-1	\N	-1	-1
f	2023-04-27 21:31:47.803064	\N	2023-04-27 21:33:45.753233	2023-04-27 21:31:47.798681	1374	22	\N	7	7	\N	\N	\N	6	\N	1373	-1	\N	-1	-1
f	2023-04-27 21:31:47.80789	\N	2023-04-27 21:33:45.767322	2023-04-27 21:31:47.803351	1375	\N	\N	7	7	\N	\N	\N	\N	\N	1374	-1	\N	-1	-1
f	2023-04-27 21:31:47.81342	\N	2023-04-27 21:33:45.781184	2023-04-27 21:31:47.808446	1376	22	\N	7	7	\N	\N	\N	9	\N	1375	-1	\N	-1	-1
f	2023-04-27 21:31:47.82204	\N	2023-04-27 21:33:45.793686	2023-04-27 21:31:47.813707	1377	22	\N	7	7	86	\N	13	4	\N	1376	-1	\N	-1	-1
f	2023-04-27 21:31:47.826956	\N	2023-04-27 21:33:45.806969	2023-04-27 21:31:47.822345	1378	53	\N	7	7	\N	\N	\N	9	\N	1375	-1	\N	-1	-1
f	2023-04-27 21:31:47.831832	\N	2023-04-27 21:33:45.835321	2023-04-27 21:31:47.827241	1379	22	\N	7	7	\N	32	\N	5	\N	1378	-1	\N	-1	-1
f	2023-04-27 21:31:47.836766	\N	2023-04-27 21:33:45.852986	2023-04-27 21:31:47.832237	1380	24	\N	7	7	\N	\N	\N	6	\N	1373	-1	\N	-1	-1
f	2023-04-27 21:31:47.841501	\N	2023-04-27 21:33:45.868098	2023-04-27 21:31:47.837082	1381	22	\N	7	7	\N	\N	\N	9	\N	1380	-1	\N	-1	-1
f	2023-04-27 21:31:47.846564	\N	2023-04-27 21:33:45.8824	2023-04-27 21:31:47.841783	1382	22	\N	7	7	\N	32	\N	5	\N	1381	-1	\N	-1	-1
f	2023-04-27 21:31:47.851203	\N	2023-04-27 21:33:45.906121	2023-04-27 21:31:47.846961	1383	23	\N	7	7	\N	\N	\N	9	\N	1380	-1	\N	-1	-1
f	2023-04-27 21:31:47.859951	\N	2023-04-27 21:33:45.920732	2023-04-27 21:31:47.851496	1384	22	\N	7	7	86	\N	13	4	\N	1383	-1	\N	-1	-1
f	2023-04-27 21:31:47.865308	\N	2023-04-27 21:33:45.979056	2023-04-27 21:31:47.860433	1385	22	\N	7	7	\N	\N	\N	\N	\N	1372	-1	\N	-1	-1
f	2023-04-27 21:31:47.875409	\N	2023-04-27 21:33:45.991725	2023-04-27 21:31:47.865605	1386	22	\N	7	7	85	\N	\N	\N	\N	1385	-1	\N	-1	-1
f	2023-04-27 21:31:47.880511	\N	2023-04-27 21:33:46.005771	2023-04-27 21:31:47.875776	1387	24	\N	7	7	\N	\N	\N	6	\N	1385	-1	\N	-1	-1
f	2023-04-27 21:31:47.885758	\N	2023-04-27 21:33:46.018294	2023-04-27 21:31:47.880796	1388	\N	\N	7	7	\N	\N	\N	6	\N	1387	-1	\N	-1	-1
f	2023-04-27 21:31:47.890043	\N	2023-04-27 21:33:46.034321	2023-04-27 21:31:47.886045	1389	\N	\N	7	7	\N	\N	\N	6	\N	1388	-1	\N	-1	-1
f	2023-04-27 21:31:47.894682	\N	2023-04-27 21:33:46.041929	2023-04-27 21:31:47.890322	1390	22	\N	7	7	\N	\N	\N	9	\N	1389	-1	\N	-1	-1
f	2023-04-27 21:31:47.900166	\N	2023-04-27 21:33:46.049106	2023-04-27 21:31:47.895011	1391	22	\N	7	7	\N	32	\N	5	\N	1390	-1	\N	-1	-1
f	2023-04-27 21:31:47.904964	\N	2023-04-27 21:33:46.056946	2023-04-27 21:31:47.900456	1392	23	\N	7	7	\N	\N	\N	9	\N	1389	-1	\N	-1	-1
f	2023-04-27 21:31:47.913465	\N	2023-04-27 21:33:46.070994	2023-04-27 21:31:47.905266	1393	22	\N	7	7	86	\N	13	4	\N	1392	-1	\N	-1	-1
f	2023-04-27 21:31:47.921672	\N	2023-04-27 21:33:46.08592	2023-04-27 21:31:47.913766	1394	25	\N	7	7	27	\N	16	4	\N	1388	-1	\N	-1	-1
f	2023-04-27 21:31:47.926319	\N	2023-04-27 21:33:46.11156	2023-04-27 21:31:47.921978	1395	\N	\N	7	7	\N	\N	\N	\N	\N	1387	-1	\N	-1	-1
f	2023-04-27 21:31:47.930581	\N	2023-04-27 21:33:46.125696	2023-04-27 21:31:47.926598	1396	\N	\N	7	7	\N	\N	\N	\N	\N	1387	-1	\N	-1	-1
f	2023-04-27 21:31:47.934868	\N	2023-04-27 21:33:46.139388	2023-04-27 21:31:47.930872	1397	\N	\N	7	7	\N	\N	\N	\N	\N	1371	-1	\N	-1	-1
f	2023-04-27 21:33:46.152471	\N	2023-04-27 21:36:28.971747	2023-04-27 21:33:46.146737	1398	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-19 13:11:49.86071	\N	2023-05-02 11:46:16.472362	2023-01-19 13:11:49.856418	589	22	\N	11	11	31	\N	19	4	\N	588	-1	\N	-1	-1
f	2023-02-06 21:21:54.505816	\N	2023-05-02 12:49:13.820458	2023-02-06 21:21:54.501066	637	24	\N	12	12	34	\N	12	4	\N	635	-1	\N	-1	-1
f	2023-05-02 12:44:24.07969	\N	2023-05-02 12:49:45.391194	2023-05-02 12:44:24.072674	1632	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:44:24.097253	\N	2023-05-02 12:49:45.411967	2023-05-02 12:44:24.080456	1633	\N	\N	27	27	\N	\N	\N	6	\N	1632	-1	\N	-1	-1
f	2023-05-02 12:44:24.109663	\N	2023-05-02 12:49:45.419705	2023-05-02 12:44:24.097942	1634	\N	\N	27	27	\N	\N	\N	\N	\N	1633	-1	\N	-1	-1
f	2023-05-02 12:44:24.126208	\N	2023-05-02 12:49:45.427141	2023-05-02 12:44:24.110241	1635	53	\N	27	27	63	\N	16	4	\N	1633	-1	\N	-1	-1
f	2023-05-02 12:55:22.627784	\N	2023-05-02 12:56:01.955914	2023-05-02 12:55:22.618771	1645	22	\N	29	29	\N	\N	\N	\N	\N	1644	-1	\N	-1	-1
f	2023-05-02 12:55:22.636862	\N	2023-05-02 12:56:01.987144	2023-05-02 12:55:22.628382	1646	\N	\N	29	29	\N	\N	\N	6	\N	1645	-1	\N	-1	-1
f	2023-05-02 12:55:22.64772	\N	2023-05-02 12:56:02.006383	2023-05-02 12:55:22.637426	1647	22	\N	29	29	\N	\N	\N	6	\N	1646	-1	\N	-1	-1
f	2023-05-02 12:44:50.619972	\N	2023-05-02 14:40:07.199644	2023-05-02 12:44:50.61471	1636	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:44:50.647933	\N	2023-05-02 14:40:07.217213	2023-05-02 12:44:50.620695	1637	22	\N	10	10	29	\N	13	4	\N	1636	-1	\N	-1	-1
f	2023-05-02 12:49:45.432675	\N	2023-05-04 09:01:01.183416	2023-05-02 12:49:45.42998	1639	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:49:45.442787	\N	2023-05-04 09:01:01.19826	2023-05-02 12:49:45.432992	1640	\N	\N	27	27	\N	\N	\N	6	\N	1639	-1	\N	-1	-1
f	2023-05-02 12:49:45.447521	\N	2023-05-04 09:01:01.251573	2023-05-02 12:49:45.443114	1641	\N	\N	27	27	\N	\N	\N	\N	\N	1640	-1	\N	-1	-1
f	2023-05-02 12:49:45.456118	\N	2023-05-04 09:01:01.283107	2023-05-02 12:49:45.447801	1642	53	\N	27	27	63	\N	16	4	\N	1640	-1	\N	-1	-1
f	2023-04-18 13:03:11.320842	\N	2023-04-18 13:29:34.951947	2023-04-18 13:03:11.315838	959	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 13:03:11.337451	\N	2023-04-18 13:29:35.025418	2023-04-18 13:03:11.32146	960	22	\N	29	29	\N	\N	\N	7	\N	959	-1	\N	-1	-1
f	2023-04-18 13:03:11.347541	\N	2023-04-18 13:29:35.121161	2023-04-18 13:03:11.338273	961	22	\N	29	29	\N	\N	\N	\N	\N	960	-1	\N	-1	-1
f	2023-04-18 13:03:11.358199	\N	2023-04-18 13:29:35.152664	2023-04-18 13:03:11.348371	962	\N	\N	29	29	\N	\N	\N	6	\N	961	-1	\N	-1	-1
f	2023-04-18 13:03:11.375064	\N	2023-04-18 13:29:35.189133	2023-04-18 13:03:11.358803	963	22	\N	29	29	67	\N	19	4	\N	962	-1	\N	-1	-1
f	2023-04-18 13:03:11.38561	\N	2023-04-18 13:29:35.261757	2023-04-18 13:03:11.375718	964	\N	\N	29	29	\N	\N	\N	6	\N	961	-1	\N	-1	-1
f	2023-04-18 13:03:11.407324	\N	2023-04-18 13:29:35.3251	2023-04-18 13:03:11.386686	965	22	\N	29	29	81	\N	20	4	\N	964	-1	\N	-1	-1
f	2023-04-18 13:03:11.418256	\N	2023-04-18 13:29:35.379157	2023-04-18 13:03:11.408126	966	22	\N	29	29	\N	\N	\N	\N	\N	960	-1	\N	-1	-1
f	2023-04-18 13:03:11.441708	\N	2023-04-18 13:29:35.434952	2023-04-18 13:03:11.418932	967	22	\N	29	29	77	\N	\N	\N	\N	966	-1	\N	-1	-1
f	2023-04-18 13:03:11.453193	\N	2023-04-18 13:29:35.498898	2023-04-18 13:03:11.442421	968	24	\N	29	29	\N	\N	\N	\N	\N	966	-1	\N	-1	-1
f	2023-04-18 13:29:35.561145	\N	2023-04-18 13:39:52.142767	2023-04-18 13:29:35.555343	969	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 13:29:35.580349	\N	2023-04-18 13:39:52.203716	2023-04-18 13:29:35.561764	970	22	\N	29	29	\N	\N	\N	7	\N	969	-1	\N	-1	-1
f	2023-04-18 13:29:35.59145	\N	2023-04-18 13:39:52.277607	2023-04-18 13:29:35.581009	971	22	\N	29	29	\N	\N	\N	\N	\N	970	-1	\N	-1	-1
f	2023-04-18 13:29:35.603093	\N	2023-04-18 13:39:52.343779	2023-04-18 13:29:35.59213	972	\N	\N	29	29	\N	\N	\N	6	\N	971	-1	\N	-1	-1
f	2023-04-18 13:29:35.612788	\N	2023-04-18 13:39:52.401908	2023-04-18 13:29:35.60369	973	22	\N	29	29	\N	\N	\N	6	\N	972	-1	\N	-1	-1
f	2023-04-18 13:29:35.630483	\N	2023-04-18 13:39:52.470128	2023-04-18 13:29:35.613428	974	22	\N	29	29	67	\N	19	4	\N	973	-1	\N	-1	-1
f	2023-04-18 13:29:35.64715	\N	2023-04-18 13:39:52.48172	2023-04-18 13:29:35.631121	975	27	\N	29	29	81	\N	20	4	\N	973	-1	\N	-1	-1
f	2023-04-18 13:29:35.65331	\N	2023-04-18 13:39:52.551824	2023-04-18 13:29:35.647769	976	\N	\N	29	29	\N	\N	\N	\N	\N	971	-1	\N	-1	-1
f	2023-04-18 13:29:35.658509	\N	2023-04-18 13:39:52.570193	2023-04-18 13:29:35.653657	977	22	\N	29	29	\N	\N	\N	\N	\N	970	-1	\N	-1	-1
f	2023-04-18 13:29:35.672269	\N	2023-04-18 13:39:52.639999	2023-04-18 13:29:35.658881	978	22	\N	29	29	77	\N	\N	\N	\N	977	-1	\N	-1	-1
f	2023-04-18 13:29:35.67925	\N	2023-04-18 13:39:52.697477	2023-04-18 13:29:35.672869	979	24	\N	29	29	\N	\N	\N	\N	\N	977	-1	\N	-1	-1
f	2023-04-10 11:03:14.754658	\N	2023-04-18 13:50:10.826852	2023-04-10 11:03:14.743947	706	\N	\N	17	17	\N	\N	\N	\N	\N	704	-1	\N	-1	-1
f	2023-04-18 13:39:52.773179	\N	2023-04-20 11:35:20.143558	2023-04-18 13:39:52.759886	980	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 13:39:52.78855	\N	2023-04-20 11:35:20.269345	2023-04-18 13:39:52.773741	981	22	\N	29	29	\N	\N	\N	7	\N	980	-1	\N	-1	-1
f	2023-04-18 13:39:52.796467	\N	2023-04-20 11:35:20.381981	2023-04-18 13:39:52.789091	982	22	\N	29	29	\N	\N	\N	\N	\N	981	-1	\N	-1	-1
f	2023-04-18 13:39:52.803809	\N	2023-04-20 11:35:20.456854	2023-04-18 13:39:52.796957	983	\N	\N	29	29	\N	\N	\N	6	\N	982	-1	\N	-1	-1
f	2023-04-18 13:39:52.811427	\N	2023-04-20 11:35:20.476709	2023-04-18 13:39:52.80432	984	22	\N	29	29	\N	\N	\N	6	\N	983	-1	\N	-1	-1
f	2023-04-18 13:39:52.826813	\N	2023-04-20 11:35:20.495153	2023-04-18 13:39:52.811958	985	22	\N	29	29	67	\N	19	4	\N	984	-1	\N	-1	-1
f	2023-04-18 13:39:52.840528	\N	2023-04-20 11:35:20.518467	2023-04-18 13:39:52.82733	986	27	\N	29	29	81	\N	20	4	\N	984	-1	\N	-1	-1
f	2023-04-18 13:39:52.848383	\N	2023-04-20 11:35:20.532153	2023-04-18 13:39:52.841047	987	\N	\N	29	29	\N	\N	\N	6	\N	982	-1	\N	-1	-1
f	2023-04-18 13:39:52.855704	\N	2023-04-20 11:35:20.546706	2023-04-18 13:39:52.848839	988	\N	\N	29	29	\N	\N	\N	6	\N	987	-1	\N	-1	-1
f	2023-04-18 13:39:52.869485	\N	2023-04-20 11:35:20.561577	2023-04-18 13:39:52.856303	989	22	\N	29	29	81	\N	20	4	\N	988	-1	\N	-1	-1
f	2023-04-18 13:39:52.893102	\N	2023-04-20 11:35:20.574758	2023-04-18 13:39:52.870001	990	23	\N	29	29	67	\N	19	4	\N	988	-1	\N	-1	-1
f	2023-04-18 13:39:52.90158	\N	2023-04-20 11:35:20.589523	2023-04-18 13:39:52.89366	991	22	\N	29	29	\N	\N	\N	\N	\N	981	-1	\N	-1	-1
f	2023-04-18 13:39:52.918988	\N	2023-04-20 11:35:20.605005	2023-04-18 13:39:52.901927	992	22	\N	29	29	77	\N	\N	\N	\N	991	-1	\N	-1	-1
f	2023-04-18 13:39:52.932791	\N	2023-04-20 11:35:20.62074	2023-04-18 13:39:52.920328	993	24	\N	29	29	\N	\N	\N	6	\N	991	-1	\N	-1	-1
f	2023-04-18 13:39:52.961668	\N	2023-04-20 11:35:20.635315	2023-04-18 13:39:52.933402	994	22	\N	29	29	76	\N	16	4	\N	993	-1	\N	-1	-1
f	2023-04-20 11:35:20.648967	\N	2023-04-24 14:47:40.858361	2023-04-20 11:35:20.64158	1002	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-20 11:35:20.705492	\N	2023-04-24 14:47:40.940821	2023-04-20 11:35:20.654233	1003	22	\N	29	29	\N	\N	\N	7	\N	1002	-1	\N	-1	-1
f	2023-04-20 11:35:20.72389	\N	2023-04-24 14:47:40.954616	2023-04-20 11:35:20.706259	1004	22	\N	29	29	\N	\N	\N	\N	\N	1003	-1	\N	-1	-1
f	2023-04-20 11:35:20.73841	\N	2023-04-24 14:47:40.967134	2023-04-20 11:35:20.724557	1005	\N	\N	29	29	\N	\N	\N	6	\N	1004	-1	\N	-1	-1
f	2023-04-20 11:35:20.750125	\N	2023-04-24 14:47:40.980153	2023-04-20 11:35:20.73899	1006	22	\N	29	29	\N	\N	\N	6	\N	1005	-1	\N	-1	-1
f	2023-04-20 11:35:20.779366	\N	2023-04-24 14:47:40.992778	2023-04-20 11:35:20.750699	1007	22	\N	29	29	67	\N	19	4	\N	1006	-1	\N	-1	-1
f	2023-04-20 11:35:20.805502	\N	2023-04-24 14:47:41.004065	2023-04-20 11:35:20.780107	1008	27	\N	29	29	81	\N	20	4	\N	1006	-1	\N	-1	-1
f	2023-04-20 11:35:20.82641	\N	2023-04-24 14:47:41.016105	2023-04-20 11:35:20.806108	1009	\N	\N	29	29	\N	\N	\N	6	\N	1004	-1	\N	-1	-1
f	2023-04-20 11:35:20.839684	\N	2023-04-24 14:47:41.03009	2023-04-20 11:35:20.826997	1010	\N	\N	29	29	\N	\N	\N	6	\N	1009	-1	\N	-1	-1
f	2023-04-20 11:35:20.860953	\N	2023-04-24 14:47:41.042424	2023-04-20 11:35:20.840448	1011	22	\N	29	29	81	\N	20	4	\N	1010	-1	\N	-1	-1
f	2023-04-20 11:35:20.885979	\N	2023-04-24 14:47:41.055036	2023-04-20 11:35:20.861672	1012	23	\N	29	29	67	\N	19	4	\N	1010	-1	\N	-1	-1
f	2023-04-20 11:35:20.899378	\N	2023-04-24 14:47:41.067915	2023-04-20 11:35:20.886583	1013	22	\N	29	29	\N	\N	\N	\N	\N	1003	-1	\N	-1	-1
f	2023-04-20 11:35:20.92776	\N	2023-04-24 14:47:41.082726	2023-04-20 11:35:20.900078	1014	22	\N	29	29	77	\N	\N	\N	\N	1013	-1	\N	-1	-1
f	2023-04-20 11:35:20.942753	\N	2023-04-24 14:47:41.094904	2023-04-20 11:35:20.936809	1015	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-20 11:35:20.948117	\N	2023-04-24 14:47:41.106349	2023-04-20 11:35:20.928419	1016	24	\N	29	29	\N	\N	\N	6	\N	1013	-1	\N	-1	-1
f	2023-04-20 11:35:20.960749	\N	2023-04-24 14:47:41.119501	2023-04-20 11:35:20.943335	1017	22	\N	29	29	\N	\N	\N	7	\N	1015	-1	\N	-1	-1
f	2023-04-20 11:35:20.973987	\N	2023-04-24 14:47:41.131137	2023-04-20 11:35:20.961332	1018	22	\N	29	29	\N	\N	\N	\N	\N	1017	-1	\N	-1	-1
f	2023-04-20 11:35:20.991782	\N	2023-04-24 14:47:41.143116	2023-04-20 11:35:20.974627	1019	\N	\N	29	29	\N	\N	\N	6	\N	1018	-1	\N	-1	-1
f	2023-04-20 11:35:20.997489	\N	2023-04-24 14:47:41.157078	2023-04-20 11:35:20.948864	1020	22	\N	29	29	76	\N	16	4	\N	1016	-1	\N	-1	-1
f	2023-04-20 11:35:21.006279	\N	2023-04-24 14:47:41.164673	2023-04-20 11:35:20.99246	1021	22	\N	29	29	\N	\N	\N	6	\N	1019	-1	\N	-1	-1
f	2023-04-20 11:35:21.032654	\N	2023-04-24 14:47:41.171918	2023-04-20 11:35:21.006866	1022	22	\N	29	29	67	\N	19	4	\N	1021	-1	\N	-1	-1
f	2023-04-20 11:35:21.051177	\N	2023-04-24 14:47:41.179959	2023-04-20 11:35:21.033306	1023	27	\N	29	29	81	\N	20	4	\N	1021	-1	\N	-1	-1
f	2023-04-20 11:35:21.063466	\N	2023-04-24 14:47:41.188877	2023-04-20 11:35:21.051838	1024	\N	\N	29	29	\N	\N	\N	6	\N	1018	-1	\N	-1	-1
f	2023-04-20 11:35:21.073327	\N	2023-04-24 14:47:41.196177	2023-04-20 11:35:21.064144	1025	\N	\N	29	29	\N	\N	\N	6	\N	1024	-1	\N	-1	-1
f	2023-04-20 11:35:21.091853	\N	2023-04-24 14:47:41.205128	2023-04-20 11:35:21.073916	1026	22	\N	29	29	81	\N	20	4	\N	1025	-1	\N	-1	-1
f	2023-04-20 11:35:21.109621	\N	2023-04-24 14:47:41.220765	2023-04-20 11:35:21.092547	1027	23	\N	29	29	67	\N	19	4	\N	1025	-1	\N	-1	-1
f	2023-04-20 11:35:21.11971	\N	2023-04-24 14:47:41.234948	2023-04-20 11:35:21.110306	1028	22	\N	29	29	\N	\N	\N	\N	\N	1017	-1	\N	-1	-1
f	2023-04-20 11:35:21.131106	\N	2023-04-24 14:47:41.248948	2023-04-20 11:35:21.120048	1029	22	\N	29	29	77	\N	\N	\N	\N	1028	-1	\N	-1	-1
f	2023-04-20 11:35:21.144561	\N	2023-04-24 14:47:41.258415	2023-04-20 11:35:21.131439	1030	24	\N	29	29	\N	\N	\N	6	\N	1028	-1	\N	-1	-1
f	2023-04-20 11:35:21.161954	\N	2023-04-24 14:47:41.265655	2023-04-20 11:35:21.144906	1031	22	\N	29	29	76	\N	16	4	\N	1030	-1	\N	-1	-1
f	2023-04-18 13:50:10.893524	\N	2023-05-02 13:20:28.795169	2023-04-18 13:50:10.887982	995	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 13:50:10.905773	\N	2023-05-02 13:20:28.830098	2023-04-18 13:50:10.894111	996	24	\N	17	17	\N	\N	\N	6	\N	995	-1	\N	-1	-1
f	2023-04-18 13:50:10.920283	\N	2023-05-02 13:20:28.886899	2023-04-18 13:50:10.914953	998	\N	\N	17	17	\N	\N	\N	6	\N	996	-1	\N	-1	-1
f	2023-04-18 13:50:10.925082	\N	2023-05-02 13:20:28.906519	2023-04-18 13:50:10.920589	999	27	\N	17	17	\N	\N	\N	6	\N	998	-1	\N	-1	-1
f	2023-04-18 13:50:10.930451	\N	2023-05-02 13:20:28.934289	2023-04-18 13:50:10.925403	1000	22	\N	17	17	\N	29	\N	5	\N	999	-1	\N	-1	-1
f	2023-04-18 13:50:10.94204	\N	2023-05-02 13:20:28.952479	2023-04-18 13:50:10.93079	1001	53	\N	17	17	67	\N	19	4	\N	999	-1	\N	-1	-1
f	2023-04-24 14:47:41.271099	\N	2023-04-25 14:13:11.380254	2023-04-24 14:47:41.268744	1032	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-24 14:47:41.30911	\N	2023-04-25 14:13:11.412447	2023-04-24 14:47:41.271459	1033	22	\N	29	29	\N	\N	\N	7	\N	1032	-1	\N	-1	-1
f	2023-04-24 14:47:41.317412	\N	2023-04-25 14:13:11.426584	2023-04-24 14:47:41.309692	1034	22	\N	29	29	\N	\N	\N	\N	\N	1033	-1	\N	-1	-1
f	2023-04-24 14:47:41.324242	\N	2023-04-25 14:13:11.440294	2023-04-24 14:47:41.317834	1035	\N	\N	29	29	\N	\N	\N	6	\N	1034	-1	\N	-1	-1
f	2023-04-24 14:47:41.331456	\N	2023-04-25 14:13:11.455967	2023-04-24 14:47:41.324662	1036	22	\N	29	29	\N	\N	\N	6	\N	1035	-1	\N	-1	-1
f	2023-04-24 14:47:41.344722	\N	2023-04-25 14:13:11.472225	2023-04-24 14:47:41.331924	1037	22	\N	29	29	67	\N	19	4	\N	1036	-1	\N	-1	-1
f	2023-04-24 14:47:41.360124	\N	2023-04-25 14:13:11.486873	2023-04-24 14:47:41.345195	1038	27	\N	29	29	81	\N	20	4	\N	1036	-1	\N	-1	-1
f	2023-04-24 14:47:41.367685	\N	2023-04-25 14:13:11.500739	2023-04-24 14:47:41.360627	1039	\N	\N	29	29	\N	\N	\N	6	\N	1034	-1	\N	-1	-1
f	2023-04-24 14:47:41.37572	\N	2023-04-25 14:13:11.514685	2023-04-24 14:47:41.368166	1040	\N	\N	29	29	\N	\N	\N	6	\N	1039	-1	\N	-1	-1
f	2023-04-24 14:47:41.387365	\N	2023-04-25 14:13:11.52817	2023-04-24 14:47:41.376196	1041	22	\N	29	29	81	\N	20	4	\N	1040	-1	\N	-1	-1
f	2023-04-24 14:47:41.400965	\N	2023-04-25 14:13:11.541984	2023-04-24 14:47:41.387791	1042	23	\N	29	29	67	\N	19	4	\N	1040	-1	\N	-1	-1
f	2023-04-24 14:47:41.40595	\N	2023-04-25 14:13:11.555553	2023-04-24 14:47:41.401303	1043	22	\N	29	29	\N	\N	\N	\N	\N	1033	-1	\N	-1	-1
f	2023-04-24 14:47:41.436173	\N	2023-04-25 14:13:11.569756	2023-04-24 14:47:41.406234	1044	22	\N	29	29	77	\N	\N	\N	\N	1043	-1	\N	-1	-1
f	2023-04-24 14:47:41.441267	\N	2023-04-25 14:13:11.585693	2023-04-24 14:47:41.436557	1045	24	\N	29	29	\N	\N	\N	6	\N	1043	-1	\N	-1	-1
f	2023-04-24 14:47:41.449241	\N	2023-04-25 14:13:11.598886	2023-04-24 14:47:41.441552	1046	22	\N	29	29	76	\N	16	4	\N	1045	-1	\N	-1	-1
f	2023-01-19 11:09:33.064573	\N	2023-04-27 13:57:14.369677	2023-01-19 11:09:33.06284	584	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:12:00.866327	\N	2023-04-27 13:57:23.706754	2022-12-03 00:12:00.863418	100	\N	\N	5	5	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2022-12-03 00:12:00.879541	\N	2023-04-27 13:57:23.739099	2022-12-03 00:12:00.874475	102	52	\N	5	5	7	\N	15	4	\N	100	-1	\N	-1	-1
t	2023-04-27 13:57:23.751367	\N	\N	2023-04-27 13:57:23.744899	1065	\N	\N	5	5	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-27 13:57:23.784728	\N	\N	2023-04-27 13:57:23.751975	1066	22	\N	5	5	6	\N	21	4	\N	1065	-1	\N	\N	-1
t	2023-04-27 13:57:23.805898	\N	\N	2023-04-27 13:57:23.785318	1067	52	\N	5	5	7	\N	15	4	\N	1065	-1	\N	\N	-1
f	2022-12-05 11:11:01.422952	\N	2023-04-27 13:57:33.098707	2022-12-05 11:11:01.420942	390	\N	\N	6	6	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 15:49:24.124861	\N	2023-04-27 15:52:38.983119	2023-04-27 15:49:24.119748	1068	\N	\N	31	31	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 15:49:24.12997	\N	2023-04-27 15:52:38.99271	2023-04-27 15:49:24.125169	1069	\N	\N	31	31	\N	\N	\N	6	\N	1068	-1	\N	-1	-1
f	2023-04-27 15:49:24.135347	\N	2023-04-27 15:52:39.003282	2023-04-27 15:49:24.130273	1070	\N	\N	31	31	\N	\N	\N	\N	\N	1069	-1	\N	-1	-1
f	2023-04-27 15:49:24.140231	\N	2023-04-27 15:52:39.010983	2023-04-27 15:49:24.135652	1071	\N	\N	31	31	\N	\N	\N	\N	\N	1069	-1	\N	-1	-1
f	2023-04-27 19:56:43.689737	\N	2023-04-27 20:03:23.207998	2023-04-27 19:56:43.684791	1072	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 19:56:43.70923	\N	2023-04-27 20:03:23.217526	2023-04-27 19:56:43.690322	1073	22	\N	7	7	\N	\N	\N	9	49	1072	-1	\N	-1	-1
f	2023-04-27 19:56:43.719397	\N	2023-04-27 20:03:23.224751	2023-04-27 19:56:43.709814	1074	22	\N	7	7	\N	\N	\N	7	\N	1073	-1	\N	-1	-1
f	2023-04-27 19:56:43.739098	\N	2023-04-27 20:03:23.232526	2023-04-27 19:56:43.722294	1075	22	\N	7	7	\N	\N	\N	\N	\N	1074	-1	\N	-1	-1
f	2023-04-27 19:56:43.748074	\N	2023-04-27 20:03:23.24012	2023-04-27 19:56:43.739677	1076	22	\N	7	7	\N	\N	\N	6	\N	1075	-1	\N	-1	-1
f	2023-04-27 19:56:43.758536	\N	2023-04-27 20:03:23.247275	2023-04-27 19:56:43.74864	1077	\N	\N	7	7	\N	\N	\N	\N	\N	1076	-1	\N	-1	-1
f	2023-04-27 19:56:43.767569	\N	2023-04-27 20:03:23.254429	2023-04-27 19:56:43.759115	1078	\N	\N	7	7	\N	\N	\N	\N	\N	1076	-1	\N	-1	-1
f	2023-04-27 19:56:43.778435	\N	2023-04-27 20:03:23.261653	2023-04-27 19:56:43.768182	1079	24	\N	7	7	\N	\N	\N	\N	\N	1075	-1	\N	-1	-1
f	2023-04-27 19:56:43.788414	\N	2023-04-27 20:03:23.269341	2023-04-27 19:56:43.779288	1080	22	\N	7	7	\N	\N	\N	\N	\N	1074	-1	\N	-1	-1
f	2023-04-27 19:56:43.906192	\N	2023-04-27 20:03:23.276692	2023-04-27 19:56:43.789042	1081	22	\N	7	7	85	\N	\N	\N	\N	1080	-1	\N	-1	-1
f	2023-04-27 19:56:43.928594	\N	2023-04-27 20:03:23.284052	2023-04-27 19:56:43.906853	1082	24	\N	7	7	\N	\N	\N	\N	\N	1080	-1	\N	-1	-1
f	2023-04-27 19:56:43.937938	\N	2023-04-27 20:03:23.291464	2023-04-27 19:56:43.929185	1083	\N	\N	7	7	\N	\N	\N	\N	\N	1073	-1	\N	-1	-1
f	2023-04-27 20:09:50.634983	\N	2023-04-27 20:11:53.59558	2023-04-27 20:09:50.630643	1098	\N	\N	32	32	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 20:09:50.667687	\N	2023-04-27 20:11:53.610298	2023-04-27 20:09:50.635609	1099	22	\N	32	32	\N	\N	\N	7	\N	1098	-1	\N	-1	-1
f	2023-04-27 20:09:50.683707	\N	2023-04-27 20:11:53.626712	2023-04-27 20:09:50.668437	1100	22	\N	32	32	\N	\N	\N	\N	\N	1099	-1	\N	-1	-1
f	2023-04-27 20:09:50.695851	\N	2023-04-27 20:11:53.641736	2023-04-27 20:09:50.684325	1101	22	\N	32	32	\N	\N	\N	6	\N	1100	-1	\N	-1	-1
f	2023-04-27 20:09:50.708574	\N	2023-04-27 20:11:53.657205	2023-04-27 20:09:50.696547	1102	22	\N	32	32	87	\N	13	4	\N	1101	-1	\N	-1	-1
f	2023-04-27 20:09:50.718468	\N	2023-04-27 20:11:53.673961	2023-04-27 20:09:50.709166	1103	\N	\N	32	32	\N	\N	\N	\N	\N	1101	-1	\N	-1	-1
f	2023-04-27 20:09:50.727309	\N	2023-04-27 20:11:53.709188	2023-04-27 20:09:50.719044	1104	24	\N	32	32	\N	\N	\N	\N	\N	1100	-1	\N	-1	-1
f	2023-04-27 20:09:50.736344	\N	2023-04-27 20:11:53.739049	2023-04-27 20:09:50.727881	1105	22	\N	32	32	\N	\N	\N	\N	\N	1099	-1	\N	-1	-1
f	2023-04-27 20:09:50.812649	\N	2023-04-27 20:11:53.752795	2023-04-27 20:09:50.736918	1106	22	\N	32	32	88	\N	\N	\N	\N	1105	-1	\N	-1	-1
f	2023-04-27 20:09:50.834519	\N	2023-04-27 20:11:53.766677	2023-04-27 20:09:50.813257	1107	24	\N	32	32	\N	\N	\N	\N	\N	1105	-1	\N	-1	-1
f	2023-04-27 20:03:23.328761	\N	2023-04-27 21:14:57.290544	2023-04-27 20:03:23.319412	1085	22	\N	7	7	\N	\N	\N	9	\N	1084	-1	\N	-1	-1
f	2023-04-27 20:03:23.333817	\N	2023-04-27 21:14:57.350984	2023-04-27 20:03:23.329145	1086	22	\N	7	7	\N	\N	\N	7	\N	1085	-1	\N	-1	-1
f	2023-04-27 20:03:23.339144	\N	2023-04-27 21:14:57.366508	2023-04-27 20:03:23.334118	1087	22	\N	7	7	\N	\N	\N	\N	\N	1086	-1	\N	-1	-1
f	2023-04-27 20:03:23.343867	\N	2023-04-27 21:14:57.379835	2023-04-27 20:03:23.339471	1088	22	\N	7	7	\N	\N	\N	6	\N	1087	-1	\N	-1	-1
f	2023-04-27 20:03:23.356785	\N	2023-04-27 21:14:57.432241	2023-04-27 20:03:23.350586	1090	22	\N	7	7	86	\N	13	4	\N	1089	-1	\N	-1	-1
f	2023-04-27 20:03:23.370239	\N	2023-04-27 21:14:57.46258	2023-04-27 20:03:23.357104	1091	53	\N	7	7	\N	\N	\N	9	50	1088	-1	\N	-1	-1
f	2023-04-27 20:03:23.375313	\N	2023-04-27 21:14:57.477541	2023-04-27 20:03:23.370604	1092	\N	\N	7	7	\N	\N	\N	\N	\N	1091	-1	\N	-1	-1
f	2023-04-27 20:03:23.380165	\N	2023-04-27 21:14:57.492481	2023-04-27 20:03:23.37562	1093	24	\N	7	7	\N	\N	\N	\N	\N	1087	-1	\N	-1	-1
f	2023-04-27 20:03:23.386445	\N	2023-04-27 21:14:57.514301	2023-04-27 20:03:23.380469	1094	22	\N	7	7	\N	\N	\N	\N	\N	1086	-1	\N	-1	-1
f	2023-04-27 20:03:23.396315	\N	2023-04-27 21:14:57.567961	2023-04-27 20:03:23.386776	1095	22	\N	7	7	85	\N	\N	\N	\N	1094	-1	\N	-1	-1
f	2023-04-27 20:03:23.401371	\N	2023-04-27 21:14:57.575713	2023-04-27 20:03:23.396657	1096	24	\N	7	7	\N	\N	\N	\N	\N	1094	-1	\N	-1	-1
f	2023-04-27 13:57:14.431018	\N	2023-05-02 11:44:47.820789	2023-04-27 13:57:14.428086	1062	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 13:57:14.445683	\N	2023-05-02 11:44:47.844537	2023-04-27 13:57:14.431648	1063	22	\N	10	10	29	\N	13	4	\N	1062	-1	\N	-1	-1
f	2023-04-27 13:57:14.454762	\N	2023-05-02 11:44:47.878332	2023-04-27 13:57:14.446036	1064	52	\N	10	10	30	\N	12	4	\N	1062	-1	\N	-1	-1
f	2023-04-25 14:13:11.623722	\N	2023-05-02 12:55:22.367908	2023-04-25 14:13:11.608948	1047	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-25 14:13:11.697519	\N	2023-05-02 12:55:22.418121	2023-04-25 14:13:11.688261	1049	22	\N	29	29	\N	\N	\N	\N	\N	1048	-1	\N	-1	-1
f	2023-04-25 14:13:11.708582	\N	2023-05-02 12:55:22.433419	2023-04-25 14:13:11.698073	1050	\N	\N	29	29	\N	\N	\N	6	\N	1049	-1	\N	-1	-1
f	2023-04-25 14:13:11.717922	\N	2023-05-02 12:55:22.448945	2023-04-25 14:13:11.709142	1051	22	\N	29	29	\N	\N	\N	6	\N	1050	-1	\N	-1	-1
f	2023-04-25 14:13:11.734516	\N	2023-05-02 12:55:22.463024	2023-04-25 14:13:11.718478	1052	22	\N	29	29	67	\N	19	4	\N	1051	-1	\N	-1	-1
f	2023-04-25 14:13:11.751533	\N	2023-05-02 12:55:22.476836	2023-04-25 14:13:11.735091	1053	27	\N	29	29	81	\N	20	4	\N	1051	-1	\N	-1	-1
f	2023-04-25 14:13:11.764326	\N	2023-05-02 12:55:22.490201	2023-04-25 14:13:11.752172	1054	\N	\N	29	29	\N	\N	\N	6	\N	1049	-1	\N	-1	-1
f	2023-04-25 14:13:11.791076	\N	2023-05-02 12:55:22.517147	2023-04-25 14:13:11.773685	1056	22	\N	29	29	81	\N	20	4	\N	1055	-1	\N	-1	-1
f	2023-04-25 14:13:11.810597	\N	2023-05-02 12:55:22.532139	2023-04-25 14:13:11.791655	1057	23	\N	29	29	67	\N	19	4	\N	1055	-1	\N	-1	-1
f	2023-04-25 14:13:11.820666	\N	2023-05-02 12:55:22.546877	2023-04-25 14:13:11.811239	1058	22	\N	29	29	\N	\N	\N	\N	\N	1048	-1	\N	-1	-1
f	2023-04-25 14:13:11.847404	\N	2023-05-02 12:55:22.56146	2023-04-25 14:13:11.821232	1059	22	\N	29	29	77	\N	\N	\N	\N	1058	-1	\N	-1	-1
f	2023-04-25 14:13:11.857576	\N	2023-05-02 12:55:22.576371	2023-04-25 14:13:11.847987	1060	24	\N	29	29	\N	\N	\N	6	\N	1058	-1	\N	-1	-1
f	2023-04-27 20:11:53.777039	\N	2023-04-27 20:19:05.243576	2023-04-27 20:11:53.772132	1108	\N	\N	32	32	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 20:11:53.80359	\N	2023-04-27 20:19:05.263212	2023-04-27 20:11:53.777622	1109	22	\N	32	32	\N	\N	\N	7	\N	1108	-1	\N	-1	-1
f	2023-04-27 20:11:53.812724	\N	2023-04-27 20:19:05.277378	2023-04-27 20:11:53.804236	1110	22	\N	32	32	\N	\N	\N	\N	\N	1109	-1	\N	-1	-1
f	2023-04-27 20:11:53.824204	\N	2023-04-27 20:19:05.291819	2023-04-27 20:11:53.81328	1111	22	\N	32	32	\N	\N	\N	6	\N	1110	-1	\N	-1	-1
f	2023-04-27 20:11:53.852388	\N	2023-04-27 20:19:05.305598	2023-04-27 20:11:53.840376	1113	30	\N	32	32	\N	\N	\N	9	60	1111	-1	\N	-1	-1
f	2023-04-27 20:11:53.861415	\N	2023-04-27 20:19:05.319014	2023-04-27 20:11:53.85313	1114	24	\N	32	32	\N	\N	\N	\N	\N	1110	-1	\N	-1	-1
f	2023-04-27 20:11:53.870461	\N	2023-04-27 20:19:05.333136	2023-04-27 20:11:53.862036	1115	22	\N	32	32	\N	\N	\N	\N	\N	1109	-1	\N	-1	-1
f	2023-04-27 20:11:53.88987	\N	2023-04-27 20:19:05.346497	2023-04-27 20:11:53.871069	1116	22	\N	32	32	88	\N	\N	\N	\N	1115	-1	\N	-1	-1
f	2023-04-27 20:11:53.899637	\N	2023-04-27 20:19:05.360113	2023-04-27 20:11:53.890461	1117	24	\N	32	32	\N	\N	\N	\N	\N	1115	-1	\N	-1	-1
f	2023-04-27 20:11:53.839762	\N	2023-04-27 20:19:05.373519	2023-04-27 20:11:53.82477	1112	22	\N	32	32	87	\N	13	4	\N	1113	-1	\N	-1	-1
f	2023-04-27 20:19:05.383397	\N	2023-04-27 20:22:21.39884	2023-04-27 20:19:05.378585	1118	\N	\N	32	32	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 20:39:25.47662	\N	2023-04-27 20:43:21.199083	2023-04-27 20:39:25.472126	1163	\N	\N	33	33	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:33:46.167502	\N	2023-04-27 21:36:29.017742	2023-04-27 21:33:46.153063	1399	22	\N	7	7	\N	\N	\N	9	\N	1398	-1	\N	-1	-1
f	2023-04-27 21:33:46.193744	\N	2023-04-27 21:36:29.032257	2023-04-27 21:33:46.167962	1400	22	\N	7	7	\N	\N	\N	7	\N	1399	-1	\N	-1	-1
f	2023-04-27 21:33:46.201438	\N	2023-04-27 21:36:29.046296	2023-04-27 21:33:46.194236	1401	22	\N	7	7	\N	\N	\N	\N	\N	1400	-1	\N	-1	-1
f	2023-04-27 21:33:46.209808	\N	2023-04-27 21:36:29.060707	2023-04-27 21:33:46.201888	1402	22	\N	7	7	\N	\N	\N	6	\N	1401	-1	\N	-1	-1
f	2023-04-27 21:33:46.218692	\N	2023-04-27 21:36:29.119322	2023-04-27 21:33:46.210264	1403	\N	\N	7	7	\N	\N	\N	\N	\N	1402	-1	\N	-1	-1
f	2023-04-27 21:33:46.229235	\N	2023-04-27 21:36:29.134506	2023-04-27 21:33:46.219247	1404	22	\N	7	7	\N	\N	\N	9	\N	1403	-1	\N	-1	-1
f	2023-04-27 21:33:46.247478	\N	2023-04-27 21:36:29.154929	2023-04-27 21:33:46.229862	1405	22	\N	7	7	86	\N	13	4	\N	1404	-1	\N	-1	-1
f	2023-04-27 21:33:46.255794	\N	2023-04-27 21:36:29.168585	2023-04-27 21:33:46.247972	1406	53	\N	7	7	\N	\N	\N	9	\N	1403	-1	\N	-1	-1
f	2023-04-27 21:33:46.263156	\N	2023-04-27 21:36:29.181357	2023-04-27 21:33:46.256291	1407	22	\N	7	7	\N	32	\N	5	\N	1406	-1	\N	-1	-1
f	2023-04-27 21:33:46.276914	\N	2023-04-27 21:36:29.194259	2023-04-27 21:33:46.263691	1408	24	\N	7	7	\N	\N	\N	6	\N	1401	-1	\N	-1	-1
f	2023-04-27 21:33:46.284964	\N	2023-04-27 21:36:29.211138	2023-04-27 21:33:46.277439	1409	22	\N	7	7	\N	\N	\N	9	\N	1408	-1	\N	-1	-1
f	2023-04-27 21:33:46.293405	\N	2023-04-27 21:36:29.224053	2023-04-27 21:33:46.285538	1410	22	\N	7	7	\N	32	\N	5	\N	1409	-1	\N	-1	-1
f	2023-04-27 21:33:46.302197	\N	2023-04-27 21:36:29.261156	2023-04-27 21:33:46.293966	1411	23	\N	7	7	\N	\N	\N	9	\N	1408	-1	\N	-1	-1
f	2023-04-27 21:33:46.319518	\N	2023-04-27 21:36:29.279391	2023-04-27 21:33:46.302772	1412	22	\N	7	7	86	\N	13	4	\N	1411	-1	\N	-1	-1
f	2023-04-27 21:33:46.330273	\N	2023-04-27 21:36:29.289118	2023-04-27 21:33:46.320245	1413	22	\N	7	7	\N	\N	\N	\N	\N	1400	-1	\N	-1	-1
f	2023-04-27 21:33:46.350033	\N	2023-04-27 21:36:29.296202	2023-04-27 21:33:46.33083	1414	22	\N	7	7	85	\N	\N	\N	\N	1413	-1	\N	-1	-1
f	2023-04-27 21:33:46.358788	\N	2023-04-27 21:36:29.305929	2023-04-27 21:33:46.350593	1415	24	\N	7	7	\N	\N	\N	6	\N	1413	-1	\N	-1	-1
f	2023-04-27 21:33:46.366753	\N	2023-04-27 21:36:29.313555	2023-04-27 21:33:46.35931	1416	\N	\N	7	7	\N	\N	\N	6	\N	1415	-1	\N	-1	-1
f	2023-04-27 21:33:46.374674	\N	2023-04-27 21:36:29.320537	2023-04-27 21:33:46.367273	1417	\N	\N	7	7	\N	\N	\N	6	\N	1416	-1	\N	-1	-1
f	2023-04-27 21:33:46.382737	\N	2023-04-27 21:36:29.33476	2023-04-27 21:33:46.375214	1418	22	\N	7	7	\N	\N	\N	9	\N	1417	-1	\N	-1	-1
f	2023-04-27 21:33:46.398043	\N	2023-04-27 21:36:29.342415	2023-04-27 21:33:46.383256	1419	22	\N	7	7	\N	32	\N	5	\N	1418	-1	\N	-1	-1
f	2023-04-27 21:33:46.407431	\N	2023-04-27 21:36:29.349582	2023-04-27 21:33:46.398588	1420	23	\N	7	7	\N	\N	\N	9	\N	1417	-1	\N	-1	-1
f	2023-04-27 21:33:46.416391	\N	2023-04-27 21:36:29.356949	2023-04-27 21:33:46.408004	1421	22	\N	7	7	86	\N	13	4	\N	1420	-1	\N	-1	-1
f	2023-04-27 21:33:46.424605	\N	2023-04-27 21:36:29.364102	2023-04-27 21:33:46.416688	1422	25	\N	7	7	27	\N	16	4	\N	1416	-1	\N	-1	-1
f	2023-04-27 21:33:46.429392	\N	2023-04-27 21:36:29.371274	2023-04-27 21:33:46.4249	1423	\N	\N	7	7	\N	\N	\N	6	\N	1415	-1	\N	-1	-1
f	2023-04-27 21:33:46.43708	\N	2023-04-27 21:36:29.378467	2023-04-27 21:33:46.429676	1424	22	\N	7	7	27	\N	16	4	\N	1423	-1	\N	-1	-1
f	2023-04-27 21:33:46.444459	\N	2023-04-27 21:36:29.385542	2023-04-27 21:33:46.437371	1425	23	\N	7	7	\N	\N	\N	9	59	1423	-1	\N	-1	-1
f	2023-04-27 21:33:46.452988	\N	2023-04-27 21:36:29.392596	2023-04-27 21:33:46.444753	1426	22	\N	7	7	86	\N	13	4	\N	1425	-1	\N	-1	-1
f	2023-04-27 21:33:46.468065	\N	2023-04-27 21:36:29.399512	2023-04-27 21:33:46.453279	1427	22	\N	7	7	28	\N	16	4	\N	1423	-1	\N	-1	-1
f	2023-04-27 21:33:46.47308	\N	2023-04-27 21:36:29.40814	2023-04-27 21:33:46.468413	1428	\N	\N	7	7	\N	\N	\N	\N	\N	1415	-1	\N	-1	-1
f	2023-04-27 21:33:46.477561	\N	2023-04-27 21:36:29.416602	2023-04-27 21:33:46.473394	1429	\N	\N	7	7	\N	\N	\N	\N	\N	1399	-1	\N	-1	-1
f	2023-04-27 21:36:29.421786	\N	2023-04-27 21:38:25.956334	2023-04-27 21:36:29.419449	1430	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:36:29.429646	\N	2023-04-27 21:38:25.97199	2023-04-27 21:36:29.422099	1431	22	\N	7	7	\N	\N	\N	9	\N	1430	-1	\N	-1	-1
f	2023-04-27 21:36:29.434022	\N	2023-04-27 21:38:25.986501	2023-04-27 21:36:29.429937	1432	22	\N	7	7	\N	\N	\N	7	\N	1431	-1	\N	-1	-1
f	2023-04-27 21:36:29.438308	\N	2023-04-27 21:38:26.001152	2023-04-27 21:36:29.434313	1433	22	\N	7	7	\N	\N	\N	\N	\N	1432	-1	\N	-1	-1
f	2023-04-27 21:36:29.442636	\N	2023-04-27 21:38:26.015866	2023-04-27 21:36:29.43859	1434	22	\N	7	7	\N	\N	\N	6	\N	1433	-1	\N	-1	-1
f	2023-04-27 21:36:29.446989	\N	2023-04-27 21:38:26.033914	2023-04-27 21:36:29.442916	1435	\N	\N	7	7	\N	\N	\N	\N	\N	1434	-1	\N	-1	-1
f	2023-04-27 21:36:29.452736	\N	2023-04-27 21:38:26.041966	2023-04-27 21:36:29.447272	1436	22	\N	7	7	\N	\N	\N	9	\N	1435	-1	\N	-1	-1
f	2023-04-27 21:36:29.465391	\N	2023-04-27 21:38:26.060276	2023-04-27 21:36:29.460972	1438	53	\N	7	7	\N	\N	\N	9	\N	1435	-1	\N	-1	-1
f	2023-04-27 21:36:29.469672	\N	2023-04-27 21:38:26.067403	2023-04-27 21:36:29.465673	1439	22	\N	7	7	\N	32	\N	5	\N	1438	-1	\N	-1	-1
f	2023-04-27 21:36:29.474245	\N	2023-04-27 21:38:26.077288	2023-04-27 21:36:29.469963	1440	24	\N	7	7	\N	\N	\N	6	\N	1433	-1	\N	-1	-1
f	2023-04-27 21:36:29.478616	\N	2023-04-27 21:38:26.084455	2023-04-27 21:36:29.474544	1441	22	\N	7	7	\N	\N	\N	9	\N	1440	-1	\N	-1	-1
f	2023-04-27 21:36:29.483273	\N	2023-04-27 21:38:26.13074	2023-04-27 21:36:29.478897	1442	22	\N	7	7	\N	32	\N	5	\N	1441	-1	\N	-1	-1
f	2023-04-27 21:36:29.487668	\N	2023-04-27 21:38:26.137964	2023-04-27 21:36:29.483558	1443	23	\N	7	7	\N	\N	\N	9	\N	1440	-1	\N	-1	-1
f	2023-04-27 21:36:29.500114	\N	2023-04-27 21:38:26.153481	2023-04-27 21:36:29.49574	1445	22	\N	7	7	\N	\N	\N	\N	\N	1432	-1	\N	-1	-1
f	2023-04-27 21:36:29.523097	\N	2023-04-27 21:38:26.163751	2023-04-27 21:36:29.500397	1446	22	\N	7	7	85	\N	\N	\N	\N	1445	-1	\N	-1	-1
f	2023-04-27 21:36:29.527886	\N	2023-04-27 21:38:26.17242	2023-04-27 21:36:29.523436	1447	24	\N	7	7	\N	\N	\N	6	\N	1445	-1	\N	-1	-1
f	2023-04-27 21:36:29.534659	\N	2023-04-27 21:38:26.179522	2023-04-27 21:36:29.5282	1448	\N	\N	7	7	\N	\N	\N	6	\N	1447	-1	\N	-1	-1
f	2023-04-27 21:36:29.539383	\N	2023-04-27 21:38:26.186523	2023-04-27 21:36:29.534957	1449	\N	\N	7	7	\N	\N	\N	6	\N	1448	-1	\N	-1	-1
f	2023-04-27 21:36:29.543764	\N	2023-04-27 21:38:26.193431	2023-04-27 21:36:29.539671	1450	22	\N	7	7	\N	\N	\N	9	\N	1449	-1	\N	-1	-1
f	2023-04-27 21:36:29.552454	\N	2023-04-27 21:38:26.208142	2023-04-27 21:36:29.548388	1452	23	\N	7	7	\N	\N	\N	9	\N	1449	-1	\N	-1	-1
f	2023-04-27 21:36:29.560376	\N	2023-04-27 21:38:26.223626	2023-04-27 21:36:29.552736	1453	22	\N	7	7	86	\N	13	4	\N	1452	-1	\N	-1	-1
f	2023-04-27 21:36:29.568562	\N	2023-04-27 21:38:26.232816	2023-04-27 21:36:29.560764	1454	25	\N	7	7	27	\N	16	4	\N	1448	-1	\N	-1	-1
f	2023-04-27 21:36:29.573169	\N	2023-04-27 21:38:26.239903	2023-04-27 21:36:29.568861	1455	22	\N	7	7	\N	\N	\N	6	\N	1447	-1	\N	-1	-1
f	2023-04-27 21:36:29.580773	\N	2023-04-27 21:38:26.247286	2023-04-27 21:36:29.57345	1456	22	\N	7	7	27	\N	16	4	\N	1455	-1	\N	-1	-1
f	2023-04-27 21:36:29.600159	\N	2023-04-27 21:38:26.265486	2023-04-27 21:36:29.585975	1458	22	\N	7	7	86	\N	13	4	\N	1457	-1	\N	-1	-1
f	2023-04-27 21:36:29.609657	\N	2023-04-27 21:38:26.272739	2023-04-27 21:36:29.600464	1459	22	\N	7	7	28	\N	16	4	\N	1455	-1	\N	-1	-1
f	2023-04-27 21:36:29.614376	\N	2023-04-27 21:38:26.279633	2023-04-27 21:36:29.609967	1460	22	\N	7	7	\N	\N	\N	6	\N	1447	-1	\N	-1	-1
f	2023-04-27 21:36:29.620294	\N	2023-04-27 21:38:26.286985	2023-04-27 21:36:29.614659	1461	22	\N	7	7	\N	\N	\N	9	59	1460	-1	\N	-1	-1
f	2023-04-27 21:36:29.624839	\N	2023-04-27 21:38:26.294428	2023-04-27 21:36:29.620577	1462	22	\N	7	7	\N	32	\N	5	\N	1461	-1	\N	-1	-1
f	2023-04-27 21:36:29.629186	\N	2023-04-27 21:38:26.301264	2023-04-27 21:36:29.625131	1463	\N	\N	7	7	\N	\N	\N	\N	\N	1431	-1	\N	-1	-1
f	2023-04-27 20:19:05.401969	\N	2023-04-27 20:22:21.414774	2023-04-27 20:19:05.384011	1119	22	\N	32	32	\N	\N	\N	7	\N	1118	-1	\N	-1	-1
f	2023-04-27 20:19:05.411291	\N	2023-04-27 20:22:21.430007	2023-04-27 20:19:05.402594	1120	22	\N	32	32	\N	\N	\N	\N	\N	1119	-1	\N	-1	-1
f	2023-04-27 20:19:05.420377	\N	2023-04-27 20:22:21.444282	2023-04-27 20:19:05.41187	1121	22	\N	32	32	\N	\N	\N	6	\N	1120	-1	\N	-1	-1
f	2023-04-27 20:19:05.430852	\N	2023-04-27 20:22:21.45959	2023-04-27 20:19:05.420955	1122	30	\N	32	32	\N	\N	\N	9	\N	1121	-1	\N	-1	-1
f	2023-04-27 20:19:05.449496	\N	2023-04-27 20:22:21.477714	2023-04-27 20:19:05.431494	1123	22	\N	32	32	87	\N	13	4	\N	1122	-1	\N	-1	-1
f	2023-04-27 20:19:05.459772	\N	2023-04-27 20:22:21.493537	2023-04-27 20:19:05.450119	1124	\N	\N	32	32	\N	\N	\N	6	\N	1121	-1	\N	-1	-1
f	2023-04-27 20:19:05.469171	\N	2023-04-27 20:22:21.507548	2023-04-27 20:19:05.460415	1125	\N	\N	32	32	\N	\N	\N	\N	\N	1124	-1	\N	-1	-1
f	2023-04-27 20:19:05.478238	\N	2023-04-27 20:22:21.521151	2023-04-27 20:19:05.4698	1126	\N	\N	32	32	\N	\N	\N	\N	\N	1124	-1	\N	-1	-1
f	2023-04-27 20:19:05.488988	\N	2023-04-27 20:22:21.534879	2023-04-27 20:19:05.478817	1127	\N	\N	32	32	\N	\N	\N	\N	\N	1120	-1	\N	-1	-1
f	2023-04-27 20:19:05.49922	\N	2023-04-27 20:22:21.548564	2023-04-27 20:19:05.489583	1128	22	\N	32	32	\N	\N	\N	\N	\N	1119	-1	\N	-1	-1
f	2023-04-27 20:19:05.517713	\N	2023-04-27 20:22:21.564505	2023-04-27 20:19:05.499809	1129	22	\N	32	32	88	\N	\N	\N	\N	1128	-1	\N	-1	-1
f	2023-04-27 20:19:05.523405	\N	2023-04-27 20:22:21.579388	2023-04-27 20:19:05.518326	1130	24	\N	32	32	\N	\N	\N	\N	\N	1128	-1	\N	-1	-1
f	2023-04-27 21:36:29.460665	\N	2023-04-27 21:38:26.050283	2023-04-27 21:36:29.453019	1437	22	\N	7	7	86	\N	13	4	\N	1436	-1	\N	-1	-1
f	2023-04-27 21:36:29.585691	\N	2023-04-27 21:38:26.25856	2023-04-27 21:36:29.581062	1457	23	\N	7	7	\N	\N	\N	9	\N	1455	-1	\N	-1	-1
f	2023-05-02 11:46:16.518791	\N	2023-05-02 12:00:50.173179	2023-05-02 11:46:16.502014	1607	25	\N	11	11	\N	\N	\N	6	\N	1606	-1	\N	-1	-1
f	2023-05-02 11:46:16.53877	\N	2023-05-02 12:00:50.188283	2023-05-02 11:46:16.519531	1608	22	\N	11	11	31	\N	19	4	\N	1607	-1	\N	-1	-1
f	2023-05-02 11:46:16.556414	\N	2023-05-02 12:00:50.209616	2023-05-02 11:46:16.539362	1609	52	\N	11	11	32	\N	12	4	\N	1607	-1	\N	-1	-1
f	2023-05-02 12:31:09.202776	\N	2023-05-02 12:34:19.037454	2023-05-02 12:31:09.197521	1624	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:31:09.219952	\N	2023-05-02 12:34:19.053569	2023-05-02 12:31:09.203393	1625	25	\N	18	18	\N	\N	\N	6	\N	1624	-1	\N	-1	-1
f	2023-05-02 12:31:09.238644	\N	2023-05-02 12:34:19.067042	2023-05-02 12:31:09.220635	1626	22	\N	18	18	67	\N	19	4	\N	1625	-1	\N	-1	-1
f	2023-05-02 12:31:09.249296	\N	2023-05-02 12:34:19.080878	2023-05-02 12:31:09.239251	1627	\N	\N	18	18	\N	\N	\N	\N	\N	1625	-1	\N	-1	-1
f	2023-04-10 08:46:58.849379	\N	2023-05-02 12:43:02.051849	2023-04-10 08:46:58.77213	662	25	\N	14	14	\N	\N	\N	6	\N	661	-1	\N	-1	-1
f	2023-02-06 21:21:54.535107	\N	2023-05-02 12:49:13.893852	2023-02-06 21:21:54.530766	643	24	\N	12	12	40	\N	16	4	\N	635	-1	\N	-1	-1
f	2023-05-02 12:34:19.163701	\N	2023-05-02 13:21:56.7107	2023-05-02 12:34:19.158665	1628	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:44:50.666854	\N	2023-05-02 14:40:07.23125	2023-05-02 12:44:50.648611	1638	52	\N	10	10	30	\N	12	4	\N	1636	-1	\N	-1	-1
f	2023-05-02 12:57:29.118294	\N	2023-05-03 15:13:16.394181	2023-05-02 12:57:29.113243	1673	\N	\N	20	20	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:57:29.13505	\N	2023-05-03 15:13:16.409739	2023-05-02 12:57:29.118892	1674	24	\N	20	20	\N	\N	\N	6	\N	1673	-1	\N	-1	-1
f	2023-05-02 12:57:29.144864	\N	2023-05-03 15:13:16.423986	2023-05-02 12:57:29.135689	1675	\N	\N	20	20	\N	\N	\N	\N	\N	1674	-1	\N	-1	-1
f	2023-05-02 12:57:29.154071	\N	2023-05-03 15:13:16.43866	2023-05-02 12:57:29.145561	1676	\N	\N	20	20	\N	\N	\N	6	\N	1674	-1	\N	-1	-1
f	2023-05-02 12:57:29.163074	\N	2023-05-03 15:13:16.471614	2023-05-02 12:57:29.154641	1677	24	\N	20	20	\N	\N	\N	6	\N	1676	-1	\N	-1	-1
f	2023-05-02 12:57:29.172134	\N	2023-05-03 15:13:16.490216	2023-05-02 12:57:29.163641	1678	\N	\N	20	20	\N	\N	\N	\N	\N	1677	-1	\N	-1	-1
f	2023-05-02 12:57:29.181184	\N	2023-05-03 15:13:16.503989	2023-05-02 12:57:29.172703	1679	\N	\N	20	20	\N	\N	\N	\N	\N	1677	-1	\N	-1	-1
f	2023-05-02 12:57:29.190192	\N	2023-05-03 15:13:16.520622	2023-05-02 12:57:29.181752	1680	\N	\N	20	20	\N	\N	\N	\N	\N	1676	-1	\N	-1	-1
f	2023-05-03 15:12:58.87494	\N	2023-05-04 08:59:13.121192	2023-05-03 15:12:58.865808	1723	24	\N	26	26	\N	\N	\N	6	\N	1721	-1	\N	-1	-1
f	2023-04-10 11:38:37.173412	\N	2023-05-04 08:59:30.15118	2023-04-10 11:38:37.165407	748	24	\N	24	24	\N	\N	\N	6	\N	746	-1	\N	-1	-1
f	2023-05-02 13:28:11.64916	\N	2023-05-04 08:59:59.59919	2023-05-02 13:28:11.6371	1695	\N	\N	21	21	\N	\N	\N	6	\N	1694	-1	\N	-1	-1
f	2023-04-17 15:26:04.870661	\N	2023-05-04 09:00:30.758983	2023-04-17 15:26:04.842174	915	22	\N	28	28	73	\N	\N	\N	\N	914	-1	\N	-1	-1
f	2023-05-02 12:56:02.016341	\N	2023-05-04 09:11:04.38213	2023-05-02 12:56:02.011481	1658	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:01:01.293269	\N	2023-05-04 09:17:23.461668	2023-05-04 09:01:01.288482	1781	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:01:01.311549	\N	2023-05-04 09:17:23.477155	2023-05-04 09:01:01.293914	1782	\N	\N	27	27	\N	\N	\N	6	\N	1781	-1	\N	-1	-1
f	2023-05-04 09:01:01.320937	\N	2023-05-04 09:17:23.501119	2023-05-04 09:01:01.312191	1783	\N	\N	27	27	\N	\N	\N	\N	\N	1782	-1	\N	-1	-1
f	2023-05-04 09:01:01.33725	\N	2023-05-04 09:17:23.51465	2023-05-04 09:01:01.321512	1784	53	\N	27	27	63	\N	16	4	\N	1782	-1	\N	-1	-1
t	2023-05-04 09:18:11.359847	\N	\N	2023-05-04 09:18:11.355061	1811	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 09:18:11.376409	\N	\N	2023-05-04 09:18:11.360526	1812	\N	\N	27	27	\N	\N	\N	6	\N	1811	-1	\N	\N	-1
t	2023-05-04 09:18:11.385416	\N	\N	2023-05-04 09:18:11.376983	1813	\N	\N	27	27	\N	\N	\N	\N	\N	1812	-1	\N	\N	-1
t	2023-05-04 09:18:11.401664	\N	\N	2023-05-04 09:18:11.38599	1814	53	\N	27	27	63	\N	16	4	\N	1812	-1	\N	\N	-1
t	2023-05-04 09:18:58.981952	\N	\N	2023-05-04 09:18:58.97955	1815	\N	\N	23	23	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 09:18:58.990361	\N	\N	2023-05-04 09:18:58.982327	1816	\N	\N	23	23	\N	\N	\N	6	\N	1815	-1	\N	\N	-1
t	2023-05-04 09:18:58.995057	\N	\N	2023-05-04 09:18:58.990649	1817	\N	\N	23	23	\N	\N	\N	6	\N	1816	-1	\N	\N	-1
t	2023-05-04 09:18:59.000321	\N	\N	2023-05-04 09:18:58.995391	1818	\N	\N	23	23	\N	\N	\N	6	\N	1817	-1	\N	\N	-1
t	2023-05-04 09:18:59.008344	\N	\N	2023-05-04 09:18:59.000608	1819	22	\N	23	23	70	\N	14	4	\N	1818	-1	\N	\N	-1
t	2023-05-04 09:18:59.013242	\N	\N	2023-05-04 09:18:59.008634	1820	52	\N	23	23	\N	\N	\N	\N	\N	1818	-1	\N	\N	-1
t	2023-05-04 09:18:59.017759	\N	\N	2023-05-04 09:18:59.013532	1821	52	\N	23	23	\N	\N	\N	\N	\N	1817	-1	\N	\N	-1
t	2023-05-04 09:18:59.024114	\N	\N	2023-05-04 09:18:59.018045	1822	\N	\N	23	23	\N	\N	\N	\N	\N	1816	-1	\N	\N	-1
f	2023-05-04 09:23:16.504111	\N	2023-05-04 09:27:20.908495	2023-05-04 09:23:16.488891	1830	\N	\N	26	26	\N	\N	\N	6	\N	1829	-1	\N	-1	-1
f	2023-05-04 09:11:04.619324	\N	2023-05-04 09:38:58.955336	2023-05-04 09:11:04.614497	1792	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:11:04.644256	\N	2023-05-04 09:38:59.007683	2023-05-04 09:11:04.635854	1794	22	\N	29	29	\N	\N	\N	\N	\N	1793	-1	\N	-1	-1
f	2023-05-04 09:11:04.653022	\N	2023-05-04 09:38:59.018747	2023-05-04 09:11:04.644823	1795	\N	\N	29	29	\N	\N	\N	6	\N	1794	-1	\N	-1	-1
f	2023-05-04 09:11:04.664079	\N	2023-05-04 09:38:59.029368	2023-05-04 09:11:04.653594	1796	22	\N	29	29	\N	\N	\N	6	\N	1795	-1	\N	-1	-1
f	2023-05-04 09:11:04.683092	\N	2023-05-04 09:38:59.041166	2023-05-04 09:11:04.664741	1797	22	\N	29	29	67	\N	19	4	\N	1796	-1	\N	-1	-1
f	2023-05-04 09:11:04.709667	\N	2023-05-04 09:38:59.080706	2023-05-04 09:11:04.700825	1799	\N	\N	29	29	\N	\N	\N	6	\N	1794	-1	\N	-1	-1
f	2023-05-04 09:11:04.729121	\N	2023-05-04 09:38:59.102505	2023-05-04 09:11:04.720707	1800	\N	\N	29	29	\N	\N	\N	6	\N	1799	-1	\N	-1	-1
f	2023-05-04 09:11:04.744745	\N	2023-05-04 09:38:59.122023	2023-05-04 09:11:04.729685	1801	22	\N	29	29	81	\N	20	4	\N	1800	-1	\N	-1	-1
f	2023-05-04 09:11:04.760794	\N	2023-05-04 09:38:59.142661	2023-05-04 09:11:04.745324	1802	23	\N	29	29	67	\N	19	4	\N	1800	-1	\N	-1	-1
f	2023-05-04 09:11:04.772754	\N	2023-05-04 09:38:59.154567	2023-05-04 09:11:04.761387	1803	22	\N	29	29	\N	\N	\N	\N	\N	1793	-1	\N	-1	-1
f	2023-05-04 09:11:04.794573	\N	2023-05-04 09:38:59.166072	2023-05-04 09:11:04.773336	1804	22	\N	29	29	77	\N	\N	\N	\N	1803	-1	\N	-1	-1
f	2023-05-04 09:11:04.804312	\N	2023-05-04 09:38:59.177246	2023-05-04 09:11:04.79519	1805	24	\N	29	29	\N	\N	\N	6	\N	1803	-1	\N	-1	-1
f	2023-05-02 14:40:26.062521	\N	2023-05-04 10:18:39.103958	2023-05-02 14:40:26.055455	1710	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 14:40:26.085787	\N	2023-05-04 10:18:39.14212	2023-05-02 14:40:26.063108	1711	22	\N	10	10	29	\N	13	4	\N	1710	-1	\N	-1	-1
f	2023-05-02 14:40:26.103879	\N	2023-05-04 10:18:39.156652	2023-05-02 14:40:26.086364	1712	\N	\N	10	10	30	\N	12	4	\N	1710	-1	\N	-1	-1
f	2023-05-04 09:06:00.935486	\N	2023-05-04 12:00:09.28913	2023-05-04 09:06:00.93065	1785	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:06:00.955297	\N	2023-05-04 12:00:09.536775	2023-05-04 09:06:00.93616	1786	22	\N	17	17	\N	\N	\N	6	\N	1785	-1	\N	-1	-1
f	2023-05-04 09:06:00.985382	\N	2023-05-04 12:00:09.569275	2023-05-04 09:06:00.973472	1788	\N	\N	17	17	\N	\N	\N	6	\N	1786	-1	\N	-1	-1
f	2023-05-04 09:06:00.994598	\N	2023-05-04 12:00:09.584427	2023-05-04 09:06:00.986023	1789	27	\N	17	17	\N	\N	\N	6	\N	1788	-1	\N	-1	-1
f	2023-05-04 09:06:01.003544	\N	2023-05-04 12:00:09.597479	2023-05-04 09:06:00.995168	1790	22	\N	17	17	\N	29	\N	5	\N	1789	-1	\N	-1	-1
f	2023-05-04 09:06:01.020012	\N	2023-05-04 12:00:09.610483	2023-05-04 09:06:01.004179	1791	53	\N	17	17	67	\N	19	4	\N	1789	-1	\N	-1	-1
f	2023-04-27 21:36:29.495441	\N	2023-04-27 21:38:26.146092	2023-04-27 21:36:29.48795	1444	22	\N	7	7	86	\N	13	4	\N	1443	-1	\N	-1	-1
f	2023-04-27 21:38:26.306576	\N	2023-04-27 23:33:18.577605	2023-04-27 21:38:26.304275	1464	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:38:26.314449	\N	2023-04-27 23:33:18.597173	2023-04-27 21:38:26.306886	1465	22	\N	7	7	\N	\N	\N	9	\N	1464	-1	\N	-1	-1
f	2023-04-27 21:38:26.321167	\N	2023-04-27 23:33:18.624171	2023-04-27 21:38:26.314732	1466	22	\N	7	7	\N	\N	\N	7	\N	1465	-1	\N	-1	-1
f	2023-04-27 21:38:26.327377	\N	2023-04-27 23:33:18.638764	2023-04-27 21:38:26.321527	1467	22	\N	7	7	\N	\N	\N	\N	\N	1466	-1	\N	-1	-1
f	2023-04-27 21:38:26.332648	\N	2023-04-27 23:33:18.656357	2023-04-27 21:38:26.327729	1468	22	\N	7	7	\N	\N	\N	6	\N	1467	-1	\N	-1	-1
f	2023-04-27 21:38:26.338837	\N	2023-04-27 23:33:18.670276	2023-04-27 21:38:26.332999	1469	\N	\N	7	7	\N	\N	\N	\N	\N	1468	-1	\N	-1	-1
f	2023-04-27 21:38:26.345162	\N	2023-04-27 23:33:18.684189	2023-04-27 21:38:26.339223	1470	22	\N	7	7	\N	\N	\N	9	\N	1469	-1	\N	-1	-1
f	2023-04-27 21:38:26.353052	\N	2023-04-27 23:33:18.698623	2023-04-27 21:38:26.345453	1471	22	\N	7	7	86	\N	13	4	\N	1470	-1	\N	-1	-1
f	2023-04-27 21:38:26.35761	\N	2023-04-27 23:33:18.71267	2023-04-27 21:38:26.353349	1472	53	\N	7	7	\N	\N	\N	9	\N	1469	-1	\N	-1	-1
f	2023-04-27 21:38:26.361922	\N	2023-04-27 23:33:18.751198	2023-04-27 21:38:26.357891	1473	22	\N	7	7	\N	32	\N	5	\N	1472	-1	\N	-1	-1
f	2023-04-27 21:38:26.366234	\N	2023-04-27 23:33:18.765365	2023-04-27 21:38:26.362207	1474	24	\N	7	7	\N	\N	\N	6	\N	1467	-1	\N	-1	-1
f	2023-04-27 21:38:26.370494	\N	2023-04-27 23:33:18.778936	2023-04-27 21:38:26.366512	1475	22	\N	7	7	\N	\N	\N	9	\N	1474	-1	\N	-1	-1
f	2023-04-27 21:38:26.382032	\N	2023-04-27 23:33:18.801211	2023-04-27 21:38:26.37077	1476	22	\N	7	7	\N	32	\N	5	\N	1475	-1	\N	-1	-1
f	2023-04-27 21:38:26.386597	\N	2023-04-27 23:33:18.820509	2023-04-27 21:38:26.382336	1477	23	\N	7	7	\N	\N	\N	9	\N	1474	-1	\N	-1	-1
f	2023-04-27 21:38:26.395323	\N	2023-04-27 23:33:18.835426	2023-04-27 21:38:26.386889	1478	22	\N	7	7	86	\N	13	4	\N	1477	-1	\N	-1	-1
f	2023-04-27 21:38:26.399924	\N	2023-04-27 23:33:18.852218	2023-04-27 21:38:26.395626	1479	22	\N	7	7	\N	\N	\N	\N	\N	1466	-1	\N	-1	-1
f	2023-04-27 21:38:26.40951	\N	2023-04-27 23:33:18.866299	2023-04-27 21:38:26.400241	1480	22	\N	7	7	85	\N	\N	\N	\N	1479	-1	\N	-1	-1
f	2023-04-27 21:38:26.414777	\N	2023-04-27 23:33:18.924757	2023-04-27 21:38:26.409802	1481	24	\N	7	7	\N	\N	\N	6	\N	1479	-1	\N	-1	-1
f	2023-04-27 21:38:26.421117	\N	2023-04-27 23:33:18.93931	2023-04-27 21:38:26.415079	1482	\N	\N	7	7	\N	\N	\N	6	\N	1481	-1	\N	-1	-1
f	2023-04-27 21:38:26.425901	\N	2023-04-27 23:33:18.96258	2023-04-27 21:38:26.421429	1483	\N	\N	7	7	\N	\N	\N	6	\N	1482	-1	\N	-1	-1
f	2023-04-27 21:38:26.430564	\N	2023-04-27 23:33:18.976876	2023-04-27 21:38:26.426206	1484	22	\N	7	7	\N	\N	\N	9	\N	1483	-1	\N	-1	-1
f	2023-04-27 21:38:26.438408	\N	2023-04-27 23:33:18.992313	2023-04-27 21:38:26.430923	1485	22	\N	7	7	\N	32	\N	5	\N	1484	-1	\N	-1	-1
f	2023-04-27 21:38:26.443385	\N	2023-04-27 23:33:19.005861	2023-04-27 21:38:26.438733	1486	23	\N	7	7	\N	\N	\N	9	\N	1483	-1	\N	-1	-1
f	2023-04-27 21:38:26.45207	\N	2023-04-27 23:33:19.029519	2023-04-27 21:38:26.443697	1487	22	\N	7	7	86	\N	13	4	\N	1486	-1	\N	-1	-1
f	2023-04-27 21:38:26.464595	\N	2023-04-27 23:33:19.043617	2023-04-27 21:38:26.452405	1488	25	\N	7	7	27	\N	16	4	\N	1482	-1	\N	-1	-1
f	2023-04-27 21:38:26.469594	\N	2023-04-27 23:33:19.059942	2023-04-27 21:38:26.46492	1489	22	\N	7	7	\N	\N	\N	6	\N	1481	-1	\N	-1	-1
f	2023-04-27 21:38:26.478632	\N	2023-04-27 23:33:19.073807	2023-04-27 21:38:26.469918	1490	22	\N	7	7	27	\N	16	4	\N	1489	-1	\N	-1	-1
f	2023-04-27 21:38:26.483898	\N	2023-04-27 23:33:19.088999	2023-04-27 21:38:26.478954	1491	23	\N	7	7	\N	\N	\N	9	\N	1489	-1	\N	-1	-1
f	2023-04-27 21:38:26.492575	\N	2023-04-27 23:33:19.104186	2023-04-27 21:38:26.484235	1492	22	\N	7	7	86	\N	13	4	\N	1491	-1	\N	-1	-1
f	2023-04-27 21:38:26.501705	\N	2023-04-27 23:33:19.117546	2023-04-27 21:38:26.492904	1493	22	\N	7	7	28	\N	16	4	\N	1489	-1	\N	-1	-1
f	2023-04-27 21:38:26.50674	\N	2023-04-27 23:33:19.133104	2023-04-27 21:38:26.502032	1494	22	\N	7	7	\N	\N	\N	6	\N	1481	-1	\N	-1	-1
f	2023-04-27 21:38:26.511609	\N	2023-04-27 23:33:19.147879	2023-04-27 21:38:26.507047	1495	22	\N	7	7	\N	\N	\N	9	\N	1494	-1	\N	-1	-1
f	2023-04-27 21:38:26.516582	\N	2023-04-27 23:33:19.161463	2023-04-27 21:38:26.511918	1496	22	\N	7	7	\N	32	\N	5	\N	1495	-1	\N	-1	-1
f	2023-04-27 21:38:26.53695	\N	2023-04-27 23:33:19.175204	2023-04-27 21:38:26.516922	1497	25	\N	7	7	27	\N	16	4	\N	1465	-1	\N	-1	-1
f	2023-05-02 11:46:16.501417	\N	2023-05-02 12:00:50.143135	2023-05-02 11:46:16.492386	1606	\N	\N	11	11	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-18 13:50:10.914619	\N	2023-05-02 13:20:28.862968	2023-04-18 13:50:10.906132	997	22	\N	17	17	47	\N	20	4	\N	996	-1	\N	-1	-1
f	2023-05-02 12:34:19.181187	\N	2023-05-02 13:21:56.738694	2023-05-02 12:34:19.16439	1629	25	\N	18	18	\N	\N	\N	6	\N	1628	-1	\N	-1	-1
f	2023-05-02 13:20:28.97533	\N	2023-05-03 15:12:38.898783	2023-05-02 13:20:28.96777	1681	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 13:20:28.994071	\N	2023-05-03 15:12:38.955507	2023-05-02 13:20:28.977107	1682	24	\N	17	17	\N	\N	\N	6	\N	1681	-1	\N	-1	-1
f	2023-05-02 13:20:29.013198	\N	2023-05-03 15:12:38.970476	2023-05-02 13:20:28.994679	1683	22	\N	17	17	47	\N	20	4	\N	1682	-1	\N	-1	-1
f	2023-05-02 13:20:29.023471	\N	2023-05-03 15:12:38.990244	2023-05-02 13:20:29.013843	1684	\N	\N	17	17	\N	\N	\N	6	\N	1682	-1	\N	-1	-1
f	2023-05-02 13:20:29.03244	\N	2023-05-03 15:12:39.005641	2023-05-02 13:20:29.024108	1685	27	\N	17	17	\N	\N	\N	6	\N	1684	-1	\N	-1	-1
f	2023-05-02 13:20:29.04165	\N	2023-05-03 15:12:39.020449	2023-05-02 13:20:29.033016	1686	22	\N	17	17	\N	29	\N	5	\N	1685	-1	\N	-1	-1
f	2023-05-02 13:20:29.058077	\N	2023-05-03 15:12:39.033372	2023-05-02 13:20:29.042231	1687	53	\N	17	17	67	\N	19	4	\N	1685	-1	\N	-1	-1
f	2023-05-02 11:50:53.367689	\N	2023-05-03 15:12:58.750986	2023-05-02 11:50:53.362903	1610	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 11:50:53.38601	\N	2023-05-03 15:12:58.765807	2023-05-02 11:50:53.368361	1611	\N	\N	26	26	\N	\N	\N	6	\N	1610	-1	\N	-1	-1
f	2023-05-02 11:50:53.39572	\N	2023-05-03 15:12:58.77896	2023-05-02 11:50:53.386619	1612	\N	\N	26	26	\N	\N	\N	\N	\N	1611	-1	\N	-1	-1
f	2023-05-02 11:50:53.405199	\N	2023-05-03 15:12:58.79745	2023-05-02 11:50:53.396347	1613	24	\N	26	26	\N	\N	\N	6	\N	1611	-1	\N	-1	-1
f	2023-05-02 11:50:53.421929	\N	2023-05-03 15:12:58.811754	2023-05-02 11:50:53.405763	1614	22	\N	26	26	59	\N	16	4	\N	1613	-1	\N	-1	-1
f	2023-05-02 11:50:53.453607	\N	2023-05-03 15:12:58.825089	2023-05-02 11:50:53.422503	1615	53	\N	26	26	61	\N	16	4	\N	1613	-1	\N	-1	-1
t	2023-05-04 08:59:59.682172	\N	\N	2023-05-04 08:59:59.677396	1754	\N	\N	21	21	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 08:59:59.701168	\N	\N	2023-05-04 08:59:59.682768	1755	\N	\N	21	21	\N	\N	\N	6	\N	1754	-1	\N	\N	-1
t	2023-05-04 08:59:59.710798	\N	\N	2023-05-04 08:59:59.701746	1756	\N	\N	21	21	\N	\N	\N	6	\N	1755	-1	\N	\N	-1
t	2023-05-04 08:59:59.720147	\N	\N	2023-05-04 08:59:59.711422	1757	\N	\N	21	21	\N	\N	\N	6	\N	1756	-1	\N	\N	-1
t	2023-05-04 08:59:59.72927	\N	\N	2023-05-04 08:59:59.720719	1758	\N	\N	21	21	\N	\N	\N	6	\N	1757	-1	\N	\N	-1
t	2023-05-04 08:59:59.738673	\N	\N	2023-05-04 08:59:59.729843	1759	\N	\N	21	21	\N	\N	\N	\N	\N	1758	-1	\N	\N	-1
t	2023-05-04 08:59:59.748721	\N	\N	2023-05-04 08:59:59.740496	1760	\N	\N	21	21	\N	\N	\N	\N	\N	1758	-1	\N	\N	-1
t	2023-05-04 08:59:59.759228	\N	\N	2023-05-04 08:59:59.749299	1761	\N	\N	21	21	\N	\N	\N	\N	\N	1756	-1	\N	\N	-1
t	2023-05-04 08:59:59.802012	\N	\N	2023-05-04 08:59:59.759818	1762	\N	\N	21	21	\N	\N	\N	\N	\N	1755	-1	\N	\N	-1
f	2023-05-02 12:56:02.033958	\N	2023-05-04 09:11:04.399788	2023-05-02 12:56:02.016925	1659	22	\N	29	29	\N	\N	\N	7	\N	1658	-1	\N	-1	-1
f	2023-05-02 12:56:02.096305	\N	2023-05-04 09:11:04.471433	2023-05-02 12:56:02.087389	1664	27	\N	29	29	81	\N	20	4	\N	1662	-1	\N	-1	-1
f	2023-05-04 09:23:16.488293	\N	2023-05-04 09:27:20.894329	2023-05-04 09:23:16.483473	1829	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:23:16.520712	\N	2023-05-04 09:27:20.922627	2023-05-04 09:23:16.504691	1831	22	\N	26	26	91	\N	13	4	\N	1830	-1	\N	-1	-1
f	2023-05-04 09:23:16.531162	\N	2023-05-04 09:27:20.936357	2023-05-04 09:23:16.522338	1832	24	\N	26	26	\N	\N	\N	6	\N	1830	-1	\N	-1	-1
f	2023-05-04 09:23:16.557443	\N	2023-05-04 09:27:20.951859	2023-05-04 09:23:16.531758	1833	22	\N	26	26	61	\N	16	4	\N	1832	-1	\N	-1	-1
f	2023-05-04 09:00:30.908611	\N	2023-05-04 09:29:07.664743	2023-05-04 09:00:30.892081	1770	28	\N	28	28	74	\N	20	4	\N	1768	-1	\N	-1	-1
f	2023-05-04 09:00:31.015815	\N	2023-05-04 09:29:07.774877	2023-05-04 09:00:30.997962	1777	22	\N	28	28	73	\N	\N	\N	\N	1776	-1	\N	-1	-1
f	2023-05-04 09:11:04.635281	\N	2023-05-04 09:38:58.983759	2023-05-04 09:11:04.619945	1793	22	\N	29	29	\N	\N	\N	7	\N	1792	-1	\N	-1	-1
f	2023-05-04 09:11:04.700234	\N	2023-05-04 09:38:59.062157	2023-05-04 09:11:04.68368	1798	27	\N	29	29	81	\N	20	4	\N	1796	-1	\N	-1	-1
f	2023-05-04 09:27:20.997187	\N	2023-05-04 09:59:27.279569	2023-05-04 09:27:20.978329	1836	22	\N	26	26	91	\N	13	4	\N	1835	-1	\N	-1	-1
f	2023-05-04 09:27:21.008507	\N	2023-05-04 09:59:27.337165	2023-05-04 09:27:20.997772	1837	24	\N	26	26	\N	\N	\N	6	\N	1835	-1	\N	-1	-1
f	2023-05-04 09:27:21.024327	\N	2023-05-04 09:59:27.353168	2023-05-04 09:27:21.009081	1838	22	\N	26	26	92	\N	16	4	\N	1837	-1	\N	-1	-1
f	2023-05-04 09:27:21.040607	\N	2023-05-04 09:59:27.379311	2023-05-04 09:27:21.025001	1839	53	\N	26	26	61	\N	16	4	\N	1837	-1	\N	-1	-1
f	2023-04-27 21:36:29.548104	\N	2023-04-27 21:38:26.201031	2023-04-27 21:36:29.544074	1451	22	\N	7	7	\N	32	\N	5	\N	1450	-1	\N	-1	-1
f	2023-05-02 12:05:27.817751	\N	2023-05-02 12:31:09.135919	2023-05-02 12:05:27.813157	1620	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 12:05:27.834731	\N	2023-05-02 12:31:09.163714	2023-05-02 12:05:27.818358	1621	25	\N	18	18	\N	\N	\N	6	\N	1620	-1	\N	-1	-1
f	2023-05-02 12:05:27.8533	\N	2023-05-02 12:31:09.177812	2023-05-02 12:05:27.83535	1622	22	\N	18	18	67	\N	19	4	\N	1621	-1	\N	-1	-1
f	2023-05-02 12:05:27.863242	\N	2023-05-02 12:31:09.192644	2023-05-02 12:05:27.853875	1623	\N	\N	18	18	\N	\N	\N	\N	\N	1621	-1	\N	-1	-1
f	2023-04-25 14:13:11.687586	\N	2023-05-02 12:55:22.404157	2023-04-25 14:13:11.62542	1048	22	\N	29	29	\N	\N	\N	7	\N	1047	-1	\N	-1	-1
f	2023-05-02 12:55:22.618193	\N	2023-05-02 12:56:01.939395	2023-05-02 12:55:22.602194	1644	22	\N	29	29	\N	\N	\N	7	\N	1643	-1	\N	-1	-1
f	2023-04-18 12:57:45.833765	\N	2023-05-02 12:56:09.85519	2023-04-18 12:57:45.82417	949	\N	\N	30	30	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-10 11:16:02.207402	\N	2023-05-02 13:28:11.427775	2023-04-10 11:16:02.200202	728	\N	\N	21	21	\N	\N	\N	\N	\N	726	-1	\N	-1	-1
t	2023-05-02 13:28:45.203619	\N	\N	2023-05-02 13:28:45.198354	1701	\N	\N	22	22	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 13:28:45.222926	\N	\N	2023-05-02 13:28:45.204328	1702	\N	\N	22	22	\N	\N	\N	6	\N	1701	-1	\N	\N	-1
t	2023-05-02 13:28:45.232331	\N	\N	2023-05-02 13:28:45.223575	1703	\N	\N	22	22	\N	\N	\N	\N	\N	1702	-1	\N	\N	-1
t	2023-05-02 13:28:45.24132	\N	\N	2023-05-02 13:28:45.232905	1704	\N	\N	22	22	\N	\N	\N	6	\N	1702	-1	\N	\N	-1
t	2023-05-02 13:28:45.257951	\N	\N	2023-05-02 13:28:45.241882	1705	22	\N	22	22	68	\N	19	4	\N	1704	-1	\N	\N	-1
t	2023-05-02 13:28:45.269463	\N	\N	2023-05-02 13:28:45.258531	1706	\N	\N	22	22	\N	\N	\N	\N	\N	1704	-1	\N	\N	-1
f	2023-05-02 13:21:56.815428	\N	2023-05-04 08:54:09.057232	2023-05-02 13:21:56.809584	1688	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 13:21:56.833225	\N	2023-05-04 08:54:09.071963	2023-05-02 13:21:56.816187	1689	25	\N	18	18	\N	\N	\N	6	\N	1688	-1	\N	-1	-1
f	2023-05-02 13:21:56.859847	\N	2023-05-04 08:54:09.085446	2023-05-02 13:21:56.833841	1690	22	\N	18	18	67	\N	19	4	\N	1689	-1	\N	-1	-1
f	2023-05-02 13:21:56.877595	\N	2023-05-04 08:54:09.098847	2023-05-02 13:21:56.860752	1691	28	\N	18	18	90	\N	15	4	\N	1689	-1	\N	-1	-1
f	2023-04-17 15:26:04.608497	\N	2023-05-04 09:00:30.565882	2023-04-17 15:26:04.581253	902	\N	\N	28	28	\N	\N	\N	6	\N	901	-1	\N	-1	-1
f	2023-05-02 12:56:02.167161	\N	2023-05-04 09:11:04.609154	2023-05-02 12:56:02.158854	1672	22	\N	29	29	76	\N	16	4	\N	1671	-1	\N	-1	-1
f	2023-05-04 09:22:10.393115	\N	2023-05-04 09:23:16.406528	2023-05-04 09:22:10.388893	1823	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:22:10.409637	\N	2023-05-04 09:23:16.423411	2023-05-04 09:22:10.39368	1824	\N	\N	26	26	\N	\N	\N	6	\N	1823	-1	\N	-1	-1
f	2023-05-04 09:22:10.420206	\N	2023-05-04 09:23:16.436697	2023-05-04 09:22:10.410139	1825	22	\N	26	26	91	\N	13	4	\N	1824	-1	\N	-1	-1
f	2023-05-04 09:22:10.444861	\N	2023-05-04 09:23:16.450293	2023-05-04 09:22:10.42071	1826	24	\N	26	26	\N	\N	\N	6	\N	1824	-1	\N	-1	-1
f	2023-05-04 09:22:10.460222	\N	2023-05-04 09:23:16.465095	2023-05-04 09:22:10.445371	1827	22	\N	26	26	59	\N	16	4	\N	1826	-1	\N	-1	-1
f	2023-05-04 09:22:10.474301	\N	2023-05-04 09:23:16.47854	2023-05-04 09:22:10.460731	1828	53	\N	26	26	61	\N	16	4	\N	1826	-1	\N	-1	-1
f	2023-05-04 09:00:30.834085	\N	2023-05-04 09:29:07.55353	2023-05-04 09:00:30.816556	1764	\N	\N	28	28	\N	\N	\N	6	\N	1763	-1	\N	-1	-1
f	2023-05-04 09:11:04.8204	\N	2023-05-04 09:38:59.193686	2023-05-04 09:11:04.804877	1806	22	\N	29	29	76	\N	16	4	\N	1805	-1	\N	-1	-1
f	2023-05-04 09:29:07.840314	\N	2023-05-04 09:39:55.625451	2023-05-04 09:29:07.835586	1840	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:29:07.858233	\N	2023-05-04 09:39:55.653294	2023-05-04 09:29:07.840908	1841	\N	\N	28	28	\N	\N	\N	6	\N	1840	-1	\N	-1	-1
f	2023-05-04 09:29:07.868914	\N	2023-05-04 09:39:55.700326	2023-05-04 09:29:07.858808	1842	22	\N	28	28	\N	\N	\N	7	\N	1841	-1	\N	-1	-1
f	2023-05-04 09:29:07.878146	\N	2023-05-04 09:39:55.715015	2023-05-04 09:29:07.869481	1843	22	\N	28	28	\N	\N	\N	\N	\N	1842	-1	\N	-1	-1
f	2023-05-04 09:29:07.887083	\N	2023-05-04 09:39:55.725001	2023-05-04 09:29:07.878723	1844	22	\N	28	28	\N	\N	\N	6	\N	1843	-1	\N	-1	-1
f	2023-05-04 09:29:07.89595	\N	2023-05-04 09:39:55.785345	2023-05-04 09:29:07.887657	1845	\N	\N	28	28	\N	\N	\N	6	\N	1844	-1	\N	-1	-1
f	2023-05-04 09:29:07.912606	\N	2023-05-04 09:39:55.797154	2023-05-04 09:29:07.896593	1846	22	\N	28	28	68	\N	19	4	\N	1845	-1	\N	-1	-1
f	2023-05-04 09:29:07.929491	\N	2023-05-04 09:39:55.809813	2023-05-04 09:29:07.913204	1847	28	\N	28	28	74	\N	20	4	\N	1845	-1	\N	-1	-1
f	2023-05-04 09:29:07.939023	\N	2023-05-04 09:39:55.821217	2023-05-04 09:29:07.93008	1848	30	\N	28	28	\N	\N	\N	6	\N	1844	-1	\N	-1	-1
f	2023-05-04 09:29:07.957128	\N	2023-05-04 09:39:55.841699	2023-05-04 09:29:07.939596	1849	22	\N	28	28	68	\N	19	4	\N	1848	-1	\N	-1	-1
f	2023-05-04 09:29:07.977829	\N	2023-05-04 09:39:55.866813	2023-05-04 09:29:07.957722	1850	29	\N	28	28	75	\N	16	4	\N	1848	-1	\N	-1	-1
f	2023-05-04 09:29:07.987827	\N	2023-05-04 09:39:55.916204	2023-05-04 09:29:07.978662	1851	\N	\N	28	28	\N	\N	\N	6	\N	1843	-1	\N	-1	-1
f	2023-05-04 09:29:08.00342	\N	2023-05-04 09:39:55.924134	2023-05-04 09:29:07.988456	1852	22	\N	28	28	68	\N	19	4	\N	1851	-1	\N	-1	-1
f	2023-05-04 09:29:08.012683	\N	2023-05-04 09:39:55.931766	2023-05-04 09:29:08.004074	1853	22	\N	28	28	\N	\N	\N	\N	\N	1842	-1	\N	-1	-1
f	2023-05-04 09:29:08.030496	\N	2023-05-04 09:39:55.947138	2023-05-04 09:29:08.013256	1854	22	\N	28	28	73	\N	\N	\N	\N	1853	-1	\N	-1	-1
f	2023-05-04 09:29:08.040333	\N	2023-05-04 09:39:55.954091	2023-05-04 09:29:08.031081	1855	24	\N	28	28	\N	\N	\N	6	\N	1853	-1	\N	-1	-1
f	2023-05-04 09:29:08.049188	\N	2023-05-04 09:39:55.960909	2023-05-04 09:29:08.040907	1856	\N	\N	28	28	\N	\N	\N	\N	\N	1855	-1	\N	-1	-1
f	2023-05-04 09:29:08.05915	\N	2023-05-04 09:39:55.9683	2023-05-04 09:29:08.049775	1857	\N	\N	28	28	\N	\N	\N	\N	\N	1840	-1	\N	-1	-1
f	2023-05-04 09:38:59.203487	\N	2023-05-04 09:44:43.579835	2023-05-04 09:38:59.199453	1858	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:38:59.217654	\N	2023-05-04 09:44:43.594907	2023-05-04 09:38:59.203963	1859	22	\N	29	29	\N	\N	\N	7	\N	1858	-1	\N	-1	-1
f	2023-05-04 09:38:59.226734	\N	2023-05-04 09:44:43.610442	2023-05-04 09:38:59.21813	1860	22	\N	29	29	\N	\N	\N	\N	\N	1859	-1	\N	-1	-1
f	2023-05-04 09:38:59.234644	\N	2023-05-04 09:44:43.623609	2023-05-04 09:38:59.227254	1861	\N	\N	29	29	\N	\N	\N	6	\N	1860	-1	\N	-1	-1
f	2023-05-04 09:38:59.243305	\N	2023-05-04 09:44:43.637502	2023-05-04 09:38:59.235106	1862	22	\N	29	29	\N	\N	\N	6	\N	1861	-1	\N	-1	-1
f	2023-05-04 09:38:59.25748	\N	2023-05-04 09:44:43.677795	2023-05-04 09:38:59.243774	1863	22	\N	29	29	67	\N	19	4	\N	1862	-1	\N	-1	-1
f	2023-05-04 09:38:59.271812	\N	2023-05-04 09:44:43.691639	2023-05-04 09:38:59.257967	1864	27	\N	29	29	81	\N	20	4	\N	1862	-1	\N	-1	-1
f	2023-05-04 09:38:59.27984	\N	2023-05-04 09:44:43.707226	2023-05-04 09:38:59.272328	1865	\N	\N	29	29	\N	\N	\N	6	\N	1860	-1	\N	-1	-1
f	2023-05-04 09:38:59.2876	\N	2023-05-04 09:44:43.722571	2023-05-04 09:38:59.280346	1866	\N	\N	29	29	\N	\N	\N	6	\N	1865	-1	\N	-1	-1
f	2023-05-04 09:38:59.296313	\N	2023-05-04 09:44:43.735797	2023-05-04 09:38:59.287889	1867	22	\N	29	29	81	\N	20	4	\N	1866	-1	\N	-1	-1
f	2023-05-04 09:38:59.304359	\N	2023-05-04 09:44:43.749456	2023-05-04 09:38:59.296607	1868	23	\N	29	29	67	\N	19	4	\N	1866	-1	\N	-1	-1
f	2023-05-04 09:38:59.309031	\N	2023-05-04 09:44:43.763535	2023-05-04 09:38:59.304658	1869	22	\N	29	29	\N	\N	\N	\N	\N	1859	-1	\N	-1	-1
f	2023-05-04 09:38:59.324215	\N	2023-05-04 09:44:43.777927	2023-05-04 09:38:59.309319	1870	22	\N	29	29	77	\N	\N	\N	\N	1869	-1	\N	-1	-1
f	2023-05-04 09:38:59.333	\N	2023-05-04 09:44:43.802697	2023-05-04 09:38:59.324704	1871	24	\N	29	29	\N	\N	\N	6	\N	1869	-1	\N	-1	-1
f	2023-05-04 09:38:59.347407	\N	2023-05-04 09:44:43.833721	2023-05-04 09:38:59.333526	1872	22	\N	29	29	76	\N	16	4	\N	1871	-1	\N	-1	-1
f	2023-05-04 09:39:55.97408	\N	2023-05-04 09:46:44.55516	2023-05-04 09:39:55.971673	1873	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:39:55.981996	\N	2023-05-04 09:46:44.571729	2023-05-04 09:39:55.974398	1874	\N	\N	28	28	\N	\N	\N	6	\N	1873	-1	\N	-1	-1
f	2023-05-04 09:39:55.986379	\N	2023-05-04 09:46:44.602688	2023-05-04 09:39:55.982289	1875	22	\N	28	28	\N	\N	\N	7	\N	1874	-1	\N	-1	-1
f	2023-05-04 09:39:55.990755	\N	2023-05-04 09:46:44.635047	2023-05-04 09:39:55.986667	1876	22	\N	28	28	\N	\N	\N	\N	\N	1875	-1	\N	-1	-1
f	2023-05-04 09:39:55.995093	\N	2023-05-04 09:46:44.650263	2023-05-04 09:39:55.991046	1877	22	\N	28	28	\N	\N	\N	6	\N	1876	-1	\N	-1	-1
f	2023-05-04 09:39:55.999458	\N	2023-05-04 09:46:44.664916	2023-05-04 09:39:55.995377	1878	\N	\N	28	28	\N	\N	\N	6	\N	1877	-1	\N	-1	-1
f	2023-05-04 09:39:56.015804	\N	2023-05-04 09:46:44.692135	2023-05-04 09:39:56.007515	1880	28	\N	28	28	74	\N	20	4	\N	1878	-1	\N	-1	-1
f	2023-05-04 09:39:56.106388	\N	2023-05-04 09:46:44.705337	2023-05-04 09:39:56.016155	1881	30	\N	28	28	\N	\N	\N	6	\N	1877	-1	\N	-1	-1
f	2023-05-04 09:39:56.116339	\N	2023-05-04 09:46:44.731944	2023-05-04 09:39:56.106808	1882	22	\N	28	28	68	\N	19	4	\N	1881	-1	\N	-1	-1
f	2023-05-04 09:39:56.127799	\N	2023-05-04 09:46:44.746858	2023-05-04 09:39:56.116677	1883	29	\N	28	28	75	\N	16	4	\N	1881	-1	\N	-1	-1
f	2023-05-04 09:39:56.133125	\N	2023-05-04 09:46:44.765457	2023-05-04 09:39:56.128182	1884	\N	\N	28	28	\N	\N	\N	6	\N	1876	-1	\N	-1	-1
f	2023-05-04 09:44:43.843785	\N	2023-05-04 13:06:35.105038	2023-05-04 09:44:43.838973	1891	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-01-17 15:58:07.019064	\N	2023-01-17 16:23:13.384674	2023-01-17 15:58:07.013434	433	22	\N	9	9	\N	\N	\N	9	61	432	-1	\N	-1	-1
f	2023-01-17 18:15:55.614758	\N	2023-01-17 18:21:09.485184	2023-01-17 18:15:55.609744	510	22	\N	9	9	\N	\N	\N	9	61	509	-1	\N	-1	-1
f	2023-01-17 16:25:29.002612	\N	2023-01-17 18:15:55.450422	2023-01-17 16:25:28.996805	485	23	\N	9	9	\N	\N	\N	9	61	482	-1	\N	-1	-1
f	2023-04-27 20:55:55.122933	\N	2023-04-27 21:05:08.497796	2023-04-27 20:55:55.118626	1180	\N	\N	33	33	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 20:55:55.133528	\N	2023-04-27 21:05:08.505987	2023-04-27 20:55:55.123561	1181	22	\N	33	33	\N	\N	\N	7	\N	1180	-1	\N	-1	-1
f	2023-04-27 20:55:55.142899	\N	2023-04-27 21:05:08.513177	2023-04-27 20:55:55.134092	1182	22	\N	33	33	\N	\N	\N	\N	\N	1181	-1	\N	-1	-1
f	2023-04-27 20:55:55.152211	\N	2023-04-27 21:05:08.534241	2023-04-27 20:55:55.143459	1183	22	\N	33	33	\N	\N	\N	6	\N	1182	-1	\N	-1	-1
f	2023-04-27 20:55:55.164303	\N	2023-04-27 21:05:08.545382	2023-04-27 20:55:55.152779	1184	22	\N	33	33	\N	\N	\N	9	62	1183	-1	\N	-1	-1
f	2023-04-27 20:55:55.189927	\N	2023-04-27 21:05:08.630797	2023-04-27 20:55:55.164864	1185	22	\N	33	33	87	\N	13	4	\N	1184	-1	\N	-1	-1
f	2023-04-27 20:55:55.199924	\N	2023-04-27 21:05:08.648227	2023-04-27 20:55:55.190527	1186	\N	\N	33	33	\N	\N	\N	6	\N	1183	-1	\N	-1	-1
f	2023-04-27 20:55:55.212774	\N	2023-04-27 21:05:08.661439	2023-04-27 20:55:55.200555	1187	22	\N	33	33	\N	\N	\N	9	61	1186	-1	\N	-1	-1
f	2023-04-27 20:55:55.228356	\N	2023-04-27 21:05:08.676403	2023-04-27 20:55:55.213367	1188	22	\N	33	33	87	\N	13	4	\N	1187	-1	\N	-1	-1
f	2023-04-27 20:55:55.242758	\N	2023-04-27 21:05:08.691172	2023-04-27 20:55:55.228934	1189	53	\N	33	33	\N	\N	\N	9	62	1186	-1	\N	-1	-1
f	2023-04-27 20:55:55.258096	\N	2023-04-27 21:05:08.704456	2023-04-27 20:55:55.243322	1190	22	\N	33	33	26	\N	13	4	\N	1189	-1	\N	-1	-1
f	2023-04-27 20:55:55.268518	\N	2023-04-27 21:05:08.723675	2023-04-27 20:55:55.258679	1191	24	\N	33	33	\N	\N	\N	\N	\N	1182	-1	\N	-1	-1
f	2023-04-27 20:55:55.277895	\N	2023-04-27 21:05:08.787424	2023-04-27 20:55:55.269183	1192	22	\N	33	33	\N	\N	\N	\N	\N	1181	-1	\N	-1	-1
f	2023-04-27 20:55:55.420398	\N	2023-04-27 21:05:08.816937	2023-04-27 20:55:55.278452	1193	22	\N	33	33	89	\N	\N	\N	\N	1192	-1	\N	-1	-1
f	2023-04-27 20:55:55.475024	\N	2023-04-27 21:05:08.833428	2023-04-27 20:55:55.421013	1194	24	\N	33	33	\N	\N	\N	\N	\N	1192	-1	\N	-1	-1
f	2023-04-27 21:05:08.845439	\N	2023-04-27 21:06:21.309095	2023-04-27 21:05:08.840388	1195	\N	\N	33	33	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:05:08.861483	\N	2023-04-27 21:06:21.344551	2023-04-27 21:05:08.846085	1196	22	\N	33	33	\N	\N	\N	7	\N	1195	-1	\N	-1	-1
f	2023-04-27 21:05:08.871988	\N	2023-04-27 21:06:21.397129	2023-04-27 21:05:08.862059	1197	22	\N	33	33	\N	\N	\N	\N	\N	1196	-1	\N	-1	-1
f	2023-04-27 21:05:08.894389	\N	2023-04-27 21:06:21.407883	2023-04-27 21:05:08.872706	1198	22	\N	33	33	\N	\N	\N	6	\N	1197	-1	\N	-1	-1
f	2023-04-27 21:05:08.904181	\N	2023-04-27 21:06:21.416267	2023-04-27 21:05:08.894982	1199	22	\N	33	33	\N	\N	\N	9	\N	1198	-1	\N	-1	-1
f	2023-04-27 21:05:08.920847	\N	2023-04-27 21:06:21.468187	2023-04-27 21:05:08.904738	1200	22	\N	33	33	87	\N	13	4	\N	1199	-1	\N	-1	-1
f	2023-04-27 21:05:08.939692	\N	2023-04-27 21:06:21.475671	2023-04-27 21:05:08.921455	1201	\N	\N	33	33	\N	\N	\N	6	\N	1198	-1	\N	-1	-1
f	2023-04-27 21:05:08.948634	\N	2023-04-27 21:06:21.487354	2023-04-27 21:05:08.940304	1202	22	\N	33	33	\N	\N	\N	9	\N	1201	-1	\N	-1	-1
f	2023-04-27 21:05:08.964382	\N	2023-04-27 21:06:21.496083	2023-04-27 21:05:08.94919	1203	22	\N	33	33	87	\N	13	4	\N	1202	-1	\N	-1	-1
f	2023-04-27 21:05:08.978445	\N	2023-04-27 21:06:21.508996	2023-04-27 21:05:08.964953	1204	28	\N	33	33	\N	\N	\N	9	61	1201	-1	\N	-1	-1
f	2023-04-27 21:05:08.993919	\N	2023-04-27 21:06:21.518251	2023-04-27 21:05:08.979	1205	22	\N	33	33	26	\N	13	4	\N	1204	-1	\N	-1	-1
f	2023-04-27 21:05:09.0036	\N	2023-04-27 21:06:21.527299	2023-04-27 21:05:08.994514	1206	24	\N	33	33	\N	\N	\N	\N	\N	1197	-1	\N	-1	-1
f	2023-04-27 21:05:09.014224	\N	2023-04-27 21:06:21.587667	2023-04-27 21:05:09.004226	1207	22	\N	33	33	\N	\N	\N	\N	\N	1196	-1	\N	-1	-1
f	2023-04-27 21:05:09.035579	\N	2023-04-27 21:06:21.602937	2023-04-27 21:05:09.014785	1208	22	\N	33	33	89	\N	\N	\N	\N	1207	-1	\N	-1	-1
f	2023-04-27 21:05:09.045197	\N	2023-04-27 21:06:21.619384	2023-04-27 21:05:09.036287	1209	24	\N	33	33	\N	\N	\N	\N	\N	1207	-1	\N	-1	-1
f	2023-04-27 21:06:21.631989	\N	2023-04-27 21:07:36.452352	2023-04-27 21:06:21.627416	1210	\N	\N	33	33	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 21:06:21.64891	\N	2023-04-27 21:07:36.461094	2023-04-27 21:06:21.63263	1211	22	\N	33	33	\N	\N	\N	7	\N	1210	-1	\N	-1	-1
f	2023-04-27 21:06:21.661182	\N	2023-04-27 21:07:36.475399	2023-04-27 21:06:21.649518	1212	22	\N	33	33	\N	\N	\N	\N	\N	1211	-1	\N	-1	-1
f	2023-04-27 21:06:21.673158	\N	2023-04-27 21:07:36.522568	2023-04-27 21:06:21.661767	1213	22	\N	33	33	\N	\N	\N	6	\N	1212	-1	\N	-1	-1
f	2023-04-27 21:06:21.687215	\N	2023-04-27 21:07:36.530547	2023-04-27 21:06:21.674118	1214	22	\N	33	33	\N	\N	\N	9	\N	1213	-1	\N	-1	-1
f	2023-04-27 21:06:21.713016	\N	2023-04-27 21:07:36.537439	2023-04-27 21:06:21.688236	1215	22	\N	33	33	87	\N	13	4	\N	1214	-1	\N	-1	-1
f	2023-04-27 21:06:21.729143	\N	2023-04-27 21:07:36.544127	2023-04-27 21:06:21.71403	1216	\N	\N	33	33	\N	\N	\N	6	\N	1213	-1	\N	-1	-1
f	2023-04-27 21:06:21.743012	\N	2023-04-27 21:07:36.552477	2023-04-27 21:06:21.730133	1217	22	\N	33	33	\N	\N	\N	9	\N	1216	-1	\N	-1	-1
f	2023-04-27 21:06:21.770918	\N	2023-04-27 21:07:36.566487	2023-04-27 21:06:21.7439	1218	22	\N	33	33	87	\N	13	4	\N	1217	-1	\N	-1	-1
f	2023-04-27 21:06:21.783979	\N	2023-04-27 21:07:36.61289	2023-04-27 21:06:21.771939	1219	27	\N	33	33	\N	\N	\N	9	61	1216	-1	\N	-1	-1
f	2023-04-27 21:06:21.795367	\N	2023-04-27 21:07:36.623179	2023-04-27 21:06:21.78448	1220	22	\N	33	33	26	\N	13	4	\N	1219	-1	\N	-1	-1
f	2023-04-27 23:33:19.186804	\N	2023-05-02 09:12:39.865573	2023-04-27 23:33:19.180865	1498	\N	\N	7	7	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 23:33:19.217854	\N	2023-05-02 09:12:39.906715	2023-04-27 23:33:19.209232	1500	22	\N	7	7	\N	\N	\N	7	\N	1499	-1	\N	-1	-1
f	2023-04-27 23:33:19.228352	\N	2023-05-02 09:12:39.915313	2023-04-27 23:33:19.218413	1501	22	\N	7	7	\N	\N	\N	\N	\N	1500	-1	\N	-1	-1
f	2023-04-27 23:33:19.237345	\N	2023-05-02 09:12:39.925101	2023-04-27 23:33:19.228914	1502	22	\N	7	7	\N	\N	\N	6	\N	1501	-1	\N	-1	-1
f	2023-04-27 23:33:19.249818	\N	2023-05-02 09:12:39.935572	2023-04-27 23:33:19.237906	1503	\N	\N	7	7	\N	\N	\N	\N	\N	1502	-1	\N	-1	-1
f	2023-04-27 23:33:19.258744	\N	2023-05-02 09:12:39.948814	2023-04-27 23:33:19.25038	1504	22	\N	7	7	\N	\N	\N	9	\N	1503	-1	\N	-1	-1
f	2023-04-27 23:33:19.283979	\N	2023-05-02 09:12:39.97614	2023-04-27 23:33:19.275269	1506	53	\N	7	7	\N	\N	\N	9	\N	1503	-1	\N	-1	-1
f	2023-04-27 23:33:19.29292	\N	2023-05-02 09:12:39.989706	2023-04-27 23:33:19.284596	1507	22	\N	7	7	\N	32	\N	5	\N	1506	-1	\N	-1	-1
f	2023-04-27 23:33:19.307546	\N	2023-05-02 09:12:40.003039	2023-04-27 23:33:19.293492	1508	24	\N	7	7	\N	\N	\N	6	\N	1501	-1	\N	-1	-1
f	2023-04-27 23:33:19.316644	\N	2023-05-02 09:12:40.016673	2023-04-27 23:33:19.30818	1509	22	\N	7	7	\N	\N	\N	9	\N	1508	-1	\N	-1	-1
f	2023-04-27 23:33:19.325476	\N	2023-05-02 09:12:40.030002	2023-04-27 23:33:19.317198	1510	22	\N	7	7	\N	32	\N	5	\N	1509	-1	\N	-1	-1
f	2023-04-27 23:33:19.335524	\N	2023-05-02 09:12:40.046097	2023-04-27 23:33:19.326036	1511	23	\N	7	7	\N	\N	\N	9	\N	1508	-1	\N	-1	-1
f	2023-04-27 23:33:19.378937	\N	2023-05-02 09:12:40.081464	2023-04-27 23:33:19.370174	1513	22	\N	7	7	\N	\N	\N	\N	\N	1500	-1	\N	-1	-1
f	2023-04-27 23:33:19.399716	\N	2023-05-02 09:12:40.097893	2023-04-27 23:33:19.379494	1514	22	\N	7	7	85	\N	\N	\N	\N	1513	-1	\N	-1	-1
f	2023-04-27 23:33:19.409067	\N	2023-05-02 09:12:40.112215	2023-04-27 23:33:19.400355	1515	24	\N	7	7	\N	\N	\N	6	\N	1513	-1	\N	-1	-1
f	2023-04-27 23:33:19.417741	\N	2023-05-02 09:12:40.13874	2023-04-27 23:33:19.409625	1516	\N	\N	7	7	\N	\N	\N	6	\N	1515	-1	\N	-1	-1
f	2023-04-27 23:33:19.42842	\N	2023-05-02 09:12:40.152661	2023-04-27 23:33:19.418334	1517	\N	\N	7	7	\N	\N	\N	6	\N	1516	-1	\N	-1	-1
f	2023-04-27 23:33:19.43715	\N	2023-05-02 09:12:40.166853	2023-04-27 23:33:19.428977	1518	22	\N	7	7	\N	\N	\N	9	\N	1517	-1	\N	-1	-1
f	2023-04-27 23:33:19.45705	\N	2023-05-02 09:12:40.200539	2023-04-27 23:33:19.448852	1520	23	\N	7	7	\N	\N	\N	9	\N	1517	-1	\N	-1	-1
f	2023-04-27 23:33:19.472382	\N	2023-05-02 09:12:40.224172	2023-04-27 23:33:19.45761	1521	22	\N	7	7	86	\N	13	4	\N	1520	-1	\N	-1	-1
f	2023-04-27 23:33:19.49013	\N	2023-05-02 09:12:40.240448	2023-04-27 23:33:19.472963	1522	25	\N	7	7	27	\N	16	4	\N	1516	-1	\N	-1	-1
f	2023-04-27 23:33:19.500929	\N	2023-05-02 09:12:40.25549	2023-04-27 23:33:19.490803	1523	22	\N	7	7	\N	\N	\N	6	\N	1515	-1	\N	-1	-1
f	2023-04-27 23:33:19.526333	\N	2023-05-02 09:12:40.309254	2023-04-27 23:33:19.517196	1525	23	\N	7	7	\N	\N	\N	9	\N	1523	-1	\N	-1	-1
f	2023-04-27 23:33:19.541882	\N	2023-05-02 09:12:40.324015	2023-04-27 23:33:19.526894	1526	22	\N	7	7	86	\N	13	4	\N	1525	-1	\N	-1	-1
f	2023-04-27 23:33:19.559577	\N	2023-05-02 09:12:40.351769	2023-04-27 23:33:19.542455	1527	22	\N	7	7	28	\N	16	4	\N	1523	-1	\N	-1	-1
f	2023-04-27 23:33:19.569357	\N	2023-05-02 09:12:40.371972	2023-04-27 23:33:19.560214	1528	22	\N	7	7	\N	\N	\N	6	\N	1515	-1	\N	-1	-1
f	2023-04-27 23:33:19.578184	\N	2023-05-02 09:12:40.386626	2023-04-27 23:33:19.569976	1529	22	\N	7	7	\N	\N	\N	9	\N	1528	-1	\N	-1	-1
f	2023-04-27 23:33:19.616371	\N	2023-05-02 09:12:40.414416	2023-04-27 23:33:19.587903	1531	25	\N	7	7	27	\N	16	4	\N	1499	-1	\N	-1	-1
f	2023-04-27 21:06:21.807989	\N	2023-04-27 21:07:36.632806	2023-04-27 21:06:21.795833	1221	24	\N	33	33	\N	\N	\N	6	\N	1212	-1	\N	-1	-1
f	2023-04-27 21:06:21.821111	\N	2023-04-27 21:07:36.642518	2023-04-27 21:06:21.80855	1222	22	\N	33	33	87	\N	13	4	\N	1221	-1	\N	-1	-1
f	2023-04-27 21:06:21.829429	\N	2023-04-27 21:07:36.651908	2023-04-27 21:06:21.821665	1223	22	\N	33	33	\N	\N	\N	\N	\N	1211	-1	\N	-1	-1
f	2023-04-27 21:06:21.844438	\N	2023-04-27 21:07:36.6614	2023-04-27 21:06:21.82995	1224	22	\N	33	33	89	\N	\N	\N	\N	1223	-1	\N	-1	-1
f	2023-04-27 21:06:21.85222	\N	2023-04-27 21:07:36.668372	2023-04-27 21:06:21.845006	1225	24	\N	33	33	\N	\N	\N	\N	\N	1223	-1	\N	-1	-1
t	2023-04-27 21:07:36.673555	\N	\N	2023-04-27 21:07:36.671152	1226	\N	\N	33	33	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-27 21:07:36.682062	\N	\N	2023-04-27 21:07:36.673854	1227	22	\N	33	33	\N	\N	\N	7	\N	1226	-1	\N	\N	-1
t	2023-04-27 21:07:36.687375	\N	\N	2023-04-27 21:07:36.682385	1228	22	\N	33	33	\N	\N	\N	\N	\N	1227	-1	\N	\N	-1
t	2023-04-27 21:07:36.69194	\N	\N	2023-04-27 21:07:36.687676	1229	22	\N	33	33	\N	\N	\N	6	\N	1228	-1	\N	\N	-1
t	2023-04-27 21:07:36.696528	\N	\N	2023-04-27 21:07:36.692259	1230	22	\N	33	33	\N	\N	\N	9	\N	1229	-1	\N	\N	-1
t	2023-04-27 21:07:36.704668	\N	\N	2023-04-27 21:07:36.696811	1231	22	\N	33	33	87	\N	13	4	\N	1230	-1	\N	\N	-1
t	2023-04-27 21:07:36.709673	\N	\N	2023-04-27 21:07:36.704976	1232	\N	\N	33	33	\N	\N	\N	6	\N	1229	-1	\N	\N	-1
t	2023-04-27 21:07:36.714134	\N	\N	2023-04-27 21:07:36.709961	1233	22	\N	33	33	\N	\N	\N	9	\N	1232	-1	\N	\N	-1
t	2023-04-27 21:07:36.726722	\N	\N	2023-04-27 21:07:36.714417	1234	22	\N	33	33	87	\N	13	4	\N	1233	-1	\N	\N	-1
t	2023-04-27 21:07:36.732176	\N	\N	2023-04-27 21:07:36.72706	1235	27	\N	33	33	\N	\N	\N	9	\N	1232	-1	\N	\N	-1
t	2023-04-27 21:07:36.740076	\N	\N	2023-04-27 21:07:36.73247	1236	22	\N	33	33	26	\N	13	4	\N	1235	-1	\N	\N	-1
t	2023-04-27 21:07:36.74561	\N	\N	2023-04-27 21:07:36.7404	1237	24	\N	33	33	\N	\N	\N	6	\N	1228	-1	\N	\N	-1
t	2023-04-27 21:07:36.753448	\N	\N	2023-04-27 21:07:36.745894	1238	22	\N	33	33	87	\N	13	4	\N	1237	-1	\N	\N	-1
t	2023-04-27 21:07:36.761256	\N	\N	2023-04-27 21:07:36.753751	1239	22	\N	33	33	\N	\N	\N	\N	\N	1227	-1	\N	\N	-1
t	2023-04-27 21:07:36.779225	\N	\N	2023-04-27 21:07:36.761835	1240	22	\N	33	33	89	\N	\N	\N	\N	1239	-1	\N	\N	-1
t	2023-04-27 21:07:36.785893	\N	\N	2023-04-27 21:07:36.779634	1241	24	\N	33	33	\N	\N	\N	6	\N	1239	-1	\N	\N	-1
t	2023-04-27 21:07:36.796725	\N	\N	2023-04-27 21:07:36.786257	1242	22	\N	33	33	26	\N	13	4	\N	1241	-1	\N	\N	-1
f	2023-04-27 23:33:19.208668	\N	2023-05-02 09:12:39.897673	2023-04-27 23:33:19.187905	1499	22	\N	7	7	\N	\N	\N	9	\N	1498	-1	\N	-1	-1
f	2023-04-27 23:33:19.448289	\N	2023-05-02 09:12:40.180833	2023-04-27 23:33:19.437704	1519	22	\N	7	7	\N	32	\N	5	\N	1518	-1	\N	-1	-1
f	2023-04-27 23:33:19.516634	\N	2023-05-02 09:12:40.294107	2023-04-27 23:33:19.501489	1524	22	\N	7	7	27	\N	16	4	\N	1523	-1	\N	-1	-1
f	2023-04-25 14:13:11.773115	\N	2023-05-02 12:55:22.503558	2023-04-25 14:13:11.764909	1055	\N	\N	29	29	\N	\N	\N	6	\N	1054	-1	\N	-1	-1
f	2023-05-02 12:34:19.200892	\N	2023-05-02 13:21:56.762555	2023-05-02 12:34:19.18175	1630	22	\N	18	18	67	\N	19	4	\N	1629	-1	\N	-1	-1
f	2023-05-02 12:34:19.239857	\N	2023-05-02 13:21:56.790054	2023-05-02 12:34:19.20194	1631	28	\N	18	18	90	\N	15	4	\N	1629	-1	\N	-1	-1
t	2023-05-03 15:13:16.53137	\N	\N	2023-05-03 15:13:16.526568	1726	\N	\N	20	20	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-03 15:13:16.547245	\N	\N	2023-05-03 15:13:16.53196	1727	24	\N	20	20	\N	\N	\N	6	\N	1726	-1	\N	\N	-1
t	2023-05-03 15:13:16.556748	\N	\N	2023-05-03 15:13:16.547813	1728	\N	\N	20	20	\N	\N	\N	\N	\N	1727	-1	\N	\N	-1
t	2023-05-03 15:13:16.56575	\N	\N	2023-05-03 15:13:16.557314	1729	\N	\N	20	20	\N	\N	\N	6	\N	1727	-1	\N	\N	-1
t	2023-05-03 15:13:16.575427	\N	\N	2023-05-03 15:13:16.566312	1730	24	\N	20	20	\N	\N	\N	6	\N	1729	-1	\N	\N	-1
t	2023-05-03 15:13:16.585312	\N	\N	2023-05-03 15:13:16.575993	1731	\N	\N	20	20	\N	\N	\N	\N	\N	1730	-1	\N	\N	-1
t	2023-05-03 15:13:16.594227	\N	\N	2023-05-03 15:13:16.585929	1732	\N	\N	20	20	\N	\N	\N	\N	\N	1730	-1	\N	\N	-1
t	2023-05-03 15:13:16.603262	\N	\N	2023-05-03 15:13:16.594804	1733	\N	\N	20	20	\N	\N	\N	\N	\N	1729	-1	\N	\N	-1
t	2023-05-04 08:55:00.708744	\N	\N	2023-05-04 08:55:00.703959	1738	\N	\N	18	18	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 08:55:00.761659	\N	\N	2023-05-04 08:55:00.709353	1739	22	\N	18	18	\N	\N	\N	6	\N	1738	-1	\N	\N	-1
t	2023-05-04 08:55:00.784378	\N	\N	2023-05-04 08:55:00.762312	1740	22	\N	18	18	67	\N	19	4	\N	1739	-1	\N	\N	-1
t	2023-05-04 08:55:00.800889	\N	\N	2023-05-04 08:55:00.784987	1741	28	\N	18	18	90	\N	15	4	\N	1739	-1	\N	\N	-1
t	2023-05-04 08:59:30.204621	\N	\N	2023-05-04 08:59:30.199601	1748	\N	\N	24	24	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 08:59:30.223596	\N	\N	2023-05-04 08:59:30.206129	1749	\N	\N	24	24	\N	\N	\N	6	\N	1748	-1	\N	\N	-1
t	2023-05-04 08:59:30.232965	\N	\N	2023-05-04 08:59:30.224237	1750	\N	\N	24	24	\N	\N	\N	\N	\N	1749	-1	\N	\N	-1
t	2023-05-04 08:59:30.242233	\N	\N	2023-05-04 08:59:30.233592	1751	24	\N	24	24	\N	\N	\N	6	\N	1749	-1	\N	\N	-1
t	2023-05-04 08:59:30.251715	\N	\N	2023-05-04 08:59:30.242978	1752	\N	\N	24	24	\N	\N	\N	\N	\N	1751	-1	\N	\N	-1
t	2023-05-04 08:59:30.261256	\N	\N	2023-05-04 08:59:30.252374	1753	52	\N	24	24	\N	\N	\N	\N	\N	1751	-1	\N	\N	-1
f	2023-04-17 15:26:04.693433	\N	2023-05-04 09:00:30.652534	2023-04-17 15:26:04.674961	908	28	\N	28	28	74	\N	20	4	\N	906	-1	\N	-1	-1
f	2023-05-03 15:12:39.043102	\N	2023-05-04 09:06:00.837989	2023-05-03 15:12:39.038298	1713	\N	\N	17	17	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-03 15:12:39.074096	\N	2023-05-04 09:06:00.854843	2023-05-03 15:12:39.043688	1714	24	\N	17	17	\N	\N	\N	6	\N	1713	-1	\N	-1	-1
f	2023-05-03 15:12:39.083591	\N	2023-05-04 09:06:00.868484	2023-05-03 15:12:39.074419	1715	22	\N	17	17	47	\N	20	4	\N	1714	-1	\N	-1	-1
f	2023-05-03 15:12:39.089554	\N	2023-05-04 09:06:00.883543	2023-05-03 15:12:39.08388	1716	\N	\N	17	17	\N	\N	\N	6	\N	1714	-1	\N	-1	-1
f	2023-05-03 15:12:39.094172	\N	2023-05-04 09:06:00.897632	2023-05-03 15:12:39.089837	1717	27	\N	17	17	\N	\N	\N	6	\N	1716	-1	\N	-1	-1
f	2023-05-03 15:12:39.098816	\N	2023-05-04 09:06:00.912274	2023-05-03 15:12:39.094464	1718	22	\N	17	17	\N	29	\N	5	\N	1717	-1	\N	-1	-1
f	2023-05-03 15:12:39.106955	\N	2023-05-04 09:06:00.925919	2023-05-03 15:12:39.099128	1719	53	\N	17	17	67	\N	19	4	\N	1717	-1	\N	-1	-1
f	2023-05-04 09:17:23.524909	\N	2023-05-04 09:18:11.304963	2023-05-04 09:17:23.519969	1807	\N	\N	27	27	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:17:23.541525	\N	2023-05-04 09:18:11.322845	2023-05-04 09:17:23.525555	1808	\N	\N	27	27	\N	\N	\N	6	\N	1807	-1	\N	-1	-1
f	2023-05-04 09:17:23.551048	\N	2023-05-04 09:18:11.336508	2023-05-04 09:17:23.542277	1809	\N	\N	27	27	\N	\N	\N	\N	\N	1808	-1	\N	-1	-1
f	2023-05-04 09:17:23.575914	\N	2023-05-04 09:18:11.350013	2023-05-04 09:17:23.551618	1810	53	\N	27	27	63	\N	16	4	\N	1808	-1	\N	-1	-1
f	2023-05-04 08:59:13.162653	\N	2023-05-04 09:22:10.250749	2023-05-04 08:59:13.157998	1742	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 08:59:13.179215	\N	2023-05-04 09:22:10.286379	2023-05-04 08:59:13.163283	1743	\N	\N	26	26	\N	\N	\N	6	\N	1742	-1	\N	-1	-1
f	2023-05-04 08:59:13.18844	\N	2023-05-04 09:22:10.296857	2023-05-04 08:59:13.179791	1744	\N	\N	26	26	\N	\N	\N	\N	\N	1743	-1	\N	-1	-1
f	2023-05-04 08:59:13.19785	\N	2023-05-04 09:22:10.30417	2023-05-04 08:59:13.189098	1745	24	\N	26	26	\N	\N	\N	6	\N	1743	-1	\N	-1	-1
f	2023-05-04 08:59:13.215019	\N	2023-05-04 09:22:10.310985	2023-05-04 08:59:13.198473	1746	22	\N	26	26	59	\N	16	4	\N	1745	-1	\N	-1	-1
f	2023-05-04 08:59:13.232959	\N	2023-05-04 09:22:10.317772	2023-05-04 08:59:13.215658	1747	53	\N	26	26	61	\N	16	4	\N	1745	-1	\N	-1	-1
f	2023-05-04 09:00:30.815899	\N	2023-05-04 09:29:07.530662	2023-05-04 09:00:30.811221	1763	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:00:30.843671	\N	2023-05-04 09:29:07.570426	2023-05-04 09:00:30.834671	1765	22	\N	28	28	\N	\N	\N	7	\N	1764	-1	\N	-1	-1
f	2023-05-04 09:00:30.853184	\N	2023-05-04 09:29:07.59629	2023-05-04 09:00:30.844302	1766	22	\N	28	28	\N	\N	\N	\N	\N	1765	-1	\N	-1	-1
f	2023-05-04 09:00:30.86586	\N	2023-05-04 09:29:07.609861	2023-05-04 09:00:30.85378	1767	22	\N	28	28	\N	\N	\N	6	\N	1766	-1	\N	-1	-1
f	2023-05-04 09:00:30.875145	\N	2023-05-04 09:29:07.623634	2023-05-04 09:00:30.866436	1768	\N	\N	28	28	\N	\N	\N	6	\N	1767	-1	\N	-1	-1
f	2023-05-04 09:00:30.891437	\N	2023-05-04 09:29:07.636875	2023-05-04 09:00:30.875716	1769	22	\N	28	28	68	\N	19	4	\N	1768	-1	\N	-1	-1
f	2023-05-04 09:00:30.919218	\N	2023-05-04 09:29:07.6844	2023-05-04 09:00:30.909199	1771	30	\N	28	28	\N	\N	\N	6	\N	1767	-1	\N	-1	-1
f	2023-05-04 09:00:30.937955	\N	2023-05-04 09:29:07.697646	2023-05-04 09:00:30.921202	1772	22	\N	28	28	68	\N	19	4	\N	1771	-1	\N	-1	-1
f	2023-05-04 09:00:30.955911	\N	2023-05-04 09:29:07.717491	2023-05-04 09:00:30.938584	1773	29	\N	28	28	75	\N	16	4	\N	1771	-1	\N	-1	-1
f	2023-05-04 09:00:30.971722	\N	2023-05-04 09:29:07.731499	2023-05-04 09:00:30.956589	1774	\N	\N	28	28	\N	\N	\N	6	\N	1766	-1	\N	-1	-1
f	2023-05-04 09:00:30.987554	\N	2023-05-04 09:29:07.745394	2023-05-04 09:00:30.972398	1775	22	\N	28	28	68	\N	19	4	\N	1774	-1	\N	-1	-1
f	2023-05-04 09:00:30.997381	\N	2023-05-04 09:29:07.761271	2023-05-04 09:00:30.988205	1776	22	\N	28	28	\N	\N	\N	\N	\N	1765	-1	\N	-1	-1
f	2023-05-04 09:00:31.026255	\N	2023-05-04 09:29:07.788623	2023-05-04 09:00:31.016466	1778	24	\N	28	28	\N	\N	\N	6	\N	1776	-1	\N	-1	-1
f	2023-05-04 09:00:31.035729	\N	2023-05-04 09:29:07.817131	2023-05-04 09:00:31.026828	1779	\N	\N	28	28	\N	\N	\N	\N	\N	1778	-1	\N	-1	-1
f	2023-05-04 09:00:31.056993	\N	2023-05-04 09:29:07.830481	2023-05-04 09:00:31.036437	1780	\N	\N	28	28	\N	\N	\N	\N	\N	1763	-1	\N	-1	-1
f	2023-05-04 09:39:56.14089	\N	2023-05-04 09:46:44.779299	2023-05-04 09:39:56.133416	1885	22	\N	28	28	68	\N	19	4	\N	1884	-1	\N	-1	-1
f	2023-05-04 09:39:56.149105	\N	2023-05-04 09:46:44.800653	2023-05-04 09:39:56.141191	1886	22	\N	28	28	\N	\N	\N	\N	\N	1875	-1	\N	-1	-1
f	2023-05-04 09:39:56.158134	\N	2023-05-04 09:46:44.815107	2023-05-04 09:39:56.149415	1887	22	\N	28	28	73	\N	\N	\N	\N	1886	-1	\N	-1	-1
f	2023-05-04 09:39:56.163736	\N	2023-05-04 09:46:44.829954	2023-05-04 09:39:56.158435	1888	24	\N	28	28	\N	\N	\N	6	\N	1886	-1	\N	-1	-1
f	2023-05-04 09:39:56.168075	\N	2023-05-04 09:46:44.856505	2023-05-04 09:39:56.16405	1889	\N	\N	28	28	\N	\N	\N	\N	\N	1888	-1	\N	-1	-1
f	2023-05-04 09:39:56.176791	\N	2023-05-04 09:46:44.880492	2023-05-04 09:39:56.169079	1890	\N	\N	28	28	\N	\N	\N	\N	\N	1873	-1	\N	-1	-1
f	2023-05-04 09:39:56.007216	\N	2023-05-04 09:46:44.678242	2023-05-04 09:39:55.999746	1879	22	\N	28	28	68	\N	19	4	\N	1878	-1	\N	-1	-1
f	2023-05-04 09:46:44.890281	\N	2023-05-04 09:51:43.190614	2023-05-04 09:46:44.885435	1906	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:46:44.907508	\N	2023-05-04 09:51:43.205759	2023-05-04 09:46:44.890892	1907	\N	\N	28	28	\N	\N	\N	6	\N	1906	-1	\N	-1	-1
f	2023-05-04 09:46:44.917163	\N	2023-05-04 09:51:43.222171	2023-05-04 09:46:44.908128	1908	22	\N	28	28	\N	\N	\N	7	\N	1907	-1	\N	-1	-1
f	2023-05-04 09:46:44.93861	\N	2023-05-04 09:51:43.235681	2023-05-04 09:46:44.917728	1909	22	\N	28	28	\N	\N	\N	\N	\N	1908	-1	\N	-1	-1
f	2023-05-04 09:46:44.94879	\N	2023-05-04 09:51:43.249438	2023-05-04 09:46:44.93918	1910	22	\N	28	28	\N	\N	\N	6	\N	1909	-1	\N	-1	-1
f	2023-05-04 09:46:44.958271	\N	2023-05-04 09:51:43.264571	2023-05-04 09:46:44.949357	1911	\N	\N	28	28	\N	\N	\N	6	\N	1910	-1	\N	-1	-1
f	2023-05-04 09:46:44.974391	\N	2023-05-04 09:51:43.279434	2023-05-04 09:46:44.958843	1912	22	\N	28	28	68	\N	19	4	\N	1911	-1	\N	-1	-1
f	2023-05-04 09:46:44.990566	\N	2023-05-04 09:51:43.293399	2023-05-04 09:46:44.974967	1913	28	\N	28	28	74	\N	20	4	\N	1911	-1	\N	-1	-1
f	2023-05-04 09:46:45.001082	\N	2023-05-04 09:51:43.306702	2023-05-04 09:46:44.991197	1914	30	\N	28	28	\N	\N	\N	6	\N	1910	-1	\N	-1	-1
f	2023-05-04 09:46:45.017913	\N	2023-05-04 09:51:43.32475	2023-05-04 09:46:45.001678	1915	22	\N	28	28	68	\N	19	4	\N	1914	-1	\N	-1	-1
f	2023-05-04 09:46:45.035122	\N	2023-05-04 09:51:43.341951	2023-05-04 09:46:45.018499	1916	29	\N	28	28	75	\N	16	4	\N	1914	-1	\N	-1	-1
f	2023-05-04 09:46:45.045024	\N	2023-05-04 09:51:43.356124	2023-05-04 09:46:45.035794	1917	\N	\N	28	28	\N	\N	\N	6	\N	1909	-1	\N	-1	-1
f	2023-05-04 09:46:45.060778	\N	2023-05-04 09:51:43.369854	2023-05-04 09:46:45.045585	1918	22	\N	28	28	68	\N	19	4	\N	1917	-1	\N	-1	-1
f	2023-05-04 09:46:45.069997	\N	2023-05-04 09:51:43.384597	2023-05-04 09:46:45.061364	1919	22	\N	28	28	\N	\N	\N	\N	\N	1908	-1	\N	-1	-1
f	2023-05-04 09:46:45.087658	\N	2023-05-04 09:51:43.398961	2023-05-04 09:46:45.070628	1920	22	\N	28	28	73	\N	\N	\N	\N	1919	-1	\N	-1	-1
f	2023-05-04 09:46:45.098043	\N	2023-05-04 09:51:43.413447	2023-05-04 09:46:45.088348	1921	24	\N	28	28	\N	\N	\N	6	\N	1919	-1	\N	-1	-1
f	2023-05-04 09:46:45.106754	\N	2023-05-04 09:51:43.428358	2023-05-04 09:46:45.098614	1922	\N	\N	28	28	\N	\N	\N	\N	\N	1921	-1	\N	-1	-1
f	2023-05-04 09:46:45.115619	\N	2023-05-04 09:51:43.442328	2023-05-04 09:46:45.107332	1923	\N	\N	28	28	\N	\N	\N	\N	\N	1906	-1	\N	-1	-1
f	2023-05-04 09:51:43.452478	\N	2023-05-04 09:54:08.541367	2023-05-04 09:51:43.44775	1924	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:51:43.468965	\N	2023-05-04 09:54:08.556492	2023-05-04 09:51:43.453068	1925	\N	\N	28	28	\N	\N	\N	6	\N	1924	-1	\N	-1	-1
f	2023-05-04 09:51:43.479319	\N	2023-05-04 09:54:08.570528	2023-05-04 09:51:43.469558	1926	22	\N	28	28	\N	\N	\N	7	\N	1925	-1	\N	-1	-1
f	2023-05-04 09:51:43.488444	\N	2023-05-04 09:54:08.588961	2023-05-04 09:51:43.479952	1927	22	\N	28	28	\N	\N	\N	\N	\N	1926	-1	\N	-1	-1
f	2023-05-04 09:51:43.497656	\N	2023-05-04 09:54:08.602875	2023-05-04 09:51:43.489017	1928	22	\N	28	28	\N	\N	\N	6	\N	1927	-1	\N	-1	-1
f	2023-05-04 09:51:43.506798	\N	2023-05-04 09:54:08.61757	2023-05-04 09:51:43.498253	1929	\N	\N	28	28	\N	\N	\N	6	\N	1928	-1	\N	-1	-1
f	2023-05-04 09:51:43.531875	\N	2023-05-04 09:54:08.631245	2023-05-04 09:51:43.507371	1930	22	\N	28	28	68	\N	19	4	\N	1929	-1	\N	-1	-1
f	2023-05-04 09:51:43.54885	\N	2023-05-04 09:54:08.645704	2023-05-04 09:51:43.532539	1931	28	\N	28	28	74	\N	20	4	\N	1929	-1	\N	-1	-1
f	2023-05-04 09:51:43.55834	\N	2023-05-04 09:54:08.667706	2023-05-04 09:51:43.549457	1932	30	\N	28	28	\N	\N	\N	6	\N	1928	-1	\N	-1	-1
f	2023-05-04 09:51:43.573853	\N	2023-05-04 09:54:08.68227	2023-05-04 09:51:43.558907	1933	22	\N	28	28	68	\N	19	4	\N	1932	-1	\N	-1	-1
f	2023-05-04 09:51:43.591203	\N	2023-05-04 09:54:08.705232	2023-05-04 09:51:43.574504	1934	29	\N	28	28	75	\N	16	4	\N	1932	-1	\N	-1	-1
f	2023-05-04 09:51:43.600786	\N	2023-05-04 09:54:08.728265	2023-05-04 09:51:43.59179	1935	\N	\N	28	28	\N	\N	\N	6	\N	1927	-1	\N	-1	-1
f	2023-05-04 09:51:43.622881	\N	2023-05-04 09:54:08.741429	2023-05-04 09:51:43.601352	1936	22	\N	28	28	68	\N	19	4	\N	1935	-1	\N	-1	-1
f	2023-05-04 09:51:43.633262	\N	2023-05-04 09:54:08.754695	2023-05-04 09:51:43.623464	1937	22	\N	28	28	\N	\N	\N	\N	\N	1926	-1	\N	-1	-1
f	2023-05-04 09:51:43.667482	\N	2023-05-04 09:54:08.768812	2023-05-04 09:51:43.63401	1938	22	\N	28	28	73	\N	\N	\N	\N	1937	-1	\N	-1	-1
f	2023-05-04 09:51:43.678888	\N	2023-05-04 09:54:08.784382	2023-05-04 09:51:43.668186	1939	24	\N	28	28	\N	\N	\N	6	\N	1937	-1	\N	-1	-1
f	2023-05-04 09:51:43.693484	\N	2023-05-04 09:54:08.800255	2023-05-04 09:51:43.679485	1940	\N	\N	28	28	\N	\N	\N	\N	\N	1939	-1	\N	-1	-1
f	2023-05-04 09:51:43.702459	\N	2023-05-04 09:54:08.814895	2023-05-04 09:51:43.694091	1941	\N	\N	28	28	\N	\N	\N	\N	\N	1924	-1	\N	-1	-1
f	2023-05-04 09:27:20.961638	\N	2023-05-04 09:59:27.22365	2023-05-04 09:27:20.956901	1834	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:27:20.977751	\N	2023-05-04 09:59:27.246547	2023-05-04 09:27:20.962264	1835	\N	\N	26	26	\N	\N	\N	6	\N	1834	-1	\N	-1	-1
f	2023-05-04 09:59:27.415207	\N	2023-05-04 10:03:03.499722	2023-05-04 09:59:27.392955	1961	\N	\N	26	26	\N	\N	\N	6	\N	1960	-1	\N	-1	-1
f	2023-05-04 09:59:27.425194	\N	2023-05-04 10:03:03.514161	2023-05-04 09:59:27.41585	1962	22	\N	26	26	\N	\N	\N	7	\N	1961	-1	\N	-1	-1
f	2023-05-04 09:59:27.444342	\N	2023-05-04 10:03:03.555709	2023-05-04 09:59:27.435136	1964	22	\N	26	26	\N	\N	\N	6	\N	1963	-1	\N	-1	-1
f	2023-05-04 09:59:27.453353	\N	2023-05-04 10:03:03.573736	2023-05-04 09:59:27.444924	1965	22	\N	26	26	\N	28	\N	5	\N	1964	-1	\N	-1	-1
f	2023-05-04 09:59:27.462398	\N	2023-05-04 10:03:03.593569	2023-05-04 09:59:27.453932	1966	\N	\N	26	26	\N	\N	\N	6	\N	1963	-1	\N	-1	-1
f	2023-05-04 09:59:27.472499	\N	2023-05-04 10:03:03.607456	2023-05-04 09:59:27.462974	1967	24	\N	26	26	\N	\N	\N	6	\N	1966	-1	\N	-1	-1
f	2023-05-04 09:59:27.494462	\N	2023-05-04 10:03:03.622675	2023-05-04 09:59:27.473097	1968	22	\N	26	26	92	\N	16	4	\N	1967	-1	\N	-1	-1
f	2023-05-04 09:54:08.825049	\N	2023-05-04 10:17:26.722048	2023-05-04 09:54:08.820104	1942	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:54:08.841917	\N	2023-05-04 10:17:26.736947	2023-05-04 09:54:08.825756	1943	\N	\N	28	28	\N	\N	\N	6	\N	1942	-1	\N	-1	-1
f	2023-05-04 09:54:08.863158	\N	2023-05-04 10:17:26.750969	2023-05-04 09:54:08.842547	1944	22	\N	28	28	\N	\N	\N	7	\N	1943	-1	\N	-1	-1
f	2023-05-04 09:54:08.873219	\N	2023-05-04 10:17:26.765449	2023-05-04 09:54:08.863803	1945	22	\N	28	28	\N	\N	\N	\N	\N	1944	-1	\N	-1	-1
f	2023-05-04 09:54:08.883922	\N	2023-05-04 10:17:26.780666	2023-05-04 09:54:08.8738	1946	22	\N	28	28	\N	\N	\N	6	\N	1945	-1	\N	-1	-1
f	2023-05-04 09:54:08.892914	\N	2023-05-04 10:17:26.794333	2023-05-04 09:54:08.884559	1947	\N	\N	28	28	\N	\N	\N	6	\N	1946	-1	\N	-1	-1
f	2023-05-04 09:54:08.937878	\N	2023-05-04 10:17:26.847997	2023-05-04 09:54:08.921649	1949	28	\N	28	28	74	\N	20	4	\N	1947	-1	\N	-1	-1
f	2023-05-04 09:54:08.947396	\N	2023-05-04 10:17:26.862383	2023-05-04 09:54:08.938472	1950	30	\N	28	28	\N	\N	\N	6	\N	1946	-1	\N	-1	-1
f	2023-05-04 09:54:08.962964	\N	2023-05-04 10:17:26.889156	2023-05-04 09:54:08.947976	1951	22	\N	28	28	68	\N	19	4	\N	1950	-1	\N	-1	-1
f	2023-05-04 09:54:08.979739	\N	2023-05-04 10:17:26.905714	2023-05-04 09:54:08.963544	1952	29	\N	28	28	75	\N	16	4	\N	1950	-1	\N	-1	-1
f	2023-05-04 09:54:08.990777	\N	2023-05-04 10:17:26.920336	2023-05-04 09:54:08.980428	1953	\N	\N	28	28	\N	\N	\N	6	\N	1945	-1	\N	-1	-1
f	2023-05-04 09:54:09.018346	\N	2023-05-04 10:17:26.948118	2023-05-04 09:54:09.007258	1955	22	\N	28	28	\N	\N	\N	\N	\N	1944	-1	\N	-1	-1
f	2023-05-04 09:54:09.037221	\N	2023-05-04 10:17:26.961407	2023-05-04 09:54:09.018936	1956	22	\N	28	28	73	\N	\N	\N	\N	1955	-1	\N	-1	-1
f	2023-05-04 09:54:09.04951	\N	2023-05-04 10:17:26.975313	2023-05-04 09:54:09.037863	1957	24	\N	28	28	\N	\N	\N	6	\N	1955	-1	\N	-1	-1
f	2023-05-04 09:54:09.058367	\N	2023-05-04 10:17:26.998055	2023-05-04 09:54:09.050082	1958	\N	\N	28	28	\N	\N	\N	\N	\N	1957	-1	\N	-1	-1
f	2023-05-04 09:54:09.06762	\N	2023-05-04 10:17:27.015622	2023-05-04 09:54:09.05899	1959	\N	\N	28	28	\N	\N	\N	\N	\N	1942	-1	\N	-1	-1
t	2023-05-04 13:01:25.27404	\N	\N	2023-05-04 13:01:25.265411	2111	\N	\N	36	36	\N	\N	\N	6	\N	2110	-1	\N	\N	-1
f	2023-05-04 09:44:43.878995	\N	2023-05-04 13:06:35.151082	2023-05-04 09:44:43.870363	1894	\N	\N	29	29	\N	\N	\N	6	\N	1893	-1	\N	-1	-1
f	2023-05-04 09:44:43.922212	\N	2023-05-04 13:06:35.180687	2023-05-04 09:44:43.888284	1896	22	\N	29	29	67	\N	19	4	\N	1895	-1	\N	-1	-1
f	2023-05-04 09:44:43.938212	\N	2023-05-04 13:06:35.194793	2023-05-04 09:44:43.92279	1897	27	\N	29	29	81	\N	20	4	\N	1895	-1	\N	-1	-1
f	2023-05-04 09:44:43.947363	\N	2023-05-04 13:06:35.227631	2023-05-04 09:44:43.938797	1898	\N	\N	29	29	\N	\N	\N	6	\N	1893	-1	\N	-1	-1
f	2023-05-04 09:44:43.956212	\N	2023-05-04 13:06:35.24186	2023-05-04 09:44:43.947923	1899	\N	\N	29	29	\N	\N	\N	6	\N	1898	-1	\N	-1	-1
f	2023-05-04 09:44:43.986194	\N	2023-05-04 13:06:35.255674	2023-05-04 09:44:43.95678	1900	22	\N	29	29	81	\N	20	4	\N	1899	-1	\N	-1	-1
f	2023-05-04 09:44:44.011617	\N	2023-05-04 13:06:35.285441	2023-05-04 09:44:44.002788	1902	22	\N	29	29	\N	\N	\N	\N	\N	1892	-1	\N	-1	-1
f	2023-05-04 09:44:44.030866	\N	2023-05-04 13:06:35.298964	2023-05-04 09:44:44.013308	1903	22	\N	29	29	77	\N	\N	\N	\N	1902	-1	\N	-1	-1
f	2023-05-04 09:44:44.040961	\N	2023-05-04 13:06:35.312979	2023-05-04 09:44:44.031471	1904	24	\N	29	29	\N	\N	\N	6	\N	1902	-1	\N	-1	-1
f	2023-05-04 09:44:44.05651	\N	2023-05-04 13:06:35.328633	2023-05-04 09:44:44.041548	1905	22	\N	29	29	76	\N	16	4	\N	1904	-1	\N	-1	-1
f	2023-05-04 09:59:27.526741	\N	2023-05-04 10:03:03.655228	2023-05-04 09:59:27.515721	1970	22	\N	26	26	\N	\N	\N	\N	\N	1962	-1	\N	-1	-1
f	2023-05-04 09:59:27.686621	\N	2023-05-04 10:03:03.669062	2023-05-04 09:59:27.527361	1971	22	\N	26	26	93	\N	\N	\N	\N	1970	-1	\N	-1	-1
f	2023-05-04 09:59:27.707855	\N	2023-05-04 10:03:03.697911	2023-05-04 09:59:27.687356	1972	24	\N	26	26	\N	\N	\N	6	\N	1970	-1	\N	-1	-1
f	2023-05-04 09:59:27.724151	\N	2023-05-04 10:03:03.711613	2023-05-04 09:59:27.708525	1973	22	\N	26	26	76	\N	16	4	\N	1972	-1	\N	-1	-1
f	2023-05-04 09:54:09.006675	\N	2023-05-04 10:17:26.934076	2023-05-04 09:54:08.991375	1954	22	\N	28	28	68	\N	19	4	\N	1953	-1	\N	-1	-1
f	2023-04-10 12:12:47.885675	\N	2023-05-04 10:40:38.218272	2023-04-10 12:12:47.877653	773	52	\N	25	25	\N	\N	\N	\N	\N	771	-1	\N	-1	-1
t	2023-05-04 10:42:35.255425	\N	\N	2023-05-04 10:42:35.250814	2021	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 10:42:35.277045	\N	\N	2023-05-04 10:42:35.256015	2022	\N	\N	26	26	\N	\N	\N	6	\N	2021	-1	\N	\N	-1
t	2023-05-04 10:42:35.289788	\N	\N	2023-05-04 10:42:35.277644	2023	22	\N	26	26	\N	\N	\N	7	\N	2022	-1	\N	\N	-1
t	2023-05-04 10:42:35.299055	\N	\N	2023-05-04 10:42:35.290374	2024	22	\N	26	26	\N	\N	\N	\N	\N	2023	-1	\N	\N	-1
t	2023-05-04 10:42:35.309656	\N	\N	2023-05-04 10:42:35.299696	2025	22	\N	26	26	\N	\N	\N	6	\N	2024	-1	\N	\N	-1
t	2023-05-04 10:42:35.318445	\N	\N	2023-05-04 10:42:35.310222	2026	22	\N	26	26	\N	28	\N	5	\N	2025	-1	\N	\N	-1
t	2023-05-04 10:42:35.327754	\N	\N	2023-05-04 10:42:35.319016	2027	\N	\N	26	26	\N	\N	\N	6	\N	2024	-1	\N	\N	-1
t	2023-05-04 10:42:35.336531	\N	\N	2023-05-04 10:42:35.328375	2028	24	\N	26	26	\N	\N	\N	6	\N	2027	-1	\N	\N	-1
t	2023-05-04 10:42:35.36057	\N	\N	2023-05-04 10:42:35.337097	2029	22	\N	26	26	92	\N	16	4	\N	2028	-1	\N	\N	-1
t	2023-05-04 10:42:35.376399	\N	\N	2023-05-04 10:42:35.361152	2030	53	\N	26	26	61	\N	16	4	\N	2028	-1	\N	\N	-1
t	2023-05-04 10:42:35.387604	\N	\N	2023-05-04 10:42:35.377108	2031	22	\N	26	26	\N	\N	\N	\N	\N	2023	-1	\N	\N	-1
t	2023-05-04 10:42:35.408956	\N	\N	2023-05-04 10:42:35.388214	2032	22	\N	26	26	93	\N	\N	\N	\N	2031	-1	\N	\N	-1
t	2023-05-04 10:42:35.418559	\N	\N	2023-05-04 10:42:35.409541	2033	24	\N	26	26	\N	\N	\N	6	\N	2031	-1	\N	\N	-1
t	2023-05-04 10:42:35.434438	\N	\N	2023-05-04 10:42:35.419123	2034	22	\N	26	26	76	\N	16	4	\N	2033	-1	\N	\N	-1
t	2023-05-04 10:42:35.450687	\N	\N	2023-05-04 10:42:35.435029	2035	56	\N	26	26	94	\N	18	4	\N	2022	-1	\N	\N	-1
f	2023-05-04 10:17:27.061257	\N	2023-05-04 10:44:01.910874	2023-05-04 10:17:27.05695	1989	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:17:27.078388	\N	2023-05-04 10:44:01.925727	2023-05-04 10:17:27.061901	1990	22	\N	28	28	\N	\N	\N	6	\N	1989	-1	\N	-1	-1
f	2023-05-04 10:17:27.087654	\N	2023-05-04 10:44:01.940425	2023-05-04 10:17:27.078958	1991	22	\N	28	28	\N	\N	\N	7	\N	1990	-1	\N	-1	-1
f	2023-05-04 10:17:27.097337	\N	2023-05-04 10:44:01.956009	2023-05-04 10:17:27.088301	1992	22	\N	28	28	\N	\N	\N	\N	\N	1991	-1	\N	-1	-1
f	2023-05-04 10:17:27.106842	\N	2023-05-04 10:44:01.971081	2023-05-04 10:17:27.097911	1993	22	\N	28	28	\N	\N	\N	6	\N	1992	-1	\N	-1	-1
f	2023-05-04 10:17:27.116557	\N	2023-05-04 10:44:01.984675	2023-05-04 10:17:27.107403	1994	\N	\N	28	28	\N	\N	\N	6	\N	1993	-1	\N	-1	-1
f	2023-05-04 10:17:27.132472	\N	2023-05-04 10:44:01.999684	2023-05-04 10:17:27.117122	1995	22	\N	28	28	68	\N	19	4	\N	1994	-1	\N	-1	-1
f	2023-05-04 10:17:27.148761	\N	2023-05-04 10:44:02.013086	2023-05-04 10:17:27.133111	1996	28	\N	28	28	74	\N	20	4	\N	1994	-1	\N	-1	-1
f	2023-05-04 10:17:27.158057	\N	2023-05-04 10:44:02.026527	2023-05-04 10:17:27.149344	1997	30	\N	28	28	\N	\N	\N	6	\N	1993	-1	\N	-1	-1
f	2023-05-04 10:17:27.175522	\N	2023-05-04 10:44:02.03987	2023-05-04 10:17:27.158625	1998	22	\N	28	28	68	\N	19	4	\N	1997	-1	\N	-1	-1
f	2023-05-04 10:17:27.202972	\N	2023-05-04 10:44:02.054014	2023-05-04 10:17:27.176161	1999	29	\N	28	28	75	\N	16	4	\N	1997	-1	\N	-1	-1
f	2023-05-04 10:17:27.213771	\N	2023-05-04 10:44:02.068151	2023-05-04 10:17:27.203592	2000	\N	\N	28	28	\N	\N	\N	6	\N	1992	-1	\N	-1	-1
f	2023-05-04 10:17:27.23296	\N	2023-05-04 10:44:02.08163	2023-05-04 10:17:27.214337	2001	24	\N	28	28	\N	\N	\N	6	\N	2000	-1	\N	-1	-1
f	2023-05-04 10:17:27.24872	\N	2023-05-04 10:44:02.096808	2023-05-04 10:17:27.233535	2002	22	\N	28	28	92	\N	16	4	\N	2001	-1	\N	-1	-1
f	2023-05-04 10:17:27.2648	\N	2023-05-04 10:44:02.111248	2023-05-04 10:17:27.249298	2003	53	\N	28	28	61	\N	16	4	\N	2001	-1	\N	-1	-1
f	2023-05-04 10:17:27.275399	\N	2023-05-04 10:44:02.124578	2023-05-04 10:17:27.265387	2004	22	\N	28	28	\N	\N	\N	\N	\N	1991	-1	\N	-1	-1
f	2023-05-04 10:17:27.29407	\N	2023-05-04 10:44:02.13755	2023-05-04 10:17:27.275992	2005	22	\N	28	28	73	\N	\N	\N	\N	2004	-1	\N	-1	-1
f	2023-05-04 10:17:27.307002	\N	2023-05-04 10:44:02.150535	2023-05-04 10:17:27.294693	2006	24	\N	28	28	\N	\N	\N	6	\N	2004	-1	\N	-1	-1
f	2023-05-04 10:17:27.323625	\N	2023-05-04 10:44:02.173659	2023-05-04 10:17:27.307602	2007	22	\N	28	28	76	\N	16	4	\N	2006	-1	\N	-1	-1
f	2023-05-04 10:17:27.335823	\N	2023-05-04 10:44:02.187496	2023-05-04 10:17:27.324264	2008	53	\N	28	28	95	\N	18	4	\N	1990	-1	\N	-1	-1
f	2023-05-04 10:39:20.413409	\N	2023-05-04 11:51:18.140919	2023-05-04 10:39:20.408804	2018	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:39:20.440356	\N	2023-05-04 11:51:18.155322	2023-05-04 10:39:20.413999	2019	22	\N	10	10	29	\N	13	4	\N	2018	-1	\N	-1	-1
f	2023-05-04 10:39:20.457504	\N	2023-05-04 11:51:18.170449	2023-05-04 10:39:20.440944	2020	56	\N	10	10	96	\N	12	4	\N	2018	-1	\N	-1	-1
f	2023-05-04 09:59:27.392281	\N	2023-05-04 10:03:03.429202	2023-05-04 09:59:27.387263	1960	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 09:54:08.920989	\N	2023-05-04 10:17:26.815802	2023-05-04 09:54:08.893481	1948	22	\N	28	28	68	\N	19	4	\N	1947	-1	\N	-1	-1
f	2023-05-04 10:18:39.166534	\N	2023-05-04 10:28:20.230296	2023-05-04 10:18:39.161502	2009	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:18:39.189647	\N	2023-05-04 10:28:20.244457	2023-05-04 10:18:39.167267	2010	22	\N	10	10	29	\N	13	4	\N	2009	-1	\N	-1	-1
f	2023-05-04 10:18:39.19961	\N	2023-05-04 10:28:20.258367	2023-05-04 10:18:39.190274	2011	\N	\N	10	10	\N	\N	\N	\N	\N	2009	-1	\N	-1	-1
f	2023-04-10 12:12:47.813592	\N	2023-05-04 10:40:38.160741	2023-04-10 12:12:47.809484	766	\N	\N	25	25	\N	\N	\N	6	\N	764	-1	\N	-1	-1
f	2023-05-04 10:03:03.759143	\N	2023-05-04 10:42:35.029291	2023-05-04 10:03:03.754524	1974	\N	\N	26	26	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:03:03.775358	\N	2023-05-04 10:42:35.043656	2023-05-04 10:03:03.759733	1975	\N	\N	26	26	\N	\N	\N	6	\N	1974	-1	\N	-1	-1
f	2023-05-04 10:03:03.784389	\N	2023-05-04 10:42:35.058056	2023-05-04 10:03:03.775936	1976	22	\N	26	26	\N	\N	\N	7	\N	1975	-1	\N	-1	-1
f	2023-05-04 10:03:03.794394	\N	2023-05-04 10:42:35.071761	2023-05-04 10:03:03.784966	1977	22	\N	26	26	\N	\N	\N	\N	\N	1976	-1	\N	-1	-1
f	2023-05-04 10:03:03.809895	\N	2023-05-04 10:42:35.085502	2023-05-04 10:03:03.795448	1978	22	\N	26	26	\N	\N	\N	6	\N	1977	-1	\N	-1	-1
f	2023-05-04 10:03:03.826962	\N	2023-05-04 10:42:35.099519	2023-05-04 10:03:03.810921	1979	22	\N	26	26	\N	28	\N	5	\N	1978	-1	\N	-1	-1
f	2023-05-04 10:03:03.843269	\N	2023-05-04 10:42:35.11437	2023-05-04 10:03:03.828009	1980	\N	\N	26	26	\N	\N	\N	6	\N	1977	-1	\N	-1	-1
f	2023-05-04 10:03:03.852125	\N	2023-05-04 10:42:35.127768	2023-05-04 10:03:03.843848	1981	24	\N	26	26	\N	\N	\N	6	\N	1980	-1	\N	-1	-1
f	2023-05-04 10:03:03.868167	\N	2023-05-04 10:42:35.143257	2023-05-04 10:03:03.852699	1982	22	\N	26	26	92	\N	16	4	\N	1981	-1	\N	-1	-1
f	2023-05-04 10:03:03.884831	\N	2023-05-04 10:42:35.158097	2023-05-04 10:03:03.868745	1983	53	\N	26	26	61	\N	16	4	\N	1981	-1	\N	-1	-1
f	2023-05-04 10:03:03.894678	\N	2023-05-04 10:42:35.171905	2023-05-04 10:03:03.88547	1984	22	\N	26	26	\N	\N	\N	\N	\N	1976	-1	\N	-1	-1
f	2023-05-04 10:03:03.916292	\N	2023-05-04 10:42:35.186344	2023-05-04 10:03:03.895342	1985	22	\N	26	26	93	\N	\N	\N	\N	1984	-1	\N	-1	-1
f	2023-05-04 10:03:03.925971	\N	2023-05-04 10:42:35.199808	2023-05-04 10:03:03.916875	1986	24	\N	26	26	\N	\N	\N	6	\N	1984	-1	\N	-1	-1
f	2023-05-04 10:03:03.960942	\N	2023-05-04 10:42:35.23234	2023-05-04 10:03:03.9271	1987	22	\N	26	26	76	\N	16	4	\N	1986	-1	\N	-1	-1
f	2023-05-04 10:03:03.988429	\N	2023-05-04 10:42:35.245276	2023-05-04 10:03:03.961658	1988	56	\N	26	26	94	\N	18	4	\N	1975	-1	\N	-1	-1
f	2023-05-04 09:59:27.434507	\N	2023-05-04 10:03:03.528181	2023-05-04 09:59:27.425795	1963	22	\N	26	26	\N	\N	\N	\N	\N	1962	-1	\N	-1	-1
f	2023-05-04 10:28:20.269593	\N	2023-05-04 10:39:07.862993	2023-05-04 10:28:20.26452	2012	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:28:20.296517	\N	2023-05-04 10:39:07.913897	2023-05-04 10:28:20.270272	2013	22	\N	10	10	29	\N	13	4	\N	2012	-1	\N	-1	-1
f	2023-05-04 10:28:20.306977	\N	2023-05-04 10:39:07.940794	2023-05-04 10:28:20.297134	2014	\N	\N	10	10	\N	\N	\N	\N	\N	2012	-1	\N	-1	-1
f	2023-05-04 10:39:08.021667	\N	2023-05-04 10:39:20.376912	2023-05-04 10:39:08.017706	2015	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:39:08.042621	\N	2023-05-04 10:39:20.390774	2023-05-04 10:39:08.022145	2016	22	\N	10	10	29	\N	13	4	\N	2015	-1	\N	-1	-1
f	2023-05-04 10:39:08.057222	\N	2023-05-04 10:39:20.404097	2023-05-04 10:39:08.043203	2017	56	\N	10	10	96	\N	12	4	\N	2015	-1	\N	-1	-1
f	2023-05-04 09:59:27.515104	\N	2023-05-04 10:03:03.639155	2023-05-04 09:59:27.495084	1969	53	\N	26	26	61	\N	16	4	\N	1967	-1	\N	-1	-1
f	2023-05-04 10:44:02.19874	\N	2023-05-04 10:45:26.501702	2023-05-04 10:44:02.193281	2036	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:44:02.215169	\N	2023-05-04 10:45:26.515888	2023-05-04 10:44:02.199384	2037	22	\N	28	28	\N	\N	\N	6	\N	2036	-1	\N	-1	-1
f	2023-05-04 10:44:02.224862	\N	2023-05-04 10:45:26.529076	2023-05-04 10:44:02.215736	2038	22	\N	28	28	\N	\N	\N	7	\N	2037	-1	\N	-1	-1
f	2023-05-04 10:44:02.233914	\N	2023-05-04 10:45:26.54252	2023-05-04 10:44:02.225445	2039	22	\N	28	28	\N	\N	\N	\N	\N	2038	-1	\N	-1	-1
f	2023-05-04 10:44:02.24333	\N	2023-05-04 10:45:26.557731	2023-05-04 10:44:02.234482	2040	22	\N	28	28	\N	\N	\N	6	\N	2039	-1	\N	-1	-1
f	2023-05-04 10:44:02.25229	\N	2023-05-04 10:45:26.571096	2023-05-04 10:44:02.243915	2041	\N	\N	28	28	\N	\N	\N	6	\N	2040	-1	\N	-1	-1
f	2023-05-04 10:44:02.273415	\N	2023-05-04 10:45:26.58441	2023-05-04 10:44:02.25286	2042	22	\N	28	28	68	\N	19	4	\N	2041	-1	\N	-1	-1
f	2023-05-04 10:44:02.292157	\N	2023-05-04 10:45:26.597819	2023-05-04 10:44:02.274015	2043	28	\N	28	28	74	\N	20	4	\N	2041	-1	\N	-1	-1
f	2023-05-04 10:44:02.302692	\N	2023-05-04 10:45:26.611886	2023-05-04 10:44:02.292761	2044	30	\N	28	28	\N	\N	\N	6	\N	2040	-1	\N	-1	-1
f	2023-05-04 10:44:02.317967	\N	2023-05-04 10:45:26.625203	2023-05-04 10:44:02.303256	2045	22	\N	28	28	68	\N	19	4	\N	2044	-1	\N	-1	-1
f	2023-05-04 10:44:02.333776	\N	2023-05-04 10:45:26.638451	2023-05-04 10:44:02.318541	2046	29	\N	28	28	75	\N	16	4	\N	2044	-1	\N	-1	-1
f	2023-05-04 10:44:02.343431	\N	2023-05-04 10:45:26.653259	2023-05-04 10:44:02.334365	2047	\N	\N	28	28	\N	\N	\N	6	\N	2039	-1	\N	-1	-1
f	2023-05-04 10:44:02.352204	\N	2023-05-04 10:45:26.666718	2023-05-04 10:44:02.344062	2048	24	\N	28	28	\N	\N	\N	6	\N	2047	-1	\N	-1	-1
f	2023-05-04 10:44:02.368803	\N	2023-05-04 10:45:26.68515	2023-05-04 10:44:02.352767	2049	22	\N	28	28	92	\N	16	4	\N	2048	-1	\N	-1	-1
f	2023-05-04 10:44:02.384773	\N	2023-05-04 10:45:26.698694	2023-05-04 10:44:02.36938	2050	53	\N	28	28	61	\N	16	4	\N	2048	-1	\N	-1	-1
f	2023-05-04 10:44:02.394816	\N	2023-05-04 10:45:26.721471	2023-05-04 10:44:02.385362	2051	22	\N	28	28	\N	\N	\N	\N	\N	2038	-1	\N	-1	-1
f	2023-05-04 10:44:02.412484	\N	2023-05-04 10:45:26.734858	2023-05-04 10:44:02.395379	2052	22	\N	28	28	73	\N	\N	\N	\N	2051	-1	\N	-1	-1
f	2023-05-04 10:44:02.421632	\N	2023-05-04 10:45:26.74815	2023-05-04 10:44:02.41311	2053	24	\N	28	28	\N	\N	\N	6	\N	2051	-1	\N	-1	-1
f	2023-05-04 10:44:02.437307	\N	2023-05-04 10:45:26.761356	2023-05-04 10:44:02.422193	2054	22	\N	28	28	76	\N	16	4	\N	2053	-1	\N	-1	-1
f	2023-05-04 10:44:02.452974	\N	2023-05-04 10:45:26.77459	2023-05-04 10:44:02.43789	2055	53	\N	28	28	95	\N	18	4	\N	2037	-1	\N	-1	-1
f	2023-05-04 10:45:26.784302	\N	2023-05-04 11:45:41.241703	2023-05-04 10:45:26.779621	2056	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 10:45:26.800108	\N	2023-05-04 11:45:41.262715	2023-05-04 10:45:26.784891	2057	22	\N	28	28	\N	\N	\N	6	\N	2056	-1	\N	-1	-1
f	2023-05-04 10:45:26.810187	\N	2023-05-04 11:45:41.276706	2023-05-04 10:45:26.800683	2058	22	\N	28	28	\N	\N	\N	7	\N	2057	-1	\N	-1	-1
f	2023-05-04 10:45:26.819048	\N	2023-05-04 11:45:41.292641	2023-05-04 10:45:26.810752	2059	22	\N	28	28	\N	\N	\N	\N	\N	2058	-1	\N	-1	-1
f	2023-05-04 10:45:26.82794	\N	2023-05-04 11:45:41.309014	2023-05-04 10:45:26.819616	2060	22	\N	28	28	\N	\N	\N	6	\N	2059	-1	\N	-1	-1
f	2023-05-04 10:45:26.836698	\N	2023-05-04 11:45:41.322865	2023-05-04 10:45:26.82856	2061	\N	\N	28	28	\N	\N	\N	6	\N	2060	-1	\N	-1	-1
f	2023-05-04 10:45:26.852335	\N	2023-05-04 11:45:41.337302	2023-05-04 10:45:26.837266	2062	22	\N	28	28	68	\N	19	4	\N	2061	-1	\N	-1	-1
f	2023-05-04 10:45:26.869534	\N	2023-05-04 11:45:41.357761	2023-05-04 10:45:26.852908	2063	28	\N	28	28	74	\N	20	4	\N	2061	-1	\N	-1	-1
f	2023-05-04 10:45:26.878741	\N	2023-05-04 11:45:41.397296	2023-05-04 10:45:26.870115	2064	30	\N	28	28	\N	\N	\N	6	\N	2060	-1	\N	-1	-1
f	2023-05-04 10:45:26.893966	\N	2023-05-04 11:45:41.413044	2023-05-04 10:45:26.879308	2065	22	\N	28	28	68	\N	19	4	\N	2064	-1	\N	-1	-1
f	2023-05-04 10:45:26.915027	\N	2023-05-04 11:45:41.428065	2023-05-04 10:45:26.894542	2066	29	\N	28	28	75	\N	16	4	\N	2064	-1	\N	-1	-1
f	2023-05-04 10:45:26.924265	\N	2023-05-04 11:45:41.442642	2023-05-04 10:45:26.915622	2067	\N	\N	28	28	\N	\N	\N	6	\N	2059	-1	\N	-1	-1
f	2023-05-04 10:45:26.933142	\N	2023-05-04 11:45:41.459653	2023-05-04 10:45:26.924831	2068	24	\N	28	28	\N	\N	\N	6	\N	2067	-1	\N	-1	-1
f	2023-05-04 10:45:26.948339	\N	2023-05-04 11:45:41.476953	2023-05-04 10:45:26.933734	2069	22	\N	28	28	92	\N	16	4	\N	2068	-1	\N	-1	-1
f	2023-05-04 10:45:26.966382	\N	2023-05-04 11:45:41.491016	2023-05-04 10:45:26.948911	2070	53	\N	28	28	61	\N	16	4	\N	2068	-1	\N	-1	-1
f	2023-05-04 10:45:26.976338	\N	2023-05-04 11:45:41.505225	2023-05-04 10:45:26.96705	2071	22	\N	28	28	\N	\N	\N	\N	\N	2058	-1	\N	-1	-1
f	2023-05-04 10:45:26.995071	\N	2023-05-04 11:45:41.519666	2023-05-04 10:45:26.976988	2072	22	\N	28	28	73	\N	\N	\N	\N	2071	-1	\N	-1	-1
f	2023-05-04 10:45:27.00485	\N	2023-05-04 11:45:41.533978	2023-05-04 10:45:26.995706	2073	24	\N	28	28	\N	\N	\N	6	\N	2071	-1	\N	-1	-1
f	2023-05-04 10:45:27.033755	\N	2023-05-04 11:45:41.548429	2023-05-04 10:45:27.005422	2074	22	\N	28	28	76	\N	16	4	\N	2073	-1	\N	-1	-1
f	2023-05-04 10:45:27.066389	\N	2023-05-04 11:45:41.565919	2023-05-04 10:45:27.034365	2075	53	\N	28	28	95	\N	18	4	\N	2057	-1	\N	-1	-1
t	2023-05-04 11:45:41.576552	\N	\N	2023-05-04 11:45:41.571448	2076	\N	\N	28	28	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 11:45:41.595735	\N	\N	2023-05-04 11:45:41.577213	2077	22	\N	28	28	\N	\N	\N	6	\N	2076	-1	\N	\N	-1
t	2023-05-04 11:45:41.605276	\N	\N	2023-05-04 11:45:41.596408	2078	22	\N	28	28	\N	\N	\N	7	\N	2077	-1	\N	\N	-1
t	2023-05-04 11:45:41.614665	\N	\N	2023-05-04 11:45:41.605881	2079	22	\N	28	28	\N	\N	\N	\N	\N	2078	-1	\N	\N	-1
t	2023-05-04 11:45:41.623907	\N	\N	2023-05-04 11:45:41.615278	2080	22	\N	28	28	\N	\N	\N	6	\N	2079	-1	\N	\N	-1
t	2023-05-04 11:45:41.633036	\N	\N	2023-05-04 11:45:41.624541	2081	\N	\N	28	28	\N	\N	\N	6	\N	2080	-1	\N	\N	-1
t	2023-05-04 11:45:41.685042	\N	\N	2023-05-04 11:45:41.633607	2082	22	\N	28	28	68	\N	19	4	\N	2081	-1	\N	\N	-1
t	2023-05-04 11:45:41.724302	\N	\N	2023-05-04 11:45:41.685667	2083	28	\N	28	28	74	\N	20	4	\N	2081	-1	\N	\N	-1
t	2023-05-04 11:45:41.734573	\N	\N	2023-05-04 11:45:41.724956	2084	30	\N	28	28	\N	\N	\N	6	\N	2080	-1	\N	\N	-1
t	2023-05-04 11:45:41.750723	\N	\N	2023-05-04 11:45:41.735214	2085	22	\N	28	28	68	\N	19	4	\N	2084	-1	\N	\N	-1
t	2023-05-04 11:45:41.769015	\N	\N	2023-05-04 11:45:41.75137	2086	29	\N	28	28	75	\N	16	4	\N	2084	-1	\N	\N	-1
t	2023-05-04 11:45:41.779084	\N	\N	2023-05-04 11:45:41.769605	2087	\N	\N	28	28	\N	\N	\N	6	\N	2079	-1	\N	\N	-1
t	2023-05-04 11:45:41.789534	\N	\N	2023-05-04 11:45:41.779652	2088	24	\N	28	28	\N	\N	\N	6	\N	2087	-1	\N	\N	-1
t	2023-05-04 11:45:41.805981	\N	\N	2023-05-04 11:45:41.790144	2089	22	\N	28	28	61	\N	16	4	\N	2088	-1	\N	\N	-1
t	2023-05-04 11:45:41.816326	\N	\N	2023-05-04 11:45:41.806576	2090	22	\N	28	28	\N	\N	\N	\N	\N	2078	-1	\N	\N	-1
t	2023-05-04 11:45:41.83524	\N	\N	2023-05-04 11:45:41.816939	2091	22	\N	28	28	73	\N	\N	\N	\N	2090	-1	\N	\N	-1
t	2023-05-04 11:45:41.845151	\N	\N	2023-05-04 11:45:41.835856	2092	24	\N	28	28	\N	\N	\N	6	\N	2090	-1	\N	\N	-1
t	2023-05-04 11:45:41.863315	\N	\N	2023-05-04 11:45:41.845716	2093	22	\N	28	28	76	\N	16	4	\N	2092	-1	\N	\N	-1
t	2023-05-04 11:45:41.880164	\N	\N	2023-05-04 11:45:41.86396	2094	53	\N	28	28	95	\N	18	4	\N	2077	-1	\N	\N	-1
f	2023-05-04 11:51:18.181244	\N	2023-05-04 11:51:18.431865	2023-05-04 11:51:18.175327	2095	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 11:51:18.251856	\N	2023-05-04 11:51:18.455008	2023-05-04 11:51:18.181843	2096	22	\N	10	10	29	\N	13	4	\N	2095	-1	\N	-1	-1
f	2023-05-04 11:51:18.282245	\N	2023-05-04 11:51:18.521369	2023-05-04 11:51:18.252605	2097	56	\N	10	10	96	\N	12	4	\N	2095	-1	\N	-1	-1
t	2023-05-04 11:51:18.531307	\N	\N	2023-05-04 11:51:18.526458	2098	\N	\N	10	10	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 11:51:18.561099	\N	\N	2023-05-04 11:51:18.531902	2099	22	\N	10	10	29	\N	13	4	\N	2098	-1	\N	\N	-1
t	2023-05-04 11:51:18.57949	\N	\N	2023-05-04 11:51:18.561713	2100	56	\N	10	10	96	\N	12	4	\N	2098	-1	\N	\N	-1
f	2023-05-04 09:06:00.972807	\N	2023-05-04 12:00:09.554421	2023-05-04 09:06:00.95594	1787	22	\N	17	17	47	\N	20	4	\N	1786	-1	\N	-1	-1
f	2023-05-04 12:42:09.472882	\N	2023-05-04 13:01:25.206763	2023-05-04 12:42:09.468631	2105	\N	\N	36	36	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 12:42:09.504774	\N	2023-05-04 13:01:25.233102	2023-05-04 12:42:09.473501	2106	\N	\N	36	36	\N	\N	\N	6	\N	2105	-1	\N	-1	-1
f	2023-05-04 12:42:09.523227	\N	2023-05-04 13:01:25.242101	2023-05-04 12:42:09.505477	2107	22	\N	36	36	29	\N	13	4	\N	2106	-1	\N	-1	-1
f	2023-05-04 12:42:09.536622	\N	2023-05-04 13:01:25.250233	2023-05-04 12:42:09.523819	2108	56	\N	36	36	98	\N	12	4	\N	2106	-1	\N	-1	-1
t	2023-05-04 13:01:25.265106	\N	\N	2023-05-04 13:01:25.262371	2110	\N	\N	36	36	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
f	2023-05-04 12:11:45.41294	\N	2023-05-04 13:03:25.941331	2023-05-04 12:11:45.343217	2101	\N	\N	35	35	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 12:11:45.423807	\N	2023-05-04 13:03:25.958329	2023-05-04 12:11:45.413675	2102	\N	\N	35	35	\N	\N	\N	6	\N	2101	-1	\N	-1	-1
f	2023-05-04 12:11:45.455635	\N	2023-05-04 13:03:25.985504	2023-05-04 12:11:45.445894	2104	\N	\N	35	35	\N	\N	\N	\N	\N	2102	-1	\N	-1	-1
f	2023-05-04 12:42:09.553398	\N	2023-05-04 13:01:25.258401	2023-05-04 12:42:09.53726	2109	24	\N	36	36	99	\N	18	4	\N	2105	-1	\N	-1	-1
f	2023-05-04 12:11:45.445228	\N	2023-05-04 13:03:25.972088	2023-05-04 12:11:45.424518	2103	22	\N	35	35	47	\N	20	4	\N	2102	-1	\N	-1	-1
f	2023-01-16 22:04:26.62428	\N	2023-05-28 17:23:09.292057	2023-01-16 22:04:26.619821	398	22	\N	8	8	24	\N	13	4	\N	397	-1	\N	-1	-1
f	2023-05-28 17:23:09.334389	\N	2023-05-28 17:25:22.587383	2023-05-28 17:23:09.33181	2144	\N	\N	8	8	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 17:23:09.398026	\N	2023-05-28 17:25:22.595082	2023-05-28 17:23:09.343019	2145	22	\N	8	8	\N	\N	\N	7	\N	2144	-1	\N	-1	-1
f	2023-05-28 17:23:09.412775	\N	2023-05-28 17:25:22.601949	2023-05-28 17:23:09.398414	2146	22	\N	8	8	\N	\N	\N	\N	\N	2145	-1	\N	-1	-1
f	2023-05-28 17:23:09.418611	\N	2023-05-28 17:25:22.609337	2023-05-28 17:23:09.41316	2147	22	\N	8	8	\N	\N	\N	6	\N	2146	-1	\N	-1	-1
f	2023-05-28 17:23:09.431001	\N	2023-05-28 17:25:22.616389	2023-05-28 17:23:09.418987	2148	\N	\N	8	8	\N	\N	\N	6	\N	2147	-1	\N	-1	-1
f	2023-05-28 17:23:09.44879	\N	2023-05-28 17:25:22.634785	2023-05-28 17:23:09.431365	2149	22	\N	8	8	\N	\N	\N	9	62	2148	-1	\N	-1	-1
f	2023-05-28 17:23:09.457399	\N	2023-05-28 17:25:22.64213	2023-05-28 17:23:09.449129	2150	22	\N	8	8	24	\N	13	4	\N	2149	-1	\N	-1	-1
f	2023-05-28 17:23:09.492909	\N	2023-05-28 17:25:22.653082	2023-05-28 17:23:09.457716	2151	\N	\N	8	8	\N	\N	\N	6	\N	2147	-1	\N	-1	-1
f	2023-05-28 17:23:09.497923	\N	2023-05-28 17:25:22.660113	2023-05-28 17:23:09.493273	2152	\N	\N	8	8	\N	\N	\N	\N	\N	2151	-1	\N	-1	-1
f	2023-05-28 17:23:09.502584	\N	2023-05-28 17:25:22.667162	2023-05-28 17:23:09.498237	2153	\N	\N	8	8	\N	\N	\N	\N	\N	2151	-1	\N	-1	-1
f	2023-05-28 17:23:09.507315	\N	2023-05-28 17:25:22.673975	2023-05-28 17:23:09.502904	2154	24	\N	8	8	\N	\N	\N	6	\N	2146	-1	\N	-1	-1
f	2023-05-28 17:23:09.515476	\N	2023-05-28 17:25:22.680642	2023-05-28 17:23:09.507628	2155	22	\N	8	8	24	\N	13	4	\N	2154	-1	\N	-1	-1
f	2023-05-28 17:23:09.52041	\N	2023-05-28 17:25:22.687426	2023-05-28 17:23:09.515801	2156	22	\N	8	8	\N	\N	\N	\N	\N	2145	-1	\N	-1	-1
t	2023-05-04 13:01:25.283277	\N	\N	2023-05-04 13:01:25.274322	2112	22	\N	36	36	29	\N	13	4	\N	2111	-1	\N	\N	-1
t	2023-05-04 13:01:25.296794	\N	\N	2023-05-04 13:01:25.283567	2113	56	\N	36	36	98	\N	12	4	\N	2111	-1	\N	\N	-1
t	2023-05-04 13:01:25.312879	\N	\N	2023-05-04 13:01:25.297402	2114	24	\N	36	36	99	\N	18	4	\N	2110	-1	\N	\N	-1
f	2023-05-04 09:44:43.869795	\N	2023-05-04 13:06:35.1364	2023-05-04 09:44:43.860165	1893	22	\N	29	29	\N	\N	\N	\N	\N	1892	-1	\N	-1	-1
f	2023-01-16 22:04:26.609098	\N	2023-05-28 17:23:09.102969	2023-01-16 22:04:26.605187	394	\N	\N	8	8	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 17:23:09.650865	\N	2023-05-28 17:25:22.694175	2023-05-28 17:23:09.520713	2157	22	\N	8	8	100	\N	\N	\N	\N	2156	-1	\N	-1	-1
f	2023-05-28 17:23:09.732474	\N	2023-05-28 17:25:22.700947	2023-05-28 17:23:09.651324	2158	24	\N	8	8	\N	\N	\N	\N	\N	2156	-1	\N	-1	-1
f	2023-05-04 09:44:43.859557	\N	2023-05-04 13:06:35.121613	2023-05-04 09:44:43.844445	1892	22	\N	29	29	\N	\N	\N	7	\N	1891	-1	\N	-1	-1
f	2023-05-04 09:44:44.002204	\N	2023-05-04 13:06:35.271596	2023-05-04 09:44:43.986778	1901	23	\N	29	29	67	\N	19	4	\N	1899	-1	\N	-1	-1
t	2023-05-04 13:06:35.338705	\N	\N	2023-05-04 13:06:35.333948	2122	\N	\N	29	29	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 13:06:35.358482	\N	\N	2023-05-04 13:06:35.339298	2123	22	\N	29	29	\N	\N	\N	7	\N	2122	-1	\N	\N	-1
t	2023-05-04 13:06:35.371242	\N	\N	2023-05-04 13:06:35.359116	2124	22	\N	29	29	\N	\N	\N	\N	\N	2123	-1	\N	\N	-1
t	2023-05-04 13:06:35.38443	\N	\N	2023-05-04 13:06:35.371909	2125	\N	\N	29	29	\N	\N	\N	6	\N	2124	-1	\N	\N	-1
t	2023-05-04 13:06:35.395348	\N	\N	2023-05-04 13:06:35.386796	2126	22	\N	29	29	\N	\N	\N	6	\N	2125	-1	\N	\N	-1
t	2023-05-04 13:06:35.441441	\N	\N	2023-05-04 13:06:35.395999	2127	22	\N	29	29	67	\N	19	4	\N	2126	-1	\N	\N	-1
t	2023-05-04 13:06:35.456621	\N	\N	2023-05-04 13:06:35.442091	2128	27	\N	29	29	81	\N	20	4	\N	2126	-1	\N	\N	-1
t	2023-05-04 13:06:35.46132	\N	\N	2023-05-04 13:06:35.456919	2129	\N	\N	29	29	\N	\N	\N	6	\N	2124	-1	\N	\N	-1
t	2023-05-04 13:06:35.465757	\N	\N	2023-05-04 13:06:35.461634	2130	\N	\N	29	29	\N	\N	\N	6	\N	2129	-1	\N	\N	-1
t	2023-05-04 13:06:35.474157	\N	\N	2023-05-04 13:06:35.466043	2131	22	\N	29	29	81	\N	20	4	\N	2130	-1	\N	\N	-1
t	2023-05-04 13:06:35.482365	\N	\N	2023-05-04 13:06:35.474478	2132	23	\N	29	29	67	\N	19	4	\N	2130	-1	\N	\N	-1
t	2023-05-04 13:06:35.487705	\N	\N	2023-05-04 13:06:35.482682	2133	22	\N	29	29	\N	\N	\N	\N	\N	2123	-1	\N	\N	-1
t	2023-05-04 13:06:35.497662	\N	\N	2023-05-04 13:06:35.487991	2134	22	\N	29	29	77	\N	\N	\N	\N	2133	-1	\N	\N	-1
t	2023-05-04 13:06:35.502745	\N	\N	2023-05-04 13:06:35.497955	2135	24	\N	29	29	\N	\N	\N	6	\N	2133	-1	\N	\N	-1
t	2023-05-04 13:06:35.511045	\N	\N	2023-05-04 13:06:35.503033	2136	22	\N	29	29	76	\N	16	4	\N	2135	-1	\N	\N	-1
f	2023-05-04 13:03:25.995438	\N	2023-05-04 13:08:06.526395	2023-05-04 13:03:25.990296	2115	\N	\N	35	35	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-04 13:03:26.018726	\N	2023-05-04 13:08:06.543317	2023-05-04 13:03:25.996105	2116	24	\N	35	35	\N	\N	\N	6	\N	2115	-1	\N	-1	-1
f	2023-05-04 13:03:26.039098	\N	2023-05-04 13:08:06.556835	2023-05-04 13:03:26.019448	2117	22	\N	35	35	47	\N	20	4	\N	2116	-1	\N	-1	-1
f	2023-05-04 13:03:26.049786	\N	2023-05-04 13:08:06.570087	2023-05-04 13:03:26.039688	2118	\N	\N	35	35	\N	\N	\N	6	\N	2116	-1	\N	-1	-1
f	2023-05-04 13:03:26.058725	\N	2023-05-04 13:08:06.58389	2023-05-04 13:03:26.050396	2119	27	\N	35	35	\N	\N	\N	6	\N	2118	-1	\N	-1	-1
f	2023-05-04 13:03:26.068363	\N	2023-05-04 13:08:06.600593	2023-05-04 13:03:26.0593	2120	22	\N	35	35	\N	29	\N	5	\N	2119	-1	\N	-1	-1
f	2023-05-04 13:03:26.085062	\N	2023-05-04 13:08:06.614327	2023-05-04 13:03:26.068955	2121	56	\N	35	35	67	\N	19	4	\N	2119	-1	\N	-1	-1
t	2023-05-04 13:08:06.624209	\N	\N	2023-05-04 13:08:06.619486	2137	\N	\N	35	35	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-04 13:08:06.6408	\N	\N	2023-05-04 13:08:06.6248	2138	24	\N	35	35	\N	\N	\N	6	\N	2137	-1	\N	\N	-1
t	2023-05-04 13:08:06.668287	\N	\N	2023-05-04 13:08:06.641612	2139	22	\N	35	35	47	\N	20	4	\N	2138	-1	\N	\N	-1
t	2023-05-04 13:08:06.677802	\N	\N	2023-05-04 13:08:06.668882	2140	\N	\N	35	35	\N	\N	\N	6	\N	2138	-1	\N	\N	-1
t	2023-05-04 13:08:06.687254	\N	\N	2023-05-04 13:08:06.678452	2141	27	\N	35	35	\N	\N	\N	6	\N	2140	-1	\N	\N	-1
t	2023-05-04 13:08:06.696066	\N	\N	2023-05-04 13:08:06.687821	2142	22	\N	35	35	\N	29	\N	5	\N	2141	-1	\N	\N	-1
t	2023-05-04 13:08:06.712234	\N	\N	2023-05-04 13:08:06.696647	2143	56	\N	35	35	67	\N	19	4	\N	2141	-1	\N	\N	-1
f	2023-01-16 22:04:26.612679	\N	2023-05-28 17:23:09.160557	2023-01-16 22:04:26.609341	395	\N	\N	8	8	\N	\N	\N	6	\N	394	-1	\N	-1	-1
t	2023-05-28 17:25:22.724101	\N	\N	2023-05-28 17:25:22.721927	2159	\N	\N	8	8	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-28 17:25:22.808866	\N	\N	2023-05-28 17:25:22.724447	2160	22	\N	8	8	\N	\N	\N	7	\N	2159	-1	\N	\N	-1
t	2023-05-28 17:25:22.831565	\N	\N	2023-05-28 17:25:22.809267	2161	22	\N	8	8	\N	\N	\N	\N	\N	2160	-1	\N	\N	-1
t	2023-05-28 17:25:22.836653	\N	\N	2023-05-28 17:25:22.831916	2162	22	\N	8	8	\N	\N	\N	6	\N	2161	-1	\N	\N	-1
t	2023-05-28 17:25:22.842459	\N	\N	2023-05-28 17:25:22.836958	2163	\N	\N	8	8	\N	\N	\N	6	\N	2162	-1	\N	\N	-1
t	2023-05-28 17:25:22.861255	\N	\N	2023-05-28 17:25:22.842797	2164	22	\N	8	8	\N	\N	\N	9	62	2163	-1	\N	\N	-1
t	2023-05-28 17:25:22.870588	\N	\N	2023-05-28 17:25:22.86164	2165	22	\N	8	8	24	\N	13	4	\N	2164	-1	\N	\N	-1
t	2023-05-28 17:25:22.91541	\N	\N	2023-05-28 17:25:22.870975	2166	\N	\N	8	8	\N	\N	\N	6	\N	2162	-1	\N	\N	-1
t	2023-05-28 17:25:22.924135	\N	\N	2023-05-28 17:25:22.91581	2167	22	\N	8	8	24	\N	13	4	\N	2166	-1	\N	\N	-1
t	2023-05-28 17:25:22.931774	\N	\N	2023-05-28 17:25:22.924508	2168	27	\N	8	8	101	\N	13	4	\N	2166	-1	\N	\N	-1
t	2023-05-28 17:25:22.936966	\N	\N	2023-05-28 17:25:22.932209	2169	24	\N	8	8	\N	\N	\N	6	\N	2161	-1	\N	\N	-1
t	2023-05-28 17:25:22.945053	\N	\N	2023-05-28 17:25:22.937273	2170	22	\N	8	8	24	\N	13	4	\N	2169	-1	\N	\N	-1
t	2023-05-28 17:25:22.950797	\N	\N	2023-05-28 17:25:22.945375	2171	22	\N	8	8	\N	\N	\N	\N	\N	2160	-1	\N	\N	-1
t	2023-05-28 17:25:22.960861	\N	\N	2023-05-28 17:25:22.951124	2172	22	\N	8	8	100	\N	\N	\N	\N	2171	-1	\N	\N	-1
t	2023-05-28 17:25:22.966203	\N	\N	2023-05-28 17:25:22.961186	2173	24	\N	8	8	\N	\N	\N	6	\N	2171	-1	\N	\N	-1
t	2023-05-28 17:25:22.974275	\N	\N	2023-05-28 17:25:22.966515	2174	22	\N	8	8	26	\N	13	4	\N	2173	-1	\N	\N	-1
f	2023-05-04 09:44:43.887658	\N	2023-05-04 13:06:35.165476	2023-05-04 09:44:43.879562	1895	22	\N	29	29	\N	\N	\N	6	\N	1894	-1	\N	-1	-1
f	2023-05-28 22:33:38.02593	\N	2023-05-28 22:36:07.424789	2023-05-28 22:33:38.009023	2175	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:36:07.533327	\N	2023-05-28 22:37:46.040991	2023-05-28 22:36:07.529986	2176	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:36:07.615454	\N	2023-05-28 22:37:46.049135	2023-05-28 22:36:07.533844	2177	22	\N	37	37	\N	\N	\N	7	\N	2176	-1	\N	-1	-1
f	2023-05-28 22:36:07.659482	\N	2023-05-28 22:37:46.056701	2023-05-28 22:36:07.615873	2178	22	\N	37	37	\N	\N	\N	\N	\N	2177	-1	\N	-1	-1
f	2023-05-28 22:36:07.665886	\N	2023-05-28 22:37:46.06402	2023-05-28 22:36:07.659895	2179	22	\N	37	37	\N	\N	\N	6	\N	2178	-1	\N	-1	-1
f	2023-05-28 22:36:07.677616	\N	2023-05-28 22:37:46.071329	2023-05-28 22:36:07.666297	2180	22	\N	37	37	25	\N	13	4	\N	2179	-1	\N	-1	-1
f	2023-05-28 22:36:07.69453	\N	2023-05-28 22:37:46.078332	2023-05-28 22:36:07.678029	2181	29	\N	37	37	102	\N	17	4	\N	2179	-1	\N	-1	-1
f	2023-05-28 22:36:07.700521	\N	2023-05-28 22:37:46.08531	2023-05-28 22:36:07.694927	2182	24	\N	37	37	\N	\N	\N	\N	\N	2178	-1	\N	-1	-1
f	2023-05-28 22:36:07.705727	\N	2023-05-28 22:37:46.092132	2023-05-28 22:36:07.700888	2183	22	\N	37	37	\N	\N	\N	\N	\N	2177	-1	\N	-1	-1
f	2023-05-28 22:36:07.802674	\N	2023-05-28 22:37:46.099009	2023-05-28 22:36:07.706067	2184	22	\N	37	37	103	\N	\N	\N	\N	2183	-1	\N	-1	-1
f	2023-05-28 22:36:07.815741	\N	2023-05-28 22:37:46.107083	2023-05-28 22:36:07.803015	2185	24	\N	37	37	\N	\N	\N	\N	\N	2183	-1	\N	-1	-1
f	2023-05-28 22:37:46.112222	\N	2023-05-28 22:39:49.854702	2023-05-28 22:37:46.109661	2186	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:37:46.159553	\N	2023-05-28 22:39:49.864253	2023-05-28 22:37:46.112541	2187	22	\N	37	37	\N	\N	\N	7	\N	2186	-1	\N	-1	-1
f	2023-05-28 22:37:46.185508	\N	2023-05-28 22:39:49.872368	2023-05-28 22:37:46.159963	2188	22	\N	37	37	\N	\N	\N	\N	\N	2187	-1	\N	-1	-1
f	2023-05-28 22:37:46.191366	\N	2023-05-28 22:39:49.879958	2023-05-28 22:37:46.185906	2189	22	\N	37	37	\N	\N	\N	6	\N	2188	-1	\N	-1	-1
f	2023-05-28 22:37:46.200851	\N	2023-05-28 22:39:49.887526	2023-05-28 22:37:46.191689	2190	22	\N	37	37	25	\N	13	4	\N	2189	-1	\N	-1	-1
f	2023-05-28 22:37:46.225448	\N	2023-05-28 22:39:49.896088	2023-05-28 22:37:46.201205	2191	29	\N	37	37	102	\N	17	4	\N	2189	-1	\N	-1	-1
f	2023-05-28 22:37:46.231367	\N	2023-05-28 22:39:49.903175	2023-05-28 22:37:46.225841	2192	24	\N	37	37	\N	\N	\N	6	\N	2188	-1	\N	-1	-1
f	2023-05-28 22:37:46.236523	\N	2023-05-28 22:39:49.910181	2023-05-28 22:37:46.231706	2193	22	\N	37	37	\N	\N	\N	7	\N	2192	-1	\N	-1	-1
f	2023-05-28 22:37:46.241307	\N	2023-05-28 22:39:49.917061	2023-05-28 22:37:46.236839	2194	22	\N	37	37	\N	\N	\N	\N	\N	2193	-1	\N	-1	-1
f	2023-05-28 22:37:46.245877	\N	2023-05-28 22:39:49.924421	2023-05-28 22:37:46.241631	2195	22	\N	37	37	\N	\N	\N	6	\N	2194	-1	\N	-1	-1
f	2023-05-28 22:37:46.250466	\N	2023-05-28 22:39:49.93129	2023-05-28 22:37:46.246185	2196	22	\N	37	37	\N	32	\N	5	\N	2195	-1	\N	-1	-1
f	2023-05-28 22:37:46.255315	\N	2023-05-28 22:39:49.938538	2023-05-28 22:37:46.250774	2197	\N	\N	37	37	\N	\N	\N	\N	\N	2195	-1	\N	-1	-1
f	2023-05-28 22:37:46.259824	\N	2023-05-28 22:39:49.946155	2023-05-28 22:37:46.255616	2198	24	\N	37	37	\N	\N	\N	\N	\N	2194	-1	\N	-1	-1
f	2023-05-28 22:37:46.264272	\N	2023-05-28 22:39:49.953931	2023-05-28 22:37:46.260135	2199	22	\N	37	37	\N	\N	\N	\N	\N	2193	-1	\N	-1	-1
f	2023-05-28 22:37:46.271816	\N	2023-05-28 22:39:49.962011	2023-05-28 22:37:46.264571	2200	22	\N	37	37	\N	\N	\N	\N	\N	2199	-1	\N	-1	-1
f	2023-05-28 22:37:46.280816	\N	2023-05-28 22:39:49.969654	2023-05-28 22:37:46.272173	2201	24	\N	37	37	\N	\N	\N	\N	\N	2199	-1	\N	-1	-1
f	2023-05-28 22:37:46.286187	\N	2023-05-28 22:39:49.977703	2023-05-28 22:37:46.281195	2202	22	\N	37	37	\N	\N	\N	\N	\N	2187	-1	\N	-1	-1
f	2023-05-28 22:37:46.296872	\N	2023-05-28 22:39:49.98553	2023-05-28 22:37:46.286517	2203	22	\N	37	37	103	\N	\N	\N	\N	2202	-1	\N	-1	-1
f	2023-05-28 22:37:46.303304	\N	2023-05-28 22:39:49.993073	2023-05-28 22:37:46.297297	2204	24	\N	37	37	\N	\N	\N	\N	\N	2202	-1	\N	-1	-1
f	2023-05-28 22:39:49.9987	\N	2023-05-28 22:40:52.055154	2023-05-28 22:39:49.995993	2205	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:39:50.007354	\N	2023-05-28 22:40:52.062646	2023-05-28 22:39:49.999032	2206	22	\N	37	37	\N	\N	\N	7	\N	2205	-1	\N	-1	-1
f	2023-05-28 22:39:50.012803	\N	2023-05-28 22:40:52.070064	2023-05-28 22:39:50.007979	2207	22	\N	37	37	\N	\N	\N	\N	\N	2206	-1	\N	-1	-1
f	2023-05-28 22:39:50.017731	\N	2023-05-28 22:40:52.079341	2023-05-28 22:39:50.013131	2208	22	\N	37	37	\N	\N	\N	6	\N	2207	-1	\N	-1	-1
f	2023-05-28 22:39:50.027289	\N	2023-05-28 22:40:52.087826	2023-05-28 22:39:50.01806	2209	22	\N	37	37	25	\N	13	4	\N	2208	-1	\N	-1	-1
f	2023-05-28 22:39:50.039092	\N	2023-05-28 22:40:52.094924	2023-05-28 22:39:50.027673	2210	29	\N	37	37	102	\N	17	4	\N	2208	-1	\N	-1	-1
f	2023-05-28 22:39:50.044662	\N	2023-05-28 22:40:52.102189	2023-05-28 22:39:50.039492	2211	24	\N	37	37	\N	\N	\N	6	\N	2207	-1	\N	-1	-1
f	2023-05-28 22:39:50.052013	\N	2023-05-28 22:40:52.109125	2023-05-28 22:39:50.045034	2212	22	\N	37	37	\N	\N	\N	7	\N	2211	-1	\N	-1	-1
f	2023-05-28 22:39:50.059654	\N	2023-05-28 22:40:52.115992	2023-05-28 22:39:50.053326	2213	22	\N	37	37	\N	\N	\N	\N	\N	2212	-1	\N	-1	-1
f	2023-05-28 22:39:50.065321	\N	2023-05-28 22:40:52.147456	2023-05-28 22:39:50.060047	2214	22	\N	37	37	\N	\N	\N	6	\N	2213	-1	\N	-1	-1
f	2023-05-28 22:39:50.070679	\N	2023-05-28 22:40:52.154922	2023-05-28 22:39:50.065709	2215	22	\N	37	37	\N	32	\N	5	\N	2214	-1	\N	-1	-1
f	2023-05-28 22:39:50.079345	\N	2023-05-28 22:40:52.162089	2023-05-28 22:39:50.071018	2216	26	\N	37	37	102	\N	17	4	\N	2214	-1	\N	-1	-1
f	2023-05-28 22:39:50.084572	\N	2023-05-28 22:40:52.169091	2023-05-28 22:39:50.079716	2217	24	\N	37	37	\N	\N	\N	6	\N	2213	-1	\N	-1	-1
f	2023-05-28 22:39:50.08983	\N	2023-05-28 22:40:52.177062	2023-05-28 22:39:50.084911	2218	22	\N	37	37	\N	32	\N	5	\N	2217	-1	\N	-1	-1
f	2023-05-28 22:39:50.099007	\N	2023-05-28 22:40:52.185451	2023-05-28 22:39:50.090174	2219	23	\N	37	37	102	\N	17	4	\N	2217	-1	\N	-1	-1
f	2023-05-28 22:39:50.104117	\N	2023-05-28 22:40:52.192935	2023-05-28 22:39:50.099389	2220	22	\N	37	37	\N	\N	\N	\N	\N	2212	-1	\N	-1	-1
f	2023-05-28 22:39:50.126571	\N	2023-05-28 22:40:52.200057	2023-05-28 22:39:50.104475	2221	22	\N	37	37	\N	\N	\N	\N	\N	2220	-1	\N	-1	-1
f	2023-05-28 22:39:50.131657	\N	2023-05-28 22:40:52.209566	2023-05-28 22:39:50.126964	2222	24	\N	37	37	\N	\N	\N	\N	\N	2220	-1	\N	-1	-1
f	2023-05-28 22:39:50.13652	\N	2023-05-28 22:40:52.216697	2023-05-28 22:39:50.131983	2223	22	\N	37	37	\N	\N	\N	\N	\N	2206	-1	\N	-1	-1
f	2023-05-28 22:39:50.147157	\N	2023-05-28 22:40:52.223879	2023-05-28 22:39:50.136863	2224	22	\N	37	37	103	\N	\N	\N	\N	2223	-1	\N	-1	-1
f	2023-05-28 22:39:50.15312	\N	2023-05-28 22:40:52.230785	2023-05-28 22:39:50.147528	2225	24	\N	37	37	\N	\N	\N	\N	\N	2223	-1	\N	-1	-1
f	2023-05-28 22:40:52.235855	\N	2023-05-28 22:44:28.472292	2023-05-28 22:40:52.233356	2226	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:40:52.244351	\N	2023-05-28 22:44:28.482178	2023-05-28 22:40:52.236197	2227	22	\N	37	37	\N	\N	\N	7	\N	2226	-1	\N	-1	-1
f	2023-05-28 22:40:52.249136	\N	2023-05-28 22:44:28.490267	2023-05-28 22:40:52.244699	2228	22	\N	37	37	\N	\N	\N	\N	\N	2227	-1	\N	-1	-1
f	2023-05-28 22:40:52.25371	\N	2023-05-28 22:44:28.497763	2023-05-28 22:40:52.24944	2229	22	\N	37	37	\N	\N	\N	6	\N	2228	-1	\N	-1	-1
f	2023-05-28 22:40:52.262379	\N	2023-05-28 22:44:28.506882	2023-05-28 22:40:52.254021	2230	22	\N	37	37	25	\N	13	4	\N	2229	-1	\N	-1	-1
f	2023-05-28 22:40:52.271003	\N	2023-05-28 22:44:28.515219	2023-05-28 22:40:52.262724	2231	29	\N	37	37	102	\N	17	4	\N	2229	-1	\N	-1	-1
f	2023-05-28 22:40:52.280076	\N	2023-05-28 22:44:28.522515	2023-05-28 22:40:52.271352	2232	24	\N	37	37	\N	\N	\N	6	\N	2228	-1	\N	-1	-1
f	2023-05-28 22:40:52.285204	\N	2023-05-28 22:44:28.532497	2023-05-28 22:40:52.280475	2233	22	\N	37	37	\N	\N	\N	7	\N	2232	-1	\N	-1	-1
f	2023-05-28 22:40:52.304988	\N	2023-05-28 22:44:28.543124	2023-05-28 22:40:52.285514	2234	22	\N	37	37	\N	\N	\N	\N	\N	2233	-1	\N	-1	-1
f	2023-05-28 22:40:52.310746	\N	2023-05-28 22:44:28.553516	2023-05-28 22:40:52.305418	2235	22	\N	37	37	\N	\N	\N	6	\N	2234	-1	\N	-1	-1
f	2023-05-28 22:40:52.316664	\N	2023-05-28 22:44:28.56117	2023-05-28 22:40:52.311079	2236	22	\N	37	37	\N	32	\N	5	\N	2235	-1	\N	-1	-1
f	2023-05-28 22:40:52.326837	\N	2023-05-28 22:44:28.568944	2023-05-28 22:40:52.317193	2237	26	\N	37	37	102	\N	17	4	\N	2235	-1	\N	-1	-1
f	2023-05-28 22:40:52.332139	\N	2023-05-28 22:44:28.576369	2023-05-28 22:40:52.327219	2238	24	\N	37	37	\N	\N	\N	6	\N	2234	-1	\N	-1	-1
f	2023-05-28 22:40:52.336862	\N	2023-05-28 22:44:28.584011	2023-05-28 22:40:52.332616	2239	22	\N	37	37	\N	32	\N	5	\N	2238	-1	\N	-1	-1
f	2023-05-28 22:40:52.345109	\N	2023-05-28 22:44:28.591841	2023-05-28 22:40:52.337163	2240	23	\N	37	37	102	\N	17	4	\N	2238	-1	\N	-1	-1
f	2023-05-28 22:40:52.350008	\N	2023-05-28 22:44:28.599217	2023-05-28 22:40:52.345459	2241	22	\N	37	37	\N	\N	\N	\N	\N	2233	-1	\N	-1	-1
f	2023-05-28 22:40:52.357778	\N	2023-05-28 22:44:28.606701	2023-05-28 22:40:52.350313	2242	22	\N	37	37	\N	\N	\N	\N	\N	2241	-1	\N	-1	-1
f	2023-05-28 22:40:52.362394	\N	2023-05-28 22:44:28.614282	2023-05-28 22:40:52.358109	2243	24	\N	37	37	\N	\N	\N	6	\N	2241	-1	\N	-1	-1
f	2023-05-28 22:40:52.370565	\N	2023-05-28 22:44:28.622087	2023-05-28 22:40:52.362693	2244	22	\N	37	37	76	\N	16	4	\N	2243	-1	\N	-1	-1
f	2023-05-28 22:40:52.375441	\N	2023-05-28 22:44:28.635957	2023-05-28 22:40:52.370907	2245	22	\N	37	37	\N	\N	\N	\N	\N	2227	-1	\N	-1	-1
f	2023-05-28 22:40:52.392287	\N	2023-05-28 22:44:28.66642	2023-05-28 22:40:52.387649	2247	24	\N	37	37	\N	\N	\N	\N	\N	2245	-1	\N	-1	-1
f	2023-05-28 22:44:28.80614	\N	2023-05-28 22:51:05.654027	2023-05-28 22:44:28.803797	2248	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:40:52.387288	\N	2023-05-28 22:44:28.643778	2023-05-28 22:40:52.375736	2246	22	\N	37	37	103	\N	\N	\N	\N	2245	-1	\N	-1	-1
f	2023-05-28 22:44:28.817043	\N	2023-05-28 22:51:05.703577	2023-05-28 22:44:28.806452	2249	22	\N	37	37	\N	\N	\N	7	\N	2248	-1	\N	-1	-1
f	2023-05-28 22:44:28.836864	\N	2023-05-28 22:51:05.712846	2023-05-28 22:44:28.817426	2250	22	\N	37	37	\N	\N	\N	\N	\N	2249	-1	\N	-1	-1
f	2023-05-28 22:44:28.84227	\N	2023-05-28 22:51:05.721591	2023-05-28 22:44:28.837258	2251	22	\N	37	37	\N	\N	\N	6	\N	2250	-1	\N	-1	-1
f	2023-05-28 22:44:28.852504	\N	2023-05-28 22:51:05.734626	2023-05-28 22:44:28.842595	2252	22	\N	37	37	25	\N	13	4	\N	2251	-1	\N	-1	-1
f	2023-05-28 22:44:28.870943	\N	2023-05-28 22:51:05.743241	2023-05-28 22:44:28.852879	2253	29	\N	37	37	102	\N	17	4	\N	2251	-1	\N	-1	-1
f	2023-05-28 22:44:28.876963	\N	2023-05-28 22:51:05.750624	2023-05-28 22:44:28.871409	2254	24	\N	37	37	\N	\N	\N	6	\N	2250	-1	\N	-1	-1
f	2023-05-28 22:44:28.885458	\N	2023-05-28 22:51:05.75774	2023-05-28 22:44:28.877316	2255	22	\N	37	37	\N	\N	\N	7	\N	2254	-1	\N	-1	-1
f	2023-05-28 22:44:28.890456	\N	2023-05-28 22:51:05.764675	2023-05-28 22:44:28.885829	2256	22	\N	37	37	\N	\N	\N	\N	\N	2255	-1	\N	-1	-1
f	2023-05-28 22:44:28.895303	\N	2023-05-28 22:51:05.772544	2023-05-28 22:44:28.890781	2257	22	\N	37	37	\N	\N	\N	6	\N	2256	-1	\N	-1	-1
f	2023-05-28 22:44:28.900368	\N	2023-05-28 22:51:05.781141	2023-05-28 22:44:28.895624	2258	22	\N	37	37	\N	32	\N	5	\N	2257	-1	\N	-1	-1
f	2023-05-28 22:44:28.908816	\N	2023-05-28 22:51:05.789641	2023-05-28 22:44:28.900677	2259	26	\N	37	37	102	\N	17	4	\N	2257	-1	\N	-1	-1
f	2023-05-28 22:44:28.914032	\N	2023-05-28 22:51:05.806823	2023-05-28 22:44:28.909172	2260	24	\N	37	37	\N	\N	\N	6	\N	2256	-1	\N	-1	-1
f	2023-05-28 22:44:28.918874	\N	2023-05-28 22:51:05.818713	2023-05-28 22:44:28.914366	2261	22	\N	37	37	\N	32	\N	5	\N	2260	-1	\N	-1	-1
f	2023-05-28 22:44:28.927658	\N	2023-05-28 22:51:05.826975	2023-05-28 22:44:28.919187	2262	23	\N	37	37	102	\N	17	4	\N	2260	-1	\N	-1	-1
f	2023-05-28 22:44:28.934391	\N	2023-05-28 22:51:05.835097	2023-05-28 22:44:28.928032	2263	22	\N	37	37	\N	\N	\N	\N	\N	2255	-1	\N	-1	-1
f	2023-05-28 22:44:28.942662	\N	2023-05-28 22:51:05.844411	2023-05-28 22:44:28.934748	2264	22	\N	37	37	\N	\N	\N	\N	\N	2263	-1	\N	-1	-1
f	2023-05-28 22:44:28.947402	\N	2023-05-28 22:51:05.852709	2023-05-28 22:44:28.943014	2265	24	\N	37	37	\N	\N	\N	6	\N	2263	-1	\N	-1	-1
f	2023-05-28 22:44:28.95584	\N	2023-05-28 22:51:05.861344	2023-05-28 22:44:28.94772	2266	22	\N	37	37	76	\N	16	4	\N	2265	-1	\N	-1	-1
f	2023-05-28 22:44:28.969822	\N	2023-05-28 22:51:05.8695	2023-05-28 22:44:28.956688	2267	22	\N	37	37	\N	\N	\N	\N	\N	2249	-1	\N	-1	-1
f	2023-05-28 22:44:28.980385	\N	2023-05-28 22:51:05.877507	2023-05-28 22:44:28.970214	2268	22	\N	37	37	103	\N	\N	\N	\N	2267	-1	\N	-1	-1
f	2023-05-28 22:44:28.985527	\N	2023-05-28 22:51:05.88684	2023-05-28 22:44:28.980758	2269	24	\N	37	37	\N	\N	\N	6	\N	2267	-1	\N	-1	-1
f	2023-05-28 22:44:28.990236	\N	2023-05-28 22:51:05.894835	2023-05-28 22:44:28.985847	2270	22	\N	37	37	\N	\N	\N	7	\N	2269	-1	\N	-1	-1
f	2023-05-28 22:44:28.995098	\N	2023-05-28 22:51:05.905472	2023-05-28 22:44:28.990552	2271	22	\N	37	37	\N	\N	\N	\N	\N	2270	-1	\N	-1	-1
f	2023-05-28 22:44:28.999801	\N	2023-05-28 22:51:05.914647	2023-05-28 22:44:28.995417	2272	22	\N	37	37	\N	\N	\N	6	\N	2271	-1	\N	-1	-1
f	2023-05-28 22:44:29.00488	\N	2023-05-28 22:51:05.923845	2023-05-28 22:44:29.000122	2273	22	\N	37	37	\N	32	\N	5	\N	2272	-1	\N	-1	-1
f	2023-05-28 22:44:29.011232	\N	2023-05-28 22:51:05.93251	2023-05-28 22:44:29.005207	2274	29	\N	37	37	104	\N	17	4	\N	2272	-1	\N	-1	-1
f	2023-05-28 22:44:29.019155	\N	2023-05-28 22:51:05.951244	2023-05-28 22:44:29.011568	2275	24	\N	37	37	\N	\N	\N	\N	\N	2271	-1	\N	-1	-1
f	2023-05-28 22:44:29.023994	\N	2023-05-28 22:51:05.960261	2023-05-28 22:44:29.019525	2276	22	\N	37	37	\N	\N	\N	\N	\N	2270	-1	\N	-1	-1
f	2023-05-28 22:44:29.033213	\N	2023-05-28 22:51:05.97595	2023-05-28 22:44:29.02435	2277	22	\N	37	37	\N	\N	\N	\N	\N	2276	-1	\N	-1	-1
f	2023-05-28 22:44:29.047591	\N	2023-05-28 22:51:05.984437	2023-05-28 22:44:29.033589	2278	24	\N	37	37	\N	\N	\N	\N	\N	2276	-1	\N	-1	-1
f	2023-05-28 22:51:05.990716	\N	2023-05-28 22:52:40.534212	2023-05-28 22:51:05.987548	2279	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-28 22:51:06.000024	\N	2023-05-28 22:52:40.54911	2023-05-28 22:51:05.99109	2280	22	\N	37	37	\N	\N	\N	7	\N	2279	-1	\N	-1	-1
f	2023-05-28 22:51:06.005494	\N	2023-05-28 22:52:40.556976	2023-05-28 22:51:06.000459	2281	22	\N	37	37	\N	\N	\N	\N	\N	2280	-1	\N	-1	-1
f	2023-05-28 22:51:06.011016	\N	2023-05-28 22:52:40.563986	2023-05-28 22:51:06.00586	2282	22	\N	37	37	\N	\N	\N	6	\N	2281	-1	\N	-1	-1
f	2023-05-28 22:51:06.025374	\N	2023-05-28 22:52:40.570978	2023-05-28 22:51:06.011434	2283	22	\N	37	37	25	\N	13	4	\N	2282	-1	\N	-1	-1
f	2023-05-28 22:51:06.03557	\N	2023-05-28 22:52:40.577832	2023-05-28 22:51:06.025798	2284	29	\N	37	37	102	\N	17	4	\N	2282	-1	\N	-1	-1
f	2023-05-28 22:51:06.042927	\N	2023-05-28 22:52:40.584569	2023-05-28 22:51:06.035974	2285	24	\N	37	37	\N	\N	\N	6	\N	2281	-1	\N	-1	-1
f	2023-05-28 22:51:06.04847	\N	2023-05-28 22:52:40.591711	2023-05-28 22:51:06.043319	2286	22	\N	37	37	\N	\N	\N	7	\N	2285	-1	\N	-1	-1
f	2023-05-28 22:51:06.054677	\N	2023-05-28 22:52:40.598464	2023-05-28 22:51:06.04884	2287	22	\N	37	37	\N	\N	\N	\N	\N	2286	-1	\N	-1	-1
f	2023-05-28 22:51:06.066826	\N	2023-05-28 22:52:40.605266	2023-05-28 22:51:06.055055	2288	22	\N	37	37	\N	\N	\N	6	\N	2287	-1	\N	-1	-1
f	2023-05-28 22:51:06.072463	\N	2023-05-28 22:52:40.61296	2023-05-28 22:51:06.067224	2289	22	\N	37	37	\N	32	\N	5	\N	2288	-1	\N	-1	-1
f	2023-05-28 22:51:06.081915	\N	2023-05-28 22:52:40.619639	2023-05-28 22:51:06.072837	2290	26	\N	37	37	102	\N	17	4	\N	2288	-1	\N	-1	-1
f	2023-05-28 22:51:06.08771	\N	2023-05-28 22:52:40.62634	2023-05-28 22:51:06.08231	2291	24	\N	37	37	\N	\N	\N	6	\N	2287	-1	\N	-1	-1
f	2023-05-28 22:51:06.093058	\N	2023-05-28 22:52:40.633864	2023-05-28 22:51:06.088077	2292	22	\N	37	37	\N	32	\N	5	\N	2291	-1	\N	-1	-1
f	2023-05-28 22:51:06.102469	\N	2023-05-28 22:52:40.640686	2023-05-28 22:51:06.093429	2293	23	\N	37	37	102	\N	17	4	\N	2291	-1	\N	-1	-1
f	2023-05-28 22:51:06.108351	\N	2023-05-28 22:52:40.650907	2023-05-28 22:51:06.102864	2294	22	\N	37	37	\N	\N	\N	\N	\N	2286	-1	\N	-1	-1
f	2023-05-28 22:51:06.118288	\N	2023-05-28 22:52:40.669062	2023-05-28 22:51:06.108731	2295	22	\N	37	37	\N	\N	\N	\N	\N	2294	-1	\N	-1	-1
f	2023-05-28 22:51:06.123808	\N	2023-05-28 22:52:40.680464	2023-05-28 22:51:06.118727	2296	24	\N	37	37	\N	\N	\N	6	\N	2294	-1	\N	-1	-1
f	2023-05-28 22:51:06.133076	\N	2023-05-28 22:52:40.687464	2023-05-28 22:51:06.124221	2297	22	\N	37	37	76	\N	16	4	\N	2296	-1	\N	-1	-1
f	2023-05-28 22:51:06.139693	\N	2023-05-28 22:52:40.697746	2023-05-28 22:51:06.133474	2298	22	\N	37	37	\N	\N	\N	\N	\N	2280	-1	\N	-1	-1
f	2023-05-28 22:51:06.150761	\N	2023-05-28 22:52:40.705313	2023-05-28 22:51:06.140078	2299	22	\N	37	37	103	\N	\N	\N	\N	2298	-1	\N	-1	-1
f	2023-05-28 22:51:06.156594	\N	2023-05-28 22:52:40.713919	2023-05-28 22:51:06.151154	2300	24	\N	37	37	\N	\N	\N	6	\N	2298	-1	\N	-1	-1
f	2023-05-28 22:51:06.161923	\N	2023-05-28 22:52:40.72102	2023-05-28 22:51:06.156967	2301	22	\N	37	37	\N	\N	\N	7	\N	2300	-1	\N	-1	-1
f	2023-05-28 22:51:06.17186	\N	2023-05-28 22:52:40.728424	2023-05-28 22:51:06.162285	2302	22	\N	37	37	\N	\N	\N	\N	\N	2301	-1	\N	-1	-1
f	2023-05-28 22:51:06.179082	\N	2023-05-28 22:52:40.73558	2023-05-28 22:51:06.172323	2303	22	\N	37	37	\N	\N	\N	6	\N	2302	-1	\N	-1	-1
f	2023-05-28 22:51:06.184722	\N	2023-05-28 22:52:40.742501	2023-05-28 22:51:06.179487	2304	22	\N	37	37	\N	32	\N	5	\N	2303	-1	\N	-1	-1
f	2023-05-28 22:51:06.194209	\N	2023-05-28 22:52:40.749343	2023-05-28 22:51:06.185093	2305	29	\N	37	37	104	\N	17	4	\N	2303	-1	\N	-1	-1
f	2023-05-28 22:51:06.199943	\N	2023-05-28 22:52:40.756177	2023-05-28 22:51:06.1946	2306	24	\N	37	37	\N	\N	\N	6	\N	2302	-1	\N	-1	-1
f	2023-05-28 22:51:06.205359	\N	2023-05-28 22:52:40.762985	2023-05-28 22:51:06.200355	2307	\N	\N	37	37	\N	\N	\N	6	\N	2306	-1	\N	-1	-1
f	2023-05-28 22:51:06.210661	\N	2023-05-28 22:52:40.771135	2023-05-28 22:51:06.205758	2308	22	\N	37	37	\N	32	\N	5	\N	2307	-1	\N	-1	-1
f	2023-05-28 22:51:06.223558	\N	2023-05-28 22:52:40.778172	2023-05-28 22:51:06.211024	2309	23	\N	37	37	25	\N	13	4	\N	2307	-1	\N	-1	-1
f	2023-05-28 22:51:06.2307	\N	2023-05-28 22:52:40.785241	2023-05-28 22:51:06.223968	2310	22	\N	37	37	\N	\N	\N	\N	\N	2301	-1	\N	-1	-1
f	2023-05-28 22:51:06.240243	\N	2023-05-28 22:52:40.792025	2023-05-28 22:51:06.231085	2311	22	\N	37	37	\N	\N	\N	\N	\N	2310	-1	\N	-1	-1
f	2023-05-28 22:51:06.245672	\N	2023-05-28 22:52:40.798843	2023-05-28 22:51:06.240638	2312	24	\N	37	37	\N	\N	\N	\N	\N	2310	-1	\N	-1	-1
t	2023-05-28 22:52:40.804198	\N	\N	2023-05-28 22:52:40.801772	2313	\N	\N	37	37	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-28 22:52:40.813331	\N	\N	2023-05-28 22:52:40.804507	2314	22	\N	37	37	\N	\N	\N	7	\N	2313	-1	\N	\N	-1
t	2023-05-28 22:52:40.818044	\N	\N	2023-05-28 22:52:40.813675	2315	22	\N	37	37	\N	\N	\N	\N	\N	2314	-1	\N	\N	-1
t	2023-05-28 22:52:40.826816	\N	\N	2023-05-28 22:52:40.818369	2316	22	\N	37	37	\N	\N	\N	6	\N	2315	-1	\N	\N	-1
t	2023-05-28 22:52:40.835399	\N	\N	2023-05-28 22:52:40.827162	2317	22	\N	37	37	25	\N	13	4	\N	2316	-1	\N	\N	-1
t	2023-05-28 22:52:40.844644	\N	\N	2023-05-28 22:52:40.835746	2318	29	\N	37	37	102	\N	17	4	\N	2316	-1	\N	\N	-1
t	2023-05-28 22:52:40.849525	\N	\N	2023-05-28 22:52:40.844983	2319	24	\N	37	37	\N	\N	\N	6	\N	2315	-1	\N	\N	-1
t	2023-05-28 22:52:40.854232	\N	\N	2023-05-28 22:52:40.849821	2320	22	\N	37	37	\N	\N	\N	7	\N	2319	-1	\N	\N	-1
t	2023-05-28 22:52:40.858778	\N	\N	2023-05-28 22:52:40.854536	2321	22	\N	37	37	\N	\N	\N	\N	\N	2320	-1	\N	\N	-1
t	2023-05-28 22:52:40.863144	\N	\N	2023-05-28 22:52:40.859072	2322	22	\N	37	37	\N	\N	\N	6	\N	2321	-1	\N	\N	-1
t	2023-05-28 22:52:40.867916	\N	\N	2023-05-28 22:52:40.863435	2323	22	\N	37	37	\N	32	\N	5	\N	2322	-1	\N	\N	-1
t	2023-05-28 22:52:40.87598	\N	\N	2023-05-28 22:52:40.868242	2324	26	\N	37	37	102	\N	17	4	\N	2322	-1	\N	\N	-1
t	2023-05-28 22:52:40.880869	\N	\N	2023-05-28 22:52:40.876358	2325	24	\N	37	37	\N	\N	\N	6	\N	2321	-1	\N	\N	-1
t	2023-05-28 22:52:40.885318	\N	\N	2023-05-28 22:52:40.881161	2326	22	\N	37	37	\N	32	\N	5	\N	2325	-1	\N	\N	-1
t	2023-05-28 22:52:40.893167	\N	\N	2023-05-28 22:52:40.885608	2327	23	\N	37	37	102	\N	17	4	\N	2325	-1	\N	\N	-1
t	2023-05-28 22:52:40.897946	\N	\N	2023-05-28 22:52:40.893489	2328	22	\N	37	37	\N	\N	\N	\N	\N	2320	-1	\N	\N	-1
t	2023-05-28 22:52:40.906039	\N	\N	2023-05-28 22:52:40.898242	2329	22	\N	37	37	\N	\N	\N	\N	\N	2328	-1	\N	\N	-1
t	2023-05-28 22:52:40.91129	\N	\N	2023-05-28 22:52:40.90697	2330	24	\N	37	37	\N	\N	\N	6	\N	2328	-1	\N	\N	-1
t	2023-05-28 22:52:40.919166	\N	\N	2023-05-28 22:52:40.911595	2331	22	\N	37	37	76	\N	16	4	\N	2330	-1	\N	\N	-1
t	2023-05-28 22:52:40.924192	\N	\N	2023-05-28 22:52:40.919499	2332	22	\N	37	37	\N	\N	\N	\N	\N	2314	-1	\N	\N	-1
t	2023-05-28 22:52:40.934704	\N	\N	2023-05-28 22:52:40.924498	2333	22	\N	37	37	103	\N	\N	\N	\N	2332	-1	\N	\N	-1
t	2023-05-28 22:52:40.939572	\N	\N	2023-05-28 22:52:40.935043	2334	24	\N	37	37	\N	\N	\N	6	\N	2332	-1	\N	\N	-1
t	2023-05-28 22:52:40.943935	\N	\N	2023-05-28 22:52:40.939871	2335	22	\N	37	37	\N	\N	\N	7	\N	2334	-1	\N	\N	-1
t	2023-05-28 22:52:40.950497	\N	\N	2023-05-28 22:52:40.944295	2336	22	\N	37	37	\N	\N	\N	\N	\N	2335	-1	\N	\N	-1
t	2023-05-28 22:52:40.954951	\N	\N	2023-05-28 22:52:40.950829	2337	22	\N	37	37	\N	\N	\N	6	\N	2336	-1	\N	\N	-1
t	2023-05-28 22:52:40.959604	\N	\N	2023-05-28 22:52:40.955243	2338	22	\N	37	37	\N	32	\N	5	\N	2337	-1	\N	\N	-1
t	2023-05-28 22:52:40.967797	\N	\N	2023-05-28 22:52:40.959897	2339	29	\N	37	37	104	\N	17	4	\N	2337	-1	\N	\N	-1
t	2023-05-28 22:52:40.97271	\N	\N	2023-05-28 22:52:40.968124	2340	24	\N	37	37	\N	\N	\N	6	\N	2336	-1	\N	\N	-1
t	2023-05-28 22:52:40.977059	\N	\N	2023-05-28 22:52:40.973008	2341	\N	\N	37	37	\N	\N	\N	6	\N	2340	-1	\N	\N	-1
t	2023-05-28 22:52:40.981507	\N	\N	2023-05-28 22:52:40.977351	2342	22	\N	37	37	\N	32	\N	5	\N	2341	-1	\N	\N	-1
t	2023-05-28 22:52:40.990069	\N	\N	2023-05-28 22:52:40.981799	2343	23	\N	37	37	25	\N	13	4	\N	2341	-1	\N	\N	-1
t	2023-05-28 22:52:40.99487	\N	\N	2023-05-28 22:52:40.990398	2344	22	\N	37	37	\N	\N	\N	\N	\N	2335	-1	\N	\N	-1
t	2023-05-28 22:52:41.002377	\N	\N	2023-05-28 22:52:40.995166	2345	22	\N	37	37	\N	\N	\N	\N	\N	2344	-1	\N	\N	-1
t	2023-05-28 22:52:41.008971	\N	\N	2023-05-28 22:52:41.003532	2346	24	\N	37	37	\N	\N	\N	6	\N	2344	-1	\N	\N	-1
t	2023-05-28 22:52:41.017567	\N	\N	2023-05-28 22:52:41.009305	2347	22	\N	37	37	104	\N	17	4	\N	2346	-1	\N	\N	-1
t	2023-05-28 22:52:41.026078	\N	\N	2023-05-28 22:52:41.017921	2348	23	\N	37	37	25	\N	13	4	\N	2346	-1	\N	\N	-1
f	2023-07-31 12:00:48.773978	\N	2023-07-31 12:02:50.629965	2023-07-31 12:00:48.76945	2349	\N	\N	38	38	\N	\N	\N	\N	\N	\N	1	\N	1	-1
f	2023-07-31 12:00:48.950438	\N	2023-07-31 12:02:50.655016	2023-07-31 12:00:48.939434	2350	22	\N	38	38	109	\N	14	4	\N	2349	1	\N	1	-1
f	2023-07-31 12:00:48.972814	\N	2023-07-31 12:02:50.67842	2023-07-31 12:00:48.968278	2351	\N	\N	38	38	\N	\N	\N	\N	\N	2349	1	\N	1	-1
t	2023-07-31 12:02:50.735776	\N	\N	2023-07-31 12:02:50.733631	2352	\N	\N	38	38	\N	\N	\N	\N	\N	\N	1	\N	\N	-1
t	2023-07-31 12:02:50.756549	\N	\N	2023-07-31 12:02:50.750617	2353	22	\N	38	38	109	\N	14	4	\N	2352	1	\N	\N	-1
t	2023-07-31 12:02:50.774327	\N	\N	2023-07-31 12:02:50.77061	2354	24	\N	38	38	110	\N	20	4	\N	2352	1	\N	\N	-1
\.


--
-- Data for Name: seguridadGrupo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadGrupo" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, nombre, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
\.


--
-- Data for Name: seguridadGrupoPermiso; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadGrupoPermiso" ("grupoId", "permisoId") FROM stdin;
\.


--
-- Data for Name: seguridadPermiso; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadPermiso" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, nombre, descripcion, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-01-02 13:52:39.494727	\N	\N	2023-01-02 13:52:39.492935	1	|menu|admin|feriados|	Administrar Feriados	-1	\N	\N	-1
t	2023-01-02 13:52:39.501397	\N	\N	2023-01-02 13:52:39.499973	2	|admin|adminFeriados|acceso|	Administrar Feriados	-1	\N	\N	-1
t	2023-01-02 13:52:39.507078	\N	\N	2023-01-02 13:52:39.505631	3	|menu|admin|parametros|	Administrar Parámtros del sistema	-1	\N	\N	-1
t	2023-01-02 13:52:39.513161	\N	\N	2023-01-02 13:52:39.51158	4	|admin|parametros|acceso|	Administrar Parámtros del sistema	-1	\N	\N	-1
t	2023-01-02 13:52:39.520681	\N	\N	2023-01-02 13:52:39.519329	5	|menu|seguridad|usuarios|	Administrar Usuarios	-1	\N	\N	-1
t	2023-01-02 13:52:39.527752	\N	\N	2023-01-02 13:52:39.52636	6	|seguridad|usuarios|acceso|	Administrar Usuarios	-1	\N	\N	-1
t	2023-01-02 13:52:39.533476	\N	\N	2023-01-02 13:52:39.532039	7	|menu|seguridad|roles|	Administrar Rol	-1	\N	\N	-1
t	2023-01-02 13:52:39.538667	\N	\N	2023-01-02 13:52:39.537279	8	|seguridad|rol|acceso|	Administrar Rol	-1	\N	\N	-1
t	2023-01-02 13:52:39.543711	\N	\N	2023-01-02 13:52:39.542339	9	|menu|seguridad|grupos|	Administrar Grupos de Usuarios	-1	\N	\N	-1
t	2023-01-02 13:52:39.550318	\N	\N	2023-01-02 13:52:39.548196	10	|seguridad|grupo|acceso|	Administrar Grupos de Usuarios	-1	\N	\N	-1
t	2023-01-02 13:52:39.55559	\N	\N	2023-01-02 13:52:39.554029	11	|menu|seguridad|permisos|	Administración Permisos	-1	\N	\N	-1
t	2023-01-02 13:52:39.561824	\N	\N	2023-01-02 13:52:39.560453	12	|seguridad|permiso|acceso|	Administración Permisos	-1	\N	\N	-1
t	2023-01-02 13:52:39.567209	\N	\N	2023-01-02 13:52:39.565818	13	|menu|cuenta|modificaciondatos|	Modificar Datos Cuenta	-1	\N	\N	-1
t	2023-01-02 13:52:39.572493	\N	\N	2023-01-02 13:52:39.571043	14	|cuenta|modificaciondatos|acceso|	Modificar Datos Cuenta	-1	\N	\N	-1
t	2023-01-02 13:52:39.577846	\N	\N	2023-01-02 13:52:39.57629	15	|menu|cuenta|modificacionclave|	Modificar Password Cuenta	-1	\N	\N	-1
t	2023-01-02 13:52:39.584647	\N	\N	2023-01-02 13:52:39.583197	16	|cuenta|modificacionclave|acceso|	Modificar Password Cuenta	-1	\N	\N	-1
t	2023-01-02 13:52:39.59098	\N	\N	2023-01-02 13:52:39.588793	17	|admin|dashboard|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.596675	\N	\N	2023-01-02 13:52:39.595324	18	|menu|dashboard|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.602316	\N	\N	2023-01-02 13:52:39.600869	19	|formula|adminFormulas|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.607514	\N	\N	2023-01-02 13:52:39.606218	20	|formula|adminFormulas|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.614521	\N	\N	2023-01-02 13:52:39.612305	21	|formula|adminFormulas|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.619876	\N	\N	2023-01-02 13:52:39.618519	22	|formula|adminFormulas|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.626636	\N	\N	2023-01-02 13:52:39.625226	23	|version|adminVersion|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.632575	\N	\N	2023-01-02 13:52:39.63113	24	|version|adminVersion|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.638064	\N	\N	2023-01-02 13:52:39.636623	25	|version|adminVersion|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.643481	\N	\N	2023-01-02 13:52:39.642051	26	|version|adminVersion|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.650785	\N	\N	2023-01-02 13:52:39.649486	27	|version|adminVersion|obtenerDetalles|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.657007	\N	\N	2023-01-02 13:52:39.654961	28	|nodo|adminNodo|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.662885	\N	\N	2023-01-02 13:52:39.661554	29	|nodo|adminNodo|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.668351	\N	\N	2023-01-02 13:52:39.667012	30	|nodo|adminNodo|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.673711	\N	\N	2023-01-02 13:52:39.672331	31	|nodo|adminNodo|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.682356	\N	\N	2023-01-02 13:52:39.680575	32	|nodo|adminNodo|traerArbol|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.68849	\N	\N	2023-01-02 13:52:39.686794	33	|nodo|adminNodo|traerArbolSimple|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.694297	\N	\N	2023-01-02 13:52:39.692942	34	|termino|adminTermino|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.699457	\N	\N	2023-01-02 13:52:39.698104	35	|termino|adminTermino|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.704641	\N	\N	2023-01-02 13:52:39.703324	36	|termino|adminTermino|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.712434	\N	\N	2023-01-02 13:52:39.708958	37	|termino|adminTermino|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.718941	\N	\N	2023-01-02 13:52:39.717015	38	|termino|adminTermino|unir|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.724302	\N	\N	2023-01-02 13:52:39.722926	39	|tablaAuxiliarDetalle|tipoNodo|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.729504	\N	\N	2023-01-02 13:52:39.728175	40	|tablaAuxiliarDetalle|tipoTermino|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.734881	\N	\N	2023-01-02 13:52:39.733562	41	|tablaAuxiliarDetalle|tipoOperador|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.740132	\N	\N	2023-01-02 13:52:39.738726	42	|tablaAuxiliar|adminTablaAuxiliar|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.748588	\N	\N	2023-01-02 13:52:39.747238	43	|tablaAuxiliar|adminTablaAuxiliar|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.754535	\N	\N	2023-01-02 13:52:39.752704	44	|tablaAuxiliar|adminTablaAuxiliar|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.759869	\N	\N	2023-01-02 13:52:39.758491	45	|tablaAuxiliar|adminTablaAuxiliar|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.76509	\N	\N	2023-01-02 13:52:39.763771	46	|tablaAuxiliarDetalle|adminTablaAuxiliarDetalle|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.770339	\N	\N	2023-01-02 13:52:39.768968	47	|tablaAuxiliarDetalle|adminTablaAuxiliarDetalle|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.778432	\N	\N	2023-01-02 13:52:39.77657	48	|tablaAuxiliarDetalle|adminTablaAuxiliarDetalle|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.783962	\N	\N	2023-01-02 13:52:39.782599	49	|tablaAuxiliarDetalle|adminTablaAuxiliarDetalle|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.789355	\N	\N	2023-01-02 13:52:39.787982	50	|concepto|adminConcepto|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.794693	\N	\N	2023-01-02 13:52:39.793384	51	|concepto|adminConcepto|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.800094	\N	\N	2023-01-02 13:52:39.798775	52	|concepto|adminConcepto|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.814798	\N	\N	2023-01-02 13:52:39.813295	54	|matriz|adminMatriz|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.820752	\N	\N	2023-01-02 13:52:39.819346	55	|matriz|adminMatriz|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.826021	\N	\N	2023-01-02 13:52:39.824615	56	|matriz|adminMatriz|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.831328	\N	\N	2023-01-02 13:52:39.830027	57	|matriz|adminMatriz|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.836592	\N	\N	2023-01-02 13:52:39.835207	58	|matrizDetalle|adminMatrizDetalle|crear|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.844975	\N	\N	2023-01-02 13:52:39.84353	59	|matrizDetalle|adminMatrizDetalle|listar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.850953	\N	\N	2023-01-02 13:52:39.849473	60	|matrizDetalle|adminMatrizDetalle|modificar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.856299	\N	\N	2023-01-02 13:52:39.854957	61	|matrizDetalle|adminMatrizDetalle|borrar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	62	|admin|formulas|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	63	|menu|admin|formulas|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	64	|admin|concepto|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	65	|menu|admin|concepto|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	66	|admin|matriz|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	67	|menu|admin|matriz|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	68	|admin|auxiliar|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	69	|menu|admin|auxiliar|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	70	|admin|termino|acceso|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39	\N	\N	2023-01-02 13:52:39	71	|menu|admin|termino|	\N	-1	\N	\N	-1
t	2023-01-02 13:52:39.806732	\N	\N	2023-01-02 13:52:39.804429	53	|concepto|adminConcepto|borrar|	\N	-1	\N	\N	-1
\.


--
-- Data for Name: seguridadRol; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadRol" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, nombre, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.038858	\N	\N	2022-11-22 13:53:46.035711	-1	Administrador	-1	\N	\N	-1
t	2023-05-11 12:33:00.85213	2023-05-11 13:23:00.437621	\N	2023-05-11 13:22:59.858824	1	Administrador de formulas	-1	-1	\N	-1
\.


--
-- Data for Name: seguridadRolPermiso; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadRolPermiso" ("rolId", "permisoId") FROM stdin;
-1	1
-1	2
-1	3
-1	4
-1	5
-1	6
-1	7
-1	8
-1	9
-1	10
-1	11
-1	12
-1	13
-1	14
-1	15
-1	16
-1	17
-1	18
-1	19
-1	20
-1	21
-1	22
-1	23
-1	24
-1	25
-1	26
-1	27
-1	28
-1	29
-1	30
-1	31
-1	32
-1	33
-1	34
-1	35
-1	36
-1	37
-1	38
-1	39
-1	40
-1	41
-1	42
-1	43
-1	44
-1	45
-1	46
-1	47
-1	48
-1	49
-1	50
-1	51
-1	52
-1	53
-1	54
-1	55
-1	56
-1	57
-1	58
-1	59
-1	60
-1	61
-1	62
-1	63
-1	64
-1	65
-1	66
-1	67
-1	68
-1	69
-1	70
-1	71
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
1	39
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	50
1	51
1	52
1	54
1	55
1	56
1	57
1	58
1	59
1	60
1	61
1	62
1	63
1	64
1	65
1	66
1	67
1	68
1	69
1	70
1	71
1	53
\.


--
-- Data for Name: seguridadUsuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadUsuario" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, username, email, nombre, apellido, password, token, "tokenTrimu", opciones, "cambiarPassword", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-05-11 09:38:02.32041	2023-05-11 13:39:11.20349	\N	2023-05-11 13:18:44.217126	2	42692	natimeza1988@gmail.com	Noelia Natalia	Meza	$pbkdf2-sha256$29000$5zwnZKx1rtXamzMmBCAk5A$GiWRzXLDNC2jHIRpuo6NrWVS54VqP/7oTZdWJlJh1Is	8fcjn1kb	\N		f	-1	-1	\N	-1
t	2022-11-22 13:53:46.012791	2023-07-31 13:52:26.829184	\N	2023-01-01 23:11:22.758688	-1	admin	god@micompania.com.ar	God	God	$pbkdf2-sha256$29000$RsgZ4/w/J6TU2ru3do7Reg$kR6Ptmn5GWEPdJJHwebPYw5Dklc/lkAZMmwoon2dNx8	cch552xj	\N	\N	f	-1	-1	\N	-1
t	2023-05-11 09:36:26.599884	2023-07-31 13:53:41.88932	\N	2023-05-11 13:18:56.569361	1	39831	yanuperez@gmail.com	Yanina	Perez	$pbkdf2-sha256$29000$rVVqjfG.dw6hlLJWCgEgZA$U.jwe/q5lbgvb22latzcmuOvBiQ7yrySsBJC5ZPUo8U	vjsz60au	\N		f	-1	-1	\N	-1
\.


--
-- Data for Name: seguridadUsuarioGrupo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadUsuarioGrupo" ("usuarioId", "grupoId") FROM stdin;
\.


--
-- Data for Name: seguridadUsuarioPermiso; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadUsuarioPermiso" ("usuarioId", "permisoId") FROM stdin;
2	16
1	16
\.


--
-- Data for Name: seguridadUsuarioRol; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."seguridadUsuarioRol" ("usuarioId", "rolId") FROM stdin;
-1	-1
2	1
1	1
\.


--
-- Data for Name: tablaAuxiliar; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."tablaAuxiliar" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "codigoString", "codigoInt", descripcion, numerico1, numerico2, numerico3, numerico4, numerico5, numerico6, numerico7, numerico8, numerico9, numerico10, caracter1, caracter2, caracter3, descripcion1, descripcion2, descripcion3, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-12-11 23:11:51.1	\N	\N	2022-12-11 23:11:51.1	100004	ATRIBUTOSIRADIG	\N	Atributo Siradig	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ENTIDAD	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.424	\N	\N	2022-11-22 13:53:46.424	100005	\N	MES_BASE	Deducción hijo	GENERAL	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-12-11 23:11:51.1	\N	\N	2022-12-11 23:11:51.1	100002	\N	MES_BASE	BASE IMPONIBLE GANANCIAS	BASE_IMP_GAN	\N	\N	MAS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:18:50.195	\N	\N	2023-05-17 14:18:50.195	100016	TIPOEMPRESA	\N	Tipo de empresa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:18:50.195	\N	\N	2023-05-17 14:18:50.195	100017	TIPOEMPRESA	\N	Tipo de empresa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:18:50.195	\N	\N	2023-05-17 14:18:50.195	100018	EST_LIQUI	\N	Estado liquidacion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.415156	\N	\N	2022-11-22 13:53:46.41491	1002	PARAMETROS	\N	Parámetros	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.424505	\N	\N	2022-11-22 13:53:46.424333	1009	MAIL	\N	Tipo Mails	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.42966	\N	\N	2022-11-22 13:53:46.429456	1010	ESTADOS	\N	Estados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.43654	\N	\N	2022-11-22 13:53:46.436363	1011	TIPO NODOS	\N	Tipo Nodos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.441696	\N	\N	2022-11-22 13:53:46.441528	1012	TIPO TERMINO	\N	Tipo Terminos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.44807	\N	\N	2022-11-22 13:53:46.447895	1013	OPERADOR LOGICO	\N	Operador Logico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.666661	\N	\N	2022-11-22 13:53:46.666463	10002	PERIODOS	\N	Periodos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.672868	\N	\N	2022-11-22 13:53:46.672689	10003	LEGAJOS CARGOS	\N	Legajos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.683197	\N	\N	2022-11-22 13:53:46.682968	10005	TIPO ACUMULADOR	\N	Tipo Acumulador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.688163	\N	\N	2022-11-22 13:53:46.687955	10006	TIPO CONCEPTO GANANCIA	\N	Acumulador Ganancia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.694291	\N	\N	2022-11-22 13:53:46.693609	10007	FUNCIONES	\N	Funciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.727578	\N	\N	2022-11-22 13:53:46.727334	10008	ENTIDADES	\N	Entidades	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.734711	\N	\N	2022-11-22 13:53:46.734504	10009	RELATIVO ABSOLUTO	\N	Relativo Absoluto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.653441	\N	\N	2022-11-22 13:53:46.653304	10010	ATRIBUTOS	\N	Atributos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ENTIDAD	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46	\N	\N	2022-11-22 13:53:46	10011	AGREGACION	\N	Agregacion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
f	2023-05-02 10:33:53.755751	\N	2023-05-02 10:34:53.047004	2023-05-02 10:33:53.750252	100001	\N	40000	prueba tabla auxiliar 	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
t	2022-11-22 13:53:46.659192	2023-07-31 13:54:11.60899	\N	2022-11-22 13:53:46.658929	10001	OPERACIONES	\N	Operaciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	1	\N	-1
t	2023-05-02 14:44:23.39238	2023-07-31 13:54:36.714246	\N	2023-05-02 14:44:23.38793	100010	Categorias	\N	Basico por categorias	Basico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	1	\N	-1
f	2023-05-02 10:47:23.07888	\N	2023-05-02 10:47:39.476979	2023-05-02 10:47:23.074708	100006	\N	1650	a	a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 10:52:14.846939	\N	2023-05-02 11:25:26.575938	2023-05-02 10:52:14.842824	100008	\N	1000000	Prueba de tablas auxiliares	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	item	\N	\N	\N	\N	\N	-1	\N	-1	-1
t	2023-05-02 11:26:41.223859	\N	\N	2023-05-02 11:26:41.219689	100009	Prueba tabla auxiliar	\N	Prueba de tabla auxiliar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Item de prueba 	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:37:56.400358	2023-05-17 13:38:56.480531	\N	2023-05-17 13:37:56.390185	100012	codigo_tipo_liq	\N	Tipo de liquidación	Dummy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2023-05-17 13:54:29.459356	\N	\N	2023-05-17 13:54:29.455108	100014	codigo_convenio	\N	Convenios	Dummy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.677973	2023-04-24 14:23:13.740702	\N	2022-11-22 13:53:46.677812	10004	TIPO CONCEPTO	\N	Tipo Concepto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
f	2022-12-11 23:11:51.1	\N	2023-04-27 15:04:11.25901	2022-12-11 23:11:51.1	100003	\N	\N	EntidadCargo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-04-27 12:08:40.936473	\N	2023-05-02 10:32:58.661447	2023-04-27 12:08:40.933914	100000	PRUEBA	\N	PRUEBA	A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
f	2023-05-02 10:49:54.820345	\N	2023-05-02 10:50:55.809852	2023-05-02 10:49:54.815722	100007	prueba tabla	\N	prueba de tabla auxiliar 	1000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	-1	-1
t	2023-05-04 12:29:46.170367	\N	\N	2023-05-04 12:29:46.166001	100011	Camioneros	\N	Tabla con los jornales por categoria	Jornal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:41:20.245336	\N	\N	2023-05-17 13:41:20.241012	100013	\N	Subtipo liquidación	Subtipo liquidación	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tipo_liquidación	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:18:50.195299	\N	\N	2023-05-17 14:18:50.191786	100015	\N	cod_grupo_concepto	Grupo conceptos	dummy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
\.


--
-- Data for Name: tablaAuxiliarDetalle; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."tablaAuxiliarDetalle" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "tablaAuxiliarId", "fechaDesde", "fechaHasta", "codigoString", "codigoInt", descripcion, numerico1, numerico2, numerico3, numerico4, numerico5, numerico6, numerico7, numerico8, numerico9, numerico10, caracter1, caracter2, caracter3, descripcion1, descripcion2, descripcion3, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-04-05 09:54:03.752	\N	\N	2023-04-05 09:54:03.751	1	1010	1970-01-01 00:00:00	\N	HISTORICO	\N	Historico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.76	\N	\N	2023-04-05 09:54:03.76	2	1010	1970-01-01 00:00:00	\N	PROCESO	\N	Proceso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.765	\N	\N	2023-04-05 09:54:03.765	3	1010	1970-01-01 00:00:00	\N	TERMINADA	\N	Actual	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.77	\N	\N	2023-04-05 09:54:03.77	4	1011	1970-01-01 00:00:00	\N	TERMINO	\N	Termino	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.775	\N	\N	2023-04-05 09:54:03.774	5	1011	1970-01-01 00:00:00	\N	FROMULA	\N	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.78	\N	\N	2023-04-05 09:54:03.779	6	1011	1970-01-01 00:00:00	\N	EXPRESION	\N	Expresion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.784	\N	\N	2023-04-05 09:54:03.784	7	1011	1970-01-01 00:00:00	\N	SI	\N	Si	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.789	\N	\N	2023-04-05 09:54:03.789	8	1011	1970-01-01 00:00:00	\N	SEGUN	\N	Segun	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.794	\N	\N	2023-04-05 09:54:03.793	9	1011	1970-01-01 00:00:00	\N	FUNCION	\N	Funcion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.798	\N	\N	2023-04-05 09:54:03.798	10	1012	1970-01-01 00:00:00	\N	ACUMULADORTIPOCON	\N	Acumulador tipo con	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.803	\N	\N	2023-04-05 09:54:03.803	11	1012	1970-01-01 00:00:00	\N	ACUMULADORFROMULA	\N	Acumulador formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.808	\N	\N	2023-04-05 09:54:03.808	12	1012	1970-01-01 00:00:00	\N	AUXILIAR	\N	Auxiliar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.813	\N	\N	2023-04-05 09:54:03.813	13	1012	1970-01-01 00:00:00	\N	ATRIBUTO	\N	Atributo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.819	\N	\N	2023-04-05 09:54:03.819	14	1012	1970-01-01 00:00:00	\N	VARIABLE	\N	Variable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.86	\N	\N	2023-04-05 09:54:03.86	15	1012	1970-01-01 00:00:00	\N	MATRIZ	\N	Matriz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.869	\N	\N	2023-04-05 09:54:03.869	17	1012	1970-01-01 00:00:00	\N	COSNTANTECHAR	\N	Constante Char	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.874	\N	\N	2023-04-05 09:54:03.874	18	1012	1970-01-01 00:00:00	\N	CONCEPTO	\N	Concepto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.879	\N	\N	2023-04-05 09:54:03.879	19	1012	1970-01-01 00:00:00	\N	ACUMULADORCONCEPTO	\N	Acumulador Concepto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.889	\N	\N	2023-04-05 09:54:03.889	21	1012	1970-01-01 00:00:00	\N	ACUMULADORTIPOCONGANANCIA	\N	Acumulador ganancia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.894	\N	\N	2023-04-05 09:54:03.893	22	1013	1970-01-01 00:00:00	\N	SUMA	\N	+	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.899	\N	\N	2023-04-05 09:54:03.899	23	1013	1970-01-01 00:00:00	\N	RESTA	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.904	\N	\N	2023-04-05 09:54:03.904	24	1013	1970-01-01 00:00:00	\N	MULTIPLICADO	\N	 ∗ 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.909	\N	\N	2023-04-05 09:54:03.909	25	1013	1970-01-01 00:00:00	\N	DIVIDIDO	\N	/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.914	\N	\N	2023-04-05 09:54:03.914	26	1013	1970-01-01 00:00:00	\N	MAYOR	\N	>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.918	\N	\N	2023-04-05 09:54:03.918	27	1013	1970-01-01 00:00:00	\N	MENOR	\N	<	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.923	\N	\N	2023-04-05 09:54:03.923	28	1013	1970-01-01 00:00:00	\N	MAYORIGUAL	\N	>=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.928	\N	\N	2023-04-05 09:54:03.928	29	1013	1970-01-01 00:00:00	\N	MENORIGUAL	\N	<=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.933	\N	\N	2023-04-05 09:54:03.933	30	1013	1970-01-01 00:00:00	\N	AND	\N	AND	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.981	\N	\N	2023-04-05 09:54:03.98	31	10003	1970-01-01 00:00:00	\N	CARGO	\N	cargo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.986	\N	\N	2023-04-05 09:54:03.985	32	10003	1970-01-01 00:00:00	\N	LEGAJO	\N	legajo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.99	\N	\N	2023-04-05 09:54:03.99	33	10002	1970-01-01 00:00:00	\N	LIQUIDACION	\N	liquidacion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.995	\N	\N	2023-04-05 09:54:03.995	34	10002	1970-01-01 00:00:00	\N	PAGO	\N	pago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04	\N	\N	2023-04-05 09:54:03.999	35	10009	1970-01-01 00:00:00	\N	ANIOCURSO	\N	Año en curso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.004	\N	\N	2023-04-05 09:54:04.004	36	10009	1970-01-01 00:00:00	\N	ABSOLUTO	\N	Absoluto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.009	\N	\N	2023-04-05 09:54:04.009	37	10006	1970-01-01 00:00:00	\N	BASEGANANCIAS	\N	Base Ganancias	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.013	\N	\N	2023-04-05 09:54:04.013	38	10006	1970-01-01 00:00:00	\N	DEDUCCIONES	\N	Deducciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.018	\N	\N	2023-04-05 09:54:04.017	39	10004	1970-01-01 00:00:00	\N	NOREMUNERATIVO	\N	No Remunerativo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.022	\N	\N	2023-04-05 09:54:04.022	40	10004	1970-01-01 00:00:00	\N	DESCUENTO	\N	Descuento	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.027	\N	\N	2023-04-05 09:54:04.027	41	10001	1970-01-01 00:00:00	\N	MEJOR	\N	Mejor	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.031	\N	\N	2023-04-05 09:54:04.031	42	10001	1970-01-01 00:00:00	\N	SUMA	\N	Suma	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.036	\N	\N	2023-04-05 09:54:04.036	43	10008	1970-01-01 00:00:00	\N	SIRADIG	\N	siradig	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.041	\N	\N	2023-04-05 09:54:04.04	44	10008	1970-01-01 00:00:00	\N	EMPLEADO	\N	empleado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.045	\N	\N	2023-04-05 09:54:04.045	45	10010	1970-01-01 00:00:00	\N	MOVILIDAD	\N	Movilidad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.05	\N	\N	2023-04-05 09:54:04.049	46	10010	1970-01-01 00:00:00	\N	INDUMENTARIO	\N	Indumentario	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.054	\N	\N	2023-04-05 09:54:04.054	47	10005	1970-01-01 00:00:00	\N	ACUM1	\N	Acum 1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.059	\N	\N	2023-04-05 09:54:04.058	48	10005	1970-01-01 00:00:00	\N	ACUM2	\N	Acum 2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.071	\N	\N	2023-04-05 09:54:04.071	51	10011	1970-01-01 00:00:00	\N	MAXIMO	\N	Maximo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	52	10011	1970-01-01 00:00:00	\N	ACTUAL	\N	Actual	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	53	1013	2023-04-05 09:54:04.076	\N	IGUAL	\N	==	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	54	1013	2023-04-05 09:54:04.076	\N	MIN	\N	MINIMO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	55	1013	2023-04-05 09:54:04.076	\N	DISTINTO	\N	!=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	56	1013	2023-04-05 09:54:04.076	\N	RANGO	\N	:	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	57	10002	2023-04-05 09:54:04.076	\N	DEVENGADO	\N	devengado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	58	10009	2023-04-05 09:54:04.076	\N	RELATIVO	\N	Relativo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	59	10007	2023-01-01 00:00:00	\N	MES	\N	Mes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	63	10007	2023-01-01 00:00:00	\N	MESES	\N	MESES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	64	10007	2023-01-01 00:00:00	\N	AÑOS	\N	AÑOS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
f	2023-05-02 11:00:41.704109	\N	2023-05-02 11:25:17.800858	2023-05-02 11:00:41.691994	65	100008	2023-05-02 00:00:00	2023-05-02 00:00:00	\N	123	muere aca	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a	\N	\N	\N	\N	\N	-1	\N	-1	-1
t	2023-05-02 11:27:47.557211	\N	\N	2023-05-02 11:27:47.54619	66	100009	2023-05-02 00:00:00	\N	prueba item A	\N	prueba de descripcion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 11:28:13.930021	\N	\N	2023-05-02 11:28:13.918448	67	100009	2023-05-02 00:00:00	\N	prueba item b	\N	prueba item 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 11:28:37.757365	\N	\N	2023-05-02 11:28:37.746928	68	100009	2023-05-02 00:00:00	\N	prueba item c	\N	prueba item	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 14:49:16.550308	\N	\N	2023-05-02 14:49:16.536508	69	100010	2023-01-01 00:00:00	\N	1606	\N	Obrero categoria 06	44077.40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 14:52:07.277066	\N	\N	2023-05-02 14:52:07.266464	70	100010	2023-01-01 00:00:00	\N	1607	\N	Obrero categoria 07	44330.74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 14:53:18.564944	\N	\N	2023-05-02 14:53:18.553409	71	100010	2023-01-01 00:00:00	\N	1608	\N	Obrero categoria 08	44613.44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 15:14:21.32055	\N	\N	2023-05-02 15:14:21.308849	72	100010	2023-01-01 00:00:00	\N	1609	\N	Obrero categoria 09	44876.86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 15:16:41.644194	\N	\N	2023-05-02 15:16:41.633675	73	100010	2023-01-01 00:00:00	\N	1610	\N	Obrero categoria 10	45149.91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 15:25:07.418964	\N	\N	2023-05-02 15:25:07.406934	74	100010	2023-01-01 00:00:00	\N	1714	\N	AJ4 supervisor coordinador capataz	47879.62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 15:29:57.283317	\N	\N	2023-05-02 15:29:57.272813	76	100010	2023-01-01 00:00:00	\N	1814	\N	AJ5 Jefe de sección sin funcion	47879.62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.067	\N	\N	2023-04-05 09:54:04.067	50	10007	1970-01-01 00:00:00	\N	AÑO	\N	AÑO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.063	\N	\N	2023-04-05 09:54:04.063	49	10007	1970-01-01 00:00:00	\N	PAR_ENT	\N	PARTE ENTERA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	60	10007	2023-01-01 00:00:00	\N	ESNULO	\N	ES NULO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	61	10007	2023-01-01 00:00:00	\N	AÑOYMES	\N	AÑO Y MES	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:04.076	\N	\N	2023-04-05 09:54:04.076	62	10007	2023-01-01 00:00:00	\N	ESNONULO	\N	ES NO NULO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-02 15:26:10.703933	2023-05-02 15:28:50.240184	\N	2023-05-02 15:26:10.693543	75	100010	2023-01-01 00:00:00	\N	1815	\N	AJ5 Jefe de división sin funcion 	47879.62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2023-05-04 12:32:36.201726	\N	\N	2023-05-04 12:32:36.190314	77	100011	2023-01-01 00:00:00	\N	10	\N	Camionero conductor	100.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.865	\N	\N	2023-04-05 09:54:03.864	16	1012	1970-01-01 00:00:00	\N	CONSTANTEINT	\N	Constante Numerico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-04-05 09:54:03.884	\N	\N	2023-04-05 09:54:03.884	20	1012	1970-01-01 00:00:00	\N	CONSTANTEFLOAT	\N	Constante Decimal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:39:43.253755	\N	\N	2023-05-17 13:39:43.1716	78	100012	2023-01-01 00:00:00	\N	MN	\N	Normal y habitual	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:40:14.502252	\N	\N	2023-05-17 13:40:14.463004	79	100012	2023-01-01 00:00:00	\N	SA1	\N	Aguinaldo primer semestre	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:40:39.740253	2023-05-17 13:42:56.28987	\N	2023-05-17 13:40:39.729397	80	100012	2023-01-01 00:00:00	2023-02-01 00:00:00	SA2	\N	Aguinaldo segundo semestre	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2023-05-17 13:42:56.325176	\N	\N	2023-05-17 13:42:56.23271	81	100013	2023-02-01 00:00:00	\N	\N	0	Original	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MN	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:56:05.43366	\N	\N	2023-05-17 13:56:05.423076	83	100014	2023-01-01 00:00:00	\N	1	\N	PLANTA PERMANENTE	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:56:29.235096	\N	\N	2023-05-17 13:56:29.224515	84	100014	2023-01-01 00:00:00	\N	2	\N	MENSUALIZADO	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:57:02.533856	\N	\N	2023-05-17 13:57:02.523321	85	100014	2023-01-01 00:00:00	\N	3	\N	HORAS CÁTEDRA	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 13:45:02.666275	2023-05-17 14:19:55.412906	\N	2023-05-17 13:45:02.655265	82	100013	2023-01-01 00:00:00	2023-02-01 00:00:00	\N	1	Diferencia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MN	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2023-05-17 14:19:55.441499	\N	\N	2023-05-17 14:19:55.384694	86	100015	2023-02-01 00:00:00	\N	\N	1	REMUNERATIVOS	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:20:20.83611	\N	\N	2023-05-17 14:20:20.822561	87	100015	2023-01-01 00:00:00	\N	\N	2	NO REMUNERATIVO	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-05-17 14:20:45.692194	\N	\N	2023-05-17 14:20:45.679751	88	100015	2023-01-01 00:00:00	\N	\N	3	ASIGNACIONES FAMILIARES	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	89	100004	1970-01-01 00:00:00	\N	otro_gan_brut	\N	Gan Brut Otros Emp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	90	100004	1970-01-01 00:00:00	\N	otro_seg_soc	\N	Seguro Social	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	91	100004	1970-01-01 00:00:00	\N	otro_sindicato	\N	Sindicato	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	92	100004	1970-01-01 00:00:00	\N	otro_ret_gan	\N	Ret.Gan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	93	100004	1970-01-01 00:00:00	\N	fam_hijos_disc_100	\N	Hijos disc 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	94	100004	1970-01-01 00:00:00	\N	fam_hijos_disc_50	\N	Hijos disc 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	95	100004	1970-01-01 00:00:00	\N	fam_hijos_100	\N	Hijos 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	96	100004	1970-01-01 00:00:00	\N	fam_hijastros_50	\N	Hijastros 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	97	100004	1970-01-01 00:00:00	\N	fam_conyuge	\N	Conyuge	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	98	100004	1970-01-01 00:00:00	\N	ded_cuota_medica	\N	Ded. Cuota Medica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	99	100004	1970-01-01 00:00:00	\N	fam_hijastros_100	\N	Hijastros 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	100	100004	1970-01-01 00:00:00	\N	ded_donaciones	\N	Ded.Donaciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	101	100004	1970-01-01 00:00:00	\N	ded_int_hipotecarios	\N	Ded.Int.Hipotecarios	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	102	100004	1970-01-01 00:00:00	\N	ret_dolares_turismo	\N	Ret. Dolares	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	103	100004	1970-01-01 00:00:00	\N	ret_dolares_tenencia	\N	Ret.Dolar Tenencia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	104	100004	1970-01-01 00:00:00	\N	ret_turismo_efec	\N	Ret.Turismo.Efec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	105	100004	1970-01-01 00:00:00	\N	ret_pasajes_efec	\N	Ret.Pasaje Efect	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	106	100004	1970-01-01 00:00:00	\N	fam_hijos_50	\N	Hijos 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	107	100004	1970-01-01 00:00:00	\N	otro_no_habit	\N	Monto Ret no habit	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	108	100004	1970-01-01 00:00:00	\N	otro_mat_didac	\N	Imp.Mat.Didactico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	109	100004	1970-01-01 00:00:00	\N	otro_hs_extgr	\N	Hs.Extras Gravadas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	110	100004	1970-01-01 00:00:00	\N	otro_hs_extr	\N	Hs.Extras Exentas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	111	100004	1970-01-01 00:00:00	\N	otro_gs_viatic	\N	Gs movi y viatico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	112	100004	1970-01-01 00:00:00	\N	otro_ex_nogan	\N	Imp.No alcan.Gananci	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	113	100004	1970-01-01 00:00:00	\N	otro_sac	\N	Sldo Anual Complem.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	114	100004	1970-01-01 00:00:00	\N	otro_ajuste	\N	Ajustes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	115	100004	1970-01-01 00:00:00	\N	otro_obra_soc	\N	Obra soc Otros Em	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	116	100004	1970-01-01 00:00:00	\N	ded_seguro_muerte	\N	Ded.Seg. Muerte	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	117	100004	1970-01-01 00:00:00	\N	ded_gastos_sepelio	\N	Ded. Gasto Sepelio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	118	100004	1970-01-01 00:00:00	\N	ded_gastos_medicos	\N	Ded.Gasto Medico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	119	100004	1970-01-01 00:00:00	\N	ded_domestica	\N	Ded. Domestica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	120	100004	1970-01-01 00:00:00	\N	ded_sociedades	\N	Ded. Sociedades	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	121	100004	1970-01-01 00:00:00	\N	ded_viajantes	\N	Ded. Viajantes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	122	100004	1970-01-01 00:00:00	\N	ded_movilidad	\N	Ded. Movilidad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	123	100004	1970-01-01 00:00:00	\N	ded_indumentaria	\N	Ded. Indumentaria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	124	100004	1970-01-01 00:00:00	\N	ded_alquiler	\N	Ded. Alquiler	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	125	100004	1970-01-01 00:00:00	\N	ded_seguros	\N	Ded. Seguros	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	126	100004	1970-01-01 00:00:00	\N	ded_retiro	\N	Ded. Retiro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	127	100004	1970-01-01 00:00:00	\N	ded_fondo_inversion	\N	Ded. Fondo Inversion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	128	100004	1970-01-01 00:00:00	\N	ded_otras	\N	Ded. Otras	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	129	100004	1970-01-01 00:00:00	\N	ret_cred_deb	\N	Ret. Cred.Deb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	130	100004	1970-01-01 00:00:00	\N	ret_aduana	\N	Ret. Aduana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	131	100004	1970-01-01 00:00:00	\N	ret_compras_ext	\N	Ret.Compra Ext.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	132	100004	1970-01-01 00:00:00	\N	ret_imp_movim	\N	Ret.Imp.Movim	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	133	100004	1970-01-01 00:00:00	\N	ret_turismo	\N	Ret.Turismo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	134	100004	1970-01-01 00:00:00	\N	ret_pasajes	\N	Ret.Pasajes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	135	100017	1970-01-01 00:00:00	\N	D	\N	Docentes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	136	100017	1970-01-01 00:00:00	\N	H	\N	Horas catedra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	137	100017	1970-01-01 00:00:00	\N	P	\N	Prejubilados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	138	100017	1970-01-01 00:00:00	\N	B	\N	Becarios	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	139	100017	1970-01-01 00:00:00	\N	L	\N	Limpieza (camioneros)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	140	100017	1970-01-01 00:00:00	\N	A	\N	Resto de empleados (planta, mensualiz, médicos)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	141	100017	1970-01-01 00:00:00	\N	D	\N	Docentes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	142	100017	1970-01-01 00:00:00	\N	H	\N	Horas catedra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	143	100017	1970-01-01 00:00:00	\N	P	\N	Prejubilados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	144	100017	1970-01-01 00:00:00	\N	B	\N	Becarios	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	145	100017	1970-01-01 00:00:00	\N	L	\N	Limpieza (camioneros)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	146	100017	1970-01-01 00:00:00	\N	A	\N	Resto de empleados (planta, mensualiz, médicos)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	147	100016	1970-01-01 00:00:00	\N	A	\N	Abierta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	148	100016	1970-01-01 00:00:00	\N	P	\N	En proceso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	149	100016	1970-01-01 00:00:00	\N	C	\N	Cerrada	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TIPOEMP	\N	\N	-1	\N	\N	-1
\.


--
-- Data for Name: tablaAuxiliarDetalleOLD; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."tablaAuxiliarDetalleOLD" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "tablaAuxiliarId", "fechaDesde", "fechaHasta", "codigoString", "codigoInt", descripcion, numerico1, numerico2, numerico3, numerico4, numerico5, numerico6, numerico7, numerico8, numerico9, numerico10, caracter1, caracter2, caracter3, descripcion1, descripcion2, descripcion3, "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.453897	\N	\N	2022-11-22 13:53:46.45361	1	1010	1969-12-31 21:00:00	\N	HISTORICO	\N	Historico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.46359	\N	\N	2022-11-22 13:53:46.463389	2	1010	1969-12-31 21:00:00	\N	PROCESO	\N	Proceso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.470877	\N	\N	2022-11-22 13:53:46.470658	3	1010	1969-12-31 21:00:00	\N	TERMINADA	\N	Actual	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.476934	\N	\N	2022-11-22 13:53:46.476752	4	1011	1969-12-31 21:00:00	\N	TERMINO	\N	Termino	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.48306	\N	\N	2022-11-22 13:53:46.482854	5	1011	1969-12-31 21:00:00	\N	FROMULA	\N	Formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.489979	\N	\N	2022-11-22 13:53:46.489761	6	1011	1969-12-31 21:00:00	\N	EXPRESION	\N	Expresion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.496476	\N	\N	2022-11-22 13:53:46.4963	7	1011	1969-12-31 21:00:00	\N	SI	\N	Si	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.503623	\N	\N	2022-11-22 13:53:46.503412	8	1011	1969-12-31 21:00:00	\N	SEGUN	\N	Segun	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.509363	\N	\N	2022-11-22 13:53:46.509168	9	1011	1969-12-31 21:00:00	\N	FUNCION	\N	Funcion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.52178	\N	\N	2022-11-22 13:53:46.521273	11	1012	1969-12-31 21:00:00	\N	ACUMULADORFROMULA	\N	Acumulador formula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.528635	\N	\N	2022-11-22 13:53:46.528416	12	1012	1969-12-31 21:00:00	\N	AUXILIAR	\N	Auxiliar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.535535	\N	\N	2022-11-22 13:53:46.535304	13	1012	1969-12-31 21:00:00	\N	ATRIBUTO	\N	Atributo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.541364	\N	\N	2022-11-22 13:53:46.541175	14	1012	1969-12-31 21:00:00	\N	VARIABLE	\N	Variable	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.547253	\N	\N	2022-11-22 13:53:46.547022	15	1012	1969-12-31 21:00:00	\N	MATRIZ	\N	Matriz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.553547	\N	\N	2022-11-22 13:53:46.553334	16	1012	1969-12-31 21:00:00	\N	CONSTANTEINT	\N	Constante Int	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.560976	\N	\N	2022-11-22 13:53:46.56077	17	1012	1969-12-31 21:00:00	\N	COSNTANTECHAR	\N	Constante Char	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.569202	\N	\N	2022-11-22 13:53:46.568966	18	1012	1969-12-31 21:00:00	\N	CONCEPTO	\N	Concepto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.57582	\N	\N	2022-11-22 13:53:46.57546	19	1012	1969-12-31 21:00:00	\N	ACUMULADORCONCEPTO	\N	Acumulador Concepto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.581495	\N	\N	2022-11-22 13:53:46.581296	20	1012	1969-12-31 21:00:00	\N	CONSTANTEFLOAT	\N	Constante Float	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.594239	\N	\N	2022-11-22 13:53:46.594032	22	1013	1969-12-31 21:00:00	\N	SUMA	\N	+	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.601841	\N	\N	2022-11-22 13:53:46.601625	23	1013	1969-12-31 21:00:00	\N	RESTA	\N	-	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.607851	\N	\N	2022-11-22 13:53:46.60763	24	1013	1969-12-31 21:00:00	\N	MULTIPLICADO	\N	 ∗ 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.613943	\N	\N	2022-11-22 13:53:46.613751	25	1013	1969-12-31 21:00:00	\N	DIVIDIDO	\N	/	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.619897	\N	\N	2022-11-22 13:53:46.619668	26	1013	1969-12-31 21:00:00	\N	MAYOR	\N	>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.627461	\N	\N	2022-11-22 13:53:46.627215	27	1013	1969-12-31 21:00:00	\N	MENOR	\N	<	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.635591	\N	\N	2022-11-22 13:53:46.635304	28	1013	1969-12-31 21:00:00	\N	MAYORIGUAL	\N	>=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.641373	\N	\N	2022-11-22 13:53:46.641183	29	1013	1969-12-31 21:00:00	\N	MENORIGUAL	\N	<=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.64798	\N	\N	2022-11-22 13:53:46.647775	30	1013	1969-12-31 21:00:00	\N	AND	\N	AND	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.741136	\N	\N	2022-11-22 13:53:46.740943	31	10003	1969-12-31 21:00:00	\N	C	\N	cargo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.747097	\N	\N	2022-11-22 13:53:46.746911	32	10003	1969-12-31 21:00:00	\N	L	\N	legajo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.753184	\N	\N	2022-11-22 13:53:46.752997	33	10002	1969-12-31 21:00:00	\N	LIQ	\N	liquidacion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.759474	\N	\N	2022-11-22 13:53:46.759247	34	10002	1969-12-31 21:00:00	\N	PAG	\N	pago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.774417	\N	\N	2022-11-22 13:53:46.774215	36	10009	1969-12-31 21:00:00	\N	ABS	\N	Absoluto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.780195	\N	\N	2022-11-22 13:53:46.779988	37	10006	1969-12-31 21:00:00	\N	BG	\N	Base Ganancias	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.786228	\N	\N	2022-11-22 13:53:46.786038	38	10006	1969-12-31 21:00:00	\N	DD	\N	Deducciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.792613	\N	\N	2022-11-22 13:53:46.792418	39	10004	1969-12-31 21:00:00	\N	NR	\N	No Remunerativo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.800937	\N	\N	2022-11-22 13:53:46.800701	40	10004	1969-12-31 21:00:00	\N	DS	\N	Descuento	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.807904	\N	\N	2022-11-22 13:53:46.807723	41	10001	1969-12-31 21:00:00	\N	MJ	\N	Mejor	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.813834	\N	\N	2022-11-22 13:53:46.813501	42	10001	1969-12-31 21:00:00	\N	SM	\N	Suma	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.819539	\N	\N	2022-11-22 13:53:46.819332	43	10008	1969-12-31 21:00:00	\N	SRG	\N	siradig	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.846727	\N	\N	2022-11-22 13:53:46.846544	47	10005	1969-12-31 21:00:00	\N	ACUM1	\N	Acum 1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.852516	\N	\N	2022-11-22 13:53:46.852319	48	10005	1969-12-31 21:00:00	\N	ACUM2	\N	Acum 2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.863829	\N	\N	2022-11-22 13:53:46.863529	50	10007	1969-12-31 21:00:00	\N	FUNC2	\N	funcion 2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.635	\N	\N	2022-11-22 13:53:46.635	51	1013	1969-12-31 21:00:00	\N	IGUAL	\N	==	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.647	\N	\N	2022-11-22 13:53:46.647	53	1013	1969-12-31 21:00:00	\N	MIN	\N	MINIMO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.647	\N	\N	2022-11-22 13:53:46.647	54	1013	1969-12-31 21:00:00	\N	DISTINTO	\N	!=	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.767	\N	\N	2022-11-22 13:53:46.767	55	10009	1969-12-31 21:00:00	\N	REL	\N	Relativo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.753	\N	\N	2022-11-22 13:53:46.753	56	10002	1969-12-31 21:00:00	\N	DEV	\N	Devengado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.8	\N	\N	2022-11-22 13:53:46.8	57	10004	1969-12-31 21:00:00	\N	RE	\N	Remunerativo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	64	100003	1969-12-31 21:00:00	\N	IDCON	\N	Convenio ID	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	66	100003	1969-12-31 21:00:00	\N	FE	\N	Fecha egreso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	68	100004	1969-12-31 21:00:00	\N	otro_gan_brut	\N	Gan Brut Otros Emp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	69	100004	1969-12-31 21:00:00	\N	otro_seg_soc	\N	Seguro Social	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	70	100004	1969-12-31 21:00:00	\N	otro_sindicato	\N	Sindicato	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	71	100004	1969-12-31 21:00:00	\N	otro_ret_gan	\N	Ret.Gan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	72	100004	1969-12-31 21:00:00	\N	fam_hijos_disc_100	\N	Hijos disc 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	73	100004	1969-12-31 21:00:00	\N	fam_hijos_disc_50	\N	Hijos disc 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	74	100004	1969-12-31 21:00:00	\N	fam_hijos_100	\N	Hijos 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	76	100004	1969-12-31 21:00:00	\N	fam_hijastros_50	\N	Hijastros 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	77	100004	1969-12-31 21:00:00	\N	fam_conyuge	\N	Conyuge	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	78	100004	1969-12-31 21:00:00	\N	ded_cuota_medica	\N	Ded. Cuota Medica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	63	100003	1969-12-31 21:00:00	\N	PP	\N	Planta Personal ID	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.857799	\N	\N	2022-11-22 13:53:46.857622	49	10007	1969-12-31 21:00:00	\N	ENTERA	\N	PARTE ENTERA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-12-11 23:16:57.457	2023-01-03 23:08:44.452797	\N	2022-12-11 23:16:57.457	62	100002	2022-07-31 21:00:00	\N	\N	2	FEBRERO	30000	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2023-01-03 23:58:03.770112	\N	\N	2023-01-03 23:58:03.748969	114	100005	2021-12-31 21:00:00	2022-08-31 00:00:00	\N	2	FEBRERO	6569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2023-01-03 23:56:48.072418	2023-01-04 09:05:34.996049	\N	2023-01-03 23:56:48.048848	113	100005	2021-12-31 21:00:00	2022-08-31 00:00:00	\N	1	ENERO	7000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2022-12-11 23:16:57.457	\N	\N	2022-12-11 23:16:57.457	115	100002	2022-07-31 21:00:00	\N	\N	1	ENERO	1500	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.515575	\N	\N	2022-11-22 13:53:46.515328	10	1012	1969-12-31 21:00:00	\N	ACUMULADORTIPOCON	\N	Acumulador tipo con	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-12-11 23:16:57.45748	2023-01-03 23:58:03.756032	\N	2022-12-11 23:16:57.456145	60	100002	2021-12-31 21:00:00	2022-06-30 00:00:00	\N	2	FEBRERO	27946	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	-1	\N	-1
t	2022-11-22 13:53:46.587208	\N	\N	2022-11-22 13:53:46.587026	21	1012	1969-12-31 21:00:00	\N	ACUMULADORTIPOCONGANANCIA	\N	Acumulador ganancia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.767044	\N	\N	2022-11-22 13:53:46.766796	35	10009	1969-12-31 21:00:00	\N	AC	\N	Año en curso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.825576	\N	\N	2022-11-22 13:53:46.825354	44	10008	1969-12-31 21:00:00	\N	EM	\N	empleado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.635	\N	\N	2022-11-22 13:53:46.635	52	1013	1969-12-31 21:00:00	\N	RANGO	\N	:	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	65	100003	1969-12-31 21:00:00	\N	FI	\N	Fecha Ingreso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	75	100004	1969-12-31 21:00:00	\N	fam_hijastros_100	\N	Hijastros 100%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	80	100004	1969-12-31 21:00:00	\N	ded_donaciones	\N	Ded.Donaciones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	81	100004	1969-12-31 21:00:00	\N	ded_int_hipotecarios	\N	Ded.Int.Hipotecarios	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	100	100004	1969-12-31 21:00:00	\N	ret_dolares_turismo	\N	Ret. Dolares	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	101	100004	1969-12-31 21:00:00	\N	ret_dolares_tenencia	\N	Ret.Dolar Tenencia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	102	100004	1969-12-31 21:00:00	\N	ret_turismo_efec	\N	Ret.Turismo.Efec	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	103	100004	1969-12-31 21:00:00	\N	ret_pasajes_efec	\N	Ret.Pasaje Efect	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	104	100004	1969-12-31 21:00:00	\N	fam_hijos_50	\N	Hijos 50%	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	105	100004	1969-12-31 21:00:00	\N	otro_no_habit	\N	Monto Ret no habit	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	106	100004	1969-12-31 21:00:00	\N	otro_mat_didac	\N	Imp.Mat.Didactico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	107	100004	1969-12-31 21:00:00	\N	otro_hs_extgr	\N	Hs.Extras Gravadas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	108	100004	1969-12-31 21:00:00	\N	otro_hs_extr	\N	Hs.Extras Exentas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	109	100004	1969-12-31 21:00:00	\N	otro_gs_viatic	\N	Gs movi y viatico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	110	100004	1969-12-31 21:00:00	\N	otro_ex_nogan	\N	Imp.No alcan.Gananci	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	111	100004	1969-12-31 21:00:00	\N	otro_sac	\N	Sldo Anual Complem.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	112	100004	1969-12-31 21:00:00	\N	otro_ajuste	\N	Ajustes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	67	100004	1969-12-31 21:00:00	\N	otro_obra_soc	\N	Obra soc Otros Em	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	79	100004	1969-12-31 21:00:00	\N	ded_seguro_muerte	\N	Ded.Seg. Muerte	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	82	100004	1969-12-31 21:00:00	\N	ded_gastos_sepelio	\N	Ded. Gasto Sepelio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	83	100004	1969-12-31 21:00:00	\N	ded_gastos_medicos	\N	Ded.Gasto Medico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	84	100004	1969-12-31 21:00:00	\N	ded_domestica	\N	Ded. Domestica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	85	100004	1969-12-31 21:00:00	\N	ded_sociedades	\N	Ded. Sociedades	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	86	100004	1969-12-31 21:00:00	\N	ded_viajantes	\N	Ded. Viajantes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	87	100004	1969-12-31 21:00:00	\N	ded_movilidad	\N	Ded. Movilidad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	88	100004	1969-12-31 21:00:00	\N	ded_indumentaria	\N	Ded. Indumentaria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	89	100004	1969-12-31 21:00:00	\N	ded_alquiler	\N	Ded. Alquiler	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	90	100004	1969-12-31 21:00:00	\N	ded_seguros	\N	Ded. Seguros	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	91	100004	1969-12-31 21:00:00	\N	ded_retiro	\N	Ded. Retiro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	92	100004	1969-12-31 21:00:00	\N	ded_fondo_inversion	\N	Ded. Fondo Inversion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	93	100004	1969-12-31 21:00:00	\N	ded_otras	\N	Ded. Otras	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	94	100004	1969-12-31 21:00:00	\N	ret_cred_deb	\N	Ret. Cred.Deb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	95	100004	1969-12-31 21:00:00	\N	ret_aduana	\N	Ret. Aduana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	96	100004	1969-12-31 21:00:00	\N	ret_compras_ext	\N	Ret.Compra Ext.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	97	100004	1969-12-31 21:00:00	\N	ret_imp_movim	\N	Ret.Imp.Movim	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	98	100004	1969-12-31 21:00:00	\N	ret_turismo	\N	Ret.Turismo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-05-03 22:00:00	2022-05-03 22:00:00	\N	2022-05-03 22:00:00	99	100004	1969-12-31 21:00:00	\N	ret_pasajes	\N	Ret.Pasajes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SIRADIG	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.8	\N	\N	2022-11-22 13:53:46.8	116	10004	1969-12-31 21:00:00	\N	AF	\N	Asignación familiar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.78	\N	\N	2022-11-22 13:53:46.78	117	10006	1969-12-31 21:00:00	\N	PA	\N	Pagado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.521	\N	\N	2022-11-22 13:53:46.521	118	1012	1969-12-31 21:00:00	\N	CONSTANTEDATE	\N	Constante Date	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.863	\N	\N	2022-11-22 13:53:46.863	119	10007	1969-12-31 21:00:00	\N	AÑO	\N	AÑO DE UNA FECHA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.863	\N	\N	2022-11-22 13:53:46.863	120	10007	1969-12-31 21:00:00	\N	MES	\N	MES DE UNA FECHA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.819	\N	\N	2022-11-22 13:53:46.819	122	10008	1969-12-31 21:00:00	\N	LIQ	\N	liquidacion	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.833364	\N	\N	2022-11-22 13:53:46.833112	45	10010	1969-12-31 21:00:00	\N	FECDEVDESDE	\N	Fecha dev desde	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	LIQUIDACION	\N	\N	-1	\N	\N	-1
t	2022-11-22 13:53:46.840134	\N	\N	2022-11-22 13:53:46.839931	46	10010	1969-12-31 21:00:00	\N	FECDEVHASTA	\N	Fecha dev hasta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	LIQUIDACION	\N	\N	-1	\N	\N	-1
t	2022-12-11 23:13:18.239531	\N	\N	2022-12-11 23:13:18.238117	59	100002	2021-12-31 21:00:00	2022-06-30 00:00:00	\N	1	ENERO	13973	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1	\N	\N	-1
\.


--
-- Data for Name: termino; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.termino (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, descripcion, nombre, "tipoTerminoId", "esPlaceholder", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-12-02 23:33:14.887943	\N	\N	2022-12-02 23:33:14.886276	1	Acumulador de SAC Legajo para ganancias	Acum SAC Leg	19	t	-1	\N	\N	-1
t	2022-12-02 23:59:22.602447	\N	\N	2022-12-02 23:59:22.601035	2	Cero	Cero	16	t	-1	\N	\N	-1
t	2022-12-03 00:02:11.481697	\N	\N	2022-12-03 00:02:11.480115	3	Acum Legajo Remunerativo Mes Actual	Acum L Remu Mes act	10	t	-1	\N	\N	-1
t	2022-12-03 00:02:11.4861	\N	\N	2022-12-03 00:02:11.484545	4	Acum Descuento Legajo Ganancias	Acum Desc L Gan	10	t	-1	\N	\N	-1
t	2022-12-03 00:04:50.711503	\N	\N	2022-12-03 00:04:50.709777	5	Doce	12 	16	t	-1	\N	\N	-1
t	2022-12-03 00:07:52.395204	\N	\N	2022-12-03 00:07:52.393699	6	Base imponible ganancias mes donde estoy parado	base imp mes parado	21	t	-1	\N	\N	-1
t	2022-12-03 00:12:00.863218	\N	\N	2022-12-03 00:12:00.861299	7	MARCA LIQUIDA GAN MASSA	MAT GAN MASSA	15	t	-1	\N	\N	-1
t	2022-12-03 00:14:02.21938	\N	\N	2022-12-03 00:14:02.217645	8	TOPE MENSUAL MASSA	TOPE MENSUAL	17	t	-1	\N	\N	-1
t	2022-12-03 19:58:01.188528	\N	\N	2022-12-03 19:58:01.187482	10	Cero	Cero	18	t	-1	\N	\N	-1
t	2022-12-03 19:58:01.195465	\N	\N	2022-12-03 19:58:01.194367	12	Dos	Dos	16	t	-1	\N	\N	-1
t	2022-12-03 19:58:01.198562	\N	\N	2022-12-03 19:58:01.197434	13	Seis	Seis	16	t	-1	\N	\N	-1
t	2022-12-03 19:59:48.07891	\N	\N	2022-12-03 19:59:48.077799	14	TOPE MENSUAL MASSA	TOPE MENSUAL	17	t	-1	\N	\N	-1
t	2022-12-03 20:06:16.39979	\N	\N	2022-12-03 20:06:16.39827	15	Dos	Dos	16	t	-1	\N	\N	-1
t	2022-12-03 20:06:16.404124	\N	\N	2022-12-03 20:06:16.402761	16	Mes liqui	Mes liqui	13	t	-1	\N	\N	-1
t	2022-12-03 20:06:16.407243	\N	\N	2022-12-03 20:06:16.406094	17	Tope SAC Ganancias	Tope Sac Gan	12	t	-1	\N	\N	-1
t	2022-12-03 20:08:40.401802	\N	\N	2022-12-03 20:08:40.400545	18	Acum Legajo Remunerativo Mes Actual	Acum L Remu Mes act	10	t	-1	\N	\N	-1
t	2022-12-03 20:08:40.404998	\N	\N	2022-12-03 20:08:40.403857	19	Acum Descuento Legajo Ganancias	Acum Desc L Gan	10	t	-1	\N	\N	-1
t	2022-12-03 20:25:29.35538	\N	\N	2022-12-03 20:25:29.354183	20	NO	NO	17	t	-1	\N	\N	-1
t	2022-12-03 20:25:29.358525	\N	\N	2022-12-03 20:25:29.357328	21	Acumulador de SAC Legajo para ganancias	Acum SAC Leg	19	t	-1	\N	\N	-1
t	2022-12-03 20:25:29.361697	\N	\N	2022-12-03 20:25:29.36045	22	Acumulador descuentos de SAC legajo ganancias	Acum Desc Sac L	19	t	-1	\N	\N	-1
t	2022-12-03 19:58:01.185655	2022-12-10 13:26:42.359505	\N	2022-12-03 19:58:01.184486	9	Acumulador de SAC Legajo para ganancias	Acum SAC Leg	19	f	-1	-1	\N	-1
t	2022-12-03 19:58:01.192237	2022-12-11 17:52:40.914754	\N	2022-12-03 19:58:01.190957	11	Acum Legajo Remunerativo Mes Actual	Acum L Remu Mes act	10	f	-1	-1	\N	-1
t	2023-01-16 22:04:26.604993	\N	\N	2023-01-16 22:04:26.603203	24	FECHA BAJA CARGO	FECHA BAJA CARGO	13	t	-1	\N	\N	-1
t	2023-01-17 15:58:06.977756	\N	\N	2023-01-17 15:58:06.975681	25	CARGO FECHA INGRESO	CARGO FEC ING	13	t	-1	\N	\N	-1
t	2023-01-17 15:58:06.985503	\N	\N	2023-01-17 15:58:06.983273	26	FECHA HASTA DEVENGADA LIQUIDACION	FEC HAS DEV LIQ	13	t	-1	\N	\N	-1
t	2023-01-17 18:15:55.517508	\N	\N	2023-01-17 18:15:55.515543	27	CONSTANTE DOCE	DOCE	16	t	-1	\N	\N	-1
t	2023-01-17 18:24:25.503669	\N	\N	2023-01-17 18:24:25.502138	28	UNO	1	16	t	-1	\N	\N	-1
t	2023-01-19 10:59:22.822722	\N	\N	2023-01-19 10:59:22.821553	30	TABLA AUXILIAR BASICOS	TAUX BASICOS	12	t	-1	\N	\N	-1
t	2023-01-19 10:59:22.818571	2023-01-25 09:50:22.7671	\N	2023-01-19 10:59:22.817309	29	CARGO CODIGO DE CATEGORIA	CARGO COD CAT	13	f	-1	-1	\N	-1
t	2023-01-31 13:19:17.471473	2023-02-10 11:41:42.227209	\N	2023-01-31 13:19:17.470009	33	BORRAR AUXILIAR	BORRAR AUXILIAR	12	f	-1	-1	\N	-1
t	2023-03-13 09:47:17.947916	\N	\N	2023-03-13 09:47:17.943764	44	acumulador para hs extras 	Hora extra 	19	f	-1	\N	\N	-1
t	2023-04-10 08:56:34.120012	2023-04-10 08:56:34.220094	\N	2023-04-10 08:56:34.115937	47	Constante float 3041 	3041	20	f	-1	-1	\N	-1
f	2023-04-10 08:59:25.981558	2023-04-10 08:59:26.024205	2023-04-10 09:09:11.987836	2023-04-10 08:59:25.974592	48	Constante negativa 	2 20 	16	f	-1	-1	-1	-1
t	2023-04-10 12:25:06.72721	2023-04-10 12:25:06.781172	\N	2023-04-10 12:25:06.723059	62	constante 2 20 negativa	2 20	16	f	-1	-1	\N	-1
f	2023-02-27 11:26:15.565846	\N	2023-04-10 09:25:55.491289	2023-02-27 11:26:15.564112	42	Valor Hora Extra	67_valor_hhee 	19	f	-1	\N	-1	-1
f	2023-03-13 09:46:57.519989	\N	2023-04-10 09:26:06.083481	2023-03-13 09:46:57.515884	43	acumulador para hs extras 	Hora extra 	19	f	-1	\N	-1	-1
f	2023-03-13 10:02:50.293018	\N	2023-04-10 09:26:10.909387	2023-03-13 10:02:50.288677	46	Acumulador para las horas extras 	Valor hora extra	19	f	-1	\N	-1	-1
f	2023-03-13 10:01:42.760432	\N	2023-04-10 09:26:19.574309	2023-03-13 10:01:42.756133	45	Acumulador para las horas extras 	Valor hora extra	19	f	-1	\N	-1	-1
t	2023-04-10 10:59:40.746719	2023-04-10 10:59:40.784386	\N	2023-04-10 10:59:40.741982	58	Constante Float 4041	4041	20	f	-1	-1	\N	-1
f	2023-04-10 12:14:12.673208	2023-04-10 12:14:12.689368	2023-04-10 12:15:42.640789	2023-04-10 12:14:12.669879	60	constante 20801	20801	16	f	-1	-1	-1	-1
t	2023-04-10 12:17:41.016735	2023-04-10 12:17:41.048665	\N	2023-04-10 12:17:41.011522	61	constante 20801	20801	16	f	-1	-1	\N	-1
f	2023-04-10 09:11:58.315348	2023-04-10 09:11:58.353072	2023-04-10 12:24:35.769291	2023-04-10 09:11:58.310553	49	Constante negativa	2 20 	16	f	-1	-1	-1	-1
t	2023-04-10 12:57:26.766519	2023-04-10 12:57:26.782396	\N	2023-04-10 12:57:26.764394	63	constante 5130	5130	16	f	-1	-1	\N	-1
t	2023-04-13 10:41:41.213001	2023-04-13 10:41:41.702333	\N	2023-04-13 10:41:41.208769	67	Sumatoria 3003	3003	19	f	-1	-1	\N	-1
f	2023-04-11 14:35:19.524675	2023-04-11 14:35:19.955381	2023-04-13 09:58:15.419696	2023-04-11 14:35:19.520475	66	Sumatoria 3003 	3003	19	f	-1	-1	-1	-1
t	2023-04-13 11:12:24.876948	2023-04-13 11:12:25.314842	\N	2023-04-13 11:12:24.872479	68	Sumatoria 6000 	6000	19	f	-1	-1	\N	-1
t	2023-04-13 11:28:53.635296	2023-04-13 11:28:53.748362	\N	2023-04-13 11:28:53.633209	69	Sumatoria 1058 	1058	19	f	-1	-1	\N	-1
t	2023-04-13 15:30:39.853941	2023-04-13 15:30:39.857982	\N	2023-04-13 15:30:39.851889	70	acumulador 6000 para rango	Acumulador 6000 	14	t	-1	-1	\N	-1
t	2023-04-17 10:34:52.796356	2023-04-17 10:34:52.808452	\N	2023-04-17 10:34:52.791458	71	valor minimo para salario 	minimo salario	16	t	-1	-1	\N	-1
t	2023-04-17 10:34:52.838951	2023-04-17 10:34:52.847095	\N	2023-04-17 10:34:52.834393	72	Tope de salario 	Tope salario	16	t	-1	-1	\N	-1
t	2023-04-17 10:34:53.061102	2023-04-17 10:34:53.128077	\N	2023-04-17 10:34:53.058945	73	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-04-17 13:56:04.714604	2023-04-17 13:56:04.778353	\N	2023-04-17 13:56:04.710365	77	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
f	2022-12-05 11:11:01.420756	\N	2023-04-27 13:57:33.130645	2022-12-05 11:11:01.419565	23	Term conc	Term conc	18	t	-1	\N	-1	-1
f	2023-01-19 13:11:49.847026	\N	2023-05-02 12:42:26.225064	2023-01-19 13:11:49.845936	31	SUMATORIA DE CONCEPTOS	HABERES_CONCEP	19	t	-1	\N	-1	-1
f	2023-01-19 13:11:49.850518	\N	2023-05-02 12:42:26.245658	2023-01-19 13:11:49.849097	32	RANGOS DE VALOR HS EXTRA	RANGOS_HS	12	t	-1	\N	-1	-1
f	2023-02-06 19:30:50.940548	\N	2023-05-02 12:49:13.935656	2023-02-06 19:30:50.939507	34	PRUEBA2	PRUEBA2	12	t	-1	\N	-1	-1
f	2023-02-06 19:45:18.965441	\N	2023-05-02 12:49:13.969476	2023-02-06 19:45:18.964339	35	acum tipo con	acum tipo con	10	t	-1	\N	-1	-1
f	2023-02-06 19:47:20.621101	\N	2023-05-02 12:49:13.989299	2023-02-06 19:47:20.619695	36	acum gan	acum gan	21	t	-1	\N	-1	-1
f	2023-02-06 19:49:04.326382	\N	2023-05-02 12:49:14.008623	2023-02-06 19:49:04.325188	37	acum concepto	acum concepto	19	t	-1	\N	-1	-1
f	2023-02-06 19:53:07.630963	\N	2023-05-02 12:49:14.029471	2023-02-06 19:53:07.629754	38	concepto	concepto	18	t	-1	\N	-1	-1
f	2023-02-06 19:54:40.61117	\N	2023-05-02 12:49:14.059755	2023-02-06 19:54:40.609784	39	variable	variable	14	t	-1	\N	-1	-1
f	2023-02-06 19:58:33.259829	\N	2023-05-02 12:49:14.078762	2023-02-06 19:58:33.258651	40	cont int prueba	const int prueba	16	t	-1	\N	-1	-1
f	2023-02-06 21:21:54.482059	\N	2023-05-02 12:49:14.098115	2023-02-06 21:21:54.480938	41	const float	const float	20	t	-1	\N	-1	-1
f	2023-04-10 12:13:28.761857	2023-04-10 12:13:28.784577	2023-05-04 09:23:28.251717	2023-04-10 12:13:28.739926	59	constante 2080	2080	16	f	-1	-1	-1	-1
t	2023-04-17 10:36:02.169595	2023-04-17 10:36:02.239533	\N	2023-04-17 10:36:02.165494	74	Tope minimo para salario	Minimo salario	20	f	-1	-1	\N	-1
t	2023-04-17 10:38:51.407835	2023-04-17 10:38:51.441241	\N	2023-04-17 10:38:51.403791	75	Tope maximo para salario	Tope para salario	16	f	-1	-1	\N	-1
t	2023-04-17 10:49:29.648743	2023-04-17 10:49:29.704799	\N	2023-04-17 10:49:29.644252	76	Constante 0 para los if	Constante 0 	16	f	-1	-1	\N	-1
t	2023-04-18 12:45:42.598519	2023-04-18 12:45:42.663335	\N	2023-04-18 12:45:42.594522	78	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-04-18 12:54:01.14771	2023-04-18 12:54:01.21183	\N	2023-04-18 12:54:01.143686	80	Tope maximo para procedimiento FOSOC	Tope FOSOC	17	f	-1	-1	\N	-1
f	2023-04-18 12:49:18.692858	2023-04-18 12:49:18.701663	2023-04-18 12:58:12.897514	2023-04-18 12:49:18.688241	79	Tope maximo para FOSOC	Tope FOSOC	16	t	-1	-1	-1	-1
t	2023-04-18 13:00:05.398347	2023-04-18 13:00:05.429435	\N	2023-04-18 13:00:05.395953	81	Tope para procedimiento FOSOC	FOSOC	20	f	-1	-1	\N	-1
t	2023-04-18 14:26:28.311234	2023-04-18 14:26:28.379513	\N	2023-04-18 14:26:28.307117	82	prueba	prueba	19	f	-1	-1	\N	-1
t	2023-04-27 10:48:42.519818	2023-04-27 10:48:42.649679	\N	2023-04-27 10:48:42.515277	83	Prueba de constante entera	Constante entera 	16	f	-1	-1	\N	-1
t	2023-04-27 11:22:11.846352	2023-04-27 11:22:11.93388	\N	2023-04-27 11:22:11.842291	84	Constante con numero coma flotante	Constante Float	20	f	-1	-1	\N	-1
t	2023-04-27 19:56:43.826048	2023-04-27 19:56:43.859274	\N	2023-04-27 19:56:43.820704	85	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-04-27 20:03:23.298755	2023-04-27 20:03:23.302917	\N	2023-04-27 20:03:23.296593	86	Fecha de ingreso del cargo	Fec Ingreso	13	t	-1	-1	\N	-1
t	2023-04-27 20:09:50.601706	2023-04-27 20:09:50.609753	\N	2023-04-27 20:09:50.597719	87	Fecha egreso del cargo	FecEgreso	13	t	-1	-1	\N	-1
t	2023-04-27 20:09:50.75948	2023-04-27 20:09:50.788457	\N	2023-04-27 20:09:50.754842	88	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-04-27 20:55:55.305136	2023-04-27 20:55:55.369346	\N	2023-04-27 20:55:55.300653	89	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-05-28 22:36:07.43335	2023-05-28 22:36:07.498032	\N	2023-05-28 22:36:07.431037	102	31/12/1995 ANTIGUEDAD	31/12/1995	17	t	-1	-1	\N	-1
t	2023-05-02 12:34:19.094218	2023-05-02 12:34:49.550635	\N	2023-05-02 12:34:19.089987	90	Rango con valor de hs extra	Rango hs extra	15	f	-1	-1	\N	-1
t	2023-05-04 09:22:10.324441	2023-05-04 09:22:10.361111	\N	2023-05-04 09:22:10.322465	91	Procedimiento para saber si cobra ayuda escolar	Procedimiento FAYU	13	t	-1	-1	\N	-1
t	2023-05-04 09:24:08.154217	2023-05-04 09:24:08.201004	\N	2023-05-04 09:24:08.148672	92	Constante ayuda escolar	2080	16	f	-1	-1	\N	-1
t	2023-05-04 09:59:27.593395	2023-05-04 09:59:27.644975	\N	2023-05-04 09:59:27.568545	93	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-05-04 10:03:03.725885	2023-05-04 10:03:03.73544	\N	2023-05-04 10:03:03.721682	94	Obtener dato de cobro de asignacion	FAYU Hijo 	18	t	-1	-1	\N	-1
t	2023-05-04 10:17:27.029036	2023-05-04 10:17:27.03759	\N	2023-05-04 10:17:27.025035	95	Obtener datos hijos por legajo	Datos hijos	18	t	-1	-1	\N	-1
t	2023-05-28 22:36:07.717367	2023-05-28 22:36:07.779531	\N	2023-05-28 22:36:07.715007	103	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-05-04 10:39:07.967644	2023-05-04 10:39:39.919952	\N	2023-05-04 10:39:07.963985	96	Sueldo basico segun categorias	Sueldo basico	12	f	-1	-1	\N	-1
t	2023-05-04 11:48:20.127534	2023-05-04 11:48:20.179901	\N	2023-05-04 11:48:20.123494	97	valor ayuda escolar	20801	16	f	-1	-1	\N	-1
t	2023-05-28 22:44:28.674148	2023-05-28 22:44:28.757745	\N	2023-05-28 22:44:28.671824	104	31/12/2021	31/12/2021	17	t	-1	-1	\N	-1
t	2023-06-06 09:45:19.344308	2023-06-06 09:45:19.955832	\N	2023-06-06 09:45:19.236992	105	prueba desde back constante negativa	aaaaaa	53	f	-1	-1	\N	-1
t	2023-05-04 12:42:09.380442	2023-05-04 12:43:07.029962	\N	2023-05-04 12:42:09.376235	98	Categorias para camioneros	Cate camioneros	12	f	-1	-1	\N	-1
t	2023-05-04 12:42:09.433279	2023-05-04 12:45:30.036865	\N	2023-05-04 12:42:09.428846	99	Jornales trabajados	jornales	18	f	-1	-1	\N	-1
t	2023-05-28 17:23:09.544335	2023-05-28 17:23:09.620498	\N	2023-05-28 17:23:09.541918	100	EXPRESION_OTROS	O	16	f	-1	-1	\N	-1
t	2023-05-28 17:25:22.707785	2023-05-28 17:25:22.71168	\N	2023-05-28 17:25:22.705757	101	FECHA HASTA DEV LIQ	FEC HAS LIQ	13	t	-1	-1	\N	-1
t	2023-07-31 11:45:51.313444	2023-07-31 11:45:51.625695	\N	2023-07-31 11:45:51.310885	108	JORNADA PROLONGADA	JORNADA PROLONGADA	20	f	1	1	\N	-1
t	2023-07-31 12:00:48.684454	2023-07-31 12:00:48.717566	\N	2023-07-31 12:00:48.674679	109	TOT. REM. POR CARGO	TOTAL REMU POR CARGO	14	t	1	1	\N	-1
t	2023-07-31 12:02:50.684771	2023-07-31 12:02:50.706664	\N	2023-07-31 12:02:50.682791	110	PORC. JORNADA PROLONGADA	% 33.4	20	t	1	1	\N	-1
\.


--
-- Data for Name: terminoAcumuladorConcepto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAcumuladorConcepto" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "relativoAbsolutoId", "periodoId", "cargoLegajoId", "operacionId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId", "baseCalculoId", "mesDesde", "mesHasta", "agregacionId") FROM stdin;
t	2022-12-10 13:26:42.335583	\N	\N	2022-12-10 13:26:42.332529	1	55	56	32	22	9	-1	\N	\N	-1	\N	\N	\N	\N
t	2023-02-27 11:26:15.590405	\N	\N	2023-02-27 11:26:15.585361	2	55	56	31	22	42	-1	\N	\N	-1	\N	1	1	\N
t	2023-04-11 14:35:19.771297	\N	\N	2023-04-11 14:35:19.539102	7	35	34	32	22	66	-1	\N	\N	-1	\N	1	\N	\N
t	2023-04-13 11:12:25.143849	\N	\N	2023-04-13 11:12:24.891802	9	35	34	32	22	68	-1	\N	\N	-1	\N	-6	\N	\N
t	2023-04-13 11:28:53.706315	\N	\N	2023-04-13 11:28:53.642865	10	35	34	31	22	69	-1	\N	\N	-1	\N	-6	\N	\N
t	2023-04-18 14:26:28.336481	2023-04-18 14:55:17.039339	\N	2023-04-18 14:26:28.32306	11	35	33	31	26	82	-1	-1	\N	-1	\N	-9	\N	51
t	2023-04-13 10:41:41.541074	\N	\N	2023-04-13 10:41:41.288096	8	35	34	31	22	67	-1	\N	\N	-1	\N	0	\N	\N
\.


--
-- Data for Name: terminoAcumuladorConceptoConcepto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAcumuladorConceptoConcepto" ("terminoAcumuladorConceptoId", "conceptoId") FROM stdin;
1	198
2	176
2	237
7	245
7	284
7	227
7	310
7	181
7	291
7	238
7	221
7	208
7	290
7	224
7	331
7	262
7	288
7	200
7	342
7	325
7	311
7	256
7	230
7	246
7	177
7	344
7	309
7	231
7	176
7	275
7	186
7	223
7	324
7	303
7	250
7	314
7	199
7	219
7	196
7	218
7	339
7	338
7	323
7	334
7	305
7	277
7	260
7	347
7	225
7	243
7	306
8	310
8	181
8	291
8	238
8	221
8	208
8	290
8	224
8	331
8	262
8	288
8	200
8	342
8	325
8	311
8	256
8	230
8	246
8	177
8	344
8	309
8	231
8	176
8	275
8	186
8	223
8	324
8	303
8	198
8	250
8	314
8	199
8	196
8	218
8	339
8	245
8	338
8	323
8	334
8	284
8	305
8	227
8	277
8	260
8	347
8	225
8	243
8	306
9	247
9	310
9	181
9	291
9	238
9	221
9	208
9	290
9	224
9	331
9	262
9	288
9	342
9	325
9	311
9	256
9	230
9	246
9	177
9	344
9	309
9	231
9	176
9	275
9	186
9	223
9	324
9	303
9	250
9	314
9	196
9	218
9	339
9	245
9	338
9	323
9	334
9	211
9	284
9	305
9	227
9	347
9	225
9	243
9	306
9	332
9	200
10	310
10	238
10	221
10	208
10	290
10	224
10	262
10	200
10	342
10	325
10	311
10	256
10	230
10	177
10	309
10	231
10	176
10	275
10	186
10	223
10	324
10	250
10	314
10	245
10	284
10	306
11	212
11	308
11	328
11	321
\.


--
-- Data for Name: terminoAcumuladorFormula; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAcumuladorFormula" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "relativoAbsolutoId", "periodoId", "cargoLegajoId", "operacionId", "formulaId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId", "baseCalculoId", "mesDesde", "mesHasta", "agregacionId") FROM stdin;
\.


--
-- Data for Name: terminoAcumuladorTipoCon; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAcumuladorTipoCon" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "tipoConceptoId", "relativoAbsolutoId", "periodoId", "cargoLegajoId", "operacionId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId", "baseCalculoId", "mesDesde", "mesHasta", "agregacionId") FROM stdin;
t	2022-12-11 17:52:40.888586	\N	\N	2022-12-11 17:52:40.886692	1	57	55	56	32	22	11	-1	\N	\N	-1	\N	\N	\N	\N
\.


--
-- Data for Name: terminoAcumuladorTipoConGanancia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAcumuladorTipoConGanancia" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "tipoGananciaId", "relativoAbsolutoId", "periodoId", "cargoLegajoId", "operacionId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId", "baseCalculoId", "mesDesde", "mesHasta", "agregacionId") FROM stdin;
\.


--
-- Data for Name: terminoAtributo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAtributo" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "entidadId", "atributoId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-01-25 09:50:22.7498	\N	\N	2023-01-25 09:50:22.748553	1	\N	\N	29	-1	\N	\N	-1
\.


--
-- Data for Name: terminoAuxiliar; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoAuxiliar" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, campo, "tablaAuxiliarId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-02-10 11:41:42.166556	\N	\N	2023-02-10 11:41:42.165521	1	BASE_IMP_GAN	100002	33	-1	\N	\N	-1
t	2023-05-04 10:39:39.892361	\N	\N	2023-05-04 10:39:39.888193	2	Basico	100010	96	-1	\N	\N	-1
t	2023-05-04 12:43:07.008775	\N	\N	2023-05-04 12:43:07.004777	3	Jornal	100011	98	-1	\N	\N	-1
\.


--
-- Data for Name: terminoConcepto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoConcepto" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "conceptoCodigo", "atributoId", "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-05-04 12:45:30.007639	\N	\N	2023-05-04 12:45:30.003256	1	317	45	99	-1	\N	\N	-1
\.


--
-- Data for Name: terminoConstanteChar; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoConstanteChar" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "fechaDesde", "fechaHasta", valor, "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-04-18 12:54:01.161528	\N	\N	2023-04-18 12:54:01.15703	1	2023-01-01 00:00:00	2023-12-31 00:00:00	198435.52	80	-1	\N	\N	-1
\.


--
-- Data for Name: terminoConstanteDate; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoConstanteDate" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "fechaDesde", "fechaHasta", valor, "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
\.


--
-- Data for Name: terminoConstanteFloat; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoConstanteFloat" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "fechaDesde", "fechaHasta", valor, "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-04-10 08:56:34.174602	\N	\N	2023-04-10 08:56:34.168545	1	2023-01-01 00:00:00	2023-12-31 00:00:00	0.03	47	-1	\N	\N	-1
t	2023-04-10 10:59:40.761538	\N	\N	2023-04-10 10:59:40.756684	2	2023-01-01 00:00:00	2023-12-31 00:00:00	0.06	58	-1	\N	\N	-1
t	2023-04-17 10:36:02.187593	\N	\N	2023-04-17 10:36:02.18259	3	2023-01-01 00:00:00	2023-12-31 00:00:00	6105.79	74	-1	\N	\N	-1
t	2023-04-18 13:00:05.416655	\N	\N	2023-04-18 13:00:05.41405	4	2023-01-01 00:00:00	2023-12-31 00:00:00	198435.52	81	-1	\N	\N	-1
t	2023-04-27 11:22:11.873863	\N	\N	2023-04-27 11:22:11.86801	5	2023-01-01 00:00:00	2023-12-31 00:00:00	0.03	84	-1	\N	\N	-1
t	2023-07-31 11:45:51.482663	\N	\N	2023-07-31 11:45:51.46836	6	2023-01-01 00:00:00	\N	0.33	108	1	\N	\N	-1
\.


--
-- Data for Name: terminoConstanteInt; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoConstanteInt" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "fechaDesde", "fechaHasta", valor, "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-04-10 08:59:25.998731	\N	\N	2023-04-10 08:59:25.993379	1	2023-01-01 00:00:00	2023-12-31 00:00:00	-1	48	-1	\N	\N	-1
t	2023-04-10 09:11:58.331011	\N	\N	2023-04-10 09:11:58.325473	2	2023-01-01 00:00:00	2023-12-31 00:00:00	-1000	49	-1	\N	\N	-1
t	2023-04-10 12:13:28.771087	\N	\N	2023-04-10 12:13:28.767535	3	2023-01-01 00:00:00	2023-12-31 00:00:00	2966	59	-1	\N	\N	-1
t	2023-04-10 12:14:12.679247	\N	\N	2023-04-10 12:14:12.676923	4	2023-01-01 00:00:00	2023-12-31 00:00:00	1000	60	-1	\N	\N	-1
t	2023-04-10 12:17:41.02944	\N	\N	2023-04-10 12:17:41.023647	5	2023-01-01 00:00:00	2023-12-31 00:00:00	1	61	-1	\N	\N	-1
t	2023-04-10 12:25:06.738494	\N	\N	2023-04-10 12:25:06.734061	6	2023-01-01 00:00:00	2023-12-31 00:00:00	-1	62	-1	\N	\N	-1
t	2023-04-10 12:57:26.772356	\N	\N	2023-04-10 12:57:26.770117	7	2023-01-01 00:00:00	2023-12-31 00:00:00	7	63	-1	\N	\N	-1
t	2023-04-17 10:34:53.069011	\N	\N	2023-04-17 10:34:53.066842	8	\N	\N	1	73	-1	\N	\N	-1
t	2023-04-17 10:38:51.419548	\N	\N	2023-04-17 10:38:51.415133	9	2023-03-01 00:00:00	2023-12-31 00:00:00	808124	75	-1	\N	\N	-1
t	2023-04-17 10:49:29.683974	\N	\N	2023-04-17 10:49:29.679223	10	2023-01-01 00:00:00	2023-12-31 00:00:00	0	76	-1	\N	\N	-1
t	2023-04-17 13:56:04.725433	\N	\N	2023-04-17 13:56:04.72134	11	\N	\N	1	77	-1	\N	\N	-1
t	2023-04-18 12:45:42.622026	\N	\N	2023-04-18 12:45:42.617567	12	\N	\N	1	78	-1	\N	\N	-1
t	2023-04-27 10:48:42.573565	\N	\N	2023-04-27 10:48:42.568415	13	2023-01-01 00:00:00	2023-12-31 00:00:00	10000	83	-1	\N	\N	-1
t	2023-04-27 19:56:43.837179	\N	\N	2023-04-27 19:56:43.833058	14	\N	\N	1	85	-1	\N	\N	-1
t	2023-04-27 20:09:50.770605	\N	\N	2023-04-27 20:09:50.766197	15	\N	\N	1	88	-1	\N	\N	-1
t	2023-04-27 20:55:55.316089	\N	\N	2023-04-27 20:55:55.312017	16	\N	\N	1	89	-1	\N	\N	-1
t	2023-05-04 09:24:08.166045	\N	\N	2023-05-04 09:24:08.161507	17	2023-01-01 00:00:00	2023-12-31 00:00:00	8210	92	-1	\N	\N	-1
t	2023-05-04 09:59:27.607106	\N	\N	2023-05-04 09:59:27.602679	18	\N	\N	1	93	-1	\N	\N	-1
t	2023-05-04 11:48:20.138973	\N	\N	2023-05-04 11:48:20.134674	19	2023-03-01 00:00:00	\N	9609	97	-1	\N	\N	-1
\.


--
-- Data for Name: terminoMatriz; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoMatriz" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "terminoId", retorna, "matrizId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2023-05-02 12:34:49.522213	\N	\N	2023-05-02 12:34:49.517928	1	90	Maximo	6	-1	\N	\N	-1
\.


--
-- Data for Name: terminoVariable; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."terminoVariable" (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, variable, "terminoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.version (activado, "creadoEn", "modificadoEn", "eliminadoEn", "activadoEn", id, "formulaId", "fechaDesde", "fechaHasta", descripcion, numero, "estadoId", "creadoPorId", "modificadoPorId", "eliminadoPorId", "activadoPorId") FROM stdin;
t	2022-11-22 13:53:46.954874	\N	\N	2022-11-22 13:53:46.951794	3	3	2022-02-25 00:00:00	\N	FORMULA CHICA II	1	3	-1	\N	\N	-1
t	2022-12-02 23:33:14.877159	2022-12-03 20:25:28.663449	\N	2022-12-02 23:33:14.870075	4	4	2022-01-01 00:00:00	\N	SAC PROYECTADO PARA GANANCIAS	1	2	-1	-1	\N	-1
t	2022-11-22 13:53:46.882208	2022-12-05 10:53:05.584571	\N	2022-11-22 13:53:46.876567	1	1	2022-02-25 00:00:00	\N	FORMULA COMPLETA	1	2	-1	-1	\N	-1
t	2023-01-16 22:22:52.771663	2023-01-17 18:24:25.151259	\N	2023-01-16 22:22:52.767522	9	9	2022-01-01 00:00:00	\N	1004-ANTIGUEDAD (ANTIG TOTAL)	1	2	-1	-1	\N	-1
f	2022-11-22 13:53:46.930885	2022-12-05 10:56:49.829105	2022-12-05 11:13:57.188665	2022-11-22 13:53:46.926428	2	2	2022-02-25 00:00:00	\N	FORMULA CHICA	1	2	-1	-1	-1	-1
t	2023-01-19 10:59:22.811355	2023-05-04 11:51:18.397845	\N	2023-01-19 10:59:22.803379	10	10	2023-01-01 00:00:00	\N	BASICO	1	2	-1	-1	\N	-1
f	2023-01-19 13:11:49.843659	2023-05-02 12:00:50.103942	2023-05-02 12:42:26.26295	2023-01-19 13:11:49.840249	11	11	2023-01-01 00:00:00	\N	Calculo Horas Extras 	1	2	-1	-1	-1	-1
f	2023-04-10 09:25:19.608387	2023-05-04 09:06:00.804	2023-05-04 12:00:09.637754	2023-04-10 09:25:19.596209	17	17	2023-01-01 00:00:00	\N	Obra social	1	2	-1	-1	-1	-1
f	2023-03-13 08:29:09.063475	2023-04-10 08:46:58.686818	2023-05-02 12:43:02.098628	2023-03-13 08:29:08.643168	14	14	2023-03-13 00:00:00	\N	IPS SAC 	1	2	-1	-1	-1	-1
f	2023-04-10 09:03:18.322123	2023-04-10 09:15:37.286363	2023-04-10 09:15:45.793644	2023-04-10 09:03:18.308391	15	15	2023-01-01 00:00:00	\N	Obra social valor cancha	1	2	-1	-1	-1	-1
t	2023-04-10 11:10:04.133742	2023-05-03 15:13:16.364263	\N	2023-04-10 11:10:04.123185	20	20	2023-01-01 00:00:00	\N	Asignacion hijo incapacitados	1	2	-1	-1	\N	-1
f	2023-02-27 11:28:28.760517	\N	2023-05-02 11:45:36.749809	2023-02-27 11:28:28.750918	13	13	2023-02-27 00:00:00	\N	prueba_hora_extra 	1	2	-1	\N	-1	-1
f	2023-04-10 11:49:52.586864	2023-04-10 12:12:47.691409	2023-05-04 10:40:38.234143	2023-04-10 11:49:52.580689	25	25	2023-01-01 00:00:00	\N	Ayuda escolar	1	2	-1	-1	-1	-1
t	2022-12-03 00:07:52.390941	2023-04-27 13:57:23.67801	\N	2022-12-03 00:07:52.386436	5	5	2022-01-01 00:00:00	\N	Marca si aplica el aguinaldo para ganancias Massa	1	2	-1	-1	\N	-1
f	2022-12-05 11:11:01.417221	\N	2023-04-27 13:57:33.148689	2022-12-05 11:11:01.41397	6	6	2022-12-01 00:00:00	\N	BORRRAR PRUEBA TERMINO CONCEPTO	1	2	-1	\N	-1	-1
f	2023-04-10 11:07:05.730667	2023-04-10 12:29:00.141348	2023-04-13 11:13:19.072708	2023-04-10 11:07:05.71957	19	19	2023-01-01 00:00:00	\N	Obra social patronal	1	2	-1	-1	-1	-1
f	2023-04-10 09:15:00.945149	2023-04-11 15:05:07.279572	2023-04-13 11:51:57.482181	2023-04-10 09:15:00.924615	16	16	2023-01-01 00:00:00	\N	Obra social valor cancha	1	2	-1	-1	-1	-1
f	2023-04-27 15:49:24.119429	\N	2023-04-27 15:52:39.020909	2023-04-27 15:49:24.112756	31	31	2023-04-03 00:00:00	\N	asdasdsa	1	2	-1	\N	-1	-1
t	2023-05-04 12:42:09.367448	2023-05-04 13:01:25.16117	\N	2023-05-04 12:42:09.355202	36	36	2023-01-01 00:00:00	\N	formula camioneros	1	2	-1	-1	\N	-1
t	2023-04-27 20:39:25.471824	2023-04-27 21:07:36.438241	\N	2023-04-27 20:39:25.466567	33	33	2023-01-01 00:00:00	\N	Antiguedad Fecha Hasta	1	3	-1	-1	\N	-1
t	2023-04-27 20:09:50.587589	2023-04-27 20:23:18.36831	\N	2023-04-27 20:09:50.576768	32	32	2023-01-01 00:00:00	\N	Antiguedad fecha hasta	1	2	-1	-1	\N	-1
t	2023-04-10 12:43:24.957215	2023-05-04 10:42:34.997796	\N	2023-04-10 12:43:24.945057	26	26	2023-01-01 00:00:00	\N	Ayuda escolar 2080 1	1	2	-1	-1	\N	-1
t	2023-05-28 22:33:38.008472	2023-05-28 22:52:40.508472	\N	2023-05-28 22:33:37.985857	37	37	2023-01-01 00:00:00	\N	ANTIGUEDAD AL 1%	1	2	-1	-1	\N	-1
f	2023-01-31 13:19:17.467283	2023-02-06 21:21:54.376489	2023-05-02 12:49:14.121523	2023-01-31 13:19:17.459969	12	12	2023-01-01 00:00:00	\N	AUXILIAR PRUEBA BORRAR	1	2	-1	-1	-1	-1
t	2023-04-10 10:33:36.517488	2023-05-04 08:55:00.625806	\N	2023-04-10 10:33:36.511789	18	18	2023-01-01 00:00:00	\N	Valor hora extra 	1	2	-1	-1	\N	-1
t	2023-07-31 12:00:48.586431	2023-07-31 12:02:50.519384	\N	2023-07-31 12:00:48.507333	38	38	2023-01-01 00:00:00	\N	JORNADA PROLONGADA	1	2	1	1	\N	-1
t	2023-04-10 11:19:20.619372	2023-05-02 13:28:44.895796	\N	2023-04-10 11:19:20.608157	22	22	2023-01-01 00:00:00	\N	Asignacion por matrimonio	1	2	-1	-1	\N	-1
t	2023-04-17 13:56:04.590522	2023-05-04 13:06:35.07549	\N	2023-04-17 13:56:04.54793	29	29	2023-01-01 00:00:00	\N	FOSOC	1	2	-1	-1	\N	-1
t	2023-04-10 12:58:43.194078	2023-05-04 09:18:11.264508	\N	2023-04-10 12:58:43.183238	27	27	2023-01-01 00:00:00	\N	Obra social sac	1	2	-1	-1	\N	-1
t	2023-05-04 12:11:45.34259	2023-05-04 13:08:06.483931	\N	2023-05-04 12:11:45.320401	35	35	2023-01-01 00:00:00	\N	Formula obra social 	1	2	-1	-1	\N	-1
t	2023-04-10 11:38:37.137932	2023-05-04 08:59:29.969993	\N	2023-04-10 11:38:37.124772	24	24	2023-01-01 00:00:00	\N	Asignacion por nacimiento	1	2	-1	-1	\N	-1
t	2023-05-02 10:27:06.309836	\N	\N	2023-05-02 10:27:06.295694	34	34	2023-05-02 00:00:00	\N	PRUEBA	1	2	-1	\N	\N	-1
t	2023-04-17 10:34:52.730537	2023-05-04 11:45:41.213102	\N	2023-04-17 10:34:52.672461	28	28	2023-04-17 00:00:00	\N	Formula para ayuda escolar 	1	2	-1	-1	\N	-1
f	2023-04-18 12:45:42.4844	2023-04-18 12:57:45.61454	2023-05-02 12:56:10.009665	2023-04-18 12:45:42.425071	30	30	2023-01-01 00:00:00	\N	Procedimiento FOSOC	1	2	-1	-1	-1	-1
t	2023-04-10 11:28:24.566307	2023-05-04 09:18:58.892437	\N	2023-04-10 11:28:24.559063	23	23	2023-01-01 00:00:00	\N	Asignacion hijos	1	2	-1	-1	\N	-1
t	2023-01-16 21:56:34.219203	2023-05-02 10:32:11.189244	\N	2023-01-16 21:56:34.214559	7	7	2022-01-01 00:00:00	\N	Antiguedad total en años	1	2	-1	-1	\N	-1
t	2023-04-10 11:16:02.094907	2023-05-04 08:59:59.502618	\N	2023-04-10 11:16:02.086258	21	21	2023-01-01 00:00:00	\N	Asignacion prenatal	1	2	-1	-1	\N	-1
t	2023-01-16 22:04:26.600016	2023-05-28 17:25:22.54407	\N	2023-01-16 22:04:26.595587	8	8	2022-01-01 00:00:00	\N	1004-ANTIGUEDAD FECHA HASTA	1	2	-1	-1	\N	-1
\.


--
-- Name: blackListTokenSeq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."blackListTokenSeq"', 1, false);


--
-- Name: concepto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.concepto_id_seq', 353, true);


--
-- Name: conceptos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.conceptos_id_seq', 1, false);


--
-- Name: detalleMatriz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."detalleMatriz_id_seq"', 20, true);


--
-- Name: formula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.formula_id_seq', 38, true);


--
-- Name: general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.general_id_seq', 1, true);


--
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.grupo_id_seq', 1, false);


--
-- Name: liqui_cons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.liqui_cons_id_seq', 1, false);


--
-- Name: liquis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.liquis_id_seq', 1, false);


--
-- Name: matriz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.matriz_id_seq', 16, true);


--
-- Name: nodo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.nodo_id_seq', 2354, true);


--
-- Name: seguridadGrupoSeq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."seguridadGrupoSeq"', 1, false);


--
-- Name: seguridadPermisoSeq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."seguridadPermisoSeq"', 41, true);


--
-- Name: seguridadRolSeq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."seguridadRolSeq"', 1, true);


--
-- Name: seguridadUsuarioSeq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."seguridadUsuarioSeq"', 2, true);


--
-- Name: tablaAuxiliarDetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."tablaAuxiliarDetalle_id_seq"', 65, false);


--
-- Name: tablaAuxiliar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."tablaAuxiliar_id_seq"', 100018, true);


--
-- Name: tablaauxiliardetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tablaauxiliardetalle_id_seq', 149, true);


--
-- Name: terminoAcumuladorConcepto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAcumuladorConcepto_id_seq"', 11, true);


--
-- Name: terminoAcumuladorFormula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAcumuladorFormula_id_seq"', 1, false);


--
-- Name: terminoAcumuladorTipoConGanancia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAcumuladorTipoConGanancia_id_seq"', 1, false);


--
-- Name: terminoAcumuladorTipoCon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAcumuladorTipoCon_id_seq"', 1, true);


--
-- Name: terminoAtributo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAtributo_id_seq"', 1, true);


--
-- Name: terminoAuxiliar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoAuxiliar_id_seq"', 3, true);


--
-- Name: terminoConcepto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoConcepto_id_seq"', 1, true);


--
-- Name: terminoConstanteChar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoConstanteChar_id_seq"', 1, true);


--
-- Name: terminoConstanteDate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoConstanteDate_id_seq"', 1, false);


--
-- Name: terminoConstanteFloat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoConstanteFloat_id_seq"', 6, true);


--
-- Name: terminoConstanteInt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoConstanteInt_id_seq"', 19, true);


--
-- Name: terminoMatriz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoMatriz_id_seq"', 1, true);


--
-- Name: terminoVariable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."terminoVariable_id_seq"', 1, false);


--
-- Name: termino_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.termino_id_seq', 110, true);


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.version_id_seq', 38, true);


--
-- Name: blackListToken blackListToken_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_pkey" PRIMARY KEY (id);


--
-- Name: blackListToken blackListToken_token_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_token_key" UNIQUE (token);


--
-- Name: concepto concepto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT concepto_pkey PRIMARY KEY (id);


--
-- Name: conceptos conceptos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.conceptos
    ADD CONSTRAINT conceptos_pkey PRIMARY KEY (id);


--
-- Name: detalleMatriz detalleMatriz_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_pkey" PRIMARY KEY (id);


--
-- Name: formula formula_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula
    ADD CONSTRAINT formula_pkey PRIMARY KEY (id);


--
-- Name: general general_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_pkey PRIMARY KEY (id);


--
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- Name: liqui_cons liqui_cons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liqui_cons
    ADD CONSTRAINT liqui_cons_pkey PRIMARY KEY (id);


--
-- Name: liquis liquis_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liquis
    ADD CONSTRAINT liquis_pkey PRIMARY KEY (id);


--
-- Name: matriz matriz_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz
    ADD CONSTRAINT matriz_pkey PRIMARY KEY (id);


--
-- Name: nodo nodo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT nodo_pkey PRIMARY KEY (id);


--
-- Name: seguridadGrupo seguridadGrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupo"
    ADD CONSTRAINT "seguridadGrupo_pkey" PRIMARY KEY (id);


--
-- Name: seguridadPermiso seguridadPermiso_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadPermiso"
    ADD CONSTRAINT "seguridadPermiso_pkey" PRIMARY KEY (id);


--
-- Name: seguridadRol seguridadRol_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRol"
    ADD CONSTRAINT "seguridadRol_pkey" PRIMARY KEY (id);


--
-- Name: seguridadUsuario seguridadUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuario"
    ADD CONSTRAINT "seguridadUsuario_pkey" PRIMARY KEY (id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_pkey" PRIMARY KEY (id);


--
-- Name: tablaAuxiliarDetalle tablaAuxiliarDetalle_pkey_2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalle"
    ADD CONSTRAINT "tablaAuxiliarDetalle_pkey_2" PRIMARY KEY (id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarIdUnica; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarIdUnica" UNIQUE (id, "fechaDesde", "codigoInt", "codigoString");


--
-- Name: tablaAuxiliarDetalle tablaAuxiliarIdUnica_2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalle"
    ADD CONSTRAINT "tablaAuxiliarIdUnica_2" UNIQUE (id, "fechaDesde", "codigoInt", "codigoString");


--
-- Name: tablaAuxiliar tablaAuxiliar_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar"
    ADD CONSTRAINT "tablaAuxiliar_pkey" PRIMARY KEY (id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_pkey" PRIMARY KEY (id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_pkey" PRIMARY KEY (id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_pkey" PRIMARY KEY (id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_pkey" PRIMARY KEY (id);


--
-- Name: terminoAtributo terminoAtributo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_pkey" PRIMARY KEY (id);


--
-- Name: terminoAuxiliar terminoAuxiliar_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_pkey" PRIMARY KEY (id);


--
-- Name: terminoConcepto terminoConcepto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_pkey" PRIMARY KEY (id);


--
-- Name: terminoConstanteChar terminoConstanteChar_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_pkey" PRIMARY KEY (id);


--
-- Name: terminoConstanteDate terminoConstanteDate_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_pkey" PRIMARY KEY (id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_pkey" PRIMARY KEY (id);


--
-- Name: terminoConstanteInt terminoConstanteInt_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_pkey" PRIMARY KEY (id);


--
-- Name: terminoMatriz terminoMatriz_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_pkey" PRIMARY KEY (id);


--
-- Name: terminoVariable terminoVariable_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_pkey" PRIMARY KEY (id);


--
-- Name: termino termino_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT termino_pkey PRIMARY KEY (id);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: concepto_cod_concepto; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX concepto_cod_concepto ON public.conceptos USING btree (cod_concepto, fecha_desde);


--
-- Name: idx_liqui_cons_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_liqui_cons_deleted_at ON public.liqui_cons USING btree (deleted_at);


--
-- Name: idx_liquis_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_liquis_deleted_at ON public.liquis USING btree (deleted_at);


--
-- Name: blackListToken blackListToken_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: blackListToken blackListToken_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: blackListToken blackListToken_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: blackListToken blackListToken_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."blackListToken"
    ADD CONSTRAINT "blackListToken_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: concepto concepto_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT "concepto_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: concepto concepto_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT "concepto_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: concepto concepto_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT "concepto_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: concepto concepto_id_concepto_cant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT concepto_id_concepto_cant_fkey FOREIGN KEY (id_concepto_cant) REFERENCES public.concepto(id);


--
-- Name: concepto concepto_id_ganancias_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT concepto_id_ganancias_fkey FOREIGN KEY (id_ganancias) REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: concepto concepto_id_tipo_concepto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT concepto_id_tipo_concepto_fkey FOREIGN KEY (id_tipo_concepto) REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: concepto concepto_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT "concepto_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: detalleMatriz detalleMatriz_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: detalleMatriz detalleMatriz_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: detalleMatriz detalleMatriz_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: detalleMatriz detalleMatriz_matrizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_matrizId_fkey" FOREIGN KEY ("matrizId") REFERENCES public.matriz(id);


--
-- Name: detalleMatriz detalleMatriz_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."detalleMatriz"
    ADD CONSTRAINT "detalleMatriz_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: conceptos fk_conceptos_tabla_auxiliar_detalle1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.conceptos
    ADD CONSTRAINT fk_conceptos_tabla_auxiliar_detalle1 FOREIGN KEY (id_tipo_concepto) REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: conceptos fk_conceptos_tabla_auxiliar_detalle2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.conceptos
    ADD CONSTRAINT fk_conceptos_tabla_auxiliar_detalle2 FOREIGN KEY (id_ganancias) REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: liqui_cons fk_liqui_cons_concepto; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liqui_cons
    ADD CONSTRAINT fk_liqui_cons_concepto FOREIGN KEY (concepto_id) REFERENCES public.conceptos(id);


--
-- Name: liqui_cons fk_liquis_liqui_cons; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.liqui_cons
    ADD CONSTRAINT fk_liquis_liqui_cons FOREIGN KEY (liqui_id) REFERENCES public.liquis(id);


--
-- Name: formula formula_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula
    ADD CONSTRAINT "formula_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: formula formula_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula
    ADD CONSTRAINT "formula_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: formula formula_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula
    ADD CONSTRAINT "formula_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: formula formula_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.formula
    ADD CONSTRAINT "formula_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: general general_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: general general_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: general general_dependeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_dependeId_fkey" FOREIGN KEY ("dependeId") REFERENCES public.general(id);


--
-- Name: general general_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: general general_grupoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES public.grupo(id);


--
-- Name: general general_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT "general_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: grupo grupo_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT "grupo_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: grupo grupo_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT "grupo_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: grupo grupo_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT "grupo_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: grupo grupo_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT "grupo_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: matriz matriz_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz
    ADD CONSTRAINT "matriz_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: matriz matriz_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz
    ADD CONSTRAINT "matriz_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: matriz matriz_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz
    ADD CONSTRAINT "matriz_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: matriz matriz_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.matriz
    ADD CONSTRAINT "matriz_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: nodo nodo_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: nodo nodo_codigoSubFormulaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_codigoSubFormulaId_fkey" FOREIGN KEY ("codigoSubFormulaId") REFERENCES public.formula(id);


--
-- Name: nodo nodo_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: nodo nodo_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: nodo nodo_formulaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_formulaId_fkey" FOREIGN KEY ("formulaId") REFERENCES public.formula(id);


--
-- Name: nodo nodo_funcionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_funcionId_fkey" FOREIGN KEY ("funcionId") REFERENCES public."tablaAuxiliarDetalle"(id);


--
-- Name: nodo nodo_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: nodo nodo_nodoPadreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_nodoPadreId_fkey" FOREIGN KEY ("nodoPadreId") REFERENCES public.nodo(id);


--
-- Name: nodo nodo_operadorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_operadorId_fkey" FOREIGN KEY ("operadorId") REFERENCES public."tablaAuxiliarDetalle"(id);


--
-- Name: nodo nodo_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: nodo nodo_tipoNodoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_tipoNodoId_fkey" FOREIGN KEY ("tipoNodoId") REFERENCES public."tablaAuxiliarDetalle"(id);


--
-- Name: nodo nodo_tipoTerminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_tipoTerminoId_fkey" FOREIGN KEY ("tipoTerminoId") REFERENCES public."tablaAuxiliarDetalle"(id);


--
-- Name: nodo nodo_versionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nodo
    ADD CONSTRAINT "nodo_versionId_fkey" FOREIGN KEY ("versionId") REFERENCES public.version(id);


--
-- Name: seguridadGrupoPermiso seguridadGrupoPermiso_grupoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupoPermiso"
    ADD CONSTRAINT "seguridadGrupoPermiso_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES public."seguridadGrupo"(id);


--
-- Name: seguridadGrupoPermiso seguridadGrupoPermiso_permisoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupoPermiso"
    ADD CONSTRAINT "seguridadGrupoPermiso_permisoId_fkey" FOREIGN KEY ("permisoId") REFERENCES public."seguridadPermiso"(id);


--
-- Name: seguridadGrupo seguridadGrupo_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupo"
    ADD CONSTRAINT "seguridadGrupo_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadGrupo seguridadGrupo_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupo"
    ADD CONSTRAINT "seguridadGrupo_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadGrupo seguridadGrupo_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupo"
    ADD CONSTRAINT "seguridadGrupo_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadGrupo seguridadGrupo_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadGrupo"
    ADD CONSTRAINT "seguridadGrupo_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadPermiso seguridadPermiso_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadPermiso"
    ADD CONSTRAINT "seguridadPermiso_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadPermiso seguridadPermiso_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadPermiso"
    ADD CONSTRAINT "seguridadPermiso_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadPermiso seguridadPermiso_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadPermiso"
    ADD CONSTRAINT "seguridadPermiso_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadPermiso seguridadPermiso_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadPermiso"
    ADD CONSTRAINT "seguridadPermiso_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadRolPermiso seguridadRolPermiso_permisoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRolPermiso"
    ADD CONSTRAINT "seguridadRolPermiso_permisoId_fkey" FOREIGN KEY ("permisoId") REFERENCES public."seguridadPermiso"(id);


--
-- Name: seguridadRolPermiso seguridadRolPermiso_rolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRolPermiso"
    ADD CONSTRAINT "seguridadRolPermiso_rolId_fkey" FOREIGN KEY ("rolId") REFERENCES public."seguridadRol"(id);


--
-- Name: seguridadRol seguridadRol_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRol"
    ADD CONSTRAINT "seguridadRol_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadRol seguridadRol_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRol"
    ADD CONSTRAINT "seguridadRol_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadRol seguridadRol_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRol"
    ADD CONSTRAINT "seguridadRol_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadRol seguridadRol_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadRol"
    ADD CONSTRAINT "seguridadRol_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuarioGrupo seguridadUsuarioGrupo_grupoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioGrupo"
    ADD CONSTRAINT "seguridadUsuarioGrupo_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES public."seguridadGrupo"(id);


--
-- Name: seguridadUsuarioGrupo seguridadUsuarioGrupo_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioGrupo"
    ADD CONSTRAINT "seguridadUsuarioGrupo_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuarioPermiso seguridadUsuarioPermiso_permisoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioPermiso"
    ADD CONSTRAINT "seguridadUsuarioPermiso_permisoId_fkey" FOREIGN KEY ("permisoId") REFERENCES public."seguridadPermiso"(id);


--
-- Name: seguridadUsuarioPermiso seguridadUsuarioPermiso_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioPermiso"
    ADD CONSTRAINT "seguridadUsuarioPermiso_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuarioRol seguridadUsuarioRol_rolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioRol"
    ADD CONSTRAINT "seguridadUsuarioRol_rolId_fkey" FOREIGN KEY ("rolId") REFERENCES public."seguridadRol"(id);


--
-- Name: seguridadUsuarioRol seguridadUsuarioRol_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuarioRol"
    ADD CONSTRAINT "seguridadUsuarioRol_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuario seguridadUsuario_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuario"
    ADD CONSTRAINT "seguridadUsuario_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuario seguridadUsuario_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuario"
    ADD CONSTRAINT "seguridadUsuario_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuario seguridadUsuario_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuario"
    ADD CONSTRAINT "seguridadUsuario_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: seguridadUsuario seguridadUsuario_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."seguridadUsuario"
    ADD CONSTRAINT "seguridadUsuario_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliarDetalleOLD tablaAuxiliarDetalle_tablaAuxiliarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliarDetalleOLD"
    ADD CONSTRAINT "tablaAuxiliarDetalle_tablaAuxiliarId_fkey" FOREIGN KEY ("tablaAuxiliarId") REFERENCES public."tablaAuxiliar"(id);


--
-- Name: tablaAuxiliar tablaAuxiliar_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar"
    ADD CONSTRAINT "tablaAuxiliar_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliar tablaAuxiliar_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar"
    ADD CONSTRAINT "tablaAuxiliar_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliar tablaAuxiliar_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar"
    ADD CONSTRAINT "tablaAuxiliar_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: tablaAuxiliar tablaAuxiliar_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."tablaAuxiliar"
    ADD CONSTRAINT "tablaAuxiliar_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorConceptoConcepto terminoAcumuladorConceptoConce_terminoAcumuladorConceptoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConceptoConcepto"
    ADD CONSTRAINT "terminoAcumuladorConceptoConce_terminoAcumuladorConceptoId_fkey" FOREIGN KEY ("terminoAcumuladorConceptoId") REFERENCES public."terminoAcumuladorConcepto"(id);


--
-- Name: terminoAcumuladorConceptoConcepto terminoAcumuladorConceptoConcepto_conceptoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConceptoConcepto"
    ADD CONSTRAINT "terminoAcumuladorConceptoConcepto_conceptoId_fkey" FOREIGN KEY ("conceptoId") REFERENCES public.concepto(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_agregacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_agregacionId_fkey" FOREIGN KEY ("agregacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_baseCalculoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_baseCalculoId_fkey" FOREIGN KEY ("baseCalculoId") REFERENCES public."terminoAcumuladorConcepto"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_cargoLegajoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_cargoLegajoId_fkey" FOREIGN KEY ("cargoLegajoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_operacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_operacionId_fkey" FOREIGN KEY ("operacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_periodoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_periodoId_fkey" FOREIGN KEY ("periodoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_relativoAbsolutoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_relativoAbsolutoId_fkey" FOREIGN KEY ("relativoAbsolutoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorConcepto terminoAcumuladorConcepto_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorConcepto"
    ADD CONSTRAINT "terminoAcumuladorConcepto_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_agregacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_agregacionId_fkey" FOREIGN KEY ("agregacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_baseCalculoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_baseCalculoId_fkey" FOREIGN KEY ("baseCalculoId") REFERENCES public."terminoAcumuladorFormula"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_cargoLegajoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_cargoLegajoId_fkey" FOREIGN KEY ("cargoLegajoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_formulaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_formulaId_fkey" FOREIGN KEY ("formulaId") REFERENCES public.formula(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_operacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_operacionId_fkey" FOREIGN KEY ("operacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_periodoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_periodoId_fkey" FOREIGN KEY ("periodoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_relativoAbsolutoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_relativoAbsolutoId_fkey" FOREIGN KEY ("relativoAbsolutoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorFormula terminoAcumuladorFormula_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorFormula"
    ADD CONSTRAINT "terminoAcumuladorFormula_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_agregacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_agregacionId_fkey" FOREIGN KEY ("agregacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_baseCalculoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_baseCalculoId_fkey" FOREIGN KEY ("baseCalculoId") REFERENCES public."terminoAcumuladorTipoConGanancia"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_cargoLegajoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_cargoLegajoId_fkey" FOREIGN KEY ("cargoLegajoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_operacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_operacionId_fkey" FOREIGN KEY ("operacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_periodoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_periodoId_fkey" FOREIGN KEY ("periodoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_relativoAbsolutoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_relativoAbsolutoId_fkey" FOREIGN KEY ("relativoAbsolutoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoAcumuladorTipoConGanancia terminoAcumuladorTipoConGanancia_tipoGananciaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoConGanancia"
    ADD CONSTRAINT "terminoAcumuladorTipoConGanancia_tipoGananciaId_fkey" FOREIGN KEY ("tipoGananciaId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_agregacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_agregacionId_fkey" FOREIGN KEY ("agregacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_baseCalculoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_baseCalculoId_fkey" FOREIGN KEY ("baseCalculoId") REFERENCES public."terminoAcumuladorTipoCon"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_cargoLegajoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_cargoLegajoId_fkey" FOREIGN KEY ("cargoLegajoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_operacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_operacionId_fkey" FOREIGN KEY ("operacionId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_periodoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_periodoId_fkey" FOREIGN KEY ("periodoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_relativoAbsolutoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_relativoAbsolutoId_fkey" FOREIGN KEY ("relativoAbsolutoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoAcumuladorTipoCon terminoAcumuladorTipoCon_tipoConceptoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAcumuladorTipoCon"
    ADD CONSTRAINT "terminoAcumuladorTipoCon_tipoConceptoId_fkey" FOREIGN KEY ("tipoConceptoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAtributo terminoAtributo_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAtributo terminoAtributo_atributoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_atributoId_fkey" FOREIGN KEY ("atributoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAtributo terminoAtributo_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAtributo terminoAtributo_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAtributo terminoAtributo_entidadId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_entidadId_fkey" FOREIGN KEY ("entidadId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoAtributo terminoAtributo_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAtributo terminoAtributo_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAtributo"
    ADD CONSTRAINT "terminoAtributo_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_tablaAuxiliarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_tablaAuxiliarId_fkey" FOREIGN KEY ("tablaAuxiliarId") REFERENCES public."tablaAuxiliar"(id);


--
-- Name: terminoAuxiliar terminoAuxiliar_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoAuxiliar"
    ADD CONSTRAINT "terminoAuxiliar_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoConcepto terminoConcepto_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConcepto terminoConcepto_atributoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_atributoId_fkey" FOREIGN KEY ("atributoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: terminoConcepto terminoConcepto_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConcepto terminoConcepto_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConcepto terminoConcepto_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConcepto terminoConcepto_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConcepto"
    ADD CONSTRAINT "terminoConcepto_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoConstanteChar terminoConstanteChar_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteChar terminoConstanteChar_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteChar terminoConstanteChar_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteChar terminoConstanteChar_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteChar terminoConstanteChar_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteChar"
    ADD CONSTRAINT "terminoConstanteChar_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoConstanteDate terminoConstanteDate_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteDate terminoConstanteDate_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteDate terminoConstanteDate_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteDate terminoConstanteDate_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteDate terminoConstanteDate_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteDate"
    ADD CONSTRAINT "terminoConstanteDate_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteFloat terminoConstanteFloat_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteFloat"
    ADD CONSTRAINT "terminoConstanteFloat_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoConstanteInt terminoConstanteInt_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteInt terminoConstanteInt_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteInt terminoConstanteInt_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteInt terminoConstanteInt_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoConstanteInt terminoConstanteInt_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoConstanteInt"
    ADD CONSTRAINT "terminoConstanteInt_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoMatriz terminoMatriz_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoMatriz terminoMatriz_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoMatriz terminoMatriz_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoMatriz terminoMatriz_matrizId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_matrizId_fkey" FOREIGN KEY ("matrizId") REFERENCES public.matriz(id);


--
-- Name: terminoMatriz terminoMatriz_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoMatriz terminoMatriz_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoMatriz"
    ADD CONSTRAINT "terminoMatriz_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: terminoVariable terminoVariable_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoVariable terminoVariable_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoVariable terminoVariable_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoVariable terminoVariable_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: terminoVariable terminoVariable_terminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."terminoVariable"
    ADD CONSTRAINT "terminoVariable_terminoId_fkey" FOREIGN KEY ("terminoId") REFERENCES public.termino(id);


--
-- Name: termino termino_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT "termino_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: termino termino_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT "termino_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: termino termino_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT "termino_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: termino termino_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT "termino_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: termino termino_tipoTerminoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.termino
    ADD CONSTRAINT "termino_tipoTerminoId_fkey" FOREIGN KEY ("tipoTerminoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: version version_activadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_activadoPorId_fkey" FOREIGN KEY ("activadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: version version_creadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_creadoPorId_fkey" FOREIGN KEY ("creadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: version version_eliminadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_eliminadoPorId_fkey" FOREIGN KEY ("eliminadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- Name: version version_estadoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_estadoId_fkey" FOREIGN KEY ("estadoId") REFERENCES public."tablaAuxiliarDetalleOLD"(id);


--
-- Name: version version_formulaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_formulaId_fkey" FOREIGN KEY ("formulaId") REFERENCES public.formula(id);


--
-- Name: version version_modificadoPorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT "version_modificadoPorId_fkey" FOREIGN KEY ("modificadoPorId") REFERENCES public."seguridadUsuario"(id);


--
-- PostgreSQL database dump complete
--

