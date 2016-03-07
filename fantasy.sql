--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gms; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE gms (
    id integer NOT NULL,
    user_name character varying
);


ALTER TABLE gms OWNER TO "Guest";

--
-- Name: gms_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE gms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gms_id_seq OWNER TO "Guest";

--
-- Name: gms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE gms_id_seq OWNED BY gms.id;


--
-- Name: goalies_stats; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE goalies_stats (
    id integer NOT NULL,
    game integer,
    game_date date,
    team character varying,
    player_number integer,
    pt_number character varying,
    player character varying,
    pim integer,
    mp character varying,
    ga integer,
    gaa double precision,
    sa integer,
    sv integer,
    sv_percent double precision,
    star1 integer,
    star2 integer,
    star3 integer,
    so integer,
    fantasy_points double precision
);


ALTER TABLE goalies_stats OWNER TO "Guest";

--
-- Name: goalies_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE goalies_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goalies_stats_id_seq OWNER TO "Guest";

--
-- Name: goalies_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE goalies_stats_id_seq OWNED BY goalies_stats.id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE leagues (
    id integer NOT NULL,
    league_name character varying,
    max_gms integer,
    current_gms integer
);


ALTER TABLE leagues OWNER TO "Guest";

--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE leagues_id_seq OWNER TO "Guest";

--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    player character varying,
    pro_team character varying,
    pt_number character varying,
    pos character varying,
    salary integer
);


ALTER TABLE players OWNER TO "Guest";

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_id_seq OWNER TO "Guest";

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: players_two; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE players_two (
    id integer NOT NULL,
    player character varying,
    team character varying,
    pt_number character varying,
    pos character varying,
    salary integer
);


ALTER TABLE players_two OWNER TO "Guest";

--
-- Name: players_two_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE players_two_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_two_id_seq OWNER TO "Guest";

--
-- Name: players_two_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE players_two_id_seq OWNED BY players_two.id;


--
-- Name: skaters_stats; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE skaters_stats (
    id integer NOT NULL,
    game integer,
    game_date date,
    team character varying,
    player_number integer,
    pt_number character varying,
    player character varying,
    pos character varying,
    goals integer,
    assists integer,
    points integer,
    pim integer,
    shots integer,
    ppg integer,
    shg integer,
    fo_w_l character varying,
    fow integer,
    fol integer,
    gwg integer,
    star1 integer,
    star2 integer,
    star3 integer,
    sog integer,
    fantasy_points double precision
);


ALTER TABLE skaters_stats OWNER TO "Guest";

--
-- Name: skaters_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE skaters_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skaters_stats_id_seq OWNER TO "Guest";

--
-- Name: skaters_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE skaters_stats_id_seq OWNED BY skaters_stats.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY gms ALTER COLUMN id SET DEFAULT nextval('gms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY goalies_stats ALTER COLUMN id SET DEFAULT nextval('goalies_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY players_two ALTER COLUMN id SET DEFAULT nextval('players_two_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skaters_stats ALTER COLUMN id SET DEFAULT nextval('skaters_stats_id_seq'::regclass);


--
-- Data for Name: gms; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY gms (id, user_name) FROM stdin;
\.


--
-- Name: gms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('gms_id_seq', 1, false);


--
-- Data for Name: goalies_stats; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY goalies_stats (id, game, game_date, team, player_number, pt_number, player, pim, mp, ga, gaa, sa, sv, sv_percent, star1, star2, star3, so, fantasy_points) FROM stdin;
1	1	2015-10-11	NYR	33	NYR33	Nana Fujimoto 	0	60:00:00	4	4	30	26	0.866999999999999993	\N	\N	\N	\N	-2.9133
2	1	2015-10-11	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
3	1	2015-10-11	NYR	1	NYR1	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
4	1	2015-10-11	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
5	1	2015-10-11	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	1	1	33	32	0.969999999999999973	1	\N	\N	\N	15.0969999999999995
6	1	2015-10-11	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
7	2	2015-10-11	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
8	2	2015-10-11	BOS	29	BOS29	Brittany Ott 	0	60:00:00	1	1	35	34	0.970999999999999974	\N	\N	\N	\N	13.0970999999999993
9	2	2015-10-11	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
10	2	2015-10-11	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
11	2	2015-10-11	BUF	29	BUF29	Brianne Mclaughlin 	0	60:00:00	4	4	49	45	0.918000000000000038	\N	\N	1	\N	7.5918000000000001
12	2	2015-10-11	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
13	3	2015-10-18	CON	78	CON78	Chelsea Laden 	0	60:00:00	2	2	32	30	0.937999999999999945	\N	\N	\N	\N	7.09379999999999988
14	3	2015-10-18	CON	32	CON32	Jaimie Leonoff 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
15	3	2015-10-18	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
16	3	2015-10-18	BUF	29	BUF29	Brianne Mclaughlin 	0	59:50:00	4	4.00999999999999979	47	43	0.915000000000000036	1	\N	\N	\N	8.59149999999999991
17	3	2015-10-18	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
18	4	2015-10-18	BOS	30	BOS30	Lauren Slebodnick 	0	31:04:00	0	0	15	15	1	\N	\N	\N	\N	7.59999999999999964
19	4	2015-10-18	BOS	29	BOS29	Brittany Ott 	0	28:56:00	1	2.06999999999999984	10	9	0.900000000000000022	\N	\N	\N	\N	0.589999999999999969
20	4	2015-10-18	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
21	4	2015-10-18	NYR	33	NYR33	Nana Fujimoto 	0	31:04:00	3	5.79000000000000004	17	14	0.823999999999999955	\N	\N	\N	\N	-4.91760000000000019
22	4	2015-10-18	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
23	4	2015-10-18	NYR	1	NYR1	Shenae Lundberg 	0	28:56:00	4	8.28999999999999915	32	28	0.875	\N	\N	\N	\N	-1.91250000000000009
24	5	2015-10-25	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
25	5	2015-10-25	BOS	29	BOS29	Brittany Ott 	0	60:00:00	3	3	34	31	0.912000000000000033	\N	\N	\N	\N	3.59120000000000017
26	5	2015-10-25	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
27	5	2015-10-25	BUF	29	BUF29	Brianne Mclaughlin 	0	59:52:00	4	4.00999999999999979	49	45	0.918000000000000038	\N	\N	\N	\N	6.5918000000000001
28	5	2015-10-25	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
29	6	2015-10-25	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
30	6	2015-10-25	CON	24	CON24	Nicole Stock 	0	60:00:00	1	1	26	25	0.961999999999999966	\N	1	\N	\N	10.5961999999999996
31	6	2015-10-25	NYR	33	NYR33	Nana Fujimoto 	0	59:50:00	2	2.00999999999999979	22	20	0.90900000000000003	\N	\N	\N	\N	2.09089999999999998
32	6	2015-10-25	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
33	6	2015-10-25	NYR	1	NYR1	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
34	7	2015-11-15	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
35	7	2015-11-15	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	2	2	37	35	0.945999999999999952	\N	\N	\N	\N	9.5945999999999998
36	7	2015-11-15	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
37	7	2015-11-15	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
38	7	2015-11-15	BUF	29	BUF29	Brianne Mclaughlin 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
39	7	2015-11-15	BUF	1	BUF1	Kimberly Sass 	0	60:00:00	3	3	26	23	0.885000000000000009	1	\N	\N	\N	2.5884999999999998
40	8	2015-11-15	BOS	30	BOS30	Lauren Slebodnick 	0	60:00:00	3	3	35	32	0.914000000000000035	\N	\N	\N	\N	4.09140000000000015
41	8	2015-11-15	BOS	29	BOS29	Brittany Ott 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
42	8	2015-11-15	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
43	8	2015-11-15	NYR	33	NYR33	Nana Fujimoto 	0	60:00:00	2	2	63	61	0.967999999999999972	1	\N	\N	\N	25.5968000000000018
44	8	2015-11-15	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
45	8	2015-11-15	NYR	1	NYR1	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
46	9	2015-11-22	NYR	33	NYR33	Nana Fujimoto 	0	60:00:00	2	2	45	43	0.955999999999999961	1	\N	\N	\N	16.595600000000001
47	9	2015-11-22	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
48	9	2015-11-22	NYR	1	NYR1	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
49	9	2015-11-22	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
50	9	2015-11-22	BOS	29	BOS29	Brittany Ott 	0	60:00:00	3	3	20	17	0.849999999999999978	\N	\N	\N	\N	-3.41500000000000004
51	9	2015-11-22	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
52	10	2015-11-22	CON	32	CON32	Jaimie Leonoff 	0	20:00:00	1	3	11	10	0.90900000000000003	\N	\N	\N	\N	1.09089999999999998
53	10	2015-11-22	CON	24	CON24	Nicole Stock 	0	45:00:00	5	6.66999999999999993	26	21	0.808000000000000052	\N	\N	\N	\N	-9.41920000000000002
54	10	2015-11-22	BUF	34	BUF34	Amanda Makela 	0	45:00:00	1	1.33000000000000007	14	13	0.929000000000000048	\N	\N	\N	\N	2.5929000000000002
55	10	2015-11-22	BUF	29	BUF29	Brianne Mclaughlin 	0	20:00:00	5	15	14	9	0.643000000000000016	\N	\N	\N	\N	-15.4357000000000006
56	10	2015-11-22	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
57	11	2015-11-29	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	3	3	51	48	0.940999999999999948	\N	\N	\N	\N	12.0940999999999992
58	11	2015-11-29	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
59	11	2015-11-29	BOS	30	BOS30	Lauren Slebodnick 	0	26:59:00	1	2.2200000000000002	10	9	0.900000000000000022	\N	\N	\N	\N	0.589999999999999969
60	11	2015-11-29	BOS	29	BOS29	Brittany Ott 	0	31:39:00	3	0	15	12	0.800000000000000044	\N	\N	\N	\N	-5.91999999999999993
61	11	2015-11-29	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
62	12	2015-11-29	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
63	12	2015-11-29	BUF	29	BUF29	Brianne Mclaughlin 	0	60:00:00	1	0	34	33	0.970999999999999974	\N	1	\N	\N	14.5970999999999993
64	12	2015-11-29	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
65	12	2015-11-29	NYR	33	NYR33	Nana Fujimoto 	0	53:45:00	2	0	36	34	0.94399999999999995	\N	\N	\N	\N	9.09440000000000026
66	12	2015-11-29	NYR	30	NYR30	Jenny Scrivens 	0	4:32:00	0	0	4	4	1	\N	\N	\N	\N	2.10000000000000009
67	13	2015-12-05	BUF	34	BUF34	Amanda Makela 	0	42:02:00	2	0	26	24	0.923000000000000043	\N	\N	\N	\N	4.09229999999999983
68	13	2015-12-05	BUF	29	BUF29	Brianne Mclaughlin 	0	17:58:00	5	0	19	14	0.736999999999999988	\N	\N	\N	\N	-12.9262999999999995
69	13	2015-12-05	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
70	13	2015-12-05	BOS	30	BOS30	Lauren Slebodnick 	0	45:32:00	5	0	17	12	0.705999999999999961	\N	\N	\N	\N	-13.9293999999999993
71	13	2015-12-05	BOS	29	BOS29	Brittany Ott 	0	14:28:00	1	0	8	7	0.875	\N	\N	\N	\N	-0.412499999999999978
72	13	2015-12-05	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
73	14	2015-12-06	NYR	31	NYR31	Corinne Boyles 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
74	14	2015-12-06	NYR	30	NYR30	Jenny Scrivens 	0	59:05:00	2	0	38	36	0.946999999999999953	\N	\N	\N	\N	10.0946999999999996
75	14	2015-12-06	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
76	14	2015-12-06	BOS	29	BOS29	Brittany Ott 	0	60:00:00	1	0	25	24	0.959999999999999964	\N	\N	\N	\N	8.09600000000000009
77	14	2015-12-06	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
78	15	2015-12-06	BUF	34	BUF34	Amanda Makela 	0	65:00:00	2	0	24	22	0.917000000000000037	\N	\N	\N	\N	3.09169999999999989
79	15	2015-12-06	BUF	29	BUF29	Brianne Mclaughlin 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
80	15	2015-12-06	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
81	15	2015-12-06	CON	32	CON32	Jaimie Leonoff 	0	64:41:00	2	0	44	42	0.95499999999999996	\N	\N	\N	1	18.0955000000000013
82	15	2015-12-06	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
83	16	2015-12-13	CON	32	CON32	Jaimie Leonoff 	0	63:14:00	3	0	38	35	0.921000000000000041	\N	\N	\N	\N	5.59210000000000029
84	16	2015-12-13	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
85	16	2015-12-13	NYR	31	NYR31	Corinne Boyles 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
86	16	2015-12-13	NYR	30	NYR30	Jenny Scrivens 	0	65:00:00	3	0	47	44	0.936000000000000054	\N	\N	\N	\N	10.0936000000000003
87	16	2015-12-13	NYR	1	NYR1	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
88	17	2015-12-20	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
89	17	2015-12-20	BUF	29	BUF29	Brianne Mclaughlin 	0	60:00:00	1	0	46	45	0.97799999999999998	\N	\N	1	\N	19.5977999999999994
90	17	2015-12-20	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
91	17	2015-12-20	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
92	17	2015-12-20	BOS	29	BOS29	Brittany Ott 	0	60:00:00	0	0	24	24	1	\N	1	\N	1	19.1000000000000014
93	17	2015-12-20	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
94	18	2015-12-27	NYR	33	NYR33	Nana Fujimoto 	0	60:00:00	3	0	28	25	0.893000000000000016	\N	\N	\N	\N	0.589300000000000046
95	18	2015-12-27	NYR	31	NYR31	Corinne Boyles 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
96	18	2015-12-27	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
97	18	2015-12-27	BUF	34	BUF34	Amanda Makela 	0	30:58:00	2	0	15	13	0.866999999999999993	\N	\N	\N	\N	-1.4133
98	18	2015-12-27	BUF	29	BUF29	Brianne Mclaughlin 	0	29:02:00	5	0	22	17	0.77300000000000002	\N	\N	\N	\N	-11.4227000000000007
99	18	2015-12-27	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
100	19	2015-12-27	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
101	19	2015-12-27	BOS	29	BOS29	Brittany Ott 	0	60:00:00	1	0	34	33	0.970999999999999974	\N	\N	\N	\N	12.5970999999999993
102	19	2015-12-27	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
103	19	2015-12-27	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
104	19	2015-12-27	CON	32	CON32	Jaimie Leonoff 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
105	19	2015-12-27	CON	24	CON24	Nicole Stock 	0	59:25:00	2	0	44	42	0.95499999999999996	\N	\N	\N	\N	13.0954999999999995
106	20	2016-01-03	BUF	34	BUF34	Amanda Makela 	0	80:00:00	3	0	44	41	0.932000000000000051	\N	\N	\N	\N	8.59319999999999951
107	20	2016-01-03	BUF	29	BUF29	Brianne Mclaughlin 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
108	20	2016-01-03	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
109	20	2016-01-03	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
110	20	2016-01-03	BOS	29	BOS29	Brittany Ott 	0	80:00:00	4	0	29	25	0.861999999999999988	\N	\N	\N	\N	-3.41380000000000017
111	20	2016-01-03	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
112	21	2016-01-03	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
113	21	2016-01-03	CON	24	CON24	Nicole Stock 	0	60:00:00	1	0	36	35	0.971999999999999975	\N	1	\N	\N	15.5972000000000008
114	21	2016-01-03	NYR	33	NYR33	Nana Fujimoto 	0	43:10:00	4	0	26	22	0.845999999999999974	\N	\N	\N	\N	-4.91539999999999999
115	21	2016-01-03	NYR	30	NYR30	Jenny Scrivens 	0	16:33:00	1	0	7	6	0.856999999999999984	\N	\N	\N	\N	-0.914300000000000002
116	22	2016-01-09	NYR	33	NYR33	Nana Fujimoto 	0	59:47:00	4	0	34	30	0.882000000000000006	\N	\N	\N	\N	-0.911800000000000055
117	22	2016-01-09	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
118	22	2016-01-09	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
119	22	2016-01-09	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	3	0	51	48	0.940999999999999948	\N	\N	\N	\N	12.0940999999999992
120	22	2016-01-09	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
121	23	2016-01-10	NYR	33	NYR33	Nana Fujimoto 	0	27:01:00	3	0	19	16	0.841999999999999971	\N	\N	\N	\N	-3.91579999999999995
122	23	2016-01-10	NYR	30	NYR30	Jenny Scrivens 	0	32:59:00	5	0	20	15	0.75	\N	\N	\N	\N	-12.4250000000000007
123	23	2016-01-10	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
124	23	2016-01-10	BOS	29	BOS29	Brittany Ott 	0	51:32:00	1	0	26	25	0.961999999999999966	\N	\N	\N	\N	8.59619999999999962
125	23	2016-01-10	BOS	1	BOS1	Kelsie Fralick 	0	8:28:00	0	0	3	3	1	\N	\N	\N	\N	1.60000000000000009
126	24	2016-01-10	BUF	34	BUF34	Amanda Makela 	0	59:52:00	5	0	42	37	0.881000000000000005	\N	\N	\N	\N	-1.41189999999999993
127	24	2016-01-10	BUF	29	BUF29	Brianne Mclaughlin 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
128	24	2016-01-10	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
129	24	2016-01-10	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
130	24	2016-01-10	CON	32	CON32	Jaimie Leonoff 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
131	24	2016-01-10	CON	24	CON24	Nicole Stock 	0	60:00:00	3	0	37	34	0.919000000000000039	\N	\N	\N	\N	5.09189999999999987
132	25	2016-01-17	CON	78	CON78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
133	25	2016-01-17	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	4	0	49	45	0.918000000000000038	\N	\N	\N	\N	6.5918000000000001
134	25	2016-01-17	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
135	25	2016-01-17	BOS	29	BOS29	Brittany Ott 	0	60:00:00	1	0	27	26	0.962999999999999967	\N	\N	\N	\N	9.09629999999999939
136	25	2016-01-17	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
137	26	2016-01-17	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
138	26	2016-01-17	BUF	29	BUF29	Brianne Mclaughlin 	0	34:30:00	1	0	26	25	0.961999999999999966	\N	\N	\N	\N	8.59619999999999962
139	26	2016-01-17	BUF	1	BUF1	Kimberly Sass 	0	30:30:00	4	0	25	21	0.839999999999999969	\N	\N	\N	\N	-5.41600000000000037
140	26	2016-01-17	NYR	33	NYR33	Nana Fujimoto 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
141	26	2016-01-17	NYR	30	NYR30	Jenny Scrivens 	0	65:00:00	5	0	47	42	0.894000000000000017	\N	\N	\N	\N	1.08939999999999992
142	27	2016-01-31	NYR	33	NYR33	Nana Fujimoto 	0	59:07:00	3	0	45	42	0.933000000000000052	\N	\N	\N	\N	9.09329999999999927
143	27	2016-01-31	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
144	27	2016-01-31	NYR	1	NYR1	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
145	27	2016-01-31	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
146	27	2016-01-31	BUF	29	BUF29	Brianne Mclaughlin 	0	60:00:00	2	0	22	20	0.90900000000000003	\N	\N	\N	\N	2.09089999999999998
147	27	2016-01-31	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
148	28	2016-01-31	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
149	28	2016-01-31	BOS	29	BOS29	Brittany Ott 	0	60:00:00	2	0	23	21	0.913000000000000034	\N	\N	\N	\N	2.59129999999999994
150	28	2016-01-31	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
151	28	2016-01-31	CON	78	CON78	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
152	28	2016-01-31	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	5	0	59	54	0.915000000000000036	\N	\N	\N	\N	7.09149999999999991
153	28	2016-01-31	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
154	29	2016-02-06	BOS	29	BOS29	Brittany Ott 	0	60:00:00	1	0	24	23	0.957999999999999963	\N	\N	\N	\N	7.59579999999999966
155	29	2016-02-06	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
156	29	2016-02-06	NYR	33	NYR33	Nana Fujimoto 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
157	29	2016-02-06	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
158	29	2016-02-06	NYR	1	NYR1	Chelsea Laden 	0	60:00:00	6	0	35	29	0.828999999999999959	\N	\N	\N	\N	-9.41709999999999958
159	30	2006-02-07	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
160	30	2016-02-07	BUF	29	BUF29	Brianne Mclaughlin 	0	62:08:00	2	0	34	32	0.940999999999999948	\N	\N	\N	\N	8.09409999999999918
161	30	2026-02-07	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
162	30	2036-02-07	CON	78	CON78	Shenae Lundberg 	0	62:08:00	2	0	25	23	0.92000000000000004	\N	\N	\N	\N	3.59200000000000008
163	30	2046-02-07	CON	32	CON32	Jaimie Leonoff 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
164	30	2056-02-07	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
165	31	2016-02-14	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
166	31	2016-02-14	BUF	29	BUF29	Brianne Mclaughlin 	0	80:00:00	3	0	26	23	0.885000000000000009	\N	\N	\N	\N	-0.411499999999999977
167	31	2016-02-14	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
168	31	2016-02-14	NYR	33	NYR33	Nana Fujimoto 	0	80:00:00	3	0	38	35	0.921000000000000041	\N	1	\N	\N	7.59210000000000029
169	31	2016-02-14	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
170	31	2016-02-14	NYR	1	NYR1	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
171	32	2016-02-14	CON	78	CON78	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
172	32	2016-02-14	CON	24	CON24	Nicole Stock 	0	58:42:00	3	0	42	39	0.929000000000000048	\N	\N	\N	\N	7.5929000000000002
173	32	2016-02-14	BOS	29	BOS29	Brittany Ott 	0	60:00:00	2	0	17	15	0.882000000000000006	\N	\N	\N	\N	-0.411799999999999999
174	32	2016-02-14	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
175	33	2016-02-21	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
176	33	2016-02-21	BOS	29	BOS29	Brittany Ott 	0	60:00:00	3	0	22	19	0.86399999999999999	\N	\N	\N	\N	-2.41360000000000019
177	33	2016-02-21	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
178	33	2016-02-21	CON	78	CON78	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
179	33	2016-02-21	CON	32	CON32	Jaimie Leonoff 	0	59:20:00	4	0	65	61	0.937999999999999945	\N	\N	\N	\N	14.5937999999999999
180	33	2016-02-21	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
181	34	2016-02-21	NYR	33	NYR33	Nana Fujimoto 	0	58:37:00	4	0	33	29	0.879000000000000004	\N	\N	\N	\N	-1.41209999999999991
182	34	2016-02-21	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
183	34	2016-02-21	NYR	1	NYR1	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
184	34	2016-02-21	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
185	34	2016-02-21	BUF	29	BUF29	Brianne Mclaughlin 	0	60:00:00	1	0	19	18	0.946999999999999953	\N	\N	1	\N	6.09469999999999956
186	34	2016-02-21	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
187	35	2016-02-28	BOS	29	BOS29	Brittany Ott 	0	60:00:00	2	0	27	25	0.926000000000000045	\N	\N	\N	\N	4.59260000000000002
188	35	2016-02-28	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
189	35	2016-02-28	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
190	35	2016-02-28	BUF	29	BUF29	Brianne Mclaughlin 	0	58:39:00	3	0	36	33	0.917000000000000037	\N	\N	\N	\N	4.59170000000000034
191	35	2016-02-28	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
192	36	2016-02-28	NYR	78	NYR78	Chelsea Laden 	0	59:25:00	3	0	25	22	0.880000000000000004	\N	\N	\N	\N	-0.912000000000000033
193	36	2016-02-28	NYR	33	NYR33	Nana Fujimoto 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
194	36	2016-02-28	NYR	30	NYR30	Jenny Scrivens 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
195	36	2016-02-28	CON	32	CON32	Jaimie Leonoff 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
196	36	2016-02-28	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
197	36	2016-02-28	CON	1	CON1	Shenae Lundberg 	0	60:00:00	2	0	25	23	0.92000000000000004	\N	\N	\N	\N	3.59200000000000008
198	37	2016-03-04	NYR	78	NYR78	Chelsea Laden 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
199	37	2016-03-04	NYR	30	NYR30	Jenny Scrivens 	0	60:00:00	6	0	56	50	0.893000000000000016	\N	\N	\N	\N	1.08929999999999993
200	37	2016-03-04	BOS	30	BOS30	Lauren Slebodnick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
201	37	2016-03-04	BOS	29	BOS29	Brittany Ott 	0	60:00:00	0	0	17	17	1	\N	\N	\N	1	13.5999999999999996
202	37	2016-03-04	BOS	1	BOS1	Kelsie Fralick 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
203	38	2016-03-04	BUF	34	BUF34	Amanda Makela 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
204	38	2016-03-04	BUF	29	BUF29	Brianne Mclaughlin 	0	57:16:00	2	0	20	18	0.900000000000000022	\N	\N	\N	\N	1.09000000000000008
205	38	2016-03-04	BUF	1	BUF1	Kimberly Sass 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
206	38	2016-03-04	CON	78	CON78	Shenae Lundberg 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
207	38	2016-03-04	CON	32	CON32	Jaimie Leonoff 	0	60:00:00	0	0	35	35	1	1	\N	\N	1	25.6000000000000014
208	38	2016-03-04	CON	24	CON24	Nicole Stock 	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0
\.


--
-- Name: goalies_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('goalies_stats_id_seq', 1, false);


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY leagues (id, league_name, max_gms, current_gms) FROM stdin;
\.


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('leagues_id_seq', 1, false);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY players (id, player, pro_team, pt_number, pos, salary) FROM stdin;
1	Alyssa Gagliardi 	Boston Pride	BOS02	D	16000
2	Alyssa Wohlfeiler 	Connecticut Whale	CON88	F	10000
3	Amanda Makela 	Buffalo Beauts	BUF34	G	15000
4	Amanda Pelkey 	Boston Pride	BOS16	F	13500
5	Amber Moore 	New York Riveters	NYR02	D	10000
6	Annemarie Cellino 	Buffalo Beauts	BUF15	F	10000
7	Anya Battaglino 	Connecticut Whale	CON04	D	10000
8	Ashley Johnston 	New York Riveters	NYR10	D	14000
9	Beth Hanrahan 	New York Riveters	NYR28	F	10500
10	Blake Bolden 	Boston Pride	BOS10	D	15000
11	Bray Ketchum 	New York Riveters	NYR10	F	14000
12	Brianna Decker 	Boston Pride	BOS14	F	22000
13	Brianne Mclaughlin 	Buffalo Beauts	BUF29	G	22000
14	Brittany Dougherty 	Connecticut Whale	CON19	F	10000
15	Brittany Ott 	Boston Pride	BOS29	G	17000
16	Brooke Ammerman 	New York Riveters	NYR20	F	16500
17	Casey Pickett 	Boston Pride	BOS07	F	10000
18	Celeste Brown 	New York Riveters	NYR24	F	15000
19	Chelsea Laden 	Connecticut Whale	CON78	G	14000
20	Chelsea Laden 	New York Riveters	NYR01	G	14000
21	Cherie Hendrickson 	Boston Pride	BOS18	D	10000
22	Cherie Stewart 	New York Riveters	NYR13	F	10000
23	Corinne Boyles 	New York Riveters	NYR31	G	10000
24	Corinne Buie 	Boston Pride	BOS23	F	12000
25	Courtney Carnes 	Buffalo Beauts	BUF05	F	10000
26	Danielle Ward 	Connecticut Whale	CON22	F	10000
27	Denna Laing 	Boston Pride	BOS24	F	10000
28	Devon Skeats 	Buffalo Beauts	BUF21	F	15000
29	Elena Orlando 	New York Riveters	NYR04	D	10000
30	Emily Field 	Boston Pride	BOS15	F	13500
31	Emily Pfalzer 	Buffalo Beauts	BUF07	D	21000
32	Erin Barley-Maloney 	New York Riveters	NYR22	F	14000
33	Erin Zach 	Buffalo Beauts	BUF20	F	13000
34	Gabie Figueroa 	New York Riveters	NYR21	D	10000
35	Gigi Marvin 	Boston Pride	BOS19	D	20000
36	Hailey Browne 	Buffalo Beauts	BUF24	F	15000
37	Hannah McGowan 	Buffalo Beauts	BUF2	F	10000
38	Hayley Moore 	Boston Pride	BOS00	F	10000
39	Hayley Williams 	Buffalo Beauts	BUF77	F	13000
40	Hilary Knight 	Boston Pride	BOS21	F	22000
41	Jaimie Leonoff 	Connecticut Whale	CON32	G	10000
42	Janine Weber 	New York Riveters	NYR12	F	19500
43	Jenny Scrivens 	New York Riveters	NYR30	G	10000
44	Jessica Fickel 	Buffalo Beauts	BUF06	F	15000
45	Jessica Koizumi 	Connecticut Whale	CON56	F	20500
46	Jillian Dempsey 	Boston Pride	BOS03	F	10500
47	Jordan Brickner 	Connecticut Whale	CON26	D	10000
48	Jordan Smelker 	Boston Pride	BOS11	F	16000
49	Kacey Bellamy 	Boston Pride	BOS22	D	22000
50	Kaleigh Fratkin 	Connecticut Whale	CON13	D	20000
51	Kate Buesser 	Connecticut Whale	CON05	F	10000
52	Katia Pashkevitch 	Connecticut Whale	CON44	D	10000
53	Kelley Steadman 	Buffalo Beauts	BUF03	F	10000
54	Kelli Stack 	Connecticut Whale	CON61	F	25000
55	Kelly Babstock 	Connecticut Whale	CON08	F	18000
56	Kelly Cooke 	Boston Pride	BOS05	F	10500
57	Kelly Mcdonald 	Buffalo Beauts	BUF14	D	13000
58	Kelsie Fralick 	Boston Pride	BOS01	G	10000
59	Kimberly Sass 	Buffalo Beauts	BUF01	G	10000
60	Kira Dosdall 	New York Riveters	NYR26	D	13500
61	Kourtney Kunichika 	Buffalo Beauts	BUF36	F	10000
62	Lauren Slebodnick 	Boston Pride	BOS30	G	12500
63	Lindsay Berman 	Connecticut Whale	CON10	D	15000
64	Lindsay Grigg 	Buffalo Beauts	BUF23	D	13000
65	Liudmila Belyakova 	New York Riveters	NYR09	F	20000
66	Madison Packer 	New York Riveters	NYR14	F	15000
67	Maggie Giamo 	Buffalo Beauts	BUF26	F	10000
68	Margot Scharfe 	New York Riveters	NYR19	F	10000
69	Marissa Gedman 	Boston Pride	BOS12	D	10000
70	Meagan Mangene 	Boston Pride	BOS57	D	22500
71	Megan Bozek 	Buffalo Beauts	BUF09	D	10000
72	Meghan Duggan 	Buffalo Beauts	BUF10	F	22500
73	Meghan Fardelmann 	New York Riveters	NYR18	F	20000
74	Micaela Long 	Connecticut Whale	CON16	F	10000
75	Molly Engstrom 	Connecticut Whale	CON09	D	12000
76	Morgan Fritz-Ward 	New York Riveters	NYR11	F	12500
77	Nana Fujimoto 	New York Riveters	NYR33	G	21000
78	Nicole Stock 	Connecticut Whale	CON24	G	10000
79	Paige Harrington 	Buffalo Beauts	BUF02	D	10000
80	Rachel Llanes 	Boston Pride	BOS91	F	10500
81	Sam Faber 	Connecticut Whale	CON28	F	13500
82	Shannon Doyle 	Connecticut Whale	CON06	D	15000
83	Shelby Bram 	Buffalo Beauts	BUF13	F	15000
84	Shenae Lundberg 	Connecticut Whale	CON78	G	15000
85	Shenae Lundberg 	New York Riveters	NYR01	G	15000
86	Shiann Darkangelo 	Connecticut Whale	CON27	F	17000
87	Sydney Kidd 	New York Riveters	NYR08	D	15000
88	Tara Tomimoto 	Connecticut Whale	CON44	D	10000
89	Tatiana Rafter 	Buffalo Beauts	BUF43	F	15000
90	Taylor Holze 	New York Riveters	NYR91	F	10000
91	Yekaterina Smolentseva 	Connecticut Whale	CON17	F	22000
92	Zoe Hickel 	Boston Pride	BOS44	F	16000
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('players_id_seq', 1, false);


--
-- Data for Name: players_two; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY players_two (id, player, team, pt_number, pos, salary) FROM stdin;
1	Alyssa Gagliardi 	Boston Pride	BOS02	D	16000
2	Alyssa Wohlfeiler 	Connecticut Whale	CON88	F	10000
3	Amanda Makela 	Buffalo Beauts	BUF34	G	15000
4	Amanda Pelkey 	Boston Pride	BOS16	F	13500
5	Amber Moore 	New York Riveters	NYR02	D	10000
6	Annemarie Cellino 	Buffalo Beauts	BUF15	F	10000
7	Anya Battaglino 	Connecticut Whale	CON04	D	10000
8	Ashley Johnston 	New York Riveters	NYR10	D	14000
9	Beth Hanrahan 	New York Riveters	NYR28	F	10500
10	Blake Bolden 	Boston Pride	BOS10	D	15000
11	Bray Ketchum 	New York Riveters	NYR10	F	14000
12	Brianna Decker 	Boston Pride	BOS14	F	22000
13	Brianne Mclaughlin 	Buffalo Beauts	BUF29	G	22000
14	Brittany Dougherty 	Connecticut Whale	CON19	F	10000
15	Brittany Ott 	Boston Pride	BOS29	G	17000
16	Brooke Ammerman 	New York Riveters	NYR20	F	16500
17	Casey Pickett 	Boston Pride	BOS07	F	10000
18	Celeste Brown 	New York Riveters	NYR24	F	15000
19	Chelsea Laden 	Connecticut Whale	CON78	G	14000
20	Chelsea Laden 	New York Riveters	NYR01	G	14000
21	Cherie Hendrickson 	Boston Pride	BOS18	D	10000
22	Cherie Stewart 	New York Riveters	NYR13	F	10000
23	Corinne Boyles 	New York Riveters	NYR31	G	10000
24	Corinne Buie 	Boston Pride	BOS23	F	12000
25	Courtney Carnes 	Buffalo Beauts	BUF05	F	10000
26	Danielle Ward 	Connecticut Whale	CON22	F	10000
27	Denna Laing 	Boston Pride	BOS24	F	10000
28	Devon Skeats 	Buffalo Beauts	BUF21	F	15000
29	Elena Orlando 	New York Riveters	NYR04	D	10000
30	Emily Field 	Boston Pride	BOS15	F	13500
31	Emily Pfalzer 	Buffalo Beauts	BUF07	D	21000
32	Erin Barley-Maloney 	New York Riveters	NYR22	F	14000
33	Erin Zach 	Buffalo Beauts	BUF20	F	13000
34	Gabie Figueroa 	New York Riveters	NYR21	D	10000
35	Gigi Marvin 	Boston Pride	BOS19	D	20000
36	Hailey Browne 	Buffalo Beauts	BUF24	F	15000
37	Hannah McGowan 	Buffalo Beauts	BUF2	F	10000
38	Hayley Moore 	Boston Pride	BOS00	F	10000
39	Hayley Williams 	Buffalo Beauts	BUF77	F	13000
40	Hilary Knight 	Boston Pride	BOS21	F	22000
41	Jaimie Leonoff 	Connecticut Whale	CON32	G	10000
42	Janine Weber 	New York Riveters	NYR12	F	19500
43	Jenny Scrivens 	New York Riveters	NYR30	G	10000
44	Jessica Fickel 	Buffalo Beauts	BUF06	F	15000
45	Jessica Koizumi 	Connecticut Whale	CON56	F	20500
46	Jillian Dempsey 	Boston Pride	BOS03	F	10500
47	Jordan Brickner 	Connecticut Whale	CON26	D	10000
48	Jordan Smelker 	Boston Pride	BOS11	F	16000
49	Kacey Bellamy 	Boston Pride	BOS22	D	22000
50	Kaleigh Fratkin 	Connecticut Whale	CON13	D	20000
51	Kate Buesser 	Connecticut Whale	CON05	F	10000
52	Katia Pashkevitch 	Connecticut Whale	CON44	D	10000
53	Kelley Steadman 	Buffalo Beauts	BUF03	F	10000
54	Kelli Stack 	Connecticut Whale	CON61	F	25000
55	Kelly Babstock 	Connecticut Whale	CON08	F	18000
56	Kelly Cooke 	Boston Pride	BOS05	F	10500
57	Kelly Mcdonald 	Buffalo Beauts	BUF14	D	13000
58	Kelsie Fralick 	Boston Pride	BOS01	G	10000
59	Kimberly Sass 	Buffalo Beauts	BUF01	G	10000
60	Kira Dosdall 	New York Riveters	NYR26	D	13500
61	Kourtney Kunichika 	Buffalo Beauts	BUF36	F	10000
62	Lauren Slebodnick 	Boston Pride	BOS30	G	12500
63	Lindsay Berman 	Connecticut Whale	CON10	D	15000
64	Lindsay Grigg 	Buffalo Beauts	BUF23	D	13000
65	Liudmila Belyakova 	New York Riveters	NYR09	F	20000
66	Madison Packer 	New York Riveters	NYR14	F	15000
67	Maggie Giamo 	Buffalo Beauts	BUF26	F	10000
68	Margot Scharfe 	New York Riveters	NYR19	F	10000
69	Marissa Gedman 	Boston Pride	BOS12	D	10000
70	Meagan Mangene 	Boston Pride	BOS57	D	22500
71	Megan Bozek 	Buffalo Beauts	BUF09	D	10000
72	Meghan Duggan 	Buffalo Beauts	BUF10	F	22500
73	Meghan Fardelmann 	New York Riveters	NYR18	F	20000
74	Micaela Long 	Connecticut Whale	CON16	F	10000
75	Molly Engstrom 	Connecticut Whale	CON09	D	12000
76	Morgan Fritz-Ward 	New York Riveters	NYR11	F	12500
77	Nana Fujimoto 	New York Riveters	NYR33	G	21000
78	Nicole Stock 	Connecticut Whale	CON24	G	10000
79	Paige Harrington 	Buffalo Beauts	BUF02	D	10000
80	Rachel Llanes 	Boston Pride	BOS91	F	10500
81	Sam Faber 	Connecticut Whale	CON28	F	13500
82	Shannon Doyle 	Connecticut Whale	CON06	D	15000
83	Shelby Bram 	Buffalo Beauts	BUF13	F	15000
84	Shenae Lundberg 	Connecticut Whale	CON78	G	15000
85	Shenae Lundberg 	New York Riveters	NYR01	G	15000
86	Shiann Darkangelo 	Connecticut Whale	CON27	F	17000
87	Sydney Kidd 	New York Riveters	NYR08	D	15000
88	Tara Tomimoto 	Connecticut Whale	CON44	D	10000
89	Tatiana Rafter 	Buffalo Beauts	BUF43	F	15000
90	Taylor Holze 	New York Riveters	NYR91	F	10000
91	Yekaterina Smolentseva 	Connecticut Whale	CON17	F	22000
92	Zoe Hickel 	Boston Pride	BOS44	F	16000
\.


--
-- Name: players_two_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('players_two_id_seq', 1, false);


--
-- Data for Name: skaters_stats; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY skaters_stats (id, game, game_date, team, player_number, pt_number, player, pos, goals, assists, points, pim, shots, ppg, shg, fo_w_l, fow, fol, gwg, star1, star2, star3, sog, fantasy_points) FROM stdin;
1	1	2015-10-11	NYR	20	NYR20	Brooke Ammerman 	F 	1	0	1	0	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	5.5
2	1	2015-10-11	NYR	9	NYR9	Liudmila Belyakova 	F 	0	1	1	0	4	0	0	4-8 	4	8	0	\N	\N	\N	\N	3.60000000000000009
3	1	2015-10-11	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	1	0	0	3-13 	3	13	0	\N	\N	\N	\N	-0.5
4	1	2015-10-11	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
5	1	2015-10-11	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
6	1	2015-10-11	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
7	1	2015-10-11	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991
8	1	2015-10-11	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	6	0	0	3-2 	3	2	0	\N	\N	\N	\N	3.10000000000000009
9	1	2015-10-11	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
10	1	2015-10-11	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
11	1	2015-10-11	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
12	1	2015-10-11	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
13	1	2015-10-11	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	2	0	0	1-9 	1	9	0	\N	\N	\N	\N	0.200000000000000011
14	1	2015-10-11	NYR	14	NYR14	Madison Packer 	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
15	1	2015-10-11	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
16	1	2015-10-11	CON	61	CON61	Kelli Stack 	F 	1	2	3	2	4	0	0	17-6 	17	6	1	\N	1	\N	\N	18.6000000000000014
17	1	2015-10-11	CON	8	CON8	Kelly Babstock 	F 	1	1	2	0	6	0	0	2-1 	2	1	0	\N	\N	1	\N	10.0999999999999996
18	1	2015-10-11	CON	56	CON56	Jessica Koizumi 	F 	1	0	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036
19	1	2015-10-11	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
20	1	2015-10-11	CON	27	CON27	Shiann Darkangelo 	F 	1	0	1	0	4	0	0	2-1 	2	1	0	\N	\N	\N	\N	6.09999999999999964
21	1	2015-10-11	CON	16	CON16	Micaela Long 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
22	1	2015-10-11	CON	13	CON13	Kaleigh Fratkin 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
23	1	2015-10-11	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
24	1	2015-10-11	CON	28	CON28	Sam Faber 	F 	0	0	0	0	0	0	0	4-2 	4	2	0	\N	\N	\N	\N	0.200000000000000011
25	1	2015-10-11	CON	22	CON22	Danielle Ward 	F 	0	0	0	2	1	0	0	7-0 	7	0	0	\N	\N	\N	\N	1.69999999999999996
26	1	2015-10-11	CON	10	CON10	Lindsay Berman 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
27	1	2015-10-11	CON	9	CON9	Molly Engstrom 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
28	1	2015-10-11	CON	17	CON17	Anya Battaglino 	D 	0	0	0	2	0	0	0	2-1 	2	1	0	\N	\N	\N	\N	0.599999999999999978
29	1	2015-10-11	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	1-1 	1	1	0	\N	\N	\N	\N	1
30	1	2015-10-11	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
31	2	2015-10-11	BOS	22	BOS22	Kacey Bellamy 	D 	0	2	2	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
32	2	2015-10-11	BOS	21	BOS21	Hilary Knight 	F 	2	0	2	0	7	1	0	0-0 	0	0	1	\N	1	\N	\N	19
33	2	2015-10-11	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	2	2	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	7
34	2	2015-10-11	BOS	14	BOS14	Brianna Decker 	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
35	2	2015-10-11	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
36	2	2015-10-11	BOS	11	BOS11	Jordan Smelker 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
37	2	2015-10-11	BOS	3	BOS3	Jillian Dempsey 	F 	0	1	1	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
38	2	2015-10-11	BOS	44	BOS44	Zoe Hickel 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
39	2	2015-10-11	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
40	2	2015-10-11	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
41	2	2015-10-11	BOS	15	BOS15	Emily Field 	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
42	2	2015-10-11	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
43	2	2015-10-11	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
44	2	2015-10-11	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
45	2	2015-10-11	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
46	2	2015-10-11	BUF	10	BUF10	Meghan Duggan 	F 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
47	2	2015-10-11	BUF	3	BUF3	Kelley Steadman 	F 	1	0	1	0	6	1	0	0-0 	0	0	0	1	\N	\N	\N	10.5
48	2	2015-10-11	BUF	7	BUF7	Emily Pfalzer 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
49	2	2015-10-11	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
50	2	2015-10-11	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
51	2	2015-10-11	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
52	2	2015-10-11	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
53	2	2015-10-11	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
54	2	2015-10-11	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
55	2	2015-10-11	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
56	2	2015-10-11	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
57	2	2015-10-11	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
58	2	2015-10-11	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
59	2	2015-10-11	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
60	2	2015-10-11	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
61	2	2015-10-11	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
62	3	2015-10-18	CON	13	CON13	Kaleigh Fratkin 	D 	1	2	3	4	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	12
63	3	2015-10-18	CON	8	CON8	Kelly Babstock 	F 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
64	3	2015-10-18	CON	28	CON28	Sam Faber 	F 	1	1	2	0	4	1	0	0-0 	0	0	0	\N	\N	\N	\N	8.5
65	3	2015-10-18	CON	27	CON27	Shiann Darkangelo 	F 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
66	3	2015-10-18	CON	10	CON10	Lindsay Berman 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
67	3	2015-10-18	CON	61	CON61	Kelli Stack 	F 	0	1	1	2	10	0	0	11-14 	11	14	0	\N	\N	\N	\N	7.20000000000000018
68	3	2015-10-18	CON	9	CON9	Molly Engstrom 	D 	1	0	1	0	6	1	0	0-0 	0	0	0	\N	\N	\N	\N	7.5
69	3	2015-10-18	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
70	3	2015-10-18	CON	88	CON88	Alyssa Wohlfeiler 	F 	1	0	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
71	3	2015-10-18	CON	5	CON5	Kate Buesser 	F 	1	0	1	0	5	0	0	7-11 	7	11	1	\N	\N	\N	\N	11.0999999999999996
72	3	2015-10-18	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
73	3	2015-10-18	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
74	3	2015-10-18	CON	4	CON4	Anya Battaglino 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
75	3	2015-10-18	CON	16	CON16	Micaela Long 	F 	0	0	0	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
76	3	2015-10-18	CON	1	CON1	Breann Frykas 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
77	3	2015-10-18	CON	22	CON22	Danielle Ward 	F 	0	0	0	0	1	0	0	4-8 	4	8	0	\N	\N	\N	\N	0.100000000000000006
78	3	2015-10-18	BUF	10	BUF10	Meghan Duggan 	F 	1	1	2	2	6	0	1	3-2 	3	2	0	\N	1	\N	\N	12.5999999999999996
79	3	2015-10-18	BUF	3	BUF3	Kelley Steadman 	F 	1	1	2	2	5	0	0	0-1 	0	1	0	\N	\N	1	\N	9.90000000000000036
80	3	2015-10-18	BUF	15	BUF15	Annemarie Cellino 	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
81	3	2015-10-18	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	2	4	0	0	5-7 	5	7	0	\N	\N	\N	\N	2.29999999999999982
82	3	2015-10-18	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	2	0	0	2-2 	2	2	0	\N	\N	\N	\N	1.5
83	3	2015-10-18	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
84	3	2015-10-18	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
85	3	2015-10-18	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	4	1	0	0	3-2 	3	2	0	\N	\N	\N	\N	1.60000000000000009
86	3	2015-10-18	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	1	0	0	12-9 	12	9	0	\N	\N	\N	\N	0.800000000000000044
87	3	2015-10-18	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
88	3	2015-10-18	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
89	3	2015-10-18	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
90	3	2015-10-18	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
91	3	2015-10-18	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
92	3	2015-10-18	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
93	4	2015-10-18	BOS	10	BOS10	Blake Bolden 	D 	1	2	3	6	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	12.5
94	4	2015-10-18	BOS	44	BOS44	Zoe Hickel 	F 	2	1	3	2	6	0	0	0-0 	0	0	0	1	\N	\N	\N	16.5
95	4	2015-10-18	BOS	14	BOS14	Brianna Decker 	F 	2	1	3	0	6	0	1	12-11 	12	11	1	\N	1	\N	\N	21.1000000000000014
96	4	2015-10-18	BOS	11	BOS11	Jordan Smelker 	F 	1	1	2	0	3	1	0	0-1 	0	1	0	\N	\N	\N	\N	7.90000000000000036
97	4	2015-10-18	BOS	21	BOS21	Hilary Knight 	F 	0	2	2	2	7	0	0	8-5 	8	5	0	\N	\N	\N	\N	8.30000000000000071
98	4	2015-10-18	BOS	23	BOS23	Corinne Buie 	F 	1	1	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8
99	4	2015-10-18	BOS	12	BOS12	Marissa Gedman 	D 	0	1	1	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
100	4	2015-10-18	BOS	16	BOS16	Amanda Pelkey 	F 	0	1	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991
101	4	2015-10-18	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
102	4	2015-10-18	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
103	4	2015-10-18	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
104	4	2015-10-18	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
105	4	2015-10-18	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	0	0	0	0	5-3 	5	3	0	\N	\N	\N	\N	0.200000000000000011
106	4	2015-10-18	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
107	4	2015-10-18	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
108	4	2015-10-18	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
109	4	2015-10-18	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
110	4	2015-10-18	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006
111	4	2015-10-18	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
112	4	2015-10-18	NYR	21	NYR21	Gabie Figueroa 	D 	1	0	1	0	3	0	0	1-0 	1	0	0	\N	\N	1	\N	6.59999999999999964
113	4	2015-10-18	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
114	4	2015-10-18	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	0	0	0	8-7 	8	7	0	\N	\N	\N	\N	0.100000000000000006
115	4	2015-10-18	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
116	4	2015-10-18	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0
117	4	2015-10-18	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
118	4	2015-10-18	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0
119	4	2015-10-18	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
120	4	2015-10-18	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	4	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982
121	4	2015-10-18	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	3	0	0	2-0 	2	0	0	\N	\N	\N	\N	1.69999999999999996
122	4	2015-10-18	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	2	0	0	0	6-7 	6	7	0	\N	\N	\N	\N	0.400000000000000022
123	4	2015-10-18	NYR	8	NYR8	Sydney Kidd 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
124	4	2015-10-18	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
125	4	2015-10-18	NYR	2	NYR2	Amber Moore 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
126	4	2015-10-18	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
127	4	2015-10-18	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
128	4	2015-10-18	NYR	14	NYR14	Madison Packer 	F 	0	0	0	4	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.89999999999999991
129	4	2015-10-18	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
130	4	2015-10-18	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	4	0	0	4-8 	4	8	0	\N	\N	\N	\N	1.60000000000000009
131	5	2015-10-25	BOS	14	BOS14	Brianna Decker 	F 	3	0	3	4	7	1	0	13-6 	13	6	0	\N	\N	1	\N	18.6999999999999993
132	5	2015-10-25	BOS	19	BOS19	Gigi Marvin 	D 	1	0	1	0	4	1	0	0-1 	0	1	1	\N	\N	\N	\N	11.4000000000000004
133	5	2015-10-25	BOS	21	BOS21	Hilary Knight 	F 	0	1	1	0	6	0	0	15-9 	15	9	0	\N	\N	\N	\N	5.59999999999999964
134	5	2015-10-25	BOS	23	BOS23	Corinne Buie 	F 	0	1	1	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009
135	5	2015-10-25	BOS	91	BOS91	Rachel Llanes 	F 	0	1	1	0	6	0	0	3-3 	3	3	0	\N	\N	\N	\N	5
136	5	2015-10-25	BOS	22	BOS22	Kacey Bellamy 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
137	5	2015-10-25	BOS	15	BOS15	Emily Field 	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
138	5	2015-10-25	BOS	11	BOS11	Jordan Smelker 	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
139	5	2015-10-25	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
140	5	2015-10-25	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
141	5	2015-10-25	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	2	5	0	0	10-6 	10	6	0	\N	\N	\N	\N	3.39999999999999991
142	5	2015-10-25	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
143	5	2015-10-25	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
144	5	2015-10-25	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
145	5	2015-10-25	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
146	5	2015-10-25	BUF	3	BUF3	Kelley Steadman 	F 	2	0	2	2	11	0	1	0-0 	0	0	0	\N	1	\N	\N	17
147	5	2015-10-25	BUF	36	BUF36	Kourtney Kunichika 	F 	1	1	2	2	3	1	0	3-10 	3	10	0	\N	\N	\N	\N	7.79999999999999982
148	5	2015-10-25	BUF	10	BUF10	Meghan Duggan 	F 	0	1	1	2	4	0	0	7-6 	7	6	0	\N	\N	\N	\N	4.59999999999999964
149	5	2015-10-25	BUF	9	BUF9	Megan Bozek 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
150	5	2015-10-25	BUF	13	BUF13	Shelby Bram 	F 	0	1	1	0	4	0	0	10-13 	10	13	0	\N	\N	\N	\N	3.70000000000000018
151	5	2015-10-25	BUF	7	BUF7	Emily Pfalzer 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
152	5	2015-10-25	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	2-2 	2	2	0	1	\N	\N	\N	3
153	5	2015-10-25	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	1	0	0	4-12 	4	12	0	\N	\N	\N	\N	-0.299999999999999989
154	5	2015-10-25	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
155	5	2015-10-25	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
156	5	2015-10-25	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
157	5	2015-10-25	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
158	5	2015-10-25	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
159	5	2015-10-25	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
160	5	2015-10-25	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
161	6	2015-10-25	CON	56	CON56	Jessica Koizumi 	F 	0	1	1	0	3	0	0	2-2 	2	2	0	\N	\N	\N	\N	3.5
162	6	2015-10-25	CON	61	CON61	Kelli Stack 	F 	0	1	1	2	4	0	0	6-6 	6	6	0	\N	\N	\N	\N	4.5
163	6	2015-10-25	CON	88	CON88	Alyssa Wohlfeiler 	F 	1	0	1	0	3	1	0	2-0 	2	0	0	\N	\N	\N	\N	6.20000000000000018
164	6	2015-10-25	CON	13	CON13	Kaleigh Fratkin 	D 	1	0	1	2	1	1	0	0-0 	0	0	1	1	\N	\N	\N	13.5
165	6	2015-10-25	CON	22	CON22	Danielle Ward 	F 	0	1	1	0	0	0	0	6-1 	6	1	0	\N	\N	\N	\N	2.5
166	6	2015-10-25	CON	8	CON8	Kelly Babstock 	F 	1	0	1	0	3	0	0	11-3 	11	3	0	\N	\N	\N	\N	6.29999999999999982
167	6	2015-10-25	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
168	6	2015-10-25	CON	28	CON28	Sam Faber 	F 	0	0	0	4	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1.5
169	6	2015-10-25	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
170	6	2015-10-25	CON	4	CON4	Anya Battaglino 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
171	6	2015-10-25	CON	27	CON27	Shiann Darkangelo 	F 	0	0	0	0	2	0	0	2-4 	2	4	0	\N	\N	\N	\N	0.800000000000000044
172	6	2015-10-25	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
173	6	2015-10-25	CON	16	CON16	Micaela Long 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
174	6	2015-10-25	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
175	6	2015-10-25	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	2	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978
176	6	2015-10-25	CON	1	CON1	Breann Frykas 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
177	6	2015-10-25	CON	10	CON10	Lindsay Berman 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
178	6	2015-10-25	NYR	18	NYR18	Meghan Fardelmann 	F 	0	1	1	0	1	0	0	1-5 	1	5	0	\N	\N	\N	\N	2.10000000000000009
179	6	2015-10-25	NYR	12	NYR12	Janine Weber 	F 	0	1	1	2	2	0	0	4-4 	4	4	0	\N	\N	\N	\N	3.5
180	6	2015-10-25	NYR	10	NYR10	Ashley Johnston 	D 	1	0	1	0	2	1	0	0-0 	0	0	0	\N	\N	1	\N	6.5
181	6	2015-10-25	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
182	6	2015-10-25	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
183	6	2015-10-25	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
184	6	2015-10-25	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	1	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.299999999999999989
185	6	2015-10-25	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
186	6	2015-10-25	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	4	0	0	9-16 	9	16	0	\N	\N	\N	\N	1.30000000000000004
187	6	2015-10-25	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
188	6	2015-10-25	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022
189	6	2015-10-25	NYR	8	NYR8	Sydney Kidd 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
190	6	2015-10-25	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
191	6	2015-10-25	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
192	6	2015-10-25	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	4	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
193	6	2015-10-25	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
194	6	2015-10-25	NYR	14	NYR14	Madison Packer 	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
195	6	2015-10-25	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
196	6	2015-10-25	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
197	7	2015-11-15	CON	56	CON56	Jessica Koizumi 	F 	0	1	1	0	2	0	0	2-3 	2	3	0	\N	\N	\N	\N	2.89999999999999991
198	7	2015-11-15	CON	22	CON22	Danielle Ward 	F 	1	0	1	2	2	0	0	4-4 	4	4	1	\N	\N	\N	\N	10.5
199	7	2015-11-15	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
200	7	2015-11-15	CON	61	CON61	Kelli Stack 	F 	1	0	1	2	4	0	0	15-8 	15	8	0	\N	\N	\N	\N	7.20000000000000018
201	7	2015-11-15	CON	16	CON16	Micaela Long 	F 	0	1	1	0	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	4.09999999999999964
202	7	2015-11-15	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	1	1	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	2.29999999999999982
203	7	2015-11-15	CON	8	CON8	Kelly Babstock 	F 	1	0	1	6	4	0	1	10-6 	10	6	0	\N	\N	\N	\N	8.90000000000000036
204	7	2015-11-15	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
205	7	2015-11-15	CON	28	CON28	Sam Faber 	F 	0	0	0	2	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0.5
206	7	2015-11-15	CON	9	CON9	Molly Engstrom 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
207	7	2015-11-15	CON	6	CON6	Shannon Doyle 	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
208	7	2015-11-15	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
209	7	2015-11-15	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009
210	7	2015-11-15	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
211	7	2015-11-15	CON	27	CON27	Shiann Darkangelo 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
212	7	2015-11-15	BUF	24	BUF24	Hailey Browne 	F 	0	1	1	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991
213	7	2015-11-15	BUF	21	BUF21	Devon Skeats 	F 	1	0	1	4	1	0	0	0-0 	0	0	0	\N	1	\N	\N	7.5
214	7	2015-11-15	BUF	13	BUF13	Shelby Bram 	F 	0	1	1	0	4	0	0	11-7 	11	7	0	\N	\N	\N	\N	4.40000000000000036
215	7	2015-11-15	BUF	36	BUF36	Kourtney Kunichika 	F 	1	0	1	0	3	0	0	4-12 	4	12	0	\N	\N	1	\N	5.70000000000000018
216	7	2015-11-15	BUF	6	BUF6	Jessica Fickel 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
217	7	2015-11-15	BUF	2	BUF2	Paige Harrington 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
218	7	2015-11-15	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
219	7	2015-11-15	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
220	7	2015-11-15	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	5	0	0	0-3 	0	3	0	\N	\N	\N	\N	2.20000000000000018
221	7	2015-11-15	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
222	7	2015-11-15	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
223	7	2015-11-15	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
224	7	2015-11-15	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	2	5	0	0	10-4	10	4	0	\N	\N	\N	\N	3.60000000000000009
225	7	2015-11-15	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
226	7	2015-11-15	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	0	0	0	1-2 	1	2	0	\N	\N	\N	\N	-0.100000000000000006
227	8	2015-11-15	BOS	21	BOS21	Hilary Knight 	F 	1	1	2	0	16	0	0	5-5 	5	5	0	\N	\N	1	\N	15
228	8	2015-11-15	BOS	19	BOS19	Gigi Marvin 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
229	8	2015-11-15	BOS	22	BOS22	Kacey Bellamy 	D 	1	0	1	0	8	1	0	0-0 	0	0	0	\N	\N	\N	\N	8.5
230	8	2015-11-15	BOS	15	BOS15	Emily Field 	F 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
231	8	2015-11-15	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
232	8	2015-11-15	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	2	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
233	8	2015-11-15	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	4	1	0	0	2-3 	2	3	0	\N	\N	\N	\N	1.39999999999999991
234	8	2015-11-15	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
235	8	2015-11-15	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	2	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991
236	8	2015-11-15	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
237	8	2015-11-15	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	2	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1
238	8	2015-11-15	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
239	8	2015-11-15	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
240	8	2015-11-15	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
241	8	2015-11-15	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
242	8	2015-11-15	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	0	4	0	0	1-1 	1	1	0	\N	\N	\N	\N	2
243	8	2015-11-15	BOS	14	BOS14	Brianna Decker 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
244	8	2015-11-15	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
245	8	2015-11-15	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
246	8	2015-11-15	NYR	10	NYR10	Ashley Johnston 	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
247	8	2015-11-15	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	1	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
248	8	2015-11-15	NYR	14	NYR14	Madison Packer 	F 	1	0	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
249	8	2015-11-15	NYR	20	NYR20	Brooke Ammerman 	F 	0	1	1	0	4	0	0	3-2 	3	2	0	\N	\N	\N	\N	4.09999999999999964
250	8	2015-11-15	NYR	28	NYR28	Beth Hanrahan 	F 	1	0	1	2	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036
251	8	2015-11-15	NYR	17	NYR17	Bray Ketchum 	F 	1	0	1	0	4	1	0	0-1 	0	1	1	\N	1	\N	\N	13.4000000000000004
252	8	2015-11-15	NYR	2	NYR2	Amber Moore 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
253	8	2015-11-15	NYR	8	NYR8	Sydney Kidd 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
254	8	2015-11-15	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
255	8	2015-11-15	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	4	2	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982
256	8	2015-11-15	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
257	8	2015-11-15	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
258	8	2015-11-15	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
259	8	2015-11-15	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
260	8	2015-11-15	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	2	0	0	3-2 	3	2	0	\N	\N	\N	\N	1.10000000000000009
261	8	2015-11-15	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	2	0	0	4-2 	4	2	0	\N	\N	\N	\N	1.19999999999999996
262	8	2015-11-15	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
263	8	2015-11-15	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
264	8	2015-11-15	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	6	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
265	9	2015-11-22	NYR	20	NYR20	Brooke Ammerman 	F 	1	0	1	0	3	0	0	3-6 	3	6	0	\N	\N	\N	\N	5.20000000000000018
266	9	2015-11-22	NYR	12	NYR12	Janine Weber 	F 	0	1	1	2	1	0	0	4-9 	4	9	0	\N	\N	\N	\N	2.5
267	9	2015-11-22	NYR	10	NYR10	Ashley Johnston 	D 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
268	9	2015-11-22	NYR	18	NYR18	Meghan Fardelmann 	F 	1	0	1	2	4	0	0	5-6 	5	6	1	\N	1	\N	\N	13.4000000000000004
269	9	2015-11-22	NYR	91	NYR91	Taylor Holze 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
270	9	2015-11-22	NYR	14	NYR14	Madison Packer 	F 	1	0	1	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036
271	9	2015-11-22	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
272	9	2015-11-22	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
273	9	2015-11-22	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
274	9	2015-11-22	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
275	9	2015-11-22	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	0	0	0	5-13 	5	13	0	\N	\N	\N	\N	-0.299999999999999989
276	9	2015-11-22	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
277	9	2015-11-22	NYR	8	NYR8	Sydney Kidd 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
278	9	2015-11-22	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
279	9	2015-11-22	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
280	9	2015-11-22	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
281	9	2015-11-22	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
282	9	2015-11-22	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
283	9	2015-11-22	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
284	9	2015-11-22	BOS	21	BOS21	Hilary Knight 	F 	1	1	2	0	5	1	0	9-4 	9	4	0	\N	\N	1	\N	10.5
285	9	2015-11-22	BOS	22	BOS22	Kacey Bellamy 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
286	9	2015-11-22	BOS	14	BOS14	Brianna Decker 	F 	0	1	1	2	7	0	0	21-7 	21	7	0	\N	\N	\N	\N	7.40000000000000036
287	9	2015-11-22	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	2	7	1	0	2-0 	2	0	0	\N	\N	\N	\N	8.69999999999999929
288	9	2015-11-22	BOS	3	BOS3	Jillian Dempsey 	F 	0	1	1	0	5	0	0	4-1 	4	1	0	\N	\N	\N	\N	4.79999999999999982
289	9	2015-11-22	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
290	9	2015-11-22	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
291	9	2015-11-22	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
292	9	2015-11-22	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	1	0	0	3-3 	3	3	0	\N	\N	\N	\N	0.5
293	9	2015-11-22	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
294	9	2015-11-22	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
295	9	2015-11-22	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
296	9	2015-11-22	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
297	9	2015-11-22	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
298	9	2015-11-22	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
299	9	2015-11-22	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
300	9	2015-11-22	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009
301	9	2015-11-22	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
302	9	2015-11-22	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
303	10	2015-11-22	CON	13	CON13	Kaleigh Fratkin 	D 	2	2	4	2	4	2	0	0-0 	0	0	0	\N	\N	\N	\N	15.5
304	10	2015-11-22	CON	26	CON26	Jordan Brickner 	D 	0	3	3	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
305	10	2015-11-22	CON	8	CON8	Kelly Babstock 	F 	1	1	2	0	2	1	0	10-5 	10	5	0	\N	\N	\N	1	13
306	10	2015-11-22	CON	56	CON56	Jessica Koizumi 	F 	1	1	2	0	2	1	0	0-0 	0	0	0	\N	\N	\N	\N	7.5
307	10	2015-11-22	CON	27	CON27	Shiann Darkangelo 	F 	1	0	1	0	4	0	0	3-1 	3	1	0	\N	\N	\N	\N	6.20000000000000018
308	10	2015-11-22	CON	28	CON28	Sam Faber 	F 	1	0	1	2	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	5.59999999999999964
309	10	2015-11-22	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
310	10	2015-11-22	CON	61	CON61	Kelli Stack 	F 	0	1	1	0	3	0	0	18-12 	18	12	0	\N	\N	\N	\N	4.09999999999999964
311	10	2015-11-22	CON	22	CON22	Danielle Ward 	F 	0	1	1	4	1	0	0	5-5 	5	5	0	\N	\N	\N	\N	3.5
312	10	2015-11-22	CON	6	CON6	Shannon Doyle 	D 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
313	10	2015-11-22	CON	16	CON16	Micaela Long 	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
314	10	2015-11-22	CON	5	CON5	Felicia Vieweg 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
315	10	2015-11-22	CON	4	CON4	Anya Battaglino 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
316	10	2015-11-22	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
317	10	2015-11-22	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
318	10	2015-11-22	CON	3	CON3	Mary Rose Morrison 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
319	10	2015-11-22	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	6	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
320	10	2015-11-22	BUF	7	BUF7	Emily Pfalzer 	D 	0	4	4	0	5	0	0	0-0 	0	0	0	\N	1	\N	\N	12.5
321	10	2015-11-22	BUF	3	BUF3	Kelley Steadman 	F 	2	2	4	0	7	1	1	2-1 	2	1	0	\N	\N	1	\N	18.1000000000000014
322	10	2015-11-22	BUF	10	BUF10	Meghan Duggan 	F 	1	2	3	0	1	0	0	9-10 	9	10	0	\N	\N	\N	\N	8.40000000000000036
323	10	2015-11-22	BUF	36	BUF36	Kourtney Kunichika 	F 	2	0	2	0	4	2	0	3-14 	3	14	0	\N	\N	\N	1	14.9000000000000004
324	10	2015-11-22	BUF	14	BUF14	Kelly Mcdonald 	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
325	10	2015-11-22	BUF	13	BUF13	Shelby Bram 	F 	0	2	2	0	1	0	0	7-8 	7	8	0	\N	\N	\N	\N	4.40000000000000036
326	10	2015-11-22	BUF	77	BUF77	Hayley Williams 	F 	1	0	1	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
327	10	2015-11-22	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
328	10	2015-11-22	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
329	10	2015-11-22	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
330	10	2015-11-22	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
331	10	2015-11-22	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
332	10	2015-11-22	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-2 	0	2	0	\N	\N	\N	\N	-0.200000000000000011
333	10	2015-11-22	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
334	10	2015-11-22	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	5	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.25
335	11	2015-11-29	CON	27	CON27	Shiann Darkangelo 	F 	2	0	2	0	3	0	0	2-2 	2	2	0	1	\N	\N	\N	12.5
336	11	2015-11-29	CON	8	CON8	Kelly Babstock 	F 	0	2	2	2	2	0	0	7-5 	7	5	0	\N	\N	\N	\N	5.70000000000000018
337	11	2015-11-29	CON	6	CON6	Shannon Doyle 	D 	1	1	2	2	1	1	0	0-0 	0	0	0	\N	1	\N	\N	9.5
338	11	2015-11-29	CON	17	CON17	Yekaterina Smolentseva 	F 	0	1	1	0	0	0	0	2-8 	2	8	0	\N	\N	\N	\N	1.39999999999999991
339	11	2015-11-29	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
340	11	2015-11-29	CON	9	CON9	Molly Engstrom 	D 	1	0	1	0	1	0	0	0-0 	0	0	1	\N	\N	\N	\N	9.5
341	11	2015-11-29	CON	5	CON5	Kate Buesser 	F 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
342	11	2015-11-29	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
343	11	2015-11-29	CON	61	CON61	Kelli Stack 	F 	0	0	0	2	3	0	0	12-11 	12	11	0	\N	\N	\N	\N	2.10000000000000009
344	11	2015-11-29	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
345	11	2015-11-29	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	2	3	0	0	1-0 	1	\N	0	\N	\N	\N	\N	2.10000000000000009
346	11	2015-11-29	CON	22	CON22	Danielle Ward 	F 	0	0	0	0	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	0.5
347	11	2015-11-29	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
348	11	2015-11-29	CON	16	CON16	Micaela Long 	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989
349	11	2015-11-29	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
350	11	2015-11-29	CON	28	CON28	Sam Faber 	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
351	11	2015-11-29	BOS	22	BOS22	Kacey Bellamy 	D 	1	1	2	0	4	1	0	0-0 	0	0	0	\N	\N	1	\N	9.5
352	11	2015-11-29	BOS	14	BOS14	Brianna Decker 	F 	0	2	2	6	9	0	0	13-6 	13	6	0	\N	\N	\N	\N	10.6999999999999993
353	11	2015-11-29	BOS	19	BOS19	Gigi Marvin 	D 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
354	11	2015-11-29	BOS	91	BOS91	Rachel Llanes 	F 	1	0	1	0	3	0	0	6-10 	6	10	0	\N	\N	\N	\N	5.09999999999999964
355	11	2015-11-29	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	0	4	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
356	11	2015-11-29	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
357	11	2015-11-29	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	3	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.60000000000000009
358	11	2015-11-29	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
359	11	2015-11-29	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
360	11	2015-11-29	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	0	1	0	0	5-4 	5	4	0	\N	\N	\N	\N	0.599999999999999978
361	11	2015-11-29	BOS	21	BOS21	Hilary Knight 	F 	0	0	0	0	5	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.39999999999999991
362	11	2015-11-29	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
363	11	2015-11-29	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
364	11	2015-11-29	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
365	11	2015-11-29	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
366	11	2015-11-29	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
367	12	2015-11-29	BUF	21	BUF21	Devon Skeats 	F 	2	0	2	0	6	0	0	0-0 	0	0	1	1	\N	\N	\N	19
368	12	2015-11-29	BUF	24	BUF24	Hailey Browne 	F 	1	0	1	0	9	0	0	1-0 	1	\N	0	\N	\N	\N	\N	8.59999999999999964
369	12	2015-11-29	BUF	36	BUF36	Kourtney Kunichika 	F 	0	1	1	2	0	0	0	11-4 	11	4	0	\N	\N	\N	\N	3.20000000000000018
370	12	2015-11-29	BUF	9	BUF9	Megan Bozek 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
371	12	2015-11-29	BUF	14	BUF14	Kelly Mcdonald 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
372	12	2015-11-29	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
373	12	2015-11-29	BUF	3	BUF3	Kelley Steadman 	F 	0	0	0	0	8	0	0	1-0 	1	\N	0	\N	\N	\N	\N	4.09999999999999964
374	12	2015-11-29	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
375	12	2015-11-29	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	0	0	0	3-4 	3	4	0	\N	\N	\N	\N	-0.100000000000000006
376	12	2015-11-29	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	2	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.800000000000000044
377	12	2015-11-29	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
378	12	2015-11-29	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
379	12	2015-11-29	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	2	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
380	12	2015-11-29	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
381	12	2015-11-29	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
382	12	2015-11-29	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	1	0	0	13-7 	13	7	0	\N	\N	\N	\N	1.10000000000000009
383	12	2015-11-29	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	1.10000000000000009
384	12	2015-11-29	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
385	12	2015-11-29	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
386	12	2015-11-29	NYR	14	NYR14	Madison Packer 	F 	1	0	1	0	4	0	0	2-5 	2	5	0	\N	\N	1	\N	6.70000000000000018
387	12	2015-11-29	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	6	0	0	0	6-9 	6	9	0	\N	\N	\N	\N	1.19999999999999996
388	12	2015-11-29	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
389	12	2015-11-29	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
390	12	2015-11-29	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
391	12	2015-11-29	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022
392	12	2015-11-29	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5
393	12	2015-11-29	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	2	6	0	0	0-2 	0	2	0	\N	\N	\N	\N	3.29999999999999982
394	12	2015-11-29	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
395	12	2015-11-29	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
396	12	2015-11-29	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
397	12	2015-11-29	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	5	0	0	2-1 	2	1	0	\N	\N	\N	\N	2.60000000000000009
398	12	2015-11-29	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
399	12	2015-11-29	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	7	0	0	6-9 	6	9	0	\N	\N	\N	\N	3.20000000000000018
400	12	2015-11-29	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
401	13	2015-12-05	BUF	36	BUF36	Kourtney Kunichika 	F 	1	3	4	0	2	0	0	6-19 	6	19	0	\N	\N	\N	\N	9.69999999999999929
402	13	2015-12-05	BUF	21	BUF21	Devon Skeats 	F 	3	1	4	2	7	1	0	0-0 	0	0	0	\N	\N	\N	\N	18.5
403	13	2015-12-05	BUF	24	BUF24	Hailey Browne 	F 	1	3	4	2	5	1	0	1-2 	1	2	0	\N	\N	\N	\N	13.4000000000000004
404	13	2015-12-05	BUF	9	BUF9	Megan Bozek 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
405	13	2015-12-05	BUF	13	BUF13	Shelby Bram 	F 	0	1	1	0	1	0	0	5-14 	5	14	0	\N	\N	\N	\N	1.60000000000000009
406	13	2015-12-05	BUF	7	BUF7	Emily Pfalzer 	D 	1	0	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
407	13	2015-12-05	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	0	0	0	7-9 	7	9	0	\N	\N	\N	\N	-0.200000000000000011
408	13	2015-12-05	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
409	13	2015-12-05	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
410	13	2015-12-05	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
411	13	2015-12-05	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
412	13	2015-12-05	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
413	13	2015-12-05	BUF	3	BUF3	Kelley Steadman 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
414	13	2015-12-05	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
415	13	2015-12-05	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
416	13	2015-12-05	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
417	13	2015-12-05	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
418	13	2015-12-05	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
419	13	2015-12-05	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
420	13	2015-12-05	BOS	91	BOS91	Rachel Llanes 	F 	1	2	3	0	4	0	0	9-8 	9	8	1	\N	\N	\N	\N	15.0999999999999996
421	13	2015-12-05	BOS	21	BOS21	Hilary Knight 	F 	1	2	3	2	5	0	0	21-3 	21	3	0	\N	\N	\N	\N	12.8000000000000007
422	13	2015-12-05	BOS	5	BOS5	Kelly Cooke 	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
423	13	2015-12-05	BOS	3	BOS3	Jillian Dempsey 	F 	2	0	2	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	10.5
424	13	2015-12-05	BOS	15	BOS15	Emily Field 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
425	13	2015-12-05	BOS	22	BOS22	Kacey Bellamy 	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
426	13	2015-12-05	BOS	14	BOS14	Brianna Decker 	F 	0	1	1	2	6	0	0	14-7 	14	7	0	\N	\N	\N	\N	6.20000000000000018
427	13	2015-12-05	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
428	13	2015-12-05	BOS	10	BOS10	Blake Bolden 	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
429	13	2015-12-05	BOS	11	BOS11	Jordan Smelker 	F 	1	0	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
430	13	2015-12-05	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
431	13	2015-12-05	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
432	13	2015-12-05	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
433	13	2015-12-05	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
434	13	2015-12-05	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
435	13	2015-12-05	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
436	13	2015-12-05	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
437	13	2015-12-05	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
438	13	2015-12-05	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
439	14	2015-12-06	NYR	12	NYR12	Janine Weber 	F 	0	1	1	0	2	0	0	0-4 	0	4	0	\N	\N	\N	\N	2.60000000000000009
440	14	2015-12-06	NYR	10	NYR10	Ashley Johnston 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
441	14	2015-12-06	NYR	18	NYR18	Meghan Fardelmann 	F 	1	0	1	0	3	0	0	2-5 	2	5	0	\N	\N	\N	\N	5.20000000000000018
442	14	2015-12-06	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
443	14	2015-12-06	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	1	0	0	3-12 	3	12	0	\N	\N	\N	\N	0.100000000000000006
444	14	2015-12-06	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
445	14	2015-12-06	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
446	14	2015-12-06	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
447	14	2015-12-06	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	3	0	0	4-16 	4	16	0	\N	\N	\N	\N	0.299999999999999989
448	14	2015-12-06	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
449	14	2015-12-06	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	3	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.30000000000000004
450	14	2015-12-06	NYR	14	NYR14	Madison Packer 	F 	0	0	0	0	3	0	0	2-4 	2	4	0	\N	\N	\N	\N	1.30000000000000004
451	14	2015-12-06	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
452	14	2015-12-06	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
453	14	2015-12-06	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5
454	14	2015-12-06	BOS	21	BOS21	Hilary Knight 	F 	2	0	2	2	9	0	0	11-3 	11	3	1	\N	\N	\N	\N	18.8000000000000007
455	14	2015-12-06	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	0	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	5.09999999999999964
456	14	2015-12-06	BOS	23	BOS23	Corinne Buie 	F 	0	1	1	0	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	2.5
457	14	2015-12-06	BOS	10	BOS10	Blake Bolden 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
458	14	2015-12-06	BOS	19	BOS19	Gigi Marvin 	D 	0	1	1	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
459	14	2015-12-06	BOS	3	BOS3	Jillian Dempsey 	F 	1	0	1	0	2	0	0	4-0 	4	0	0	\N	\N	\N	\N	5.40000000000000036
460	14	2015-12-06	BOS	14	BOS14	Brianna Decker 	F 	0	1	1	0	8	0	0	17-3 	17	3	0	\N	\N	\N	\N	7.40000000000000036
461	14	2015-12-06	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	2	1	0	0	11-5 	11	5	0	\N	\N	\N	\N	1.60000000000000009
462	14	2015-12-06	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	2	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.10000000000000009
463	14	2015-12-06	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
464	14	2015-12-06	BOS	15	BOS15	Emily Field 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
465	14	2015-12-06	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
466	14	2015-12-06	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
467	14	2015-12-06	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
468	14	2015-12-06	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
469	15	2015-12-06	BUF	13	BUF13	Shelby Bram 	F 	1	0	1	0	3	1	0	9-6 	9	6	0	\N	\N	\N	\N	6.29999999999999982
470	15	2015-12-06	BUF	20	BUF20	Erin Zach 	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
471	15	2015-12-06	BUF	36	BUF36	Kourtney Kunichika 	F 	0	1	1	0	3	0	0	4-15 	4	15	0	\N	\N	\N	1	7.40000000000000036
472	15	2015-12-06	BUF	10	BUF10	Meghan Duggan 	F 	1	0	1	0	2	0	0	3-1 	3	1	0	\N	\N	\N	\N	5.20000000000000018
473	15	2015-12-06	BUF	14	BUF14	Kelly Mcdonald 	D 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
474	15	2015-12-06	BUF	7	BUF7	Emily Pfalzer 	D 	0	1	1	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
475	15	2015-12-06	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
476	15	2015-12-06	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
477	15	2015-12-06	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	2	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.800000000000000044
478	15	2015-12-06	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	4	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009
479	15	2015-12-06	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
480	15	2015-12-06	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009
481	15	2015-12-06	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006
482	15	2015-12-06	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
483	15	2015-12-06	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
484	15	2015-12-06	CON	28	CON28	Sam Faber 	F 	1	1	2	2	2	1	0	0-0 	0	0	0	\N	1	\N	\N	10
485	15	2015-12-06	CON	27	CON27	Shiann Darkangelo 	F 	0	1	1	0	2	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.89999999999999991
486	15	2015-12-06	CON	13	CON13	Kaleigh Fratkin 	D 	1	0	1	4	2	0	0	0-0 	0	0	0	1	\N	\N	\N	9
487	15	2015-12-06	CON	61	CON61	Kelli Stack 	F 	0	0	0	0	2	0	0	19-6 	19	6	0	\N	\N	\N	1	7.29999999999999982
488	15	2015-12-06	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989
489	15	2015-12-06	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
490	15	2015-12-06	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
491	15	2015-12-06	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	1	6.5
492	15	2015-12-06	CON	8	CON8	Kelly Babstock 	F 	0	0	0	0	1	0	0	3-5 	3	5	0	\N	\N	\N	1	5.29999999999999982
493	15	2015-12-06	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
494	15	2015-12-06	CON	9	CON9	Molly Engstrom 	D 	0	0	0	15	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.75
495	15	2015-12-06	CON	16	CON16	Micaela Long 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
496	15	2015-12-06	CON	22	CON22	Danielle Ward 	F 	0	0	0	4	1	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.30000000000000004
497	15	2015-12-06	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
498	15	2015-12-06	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
499	16	2015-12-13	CON	27	CON27	Shiann Darkangelo 	F 	2	0	2	0	8	0	0	3-3 	3	3	0	\N	1	\N	\N	14
500	16	2015-12-13	CON	8	CON8	Kelly Babstock 	F 	0	2	2	2	5	0	0	12-7 	12	7	0	\N	\N	\N	\N	7.5
501	16	2015-12-13	CON	61	CON61	Kelli Stack 	F 	0	2	2	0	4	0	0	15-10 	15	10	0	1	\N	\N	1	14.5
502	16	2015-12-13	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
503	16	2015-12-13	CON	17	CON17	Yekaterina Smolentseva 	F 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
504	16	2015-12-13	CON	22	CON22	Danielle Ward 	F 	0	1	1	0	2	0	0	8-5 	8	5	0	\N	\N	\N	\N	3.29999999999999982
505	16	2015-12-13	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
506	16	2015-12-13	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
507	16	2015-12-13	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
508	16	2015-12-13	CON	28	CON28	Sam Faber 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
509	16	2015-12-13	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
510	16	2015-12-13	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	2	0	0	4-2 	4	2	0	\N	\N	\N	\N	1.19999999999999996
511	16	2015-12-13	CON	16	CON16	Micaela Long 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
512	16	2015-12-13	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
513	16	2015-12-13	NYR	17	NYR17	Bray Ketchum 	F 	2	0	2	0	6	0	0	1-3 	1	3	0	\N	\N	1	\N	11.8000000000000007
514	16	2015-12-13	NYR	11	NYR11	Morgan Fritz-Ward 	F 	1	0	1	0	5	1	0	0-0 	0	0	0	\N	\N	\N	\N	7
515	16	2015-12-13	NYR	12	NYR12	Janine Weber 	F 	0	1	1	0	1	0	0	7-14 	7	14	0	\N	\N	\N	\N	1.80000000000000004
516	16	2015-12-13	NYR	20	NYR20	Brooke Ammerman 	F 	0	1	1	0	2	0	0	6-3 	6	3	0	\N	\N	\N	\N	3.29999999999999982
517	16	2015-12-13	NYR	26	NYR26	Kira Dosdall 	D 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
518	16	2015-12-13	NYR	8	NYR8	Sydney Kidd 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
519	16	2015-12-13	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989
520	16	2015-12-13	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
521	16	2015-12-13	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	3	0	0	4-14 	4	14	0	\N	\N	\N	\N	0.5
522	16	2015-12-13	NYR	14	NYR14	Madison Packer 	F 	0	0	0	4	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009
523	16	2015-12-13	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
524	16	2015-12-13	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
525	16	2015-12-13	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	2	1	0	0	8-5 	8	5	0	\N	\N	\N	\N	1.30000000000000004
526	16	2015-12-13	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
527	16	2015-12-13	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
528	17	2015-12-20	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
529	17	2015-12-20	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
530	17	2015-12-20	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
531	17	2015-12-20	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978
532	17	2015-12-20	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
533	17	2015-12-20	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	1	0	0	7-9 	7	9	0	\N	\N	\N	\N	0.299999999999999989
534	17	2015-12-20	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006
535	17	2015-12-20	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	3	0	0	6-8 	6	8	0	\N	\N	\N	\N	1.30000000000000004
536	17	2015-12-20	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
537	17	2015-12-20	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
538	17	2015-12-20	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
539	17	2015-12-20	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
540	17	2015-12-20	BUF	3	BUF3	Kelley Steadman 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
541	17	2015-12-20	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
542	17	2015-12-20	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
543	17	2015-12-20	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
544	17	2015-12-20	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	2	0	0	6-10 	6	10	0	\N	\N	\N	\N	0.599999999999999978
545	17	2015-12-20	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
546	17	2015-12-20	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	0	3	0	0	1-6 	1	6	0	\N	\N	\N	\N	1
547	17	2015-12-20	BOS	11	BOS11	Jordan Smelker 	F 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
548	17	2015-12-20	BOS	21	BOS21	Hilary Knight 	F 	1	0	1	0	13	0	0	11-8 	11	8	1	1	\N	\N	\N	18.8000000000000007
549	17	2015-12-20	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
550	17	2015-12-20	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
551	17	2015-12-20	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
552	17	2015-12-20	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	2	3	0	0	8-5 	8	5	0	\N	\N	\N	\N	2.29999999999999982
553	17	2015-12-20	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
554	17	2015-12-20	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
555	17	2015-12-20	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
556	17	2015-12-20	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
557	17	2015-12-20	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978
558	17	2015-12-20	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
559	17	2015-12-20	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
560	17	2015-12-20	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
561	17	2015-12-20	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
562	17	2015-12-20	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
563	17	2015-12-20	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
564	17	2015-12-20	BOS	14	BOS14	Brianna Decker 	F 	0	0	0	0	7	0	0	14-9 	14	9	0	\N	\N	\N	\N	4
565	17	2015-12-20	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
566	18	2015-12-27	NYR	12	NYR12	Janine Weber 	F 	2	1	3	0	8	0	0	8-5 	8	5	0	\N	\N	1	\N	15.3000000000000007
567	18	2015-12-27	NYR	9	NYR9	Liudmila Belyakova 	F 	2	1	3	0	4	0	0	7-11 	7	11	1	\N	\N	\N	\N	16.6000000000000014
568	18	2015-12-27	NYR	18	NYR18	Meghan Fardelmann 	F 	3	0	3	2	5	0	0	2-1 	2	1	0	\N	1	\N	\N	17.1000000000000014
569	18	2015-12-27	NYR	8	NYR8	Sydney Kidd 	D 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
570	18	2015-12-27	NYR	24	NYR24	Celeste Brown 	F 	0	1	1	0	3	0	0	9-8 	9	8	0	\N	\N	\N	\N	3.60000000000000009
571	18	2015-12-27	NYR	14	NYR14	Madison Packer 	F 	0	1	1	2	3	0	0	0-3 	0	3	0	\N	\N	\N	\N	3.70000000000000018
572	18	2015-12-27	NYR	17	NYR17	Bray Ketchum 	F 	0	1	1	2	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	4.59999999999999964
573	18	2015-12-27	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	1	1	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009
574	18	2015-12-27	NYR	10	NYR10	Ashley Johnston 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
575	18	2015-12-27	NYR	4	NYR4	Elena Orlando 	D 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
576	18	2015-12-27	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
577	18	2015-12-27	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
578	18	2015-12-27	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
579	18	2015-12-27	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
580	18	2015-12-27	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
581	18	2015-12-27	NYR	2	NYR2	Amber Moore 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
582	18	2015-12-27	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
583	18	2015-12-27	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
584	18	2015-12-27	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
585	18	2015-12-27	BUF	3	BUF3	Kelley Steadman 	F 	1	1	2	2	5	1	0	3-1 	3	1	0	1	\N	\N	\N	12.6999999999999993
586	18	2015-12-27	BUF	36	BUF36	Kourtney Kunichika 	F 	1	0	1	0	5	0	1	13-10 	13	10	0	\N	\N	\N	\N	7.79999999999999982
587	18	2015-12-27	BUF	21	BUF21	Devon Skeats 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
588	18	2015-12-27	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
589	18	2015-12-27	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
590	18	2015-12-27	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5
591	18	2015-12-27	BUF	43	BUF43	Tatiana Rafter 	F	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
592	18	2015-12-27	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	5	0	0	2-1 	2	1	0	\N	\N	\N	\N	3.10000000000000009
593	18	2015-12-27	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
594	18	2015-12-27	BUF	9	BUF9	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
595	18	2015-12-27	BUF	6	BUF6	Jessica Fickel 	F	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
596	18	2015-12-27	BUF	12	BUF12	Hannah McGowan 	F	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
597	18	2015-12-27	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	1	0	0	9-16 	9	16	0	\N	\N	\N	\N	-0.200000000000000011
598	18	2015-12-27	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
599	19	2015-12-27	BOS	10	BOS10	Blake Bolden 	D 	0	2	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
600	19	2015-12-27	BOS	5	BOS5	Kelly Cooke 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	1	\N	\N	7.5
601	19	2015-12-27	BOS	15	BOS15	Emily Field 	F 	1	0	1	0	5	0	0	1-2 	1	2	1	1	\N	\N	\N	14.4000000000000004
602	19	2015-12-27	BOS	3	BOS3	Jillian Dempsey 	F 	0	1	1	0	7	0	0	12-4 	12	4	0	\N	\N	\N	\N	6.29999999999999982
603	19	2015-12-27	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	7	0	0	8-12 	8	12	0	\N	\N	\N	\N	3.10000000000000009
604	19	2015-12-27	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	1	0	0	3-6 	3	6	0	\N	\N	\N	\N	0.200000000000000011
605	19	2015-12-27	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
606	19	2015-12-27	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
607	19	2015-12-27	BOS	11	BOS11	Hayley Moore 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
608	19	2015-12-27	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
609	19	2015-12-27	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
610	19	2015-12-27	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	4	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.80000000000000004
611	19	2015-12-27	CON	28	CON28	Sam Faber 	F 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
612	19	2015-12-27	CON	5	CON5	Kate Buesser 	F 	1	0	1	0	3	1	0	9-7 	9	7	0	\N	\N	1	\N	7.20000000000000018
613	19	2015-12-27	CON	56	CON56	Jessica Koizumi 	F 	0	1	1	2	4	0	0	2-1 	2	1	0	\N	\N	\N	\N	4.59999999999999964
614	19	2015-12-27	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
615	19	2015-12-27	CON	44	CON44	Katia Pashkevitch 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
616	19	2015-12-27	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009
617	19	2015-12-27	CON	22	CON22	Danielle Ward 	F 	0	0	0	2	2	0	0	5-7 	5	7	0	\N	\N	\N	\N	1.30000000000000004
618	19	2015-12-27	CON	8	CON8	Kelly Babstock 	F 	0	0	0	0	2	0	0	10-9 	10	9	0	\N	\N	\N	\N	1.10000000000000009
619	19	2015-12-27	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
620	19	2015-12-27	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
621	19	2015-12-27	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
622	19	2015-12-27	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
623	19	2015-12-27	CON	16	CON16	Micaela Long 	F 	0	0	0	0	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009
624	19	2015-12-27	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
625	20	2016-01-03	BUF	14	BUF14	Kelly Mcdonald 	D 	0	3	3	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
626	20	2016-01-03	BUF	36	BUF36	Kourtney Kunichika 	F 	0	2	2	0	1	0	0	6-10 	6	10	0	\N	\N	\N	\N	4.09999999999999964
627	20	2016-01-03	BUF	24	BUF24	Hailey Browne 	F 	2	0	2	2	4	1	1	0-3 	0	3	0	\N	\N	\N	\N	11.6999999999999993
628	20	2016-01-03	BUF	7	BUF7	Emily Pfalzer 	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
629	20	2016-01-03	BUF	21	BUF21	Devon Skeats 	F 	1	0	1	2	3	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
630	20	2016-01-03	BUF	9	BUF9	Megan Bozek 	D 	1	0	1	0	3	1	0	0-0 	0	0	1	\N	\N	\N	\N	11
631	20	2016-01-03	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	1	0	0	5-8 	5	8	0	\N	\N	\N	\N	0.200000000000000011
632	20	2016-01-03	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
633	20	2016-01-03	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
634	20	2016-01-03	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
635	20	2016-01-03	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
636	20	2016-01-03	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
637	20	2016-01-03	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
638	20	2016-01-03	BUF	3	BUF3	Kelley Steadman 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
639	20	2016-01-03	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	4	8	0	0	6-12 	6	12	0	\N	\N	\N	\N	4.40000000000000036
640	20	2016-01-03	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
641	20	2016-01-03	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
642	20	2016-01-03	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
643	20	2016-01-03	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
644	20	2016-01-03	BOS	21	BOS21	Hilary Knight 	F 	1	1	2	0	10	0	0	1-1 	1	1	0	\N	\N	\N	\N	11
645	20	2016-01-03	BOS	11	BOS11	Jordan Smelker 	F 	1	1	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7
646	20	2016-01-03	BOS	14	BOS14	Brianna Decker 	F 	1	1	2	4	9	0	0	10-8 	10	8	0	\N	\N	\N	\N	11.6999999999999993
647	20	2016-01-03	BOS	57	BOS57	Meagan Mangene 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
648	20	2016-01-03	BOS	12	BOS12	Marissa Gedman 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
649	20	2016-01-03	BOS	3	BOS3	Jillian Dempsey 	F 	0	1	1	0	3	0	0	12-4 	12	4	0	\N	\N	\N	\N	4.29999999999999982
650	20	2016-01-03	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
651	20	2016-01-03	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
652	20	2016-01-03	BOS	24	BOS24	Denna Laing 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
653	20	2016-01-03	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	2	1	0	0	11-4 	11	4	0	\N	\N	\N	\N	1.69999999999999996
654	20	2016-01-03	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
655	20	2016-01-03	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
656	20	2016-01-03	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
657	20	2016-01-03	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
658	20	2016-01-03	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
659	20	2016-01-03	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
660	20	2016-01-03	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
661	20	2016-01-03	BOS	0	BOS0	Hayley Moore 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
662	20	2016-01-03	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
663	20	2016-01-03	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
664	21	2016-01-03	CON	26	CON26	Jordan Brickner 	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
665	21	2016-01-03	CON	27	CON27	Shiann Darkangelo 	F 	2	0	2	0	4	0	1	11-0 	11	\N	1	1	\N	\N	\N	20.1000000000000014
666	21	2016-01-03	CON	61	CON61	Kelli Stack 	F 	1	1	2	0	9	0	0	19-4 	19	4	0	\N	\N	\N	\N	12
667	21	2016-01-03	CON	17	CON17	Yekaterina Smolentseva 	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
668	21	2016-01-03	CON	13	CON13	Kaleigh Fratkin 	D 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
669	21	2016-01-03	CON	8	CON8	Kelly Babstock 	F 	2	0	2	2	5	1	1	1-3 	1	3	0	\N	\N	\N	\N	12.3000000000000007
670	21	2016-01-03	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
671	21	2016-01-03	CON	6	CON6	Shannon Doyle 	D 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
672	21	2016-01-03	CON	28	CON28	Sam Faber 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
673	21	2016-01-03	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
674	21	2016-01-03	CON	22	CON22	Danielle Ward 	F 	0	0	0	2	0	0	0	6-4 	6	4	0	\N	\N	\N	\N	0.699999999999999956
675	21	2016-01-03	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
676	21	2016-01-03	CON	16	CON16	Micaela Long 	F 	0	0	0	19	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.75
677	21	2016-01-03	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	4	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
678	21	2016-01-03	NYR	26	NYR26	Kira Dosdall 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
679	21	2016-01-03	NYR	24	NYR24	Celeste Brown 	F 	0	1	1	0	1	0	0	2-7 	2	7	0	\N	\N	\N	\N	2
680	21	2016-01-03	NYR	9	NYR9	Liudmila Belyakova 	F 	1	0	1	0	10	1	0	1-7 	1	7	0	\N	\N	1	\N	9.90000000000000036
681	21	2016-01-03	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
682	21	2016-01-03	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
683	21	2016-01-03	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991
684	21	2016-01-03	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991
685	21	2016-01-03	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	3	0	0	2-3 	2	3	0	\N	\N	\N	\N	1.39999999999999991
686	21	2016-01-03	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
687	21	2016-01-03	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
688	21	2016-01-03	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	2	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
689	21	2016-01-03	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	2	3	0	0	0-3 	0	3	0	\N	\N	\N	\N	1.69999999999999996
690	21	2016-01-03	NYR	14	NYR14	Madison Packer 	F 	0	0	0	4	2	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.80000000000000004
691	21	2016-01-03	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	3	0	0	5-15 	5	15	0	\N	\N	\N	\N	0.5
692	21	2016-01-03	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
693	22	2016-01-09	NYR	20	NYR20	Brooke Ammerman 	F 	2	0	2	0	6	1	0	5-9 	5	9	0	\N	1	\N	\N	13.0999999999999996
694	22	2016-01-09	NYR	17	NYR17	Bray Ketchum 	F 	0	1	1	0	4	0	0	1-3 	1	3	0	\N	\N	\N	\N	3.79999999999999982
695	22	2016-01-09	NYR	2	NYR2	Amber Moore 	D 	0	1	1	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
696	22	2016-01-09	NYR	24	NYR24	Celeste Brown 	F 	0	1	1	0	0	0	0	6-6 	6	6	0	\N	\N	\N	\N	2
697	22	2016-01-09	NYR	12	NYR12	Janine Weber 	F 	1	0	1	0	6	0	1	5-6 	5	6	0	\N	\N	\N	\N	7.90000000000000036
698	22	2016-01-09	NYR	9	NYR9	Liudmila Belyakova 	F 	0	1	1	0	4	0	0	5-11 	5	11	0	\N	\N	\N	\N	3.39999999999999991
699	22	2016-01-09	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
700	22	2016-01-09	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0
701	22	2016-01-09	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989
702	22	2016-01-09	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
703	22	2016-01-09	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	2	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991
704	22	2016-01-09	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
705	22	2016-01-09	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
706	22	2016-01-09	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
707	22	2016-01-09	CON	19	CON19	Brittany Dougherty 	F 	0	3	3	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
708	22	2016-01-09	CON	22	CON22	Danielle Ward 	F 	2	0	2	0	3	0	0	7-6 	7	6	0	1	\N	\N	\N	12.5999999999999996
709	22	2016-01-09	CON	27	CON27	Shiann Darkangelo 	F 	1	1	2	0	5	0	0	3-2 	3	2	0	\N	\N	\N	\N	8.59999999999999964
710	22	2016-01-09	CON	61	CON61	Kelli Stack 	F 	1	1	2	2	6	0	0	22-3 	22	3	1	\N	\N	1	\N	17.3999999999999986
711	22	2016-01-09	CON	17	CON17	Yekaterina Smolentseva 	F 	0	1	1	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
712	22	2016-01-09	CON	8	CON8	Kelly Babstock 	F 	0	1	1	0	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	3.5
713	22	2016-01-09	CON	13	CON13	Kaleigh Fratkin 	D 	0	1	1	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
714	22	2016-01-09	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
715	22	2016-01-09	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
716	22	2016-01-09	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
717	22	2016-01-09	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
718	22	2016-01-09	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
719	22	2016-01-09	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	3	0	0	6-10 	6	10	0	\N	\N	\N	\N	1.10000000000000009
720	22	2016-01-09	CON	28	CON28	Sam Faber 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
721	23	2016-01-10	NYR	17	NYR17	Bray Ketchum 	F 	1	0	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036
722	23	2016-01-10	NYR	20	NYR20	Brooke Ammerman 	F 	0	1	1	0	2	0	0	2-8 	2	8	0	\N	\N	\N	\N	2.39999999999999991
723	23	2016-01-10	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
724	23	2016-01-10	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	3	0	0	3-8 	3	8	0	\N	\N	\N	\N	1.5
725	23	2016-01-10	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
726	23	2016-01-10	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
727	23	2016-01-10	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
728	23	2016-01-10	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	2	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.10000000000000009
729	23	2016-01-10	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
730	23	2016-01-10	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
731	23	2016-01-10	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	4	0	0	4-9 	4	9	0	\N	\N	\N	\N	1.5
732	23	2016-01-10	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	1	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.400000000000000022
733	23	2016-01-10	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
734	23	2016-01-10	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	1	0	0	9-11 	9	11	0	\N	\N	\N	\N	0.299999999999999989
735	23	2016-01-10	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
736	23	2016-01-10	BOS	14	BOS14	Brianna Decker 	F 	1	2	3	0	6	1	0	15-7 	15	7	0	\N	\N	\N	\N	12.3000000000000007
737	23	2016-01-10	BOS	3	BOS3	Jillian Dempsey 	F 	2	1	3	2	6	0	0	13-6 	13	6	0	\N	\N	\N	\N	14.1999999999999993
738	23	2016-01-10	BOS	21	BOS21	Hilary Knight 	F 	1	2	3	0	4	0	0	4-0 	4	0	0	\N	\N	\N	\N	10.4000000000000004
739	23	2016-01-10	BOS	23	BOS23	Corinne Buie 	F 	1	1	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8
740	23	2016-01-10	BOS	15	BOS15	Emily Field 	F 	0	2	2	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.89999999999999991
741	23	2016-01-10	BOS	19	BOS19	Gigi Marvin 	D 	0	2	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
742	23	2016-01-10	BOS	12	BOS12	Marissa Gedman 	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
743	23	2016-01-10	BOS	16	BOS16	Amanda Pelkey 	F 	1	1	2	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	8
744	23	2016-01-10	BOS	44	BOS44	Zoe Hickel 	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
745	23	2016-01-10	BOS	11	BOS11	Jordan Smelker 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
746	23	2016-01-10	BOS	91	BOS91	Rachel Llanes 	F 	1	0	1	2	3	0	0	9-6 	9	6	1	\N	\N	\N	\N	11.3000000000000007
747	23	2016-01-10	BOS	10	BOS10	Blake Bolden 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
748	23	2016-01-10	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
749	23	2016-01-10	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
750	23	2016-01-10	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
751	23	2016-01-10	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
752	23	2016-01-10	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
753	23	2016-01-10	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
754	24	2016-01-10	BUF	3	BUF3	Kelley Steadman 	F 	2	1	3	2	8	0	0	3-5 	3	5	0	\N	\N	1	\N	15.3000000000000007
755	24	2016-01-10	BUF	10	BUF10	Meghan Duggan 	F 	1	1	2	0	6	0	0	15-13 	15	13	0	\N	\N	\N	\N	9.19999999999999929
756	24	2016-01-10	BUF	77	BUF77	Hayley Williams 	F 	0	1	1	0	2	0	0	6-7 	6	7	0	\N	\N	\N	\N	2.89999999999999991
757	24	2016-01-10	BUF	23	BUF23	Lindsay Grigg 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
758	24	2016-01-10	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	3	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.89999999999999991
759	24	2016-01-10	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	0	0	0	8-12 	8	12	0	\N	\N	\N	\N	-0.400000000000000022
760	24	2016-01-10	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
761	24	2016-01-10	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
762	24	2016-01-10	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
763	24	2016-01-10	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
764	24	2016-01-10	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
765	24	2016-01-10	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
766	24	2016-01-10	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	9	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
767	24	2016-01-10	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
768	24	2016-01-10	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
769	24	2016-01-10	CON	17	CON17	Yekaterina Smolentseva 	F 	2	1	3	2	3	0	0	0-0 	0	0	0	\N	1	\N	\N	14
770	24	2016-01-10	CON	16	CON16	Micaela Long 	F 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
771	24	2016-01-10	CON	61	CON61	Kelli Stack 	F 	2	0	2	4	10	1	1	24-6 	24	6	1	1	\N	\N	\N	25.3000000000000007
772	24	2016-01-10	CON	13	CON13	Kaleigh Fratkin 	D 	0	2	2	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
773	24	2016-01-10	CON	22	CON22	Danielle Ward 	F 	1	1	2	0	1	0	0	4-6 	4	6	0	\N	\N	\N	\N	6.29999999999999982
774	24	2016-01-10	CON	8	CON8	Kelly Babstock 	F 	0	1	1	0	12	0	0	5-4 	5	4	0	\N	\N	\N	\N	8.09999999999999964
775	24	2016-01-10	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	2	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009
776	24	2016-01-10	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
777	24	2016-01-10	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
778	24	2016-01-10	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
779	24	2016-01-10	CON	27	CON27	Shiann Darkangelo 	F 	0	0	0	0	4	0	0	1-5 	1	5	0	\N	\N	\N	\N	1.60000000000000009
780	24	2016-01-10	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
781	24	2016-01-10	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	2	0	0	4-12 	4	12	0	\N	\N	\N	\N	0.200000000000000011
782	24	2016-01-10	CON	26	CON26	Jordan Brickner 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
783	24	2016-01-10	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
784	25	2016-01-17	CON	61	CON61	Kelli Stack 	F 	0	1	1	2	2	0	0	17-9 	17	9	0	\N	\N	\N	\N	4.29999999999999982
785	25	2016-01-17	CON	44	CON44	Tara Tomimoto 	D 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	1	\N	6.5
786	25	2016-01-17	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
787	25	2016-01-17	CON	27	CON27	Shiann Darkangelo 	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
788	25	2016-01-17	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
789	25	2016-01-17	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	2	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.39999999999999991
790	25	2016-01-17	CON	22	CON22	Danielle Ward 	F 	0	0	0	0	2	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.900000000000000022
791	25	2016-01-17	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
792	25	2016-01-17	CON	8	CON8	Kelly Babstock 	F 	0	0	0	0	4	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.80000000000000004
793	25	2016-01-17	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
794	25	2016-01-17	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
795	25	2016-01-17	CON	16	CON16	Micaela Long 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
796	25	2016-01-17	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
797	25	2016-01-17	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
798	25	2016-01-17	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	1	0	0	7-6 	7	6	0	\N	\N	\N	\N	0.599999999999999978
799	25	2016-01-17	BOS	21	BOS21	Hilary Knight 	F 	1	2	3	0	9	0	0	1-0 	1	0	0	\N	\N	\N	\N	12.5999999999999996
800	25	2016-01-17	BOS	19	BOS19	Gigi Marvin 	D 	1	1	2	0	1	1	0	0-0 	0	0	1	\N	\N	\N	\N	12
801	25	2016-01-17	BOS	12	BOS12	Marissa Gedman 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
802	25	2016-01-17	BOS	22	BOS22	Kacey Bellamy 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
803	25	2016-01-17	BOS	11	BOS11	Jordan Smelker 	F 	1	0	1	0	2	1	0	0-0 	0	0	0	1	\N	\N	\N	8.5
804	25	2016-01-17	BOS	16	BOS16	Amanda Pelkey 	F 	1	0	1	2	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	6
805	25	2016-01-17	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
806	25	2016-01-17	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	1	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.400000000000000022
807	25	2016-01-17	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
808	25	2016-01-17	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
809	25	2016-01-17	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
810	25	2016-01-17	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
811	25	2016-01-17	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	0	4	0	0	7-8 	7	8	0	\N	\N	\N	\N	1.89999999999999991
812	25	2016-01-17	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
813	25	2016-01-17	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
814	25	2016-01-17	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
815	25	2016-01-17	BOS	14	BOS14	Brianna Decker 	F 	0	0	0	2	6	0	0	14-13 	14	13	0	\N	\N	\N	\N	3.60000000000000009
816	25	2016-01-17	BOS	18	BOS18	Cherie Hendrickson 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
817	26	2016-01-17	BUF	24	BUF24	Hailey Browne 	F 	0	3	3	2	4	0	0	2-2 	2	2	0	\N	\N	\N	\N	8.5
818	26	2016-01-17	BUF	21	BUF21	Devon Skeats 	F 	0	3	3	2	8	0	0	0-0 	0	0	0	\N	\N	\N	\N	10.5
819	26	2016-01-17	BUF	36	BUF36	Kourtney Kunichika 	F 	2	0	2	0	5	1	0	12-16 	12	16	0	\N	\N	1	\N	11.5999999999999996
820	26	2016-01-17	BUF	43	BUF43	Tatiana Rafter 	F 	1	0	1	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	7.5
821	26	2016-01-17	BUF	13	BUF13	Shelby Bram 	F 	0	1	1	0	1	0	0	12-9 	12	9	0	\N	\N	\N	1	7.79999999999999982
822	26	2016-01-17	BUF	12	BUF12	Hannah McGowan 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
823	26	2016-01-17	BUF	6	BUF6	Jessica Fickel 	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
824	26	2016-01-17	BUF	2	BUF2	Paige Harrington 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
825	26	2016-01-17	BUF	7	BUF7	Emily Pfalzer 	D 	1	0	1	2	3	0	0	0-0 	0	0	0	1	\N	\N	1	14
826	26	2016-01-17	BUF	9	BUF9	Megan Bozek 	D 	1	0	1	4	10	0	0	1-0 	1	0	0	\N	\N	\N	\N	10.0999999999999996
827	26	2016-01-17	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	4	2	0	0	7-6 	7	6	0	\N	\N	\N	\N	2.10000000000000009
828	26	2016-01-17	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006
829	26	2016-01-17	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
830	26	2016-01-17	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
831	26	2016-01-17	NYR	17	NYR17	Bray Ketchum 	F 	2	0	2	10	4	2	0	0-0 	0	0	0	\N	\N	\N	\N	13.5
832	26	2016-01-17	NYR	11	NYR11	Morgan Fritz-Ward 	F 	2	0	2	2	7	1	0	0-2 	0	2	0	\N	1	\N	\N	14.3000000000000007
833	26	2016-01-17	NYR	26	NYR26	Kira Dosdall 	D 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
834	26	2016-01-17	NYR	20	NYR20	Brooke Ammerman 	F 	0	2	2	24	11	0	0	8-6 	8	6	0	\N	\N	\N	1	20.6999999999999993
835	26	2016-01-17	NYR	14	NYR14	Madison Packer 	F 	0	1	1	0	5	0	0	0-3 	0	3	0	\N	\N	\N	\N	4.20000000000000018
836	26	2016-01-17	NYR	28	NYR28	Beth Hanrahan 	F 	0	1	1	0	2	0	0	1-1 	1	1	0	\N	\N	\N	\N	3
837	26	2016-01-17	NYR	12	NYR12	Janine Weber 	F 	0	1	1	0	0	0	0	7-8 	7	8	0	\N	\N	\N	\N	1.89999999999999991
838	26	2016-01-17	NYR	9	NYR9	Liudmila Belyakova 	F 	1	0	1	4	4	0	0	11-11 	11	11	0	\N	\N	\N	\N	7
839	26	2016-01-17	NYR	24	NYR24	Celeste Brown 	F 	0	1	1	2	2	0	0	7-3 	7	3	0	\N	\N	\N	\N	3.89999999999999991
840	26	2016-01-17	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
841	26	2016-01-17	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
842	26	2016-01-17	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
843	26	2016-01-17	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
844	26	2016-01-17	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
845	26	2016-01-17	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
846	27	2016-01-31	NYR	17	NYR17	Bray Ketchum 	F 	1	1	2	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	6.59999999999999964
847	27	2016-01-31	NYR	20	NYR20	Brooke Ammerman 	F 	0	1	1	0	2	0	0	11-10 	11	10	0	\N	\N	\N	\N	3.10000000000000009
848	27	2016-01-31	NYR	14	NYR14	Madison Packer 	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
849	27	2016-01-31	NYR	9	NYR9	Liudmila Belyakova 	F 	0	1	1	2	2	0	0	8-10 	8	10	0	\N	\N	\N	\N	3.29999999999999982
850	27	2016-01-31	NYR	28	NYR28	Beth Hanrahan 	F 	1	0	1	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036
851	27	2016-01-31	NYR	22	NYR22	Erin Barley-Maloney 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
852	27	2016-01-31	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	6	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
853	27	2016-01-31	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
854	27	2016-01-31	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	2	0	0	6-2 	6	2	0	\N	\N	\N	\N	1.89999999999999991
855	27	2016-01-31	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
856	27	2016-01-31	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
857	27	2016-01-31	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
858	27	2016-01-31	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
859	27	2016-01-31	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
860	27	2016-01-31	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	0	0	0	0-3 	0	3	0	\N	\N	\N	\N	-0.299999999999999989
861	27	2016-01-31	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	1	0	0	2-11 	2	11	0	\N	\N	\N	\N	-0.400000000000000022
862	27	2016-01-31	NYR	2	NYR2	Amber Moore 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
863	27	2016-01-31	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
864	27	2016-01-31	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
865	27	2016-01-31	BUF	10	BUF10	Meghan Duggan 	F 	0	3	3	0	7	0	0	5-5 	5	5	0	\N	\N	\N	\N	9.5
866	27	2016-01-31	BUF	3	BUF3	Kelley Steadman 	F 	2	1	3	0	8	2	0	0-0 	0	0	0	\N	\N	\N	\N	15
867	27	2016-01-31	BUF	9	BUF9	Megan Bozek 	D 	0	2	2	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
868	27	2016-01-31	BUF	13	BUF13	Shelby Bram 	F 	1	0	1	0	5	0	0	9-10 	9	10	1	\N	\N	\N	\N	11.4000000000000004
869	27	2016-01-31	BUF	7	BUF7	Emily Pfalzer 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
870	27	2016-01-31	BUF	20	BUF20	Erin Zach 	F 	1	0	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
871	27	2016-01-31	BUF	26	BUF26	Maggie Giamo 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
872	27	2016-01-31	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	3	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982
873	27	2016-01-31	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	1	0	0	8-6 	8	6	0	\N	\N	\N	\N	0.699999999999999956
874	27	2016-01-31	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
875	27	2016-01-31	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	1	0	0	12-7 	12	7	0	\N	\N	\N	\N	1
876	27	2016-01-31	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
877	27	2016-01-31	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
878	27	2016-01-31	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
879	27	2016-01-31	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
880	27	2016-01-31	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
881	27	2016-01-31	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
882	27	2016-01-31	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
883	28	2016-01-31	BOS	11	BOS11	Jordan Smelker 	F 	1	2	3	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	10
884	28	2016-01-31	BOS	14	BOS14	Brianna Decker 	F 	1	2	3	0	9	0	1	12-13 	12	13	0	\N	1	\N	\N	15.4000000000000004
885	28	2016-01-31	BOS	21	BOS21	Hilary Knight 	F 	2	1	3	0	9	0	0	4-1 	4	1	1	1	\N	\N	\N	22.8000000000000007
886	28	2016-01-31	BOS	19	BOS19	Gigi Marvin 	D 	1	1	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7
887	28	2016-01-31	BOS	22	BOS22	Kacey Bellamy 	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
888	28	2016-01-31	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	2	0	0	10-7 	10	7	0	\N	\N	\N	\N	1.30000000000000004
889	28	2016-01-31	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
890	28	2016-01-31	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
891	28	2016-01-31	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
892	28	2016-01-31	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
893	28	2016-01-31	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	2	4	0	0	7-17 	7	17	0	\N	\N	\N	\N	1.5
894	28	2016-01-31	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
895	28	2016-01-31	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
896	28	2016-01-31	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
897	28	2016-01-31	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
898	28	2016-01-31	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
899	28	2016-01-31	CON	61	CON61	Kelli Stack 	F 	1	0	1	2	6	0	0	24-7 	24	7	0	\N	\N	1	\N	10.1999999999999993
900	28	2016-01-31	CON	56	CON56	Jessica Koizumi 	F 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
901	28	2016-01-31	CON	19	CON19	Brittany Dougherty 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
902	28	2016-01-31	CON	9	CON9	Molly Engstrom 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
903	28	2016-01-31	CON	8	CON8	Kelly Babstock 	F 	1	0	1	0	2	1	0	9-9 	9	9	0	\N	\N	\N	\N	5.5
904	28	2016-01-31	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
905	28	2016-01-31	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
906	28	2016-01-31	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
907	28	2016-01-31	CON	22	CON22	Danielle Ward 	F 	0	0	0	0	2	0	0	2-12 	2	12	0	\N	\N	\N	\N	0
908	28	2016-01-31	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
909	28	2016-01-31	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
910	28	2016-01-31	CON	16	CON16	Micaela Long 	F 	0	0	0	2	4	0	0	2-2 	2	2	0	\N	\N	\N	\N	2.5
911	28	2016-01-31	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	0	0	0	3-1 	3	1	0	\N	\N	\N	\N	0.200000000000000011
912	28	2016-01-31	CON	4	CON4	Anya Battaglino 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
913	29	2016-02-06	BOS	19	BOS19	Gigi Marvin 	D 	1	1	2	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7.5
914	29	2016-02-06	BOS	11	BOS11	Jordan Smelker 	F 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
915	29	2016-02-06	BOS	14	BOS14	Brianna Decker 	F 	1	1	2	0	6	0	0	5-0 	5	0	0	\N	1	\N	\N	11.5
916	29	2016-02-06	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	2	2	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
917	29	2016-02-06	BOS	3	BOS3	Jillian Dempsey 	F 	1	1	2	0	5	1	0	3-0 	3	0	1	1	\N	\N	\N	17.3000000000000007
918	29	2016-02-06	BOS	21	BOS21	Hilary Knight 	F 	1	0	1	0	7	0	0	2-0 	2	0	0	\N	\N	\N	\N	7.70000000000000018
919	29	2016-02-06	BOS	44	BOS44	Zoe Hickel 	F 	1	0	1	4	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	7.59999999999999964
920	29	2016-02-06	BOS	5	BOS5	Kelly Cooke 	F 	1	0	1	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	5.09999999999999964
921	29	2016-02-06	BOS	16	BOS16	Amanda Pelkey 	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
922	29	2016-02-06	BOS	10	BOS10	Blake Bolden 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
923	29	2016-02-06	BOS	7	BOS7	Casey Pickett 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
924	29	2016-02-06	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
925	29	2016-02-06	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
926	29	2016-02-06	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
927	29	2016-02-06	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
928	29	2016-02-06	BOS	15	BOS15	Emily Field 	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
929	29	2016-02-06	NYR	17	NYR17	Bray Ketchum 	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
930	29	2016-02-06	NYR	9	NYR9	Liudmila Belyakova 	F 	1	0	1	2	2	1	0	0-0 	0	0	0	\N	\N	1	\N	7
931	29	2016-02-06	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
932	29	2016-02-06	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009
933	29	2016-02-06	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009
934	29	2016-02-06	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
935	29	2016-02-06	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
936	29	2016-02-06	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
937	29	2016-02-06	NYR	14	NYR14	Madison Packer 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
938	29	2016-02-06	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
939	29	2016-02-06	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
940	29	2016-02-06	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
941	29	2016-02-06	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	1	0	0	3-0 	3	0	0	\N	\N	\N	\N	0.800000000000000044
942	29	2016-02-06	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
943	29	2016-02-06	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
944	30	2016-02-07	BUF	13	BUF13	Shelby Bram 	F 	1	0	1	0	3	0	0	11-7 	11	7	0	\N	\N	\N	\N	5.90000000000000036
945	30	2006-02-07	BUF	14	BUF14	Kelly Mcdonald 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	1	\N	4
946	30	1996-02-07	BUF	23	BUF23	Lindsay Grigg 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
947	30	1986-02-07	BUF	77	BUF77	Hayley Williams 	F 	0	1	1	0	3	0	0	5-8 	5	8	0	\N	\N	\N	\N	3.20000000000000018
948	30	1976-02-07	BUF	12	BUF12	Hannah McGowan 	F 	1	0	1	0	3	0	1	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036
949	30	1966-02-07	BUF	20	BUF20	Erin Zach 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
950	30	1956-02-07	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	0	0	0	2-13 	2	13	0	\N	\N	\N	\N	-1.10000000000000009
951	30	1946-02-07	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
952	30	1936-02-07	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
953	30	1926-02-07	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	4	2	0	0	0-4 	0	4	0	\N	\N	\N	\N	1.60000000000000009
954	30	1916-02-07	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
955	30	1906-02-07	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
956	30	2016-02-07	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
957	30	2006-02-07	BUF	10	BUF10	Meghan Duggan 	F 	0	0	0	2	6	0	0	3-2 	3	2	0	\N	\N	\N	\N	3.60000000000000009
958	30	1996-02-07	CON	8	CON8	Kelly Babstock 	F 	0	2	2	4	1	0	0	5-5 	5	5	0	\N	1	\N	\N	7.5
959	30	1986-02-07	CON	61	CON61	Kelli Stack 	F 	0	2	2	0	6	0	0	20-8 	20	8	0	\N	\N	\N	\N	8.19999999999999929
960	30	1976-02-07	CON	9	CON9	Molly Engstrom 	D 	1	0	1	0	3	0	0	0-0 	0	0	1	1	\N	\N	\N	13.5
961	30	1966-02-07	CON	16	CON16	Micaela Long 	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
962	30	1956-02-07	CON	88	CON88	Alyssa Wohlfeiler 	F 	1	0	1	0	2	1	0	1-0 	1	0	0	\N	\N	\N	\N	5.59999999999999964
963	30	1946-02-07	CON	5	CON5	Kate Buesser 	F 	1	0	1	0	5	0	0	0-2 	0	2	0	\N	\N	\N	\N	6.29999999999999982
964	30	1936-02-07	CON	6	CON6	Shannon Doyle 	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
965	30	1926-02-07	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	3	0	0	6-6 	6	6	0	\N	\N	\N	\N	1.5
966	30	1916-02-07	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
967	30	1906-02-07	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
968	30	2016-02-07	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009
969	30	2006-02-07	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	6	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
970	30	2016-02-07	CON	4	CON4	Anya Battaglino 	D 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006
971	30	2006-02-07	CON	22	CON22	Danielle Ward 	F 	0	0	0	2	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1
972	30	2016-02-07	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
973	31	2016-02-14	BUF	20	BUF20	Erin Zach 	F 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
974	31	2016-02-14	BUF	3	BUF3	Kelley Steadman 	F 	1	1	2	4	8	0	0	0-2 	0	2	0	\N	\N	\N	\N	10.8000000000000007
975	31	2016-02-14	BUF	9	BUF9	Megan Bozek 	D 	0	2	2	0	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	6.59999999999999964
976	31	2016-02-14	BUF	13	BUF13	Shelby Bram 	F 	1	0	1	0	2	0	0	12-15 	12	15	0	\N	\N	\N	\N	4.70000000000000018
977	31	2016-02-14	BUF	21	BUF21	Devon Skeats 	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
978	31	2016-02-14	BUF	77	BUF77	Hayley Williams 	F 	0	0	0	0	2	0	0	2-2 	2	2	0	\N	\N	\N	\N	1
979	31	2016-02-14	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	6	0	0	12-11 	12	11	0	\N	\N	\N	\N	3.10000000000000009
980	31	2016-02-14	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	5	0	0	1-1 	1	1	0	\N	\N	\N	\N	3
981	31	2016-02-14	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006
982	31	2016-02-14	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
983	31	2016-02-14	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
984	31	2016-02-14	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
985	31	2016-02-14	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	1	5
986	31	2016-02-14	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
987	31	2016-02-14	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
988	31	2016-02-14	NYR	20	NYR20	Brooke Ammerman 	F 	0	2	2	2	0	0	0	12-15 	12	15	0	\N	\N	\N	1	9.19999999999999929
989	31	2016-02-14	NYR	26	NYR26	Kira Dosdall 	D 	0	2	2	0	1	0	0	0-0 	0	0	0	1	\N	\N	1	12.5
990	31	2016-02-14	NYR	18	NYR18	Meghan Fardelmann 	F 	1	0	1	2	5	0	0	2-0 	2	0	0	\N	\N	\N	\N	7.20000000000000018
991	31	2016-02-14	NYR	17	NYR17	Bray Ketchum 	F 	1	0	1	0	2	1	0	2-1 	2	1	0	\N	\N	\N	\N	5.59999999999999964
992	31	2016-02-14	NYR	11	NYR11	Morgan Fritz-Ward 	F 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	1	\N	7
993	31	2016-02-14	NYR	9	NYR9	Liudmila Belyakova 	F 	0	1	1	2	0	0	0	2-4 	2	4	0	\N	\N	\N	\N	2.29999999999999982
994	31	2016-02-14	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	0	0	0	3-0 	3	0	0	\N	\N	\N	\N	0.299999999999999989
995	31	2016-02-14	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
996	31	2016-02-14	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
997	31	2016-02-14	NYR	14	NYR14	Madison Packer 	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
998	31	2016-02-14	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
999	31	2016-02-14	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1000	31	2016-02-14	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1001	31	2016-02-14	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	1	0	0	10-9 	10	9	0	\N	\N	\N	\N	0.599999999999999978
1002	31	2016-02-14	NYR	13	NYR13	Cherie Stewart 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1003	32	2016-02-14	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1004	32	2016-02-14	CON	8	CON8	Kelly Babstock 	F 	1	0	1	0	2	0	0	13-4 	13	4	0	\N	\N	\N	\N	5.90000000000000036
1005	32	2016-02-14	CON	19	CON19	Brittany Dougherty 	F 	1	0	1	0	1	0	0	3-3 	3	3	0	\N	\N	\N	\N	4.5
1006	32	2016-02-14	CON	28	CON28	Sam Faber 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1007	32	2016-02-14	CON	5	CON5	Kate Buesser 	F 	0	0	0	0	2	0	0	4-0 	4	0	0	\N	\N	\N	\N	1.39999999999999991
1008	32	2016-02-14	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1009	32	2016-02-14	CON	61	CON61	Kelli Stack 	F 	0	0	0	2	0	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.400000000000000022
1010	32	2016-02-14	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978
1011	32	2016-02-14	CON	22	CON22	Danielle Ward 	F 	0	0	0	0	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	0.599999999999999978
1012	32	2016-02-14	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1013	32	2016-02-14	CON	9	CON9	Molly Engstrom 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1014	32	2016-02-14	CON	16	CON16	Micaela Long 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1015	32	2016-02-14	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1016	32	2016-02-14	CON	4	CON4	Anya Battaglino 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1017	32	2016-02-14	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1018	32	2016-02-14	BOS	11	BOS11	Jordan Smelker 	F 	2	1	3	0	7	0	0	0-0 	0	0	1	\N	\N	\N	\N	18.5
1019	32	2016-02-14	BOS	19	BOS19	Gigi Marvin 	D 	1	1	2	2	7	0	1	0-0 	0	0	0	\N	\N	\N	\N	11
1020	32	2016-02-14	BOS	14	BOS14	Brianna Decker 	F 	1	1	2	0	5	1	0	8-10 	8	10	0	\N	\N	\N	\N	8.80000000000000071
1021	32	2016-02-14	BOS	21	BOS21	Hilary Knight 	F 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
1022	32	2016-02-14	BOS	3	BOS3	Jillian Dempsey 	F 	0	1	1	0	5	0	0	5-11 	5	11	0	\N	\N	\N	\N	3.89999999999999991
1023	32	2016-02-14	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1024	32	2016-02-14	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1025	32	2016-02-14	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	1	0	0	4-8 	4	8	0	\N	\N	\N	\N	0.100000000000000006
1026	32	2016-02-14	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991
1027	32	2016-02-14	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1028	32	2016-02-14	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1029	32	2016-02-14	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1030	32	2016-02-14	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1031	32	2016-02-14	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1032	32	2016-02-14	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022
1033	33	2016-02-21	BOS	14	BOS14	Brianna Decker 	F 	3	1	4	0	8	0	1	10-13 	10	13	0	1	\N	\N	\N	21.6999999999999993
1034	33	2016-02-21	BOS	21	BOS21	Hilary Knight 	F 	1	2	3	2	12	0	0	4-0 	4	0	1	\N	1	\N	\N	21.8999999999999986
1035	33	2016-02-21	BOS	22	BOS22	Kacey Bellamy 	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
1036	33	2016-02-21	BOS	91	BOS91	Rachel Llanes 	F 	0	1	1	2	1	0	0	5-11 	5	11	0	\N	\N	\N	\N	2.39999999999999991
1037	33	2016-02-21	BOS	11	BOS11	Jordan Smelker 	F 	0	1	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
1038	33	2016-02-21	BOS	15	BOS15	Emily Field 	F 	1	0	1	0	1	0	1	0-0 	0	0	0	\N	\N	\N	\N	5.5
1039	33	2016-02-21	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1040	33	2016-02-21	BOS	44	BOS44	Zoe Hickel 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1041	33	2016-02-21	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1042	33	2016-02-21	BOS	3	BOS3	Jillian Dempsey 	F 	0	0	0	2	6	0	0	12-17 	12	17	0	\N	\N	\N	\N	3
1043	33	2016-02-21	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1044	33	2016-02-21	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1045	33	2016-02-21	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1046	33	2016-02-21	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
1047	33	2016-02-21	BOS	12	BOS12	Marissa Gedman 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1048	33	2016-02-21	CON	16	CON16	Micaela Long 	F 	2	0	2	0	6	0	0	0-0 	0	0	0	\N	\N	1	\N	12
1049	33	2016-02-21	CON	5	CON5	Kate Buesser 	F 	0	1	1	0	2	0	0	2-1 	2	1	0	\N	\N	\N	\N	3.10000000000000009
1050	33	2016-02-21	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1051	33	2016-02-21	CON	61	CON61	Kelli Stack 	F 	1	0	1	2	7	0	0	19-12 	19	12	0	\N	\N	\N	\N	8.69999999999999929
1052	33	2016-02-21	CON	8	CON8	Kelly Babstock 	F 	0	1	1	2	3	0	0	13-10 	13	10	0	\N	\N	\N	\N	4.29999999999999982
1053	33	2016-02-21	CON	28	CON28	Sam Faber 	F 	0	0	0	2	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
1054	33	2016-02-21	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1055	33	2016-02-21	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	1	0	0	5-6 	5	6	0	\N	\N	\N	\N	0.400000000000000022
1056	33	2016-02-21	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
1057	33	2016-02-21	CON	9	CON9	Molly Engstrom 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1058	33	2016-02-21	CON	6	CON6	Shannon Doyle 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1059	33	2016-02-21	CON	10	CON10	Lindsay Berman 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1060	33	2016-02-21	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1061	33	2016-02-21	CON	22	CON22	Danielle Ward 	F 	0	0	0	4	0	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.10000000000000009
1062	33	2016-02-21	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1063	34	2016-02-21	NYR	17	NYR17	Bray Ketchum 	F 	1	0	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	6
1064	34	2016-02-21	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1065	34	2016-02-21	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1066	34	2016-02-21	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1067	34	2016-02-21	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1068	34	2016-02-21	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1069	34	2016-02-21	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1070	34	2016-02-21	NYR	14	NYR14	Madison Packer 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1071	34	2016-02-21	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1072	34	2016-02-21	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1073	34	2016-02-21	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1074	34	2016-02-21	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1075	34	2016-02-21	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1076	34	2016-02-21	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1077	34	2016-02-21	NYR	11	NYR11	Morgan Fritz-Ward 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1078	34	2016-02-21	BUF	10	BUF10	Meghan Duggan 	F 	1	1	2	0	3	0	0	0-0 	0	0	1	1	\N	\N	\N	15.5
1079	34	2016-02-21	BUF	77	BUF77	Hayley Williams 	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1080	34	2016-02-21	BUF	9	BUF9	Megan Bozek 	D 	1	1	2	2	3	0	0	0-0 	0	0	0	\N	1	\N	\N	10
1081	34	2016-02-21	BUF	43	BUF43	Tatiana Rafter 	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
1082	34	2016-02-21	BUF	21	BUF21	Devon Skeats 	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1083	34	2016-02-21	BUF	36	BUF36	Kourtney Kunichika 	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5
1084	34	2016-02-21	BUF	14	BUF14	Kelly Mcdonald 	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
1085	34	2016-02-21	BUF	12	BUF12	Hannah McGowan 	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1086	34	2016-02-21	BUF	3	BUF3	Kelley Steadman 	F 	1	0	1	4	12	0	0	0-0 	0	0	0	\N	\N	\N	\N	11
1087	34	2016-02-21	BUF	2	BUF2	Paige Harrington 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1088	34	2016-02-21	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1089	34	2016-02-21	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1090	34	2016-02-21	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1091	34	2016-02-21	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1092	34	2016-02-21	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1093	35	2016-02-28	BOS	21	BOS21	Hilary Knight 	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1094	35	2016-02-28	BOS	22	BOS22	Kacey Bellamy 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1095	35	2016-02-28	BOS	23	BOS23	Corinne Buie 	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1096	35	2016-02-28	BOS	44	BOS44	Zoe Hickel 	F 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1097	35	2016-02-28	BOS	12	BOS12	Marissa Gedman 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1098	35	2016-02-28	BOS	14	BOS14	Brianna Decker 	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1099	35	2016-02-28	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1100	35	2016-02-28	BOS	3	BOS3	Jillian Dempsey 	F 	1	0	1	2	0	0	0	0-0 	0	0	1	\N	\N	\N	\N	9.5
1101	35	2016-02-28	BOS	57	BOS57	Meagan Mangene 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1102	35	2016-02-28	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1103	35	2016-02-28	BOS	19	BOS19	Gigi Marvin 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1104	35	2016-02-28	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1105	35	2016-02-28	BOS	0	BOS0	Hayley Moore 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1106	35	2016-02-28	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1107	35	2016-02-28	BOS	16	BOS16	Amanda Pelkey 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1108	35	2016-02-28	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1109	35	2016-02-28	BUF	9	BUF9	Megan Bozek 	D 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
1110	35	2016-02-28	BUF	10	BUF10	Meghan Duggan 	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1111	35	2016-02-28	BUF	43	BUF43	Tatiana Rafter 	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1112	35	2016-02-28	BUF	24	BUF24	Hailey Browne 	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4
1113	35	2016-02-28	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1114	35	2016-02-28	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1115	35	2016-02-28	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1116	35	2016-02-28	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1117	35	2016-02-28	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1118	35	2016-02-28	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1119	35	2016-02-28	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1120	35	2016-02-28	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1121	35	2016-02-28	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1122	35	2016-02-28	BUF	20	BUF20	Erin Zach 	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1123	36	2016-02-28	NYR	20	NYR20	Brooke Ammerman 	F 	0	2	2	0	6	0	0	9-21 	9	21	0	\N	1	\N	\N	7.79999999999999982
1124	36	2016-02-28	NYR	10	NYR10	Ashley Johnston 	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5
1125	36	2016-02-28	NYR	26	NYR26	Kira Dosdall 	D 	1	0	1	2	3	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5
1126	36	2016-02-28	NYR	14	NYR14	Madison Packer 	F 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
1127	36	2016-02-28	NYR	17	NYR17	Bray Ketchum 	F 	1	0	1	0	3	1	0	1-0 	1	0	0	\N	\N	\N	\N	6.09999999999999964
1128	36	2016-02-28	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	3	0	0	2-0 	2	0	0	\N	\N	\N	\N	2.20000000000000018
1129	36	2016-02-28	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1130	36	2016-02-28	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1131	36	2016-02-28	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	1	0	0	4-3 	4	3	0	\N	\N	\N	\N	0.599999999999999978
1132	36	2016-02-28	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1133	36	2016-02-28	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1134	36	2016-02-28	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	1	0	0	8-8 	8	8	0	\N	\N	\N	\N	0.5
1135	36	2016-02-28	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	0	0	0	4-4 	4	4	0	\N	\N	\N	\N	0
1136	36	2016-02-28	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1137	36	2016-02-28	NYR	19	NYR19	Margot Scharfe 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1138	36	2016-02-28	CON	16	CON16	Micaela Long 	F 	1	1	2	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8.5
1139	36	2016-02-28	CON	61	CON61	Kelli Stack 	F 	0	2	2	0	6	0	0	18-5 	18	5	0	\N	\N	1	\N	9.30000000000000071
1140	36	2016-02-28	CON	22	CON22	Danielle Ward 	F 	1	1	2	2	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	7.09999999999999964
1141	36	2016-02-28	CON	26	CON26	Jordan Brickner 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1142	36	2016-02-28	CON	8	CON8	Kelly Babstock 	F 	1	0	1	6	3	1	0	12-13 	12	13	1	\N	\N	\N	\N	12.4000000000000004
1143	36	2016-02-28	CON	9	CON9	Molly Engstrom 	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1144	36	2016-02-28	CON	27	CON27	Shiann Darkangelo 	F 	1	0	1	0	4	0	0	0-0 	0	0	0	1	\N	\N	\N	9
1145	36	2016-02-28	CON	56	CON56	Jessica Koizumi 	F 	0	0	0	0	0	0	0	2-4 	2	4	0	\N	\N	\N	\N	-0.200000000000000011
1146	36	2016-02-28	CON	88	CON88	Alyssa Wohlfeiler 	F 	0	0	0	4	1	0	0	1-4 	1	4	0	\N	\N	\N	\N	1.19999999999999996
1147	36	2016-02-28	CON	44	CON44	Tara Tomimoto 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1148	36	2016-02-28	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1149	36	2016-02-28	CON	6	CON6	Shannon Doyle 	D 	0	0	0	6	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
1150	36	2016-02-28	CON	4	CON4	Anya Battaglino 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1151	36	2016-02-28	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1152	36	2016-02-28	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1153	37	2016-03-04	NYR	26	NYR26	Kira Dosdall 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1154	37	2016-03-04	NYR	24	NYR24	Celeste Brown 	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5
1155	37	2016-03-04	NYR	21	NYR21	Gabie Figueroa 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1156	37	2016-03-04	NYR	28	NYR28	Beth Hanrahan 	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1157	37	2016-03-04	NYR	91	NYR91	Taylor Holze 	F 	0	0	0	0	0	0	0	0-3 	0	3	0	\N	\N	\N	\N	-0.299999999999999989
1158	37	2016-03-04	NYR	20	NYR20	Brooke Ammerman 	F 	0	0	0	2	2	0	0	9-8 	9	8	0	\N	\N	\N	\N	1.60000000000000009
1159	37	2016-03-04	NYR	18	NYR18	Meghan Fardelmann 	F 	0	0	0	0	3	0	0	2-5 	2	5	0	\N	\N	\N	\N	1.19999999999999996
1160	37	2016-03-04	NYR	9	NYR9	Liudmila Belyakova 	F 	0	0	0	0	4	0	0	8-6 	8	6	0	\N	\N	\N	\N	2.20000000000000018
1161	37	2016-03-04	NYR	8	NYR8	Sydney Kidd 	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1162	37	2016-03-04	NYR	4	NYR4	Elena Orlando 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1163	37	2016-03-04	NYR	10	NYR10	Ashley Johnston 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1164	37	2016-03-04	NYR	12	NYR12	Janine Weber 	F 	0	0	0	0	0	0	0	3-1 	3	1	0	\N	\N	\N	\N	0.200000000000000011
1165	37	2016-03-04	NYR	17	NYR17	Bray Ketchum 	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022
1166	37	2016-03-04	NYR	14	NYR14	Madison Packer 	F 	0	0	0	2	3	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.89999999999999991
1167	37	2016-03-04	NYR	2	NYR2	Amber Moore 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1168	37	2016-03-04	BOS	3	BOS3	Jillian Dempsey 	F 	1	3	4	0	3	1	0	4-11 	4	11	0	\N	\N	\N	\N	11.3000000000000007
1169	37	2016-03-04	BOS	14	BOS14	Brianna Decker 	F 	2	1	3	4	9	1	0	17-5 	17	5	1	\N	\N	\N	\N	22.1999999999999993
1170	37	2016-03-04	BOS	19	BOS19	Gigi Marvin 	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5
1171	37	2016-03-04	BOS	16	BOS16	Amanda Pelkey 	F 	1	1	2	2	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	8.59999999999999964
1172	37	2016-03-04	BOS	12	BOS12	Marissa Gedman 	D 	0	2	2	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5
1173	37	2016-03-04	BOS	44	BOS44	Zoe Hickel 	F 	1	0	1	0	3	1	0	1-1 	1	1	0	\N	\N	\N	\N	6
1174	37	2016-03-04	BOS	21	BOS21	Hilary Knight 	F 	1	0	1	0	9	0	0	0-0 	0	0	0	\N	\N	\N	\N	8.5
1175	37	2016-03-04	BOS	23	BOS23	Corinne Buie 	F 	0	0	0	0	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.10000000000000009
1176	37	2016-03-04	BOS	91	BOS91	Rachel Llanes 	F 	0	0	0	0	4	0	0	3-4 	3	4	0	\N	\N	\N	\N	1.89999999999999991
1177	37	2016-03-04	BOS	22	BOS22	Kacey Bellamy 	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1178	37	2016-03-04	BOS	15	BOS15	Emily Field 	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1179	37	2016-03-04	BOS	2	BOS2	Alyssa Gagliardi 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1180	37	2016-03-04	BOS	5	BOS5	Kelly Cooke 	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
1181	37	2016-03-04	BOS	10	BOS10	Blake Bolden 	D 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3
1182	37	2016-03-04	BOS	11	BOS11	Jordan Smelker 	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1183	38	2016-03-04	BUF	23	BUF23	Lindsay Grigg 	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1184	38	2016-03-04	BUF	21	BUF21	Devon Skeats 	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991
1185	38	2016-03-04	BUF	20	BUF20	Erin Zach 	F 	0	0	0	0	7	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009
1186	38	2016-03-04	BUF	24	BUF24	Hailey Browne 	F 	0	0	0	2	4	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.39999999999999991
1187	38	2016-03-04	BUF	43	BUF43	Tatiana Rafter 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1188	38	2016-03-04	BUF	36	BUF36	Kourtney Kunichika 	F 	0	0	0	0	2	0	0	4-14 	4	14	0	\N	\N	\N	\N	0
1189	38	2016-03-04	BUF	15	BUF15	Annemarie Cellino 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1190	38	2016-03-04	BUF	14	BUF14	Kelly Mcdonald 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1191	38	2016-03-04	BUF	6	BUF6	Jessica Fickel 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1192	38	2016-03-04	BUF	5	BUF5	Courtney Carnes 	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1193	38	2016-03-04	BUF	2	BUF2	Paige Harrington 	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0
1194	38	2016-03-04	BUF	7	BUF7	Emily Pfalzer 	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2
1195	38	2016-03-04	BUF	9	BUF9	Megan Bozek 	D 	0	0	0	0	8	0	0	0-2 	0	2	0	\N	\N	\N	\N	3.79999999999999982
1196	38	2016-03-04	BUF	13	BUF13	Shelby Bram 	F 	0	0	0	0	1	0	0	17-15 	17	15	0	\N	\N	\N	\N	0.699999999999999956
1197	38	2016-03-04	BUF	12	BUF12	Hannah McGowan 	F 	0	0	0	2	2	0	0	3-7 	3	7	0	\N	\N	\N	\N	1.10000000000000009
1198	38	2016-03-04	CON	28	CON28	Sam Faber 	F 	1	0	1	0	1	1	0	1-1 	1	1	0	\N	\N	1	\N	6
1199	38	2016-03-04	CON	22	CON22	Danielle Ward 	F 	0	1	1	2	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.10000000000000009
1200	38	2016-03-04	CON	27	CON27	Shiann Darkangelo 	F 	0	1	1	0	2	0	0	0-2 	0	2	0	\N	\N	\N	\N	2.79999999999999982
1201	38	2016-03-04	CON	56	CON56	Jessica Koizumi 	F 	0	1	1	0	0	0	0	11-6 	11	6	0	\N	\N	\N	\N	2.5
1202	38	2016-03-04	CON	61	CON61	Kelli Stack 	F 	1	0	1	0	5	0	0	16-4 	16	4	1	\N	1	\N	\N	14.6999999999999993
1203	38	2016-03-04	CON	6	CON6	Shannon Doyle 	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5
1204	38	2016-03-04	CON	5	CON5	Kate Buesser 	F 	0	1	1	0	0	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.80000000000000004
1205	38	2016-03-04	CON	8	CON8	Kelly Babstock 	F 	1	0	1	0	2	0	1	12-10 	12	10	0	\N	\N	\N	\N	6.20000000000000018
1206	38	2016-03-04	CON	26	CON26	Jordan Brickner 	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1207	38	2016-03-04	CON	19	CON19	Brittany Dougherty 	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1
1208	38	2016-03-04	CON	13	CON13	Kaleigh Fratkin 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1209	38	2016-03-04	CON	9	CON9	Molly Engstrom 	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5
1210	38	2016-03-04	CON	16	CON16	Micaela Long 	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022
1211	38	2016-03-04	CON	17	CON17	Yekaterina Smolentseva 	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
1212	38	2016-03-04	CON	4	CON4	Anya Battaglino 	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5
\.


--
-- Name: skaters_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('skaters_stats_id_seq', 1, false);


--
-- Name: gms_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY gms
    ADD CONSTRAINT gms_pkey PRIMARY KEY (id);


--
-- Name: goalies_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY goalies_stats
    ADD CONSTRAINT goalies_stats_pkey PRIMARY KEY (id);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players_two_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY players_two
    ADD CONSTRAINT players_two_pkey PRIMARY KEY (id);


--
-- Name: skaters_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY skaters_stats
    ADD CONSTRAINT skaters_stats_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

