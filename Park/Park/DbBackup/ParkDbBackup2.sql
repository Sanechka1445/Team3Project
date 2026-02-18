--
-- PostgreSQL database dump
--

\restrict VUlXrh0rxcUgeAbguv0qkho4A1niOMnWXPq81mhgchKZt7a8zojlffnNoMxKnGc

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-16 14:52:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16465)
-- Name: Attraction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Attraction" (
    "IdAtraction" integer NOT NULL,
    "Category" integer NOT NULL,
    "Status" integer,
    "Cost" numeric,
    "Descriotion" character varying,
    "NameAtraction" character varying(100) NOT NULL
);


ALTER TABLE public."Attraction" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16473)
-- Name: Attraction_IdAtraction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Attraction_IdAtraction_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attraction_IdAtraction_seq" OWNER TO postgres;

--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 220
-- Name: Attraction_IdAtraction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Attraction_IdAtraction_seq" OWNED BY public."Attraction"."IdAtraction";


--
-- TOC entry 221 (class 1259 OID 16474)
-- Name: CaregoryAttraction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CaregoryAttraction" (
    "IdCategory" integer NOT NULL,
    "CategoryName" character varying NOT NULL
);


ALTER TABLE public."CaregoryAttraction" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16481)
-- Name: CaregoryAttraction_IdCategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CaregoryAttraction_IdCategory_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CaregoryAttraction_IdCategory_seq" OWNER TO postgres;

--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 222
-- Name: CaregoryAttraction_IdCategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CaregoryAttraction_IdCategory_seq" OWNED BY public."CaregoryAttraction"."IdCategory";


--
-- TOC entry 233 (class 1259 OID 16600)
-- Name: EquipmentAttraction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EquipmentAttraction" (
    "Attraction" integer NOT NULL,
    "Element" character varying
);


ALTER TABLE public."EquipmentAttraction" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16482)
-- Name: Gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gender" (
    "IdGender" integer NOT NULL,
    "GenderName" character varying NOT NULL
);


ALTER TABLE public."Gender" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16489)
-- Name: Gender_IdGender_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Gender_IdGender_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Gender_IdGender_seq" OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 224
-- Name: Gender_IdGender_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Gender_IdGender_seq" OWNED BY public."Gender"."IdGender";


--
-- TOC entry 225 (class 1259 OID 16490)
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "IdRole" integer NOT NULL,
    "RoleName" character varying NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16497)
-- Name: Role_IdRole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_IdRole_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Role_IdRole_seq" OWNER TO postgres;

--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 226
-- Name: Role_IdRole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_IdRole_seq" OWNED BY public."Role"."IdRole";


--
-- TOC entry 227 (class 1259 OID 16498)
-- Name: StatusAttraction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StatusAttraction" (
    "IdStatus" integer NOT NULL,
    "Statusname" character varying NOT NULL
);


ALTER TABLE public."StatusAttraction" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16505)
-- Name: StatusRoom_IdStatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StatusRoom_IdStatus_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StatusRoom_IdStatus_seq" OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 228
-- Name: StatusRoom_IdStatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StatusRoom_IdStatus_seq" OWNED BY public."StatusAttraction"."IdStatus";


--
-- TOC entry 229 (class 1259 OID 16506)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "IdUser" integer NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100) NOT NULL,
    "Patronymic" character varying(100),
    "Login" character varying(50) NOT NULL,
    "Password" character varying(50) NOT NULL,
    "Gender" integer NOT NULL,
    "PhoneNumber" character varying(11),
    "Block" boolean DEFAULT false NOT NULL,
    "FirstAuth" boolean DEFAULT false NOT NULL,
    "Role" integer NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16520)
-- Name: User_IdUser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_IdUser_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_IdUser_seq" OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 230
-- Name: User_IdUser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_IdUser_seq" OWNED BY public."User"."IdUser";


--
-- TOC entry 232 (class 1259 OID 16589)
-- Name: Visit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Visit" (
    "Id" integer NOT NULL,
    "Attraction" integer NOT NULL,
    "DateStart" date,
    "DateEnd" date,
    "Sum" numeric,
    "IsCost" numeric,
    "Client" integer NOT NULL
);


ALTER TABLE public."Visit" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16588)
-- Name: Visit_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Visit_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Visit_Id_seq" OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 231
-- Name: Visit_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Visit_Id_seq" OWNED BY public."Visit"."Id";


--
-- TOC entry 4890 (class 2604 OID 16521)
-- Name: Attraction IdAtraction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attraction" ALTER COLUMN "IdAtraction" SET DEFAULT nextval('public."Attraction_IdAtraction_seq"'::regclass);


--
-- TOC entry 4891 (class 2604 OID 16522)
-- Name: CaregoryAttraction IdCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaregoryAttraction" ALTER COLUMN "IdCategory" SET DEFAULT nextval('public."CaregoryAttraction_IdCategory_seq"'::regclass);


--
-- TOC entry 4892 (class 2604 OID 16523)
-- Name: Gender IdGender; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender" ALTER COLUMN "IdGender" SET DEFAULT nextval('public."Gender_IdGender_seq"'::regclass);


--
-- TOC entry 4893 (class 2604 OID 16524)
-- Name: Role IdRole; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role" ALTER COLUMN "IdRole" SET DEFAULT nextval('public."Role_IdRole_seq"'::regclass);


--
-- TOC entry 4894 (class 2604 OID 16525)
-- Name: StatusAttraction IdStatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatusAttraction" ALTER COLUMN "IdStatus" SET DEFAULT nextval('public."StatusRoom_IdStatus_seq"'::regclass);


--
-- TOC entry 4895 (class 2604 OID 16526)
-- Name: User IdUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN "IdUser" SET DEFAULT nextval('public."User_IdUser_seq"'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16592)
-- Name: Visit Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visit" ALTER COLUMN "Id" SET DEFAULT nextval('public."Visit_Id_seq"'::regclass);


--
-- TOC entry 5060 (class 0 OID 16465)
-- Dependencies: 219
-- Data for Name: Attraction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5062 (class 0 OID 16474)
-- Dependencies: 221
-- Data for Name: CaregoryAttraction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5074 (class 0 OID 16600)
-- Dependencies: 233
-- Data for Name: EquipmentAttraction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5064 (class 0 OID 16482)
-- Dependencies: 223
-- Data for Name: Gender; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5066 (class 0 OID 16490)
-- Dependencies: 225
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5068 (class 0 OID 16498)
-- Dependencies: 227
-- Data for Name: StatusAttraction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5070 (class 0 OID 16506)
-- Dependencies: 229
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5073 (class 0 OID 16589)
-- Dependencies: 232
-- Data for Name: Visit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 220
-- Name: Attraction_IdAtraction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Attraction_IdAtraction_seq"', 1, false);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 222
-- Name: CaregoryAttraction_IdCategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CaregoryAttraction_IdCategory_seq"', 1, false);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 224
-- Name: Gender_IdGender_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gender_IdGender_seq"', 1, false);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 226
-- Name: Role_IdRole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_IdRole_seq"', 1, false);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 228
-- Name: StatusRoom_IdStatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StatusRoom_IdStatus_seq"', 1, false);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 230
-- Name: User_IdUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_IdUser_seq"', 1, false);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 231
-- Name: Visit_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Visit_Id_seq"', 1, false);


--
-- TOC entry 4900 (class 2606 OID 16528)
-- Name: Attraction Attraction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attraction"
    ADD CONSTRAINT "Attraction_pkey" PRIMARY KEY ("IdAtraction");


--
-- TOC entry 4902 (class 2606 OID 16530)
-- Name: CaregoryAttraction CaregoryAttraction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CaregoryAttraction"
    ADD CONSTRAINT "CaregoryAttraction_pkey" PRIMARY KEY ("IdCategory");


--
-- TOC entry 4904 (class 2606 OID 16532)
-- Name: Gender Gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender"
    ADD CONSTRAINT "Gender_pkey" PRIMARY KEY ("IdGender");


--
-- TOC entry 4906 (class 2606 OID 16534)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("IdRole");


--
-- TOC entry 4908 (class 2606 OID 16536)
-- Name: StatusAttraction StatusRoom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatusAttraction"
    ADD CONSTRAINT "StatusRoom_pkey" PRIMARY KEY ("IdStatus");


--
-- TOC entry 4910 (class 2606 OID 16538)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("IdUser");


--
-- TOC entry 4912 (class 2606 OID 16599)
-- Name: Visit Visit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visit"
    ADD CONSTRAINT "Visit_pkey" PRIMARY KEY ("Id");


-- Completed on 2026-02-16 14:52:38

--
-- PostgreSQL database dump complete
--

\unrestrict VUlXrh0rxcUgeAbguv0qkho4A1niOMnWXPq81mhgchKZt7a8zojlffnNoMxKnGc

