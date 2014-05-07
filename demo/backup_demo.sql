--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.12
-- Dumped by pg_dump version 9.1.12
-- Started on 2014-04-17 00:03:36 VET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 186 (class 3079 OID 11644)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 186
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 25403)
-- Dependencies: 5
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 25401)
-- Dependencies: 5 166
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 164 (class 1259 OID 25388)
-- Dependencies: 5
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 25386)
-- Dependencies: 164 5
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 162 (class 1259 OID 25378)
-- Dependencies: 5
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 25376)
-- Dependencies: 5 162
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 172 (class 1259 OID 25448)
-- Dependencies: 5
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 25418)
-- Dependencies: 5
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 25416)
-- Dependencies: 168 5
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 171 (class 1259 OID 25446)
-- Dependencies: 5 172
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 170 (class 1259 OID 25433)
-- Dependencies: 5
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 25431)
-- Dependencies: 5 170
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 179 (class 1259 OID 25499)
-- Dependencies: 1834 5
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 25497)
-- Dependencies: 179 5
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 174 (class 1259 OID 25468)
-- Dependencies: 5
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 25466)
-- Dependencies: 5 174
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 175 (class 1259 OID 25481)
-- Dependencies: 5
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 25491)
-- Dependencies: 5
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 25489)
-- Dependencies: 177 5
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 176
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- TOC entry 185 (class 1259 OID 25569)
-- Dependencies: 5
-- Name: home_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE home_userprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    foto character varying(100) NOT NULL,
    telefono character varying(30) NOT NULL,
    direccion character varying(200) NOT NULL,
    sexo character varying(1) NOT NULL,
    "sitioWeb" character varying(100) NOT NULL,
    info text NOT NULL
);


ALTER TABLE public.home_userprofile OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25567)
-- Dependencies: 5 185
-- Name: home_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE home_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 184
-- Name: home_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE home_userprofile_id_seq OWNED BY home_userprofile.id;


--
-- TOC entry 181 (class 1259 OID 25535)
-- Dependencies: 5
-- Name: ventas_cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ventas_cliente (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    apellidos character varying(200) NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.ventas_cliente OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 25533)
-- Dependencies: 181 5
-- Name: ventas_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ventas_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 180
-- Name: ventas_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ventas_cliente_id_seq OWNED BY ventas_cliente.id;


--
-- TOC entry 183 (class 1259 OID 25543)
-- Dependencies: 5
-- Name: ventas_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ventas_producto (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text NOT NULL,
    status boolean NOT NULL,
    imagen character varying(100) NOT NULL,
    precio numeric(6,2) NOT NULL,
    stock integer NOT NULL
);


ALTER TABLE public.ventas_producto OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25541)
-- Dependencies: 183 5
-- Name: ventas_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ventas_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_producto_id_seq OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 182
-- Name: ventas_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ventas_producto_id_seq OWNED BY ventas_producto.id;


--
-- TOC entry 1827 (class 2604 OID 25406)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1826 (class 2604 OID 25391)
-- Dependencies: 164 163 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1825 (class 2604 OID 25381)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1830 (class 2604 OID 25451)
-- Dependencies: 171 172 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1828 (class 2604 OID 25421)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1829 (class 2604 OID 25436)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1833 (class 2604 OID 25502)
-- Dependencies: 179 178 179
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 25471)
-- Dependencies: 173 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1832 (class 2604 OID 25494)
-- Dependencies: 176 177 177
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- TOC entry 1837 (class 2604 OID 25572)
-- Dependencies: 185 184 185
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_userprofile ALTER COLUMN id SET DEFAULT nextval('home_userprofile_id_seq'::regclass);


--
-- TOC entry 1835 (class 2604 OID 25538)
-- Dependencies: 180 181 181
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_cliente ALTER COLUMN id SET DEFAULT nextval('ventas_cliente_id_seq'::regclass);


--
-- TOC entry 1836 (class 2604 OID 25546)
-- Dependencies: 182 183 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_producto ALTER COLUMN id SET DEFAULT nextval('ventas_producto_id_seq'::regclass);


--
-- TOC entry 2009 (class 0 OID 25403)
-- Dependencies: 166 2029
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2007 (class 0 OID 25388)
-- Dependencies: 164 2029
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2005 (class 0 OID 25378)
-- Dependencies: 162 2029
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add cliente	8	add_cliente
23	Can change cliente	8	change_cliente
24	Can delete cliente	8	delete_cliente
25	Can add producto	9	add_producto
26	Can change producto	9	change_producto
27	Can delete producto	9	delete_producto
28	Can add user profile	10	add_userprofile
29	Can change user profile	10	change_userprofile
30	Can delete user profile	10	delete_userprofile
\.


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 30, true);


--
-- TOC entry 2015 (class 0 OID 25448)
-- Dependencies: 172 2029
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$10000$jHc9M59knPUW$cU+3D45DmNGOgoJ+SDuVvh6EsAO82tkNx7EUsNqqdZA=	2014-04-06 17:06:03.942217-04:30	t	dimas	dimas	jose	dimasjm97@gmail.com	t	t	2014-04-06 17:02:58-04:30
3	pbkdf2_sha256$10000$P8LqdyPUuQXY$V0dZ/5DI2F9n31RWXv0WKQ5g0n5N9ZKKtJify9QK9T0=	2014-04-06 17:41:55.768345-04:30	f	1				f	t	2014-04-06 17:41:55.768393-04:30
1	pbkdf2_sha256$10000$VQQmBW237z3y$wPoV49TyOo+CuAsGyrrAZU54i4PDY1WVWAIgIvJ3VMg=	2014-04-16 22:05:15.209997-04:30	t	david			abdsp22@gmail.com	t	t	2014-04-05 18:05:51.175253-04:30
\.


--
-- TOC entry 2011 (class 0 OID 25418)
-- Dependencies: 168 2029
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- TOC entry 2013 (class 0 OID 25433)
-- Dependencies: 170 2029
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
31	2	1
32	2	2
33	2	3
34	2	4
35	2	5
36	2	6
37	2	7
38	2	8
39	2	9
40	2	10
41	2	11
42	2	12
43	2	13
44	2	14
45	2	15
46	2	16
47	2	17
48	2	18
49	2	19
50	2	20
51	2	21
52	2	22
53	2	23
54	2	24
55	2	25
56	2	26
57	2	27
58	2	28
59	2	29
60	2	30
\.


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 60, true);


--
-- TOC entry 2022 (class 0 OID 25499)
-- Dependencies: 179 2029
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-04-05 18:26:17.070954-04:30	1	8	1	cliente object	1	
2	2014-04-05 18:26:54.588664-04:30	1	8	2	cliente object	1	
3	2014-04-05 18:27:12.811463-04:30	1	9	1	producto object	1	
4	2014-04-05 18:27:30.973951-04:30	1	9	2	producto object	1	
5	2014-04-06 03:52:11.309354-04:30	1	9	2	camisa	2	Changed status.
6	2014-04-06 03:52:16.103262-04:30	1	9	1	calentador	2	Changed status.
7	2014-04-06 03:52:50.604696-04:30	1	9	2	camisa	2	Changed status.
8	2014-04-06 04:09:15.955604-04:30	1	8	2	Pablo Martinez	2	Changed status.
9	2014-04-06 04:09:20.341703-04:30	1	8	1	David Solorzano	2	Changed status.
10	2014-04-06 04:09:30.357807-04:30	1	8	2	Pablo Martinez	2	Changed status.
11	2014-04-06 04:13:45.800302-04:30	1	8	1	David Solorzano	2	Changed status.
12	2014-04-06 17:01:53.334009-04:30	1	10	1	david	1	
13	2014-04-06 17:02:58.970089-04:30	1	3	2	dimas	1	
14	2014-04-06 17:03:49.978912-04:30	1	3	2	dimas	2	Changed password, first_name, last_name, email and user_permissions.
15	2014-04-06 17:04:27.876721-04:30	1	3	2	dimas	2	Changed password, is_staff and is_superuser.
16	2014-04-06 17:05:41.155884-04:30	1	10	2	dimas	1	
17	2014-04-06 17:41:55.832965-04:30	1	3	3	1	1	
18	2014-04-06 18:11:23.638807-04:30	1	10	1	1	1	
19	2014-04-06 18:12:32.787834-04:30	1	10	2	david	1	
20	2014-04-14 22:55:45.185503-04:30	1	9	40	Mouse	2	Changed imagen, precio and stock.
21	2014-04-14 23:03:07.145936-04:30	1	9	41	pelicula	1	
22	2014-04-14 23:28:02.494241-04:30	1	9	42	Refresco coca cola	2	Changed stock.
\.


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 178
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 22, true);


--
-- TOC entry 2017 (class 0 OID 25468)
-- Dependencies: 174 2029
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	cliente	ventas	cliente
9	producto	ventas	producto
10	user profile	home	userprofile
\.


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- TOC entry 2018 (class 0 OID 25481)
-- Dependencies: 175 2029
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
19fz84wl79l1m14490ktoory6uhlxs8d	NDdlYjIyNzQ2Mjk0YjcyZDA2MmIyODIxZTI5NmFhZmNmNDY1MmI0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-29 23:58:52.897992-04:30
esuhnjoa3nviwuc65tsfms52arcdzy4m	NDdhZjZmMmIxNjMyNjI5ZDAyNzA5ZjMxNmZkNmM0NDA5NmVkNjYzMzp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2014-04-30 00:41:18.713927-04:30
d1rrntvb309d0wai2axxgx1jx8sw0ska	NDdlYjIyNzQ2Mjk0YjcyZDA2MmIyODIxZTI5NmFhZmNmNDY1MmI0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-04-30 22:05:15.315372-04:30
\.


--
-- TOC entry 2020 (class 0 OID 25491)
-- Dependencies: 177 2029
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 176
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- TOC entry 2028 (class 0 OID 25569)
-- Dependencies: 185 2029
-- Data for Name: home_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY home_userprofile (id, user_id, foto, telefono, direccion, sexo, "sitioWeb", info) FROM stdin;
1	3	Captura de pantalla de 2014-04-06 12:23:27_1.png	04264531367	Av. Las palmas callejon san jose	M	http://www.elmundotecnologico.wordpress.com/	Informatica,activista del software libre, programar, Django, PYTHON, PHP
2	1	che_anonymous.jpg	04264531367	Av. Las palmas callejon san jose	M	http://www.elmundotecnologico.wordpress.com/	informatico
\.


--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 184
-- Name: home_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('home_userprofile_id_seq', 2, true);


--
-- TOC entry 2024 (class 0 OID 25535)
-- Dependencies: 181 2029
-- Data for Name: ventas_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas_cliente (id, nombre, apellidos, status) FROM stdin;
2	Pablo	Martinez	t
1	David	Solorzano	t
\.


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 180
-- Name: ventas_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ventas_cliente_id_seq', 2, true);


--
-- TOC entry 2026 (class 0 OID 25543)
-- Dependencies: 183 2029
-- Data for Name: ventas_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas_producto (id, nombre, descripcion, status, imagen, precio, stock) FROM stdin;
\.


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 182
-- Name: ventas_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ventas_producto_id_seq', 66, true);


--
-- TOC entry 1850 (class 2606 OID 25410)
-- Dependencies: 166 166 2030
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1845 (class 2606 OID 25395)
-- Dependencies: 164 164 164 2030
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1848 (class 2606 OID 25393)
-- Dependencies: 164 164 2030
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1853 (class 2606 OID 25408)
-- Dependencies: 166 166 2030
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1840 (class 2606 OID 25385)
-- Dependencies: 162 162 162 2030
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1842 (class 2606 OID 25383)
-- Dependencies: 162 162 2030
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1856 (class 2606 OID 25423)
-- Dependencies: 168 168 2030
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1859 (class 2606 OID 25425)
-- Dependencies: 168 168 168 2030
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1867 (class 2606 OID 25453)
-- Dependencies: 172 172 2030
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1862 (class 2606 OID 25438)
-- Dependencies: 170 170 2030
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1865 (class 2606 OID 25440)
-- Dependencies: 170 170 170 2030
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1869 (class 2606 OID 25455)
-- Dependencies: 172 172 2030
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1883 (class 2606 OID 25508)
-- Dependencies: 179 179 2030
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1872 (class 2606 OID 25475)
-- Dependencies: 174 174 174 2030
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- TOC entry 1874 (class 2606 OID 25473)
-- Dependencies: 174 174 2030
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1877 (class 2606 OID 25488)
-- Dependencies: 175 175 2030
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1880 (class 2606 OID 25496)
-- Dependencies: 177 177 2030
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 1890 (class 2606 OID 25577)
-- Dependencies: 185 185 2030
-- Name: home_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY home_userprofile
    ADD CONSTRAINT home_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 1892 (class 2606 OID 25579)
-- Dependencies: 185 185 2030
-- Name: home_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY home_userprofile
    ADD CONSTRAINT home_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 1886 (class 2606 OID 25540)
-- Dependencies: 181 181 2030
-- Name: ventas_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ventas_cliente
    ADD CONSTRAINT ventas_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 1888 (class 2606 OID 25551)
-- Dependencies: 183 183 2030
-- Name: ventas_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ventas_producto
    ADD CONSTRAINT ventas_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 1851 (class 1259 OID 25523)
-- Dependencies: 166 2030
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1843 (class 1259 OID 25521)
-- Dependencies: 164 2030
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1846 (class 1259 OID 25522)
-- Dependencies: 164 2030
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1838 (class 1259 OID 25520)
-- Dependencies: 162 2030
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1854 (class 1259 OID 25525)
-- Dependencies: 168 2030
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1857 (class 1259 OID 25524)
-- Dependencies: 168 2030
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1860 (class 1259 OID 25527)
-- Dependencies: 170 2030
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1863 (class 1259 OID 25526)
-- Dependencies: 170 2030
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1870 (class 1259 OID 25528)
-- Dependencies: 172 2030
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1881 (class 1259 OID 25532)
-- Dependencies: 179 2030
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1884 (class 1259 OID 25531)
-- Dependencies: 179 2030
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- TOC entry 1875 (class 1259 OID 25530)
-- Dependencies: 175 2030
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- TOC entry 1878 (class 1259 OID 25529)
-- Dependencies: 175 2030
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 1894 (class 2606 OID 25396)
-- Dependencies: 162 1841 164 2030
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1896 (class 2606 OID 25426)
-- Dependencies: 1852 166 168 2030
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1898 (class 2606 OID 25441)
-- Dependencies: 1841 162 170 2030
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1893 (class 2606 OID 25476)
-- Dependencies: 174 162 1873 2030
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1901 (class 2606 OID 25514)
-- Dependencies: 179 174 1873 2030
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1900 (class 2606 OID 25509)
-- Dependencies: 1866 179 172 2030
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1895 (class 2606 OID 25411)
-- Dependencies: 164 1852 166 2030
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1902 (class 2606 OID 25580)
-- Dependencies: 172 1866 185 2030
-- Name: home_userprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_userprofile
    ADD CONSTRAINT home_userprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1897 (class 2606 OID 25456)
-- Dependencies: 168 172 1866 2030
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1899 (class 2606 OID 25461)
-- Dependencies: 1866 172 170 2030
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-04-17 00:03:36 VET

--
-- PostgreSQL database dump complete
--

