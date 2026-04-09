--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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


CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_stars integer NOT NULL,
    area_sq_degrees numeric,
    is_zodiac boolean DEFAULT false NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;


CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions integer NOT NULL,
    distance_from_earth numeric,
    description text,
    has_black_hole boolean DEFAULT false NOT NULL,
    is_observable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;


CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    orbital_radius_km numeric,
    is_tidally_locked boolean DEFAULT false NOT NULL,
    surface_description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;
CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_days integer,
    mass numeric,
    has_atmosphere boolean DEFAULT false NOT NULL,
    has_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions integer NOT NULL,
    luminosity numeric,
    spectral_type text,
    is_main_sequence boolean DEFAULT true NOT NULL,
    has_planets boolean DEFAULT false NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);
INSERT INTO public.constellation VALUES (1, 'Orion', 1, 7, 594.1, false, 'One of the most recognizable constellations');
INSERT INTO public.constellation VALUES (2, 'Leo', 1, 9, 946.9, true, 'Zodiac constellation resembling a lion');
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 1, 7, 1279.7, false, 'Contains the famous Big Dipper asterism');
INSERT INTO public.constellation VALUES (4, 'Scorpius', 1, 18, 496.8, true, 'Zodiac constellation shaped like a scorpion');
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 1, 5, 598.4, false, 'W-shaped constellation near the north pole');

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 'Our home galaxy, a barred spiral.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 'Nearest large galaxy to the Milky Way.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 2730000, 'Third-largest in the Local Group.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 13200, 163000, 'Irregular satellite of the Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 6500, 200000, 'Smaller satellite companion galaxy.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 400, 23160000, 'Classic grand-design spiral galaxy.', true, true);

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, true, 'Rocky, cratered, no atmosphere');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9376, true, 'Small, heavily cratered, irregular shape');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23463, true, 'Smaller and smoother than Phobos');
INSERT INTO public.moon VALUES (4, 'Io', 5, 421700, true, 'Volcanic, sulfur plains');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 670900, true, 'Ice-covered, subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070400, true, 'Largest moon in solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1882700, true, 'Heavily cratered, ancient surface');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 181365, true, 'Dark reddish, small irregular');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 1221870, true, 'Thick nitrogen atmosphere, methane lakes');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 238020, true, 'Ice geysers, subsurface ocean');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 185540, true, 'Death Star appearance, large crater');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 377420, true, 'Ice cliffs and wispy terrain');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 527070, true, 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 129900, true, 'Patchwork terrain, extreme cliffs');
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 191020, true, 'Bright, smooth plains and valleys');
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 266300, true, 'Dark, ancient cratered surface');
INSERT INTO public.moon VALUES (17, 'Titania', 7, 435910, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 354759, true, 'Retrograde orbit, nitrogen geysers');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 5513400, false, 'Highly eccentric orbit, irregular');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 117647, true, 'Dark, irregularly shaped');

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 88, 0.055, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 225, 0.815, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365, 1.000, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 687, 0.107, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4333, 317.8, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10759, 95.16, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30589, 14.54, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 59800, 17.15, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 11, 1.270, true, false);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 1928, 7.000, false, false);
INSERT INTO public.planet VALUES (11, 'Vega b', 6, 200, 2.100, true, false);
INSERT INTO public.planet VALUES (12, 'Vega c', 6, 500, 4.500, false, false);

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.000, 'G2V', true, true);
INSERT INTO public.star VALUES (2, 'Proxima Cen', 1, 4850, 0.0017, 'M5Ve', true, true);
INSERT INTO public.star VALUES (3, 'Alpha Cen A', 1, 5300, 1.519, 'G2V', true, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 250, 25.40, 'A1V', true, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 8, 100000, 'M1-2', false, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, 40.12, 'A0Va', true, true);


SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


