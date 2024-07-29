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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars integer NOT NULL,
    dwarf_galaxy boolean,
    size integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric(12,6),
    planet_id integer,
    surface_gravity numeric(9,6)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    mass numeric(12,9),
    dwarf_planet boolean,
    star_id integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric(12,3),
    galaxy_id integer,
    temperature integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250, false, 87400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, false, 152000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 20, true, 32200);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 3, true, 18900);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 40, false, 61100);
INSERT INTO public.galaxy VALUES (6, 'NGC 3109', 1, true, 25400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.012300, 3, 0.165400);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.000000, 4, 0.000000);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000000, 4, 0.000000);
INSERT INTO public.moon VALUES (4, 'Io', 0.015000, 5, 0.183192);
INSERT INTO public.moon VALUES (5, 'Europa', 0.008000, 5, 0.134000);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.025000, 5, 0.146000);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.018000, 5, 0.126000);
INSERT INTO public.moon VALUES (8, 'Titan', 0.022500, 6, 0.138000);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.000390, 6, 0.000000);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0.000000, 6, 0.022800);
INSERT INTO public.moon VALUES (11, 'Dione', 0.000000, 6, 0.000000);
INSERT INTO public.moon VALUES (12, 'Tethys', 0.000103, 6, 0.000000);
INSERT INTO public.moon VALUES (13, 'Enceladus', 0.000000, 6, 0.000000);
INSERT INTO public.moon VALUES (14, 'Mimas', 0.000000, 6, 0.000000);
INSERT INTO public.moon VALUES (15, 'Oberon', 0.000000, 7, 0.000000);
INSERT INTO public.moon VALUES (16, 'Titania', 0.000000, 7, 0.000000);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0.000000, 7, 0.000000);
INSERT INTO public.moon VALUES (18, 'Ariel', 0.000000, 7, 0.000000);
INSERT INTO public.moon VALUES (19, 'Miranda', 0.000000, 7, 0.000000);
INSERT INTO public.moon VALUES (20, 'Triton', 0.003590, 8, 0.079400);
INSERT INTO public.moon VALUES (21, 'Proteus', 0.000000, 8, 0.000000);
INSERT INTO public.moon VALUES (22, 'Charon', 0.000266, 11, 0.000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Merucy is the first planet from the Sun and the smallest in the Solar System.', 0.055000000, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the second planet from the Sun.', 0.815000000, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 1.000000000, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun.', 0.107000000, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.', 317.800000000, false, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System.', 95.159000000, false, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun.', 14.536000000, false, 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth and farthest known planet from the Sun.', 17.147000000, false, 1, 3);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Pluto is a dwarf planet in the Kuiper belt.', 0.002180000, true, 1, 5);
INSERT INTO public.planet VALUES (10, 'Orcus', 'Orcus is a dwarf planet located in the Kuiper belt.', 0.000000000, true, 1, 5);
INSERT INTO public.planet VALUES (18, 'Proxima b', 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri.', 1.070000000, false, 4, 1);
INSERT INTO public.planet VALUES (19, 'Proxima d', 'Proxima Centauri d is an exoplanet orbiting the red dwarf star Proxima Centauri.', 0.260000000, false, 4, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Haumea is a dwarf planet located beyond Neptune''s orbit.', 0.000660000, true, 1, 5);
INSERT INTO public.planet VALUES (13, 'Quaoar', 'Quaoar is a large, ringed dwarf planet in the Kuiper belt.', 0.000000000, true, 1, 5);
INSERT INTO public.planet VALUES (14, 'Makemake', 'Makemake is a dwarf planet and the second-largest of the Kuiper belt objects.', 0.000000000, true, 1, 5);
INSERT INTO public.planet VALUES (15, 'Gonggong', 'Gonggong is a dwarf planet and a member of the scattered disc beyond Neptune.', 0.000000000, true, 1, 5);
INSERT INTO public.planet VALUES (16, 'Eris', 'Eris is the most massive and second-largest known dwarf planet in the Solar System.', 0.002700000, true, 1, 5);
INSERT INTO public.planet VALUES (17, 'Sedna', 'Sedna is a dwarf planet in the outermost reaches of the Solar System.', 0.000000000, true, 1, 5);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Ceres is a dwarf planet between the orbits of Mars and Jupiter.', 0.000160000, true, 1, 5);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'A solid planet composed mostly of rock and stone.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'A squishy planet made of light gases.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'A tumultuous ball of heavy, volatile gases.');
INSERT INTO public.planet_type VALUES (4, 'Asteroid', 'A teensy-weensy rock floating in space.');
INSERT INTO public.planet_type VALUES (5, 'Dwarf', 'The miniature cousin of the terrestrial planets.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 332950.000, 1, 5772);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 359186.460, 1, 5891);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 302718.140, 1, 5151);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 40653.195, 1, 2992);
INSERT INTO public.star VALUES (5, 'Altair', 619287.000, 1, 6860);
INSERT INTO public.star VALUES (6, 'Sirius', 686875.850, 1, 9940);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 19, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star start_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

