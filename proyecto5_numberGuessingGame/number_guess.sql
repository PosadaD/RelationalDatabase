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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    attemps integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (37, 549, 18);
INSERT INTO public.games VALUES (38, 89, 18);
INSERT INTO public.games VALUES (39, 146, 19);
INSERT INTO public.games VALUES (40, 629, 19);
INSERT INTO public.games VALUES (41, 804, 18);
INSERT INTO public.games VALUES (42, 109, 18);
INSERT INTO public.games VALUES (43, 491, 18);
INSERT INTO public.games VALUES (44, 753, 20);
INSERT INTO public.games VALUES (45, 963, 20);
INSERT INTO public.games VALUES (46, 691, 21);
INSERT INTO public.games VALUES (47, 934, 21);
INSERT INTO public.games VALUES (48, 958, 20);
INSERT INTO public.games VALUES (49, 651, 20);
INSERT INTO public.games VALUES (50, 399, 20);
INSERT INTO public.games VALUES (51, 240, 22);
INSERT INTO public.games VALUES (52, 964, 23);
INSERT INTO public.games VALUES (53, 233, 24);
INSERT INTO public.games VALUES (54, 76, 25);
INSERT INTO public.games VALUES (55, 696, 26);
INSERT INTO public.games VALUES (56, 494, 27);
INSERT INTO public.games VALUES (57, 399, 28);
INSERT INTO public.games VALUES (58, 271, 29);
INSERT INTO public.games VALUES (59, 590, 32);
INSERT INTO public.games VALUES (60, 202, 33);
INSERT INTO public.games VALUES (61, 815, 34);
INSERT INTO public.games VALUES (62, 268, 35);
INSERT INTO public.games VALUES (63, 356, 36);
INSERT INTO public.games VALUES (64, 687, 37);
INSERT INTO public.games VALUES (65, 517, 38);
INSERT INTO public.games VALUES (66, 250, 38);
INSERT INTO public.games VALUES (67, 598, 39);
INSERT INTO public.games VALUES (68, 491, 39);
INSERT INTO public.games VALUES (69, 411, 38);
INSERT INTO public.games VALUES (70, 120, 38);
INSERT INTO public.games VALUES (71, 285, 38);
INSERT INTO public.games VALUES (72, 15, 40);
INSERT INTO public.games VALUES (73, 500, 40);
INSERT INTO public.games VALUES (74, 580, 41);
INSERT INTO public.games VALUES (75, 518, 41);
INSERT INTO public.games VALUES (76, 72, 40);
INSERT INTO public.games VALUES (77, 372, 40);
INSERT INTO public.games VALUES (78, 951, 40);
INSERT INTO public.games VALUES (79, 940, 42);
INSERT INTO public.games VALUES (80, 823, 42);
INSERT INTO public.games VALUES (81, 471, 43);
INSERT INTO public.games VALUES (82, 122, 43);
INSERT INTO public.games VALUES (83, 653, 42);
INSERT INTO public.games VALUES (84, 129, 42);
INSERT INTO public.games VALUES (85, 52, 42);
INSERT INTO public.games VALUES (86, 164, 44);
INSERT INTO public.games VALUES (87, 479, 44);
INSERT INTO public.games VALUES (88, 700, 45);
INSERT INTO public.games VALUES (89, 958, 45);
INSERT INTO public.games VALUES (90, 450, 44);
INSERT INTO public.games VALUES (91, 721, 44);
INSERT INTO public.games VALUES (92, 591, 44);
INSERT INTO public.games VALUES (93, 781, 46);
INSERT INTO public.games VALUES (94, 708, 46);
INSERT INTO public.games VALUES (95, 402, 47);
INSERT INTO public.games VALUES (96, 686, 47);
INSERT INTO public.games VALUES (97, 403, 46);
INSERT INTO public.games VALUES (98, 752, 46);
INSERT INTO public.games VALUES (99, 427, 46);
INSERT INTO public.games VALUES (100, 1, 18);
INSERT INTO public.games VALUES (101, 378, 48);
INSERT INTO public.games VALUES (102, 999, 48);
INSERT INTO public.games VALUES (103, 50, 49);
INSERT INTO public.games VALUES (104, 366, 49);
INSERT INTO public.games VALUES (105, 648, 48);
INSERT INTO public.games VALUES (106, 830, 48);
INSERT INTO public.games VALUES (107, 501, 48);
INSERT INTO public.games VALUES (108, 858, 50);
INSERT INTO public.games VALUES (109, 2, 50);
INSERT INTO public.games VALUES (110, 139, 51);
INSERT INTO public.games VALUES (111, 867, 51);
INSERT INTO public.games VALUES (112, 655, 50);
INSERT INTO public.games VALUES (113, 386, 50);
INSERT INTO public.games VALUES (114, 424, 50);
INSERT INTO public.games VALUES (115, 230, 52);
INSERT INTO public.games VALUES (116, 447, 53);
INSERT INTO public.games VALUES (117, 498, 54);
INSERT INTO public.games VALUES (118, 205, 55);
INSERT INTO public.games VALUES (119, 192, 56);
INSERT INTO public.games VALUES (120, 777, 57);
INSERT INTO public.games VALUES (121, 394, 58);
INSERT INTO public.games VALUES (122, 329, 59);
INSERT INTO public.games VALUES (123, 789, 60);
INSERT INTO public.games VALUES (124, 490, 60);
INSERT INTO public.games VALUES (125, 919, 61);
INSERT INTO public.games VALUES (126, 392, 61);
INSERT INTO public.games VALUES (127, 525, 60);
INSERT INTO public.games VALUES (128, 708, 60);
INSERT INTO public.games VALUES (129, 452, 60);
INSERT INTO public.games VALUES (130, 815, 62);
INSERT INTO public.games VALUES (131, 295, 62);
INSERT INTO public.games VALUES (132, 717, 63);
INSERT INTO public.games VALUES (133, 668, 63);
INSERT INTO public.games VALUES (134, 537, 62);
INSERT INTO public.games VALUES (135, 519, 62);
INSERT INTO public.games VALUES (136, 437, 62);
INSERT INTO public.games VALUES (137, 819, 64);
INSERT INTO public.games VALUES (138, 515, 64);
INSERT INTO public.games VALUES (139, 214, 65);
INSERT INTO public.games VALUES (140, 708, 65);
INSERT INTO public.games VALUES (141, 28, 64);
INSERT INTO public.games VALUES (142, 160, 64);
INSERT INTO public.games VALUES (143, 8, 64);
INSERT INTO public.games VALUES (144, 313, 66);
INSERT INTO public.games VALUES (145, 432, 66);
INSERT INTO public.games VALUES (146, 184, 67);
INSERT INTO public.games VALUES (147, 810, 67);
INSERT INTO public.games VALUES (148, 999, 66);
INSERT INTO public.games VALUES (149, 788, 66);
INSERT INTO public.games VALUES (150, 280, 66);
INSERT INTO public.games VALUES (151, 10, 68);
INSERT INTO public.games VALUES (152, 304, 69);
INSERT INTO public.games VALUES (153, 149, 69);
INSERT INTO public.games VALUES (154, 776, 70);
INSERT INTO public.games VALUES (155, 80, 70);
INSERT INTO public.games VALUES (156, 734, 69);
INSERT INTO public.games VALUES (157, 401, 69);
INSERT INTO public.games VALUES (158, 194, 69);
INSERT INTO public.games VALUES (159, 105, 71);
INSERT INTO public.games VALUES (160, 674, 71);
INSERT INTO public.games VALUES (161, 98, 72);
INSERT INTO public.games VALUES (162, 287, 72);
INSERT INTO public.games VALUES (163, 16, 71);
INSERT INTO public.games VALUES (164, 357, 71);
INSERT INTO public.games VALUES (165, 589, 71);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (18, 'user_1746671891614');
INSERT INTO public.users VALUES (19, 'user_1746671891613');
INSERT INTO public.users VALUES (20, 'user_1746671943280');
INSERT INTO public.users VALUES (21, 'user_1746671943279');
INSERT INTO public.users VALUES (22, 'user_1746671975607');
INSERT INTO public.users VALUES (23, 'user_1746671975606');
INSERT INTO public.users VALUES (24, 'user_1746671990454');
INSERT INTO public.users VALUES (25, 'user_1746671990453');
INSERT INTO public.users VALUES (26, 'user_1746672004305');
INSERT INTO public.users VALUES (27, 'user_1746672004304');
INSERT INTO public.users VALUES (28, 'user_1746672398571');
INSERT INTO public.users VALUES (29, 'user_1746672398570');
INSERT INTO public.users VALUES (30, 'user_1746673087415');
INSERT INTO public.users VALUES (31, 'user_1746673087414');
INSERT INTO public.users VALUES (32, 'user_1746673232376');
INSERT INTO public.users VALUES (33, 'user_1746673232375');
INSERT INTO public.users VALUES (34, 'user_1746673248435');
INSERT INTO public.users VALUES (35, 'user_1746673248434');
INSERT INTO public.users VALUES (36, 'user_1746673309673');
INSERT INTO public.users VALUES (37, 'user_1746673309672');
INSERT INTO public.users VALUES (38, 'user_1746673380172');
INSERT INTO public.users VALUES (39, 'user_1746673380171');
INSERT INTO public.users VALUES (40, 'user_1746673387492');
INSERT INTO public.users VALUES (41, 'user_1746673387491');
INSERT INTO public.users VALUES (42, 'user_1746673390443');
INSERT INTO public.users VALUES (43, 'user_1746673390442');
INSERT INTO public.users VALUES (44, 'user_1746673392746');
INSERT INTO public.users VALUES (45, 'user_1746673392745');
INSERT INTO public.users VALUES (46, 'user_1746673397723');
INSERT INTO public.users VALUES (47, 'user_1746673397722');
INSERT INTO public.users VALUES (48, 'user_1746673465807');
INSERT INTO public.users VALUES (49, 'user_1746673465806');
INSERT INTO public.users VALUES (50, 'user_1746673473611');
INSERT INTO public.users VALUES (51, 'user_1746673473610');
INSERT INTO public.users VALUES (52, 'user_1746673485013');
INSERT INTO public.users VALUES (53, 'user_1746673485012');
INSERT INTO public.users VALUES (54, 'user_1746673492033');
INSERT INTO public.users VALUES (55, 'user_1746673492032');
INSERT INTO public.users VALUES (56, 'user_1746673499662');
INSERT INTO public.users VALUES (57, 'user_1746673499661');
INSERT INTO public.users VALUES (58, 'user_1746673509835');
INSERT INTO public.users VALUES (59, 'user_1746673509834');
INSERT INTO public.users VALUES (60, 'user_1746673559614');
INSERT INTO public.users VALUES (61, 'user_1746673559613');
INSERT INTO public.users VALUES (62, 'user_1746673637396');
INSERT INTO public.users VALUES (63, 'user_1746673637395');
INSERT INTO public.users VALUES (64, 'user_1746673755216');
INSERT INTO public.users VALUES (65, 'user_1746673755215');
INSERT INTO public.users VALUES (66, 'user_1746673879416');
INSERT INTO public.users VALUES (67, 'user_1746673879415');
INSERT INTO public.users VALUES (68, 'pedro');
INSERT INTO public.users VALUES (69, 'user_1746674019952');
INSERT INTO public.users VALUES (70, 'user_1746674019951');
INSERT INTO public.users VALUES (71, 'user_1746674090252');
INSERT INTO public.users VALUES (72, 'user_1746674090251');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 165, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 72, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

