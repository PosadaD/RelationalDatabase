--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: distancia_enum; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.distancia_enum AS ENUM (
    'cerca',
    'intermedio',
    'lejos'
);


ALTER TYPE public.distancia_enum OWNER TO freecodecamp;

--
-- Name: tipo_cuerpo_enum; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.tipo_cuerpo_enum AS ENUM (
    'estrella',
    'planeta',
    'galaxia',
    'luna'
);


ALTER TYPE public.tipo_cuerpo_enum OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: distanci_tierra; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distanci_tierra (
    distanci_tierra_id integer NOT NULL,
    distancia public.distancia_enum NOT NULL,
    tipo_cuerpo public.tipo_cuerpo_enum NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(100)
);


ALTER TABLE public.distanci_tierra OWNER TO freecodecamp;

--
-- Name: distanci_tierra_distancia_tierra_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distanci_tierra_distancia_tierra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distanci_tierra_distancia_tierra_id_seq OWNER TO freecodecamp;

--
-- Name: distanci_tierra_distancia_tierra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distanci_tierra_distancia_tierra_id_seq OWNED BY public.distanci_tierra.distanci_tierra_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composition text,
    tamano numeric,
    numero_estrellas bigint,
    coordenadas text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composition text,
    tamano integer NOT NULL,
    luz_propia boolean,
    peso numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    conposition text NOT NULL,
    tamano integer,
    luz_propia boolean NOT NULL,
    peso numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composicion text NOT NULL,
    tamano integer,
    luz_propia boolean,
    peso numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: distanci_tierra distanci_tierra_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra ALTER COLUMN distanci_tierra_id SET DEFAULT nextval('public.distanci_tierra_distancia_tierra_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: distanci_tierra; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distanci_tierra VALUES (1, 'cerca', 'estrella', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (2, 'intermedio', 'planeta', NULL, NULL, 2, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (3, 'lejos', 'galaxia', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (4, 'cerca', 'luna', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.distanci_tierra VALUES (5, 'intermedio', 'estrella', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (6, 'lejos', 'planeta', NULL, NULL, 6, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (7, 'cerca', 'estrella', NULL, 7, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (8, 'intermedio', 'luna', NULL, NULL, NULL, 8, NULL);
INSERT INTO public.distanci_tierra VALUES (9, 'lejos', 'galaxia', 9, NULL, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (10, 'cerca', 'estrella', NULL, 10, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (11, 'intermedio', 'planeta', NULL, NULL, 11, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (12, 'lejos', 'luna', NULL, NULL, NULL, 12, NULL);
INSERT INTO public.distanci_tierra VALUES (13, 'cerca', 'galaxia', 13, NULL, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (14, 'intermedio', 'estrella', NULL, 14, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (15, 'lejos', 'planeta', NULL, NULL, 15, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (16, 'cerca', 'luna', NULL, NULL, NULL, 16, NULL);
INSERT INTO public.distanci_tierra VALUES (17, 'intermedio', 'galaxia', 17, NULL, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (18, 'lejos', 'estrella', NULL, 18, NULL, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (19, 'cerca', 'planeta', NULL, NULL, 19, NULL, NULL);
INSERT INTO public.distanci_tierra VALUES (20, 'intermedio', 'luna', NULL, NULL, NULL, 20, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andrómeda', 'Gas y polvo', 220000, 1000000, '(23, 45, 67)');
INSERT INTO public.galaxy VALUES (2, 'Vía Láctea', 'Estrella', 150000, 400000, '(10, 20, 30)');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Estrella', 100000, 500000, '(5, 50, 100)');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Gas y polvo', 120000, 750000, '(22, 35, 45)');
INSERT INTO public.galaxy VALUES (5, 'Leo', 'Estrella', 180000, 300000, '(8, 60, 25)');
INSERT INTO public.galaxy VALUES (6, 'Cáncer', 'Gas y polvo', 190000, 700000, '(15, 50, 30)');
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 'Gas y polvo', 220000, 900000, '(12, 40, 90)');
INSERT INTO public.galaxy VALUES (8, 'NGC 4594', 'Estrella', 250000, 1200000, '(17, 50, 110)');
INSERT INTO public.galaxy VALUES (9, 'Virgo', 'Estrella', 200000, 450000, '(30, 40, 50)');
INSERT INTO public.galaxy VALUES (10, 'Coma Berenices', 'Gas y polvo', 210000, 650000, '(25, 70, 120)');
INSERT INTO public.galaxy VALUES (11, 'Osa Mayor', 'Estrella', 180000, 800000, '(7, 35, 85)');
INSERT INTO public.galaxy VALUES (12, 'NGC 6744', 'Gas y polvo', 230000, 1100000, '(13, 60, 65)');
INSERT INTO public.galaxy VALUES (13, 'Pegasus', 'Estrella', 140000, 600000, '(14, 30, 40)');
INSERT INTO public.galaxy VALUES (14, 'NGC 1309', 'Gas y polvo', 240000, 800000, '(18, 75, 35)');
INSERT INTO public.galaxy VALUES (15, 'NGC 2022', 'Estrella', 170000, 1000000, '(19, 85, 25)');
INSERT INTO public.galaxy VALUES (16, 'NGC 3370', 'Gas y polvo', 220000, 900000, '(27, 80, 60)');
INSERT INTO public.galaxy VALUES (17, 'NGC 2950', 'Estrella', 160000, 500000, '(20, 65, 90)');
INSERT INTO public.galaxy VALUES (18, 'NGC 5128', 'Gas y polvo', 200000, 700000, '(21, 50, 80)');
INSERT INTO public.galaxy VALUES (19, 'NGC 4631', 'Gas y polvo', 190000, 1100000, '(26, 45, 30)');
INSERT INTO public.galaxy VALUES (20, 'Osa Menor', 'Estrella', 110000, 350000, '(28, 55, 75)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Rocoso', 3474, false, 73500000000000000000000, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 'Rocoso', 22, false, 10800000000000000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocoso', 12, false, 6800000000000000, 2);
INSERT INTO public.moon VALUES (4, 'Titán', 'Gaseoso', 5150, true, 135000000000000000000000, 4);
INSERT INTO public.moon VALUES (5, 'Rhea', 'Rocoso', 1527, false, 23100000000000000000000, 5);
INSERT INTO public.moon VALUES (6, 'Mimas', 'Rocoso', 396, false, 37500000000000000000, 6);
INSERT INTO public.moon VALUES (7, 'Encélado', 'Rocoso', 504, true, 108000000000000000000, 7);
INSERT INTO public.moon VALUES (8, 'Oberón', 'Rocoso', 1523, false, 35200000000000000000000, 8);
INSERT INTO public.moon VALUES (9, 'Miranda', 'Rocoso', 471, false, 630000000000000000000, 9);
INSERT INTO public.moon VALUES (10, 'Calisto', 'Rocoso', 4821, true, 108000000000000000000000, 10);
INSERT INTO public.moon VALUES (11, 'Europa', 'Rocoso', 3121, true, 48000000000000000000000, 10);
INSERT INTO public.moon VALUES (12, 'Ganymedes', 'Rocoso', 5268, true, 148000000000000000000000, 10);
INSERT INTO public.moon VALUES (13, 'Tritón', 'Gaseoso', 2710, true, 21400000000000000000000, 11);
INSERT INTO public.moon VALUES (14, 'Io', 'Rocoso', 3643, true, 89300000000000000000000, 12);
INSERT INTO public.moon VALUES (15, 'Haumea', 'Rocoso', 816, false, 40000000000000000000000, 13);
INSERT INTO public.moon VALUES (16, 'Makemake', 'Rocoso', 1430, false, 50000000000000000000000, 14);
INSERT INTO public.moon VALUES (17, 'Eris', 'Rocoso', 1163, false, 16000000000000000000000, 15);
INSERT INTO public.moon VALUES (18, 'Charon', 'Rocoso', 1212, true, 15200000000000000000000, 16);
INSERT INTO public.moon VALUES (19, 'Dysnomia', 'Rocoso', 150, false, 57000000000000000000, 17);
INSERT INTO public.moon VALUES (20, 'Nix', 'Rocoso', 45, false, 4000000000000000000, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 'Rocoso', 12742, false, 5970000000000000000000000, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 'Rocoso', 6779, false, 642000000000000000000000, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'Rocoso', 12104, false, 4870000000000000000000000, 3);
INSERT INTO public.planet VALUES (4, 'Júpiter', 'Gaseoso', 139820, true, 1900000000000000000000000000, 4);
INSERT INTO public.planet VALUES (5, 'Saturno', 'Gaseoso', 116460, true, 568000000000000000000000000, 5);
INSERT INTO public.planet VALUES (6, 'Urano', 'Gaseoso', 50724, true, 86800000000000000000000000, 6);
INSERT INTO public.planet VALUES (7, 'Neptuno', 'Gaseoso', 49244, true, 102000000000000000000000000, 7);
INSERT INTO public.planet VALUES (8, 'Mercurio', 'Rocoso', 4880, false, 330000000000000000000000, 8);
INSERT INTO public.planet VALUES (9, 'Plutón', 'Rocoso', 2377, false, 13100000000000000000000, 9);
INSERT INTO public.planet VALUES (10, 'Kepler-62f', 'Rocoso', 7500, false, 5900000000000000000000000, 10);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Rocoso', 6400, false, 4700000000000000000000000, 11);
INSERT INTO public.planet VALUES (12, 'Proxima b', 'Rocoso', 7000, false, 5300000000000000000000000, 12);
INSERT INTO public.planet VALUES (13, 'GJ 667Cc', 'Rocoso', 12100, false, 5400000000000000000000000, 13);
INSERT INTO public.planet VALUES (14, 'Kepler-452b', 'Rocoso', 8400, false, 6200000000000000000000000, 14);
INSERT INTO public.planet VALUES (15, 'LHS 1140 b', 'Rocoso', 7000, false, 4500000000000000000000000, 15);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1d', 'Rocoso', 13000, false, 7000000000000000000000000, 16);
INSERT INTO public.planet VALUES (17, 'GJ 1132b', 'Rocoso', 7800, false, 5200000000000000000000000, 17);
INSERT INTO public.planet VALUES (18, 'K2-18b', 'Rocoso', 11800, false, 6300000000000000000000000, 18);
INSERT INTO public.planet VALUES (19, 'Kepler-22b', 'Rocoso', 8000, false, 5600000000000000000000000, 19);
INSERT INTO public.planet VALUES (20, 'Kepler-62e', 'Rocoso', 8500, false, 5800000000000000000000000, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Hidrógeno', 1390000, true, 1990000000000000000000000000000, 2);
INSERT INTO public.star VALUES (2, 'Alfa Centauri', 'Hidrógeno', 1200000, true, 2100000000000000000000000000000, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Helio', 1000000, false, 1800000000000000000000000000000, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Hidrógeno', 800000, false, 440000000000000000000000000000, 2);
INSERT INTO public.star VALUES (5, 'Sirio', 'Hidrógeno', 2000000, true, 2500000000000000000000000000000, 5);
INSERT INTO public.star VALUES (6, 'Antares', 'Helio', 1500000, false, 1100000000000000000000000000000, 3);
INSERT INTO public.star VALUES (7, 'Rigel', 'Hidrógeno', 1200000, true, 2000000000000000000000000000000, 4);
INSERT INTO public.star VALUES (8, 'Aldebarán', 'Hidrógeno', 1100000, false, 1500000000000000000000000000000, 6);
INSERT INTO public.star VALUES (9, 'Arctrus', 'Helio', 1300000, true, 2200000000000000000000000000000, 7);
INSERT INTO public.star VALUES (10, 'Vega', 'Hidrógeno', 1100000, true, 2000000000000000000000000000000, 8);
INSERT INTO public.star VALUES (11, 'Spica', 'Hidrógeno', 1500000, false, 1900000000000000000000000000000, 9);
INSERT INTO public.star VALUES (12, 'Altair', 'Hidrógeno', 1400000, true, 2100000000000000000000000000000, 10);
INSERT INTO public.star VALUES (13, 'Deneb', 'Helio', 2000000, false, 2000000000000000000000000000000, 11);
INSERT INTO public.star VALUES (14, 'Canopus', 'Hidrógeno', 1600000, false, 1800000000000000000000000000000, 12);
INSERT INTO public.star VALUES (15, 'Bellatrix', 'Hidrógeno', 1200000, true, 1500000000000000000000000000000, 13);
INSERT INTO public.star VALUES (16, 'Capella', 'Hidrógeno', 1500000, true, 2000000000000000000000000000000, 14);
INSERT INTO public.star VALUES (17, 'Aldebrán', 'Hidrógeno', 1300000, false, 1600000000000000000000000000000, 15);
INSERT INTO public.star VALUES (18, 'Regulus', 'Hidrógeno', 1600000, true, 1700000000000000000000000000000, 16);
INSERT INTO public.star VALUES (19, 'Pollux', 'Hidrógeno', 1400000, true, 1800000000000000000000000000000, 17);
INSERT INTO public.star VALUES (20, 'Arcturus', 'Hidrógeno', 1500000, true, 1900000000000000000000000000000, 18);


--
-- Name: distanci_tierra_distancia_tierra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distanci_tierra_distancia_tierra_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: distanci_tierra distanci_tierra_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_name_key UNIQUE (name);


--
-- Name: distanci_tierra distanci_tierra_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_pkey PRIMARY KEY (distanci_tierra_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: distanci_tierra distanci_tierra_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: distanci_tierra distanci_tierra_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: distanci_tierra distanci_tierra_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: distanci_tierra distanci_tierra_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distanci_tierra
    ADD CONSTRAINT distanci_tierra_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--
