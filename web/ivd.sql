--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-07-17 22:35:49 ART

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
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 44621)
-- Name: cliente_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente_empresa (
    id_cliente_empresa integer NOT NULL
);


ALTER TABLE cliente_empresa OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 44624)
-- Name: cliente_empresa_id_cliente_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_empresa_id_cliente_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_empresa_id_cliente_empresa_seq OWNER TO postgres;

--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 174
-- Name: cliente_empresa_id_cliente_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_empresa_id_cliente_empresa_seq OWNED BY cliente_empresa.id_cliente_empresa;


--
-- TOC entry 184 (class 1259 OID 44709)
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
-- TOC entry 187 (class 1259 OID 44738)
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idioma (
    id_idioma integer NOT NULL,
    idioma character varying(100),
    siglas character varying(8)
);


ALTER TABLE idioma OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 44736)
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
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 186
-- Name: idioma_id_idioma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_id_idioma_seq OWNED BY idioma.id_idioma;


--
-- TOC entry 175 (class 1259 OID 44631)
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE moneda (
    id_moneda integer NOT NULL,
    moneda character varying(100)
);


ALTER TABLE moneda OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 44634)
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
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 176
-- Name: moneda_id_moneda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moneda_id_moneda_seq OWNED BY moneda.id_moneda;


--
-- TOC entry 183 (class 1259 OID 44700)
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
-- TOC entry 177 (class 1259 OID 44641)
-- Name: parametros_sistema; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametros_sistema (
    id_parametros_sistema integer NOT NULL
);


ALTER TABLE parametros_sistema OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 44644)
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
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 178
-- Name: parametros_sistema_id_parametros_sistema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametros_sistema_id_parametros_sistema_seq OWNED BY parametros_sistema.id_parametros_sistema;


--
-- TOC entry 185 (class 1259 OID 44716)
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
-- TOC entry 179 (class 1259 OID 44646)
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
-- TOC entry 180 (class 1259 OID 44655)
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
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 181 (class 1259 OID 44657)
-- Name: usuario_pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_pais (
    id_usuario_pais integer NOT NULL,
    id_usuario integer,
    id_pais integer
);


ALTER TABLE usuario_pais OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 44660)
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
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 182
-- Name: usuario_pais_id_usuario_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_pais_id_usuario_pais_seq OWNED BY usuario_pais.id_usuario_pais;


--
-- TOC entry 1927 (class 2604 OID 44662)
-- Name: id_cliente_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente_empresa ALTER COLUMN id_cliente_empresa SET DEFAULT nextval('cliente_empresa_id_cliente_empresa_seq'::regclass);


--
-- TOC entry 1938 (class 2604 OID 44741)
-- Name: id_idioma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma ALTER COLUMN id_idioma SET DEFAULT nextval('idioma_id_idioma_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 44664)
-- Name: id_moneda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda ALTER COLUMN id_moneda SET DEFAULT nextval('moneda_id_moneda_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 44666)
-- Name: id_parametros_sistema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_sistema ALTER COLUMN id_parametros_sistema SET DEFAULT nextval('parametros_sistema_id_parametros_sistema_seq'::regclass);


--
-- TOC entry 1936 (class 2604 OID 44667)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 44668)
-- Name: id_usuario_pais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_pais ALTER COLUMN id_usuario_pais SET DEFAULT nextval('usuario_pais_id_usuario_pais_seq'::regclass);


--
-- TOC entry 2071 (class 0 OID 44621)
-- Dependencies: 173
-- Data for Name: cliente_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 174
-- Name: cliente_empresa_id_cliente_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_empresa_id_cliente_empresa_seq', 1, false);


--
-- TOC entry 2082 (class 0 OID 44709)
-- Dependencies: 184
-- Data for Name: continente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (4, 'ASI', '4', 'ASIA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (1, 'AFR', '1', 'AFRICA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (2, 'AME', '2', 'AMERICA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (3, 'ANT', '3', 'ANTARTIDA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (5, 'AUS', '5', 'AUSTRALIA');
INSERT INTO continente (id_continente, abreviatura, cod_continente, nombre) VALUES (6, 'EUR', '6', 'EUROPA');


--
-- TOC entry 2085 (class 0 OID 44738)
-- Dependencies: 187
-- Data for Name: idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (16, 'ESPAÑOL', 'ESP');
INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (17, 'PORTUGUES', 'POR');
INSERT INTO idioma (id_idioma, idioma, siglas) VALUES (18, 'INGLES', 'ENG');


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 186
-- Name: idioma_id_idioma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idioma_id_idioma_seq', 18, true);


--
-- TOC entry 2073 (class 0 OID 44631)
-- Dependencies: 175
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO moneda (id_moneda, moneda) VALUES (1, 'VEF');


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 176
-- Name: moneda_id_moneda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moneda_id_moneda_seq', 1, true);


--
-- TOC entry 2081 (class 0 OID 44700)
-- Dependencies: 183
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
-- TOC entry 2075 (class 0 OID 44641)
-- Dependencies: 177
-- Data for Name: parametros_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 178
-- Name: parametros_sistema_id_parametros_sistema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('parametros_sistema_id_parametros_sistema_seq', 1, false);


--
-- TOC entry 2083 (class 0 OID 44716)
-- Dependencies: 185
-- Data for Name: regioncontinente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (1, 'AMN', 'AN', 'AMERICA DEL NORTE (NORTEAMERICA)', 2);
INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (2, 'AMC', 'AC', 'AMERICA CENTRAL (CENTROAMERICA)', 2);
INSERT INTO regioncontinente (id_region_continente, abreviatura, cod_region_continente, nombre, id_continente) VALUES (3, 'AMS', 'AS', 'AMERICA DEL SUR (SUDAMERICA)', 2);


--
-- TOC entry 2077 (class 0 OID 44646)
-- Dependencies: 179
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id_usuario, usuario, password, nombres, apellidos, id_area, id_cargo, correo, tlf, id_idioma, primera_vez, activo, fecha_registro, fecha_ultima_clave, administrador, logeado) VALUES (1, 'demo', '077115e65345fe55dd9636ceffc0d3a4', 'demo', 'demo', 1, 1, 'demo@demo.co', '123456789', 1, true, true, '2016-07-09 00:00:00-03', '2016-07-09 00:00:00-03', true, true);


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- TOC entry 2079 (class 0 OID 44657)
-- Dependencies: 181
-- Data for Name: usuario_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario_pais (id_usuario_pais, id_usuario, id_pais) VALUES (1, 1, 1);


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 182
-- Name: usuario_pais_id_usuario_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_pais_id_usuario_pais_seq', 1, true);


--
-- TOC entry 1940 (class 2606 OID 44671)
-- Name: cliente_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente_empresa
    ADD CONSTRAINT cliente_empresa_pkey PRIMARY KEY (id_cliente_empresa);


--
-- TOC entry 1952 (class 2606 OID 44715)
-- Name: continente_cod; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY continente
    ADD CONSTRAINT continente_cod UNIQUE (cod_continente);


--
-- TOC entry 1954 (class 2606 OID 44713)
-- Name: continente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY continente
    ADD CONSTRAINT continente_pkey PRIMARY KEY (id_continente);


--
-- TOC entry 1958 (class 2606 OID 44743)
-- Name: idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (id_idioma);


--
-- TOC entry 1942 (class 2606 OID 44675)
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id_moneda);


--
-- TOC entry 1950 (class 2606 OID 44704)
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- TOC entry 1944 (class 2606 OID 44679)
-- Name: parametros_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametros_sistema
    ADD CONSTRAINT parametros_sistema_pkey PRIMARY KEY (id_parametros_sistema);


--
-- TOC entry 1956 (class 2606 OID 44720)
-- Name: regioncontinente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regioncontinente
    ADD CONSTRAINT regioncontinente_pkey PRIMARY KEY (id_region_continente);


--
-- TOC entry 1948 (class 2606 OID 44681)
-- Name: usuario_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_pais
    ADD CONSTRAINT usuario_pais_pkey PRIMARY KEY (id_usuario_pais);


--
-- TOC entry 1946 (class 2606 OID 44683)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1961 (class 2606 OID 44721)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regioncontinente
    ADD CONSTRAINT "$1" FOREIGN KEY (id_continente) REFERENCES continente(id_continente);


--
-- TOC entry 1959 (class 2606 OID 44726)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT "$1" FOREIGN KEY (id_region_continente) REFERENCES regioncontinente(id_region_continente);


--
-- TOC entry 1960 (class 2606 OID 44731)
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT "$2" FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda);


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-17 22:35:49 ART

--
-- PostgreSQL database dump complete
--

