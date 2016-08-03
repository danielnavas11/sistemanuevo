--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-08-02 22:07:39 ART

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 44709)
-- Name: continente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE continente (
    id_continente integer NOT NULL,
    abreviatura character varying(3),
    cod_continente character varying(1) NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE continente OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 44780)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empresa (
    id_empresa integer NOT NULL,
    nombre character varying,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE empresa OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 44778)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_id_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_id_empresa_seq OWNER TO postgres;

--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 188
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_id_empresa_seq OWNED BY empresa.id_empresa;


--
-- TOC entry 185 (class 1259 OID 44738)
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idioma (
    id_idioma integer NOT NULL,
    idioma character varying(100),
    siglas character varying(8)
);


ALTER TABLE idioma OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 44736)
-- Name: idioma_id_idioma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idioma_id_idioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idioma_id_idioma_seq OWNER TO postgres;

--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 184
-- Name: idioma_id_idioma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_id_idioma_seq OWNED BY idioma.id_idioma;


--
-- TOC entry 173 (class 1259 OID 44631)
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE moneda (
    id_moneda integer NOT NULL,
    moneda character varying(100)
);


ALTER TABLE moneda OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 44634)
-- Name: moneda_id_moneda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moneda_id_moneda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moneda_id_moneda_seq OWNER TO postgres;

--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 174
-- Name: moneda_id_moneda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moneda_id_moneda_seq OWNED BY moneda.id_moneda;


--
-- TOC entry 181 (class 1259 OID 44700)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id_pais integer NOT NULL,
    abreviatura character varying(3),
    cod_pais character varying(3) NOT NULL,
    nombre character varying(40) NOT NULL,
    id_region_continente integer,
    id_moneda integer
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 44641)
-- Name: parametros_sistema; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametros_sistema (
    id_parametros_sistema integer NOT NULL
);


ALTER TABLE parametros_sistema OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 44644)
-- Name: parametros_sistema_id_parametros_sistema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametros_sistema_id_parametros_sistema_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parametros_sistema_id_parametros_sistema_seq OWNER TO postgres;

--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 176
-- Name: parametros_sistema_id_parametros_sistema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametros_sistema_id_parametros_sistema_seq OWNED BY parametros_sistema.id_parametros_sistema;


--
-- TOC entry 190 (class 1259 OID 44791)
-- Name: proveedoresequipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedoresequipos (
    referencia character varying,
    proveedor character varying,
    contacto character varying,
    referenciaactividad character varying,
    referenciaespecialidad character varying,
    direccion1 character varying,
    direccion2 character varying,
    telefono character varying,
    fax character varying,
    email character varying,
    web character varying,
    comentario character varying,
    externa character varying,
    id_proveedoresequipos integer NOT NULL
);


ALTER TABLE proveedoresequipos OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 44798)
-- Name: proveedoresequipos_id_proveedoresequipos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedoresequipos_id_proveedoresequipos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedoresequipos_id_proveedoresequipos_seq OWNER TO postgres;

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 191
-- Name: proveedoresequipos_id_proveedoresequipos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedoresequipos_id_proveedoresequipos_seq OWNED BY proveedoresequipos.id_proveedoresequipos;


--
-- TOC entry 186 (class 1259 OID 44744)
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyecto (
    id_proyecto integer NOT NULL,
    nombre character varying,
    fecha_creacion timestamp with time zone DEFAULT now() NOT NULL,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE proyecto OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 44747)
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_id_proyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proyecto_id_proyecto_seq OWNER TO postgres;

--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 187
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyecto_id_proyecto_seq OWNED BY proyecto.id_proyecto;


--
-- TOC entry 183 (class 1259 OID 44716)
-- Name: regioncontinente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE regioncontinente (
    id_region_continente integer NOT NULL,
    abreviatura character varying(3),
    cod_region_continente character varying(2) NOT NULL,
    nombre character varying(40) NOT NULL,
    id_continente integer NOT NULL
);


ALTER TABLE regioncontinente OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 44646)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    usuario character varying(50) NOT NULL,
    password character varying(150) NOT NULL,
    nombres character varying(80) NOT NULL,
    apellidos character varying(80) NOT NULL,
    id_area integer NOT NULL,
    id_cargo integer NOT NULL,
    correo character varying(60),
    tlf character varying(15),
    id_idioma integer,
    primera_vez boolean DEFAULT true,
    activo boolean DEFAULT true,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_ultima_clave timestamp with time zone DEFAULT now(),
    administrador boolean DEFAULT false,
    logeado boolean DEFAULT false
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 44655)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 178
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 179 (class 1259 OID 44657)
-- Name: usuario_pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_pais (
    id_usuario_pais integer NOT NULL,
    id_usuario integer,
    id_pais integer
);


ALTER TABLE usuario_pais OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 44660)
-- Name: usuario_pais_id_usuario_pais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_pais_id_usuario_pais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_pais_id_usuario_pais_seq OWNER TO postgres;

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuario_pais_id_usuario_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_pais_id_usuario_pais_seq OWNED BY usuario_pais.id_usuario_pais;


--
-- TOC entry 1956 (class 2604 OID 44783)
-- Name: id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN id_empresa SET DEFAULT nextval('empresa_id_empresa_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 44741)
-- Name: id_idioma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma ALTER COLUMN id_idioma SET DEFAULT nextval('idioma_id_idioma_seq'::regclass);


--
-- TOC entry 1942 (class 2604 OID 44664)
-- Name: id_moneda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda ALTER COLUMN id_moneda SET DEFAULT nextval('moneda_id_moneda_seq'::regclass);


--
-- TOC entry 1943 (class 2604 OID 44666)
-- Name: id_parametros_sistema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_sistema ALTER COLUMN id_parametros_sistema SET DEFAULT nextval('parametros_sistema_id_parametros_sistema_seq'::regclass);


--
-- TOC entry 1959 (class 2604 OID 44800)
-- Name: id_proveedoresequipos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedoresequipos ALTER COLUMN id_proveedoresequipos SET DEFAULT nextval('proveedoresequipos_id_proveedoresequipos_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 44749)
-- Name: id_proyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto ALTER COLUMN id_proyecto SET DEFAULT nextval('proyecto_id_proyecto_seq'::regclass);


--
-- TOC entry 1950 (class 2604 OID 44667)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 1951 (class 2604 OID 44668)
-- Name: id_usuario_pais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_pais ALTER COLUMN id_usuario_pais SET DEFAULT nextval('usuario_pais_id_usuario_pais_seq'::regclass);


--
-- TOC entry 2105 (class 0 OID 44709)
-- Dependencies: 182
-- Data for Name: continente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (4, 'ASI', '4', 'ASIA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (1, 'AFR', '1', 'AFRICA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (2, 'AME', '2', 'AMERICA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (3, 'ANT', '3', 'ANTARTIDA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (5, 'AUS', '5', 'AUSTRALIA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (6, 'EUR', '6', 'EUROPA');


--
-- TOC entry 2112 (class 0 OID 44780)
-- Dependencies: 189
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (51, 'g', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (52, '12', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (53, '2', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (54, '1', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (55, '4', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (56, '5', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (57, '5', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (58, '6', '2016-08-02 00:00:00-03', true);
INSERT INTO empresa (id_empresa, nombre, fecha_creacion, activo) VALUES (59, '7', '2016-08-02 00:00:00-03', true);


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 188
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_id_empresa_seq', 59, true);


--
-- TOC entry 2108 (class 0 OID 44738)
-- Dependencies: 185
-- Data for Name: idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (17, 'PORTUGUES', 'POR');
INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (18, 'INGLES', 'ENG');
INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (16, 'ESPAÑOL', 'ESP');


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 184
-- Name: idioma_id_idioma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idioma_id_idioma_seq', 18, true);


--
-- TOC entry 2096 (class 0 OID 44631)
-- Dependencies: 173
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO moneda (id_moneda, moneda) VALUES (1, 'VEF');


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 174
-- Name: moneda_id_moneda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moneda_id_moneda_seq', 1, true);


--
-- TOC entry 2104 (class 0 OID 44700)
-- Dependencies: 181
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (2, 'AG', 'AG', 'ANTIGUA Y BARBUDA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (3, 'AN', 'AN', 'ANTILLAS NEERLANDESAS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (4, 'AR', 'AR', 'ARGENTINA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (5, 'AT', 'AT', 'AUSTRIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (6, 'AU', 'AU', 'AUSTRALIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (7, 'BB', 'BB', 'BARBADOS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (8, 'BE', 'BE', 'BELGICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (9, 'BG', 'BG', 'BULGARIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (10, 'BN', 'BN', 'BENIN', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (11, 'BO', 'BO', 'BOLIVIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (12, 'BR', 'BR', 'BRASIL', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (13, 'BZ', 'BZ', 'BELICE', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (14, 'CA', 'CA', 'CANADA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (15, 'CH', 'CH', 'SUIZA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (16, 'CL', 'CL', 'CHILE', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (17, 'CN', 'CN', 'CHINA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (18, 'CO', 'CO', 'COLOMBIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (19, 'CR', 'CR', 'COSTA RICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (20, 'CU', 'CU', 'CUBA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (21, 'CZ', 'CZ', 'REPUBLICA CHECA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (22, 'DE', 'DE', 'ALEMANIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (23, 'DK', 'DK', 'DINAMARCA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (24, 'DM', 'DM', 'DOMINICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (25, 'DO', 'DO', 'REPUBLICA DOMINICANA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (26, 'DZ', 'DZ', 'ARGELIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (27, 'EC', 'EC', 'ECUADOR', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (28, 'EG', 'EG', 'EGIPTO', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (29, 'ES', 'ES', 'ESPAÑA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (30, 'FI', 'FI', 'FINLANDIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (31, 'FR', 'FR', 'FRANCIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (32, 'GD', 'GD', 'GRENADA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (33, 'GR', 'GR', 'GRECIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (34, 'GT', 'GT', 'GUATEMALA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (35, 'GY', 'GY', 'GUYANA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (36, 'HK', 'HK', 'HONG KONG', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (37, 'HN', 'HN', 'HONDURAS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (38, 'HT', 'HT', 'HAITI', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (39, 'HU', 'HU', 'HUNGRIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (40, 'IC', 'IC', 'SANTA LUCIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (41, 'ID', 'ID', 'INDONESIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (42, 'IK', 'IK', 'IRAK', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (43, 'IL', 'IL', 'ISRAEL', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (44, 'IN', 'IN', 'INDIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (45, 'IR', 'IR', 'IRAN', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (46, 'IT', 'IT', 'ITALIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (47, 'JM', 'JM', 'JAMAICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (48, 'JP', 'JP', 'JAPON', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (49, 'KE', 'KE', 'KENIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (50, 'KN', 'KN', 'SAN CRISTOBAL Y NEVIS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (51, 'KR', 'KR', 'COREA DEL SUR', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (52, 'KT', 'KT', 'KAZAKHSTAN', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (53, 'KW', 'KW', 'KUWAIT', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (54, 'LB', 'LB', 'LIBANO', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (55, 'LY', 'LY', 'LIBIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (56, 'MA', 'MA', 'MARRUECOS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (57, 'MQ', 'MQ', 'MARTINICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (58, 'MX', 'MX', 'MEXICO', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (59, 'MY', 'MY', 'MALASIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (60, 'NA', 'NA', 'NAMIBIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (61, 'NG', 'NG', 'NIGERIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (62, 'NI', 'NI', 'NICARAGUA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (63, 'NL', 'NL', 'HOLANDA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (64, 'NO', 'NO', 'NORUEGA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (65, 'PA', 'PA', 'PANAMA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (66, 'PE', 'PE', 'PERU', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (67, 'PH', 'PH', 'FILIPINAS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (68, 'PL', 'PL', 'POLONIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (69, 'PR', 'PR', 'PUERTO RICO', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (70, 'PT', 'PT', 'PORTUGAL', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (71, 'PY', 'PY', 'PARAGUAY', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (72, 'QT', 'QT', 'QATAR', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (73, 'RO', 'RO', 'RUMANIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (74, 'RU', 'RU', 'RUSIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (75, 'SA', 'SA', 'ARABIA SAUDITA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (76, 'SE', 'SE', 'SUECIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (77, 'SG', 'SG', 'SENEGAL', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (78, 'SR', 'SR', 'SURINAME', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (79, 'SV', 'SV', 'EL SALVADOR', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (80, 'SY', 'SY', 'SIRIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (81, 'TR', 'TR', 'TURQUIA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (82, 'TT', 'TT', 'TRINIDAD Y TOBAGO', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (83, 'UK', 'UK', 'GRAN BRETAÑA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (84, 'US', 'US', 'ESTADOS UNIDOS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (85, 'UY', 'UY', 'URUGUAY', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (86, 'VA', 'VA', 'SANTA SEDE', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (87, 'VC', 'VC', 'SAN VICENTE Y LAS GRANADINAS', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (88, 'ZA', 'ZA', 'SUDAFRICA', 3, NULL);
INSERT INTO pais (id_pais, abreviatura, cod_pais, nombre, id_region_continente, id_moneda) VALUES (1, 'VEN', 'VE', 'VENEZUELA', 3, 1);


--
-- TOC entry 2098 (class 0 OID 44641)
-- Dependencies: 175
-- Data for Name: parametros_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 176
-- Name: parametros_sistema_id_parametros_sistema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('parametros_sistema_id_parametros_sistema_seq', 1, false);


--
-- TOC entry 2113 (class 0 OID 44791)
-- Dependencies: 190
-- Data for Name: proveedoresequipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB001', 'TECNOFIX, C.A', '', 'ALB004', 'ALB005', 'AV SAN FRANCISCO, TORRE CALIFORNIA LOCAL N-1', 'ENTRADA A LA URB MACARACUAY', '257-1077 / 257-4878', '258-0554', '', '', '', '1', 2);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB002', 'TALLER PAEZ , S.R.L', '', 'ALB003', 'ALB001', 'AV CONSTITUCION OESTE, N.289, MARACAY', '', '(043) 546834/ 542287', '(043) 511779', '', '', '', '', 3);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB003', 'HILTI DE VENEZUELA C.A.', '', 'ALB003', 'ALB001', 'LA URBINA, CARACAS', '', '0212-2420911', '0212-2427915', '', '', '', '', 4);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB004', 'ALQUILERES A-1 C.A.', 'ALQUILER HERRAMIENTAS-VALENCIA', 'ALB005', 'ALB002', 'TERRAZAS DEL CASTILLO TIGSA, LOCAL 6, VALENCIA', '', '0214-8714675', '0241-8232075', '', '', '0416-6403877', '', 5);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB005', 'EL GRANITERO', '', 'ALB001', 'ALB003', '', '', '0212-265.6456/0752', '', '', '', '', '', 6);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB006', 'CENTRO HERRAMIENTAS C.A.', 'ALQ. HERRAMIENTAS-PTO LA CRUZ', 'ALB005', 'ALB002', 'AV MUNICIPAL, EDF RENNY, PTO LA CRUZ', '', '0281-2667610', '0281-2667610', '', '', '', '', 7);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB007', 'ORIENTAL DE ALQUILER Y SUMINISTROS', 'ALQ. HERRAMIENTAS-BARCELONA', 'ALB005', 'ALB002', 'CALLE PROGRESO C/CALLE NEVERI, NO. 23-108,', 'SECTOR EL ESPEJO, BARCELONA', '0281-2743276', '0281-2770087', '', '', '', '', 8);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB008', 'CASTELLANA PLAZA ALTAMIRA C.A.', 'ALQ. HERRAMIENTAS-CARACAS', 'ALB005', 'ALB002', 'CALLE JOSE FELIX RIBAS AV PPAL DE LA CASTELLANA', 'CON CALLE MIRANDA, , LA CASTELLANA CARACAS', '0212-2633891', '', 'castellanaplaza@ventools.zzn.com', 'www.castellanaplaza.com', 'VALENCIA: 0241-8772777', '', 9);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ALB009', 'SUPLIOBRAS BELLO MONTE C.A.', 'ALQ. HERRAMIENTAS-CARACAS', 'ALB005', 'ALQ001', 'AV VENEZUELA NO. 25-14 (SALIDA AUTOP SABANA GDE)', 'BELLO MONTE, CARACAS', '0212-9512948-9526301', '0212-9512948-9526301', 'supliobras@yahoo.com', '', '', '', 10);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ASF001', 'BADIFA CONSTRUCTORA C.A. (ASFALTO)', '', 'VIA001', 'CPT001', 'NUCLEO EJECUTIVO LA PIRAMIDE, PISO 1 OF. 105', 'PRADOS DEL ESTE, CARACAS', '0212-9795311-5578', '0212-7614762', '', '', '', '', 11);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('BOM001', 'IRIMOCA INDUSTRIAL', '', 'BOM001', 'BOM001', 'ZONA INUSTRIAL SAN VICENTE, CONGLOMERADO IND', '"CALLE ""E"", GALPONES 68 Y 69"', '(043) 53645- 538159', '', '', '', '', '', 12);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('CON001', 'VENSIL, C.A', '', 'CON001', 'CON001', 'CARRETERA PETARE-SANTA LUCIA', '', '532-2484 / 1205', '', '', '', '', '', 13);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('CON002', 'M.P.C.', '', 'CON001', 'MAQ003', '', '', '0212-9919959', '0212-9915038', '', '', '', '', 14);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('CON003', 'PREMEX- OFICINA ADMINISTRATIVA', '', '', '', '', '', '0212-256-8373/8712', '', '', '', '', '', 15);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('CON005', 'CEMEX CONCRETO- VENCEMOS', 'VACIADO DE CONCRETO-CARACAS', 'CON001', 'CON001', 'CALLE LONDRES ENTRE NEY YORK Y TRINIDAD', 'LAS MERCEDES, CARACAS', '0212-6938344-8971', '0212-6939021', '', 'www.cemexvenezuela.com', '08008362366', '', 16);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('DEM001', 'CONSTRUCCCIONES SERGIO RUSS0', '', 'MAQ002', 'DEM001', 'CALLE EL LIRIO, N.18, PARTE BAJA, COLINAS DE', 'VISTA ALEGRE. CARACAS', '0212-4434366', '0212-4434366', '', '', '0414-2451299 0416-2451299', '', 17);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ELE001', 'ITACA', '', 'ELE001', 'ELE001', '"CALLE ""E"", EDF  SPEFAR, BOLEITA NORTE."', 'CARACAS.', '238-5811 / 235-4279', '239-7649', 'itaca@true.net', '', '', '', 18);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ELE002', 'RIEGOEQUIPOS C.A', '', 'ELE001', 'ELE002', '', 'CARACAS', '0212 9435122', '0212 9435318', 'laziovirag@hotmail.com', 'www.riegoequipos.net', '', '', 19);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ELE003', 'C.A INDUESCA', '', 'ELE003', 'ELE003', 'AV FRANCISCO DE MIRANDA. EDF LAINO, OFIC11 Y 31', 'CARACAS.', '261-1454 / 6960', '261-5936', '', '', '', '', 20);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ELE004', 'INDUSTRIAS ROURA, C.A', '', 'ELE003', 'ELE003', 'CARRETERA PETARE-GUARENAS,KM15, ENTRE LOS DEPOSITO', 'DE LA CONTRALORIA Y RESIDENCIAS ARAGUANEY', '244-1340', '244-1251', '', '', '', '', 21);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ELE005', 'GEDISA GENERAL DISTRIBUIDORA, S.A.', '', 'ELE003', 'ELE004', 'AV PRINCIPAL DE BOLEITA NORTE, EDIFICIO CARI, PH', 'CARACAS, EDO MIRANDA', '0212-2398011-8243', '0212-2356713', 'gedisa@gedisa.com.ve', 'www.gedisa.com.ve', '', '', 22);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('EPA001', 'EPA SUPERFERRETERIA - LOS RUICES', '', 'ALB002', 'MAQ002', 'LOS RUICES, CRACAS', '', '0212-2325420', '0212-2328434', '', 'www.superfereteria.com', '', '', 23);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP001', 'CHICHIRIVICHE DIVERS (SUBMARINISMO)', 'SUBMARINISMO CARACAS', 'ALB005', 'ESP001', 'AV DON BOSCO QTA ABC NO. 10 LA FLORIDA CARACAS', '', '0212-7311556 1410', '0212-7311410', 'info@chidivers.com.ve', 'www.chidivers.com.ve', '0416 6239551 chidivers@telcel.net.ve', '', 24);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP002', 'SERVI TEODOLITOS C.A.', 'TEODOLITOS-CARACAS', 'ESP001', 'ESP002', 'AV PANTEON EDF EDUARD, PB SAN NARCISO A SAN MIGUEL', 'CARACAS', '0212-5619275-9464', '0212-5626080', 'ventas@serviteodolitos.com', 'www.serviteodolitos.com', '0212-5623729  0416-6354339', '', 25);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP003', 'LABRO - TEODOLITOS - GPS', 'TEODOLITOS-CARACAS', 'ESP001', 'ESP002', 'CALLE 9 ENTRE 4TA Y 5TA EDF LABRO LA URBINA', 'CARACAS', '0212-24124294-8390', '0212-2412118', 'leica@telcel.net.ve', '', '', '', 26);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP004', 'HBL ALQUILER EQUIPOS TOPOGRAFIA', 'TEODOLITOS-CARACAS', 'ESP001', 'ESP002', 'PARADERO A VENUS, LA CANDELARIA, CARACAS', '', '0212-9511630-5767243', '0212-9511630-5767243', 'hbltoplic.rafaelparra@hotmail.com', '', '0414-2934546', '', 27);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP005', 'URBANISMOS HERNADEZ & ASOCIADOS', 'TEODOLITOS-CARACAS', 'ESP001', 'ESP002', 'LA CAMPIÑA, EDF ABEL, CARACAS', '', '0212-7311529', '0212-7311529', 'freddyshernandez@cantv.net', '', '0414-2795773', '', 28);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP006', 'MECINCA TOPOGRAFIA GPS', 'TEODOLITOS-CARACAS', 'ESP001', 'ESP002', 'AV FCO MIRANDA ED GALERIAS MIRANDA PISO 2 OF 210', 'CHACAO, CARACAS', '0212-2630639-2667954', '0212-2638818', 'ventas@mecinca.net', 'www.mecinca.net', '0414-2795773', '', 29);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP007', 'TECNOCONCRET EQUIPOS DE LABORATORIO', 'ING. LEOPOLDO MALDONADO', 'ESP001', 'ESP004', '"URB. BOLEITA NORTE, CALLE ""E"" EDF. SAN ONOFRE"', 'CARACAS', '0212-2376411', '0212-2376411', 'laboratorio.tecnoconcret@yahho.com', 'www.tecnoconcret.com', '', '', 30);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP008', 'ADVANCE POWER CORPORATION,C.A,', 'TRAILER PARA OFICINAS, EL TIGRE', 'VEH004', 'ALQ001', 'El Tigre, Edo Anzoategui', '', '0283 241 2218', '0424- 831-4912', 'advancecorporationca@gmail.com', '', '', '', 31);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('ESP009', 'LETEICA C.A. ENSAYOS ESPECIALES', 'ENSAYOS DE CALIDAD Y CONCRETO', 'ESP001', 'ESP004', 'AV. 7MA, QUINTA LATEICA, URBANIZACIÓN MARIPÉREZ', 'CARACAS', '0212-7811467-1340', '', 'lateica@cantv.net', 'www.lateica.com', 'ENSAYOS DE LABORATORIO EN GENERAL', '', 32);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER001', 'DISTRIBUIDORA JGM, C.A.', 'JORGE CABALLERO', 'ALB002', 'CON001', 'EL ROSAL, CARACAS', '', '02129512403  9529859', '0212-9531126', '', '', '', '', 33);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER002', 'MAQUINARIAS CORTE, C.A.', '', 'ALB003', 'ALQ001', 'CALLE 10, EDIF. CORTE LA URBINA CARACAS', '', '0212-2414133  0260', '02122419108  2424428', 'maqcorte@cantv.net', '', 'VIBRADOR, PERROS, PUNTALES, DOBLADORAS', '', 34);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER003', 'EXHIBICION SAN ISIDRO', '', '', '', '', '', '362.5553/9886/4542', '', '', '', '', '', 35);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER004', 'FERREALQUILER C.A.', 'ALQ HERRAMIENTAS-CARACAS', 'ALB005', 'ALB002', '"AV PPAL URB LEBRUN, EDF MOD, PB LOC ""A"" PETARE"', 'CARACAS', '0212-2567411-8486', '0212-2567411-8486', '', '', '', '', 36);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER005', 'FERRESANCHEZ', '', '', '', '', '', '631.0022/1033', '', '', '', '', '', 37);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER006', 'SUMIGASES BARLOVENTO C.A.', '', 'FER002', 'ALB001', 'AV. INTERCOMUNAL GUARENAS-GUATIRE', 'PISO PB, LOCAL 01, URB. VALLE VERDE,  MIRANDA', '0212 3626783', '0212 3614117', 'sumigases@cantv.ne', 'www.sumigasesbarlovento.com.ve', '', '', 38);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER007', 'FERRETERIA DEL ESTE', '', '', '', '', '', '256.6642/8568/7683/7', '', '', '', '', '', 39);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER008', 'AGRICOLA BELLO MONTE', '', '', '', '', '', '751.0546 753/4268-90', '', '', '', '', '', 40);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER009', 'FERRETOTAL', '', '', '', '', '', '237.6209/6593/6321', '', '', '', '', '', 41);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER010', 'FINCA-AGRO DE VENEZUELA', '', '', '', '', '', '371.3640/0066', '', '', '', '', '', 42);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER011', 'INDUSTRIAS FREE WAYS', '', '', '', '', '', '(0274) 52.0877/3957', '', '', '', '', '', 43);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER012', 'MATERIALES FERRELUZ', '', '', '', '', '', '256.9476/6851/8833 /', '', '', '', '', '', 44);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER013', 'CORPORACION ALVAJOS', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB001', 'URB CARAPA AV INTERCOMUNAL DE ANTIMANO, ED IND.', 'PASSARO, PISO 2 LOC 2-B, LA YAGUARA, CARACAS', '0212-4438277-0242', '0212-4434043', 'alvajos@telcel.net.ve', 'www.alvajos.com', '0212-4437761', '', 45);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER014', 'CENTRO FERRETERO EL PICO', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB001', 'CARRETERA PETARE STA LUCIA KM 6 CF EL PICO', 'FILAS DE MARICHE, CARACAS', '0212-5320551', '0212-5320551', 'elpico@cantv.net', '', '', '', 46);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER015', 'COMERCIAL MARTIN COMARTIN', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB001', 'CALLE VARGAS, EDF COMARTIN, BOLEITA NORTE', 'CARACAS', '0212-2349411 al 14', '0212-2382775', 'elpico@cantv.net', '', '', '', 47);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER016', 'HERRAMIENTAS VENEZOLANAS ACESA', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB001', 'EL MARQUES CARACAS', 'VILLA DE CURA, ARAGUA 0244-3889428 3889528', '0212-2420419-0414', '0212-2420341', '', '', '', '', 48);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER017', 'SUPLIDORA INDUSTRIAL JOSTEREL C.A.', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB001', 'AV SANZ C/CALLE CARAPA, RES. ELITE, PB, OF 3', 'EL MARQUEZ, CARACAS', '0212-2394291-2343764', '0212-2352186', 'josterel@hotmail.com', 'www.josterel.com', '', '', 49);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER018', 'ANTONIO GUZZO FER INDUSTRIAL', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB006', 'FINAL AV LAS PALMAS, FTE PZA BOLEITA, ED GUFRANSA', 'PB BOLEITA SUR, CARACAS', '0212-2346928-2683', '0212-2348565', 'info@antonioguzzo.com', 'www.antonioguzzo.com', '', '', 50);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER019', 'OLY COPIA HERRAMIENTAS METABO', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB002', '3ra TRANSV LOS RUICES, Edf. Principal II PISO 5', 'CARACAS', '0212 - 237.30.22', '0212 - 239.23.65', 'olycopia@olycopia.com', 'www.olycopia.com', '', '', 51);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER020', 'BLACK AND DECKER DE VENEZUELA C.A.', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB002', 'AV DIEGO CISNEROS, OFICENTRO LOS RUICES, PB', 'OF PB-C, CARACAS', '0212-2350763', '0212-2355777', '', '', '', '', 52);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER021', 'HERRAMIENTAS HERRAGRO C.A.', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB002', 'AV SUCRE LOS DOS CAMINOS, ED CTRO PQE BOYACA', 'TORRE CETRO PISO 15 OF 154, CARACAS', '0212-2853105-5547', '0212-2858427', 'venezuela@herrago.com', 'www.herragro.com', '', '', 53);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER022', 'HERRAMIENTAS BOSCH', 'FERRETERIA INDUSTRIAL-CARACAS', 'FER002', 'ALB002', 'FINAL CALLE VARGAS ED CTRO BERIMER, PB', 'BOLEITA NORTE, CARACAS', '0212-2074511', '0212-2396063', '', '', '', '', 54);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER023', 'BELLOTA VENEZUELA CA', 'HERRAMIENTAS-CARACAS', 'FER002', 'ALB002', 'URB IND CORINSA, CON LAZO 1, CAGUA', 'CAGUA, EDO. ARAGUA', '0244-3953011', '0244-3954277', 'mkt@venbellota.com', 'www.bellota.com', '', '', 55);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('FER024', 'DISTRIBUIDORA DIMPERCA C.A.', 'ALQUILER EQUIPOS-CARACAS', 'ALB005', 'ALQ001', 'AV. PPAL DE MARIPEREZ, QTA MARANI', 'CARACAS', '212-7935173-5902', '212-7934777', 'dimperca@gmail.com', 'www.dimperca.com', 'www.miherramienta.com  0212-7935506/4792', '', 56);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('GAS001', 'VENGAS', '', '', '', '', '', '693.1044', '', '', '', '', '', 57);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HER001', 'HERRERIA METALLOCK 2800, C.A', '', 'HER001', 'HER001', 'AV. HOLLYWOOD, GALPON B, ARTIGAS', 'CARACAS.', '461-9393', '461-9468', '', '', '', '', 58);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HER002', 'OXIGENOS MARICHE C.A.', '', 'FER001', 'HER002', 'FILAS DE MARICHE, CARRETERA PETARE STA LUCIA KM 6', 'CTRO COM LOS DIAZ, EDO MIRANDA', '0212-5322007', '', '', '', '', '', 59);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HER003', 'OXIGENO BELLO MONTE', '', '', '', '', '', '751.1831 753.6081/70', '', '', '', '', '', 60);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HER004', 'CARROSAN', '', '', '', '', '', '443.7784/5715', '', '', '', '', '', 61);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HER005', 'ELECTREX SOLDADURA', 'SOLDADURA-CARACAS', 'HER002', 'HER002', 'CC MANZANARES PLAZA PISO 2 OF 02-13 URB', 'MANZANARES, BARUTA, CARACAS', '0212-9446941', '0212-9446941', 'ventas@electrex.com.ve', 'www.electrex.com.ve', '', '', 62);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HID001', 'HIDRICAVEN', '', '', '', '', '', '285.3811 FAX 283.163', '', '', '', '', '', 63);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HID002', 'LA FERIA DEL TANQUE', '', '', '', '', '', '484.1732 482.3082', '', '', '', '', '', 64);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('HID003', 'MANGUERAS INDUSTRIALES', '', '', '', '', '', '238.5411', '', '', '', '', '', 65);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('LIM001', 'VENEQUIRCA', '', 'LIM001', 'LIM001', 'CALLE VARGAS, EDF ESTEBAN, PB, BOLEITA NORTE', 'CARACAS', '2323686 / 232-7213', '232-6116', '', '', '', '', 66);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('LIM002', 'PLASTICONSULT, C.A', '', 'LIM001', 'LIM001', 'PROLONGACION CALLEJON LA PEDRERA, EDF GUACAY, PB', 'LOCAL 3, LAS MINAS DE BARUTA', '9431241 / 941-7425', '963-6383', '', '', '', '', 67);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('LIM003', 'FULLER', '', '', '', '', '', '731.7111', '', '', '', '', '', 68);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('LIM004', 'HIDROJET', '', '', '', '', '', '(051) 69.0901/1656', '', '', '', '', '', 69);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI001', 'FENIX MAQUINARIAS', '', '', '', '', '', '238.6141/7925 239.10', '', '', '', '', '', 70);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI002', 'MAQUINARIAS DOSIMAQ C.A. CARACAS', '', 'ALB005', 'MAQ002', 'BOLEITA SUR, CARACS', '', '0212-2344047 2387101', '', '', '', '', '', 71);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI003', 'MEMORE MAQUINARIAS', '', '', '', '', '', '238.2722 FAX 239.165', '', '', '', '', '', 72);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI004', 'MOTUSA', '', '', '', '', '', '239.7587/7743 235.18', '', '', '', '', '', 73);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI005', 'OTTO WOLFF DE VZLA', '', '', '', '', '', '945.8511 943.4979/41', '', '', '', '', '', 74);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI006', 'CARACOL, C.A', 'AUGUSTO OLIVA / 0414 - 845 03 12', 'ALQ001', 'ALQ001', 'ZONA INDUSTRIAL, GALPONES F1 Y F2,', 'EL TIGRE, EDO. ANZOATEGUI', '0283 - 241 28 78', '0283 - 241 29 64', 'master@caracolca.com', 'www.caracolca.com', 'PLANTAS ELECTRICAS, DE TRATAMIENTO, TANQUES VARIOS', '', 75);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI007', 'MAQUINARIAS LORENZI C.A.', 'ALQUILER DE MAQUINARIA', 'ALB005', 'MAQ002', 'CARRERA 1, ENTRE CALLE 19 Y 20, ZONA INDUSTRIAL', 'BARQUISIMETO, EDO LARA', '0251-2373227-3395', '0251-2370008', '', '', '', '', 76);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI008', 'MAQUINARIAS Y COMPRESORES S.A.', 'ALQUILER DE COMPRESORES', 'ALB005', 'MAQ006', 'AV LISANDRO ALVARADO, NRO 114-554, FTE A CERAMICAS', 'CARABOBO, VALENCIA, EDO. CARABOBO', '0241-8313770-8585', '0241-8533085', '', '', '', '', 77);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI009', 'MAQUITECH DISTRIBUIDORES C.A.', 'ALQUILER DE EQUIPOS-CARACAS', 'ALB005', 'ALQ001', 'LA URBINA, CALLE 7 ENTRE 5 Y 6, CARACAS', '', '0212-2432629-2764', '0212-2426441', 'admi@maquitech-ve.com', 'www.maquitech-ve.com', 'VALENCIA 0241 8326463', '', 78);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAI010', 'MAQUINARIAS Y HERRAMIENTAS TACHIRA', 'ALQ. DE EQUIPOS-SN CRISTOBAL', 'ALB005', 'ALQ001', 'CARRERA 16 NO. 11-7, BARRIO OBRERO, SN CRISTOBAL', '', '0416-6763946', '0276-446575', '', '', '', '', 79);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ001', 'ATLAS COPCO', '', 'ALB003', 'MAQ006', '', '', '256-2311/ 256-4545', '228243', '', '', '', '', 80);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ002', 'MAQUINARIAS MPA - ALQUILER', 'SR PABLO GIL-CARACAS', 'MOV001', 'MAQ001', 'CALLE 1, LA YAGUARA CTRO. MPA', 'ANTIMANO, CARACAS.', '0212-4436101-8401', '0212-4439078-4714898', '', 'www.maquinarias.com.', '', '', 81);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ003', 'STII C.A', '', 'MAQ002', 'MAQ001', '', '', '(039) 913968', '(039) 917974', '', '', '', '', 82);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ004', 'MEFCA-TRACTOR', '', 'MAQ002', 'MAQ001', 'AV INTERCOMUNAL DE ANTIMANO, CARACAS', '', '472-7893 / 472-7961', '443-2004', '', '', '', '', 83);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ005', 'MAQUINARIA PARA OBRAS-MPO VENTA', 'RETRO-EXCAVA-CARACAS', 'MAQ002', 'MAQ001', 'CALLE 3 CON C/CALLE 11, LA YAGUARA', 'CARACAS.', '0212-4710306 / 3086', '0212-4711218', 'mposervi@cantv.net', 'www.mposer.com.ve', '', '', 84);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ006', 'MAQUINARIAS OLIMPO C.A', '', 'MAQ002', 'MAQ001', 'ESQ. 2DA TRANSVERSAL CON 1ERA CALLE NORTE SUR', 'URB. LOS RUICES NORTE', '0212-2390113', '0212-2390113', '', '', '', '', 85);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ007', 'EQUIPAR', '', 'MAQ002', 'MAQ001', 'EL PARAISO, CARACAS', '', '541-0941', '', '', '', '', '', 86);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ008', 'MPA MAQUINARIAS PARA ALQUILAR CA', 'PABLO GIL (ALQUILER-CARACAS)', 'MAQ002', 'MAQ001', 'CALLE UNO LA YAGUARA, CENTRO EMPRESARIAL MPA', 'ANTIMANO, CARACAS', '0212-4439122- 8401', '0212 4439940', '', 'www.maquinarias.com', '0800-6726721 ARNOLDO VELAZQUEZ-EN VALENCIA', '', 87);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ009', 'MAQUINARIAS LARMAQ C.A.', '', 'ALB002', 'MAQ002', 'CALLAE EL ARENAL CON CALLE LA SOLEDAD, ZONA', 'INDUSTRIAL LA TRINIDAD, CARACAS', '0212-9445629', '0212-9454941', 'rrivas@lrmaq.com', 'www.larmaq.com', '', '', 88);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ010', 'MAQUINARIAS TRENARD C.A.', 'MORELA TRENARD-ALQUILER', 'ALB002', 'SUB003', 'AV. VENEZUELA NO. 25-14, BELLO MONTE CARACAS', '', '02129512948 9526301', '0212-9515563', 'maqtrenard@telcel.net.ve', '', '0414-1253369', '', 89);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ011', 'IMPEXPAR C.A.', '', 'ALB003', 'MAQ002', 'AV. ANDRES BELLO, ENTRE LOS JAVILOS Y LOS SAMANES', 'EDF. KENORA, PB, LA FLORIDA, CARACAS', '0212-4145480-5481', '0212-7318164', 'ventas@impexpar.com', 'www.impexpar.com', 'ANDAMIOS ELEVACION, BARREDORAS, ETC.', '', 90);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ012', 'MOTORES Y MAQUINARIAS C.A.', '', 'ALB003', 'MAQ002', 'AV PPAL DE LA YAGUARA, CTRO. EMP. MPA', 'CARACAS', '0212-4715216 5892', '0212-4439535', '', '', '', '', 91);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ013', 'METAL-ARTE C.A.', '', 'ALB003', 'MAQ002', 'CALLE SUCRE CON CALLE ZULIA, BARRIO SUCRE', 'PUERTO LA CRUZ', '0281 - 2776167', '0212 - 2742716', 'viecomercial@metal-arte.com', 'www.metal-arte.com', '', '', 92);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ014', 'MAQUINARIAS VENEQUIP', '', '', '', '', '', '0212-272.7166/5182', '', '', '', '', '', 93);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ015', 'SANCHEZ & CIA. S.A', '', 'ALB003', 'COM001', 'AV ROOSVELT, EDIF. SANCHEZ Y CIA, PRADO DE MARIA', 'CARACAS', '0212-6310022-1922', '0212-631-2774', '', 'www.sanchezcia.com', 'VALENCIA 041-8344735- 4736 8322822', '', 94);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ016', 'WALCO INDUSTRIAL S.A.', 'SEGURIDAD, ESPECIAL', 'LIM001', 'MAQ003', 'CALLE SANTA CLARA, PARCELA 18 Y 20, BOLEITA NORTE', 'CARACAS', '0212-2370622', '0212-2390130', '', 'www.walcoidustrial.com', '', '', 95);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ017', 'RAM 2000 C.A. ALQUILER', 'MAQ MOV TIERRA-RETRO--CARACAS', 'MAQ003', 'EXC002', 'AV MORAN URB LA QUEBRADITA II, GAOLPON NO 1, SAN', 'MARTIN', '0212-471-4420', '', '', '', '0414-3035968  0416-2930447', '', 96);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ018', 'MAQUINARIAS ALQUI RETRO C.A.', 'MAQ MOV TIERRA-RETRO--CARACAS', 'MAQ003', 'EXC002', 'AV SAN SEBASTIAN, QTA OLGA, LA TRINIDAD, BARUTA', 'CARACAS', '0212-9450202-3128214', '0212-9440198', '', 'www.ventools/alquiretro.htm', '', '', 97);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ019', 'MAQUINARIAS GIANPRO- ALQUILER', 'MOV TIERRA-RETRO-COMP-CARACAS', 'MAQ003', 'EXC002', '3RA AV DE MONTECRISTO, ENTRE 1RA TRANSV Y AV', 'ROMULO GALLEGOS, QTA ANDREA, NO. 3 CARACAS', '0212--2345711-1828', '0212-2341828-2322572', 'informacion@maquinariasgianpro.com', 'www.maquinariasgianpro.com', '', '', 98);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ020', 'GRUPO CASCO DE VENEZUELA', 'MOV TIERRA-CAMIONES-CARACAS', 'VEH001', 'EXC002', 'Av Intercomunal San Diego. C.C. Boulevard', 'Valencia, Estado Carabobo', '0241- 8717437-7897', '0241 871.60.38', 'cascoval@cascovenezuela.com', 'www.cascovenezuela.com', '0-501-CASCOVE (227.26.83)', '', 99);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ021', 'TALLER MECANICO INDUST. PARIS C.A.', 'MAQUINARIA - CARACAS', 'MAQ003', 'EXC001', 'CALLA VARGAS C/CALLE STA CLARA BOLEITA NORTE CS', 'CARACAS, DTO CAPITAL', '0212-2343789', '0212-2372026', 'tmiparis@cantv.net', '', 'ALQUILER DE RETRO Y COMPRESORES', '', 100);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MAQ022', 'MAQUINARIAS BERO 09 C.A.', 'MAQUINARIA - CARACAS-CHARALLAVE', 'ALB006', 'EXC001', 'CARRETERA CHARALLAVE OCUMARE KM 4 GALPON 9 OCUMARE', 'CHARALLAVE, EDO. MIRANDA', '0239-5004354', '0239-4158216', '', '', 'AV. NEVERI, CTRO COM LOS CHAGUARAMOS 212-6617456', '', 101);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MOV001', 'MAQUINARIAS BARUTA, C.A', '', 'EXC001', 'EXC001', 'CARRETERA BARUTA, EL PLACER (AL LADO HERMANAS', 'MISIONERAS) VILLA LAURA, LOS GUAYABITOS', '962-1781 / 0945', '', '', '', '', '', 102);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MOV002', 'T.M.C. RUBER C.A', '', 'MAQ002', 'EXC002', 'CALLE PANAMERICAN, NTRE CHILE Y BOLIVIA N.52.', 'CATIA, CARACAS', '871-3667', '872-0941', '', '', '', '', 103);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MOV010', 'ALQUIMA S.R.L.', '', 'ALB002', 'ALB002', 'EL CAFETAL, CARACAS', '', '0212-9851448', '', '', '', '', '', 104);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('MOV011', 'SPILFER C.A.', '', 'VEH004', 'VEH005', 'CARRETERA NACIONAL CHARALLAVE-CUA, KM 8', '', '039-911867 911681', '039 911264', '', '', '', '', 105);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('PEQ19', 'FERRETERIA DEL ESTE', '', '', '', '', '', '', '', '', '', '', '', 106);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('PIL001', 'LBM INGENIERIA DE PILOTAJE', '', '', '', '', '', '263.6062', '', '', '', '', '', 107);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('PIN001', 'PROY SEÑAL', '', '', '', '', '', '267.6345/4256', '', '', '', '', '', 108);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('PIN002', 'PINTACASA', '', '', '', '', '', '993.8963/0750 992.44', '', '', '', '', '', 109);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB001', 'IMPER SIMEX S.A', '', 'SUB001', 'SUB003', 'CALLE LAS INDUSTRIAS, PARCELA Nª 7, ZONA INDUSTRIA', 'TURUMO. OF. EL MARQUEZ', '0212-2359209', '', '', '', '', '', 110);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB002', 'SERVIPS, C.A', '', 'SUB001', 'SUB003', '', '', '285-7896 / 285-2485', '283-1745', '', '', '', '', 111);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB003', 'ANDAMIOS DALMINE S.A', '', 'ALB005', 'SUB003', 'AV LIBERTADOS, MULTICENTRO EMPRESARIAL DEL ESTE', 'EDF LIBERTADOR, NUCLEO B', '0212-2639694 1844', '0212-2610350', 'adalmine@telcel.net', '', '', '', 112);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB004', 'ANDAMIOS COMETI C.A', '', 'SUB001', 'SUB003', 'EDF PASAJE CONCORDIA PISO 2, OFC A-2', 'AV FRANCISCO SOLANO', '762-4887 / 761-6658', '762-3792', '', '', '', '', 113);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB005', 'FAVEALCA C.A', '', 'SUB001', 'SUB003', 'CARRETERA EL JUNQUITO, KM 4 VIA HACIENDA', 'EL CASTILLO A 200 MTS DE DIVENCA', '872-5038', '(014) 937-1418', '', '', '', '', 114);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB006', 'POTAIN', '', 'MAQ002', 'SUB003', 'CARRETERA EL JUNQUITO, KM 4 VIA HACIENDA', 'EL CASTILLO A 200 MTS DE DIVENCA', '872-5038', '(014) 937-1418', '', '', '', '', 115);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB007', 'MONTACARGAS DOMA, C.A', '', 'SUB001', 'SUB007', 'CALLE 11, LA YAGUARA, DETRAS DE MUEBLES MARY', 'CARACAS.', '472-3889 / 471-0070', '443-7127', '', '', '', '', 116);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB008', 'TRANSPORTES ZARE, C.A', '', 'SUB001', 'SUB007', 'VENADO A PIEDRAS, TALLERES ZARE, CERCA DE QUINTA', 'CRESPO, CARACAS.', '545-4415/ 541-1095', '542-3017', '', '', '', '', 117);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB009', 'MONTAJES TAGAR, C.A.', 'EDGAR GARCIA', 'MAQ002', 'MAQ005', 'AV FRANCISCO DE MIRANDA, URB LEBRUN, AV PRINCIPAL', 'CC LEBRUN, LOCAL 11, PETARE', '2567180 / 6906', '2567293', '', '', '', '', 118);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB010', 'GRUAS CORSA', '', '', '', '', '', '(043) 53.7392/7337', '', '', '', '', '', 119);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB011', 'GRUAS LANOTTO, S.A.', '', '', '', '', '', '471.3030 FAX:471.301', '', '', '', '', '', 120);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB012', 'ANDAMIOS CARACAS', 'ALQ. ANDAMIOS- CARACAS', 'ALB005', 'SUB001', 'FINAL 4TA TRANSVERSAL, BOLEITA SUR, NO 52B', 'CARACAS', '02122382823 2359668', '0212-2353547', 'andamios@andamioscaracas.com', 'www.andamioscaracas.com', '', '', 121);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB013', 'ANDAMIOS BARQUISIMETO', 'ALQ. ANDAMIOS- BARQUISIMETO', 'ALB005', 'SUB001', 'AV VENEZEULA NO 9-96, BARQUISIMETO', '', '0251-2527070-7945', '0251-2527581', '', '', '', '', 122);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB014', 'ANDAMIOS ANCAR', 'ALQ. ANDAMIOS- BARQUISIMETO', 'ALB005', 'SUB001', 'CALLE 31, ENTRE CARRERAS 24 Y 25', 'BARQUISIMETO', '0251-2311919', '0251-2321912', '', '', '', '', 123);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB015', 'ANDAMIOS GLEASON S.A.', 'ALQ. ANDAMIOS-CAGUA', 'ALB005', 'SUB001', 'AV MARCOS BERACASA, ZONA IND. LAS VEGAS', 'CAGUA, EDO ARAGUA', '0244-4476389-6378', '0244-4476389-6378', '', '', '', '', 124);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('SUB016', 'SUPULCA (ESCALERAS DIELECTRICA)', 'ESCALERAS DILECTRICAS-CARACAS', 'ELE003', 'SUB001', 'URB INDUSTRIAL CLORIS, AV NORTE PARCELA NO 84-A', 'GUARENAS, EDO MIRANDA', '0212-3610257-3554', '0212-3627444', 'supulca@cantv.net', 'www.supulca.com', '', '', 125);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR001', 'INVERSIONES LUZAN S.R.L.', '', '', '', '', '', '234/8108 235/1091', '', '', '', '', '', 126);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR002', 'TRANSPORTE TMC RUBBER C.A.', 'ALQ MAQUINARIA-CARACAS', 'MAQ003', 'EXC001', 'CALLE PANAMERICANA, ENTRE CHILE Y BOLIVIA NO 52', 'CARACAS', '0212-8713667-8725935', '0212-8729841', '', '', '0416-6234418', '', 127);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR003', 'IVROCA', '', '', '', '', '', '322.8698/4250/7184/9', '', '', '', '', '', 128);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR004', 'JUAN Y CIPRIANO', '', '', '', '', '', '271.4668 271.7880', '', '', '', '', '', 129);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR005', 'LEICA', '', '', '', '', '', '241.4294/5318', '', '', '', '', '', 130);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR006', 'MARESA', '', '', '', '', '', '239.0496/6285/53.68/', '', '', '', '', '', 131);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR007', 'OTACCA', '', '', '', '', '', '782.7122/014-9278393', '', '', '', '', '', 132);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR008', 'PARAMO MACHINE TOOL', '', '', '', '', '', '451.3077', '', '', '', '', '', 133);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR009', 'REMA C.A.', '', '', '', '', '', '(041) 311549/2071/84', '', '', '', '', '', 134);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR010', 'RETALACA', '', '', '', '', '', '272.1356/0778/9889', '', '', '', '', '', 135);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR011', 'TRADER', '', '', '', '', '', '283.1843/2798', '', '', '', '', '', 136);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VAR012', 'WINTOCA', '', '', '', '', '', '381.1110/1257/0862/0', '', '', '', '', '', 137);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH001', 'TRANSPORTE MANZURRY, C.A', '', 'VEH001', 'VEH001', 'AV LOS JABILLOS N.17-47, EL CEMENTERIO', 'CARACAS', '6313111/ 1313', '631-6711', '', '', '', '', 138);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH002', 'IDS VEHICULOS ESPECIALES', '', 'VEH003', 'VEH003', 'AV. CARONI,EDF SORRENTO, LOCAL A-1 COLINAS DE', 'BELLO MONTE, CARACAS', '751-2027', '751-9486', '', '', '', '', 139);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH003', 'AUTOPREMIUM GMAC', 'VENTAS', 'VEH001', 'MAQ004', 'CALLE SUR 4 FRENTE A DOMESA, QTA CRESPO', '', '0212 4829221 9222', '0212 4829223', 'autopremium@cantv.net', '', 'CAMIONES GM: NPR, KODIAK,  C-3500', '', 140);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH004', 'AUTO CARACAS', '', 'VEH001', 'MAQ004', 'CARACAS', '', '0212-993.9673', '', '', '', '', '', 141);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH005', 'AUTOAGRO C.A.', '', '', '', '', '', '02124810522 4829291', '', '', '', '', '', 142);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH006', 'AUTOMOTRIZ VENEZOLANA C.A.', '', '', '', 'CARACAS', '', '0212-6322722/5033', '', '', '', '', '', 143);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH007', 'ARRENDAMINETOS BARUTA C.A.', 'MAQUINARIAS-CARACAS', 'MAQ003', 'MAQ002', 'CARRETERA BARUTA EL PLACER, VIA LAURA-LOS', 'GUAYABITOS, CARACAS', '0212-9621781', '0212-9620945', '', '', '0416-6210224', '', 144);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH008', 'EXIAUTO', '', '', '', '', '', '239.2222/7233/1133', '', '', '', '', '', 145);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH009', 'FAVOLCAR', '', '', '', '', '', '681.0765/2296 682.30', '', '', '', '', '', 146);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH010', 'ALQUIVECA', '', 'VEH005', 'VEH006', '', '', '0212-235.5966-3877', '', '', '', '', '', 147);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH011', 'ALQUIVEN', '', '', '', '', '', '272.6711/7711 FAX:27', '', '', '', '', '', 148);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH012', 'PAN AMERICAN CARS,C.A.', '', '', '', '', '', '372.8825/8831/8838', '', '', '', '', '', 149);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH013', 'TALLERES ROOTES', '', '', '', '', '', '632.8222/6133', '', '', '', '', '', 150);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VEH014', 'TRANSPORTE TRANSER 25 C.A.', 'TRANSPORTE-CARACAS', 'VEH001', 'MAQ004', 'SECTOR LA CUESTA, GALPON NO 8, KM 1, FILAS', 'DEMARICHE, EDO MIRANDA', '0212-2427862', '0212-2435764', 'transer25@cantv.net', '', '', '', 151);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VIA001', 'RESANCIL C.A', 'ALQUILER DE MAQUINARIA-CARACAS', 'VIA001', 'VIA001', '4TA TRANSVERSAL DE MONTECRISTO, EDF BANCARACAS', 'PISO 2 OFC 2, CARACAS', '0212-2377726 / 8094', '0212-237-9515', 'resansil@cantv.net', 'www.resansil.com', '', '', 152);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VID001', 'PALETPLASTIC C.A.', '', '', '', '', '', '573.2428/7395 577.13', '', '', '', '', '', 153);
INSERT INTO proveedoresequipos (referencia, proveedor, contacto, referenciaactividad, referenciaespecialidad, direccion1, direccion2, telefono, fax, email, web, comentario, externa, id_proveedoresequipos) VALUES ('VID003', 'UNIPLAST', '', '', '', '', '', '344.0809/1231/1831 (', '', '', '', '', '', 154);


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 191
-- Name: proveedoresequipos_id_proveedoresequipos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedoresequipos_id_proveedoresequipos_seq', 154, true);


--
-- TOC entry 2109 (class 0 OID 44744)
-- Dependencies: 186
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (49, 'g', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (50, '12', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (51, '2', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (52, '1', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (53, '4', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (54, '5', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (55, '5', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (56, '6', '2016-08-02 00:00:00-03', true);
INSERT INTO proyecto (id_proyecto, nombre, fecha_creacion, activo) VALUES (57, '7', '2016-08-02 00:00:00-03', true);


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 187
-- Name: proyecto_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_proyecto_seq', 57, true);


--
-- TOC entry 2106 (class 0 OID 44716)
-- Dependencies: 183
-- Data for Name: regioncontinente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (1, 'AMN', 'AN', 'AMERICA DEL NORTE (NORTEAMERICA)', 2);
INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (2, 'AMC', 'AC', 'AMERICA CENTRAL (CENTROAMERICA)', 2);
INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (3, 'AMS', 'AS', 'AMERICA DEL SUR (SUDAMERICA)', 2);


--
-- TOC entry 2100 (class 0 OID 44646)
-- Dependencies: 177
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id_usuario, usuario, password, nombres, apellidos, id_area, id_cargo, correo, tlf, id_idioma, primera_vez, activo, fecha_registro, fecha_ultima_clave, administrador, logeado) VALUES (1, 'demo', '077115e65345fe55dd9636ceffc0d3a4', 'demo', 'demo', 1, 1, 'demo@demo.co', '123456789', 1, true, true, '2016-07-09 00:00:00-03', '2016-07-09 00:00:00-03', true, true);


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 178
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- TOC entry 2102 (class 0 OID 44657)
-- Dependencies: 179
-- Data for Name: usuario_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario_pais (id_usuario_pais, id_usuario, id_pais) VALUES (1, 1, 1);


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuario_pais_id_usuario_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_pais_id_usuario_pais_seq', 1, true);


--
-- TOC entry 1971 (class 2606 OID 44715)
-- Name: continente_cod; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY continente
    ADD CONSTRAINT continente_cod UNIQUE (cod_continente);


--
-- TOC entry 1973 (class 2606 OID 44713)
-- Name: continente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY continente
    ADD CONSTRAINT continente_pkey PRIMARY KEY (id_continente);


--
-- TOC entry 1981 (class 2606 OID 44790)
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 1977 (class 2606 OID 44743)
-- Name: idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (id_idioma);


--
-- TOC entry 1961 (class 2606 OID 44675)
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id_moneda);


--
-- TOC entry 1969 (class 2606 OID 44704)
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- TOC entry 1963 (class 2606 OID 44679)
-- Name: parametros_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametros_sistema
    ADD CONSTRAINT parametros_sistema_pkey PRIMARY KEY (id_parametros_sistema);


--
-- TOC entry 1983 (class 2606 OID 44808)
-- Name: proveedoresequipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedoresequipos
    ADD CONSTRAINT proveedoresequipos_pkey PRIMARY KEY (id_proveedoresequipos);


--
-- TOC entry 1979 (class 2606 OID 44754)
-- Name: proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id_proyecto);


--
-- TOC entry 1975 (class 2606 OID 44720)
-- Name: regioncontinente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regioncontinente
    ADD CONSTRAINT regioncontinente_pkey PRIMARY KEY (id_region_continente);


--
-- TOC entry 1967 (class 2606 OID 44681)
-- Name: usuario_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_pais
    ADD CONSTRAINT usuario_pais_pkey PRIMARY KEY (id_usuario_pais);


--
-- TOC entry 1965 (class 2606 OID 44683)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1986 (class 2606 OID 44721)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regioncontinente
    ADD CONSTRAINT "$1" FOREIGN KEY (id_continente) REFERENCES continente(id_continente);


--
-- TOC entry 1984 (class 2606 OID 44726)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT "$1" FOREIGN KEY (id_region_continente) REFERENCES regioncontinente(id_region_continente);


--
-- TOC entry 1985 (class 2606 OID 44731)
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT "$2" FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda);


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 190
-- Name: proveedoresequipos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE proveedoresequipos FROM PUBLIC;
REVOKE ALL ON TABLE proveedoresequipos FROM postgres;
GRANT ALL ON TABLE proveedoresequipos TO postgres;
GRANT SELECT ON TABLE proveedoresequipos TO PUBLIC;


-- Completed on 2016-08-02 22:07:39 ART

--
-- PostgreSQL database dump complete
--
