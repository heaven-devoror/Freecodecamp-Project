--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_types text,
    galaxy_age_in_billions numeric(4,2),
    is_stable boolean
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
    name character varying(50),
    planet_id integer NOT NULL,
    surrounding_moons integer,
    zero_one integer
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
    name character varying(50),
    has_life boolean,
    is_spherical boolean,
    surrounding_moons integer,
    star_id integer NOT NULL
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(4,1),
    true_false boolean
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
-- Name: watcher; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.watcher (
    watcher_id integer NOT NULL,
    name character varying(30) NOT NULL,
    on_duty character varying(3)
);


ALTER TABLE public.watcher OWNER TO freecodecamp;

--
-- Name: watcher_watcher_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.watcher_watcher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watcher_watcher_id_seq OWNER TO freecodecamp;

--
-- Name: watcher_watcher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.watcher_watcher_id_seq OWNED BY public.watcher.watcher_id;


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
-- Name: watcher watcher_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.watcher ALTER COLUMN watcher_id SET DEFAULT nextval('public.watcher_watcher_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Interacting', 13.60, true);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf galaxy', 'Interacting', 13.80, true);
INSERT INTO public.galaxy VALUES (5, 'Mice Galaxy', 'Interacting', 8.23, true);
INSERT INTO public.galaxy VALUES (3, 'M82', 'Starbust', 13.30, false);
INSERT INTO public.galaxy VALUES (4, 'Antennae', 'Starbust', 20.20, false);
INSERT INTO public.galaxy VALUES (6, 'OMEGA', NULL, NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moo1', 1, 0, 0);
INSERT INTO public.moon VALUES (2, 'moo2', 2, 0, 1);
INSERT INTO public.moon VALUES (3, 'moo3', 3, 23, 0);
INSERT INTO public.moon VALUES (4, 'moo4', 4, 424, 0);
INSERT INTO public.moon VALUES (5, 'moo5', 5, 12, 1);
INSERT INTO public.moon VALUES (6, 'moo6', 6, 123, 1);
INSERT INTO public.moon VALUES (7, 'moo7', 7, 42, 0);
INSERT INTO public.moon VALUES (8, 'moo8', 8, 1, 0);
INSERT INTO public.moon VALUES (9, 'moo9', 9, 31, 0);
INSERT INTO public.moon VALUES (10, 'moo10', 10, 352, 0);
INSERT INTO public.moon VALUES (11, 'moo11', 11, 352, 0);
INSERT INTO public.moon VALUES (12, 'moo12', 12, 51, 1);
INSERT INTO public.moon VALUES (13, 'moo13', 5, 124, 0);
INSERT INTO public.moon VALUES (14, 'moo14', 3, 124, 0);
INSERT INTO public.moon VALUES (15, 'moo15', 12, 34, 1);
INSERT INTO public.moon VALUES (16, 'moo16', 1, 1, 1);
INSERT INTO public.moon VALUES (17, 'moo17', 8, 12, 0);
INSERT INTO public.moon VALUES (18, 'moo18', 10, 126, 0);
INSERT INTO public.moon VALUES (19, 'moo19', 2, 52, 1);
INSERT INTO public.moon VALUES (20, 'mooo20', 12, 37, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 3, 2);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1, 11);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 2, 12);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 80, 13);
INSERT INTO public.planet VALUES (6, 'Saturn', false, false, 83, 14);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 5, 2);
INSERT INTO public.planet VALUES (9, 'Ceres', true, true, 0, 11);
INSERT INTO public.planet VALUES (10, 'pluto', false, true, 5, 11);
INSERT INTO public.planet VALUES (11, 'MakeMake', false, true, 1, 2);
INSERT INTO public.planet VALUES (12, 'Haumea', false, true, 2, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 148.0, true);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 3, 4.2, true);
INSERT INTO public.star VALUES (13, 'Luyten', 5, 8.2, true);
INSERT INTO public.star VALUES (2, 'Alpha Century A', 2, 4.3, false);
INSERT INTO public.star VALUES (12, 'Sirius', 4, 6.2, false);
INSERT INTO public.star VALUES (14, 'WORG', 6, 2.3, false);


--
-- Data for Name: watcher; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.watcher VALUES (1, 'Jack', 'Yes');
INSERT INTO public.watcher VALUES (3, 'Justin', 'Yes');
INSERT INTO public.watcher VALUES (2, 'John', 'No');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: watcher_watcher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.watcher_watcher_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_name_key UNIQUE (galaxy_id, name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: watcher watcher_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.watcher
    ADD CONSTRAINT watcher_pkey PRIMARY KEY (watcher_id);


--
-- Name: watcher watcher_watcher_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.watcher
    ADD CONSTRAINT watcher_watcher_id_key UNIQUE (watcher_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

