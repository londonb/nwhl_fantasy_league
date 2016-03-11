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
-- Name: gms_leagues; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE gms_leagues (
    id integer NOT NULL,
    gm_id integer,
    league_id integer
);


ALTER TABLE gms_leagues OWNER TO "Guest";

--
-- Name: gms_leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE gms_leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gms_leagues_id_seq OWNER TO "Guest";

--
-- Name: gms_leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE gms_leagues_id_seq OWNED BY gms_leagues.id;


--
-- Name: leagues_teams; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE leagues_teams (
    id integer NOT NULL,
    league_id integer,
    team_id integer
);


ALTER TABLE leagues_teams OWNER TO "Guest";

--
-- Name: gms_leagues_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE gms_leagues_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gms_leagues_teams_id_seq OWNER TO "Guest";

--
-- Name: gms_leagues_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE gms_leagues_teams_id_seq OWNED BY leagues_teams.id;


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
    fantasy_points double precision,
    player_id integer,
    week integer
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
    current_gms integer,
    current_week integer
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
    player_name character varying,
    pos character varying,
    salary integer,
    url character varying,
    profile_pic character varying
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
-- Name: players_teams; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE players_teams (
    id integer NOT NULL,
    team_id integer,
    player_id integer,
    starter boolean
);


ALTER TABLE players_teams OWNER TO "Guest";

--
-- Name: players_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE players_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_teams_id_seq OWNER TO "Guest";

--
-- Name: players_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE players_teams_id_seq OWNED BY players_teams.id;


--
-- Name: rosters; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE rosters (
    id integer NOT NULL,
    team_id integer,
    player_id integer,
    week integer
);


ALTER TABLE rosters OWNER TO "Guest";

--
-- Name: rosters_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE rosters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rosters_id_seq OWNER TO "Guest";

--
-- Name: rosters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE rosters_id_seq OWNED BY rosters.id;


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
    fantasy_points double precision,
    player_id integer,
    week integer
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
-- Name: teams; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    team_name character varying,
    max_players integer,
    current_players integer,
    gm_id integer
);


ALTER TABLE teams OWNER TO "Guest";

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO "Guest";

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY gms ALTER COLUMN id SET DEFAULT nextval('gms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY gms_leagues ALTER COLUMN id SET DEFAULT nextval('gms_leagues_id_seq'::regclass);


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

ALTER TABLE ONLY leagues_teams ALTER COLUMN id SET DEFAULT nextval('gms_leagues_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY players_teams ALTER COLUMN id SET DEFAULT nextval('players_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY rosters ALTER COLUMN id SET DEFAULT nextval('rosters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skaters_stats ALTER COLUMN id SET DEFAULT nextval('skaters_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Data for Name: gms; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY gms (id, user_name) FROM stdin;
1	Big Ben
2	Scotland Forever
3	Herbert
5	Brad
7	Henrietta
8	Mary
9	Kevin
4	Abigail
\.


--
-- Name: gms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('gms_id_seq', 9, true);


--
-- Data for Name: gms_leagues; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY gms_leagues (id, gm_id, league_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	3
5	5	3
6	6	2
7	7	2
8	8	2
9	9	2
10	4	4
\.


--
-- Name: gms_leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('gms_leagues_id_seq', 10, true);


--
-- Name: gms_leagues_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('gms_leagues_teams_id_seq', 10, true);


--
-- Data for Name: goalies_stats; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY goalies_stats (id, game, game_date, team, player_number, pt_number, pim, mp, ga, gaa, sa, sv, sv_percent, star1, star2, star3, so, fantasy_points, player_id, week) FROM stdin;
4	1	2015-10-11	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	1
5	1	2015-10-11	CON	32	CON32	0	60:00:00	1	1	33	32	0.969999999999999973	1	\N	\N	\N	15.0969999999999995	40	1
2	1	2015-10-11	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	1
1	1	2015-10-11	NYR	33	NYR33	0	60:00:00	4	4	30	26	0.866999999999999993	\N	\N	\N	\N	-2.9133	76	1
6	1	2015-10-11	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	1
3	1	2015-10-11	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	1
10	2	2015-10-11	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	1
11	2	2015-10-11	BUF	29	BUF29	0	60:00:00	4	4	49	45	0.918000000000000038	\N	\N	1	\N	7.5918000000000001	13	1
8	2	2015-10-11	BOS	29	BOS29	0	60:00:00	1	1	35	34	0.970999999999999974	\N	\N	\N	\N	13.0970999999999993	15	1
9	2	2015-10-11	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	1
12	2	2015-10-11	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	1
7	2	2015-10-11	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	1
16	3	2015-10-18	BUF	29	BUF29	0	59:50:00	4	4.00999999999999979	47	43	0.915000000000000036	1	\N	\N	\N	8.54693175499999924	13	2
13	3	2015-10-18	CON	78	CON78	0	60:00:00	2	2	32	30	0.937999999999999945	\N	\N	\N	\N	7.09379999999999988	19	2
14	3	2015-10-18	CON	32	CON32	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	40	2
17	3	2015-10-18	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	2
15	3	2015-10-18	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	2
19	4	2015-10-18	BOS	29	BOS29	0	28:56:00	1	2.06999999999999984	10	9	0.900000000000000022	\N	\N	\N	\N	-3.70493087600000015	15	2
22	4	2015-10-18	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	2
20	4	2015-10-18	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	2
18	4	2015-10-18	BOS	30	BOS30	0	31:04:00	0	0	15	15	1	\N	\N	\N	\N	7.59999999999999964	61	2
21	4	2015-10-18	NYR	33	NYR33	0	31:04:00	3	5.79000000000000004	17	14	0.823999999999999955	\N	\N	\N	\N	-16.0935656700000003	76	2
23	4	2015-10-18	NYR	1	NYR1	0	28:56:00	4	8.28999999999999915	32	28	0.875	\N	\N	\N	\N	-19.0922234999999993	83	2
27	5	2015-10-25	BUF	29	BUF29	0	59:52:00	4	4.00999999999999979	49	45	0.918000000000000038	\N	\N	\N	\N	6.55616525599999989	13	3
25	5	2015-10-25	BOS	29	BOS29	0	60:00:00	3	3	34	31	0.912000000000000033	\N	\N	\N	\N	3.59120000000000017	15	3
26	5	2015-10-25	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	3
28	5	2015-10-25	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	3
24	5	2015-10-25	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	3
29	6	2015-10-25	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	3
32	6	2015-10-25	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	3
31	6	2015-10-25	NYR	33	NYR33	0	59:50:00	2	2.00999999999999979	22	20	0.90900000000000003	\N	\N	\N	\N	2.06861587700000005	76	3
30	6	2015-10-25	CON	24	CON24	0	60:00:00	1	1	26	25	0.961999999999999966	\N	1	\N	\N	10.5961999999999996	77	3
33	6	2015-10-25	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	3
37	7	2015-11-15	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	4
38	7	2015-11-15	BUF	29	BUF29	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	13	4
34	7	2015-11-15	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	4
35	7	2015-11-15	CON	32	CON32	0	60:00:00	2	2	37	35	0.945999999999999952	\N	\N	\N	\N	9.5945999999999998	40	4
39	7	2015-11-15	BUF	1	BUF1	0	60:00:00	3	3	26	23	0.885000000000000009	1	\N	\N	\N	2.5884999999999998	58	4
36	7	2015-11-15	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	4
41	8	2015-11-15	BOS	29	BOS29	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	15	4
44	8	2015-11-15	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	4
42	8	2015-11-15	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	4
40	8	2015-11-15	BOS	30	BOS30	0	60:00:00	3	3	35	32	0.914000000000000035	\N	\N	\N	\N	4.09140000000000015	61	4
43	8	2015-11-15	NYR	33	NYR33	0	60:00:00	2	2	63	61	0.967999999999999972	1	\N	\N	\N	25.5968000000000018	76	4
45	8	2015-11-15	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	4
50	9	2015-11-22	BOS	29	BOS29	0	60:00:00	3	3	20	17	0.849999999999999978	\N	\N	\N	\N	-3.41500000000000004	15	5
47	9	2015-11-22	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	5
51	9	2015-11-22	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	5
49	9	2015-11-22	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	5
46	9	2015-11-22	NYR	33	NYR33	0	60:00:00	2	2	45	43	0.955999999999999961	1	\N	\N	\N	16.595600000000001	76	5
48	9	2015-11-22	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	5
54	10	2015-11-22	BUF	34	BUF34	0	45:00:00	1	1.33000000000000007	14	13	0.929000000000000048	\N	\N	\N	\N	1.25956666700000008	3	5
55	10	2015-11-22	BUF	29	BUF29	0	20:00:00	5	15	14	9	0.643000000000000016	\N	\N	\N	\N	-55.4356999999999971	13	5
52	10	2015-11-22	CON	32	CON32	0	20:00:00	1	3	11	10	0.90900000000000003	\N	\N	\N	\N	-6.90909999999999958	40	5
56	10	2015-11-22	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	5
53	10	2015-11-22	CON	24	CON24	0	45:00:00	5	6.66999999999999993	26	21	0.808000000000000052	\N	\N	\N	\N	-16.0858666700000015	77	5
60	11	2015-11-29	BOS	29	BOS29	0	31:39:00	3	5.69000000000000039	15	12	0.800000000000000044	\N	\N	\N	\N	-16.6688151699999985	15	6
57	11	2015-11-29	CON	32	CON32	0	60:00:00	3	3	51	48	0.940999999999999948	\N	\N	\N	\N	12.0940999999999992	40	6
61	11	2015-11-29	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	6
59	11	2015-11-29	BOS	30	BOS30	0	26:59:00	1	2.2200000000000002	10	9	0.900000000000000022	\N	\N	\N	\N	-4.30437924599999988	61	6
58	11	2015-11-29	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	6
62	12	2015-11-29	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	6
63	12	2015-11-29	BUF	29	BUF29	0	60:00:00	1	1	34	33	0.970999999999999974	\N	1	\N	\N	14.5970999999999993	13	6
66	12	2015-11-29	NYR	30	NYR30	0	4:32:00	0	0	4	4	1	\N	\N	\N	\N	2.10000000000000009	42	6
64	12	2015-11-29	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	6
65	12	2015-11-29	NYR	33	NYR33	0	53:45:00	2	2.22999999999999998	36	34	0.94399999999999995	\N	\N	\N	\N	8.16416744200000011	76	6
67	13	2015-12-05	BUF	34	BUF34	0	42:02:00	2	2.85000000000000009	26	24	0.923000000000000043	\N	\N	\N	\N	0.672791673300000004	3	7
68	13	2015-12-05	BUF	29	BUF29	0	17:58:00	5	16.6999999999999993	19	14	0.736999999999999988	\N	\N	\N	\N	-59.7166525000000021	13	7
71	13	2015-12-05	BOS	29	BOS29	0	14:28:00	1	4.15000000000000036	8	7	0.875	\N	\N	\N	\N	-13.0023617500000004	15	7
72	13	2015-12-05	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	7
69	13	2015-12-05	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	7
70	13	2015-12-05	BOS	30	BOS30	0	45:32:00	5	6.58999999999999986	17	12	0.705999999999999961	\N	\N	\N	\N	-20.2837191799999985	61	7
76	14	2015-12-06	BOS	29	BOS29	0	60:00:00	1	1	25	24	0.959999999999999964	\N	\N	\N	\N	8.09600000000000009	15	7
73	14	2015-12-06	NYR	31	NYR31	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	22	7
74	14	2015-12-06	NYR	30	NYR30	0	59:05:00	2	2.0299999999999998	38	36	0.946999999999999953	\N	\N	\N	\N	9.97058152299999989	42	7
77	14	2015-12-06	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	7
75	14	2015-12-06	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	7
78	15	2015-12-06	BUF	34	BUF34	0	65:00:00	2	1.85000000000000009	24	22	0.917000000000000037	\N	\N	\N	\N	3.70708461499999986	3	7
79	15	2015-12-06	BUF	29	BUF29	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	13	7
81	15	2015-12-06	CON	32	CON32	0	64:41:00	2	1.8600000000000001	44	42	0.95499999999999996	\N	\N	\N	1	18.6747321600000014	40	7
80	15	2015-12-06	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	7
82	15	2015-12-06	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	7
85	16	2015-12-13	NYR	31	NYR31	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	22	8
83	16	2015-12-13	CON	32	CON32	0	63:14:00	3	2.85000000000000009	38	35	0.921000000000000041	\N	\N	\N	\N	6.20570042199999961	40	8
86	16	2015-12-13	NYR	30	NYR30	0	65:00:00	3	2.77000000000000002	47	44	0.936000000000000054	\N	\N	\N	\N	11.0166769200000001	42	8
84	16	2015-12-13	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	8
87	16	2015-12-13	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	8
88	17	2015-12-20	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	9
89	17	2015-12-20	BUF	29	BUF29	0	60:00:00	1	1	46	45	0.97799999999999998	\N	\N	1	\N	19.5977999999999994	13	9
92	17	2015-12-20	BOS	29	BOS29	0	60:00:00	0	0	24	24	1	\N	1	\N	1	19.1000000000000014	15	9
93	17	2015-12-20	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	9
90	17	2015-12-20	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	9
91	17	2015-12-20	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	9
97	18	2015-12-27	BUF	34	BUF34	0	30:58:00	2	3.87999999999999989	15	13	0.866999999999999993	\N	\N	\N	\N	-8.91383821300000001	3	10
98	18	2015-12-27	BUF	29	BUF29	0	29:02:00	5	10.3300000000000001	22	17	0.77300000000000002	\N	\N	\N	\N	-32.7545025300000034	13	10
95	18	2015-12-27	NYR	31	NYR31	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	22	10
96	18	2015-12-27	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	10
99	18	2015-12-27	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	10
94	18	2015-12-27	NYR	33	NYR33	0	60:00:00	3	3	28	25	0.893000000000000016	\N	\N	\N	\N	0.589300000000000046	76	10
101	19	2015-12-27	BOS	29	BOS29	0	60:00:00	1	1	34	33	0.970999999999999974	\N	\N	\N	\N	12.5970999999999993	15	10
103	19	2015-12-27	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	10
104	19	2015-12-27	CON	32	CON32	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	40	10
102	19	2015-12-27	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	10
100	19	2015-12-27	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	10
105	19	2015-12-27	CON	24	CON24	0	59:25:00	2	2.02000000000000002	44	42	0.95499999999999996	\N	\N	\N	\N	13.0169586299999995	77	10
106	20	2016-01-03	BUF	34	BUF34	0	80:00:00	3	2.25	44	41	0.932000000000000051	\N	\N	\N	\N	11.5931999999999995	3	11
107	20	2016-01-03	BUF	29	BUF29	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	13	11
110	20	2016-01-03	BOS	29	BOS29	0	80:00:00	4	3	29	25	0.861999999999999988	\N	\N	\N	\N	0.586200000000000054	15	11
111	20	2016-01-03	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	11
108	20	2016-01-03	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	11
109	20	2016-01-03	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	11
112	21	2016-01-03	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	11
115	21	2016-01-03	NYR	30	NYR30	0	16:33:00	1	3.62999999999999989	7	6	0.856999999999999984	\N	\N	\N	\N	-11.4158105699999997	42	11
114	21	2016-01-03	NYR	33	NYR33	0	43:10:00	4	5.55999999999999961	26	22	0.845999999999999974	\N	\N	\N	\N	-11.1547822399999994	76	11
113	21	2016-01-03	CON	24	CON24	0	60:00:00	1	1	36	35	0.971999999999999975	\N	1	\N	\N	15.5972000000000008	77	11
118	22	2016-01-09	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	12
119	22	2016-01-09	CON	32	CON32	0	60:00:00	3	3	51	48	0.940999999999999948	\N	\N	\N	\N	12.0940999999999992	40	12
117	22	2016-01-09	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	12
116	22	2016-01-09	NYR	33	NYR33	0	59:47:00	4	4.00999999999999979	34	30	0.882000000000000006	\N	\N	\N	\N	-0.969787175899999965	76	12
120	22	2016-01-09	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	12
124	23	2016-01-10	BOS	29	BOS29	0	51:32:00	1	1.15999999999999992	26	25	0.961999999999999966	\N	\N	\N	\N	7.93902018100000006	15	12
122	23	2016-01-10	NYR	30	NYR30	0	32:59:00	5	9.09999999999999964	20	15	0.75	\N	\N	\N	\N	-28.8070111199999985	42	12
125	23	2016-01-10	BOS	1	BOS1	0	8:28:00	0	0	3	3	1	\N	\N	\N	\N	1.60000000000000009	57	12
123	23	2016-01-10	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	12
121	23	2016-01-10	NYR	33	NYR33	0	27:01:00	3	6.66000000000000014	19	16	0.841999999999999971	\N	\N	\N	\N	-18.5660159200000017	76	12
126	24	2016-01-10	BUF	34	BUF34	0	59:52:00	5	5.00999999999999979	42	37	0.881000000000000005	\N	\N	\N	\N	-1.45644342999999998	3	12
127	24	2016-01-10	BUF	29	BUF29	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	13	12
129	24	2016-01-10	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	12
130	24	2016-01-10	CON	32	CON32	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	40	12
128	24	2016-01-10	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	12
131	24	2016-01-10	CON	24	CON24	0	60:00:00	3	3	37	34	0.919000000000000039	\N	\N	\N	\N	5.09189999999999987	77	12
135	25	2016-01-17	BOS	29	BOS29	0	60:00:00	1	1	27	26	0.962999999999999967	\N	\N	\N	\N	9.09629999999999939	15	13
132	25	2016-01-17	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	13
133	25	2016-01-17	CON	32	CON32	0	60:00:00	4	4	49	45	0.918000000000000038	\N	\N	\N	\N	6.5918000000000001	40	13
136	25	2016-01-17	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	13
134	25	2016-01-17	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	13
137	26	2016-01-17	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	13
138	26	2016-01-17	BUF	29	BUF29	0	34:30:00	1	1.73999999999999999	26	25	0.961999999999999966	\N	\N	\N	\N	5.63967826100000025	13	13
141	26	2016-01-17	NYR	30	NYR30	0	65:00:00	5	4.62000000000000011	47	42	0.894000000000000017	\N	\N	\N	\N	2.62786153799999989	42	13
139	26	2016-01-17	BUF	1	BUF1	0	30:30:00	4	7.87000000000000011	25	21	0.839999999999999969	\N	\N	\N	\N	-20.8914098400000015	58	13
140	26	2016-01-17	NYR	33	NYR33	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	76	13
145	27	2016-01-31	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	14
146	27	2016-01-31	BUF	29	BUF29	0	60:00:00	2	2	22	20	0.90900000000000003	\N	\N	\N	\N	2.09089999999999998	13	14
144	27	2016-01-31	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	14
143	27	2016-01-31	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	14
147	27	2016-01-31	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	14
142	27	2016-01-31	NYR	33	NYR33	0	59:07:00	3	3.04000000000000004	45	42	0.933000000000000052	\N	\N	\N	\N	8.91399354400000021	76	14
149	28	2016-01-31	BOS	29	BOS29	0	60:00:00	2	2	23	21	0.913000000000000034	\N	\N	\N	\N	2.59129999999999994	15	14
152	28	2016-01-31	CON	32	CON32	0	60:00:00	5	5	59	54	0.915000000000000036	\N	\N	\N	\N	7.09149999999999991	40	14
150	28	2016-01-31	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	14
148	28	2016-01-31	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	14
153	28	2016-01-31	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	14
151	28	2016-01-31	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	14
154	29	2016-02-06	BOS	29	BOS29	0	60:00:00	1	1	24	23	0.957999999999999963	\N	\N	\N	\N	7.59579999999999966	15	15
158	29	2016-02-06	NYR	1	NYR1	0	60:00:00	6	6	35	29	0.828999999999999959	\N	\N	\N	\N	-9.41709999999999958	19	15
157	29	2016-02-06	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	15
155	29	2016-02-06	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	15
156	29	2016-02-06	NYR	33	NYR33	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	76	15
159	30	2016-02-07	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	15
160	30	2016-02-07	BUF	29	BUF29	0	62:08:00	2	1.92999999999999994	34	32	0.940999999999999948	\N	\N	\N	\N	8.36877811199999933	13	15
161	30	2016-02-07	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	15
162	30	2016-02-07	CON	78	CON78	0	62:08:00	2	1.92999999999999994	25	23	0.92000000000000004	\N	\N	\N	\N	3.86667811199999978	83	15
163	30	2016-02-07	CON	32	CON32	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	40	15
164	30	2016-02-07	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	15
165	31	2016-02-14	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	16
166	31	2016-02-14	BUF	29	BUF29	0	80:00:00	3	2.25	26	23	0.885000000000000009	\N	\N	\N	\N	2.5884999999999998	13	16
170	31	2016-02-14	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	16
169	31	2016-02-14	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	16
167	31	2016-02-14	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	16
168	31	2016-02-14	NYR	33	NYR33	0	80:00:00	3	2.25	38	35	0.921000000000000041	\N	1	\N	\N	10.5921000000000003	76	16
173	32	2016-02-14	BOS	29	BOS29	0	60:00:00	2	2	17	15	0.882000000000000006	\N	\N	\N	\N	-0.411799999999999999	15	16
174	32	2016-02-14	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	16
172	32	2016-02-14	CON	24	CON24	0	58:42:00	3	3.06999999999999984	42	39	0.929000000000000048	\N	\N	\N	\N	7.32714190799999976	77	16
171	32	2016-02-14	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	16
176	33	2016-02-21	BOS	29	BOS29	0	60:00:00	3	3	22	19	0.86399999999999999	\N	\N	\N	\N	-2.41360000000000019	15	17
179	33	2016-02-21	CON	32	CON32	0	59:20:00	4	4.04000000000000004	65	61	0.937999999999999945	\N	\N	\N	\N	14.4140247200000005	40	17
177	33	2016-02-21	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	17
175	33	2016-02-21	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	17
180	33	2016-02-21	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	17
178	33	2016-02-21	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	17
184	34	2016-02-21	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	17
185	34	2016-02-21	BUF	29	BUF29	0	60:00:00	1	1	19	18	0.946999999999999953	\N	\N	1	\N	6.09469999999999956	13	17
183	34	2016-02-21	NYR	1	NYR1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	17
182	34	2016-02-21	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	17
186	34	2016-02-21	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	17
181	34	2016-02-21	NYR	33	NYR33	0	58:37:00	4	4.08999999999999986	33	29	0.879000000000000004	\N	\N	\N	\N	-1.78969454100000003	76	17
189	35	2016-02-28	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	18
190	35	2016-02-28	BUF	29	BUF29	0	58:39:00	3	3.06999999999999984	36	33	0.917000000000000037	\N	\N	\N	\N	4.31548516600000021	13	18
187	35	2016-02-28	BOS	29	BOS29	0	60:00:00	2	2	27	25	0.926000000000000045	\N	\N	\N	\N	4.59260000000000002	15	18
188	35	2016-02-28	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	18
191	35	2016-02-28	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	18
192	36	2016-02-28	NYR	78	NYR78	0	59:25:00	3	3.0299999999999998	25	22	0.880000000000000004	\N	\N	\N	\N	-1.02981206199999997	19	18
195	36	2016-02-28	CON	32	CON32	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	40	18
194	36	2016-02-28	NYR	30	NYR30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	42	18
193	36	2016-02-28	NYR	33	NYR33	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	76	18
196	36	2016-02-28	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	18
197	36	2016-02-28	CON	78	CON78	0	60:00:00	2	2	25	23	0.92000000000000004	\N	\N	\N	\N	3.59200000000000008	83	18
201	37	2016-03-04	BOS	29	BOS29	0	60:00:00	0	0	17	17	1	\N	\N	\N	1	13.5999999999999996	15	19
198	37	2016-03-04	NYR	78	NYR78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	19	19
199	37	2016-03-04	NYR	30	NYR30	0	60:00:00	6	6	56	50	0.893000000000000016	\N	\N	\N	\N	1.08929999999999993	42	19
202	37	2016-03-04	BOS	1	BOS1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	57	19
200	37	2016-03-04	BOS	30	BOS30	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	61	19
203	38	2016-03-04	BUF	34	BUF34	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	3	19
204	38	2016-03-04	BUF	29	BUF29	0	57:16:00	2	2.10000000000000009	20	18	0.900000000000000022	\N	\N	\N	\N	0.708160651899999993	13	19
207	38	2016-03-04	CON	32	CON32	0	60:00:00	0	0	35	35	1	1	\N	\N	1	25.6000000000000014	40	19
205	38	2016-03-04	BUF	1	BUF1	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	58	19
208	38	2016-03-04	CON	24	CON24	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	77	19
206	38	2016-03-04	CON	78	CON78	0	0:00:00	0	0	0	0	0	\N	\N	\N	\N	0	83	19
\.


--
-- Name: goalies_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('goalies_stats_id_seq', 1, false);


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY leagues (id, league_name, max_gms, current_gms, current_week) FROM stdin;
3	Epicodus	8	2	2
2	Cleaning Supplies	8	3	\N
1	UK Hockey	8	2	10
4	Hawaii Rocks	8	1	\N
\.


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('leagues_id_seq', 4, true);


--
-- Data for Name: leagues_teams; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY leagues_teams (id, league_id, team_id) FROM stdin;
1	1	1
2	1	2
4	3	4
5	3	5
7	2	7
8	2	8
9	2	9
10	4	10
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY players (id, player_name, pos, salary, url, profile_pic) FROM stdin;
1	Alyssa Gagliardi	D	16000	http://www.eliteprospects.com/player.php?player=367027	\N
2	Alyssa Wohlfeiler	F	10000	http://www.eliteprospects.com/player.php?player=366443	\N
3	Amanda Makela	G	15000	http://www.eliteprospects.com/player.php?player=368661	\N
4	Amanda Pelkey	F	13500	http://www.eliteprospects.com/player.php?player=368807	\N
5	Amber Moore	D	10000	http://www.eliteprospects.com/player.php?player=397229	\N
6	Annemarie Cellino	F	10000	http://www.eliteprospects.com/player.php?player=397226	\N
7	Anya Battaglino	D	10000	http://www.eliteprospects.com/player.php?player=368399	\N
8	Ashley Johnston	D	14000	http://www.eliteprospects.com/player.php?player=389633	\N
9	Beth Hanrahan	F	10500	http://www.eliteprospects.com/player.php?player=369326	\N
10	Blake Bolden	D	15000	http://www.eliteprospects.com/player.php?player=367028	\N
11	Bray Ketchum	F	14000	http://www.eliteprospects.com/player.php?player=367042	\N
12	Brianna Decker	F	22000	http://www.eliteprospects.com/player.php?player=367034	\N
13	Brianne Mclaughlin	G	22000	http://www.eliteprospects.com/player.php?player=369313	\N
14	Brittany Dougherty	F	10000	http://www.eliteprospects.com/player.php?player=366331	\N
15	Brittany Ott	G	17000	http://www.eliteprospects.com/player.php?player=367044	\N
16	Brooke Ammerman	F	16500	http://www.eliteprospects.com/player.php?player=366877	\N
17	Casey Pickett	F	10000	http://www.eliteprospects.com/player.php?player=367030	\N
18	Celeste Brown	F	15000	http://www.eliteprospects.com/player.php?player=369324	\N
19	Chelsea Laden	G	14000	http://www.eliteprospects.com/player.php?player=369320	\N
20	Cherie Hendrickson	D	10000	http://www.eliteprospects.com/player.php?player=369187	\N
21	Cherie Stewart	F	10000	http://www.eliteprospects.com/player.php?player=397231	\N
22	Corinne Boyles	G	10000	http://www.eliteprospects.com/player.php?player=368801	\N
23	Corinne Buie	F	12000	http://www.eliteprospects.com/player.php?player=367040	\N
24	Courtney Carnes	F	10000	http://www.eliteprospects.com/player.php?player=397224	\N
25	Danielle Ward	F	10000	http://www.eliteprospects.com/player.php?player=369321	\N
26	Denna Laing	F	10000	http://www.eliteprospects.com/player.php?player=367041	\N
27	Devon Skeats	F	15000	http://www.eliteprospects.com/player.php?player=369316	\N
28	Elena Orlando	D	10000	http://www.eliteprospects.com/player.php?player=366330	\N
29	Emily Field	F	13500	http://www.eliteprospects.com/player.php?player=368852	\N
30	Emily Pfalzer	D	21000	http://www.eliteprospects.com/player.php?player=368821	\N
31	Erin Barley-Maloney	F	14000	http://www.eliteprospects.com/player.php?player=389631	\N
32	Erin Zach	F	13000	http://www.eliteprospects.com/player.php?player=369315	\N
33	Gabie Figueroa	D	10000	http://www.eliteprospects.com/player.php?player=368822	\N
34	Gigi Marvin	D	20000	http://www.eliteprospects.com/player.php?player=367047	\N
35	Hailey Browne	F	15000	http://www.eliteprospects.com/player.php?player=368673	\N
36	Hannah McGowan	F	10000	http://www.eliteprospects.com/player.php?player=389618	\N
37	Hayley Moore	F	10000	http://www.eliteprospects.com/player.php?player=136230	\N
38	Hayley Williams	F	13000	http://www.eliteprospects.com/player.php?player=389622	\N
39	Hilary Knight	F	22000	http://www.eliteprospects.com/player.php?player=367043	\N
40	Jaimie Leonoff	G	10000	http://www.eliteprospects.com/player.php?player=369323	\N
41	Janine Weber	F	19500	http://www.eliteprospects.com/player.php?player=367029	\N
42	Jenny Scrivens	G	10000	http://www.eliteprospects.com/player.php?player=376587	\N
43	Jessica Fickel	F	15000	http://www.eliteprospects.com/player.php?player=375073	\N
44	Jessica Koizumi	F	20500	http://www.eliteprospects.com/player.php?player=367045	\N
45	Jillian Dempsey	F	10500	http://www.eliteprospects.com/player.php?player=367026	\N
46	Jordan Brickner	D	10000	http://www.eliteprospects.com/player.php?player=366169	\N
47	Jordan Smelker	F	16000	http://www.eliteprospects.com/player.php?player=367037	\N
48	Kacey Bellamy	D	22000	http://www.eliteprospects.com/player.php?player=367054	\N
49	Kaleigh Fratkin	D	20000	http://www.eliteprospects.com/player.php?player=59978	\N
50	Kate Buesser	F	10000	http://www.eliteprospects.com/player.php?player=368393	\N
51	Katia Pashkevitch	D	10000	http://www.eliteprospects.com/player.php?player=368065	\N
52	Kelley Steadman	F	10000	http://www.eliteprospects.com/player.php?player=368790	\N
53	Kelli Stack	F	25000	http://www.eliteprospects.com/player.php?player=367048	\N
54	Kelly Babstock	F	18000	http://www.eliteprospects.com/player.php?player=389630	\N
55	Kelly Cooke	F	10500	http://www.eliteprospects.com/player.php?player=367025	\N
56	Kelly Mcdonald	D	13000	http://www.eliteprospects.com/player.php?player=369318	\N
57	Kelsie Fralick	G	10000	http://www.eliteprospects.com/player.php?player=389602	\N
58	Kimberly Sass	G	10000	http://www.eliteprospects.com/player.php?player=389621	\N
59	Kira Dosdall	D	13500	http://www.eliteprospects.com/player.php?player=368400	\N
60	Kourtney Kunichika	F	10000	http://www.eliteprospects.com/player.php?player=389615	\N
61	Lauren Slebodnick	G	12500	http://www.eliteprospects.com/player.php?player=389603	\N
62	Lindsay Berman	D	15000	http://www.eliteprospects.com/player.php?player=368397	\N
63	Lindsay Grigg	D	13000	http://www.eliteprospects.com/player.php?player=369317	\N
64	Liudmila Belyakova	F	20000	http://www.eliteprospects.com/player.php?player=369327	\N
65	Madison Packer	F	15000	http://www.eliteprospects.com/player.php?player=368786	\N
66	Maggie Giamo	F	10000	http://www.eliteprospects.com/player.php?player=397225	\N
67	Margot Scharfe	F	10000	http://www.eliteprospects.com/player.php?player=397230	\N
68	Marissa Gedman	D	10000	http://www.eliteprospects.com/player.php?player=368824	\N
69	Meagan Mangene	D	22500	http://www.eliteprospects.com/player.php?player=368785	\N
70	Megan Bozek	D	10000	http://www.eliteprospects.com/player.php?player=367151	\N
71	Meghan Duggan	F	22500	http://www.eliteprospects.com/player.php?player=367036	\N
72	Meghan Fardelmann	F	20000	http://www.eliteprospects.com/player.php?player=389632	\N
73	Micaela Long	F	10000	http://www.eliteprospects.com/player.php?player=369178	\N
74	Molly Engstrom	D	12000	http://www.eliteprospects.com/player.php?player=369097	\N
75	Morgan Fritz-Ward	F	12500	http://www.eliteprospects.com/player.php?player=369325	\N
76	Nana Fujimoto	G	21000	http://www.eliteprospects.com/player.php?player=373172	\N
77	Nicole Stock	G	10000	http://www.eliteprospects.com/player.php?player=367024	\N
78	Paige Harrington	D	10000	http://www.eliteprospects.com/player.php?player=389614	\N
79	Rachel Llanes	F	10500	http://www.eliteprospects.com/player.php?player=367033	\N
80	Sam Faber	F	13500	http://www.eliteprospects.com/player.php?player=369177	\N
81	Shannon Doyle	D	15000	http://www.eliteprospects.com/player.php?player=368643	\N
82	Shelby Bram	F	15000	http://www.eliteprospects.com/player.php?player=368666	\N
83	Shenae Lundberg	G	15000	http://www.eliteprospects.com/player.php?player=368848	\N
84	Shiann Darkangelo	F	17000	http://www.eliteprospects.com/player.php?player=368850	\N
85	Sydney Kidd	D	15000	http://www.eliteprospects.com/player.php?player=367597	\N
86	Tara Tomimoto	D	10000	http://www.eliteprospects.com/player.php?player=369322	\N
87	Tatiana Rafter	F	15000	http://www.eliteprospects.com/player.php?player=389620	\N
88	Taylor Holze	F	10000	http://www.eliteprospects.com/player.php?player=393622	\N
89	Yekaterina Smolentseva	F	22000	http://www.eliteprospects.com/player.php?player=368054	\N
90	Zoe Hickel	F	16000	http://www.eliteprospects.com/player.php?player=368828	\N
91	Breann Frykas	F	10000	http://www.eliteprospects.com/player.php?player=368637	\N
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('players_id_seq', 1, false);


--
-- Data for Name: players_teams; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY players_teams (id, team_id, player_id, starter) FROM stdin;
29	9	42	t
30	8	53	t
31	7	39	t
32	9	55	t
33	8	54	t
34	7	76	t
1	1	17	f
5	1	55	f
2	1	30	t
6	1	70	t
4	1	12	t
3	1	39	t
13	1	76	t
8	2	24	f
11	2	29	t
10	2	71	t
12	2	41	t
7	2	44	t
9	2	2	t
15	5	13	t
17	5	12	t
19	5	16	t
21	5	47	t
23	5	11	t
25	5	35	f
28	5	90	f
18	4	42	f
20	4	71	f
26	4	54	t
16	4	39	t
22	4	15	t
24	4	53	t
27	4	52	t
\.


--
-- Name: players_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('players_teams_id_seq', 34, true);


--
-- Data for Name: rosters; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY rosters (id, team_id, player_id, week) FROM stdin;
46	1	17	1
47	1	39	1
48	1	55	1
49	1	70	1
50	1	76	1
51	2	2	1
52	2	24	1
53	2	41	1
54	2	44	1
55	2	71	1
56	1	12	2
57	1	30	2
58	1	39	2
59	1	70	2
60	1	76	2
61	2	2	2
62	2	24	2
63	2	41	2
64	2	44	2
65	2	71	2
66	1	12	3
67	1	17	3
68	1	39	3
69	1	55	3
70	1	76	3
71	2	2	3
72	2	24	3
73	2	41	3
74	2	44	3
75	2	71	3
76	1	12	4
77	1	17	4
78	1	39	4
79	1	55	4
80	1	76	4
81	2	2	4
82	2	24	4
83	2	41	4
84	2	44	4
85	2	71	4
86	1	12	5
87	1	17	5
88	1	39	5
89	1	55	5
90	1	76	5
91	2	2	5
92	2	24	5
93	2	41	5
94	2	44	5
95	2	71	5
96	1	12	6
97	1	17	6
98	1	39	6
99	1	55	6
100	1	76	6
101	2	2	6
102	2	29	6
103	2	41	6
104	2	44	6
105	2	71	6
106	1	12	7
107	1	17	7
108	1	39	7
109	1	55	7
110	1	76	7
111	2	2	7
112	2	29	7
113	2	41	7
114	2	44	7
115	2	71	7
116	1	12	8
117	1	17	8
118	1	39	8
119	1	55	8
120	1	76	8
121	2	2	8
122	2	29	8
123	2	41	8
124	2	44	8
125	2	71	8
126	1	12	9
127	1	17	9
128	1	39	9
129	1	55	9
130	1	76	9
131	2	2	9
132	2	29	9
133	2	41	9
134	2	44	9
135	2	71	9
136	4	15	1
137	4	39	1
138	4	52	1
139	4	53	1
140	4	71	1
141	5	11	1
142	5	12	1
143	5	13	1
144	5	16	1
145	5	47	1
146	4	15	2
147	4	39	2
148	4	52	2
149	4	53	2
150	4	54	2
151	5	11	2
152	5	12	2
153	5	13	2
154	5	16	2
155	5	47	2
156	1	12	10
157	1	30	10
158	1	39	10
159	1	70	10
160	1	76	10
161	2	2	10
162	2	29	10
163	2	41	10
164	2	44	10
165	2	71	10
\.


--
-- Name: rosters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('rosters_id_seq', 165, true);


--
-- Data for Name: skaters_stats; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY skaters_stats (id, game, game_date, team, player_number, pt_number, pos, goals, assists, points, pim, shots, ppg, shg, fo_w_l, fow, fol, gwg, star1, star2, star3, sog, fantasy_points, player_id, week) FROM stdin;
23	1	2015-10-11	CON	88	CON88	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	2	1
11	1	2015-10-11	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	1
28	1	2015-10-11	CON	17	CON17	D 	0	0	0	2	0	0	0	2-1 	2	1	0	\N	\N	\N	\N	0.599999999999999978	7	1
9	1	2015-10-11	NYR	10	NYR10	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	8	1
7	1	2015-10-11	NYR	28	NYR28	F 	0	0	0	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991	9	1
8	1	2015-10-11	NYR	17	NYR17	F 	0	0	0	0	6	0	0	3-2 	3	2	0	\N	\N	\N	\N	3.10000000000000009	11	1
29	1	2015-10-11	CON	19	CON19	F 	0	0	0	0	2	0	0	1-1 	1	1	0	\N	\N	\N	\N	1	14	1
1	1	2015-10-11	NYR	20	NYR20	F 	1	0	1	0	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	5.5	16	1
3	1	2015-10-11	NYR	24	NYR24	F 	0	0	0	0	1	0	0	3-13 	3	13	0	\N	\N	\N	\N	-0.5	18	1
25	1	2015-10-11	CON	22	CON22	F 	0	0	0	2	1	0	0	7-0 	7	0	0	\N	\N	\N	\N	1.69999999999999996	25	1
10	1	2015-10-11	NYR	4	NYR4	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	28	1
4	1	2015-10-11	NYR	21	NYR21	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	33	1
13	1	2015-10-11	NYR	12	NYR12	F 	0	0	0	0	2	0	0	1-9 	1	9	0	\N	\N	\N	\N	0.200000000000000011	41	1
18	1	2015-10-11	CON	56	CON56	F 	1	0	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036	44	1
19	1	2015-10-11	CON	26	CON26	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	46	1
22	1	2015-10-11	CON	13	CON13	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	49	1
16	1	2015-10-11	CON	61	CON61	F 	1	2	3	2	4	0	0	17-6 	17	6	1	\N	1	\N	\N	18.6000000000000014	53	1
17	1	2015-10-11	CON	8	CON8	F 	1	1	2	0	6	0	0	2-1 	2	1	0	\N	\N	1	\N	10.0999999999999996	54	1
5	1	2015-10-11	NYR	26	NYR26	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	59	1
26	1	2015-10-11	CON	10	CON10	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	62	1
2	1	2015-10-11	NYR	9	NYR9	F 	0	1	1	0	4	0	0	4-8 	4	8	0	\N	\N	\N	\N	3.60000000000000009	64	1
14	1	2015-10-11	NYR	14	NYR14	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	65	1
15	1	2015-10-11	NYR	18	NYR18	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	72	1
21	1	2015-10-11	CON	16	CON16	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	73	1
27	1	2015-10-11	CON	9	CON9	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	74	1
12	1	2015-10-11	NYR	11	NYR11	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	75	1
24	1	2015-10-11	CON	28	CON28	F 	0	0	0	0	0	0	0	4-2 	4	2	0	\N	\N	\N	\N	0.200000000000000011	80	1
30	1	2015-10-11	CON	6	CON6	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	81	1
20	1	2015-10-11	CON	27	CON27	F 	1	0	1	0	4	0	0	2-1 	2	1	0	\N	\N	\N	\N	6.09999999999999964	84	1
6	1	2015-10-11	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	88	1
33	2	2015-10-11	BOS	2	BOS2	D 	0	2	2	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	7	1	1
35	2	2015-10-11	BOS	16	BOS16	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	4	1
53	2	2015-10-11	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	1
43	2	2015-10-11	BOS	10	BOS10	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	10	1
34	2	2015-10-11	BOS	14	BOS14	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	12	1
39	2	2015-10-11	BOS	23	BOS23	F 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	23	1
56	2	2015-10-11	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	1
41	2	2015-10-11	BOS	15	BOS15	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	29	1
48	2	2015-10-11	BUF	7	BUF7	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	30	1
45	2	2015-10-11	BOS	19	BOS19	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	34	1
50	2	2015-10-11	BUF	24	BUF24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	35	1
60	2	2015-10-11	BUF	12	BUF12	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	36	1
51	2	2015-10-11	BUF	77	BUF77	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	38	1
32	2	2015-10-11	BOS	21	BOS21	F 	2	0	2	0	7	1	0	0-0 	0	0	1	\N	1	\N	\N	19	39	1
58	2	2015-10-11	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	1
37	2	2015-10-11	BOS	3	BOS3	F 	0	1	1	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	45	1
36	2	2015-10-11	BOS	11	BOS11	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	47	1
31	2	2015-10-11	BOS	22	BOS22	D 	0	2	2	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	48	1
47	2	2015-10-11	BUF	3	BUF3	F 	1	0	1	0	6	1	0	0-0 	0	0	0	1	\N	\N	\N	10.5	52	1
42	2	2015-10-11	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	1
61	2	2015-10-11	BUF	14	BUF14	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	56	1
52	2	2015-10-11	BUF	36	BUF36	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	60	1
49	2	2015-10-11	BUF	26	BUF26	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	66	1
44	2	2015-10-11	BOS	12	BOS12	D 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	68	1
59	2	2015-10-11	BUF	9	BUF9	D 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	70	1
46	2	2015-10-11	BUF	10	BUF10	F 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	71	1
57	2	2015-10-11	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	1
40	2	2015-10-11	BOS	91	BOS91	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	78	1
55	2	2015-10-11	BUF	13	BUF13	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	82	1
54	2	2015-10-11	BUF	43	BUF43	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	87	1
38	2	2015-10-11	BOS	44	BOS44	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	90	1
70	3	2015-10-18	CON	88	CON88	F 	1	0	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	2	2
80	3	2015-10-18	BUF	15	BUF15	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	6	2
74	3	2015-10-18	CON	4	CON4	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	7	2
76	3	2015-10-18	CON	1	CON1	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	91	2
72	3	2015-10-18	CON	19	CON19	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	14	2
87	3	2015-10-18	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	2
77	3	2015-10-18	CON	22	CON22	F 	0	0	0	0	1	0	0	4-8 	4	8	0	\N	\N	\N	\N	0.100000000000000006	25	2
89	3	2015-10-18	BUF	7	BUF7	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	30	2
82	3	2015-10-18	BUF	24	BUF24	F 	0	0	0	2	2	0	0	2-2 	2	2	0	\N	\N	\N	\N	1.5	35	2
91	3	2015-10-18	BUF	12	BUF12	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	36	2
84	3	2015-10-18	BUF	77	BUF77	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	38	2
69	3	2015-10-18	CON	26	CON26	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	46	2
62	3	2015-10-18	CON	13	CON13	D 	1	2	3	4	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	12	49	2
71	3	2015-10-18	CON	5	CON5	F 	1	0	1	0	5	0	0	7-11 	7	11	1	\N	\N	\N	\N	11.0999999999999996	50	2
79	3	2015-10-18	BUF	3	BUF3	F 	1	1	2	2	5	0	0	0-1 	0	1	0	\N	\N	1	\N	9.90000000000000036	52	2
67	3	2015-10-18	CON	61	CON61	F 	0	1	1	2	10	0	0	11-14 	11	14	0	\N	\N	\N	\N	7.20000000000000018	53	2
63	3	2015-10-18	CON	8	CON8	F 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	54	2
92	3	2015-10-18	BUF	14	BUF14	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	56	2
83	3	2015-10-18	BUF	36	BUF36	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	60	2
66	3	2015-10-18	CON	10	CON10	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	62	2
81	3	2015-10-18	BUF	26	BUF26	F 	0	0	0	2	4	0	0	5-7 	5	7	0	\N	\N	\N	\N	2.29999999999999982	66	2
90	3	2015-10-18	BUF	9	BUF9	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	70	2
78	3	2015-10-18	BUF	10	BUF10	F 	1	1	2	2	6	0	1	3-2 	3	2	0	\N	1	\N	\N	12.5999999999999996	71	2
75	3	2015-10-18	CON	16	CON16	F 	0	0	0	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	73	2
68	3	2015-10-18	CON	9	CON9	D 	1	0	1	0	6	1	0	0-0 	0	0	0	\N	\N	\N	\N	7.5	74	2
88	3	2015-10-18	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	2
64	3	2015-10-18	CON	28	CON28	F 	1	1	2	0	4	1	0	0-0 	0	0	0	\N	\N	\N	\N	8.5	80	2
73	3	2015-10-18	CON	6	CON6	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	81	2
86	3	2015-10-18	BUF	13	BUF13	F 	0	0	0	0	1	0	0	12-9 	12	9	0	\N	\N	\N	\N	0.800000000000000044	82	2
65	3	2015-10-18	CON	27	CON27	F 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	84	2
85	3	2015-10-18	BUF	43	BUF43	F 	0	0	0	4	1	0	0	3-2 	3	2	0	\N	\N	\N	\N	1.60000000000000009	87	2
102	4	2015-10-18	BOS	2	BOS2	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	1	2
100	4	2015-10-18	BOS	16	BOS16	F 	0	1	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991	4	2
125	4	2015-10-18	NYR	2	NYR2	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	5	2
126	4	2015-10-18	NYR	10	NYR10	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	8	2
119	4	2015-10-18	NYR	28	NYR28	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	9	2
93	4	2015-10-18	BOS	10	BOS10	D 	1	2	3	6	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	12.5	10	2
121	4	2015-10-18	NYR	17	NYR17	F 	0	0	0	0	3	0	0	2-0 	2	0	0	\N	\N	\N	\N	1.69999999999999996	11	2
95	4	2015-10-18	BOS	14	BOS14	F 	2	1	3	0	6	0	1	12-11 	12	11	1	\N	1	\N	\N	21.1000000000000014	12	2
114	4	2015-10-18	NYR	20	NYR20	F 	0	0	0	0	0	0	0	8-7 	8	7	0	\N	\N	\N	\N	0.100000000000000006	16	2
111	4	2015-10-18	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	2
116	4	2015-10-18	NYR	24	NYR24	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0	18	2
108	4	2015-10-18	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	2
129	4	2015-10-18	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	2
98	4	2015-10-18	BOS	23	BOS23	F 	1	1	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8	23	2
101	4	2015-10-18	BOS	24	BOS24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	26	2
124	4	2015-10-18	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	2
107	4	2015-10-18	BOS	15	BOS15	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	29	2
113	4	2015-10-18	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	2
112	4	2015-10-18	NYR	21	NYR21	D 	1	0	1	0	3	0	0	1-0 	1	0	0	\N	\N	1	\N	6.59999999999999964	33	2
109	4	2015-10-18	BOS	19	BOS19	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	34	2
97	4	2015-10-18	BOS	21	BOS21	F 	0	2	2	2	7	0	0	8-5 	8	5	0	\N	\N	\N	\N	8.30000000000000071	39	2
130	4	2015-10-18	NYR	12	NYR12	F 	0	0	0	0	4	0	0	4-8 	4	8	0	\N	\N	\N	\N	1.60000000000000009	41	2
105	4	2015-10-18	BOS	3	BOS3	F 	0	0	0	0	0	0	0	5-3 	5	3	0	\N	\N	\N	\N	0.200000000000000011	45	2
96	4	2015-10-18	BOS	11	BOS11	F 	1	1	2	0	3	1	0	0-1 	0	1	0	\N	\N	\N	\N	7.90000000000000036	47	2
106	4	2015-10-18	BOS	22	BOS22	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	48	2
110	4	2015-10-18	BOS	5	BOS5	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006	55	2
117	4	2015-10-18	NYR	26	NYR26	D 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	59	2
122	4	2015-10-18	NYR	9	NYR9	F 	0	0	0	2	0	0	0	6-7 	6	7	0	\N	\N	\N	\N	0.400000000000000022	64	2
128	4	2015-10-18	NYR	14	NYR14	F 	0	0	0	4	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.89999999999999991	65	2
115	4	2015-10-18	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	2
99	4	2015-10-18	BOS	12	BOS12	D 	0	1	1	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	68	2
104	4	2015-10-18	BOS	57	BOS57	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	69	2
120	4	2015-10-18	NYR	18	NYR18	F 	0	0	0	0	4	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982	72	2
127	4	2015-10-18	NYR	11	NYR11	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	75	2
103	4	2015-10-18	BOS	91	BOS91	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	79	2
123	4	2015-10-18	NYR	8	NYR8	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	2
118	4	2015-10-18	NYR	91	NYR91	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0	88	2
94	4	2015-10-18	BOS	44	BOS44	F 	2	1	3	2	6	0	0	0-0 	0	0	0	1	\N	\N	\N	16.5	90	2
140	5	2015-10-25	BOS	2	BOS2	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	1	3
143	5	2015-10-25	BOS	16	BOS16	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	4	3
156	5	2015-10-25	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	3
144	5	2015-10-25	BOS	10	BOS10	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	10	3
131	5	2015-10-25	BOS	14	BOS14	F 	3	0	3	4	7	1	0	13-6 	13	6	0	\N	\N	1	\N	18.6999999999999993	12	3
134	5	2015-10-25	BOS	23	BOS23	F 	0	1	1	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009	23	3
157	5	2015-10-25	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	3
137	5	2015-10-25	BOS	15	BOS15	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	29	3
151	5	2015-10-25	BUF	7	BUF7	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	30	3
132	5	2015-10-25	BOS	19	BOS19	D 	1	0	1	0	4	1	0	0-1 	0	1	1	\N	\N	\N	\N	11.4000000000000004	34	3
160	5	2015-10-25	BUF	24	BUF24	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	35	3
158	5	2015-10-25	BUF	12	BUF12	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	36	3
154	5	2015-10-25	BUF	77	BUF77	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	38	3
133	5	2015-10-25	BOS	21	BOS21	F 	0	1	1	0	6	0	0	15-9 	15	9	0	\N	\N	\N	\N	5.59999999999999964	39	3
141	5	2015-10-25	BOS	3	BOS3	F 	0	0	0	2	5	0	0	10-6 	10	6	0	\N	\N	\N	\N	3.39999999999999991	45	3
138	5	2015-10-25	BOS	11	BOS11	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	47	3
136	5	2015-10-25	BOS	22	BOS22	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	48	3
146	5	2015-10-25	BUF	3	BUF3	F 	2	0	2	2	11	0	1	0-0 	0	0	0	\N	1	\N	\N	17	52	3
142	5	2015-10-25	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	3
159	5	2015-10-25	BUF	14	BUF14	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	56	3
147	5	2015-10-25	BUF	36	BUF36	F 	1	1	2	2	3	1	0	3-10 	3	10	0	\N	\N	\N	\N	7.79999999999999982	60	3
155	5	2015-10-25	BUF	26	BUF26	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	66	3
145	5	2015-10-25	BOS	12	BOS12	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	68	3
149	5	2015-10-25	BUF	9	BUF9	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	70	3
148	5	2015-10-25	BUF	10	BUF10	F 	0	1	1	2	4	0	0	7-6 	7	6	0	\N	\N	\N	\N	4.59999999999999964	71	3
152	5	2015-10-25	BUF	2	BUF2	D 	0	0	0	0	0	0	0	2-2 	2	2	0	1	\N	\N	\N	3	78	3
135	5	2015-10-25	BOS	91	BOS91	F 	0	1	1	0	6	0	0	3-3 	3	3	0	\N	\N	\N	\N	5	79	3
150	5	2015-10-25	BUF	13	BUF13	F 	0	1	1	0	4	0	0	10-13 	10	13	0	\N	\N	\N	\N	3.70000000000000018	82	3
153	5	2015-10-25	BUF	43	BUF43	F 	0	0	0	0	1	0	0	4-12 	4	12	0	\N	\N	\N	\N	-0.299999999999999989	87	3
139	5	2015-10-25	BOS	44	BOS44	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	90	3
163	6	2015-10-25	CON	88	CON88	F 	1	0	1	0	3	1	0	2-0 	2	0	0	\N	\N	\N	\N	6.20000000000000018	2	3
191	6	2015-10-25	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	3
170	6	2015-10-25	CON	4	CON4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	7	3
180	6	2015-10-25	NYR	10	NYR10	D 	1	0	1	0	2	1	0	0-0 	0	0	0	\N	\N	1	\N	6.5	8	3
185	6	2015-10-25	NYR	28	NYR28	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	9	3
188	6	2015-10-25	NYR	17	NYR17	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022	11	3
176	6	2015-10-25	CON	1	CON1	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	91	3
175	6	2015-10-25	CON	19	CON19	F 	0	0	0	2	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978	14	3
186	6	2015-10-25	NYR	20	NYR20	F 	0	0	0	0	4	0	0	9-16 	9	16	0	\N	\N	\N	\N	1.30000000000000004	16	3
184	6	2015-10-25	NYR	24	NYR24	F 	0	0	0	0	1	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.299999999999999989	18	3
195	6	2015-10-25	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	3
165	6	2015-10-25	CON	22	CON22	F 	0	1	1	0	0	0	0	6-1 	6	1	0	\N	\N	\N	\N	2.5	25	3
190	6	2015-10-25	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	3
181	6	2015-10-25	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	3
182	6	2015-10-25	NYR	21	NYR21	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	3
179	6	2015-10-25	NYR	12	NYR12	F 	0	1	1	2	2	0	0	4-4 	4	4	0	\N	\N	\N	\N	3.5	41	3
161	6	2015-10-25	CON	56	CON56	F 	0	1	1	0	3	0	0	2-2 	2	2	0	\N	\N	\N	\N	3.5	44	3
172	6	2015-10-25	CON	26	CON26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	46	3
164	6	2015-10-25	CON	13	CON13	D 	1	0	1	2	1	1	0	0-0 	0	0	1	1	\N	\N	\N	13.5	49	3
162	6	2015-10-25	CON	61	CON61	F 	0	1	1	2	4	0	0	6-6 	6	6	0	\N	\N	\N	\N	4.5	53	3
166	6	2015-10-25	CON	8	CON8	F 	1	0	1	0	3	0	0	11-3 	11	3	0	\N	\N	\N	\N	6.29999999999999982	54	3
187	6	2015-10-25	NYR	26	NYR26	D 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	59	3
177	6	2015-10-25	CON	10	CON10	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	62	3
192	6	2015-10-25	NYR	9	NYR9	F 	0	0	0	4	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	64	3
194	6	2015-10-25	NYR	14	NYR14	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	65	3
196	6	2015-10-25	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	3
178	6	2015-10-25	NYR	18	NYR18	F 	0	1	1	0	1	0	0	1-5 	1	5	0	\N	\N	\N	\N	2.10000000000000009	72	3
173	6	2015-10-25	CON	16	CON16	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	73	3
174	6	2015-10-25	CON	9	CON9	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	74	3
193	6	2015-10-25	NYR	11	NYR11	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	75	3
168	6	2015-10-25	CON	28	CON28	F 	0	0	0	4	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1.5	80	3
169	6	2015-10-25	CON	6	CON6	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	81	3
171	6	2015-10-25	CON	27	CON27	F 	0	0	0	0	2	0	0	2-4 	2	4	0	\N	\N	\N	\N	0.800000000000000044	84	3
189	6	2015-10-25	NYR	8	NYR8	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	3
167	6	2015-10-25	CON	44	CON44	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	86	3
183	6	2015-10-25	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	88	3
202	7	2015-11-15	CON	88	CON88	F 	0	1	1	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	2.29999999999999982	2	4
209	7	2015-11-15	CON	19	CON19	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009	14	4
198	7	2015-11-15	CON	22	CON22	F 	1	0	1	2	2	0	0	4-4 	4	4	1	\N	\N	\N	\N	10.5	25	4
213	7	2015-11-15	BUF	21	BUF21	F 	1	0	1	4	1	0	0	0-0 	0	0	0	\N	1	\N	\N	7.5	27	4
223	7	2015-11-15	BUF	7	BUF7	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	30	4
226	7	2015-11-15	BUF	20	BUF20	F 	0	0	0	0	0	0	0	1-2 	1	2	0	\N	\N	\N	\N	-0.100000000000000006	32	4
212	7	2015-11-15	BUF	24	BUF24	F 	0	1	1	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991	35	4
225	7	2015-11-15	BUF	12	BUF12	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	36	4
218	7	2015-11-15	BUF	77	BUF77	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	38	4
216	7	2015-11-15	BUF	6	BUF6	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	43	4
197	7	2015-11-15	CON	56	CON56	F 	0	1	1	0	2	0	0	2-3 	2	3	0	\N	\N	\N	\N	2.89999999999999991	44	4
199	7	2015-11-15	CON	26	CON26	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	46	4
208	7	2015-11-15	CON	13	CON13	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	49	4
210	7	2015-11-15	CON	5	CON5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	50	4
200	7	2015-11-15	CON	61	CON61	F 	1	0	1	2	4	0	0	15-8 	15	8	0	\N	\N	\N	\N	7.20000000000000018	53	4
203	7	2015-11-15	CON	8	CON8	F 	1	0	1	6	4	0	1	10-6 	10	6	0	\N	\N	\N	\N	8.90000000000000036	54	4
221	7	2015-11-15	BUF	14	BUF14	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	56	4
215	7	2015-11-15	BUF	36	BUF36	F 	1	0	1	0	3	0	0	4-12 	4	12	0	\N	\N	1	\N	5.70000000000000018	60	4
219	7	2015-11-15	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	4
222	7	2015-11-15	BUF	9	BUF9	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	70	4
224	7	2015-11-15	BUF	10	BUF10	F 	0	0	0	2	5	0	0	10-4	10	4	0	\N	\N	\N	\N	3.60000000000000009	71	4
201	7	2015-11-15	CON	16	CON16	F 	0	1	1	0	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	4.09999999999999964	73	4
206	7	2015-11-15	CON	9	CON9	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	74	4
217	7	2015-11-15	BUF	2	BUF2	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	78	4
205	7	2015-11-15	CON	28	CON28	F 	0	0	0	2	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0.5	80	4
207	7	2015-11-15	CON	6	CON6	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	81	4
214	7	2015-11-15	BUF	13	BUF13	F 	0	1	1	0	4	0	0	11-7 	11	7	0	\N	\N	\N	\N	4.40000000000000036	82	4
211	7	2015-11-15	CON	27	CON27	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	84	4
204	7	2015-11-15	CON	44	CON44	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	86	4
220	7	2015-11-15	BUF	43	BUF43	F 	0	0	0	0	5	0	0	0-3 	0	3	0	\N	\N	\N	\N	2.20000000000000018	87	4
240	8	2015-11-15	BOS	2	BOS2	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	1	4
236	8	2015-11-15	BOS	16	BOS16	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	4	4
252	8	2015-11-15	NYR	2	NYR2	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	5	4
246	8	2015-11-15	NYR	10	NYR10	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	8	4
250	8	2015-11-15	NYR	28	NYR28	F 	1	0	1	2	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036	9	4
241	8	2015-11-15	BOS	10	BOS10	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	10	4
251	8	2015-11-15	NYR	17	NYR17	F 	1	0	1	0	4	1	0	0-1 	0	1	1	\N	1	\N	\N	13.4000000000000004	11	4
243	8	2015-11-15	BOS	14	BOS14	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	12	4
249	8	2015-11-15	NYR	20	NYR20	F 	0	1	1	0	4	0	0	3-2 	3	2	0	\N	\N	\N	\N	4.09999999999999964	16	4
237	8	2015-11-15	BOS	7	BOS7	F 	0	0	0	2	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1	17	4
255	8	2015-11-15	NYR	24	NYR24	F 	0	0	0	4	2	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982	18	4
245	8	2015-11-15	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	4
259	8	2015-11-15	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	4
232	8	2015-11-15	BOS	23	BOS23	F 	0	0	0	2	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	23	4
231	8	2015-11-15	BOS	24	BOS24	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	26	4
258	8	2015-11-15	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	4
230	8	2015-11-15	BOS	15	BOS15	F 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	29	4
257	8	2015-11-15	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	4
264	8	2015-11-15	NYR	21	NYR21	D 	0	0	0	6	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	33	4
228	8	2015-11-15	BOS	19	BOS19	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	34	4
227	8	2015-11-15	BOS	21	BOS21	F 	1	1	2	0	16	0	0	5-5 	5	5	0	\N	\N	1	\N	15	39	4
260	8	2015-11-15	NYR	12	NYR12	F 	0	0	0	0	2	0	0	3-2 	3	2	0	\N	\N	\N	\N	1.10000000000000009	41	4
239	8	2015-11-15	BOS	3	BOS3	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	45	4
242	8	2015-11-15	BOS	11	BOS11	F 	0	0	0	0	4	0	0	1-1 	1	1	0	\N	\N	\N	\N	2	47	4
229	8	2015-11-15	BOS	22	BOS22	D 	1	0	1	0	8	1	0	0-0 	0	0	0	\N	\N	\N	\N	8.5	48	4
238	8	2015-11-15	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	4
254	8	2015-11-15	NYR	26	NYR26	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	59	4
262	8	2015-11-15	NYR	9	NYR9	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	64	4
248	8	2015-11-15	NYR	14	NYR14	F 	1	0	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	65	4
263	8	2015-11-15	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	4
244	8	2015-11-15	BOS	12	BOS12	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	68	4
234	8	2015-11-15	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	4
261	8	2015-11-15	NYR	18	NYR18	F 	0	0	0	0	2	0	0	4-2 	4	2	0	\N	\N	\N	\N	1.19999999999999996	72	4
247	8	2015-11-15	NYR	11	NYR11	F 	0	1	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	75	4
233	8	2015-11-15	BOS	91	BOS91	F 	0	0	0	4	1	0	0	2-3 	2	3	0	\N	\N	\N	\N	1.39999999999999991	79	4
253	8	2015-11-15	NYR	8	NYR8	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	85	4
256	8	2015-11-15	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	88	4
235	8	2015-11-15	BOS	44	BOS44	F 	0	0	0	2	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991	90	4
291	9	2015-11-22	BOS	2	BOS2	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	1	5
287	9	2015-11-22	BOS	16	BOS16	F 	1	0	1	2	7	1	0	2-0 	2	0	0	\N	\N	\N	\N	8.69999999999999929	4	5
279	9	2015-11-22	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	5
267	9	2015-11-22	NYR	10	NYR10	D 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	8	5
274	9	2015-11-22	NYR	28	NYR28	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	9	5
298	9	2015-11-22	BOS	10	BOS10	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	10	5
276	9	2015-11-22	NYR	17	NYR17	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	11	5
286	9	2015-11-22	BOS	14	BOS14	F 	0	1	1	2	7	0	0	21-7 	21	7	0	\N	\N	\N	\N	7.40000000000000036	12	5
265	9	2015-11-22	NYR	20	NYR20	F 	1	0	1	0	3	0	0	3-6 	3	6	0	\N	\N	\N	\N	5.20000000000000018	16	5
302	9	2015-11-22	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	5
275	9	2015-11-22	NYR	24	NYR24	F 	0	0	0	2	0	0	0	5-13 	5	13	0	\N	\N	\N	\N	-0.299999999999999989	18	5
301	9	2015-11-22	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	5
282	9	2015-11-22	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	5
290	9	2015-11-22	BOS	23	BOS23	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	23	5
289	9	2015-11-22	BOS	24	BOS24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	26	5
278	9	2015-11-22	NYR	4	NYR4	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	28	5
300	9	2015-11-22	BOS	15	BOS15	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009	29	5
271	9	2015-11-22	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	5
272	9	2015-11-22	NYR	21	NYR21	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	5
295	9	2015-11-22	BOS	19	BOS19	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	34	5
284	9	2015-11-22	BOS	21	BOS21	F 	1	1	2	0	5	1	0	9-4 	9	4	0	\N	\N	1	\N	10.5	39	5
266	9	2015-11-22	NYR	12	NYR12	F 	0	1	1	2	1	0	0	4-9 	4	9	0	\N	\N	\N	\N	2.5	41	5
288	9	2015-11-22	BOS	3	BOS3	F 	0	1	1	0	5	0	0	4-1 	4	1	0	\N	\N	\N	\N	4.79999999999999982	45	5
297	9	2015-11-22	BOS	11	BOS11	F 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	47	5
285	9	2015-11-22	BOS	22	BOS22	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	48	5
299	9	2015-11-22	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	5
273	9	2015-11-22	NYR	26	NYR26	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	59	5
280	9	2015-11-22	NYR	9	NYR9	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	64	5
270	9	2015-11-22	NYR	14	NYR14	F 	1	0	1	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036	65	5
283	9	2015-11-22	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	5
296	9	2015-11-22	BOS	12	BOS12	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	68	5
293	9	2015-11-22	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	5
268	9	2015-11-22	NYR	18	NYR18	F 	1	0	1	2	4	0	0	5-6 	5	6	1	\N	1	\N	\N	13.4000000000000004	72	5
281	9	2015-11-22	NYR	11	NYR11	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	75	5
292	9	2015-11-22	BOS	91	BOS91	F 	0	0	0	0	1	0	0	3-3 	3	3	0	\N	\N	\N	\N	0.5	79	5
277	9	2015-11-22	NYR	8	NYR8	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	85	5
269	9	2015-11-22	NYR	91	NYR91	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	88	5
294	9	2015-11-22	BOS	44	BOS44	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	90	5
309	10	2015-11-22	CON	88	CON88	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	2	5
315	10	2015-11-22	CON	4	CON4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	7	5
319	10	2015-11-22	CON	19	CON19	F 	0	0	0	6	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	14	5
311	10	2015-11-22	CON	22	CON22	F 	0	1	1	4	1	0	0	5-5 	5	5	0	\N	\N	\N	\N	3.5	25	5
333	10	2015-11-22	BUF	21	BUF21	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	27	5
320	10	2015-11-22	BUF	7	BUF7	D 	0	4	4	0	5	0	0	0-0 	0	0	0	\N	1	\N	\N	12.5	30	5
328	10	2015-11-22	BUF	24	BUF24	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	35	5
331	10	2015-11-22	BUF	12	BUF12	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	36	5
326	10	2015-11-22	BUF	77	BUF77	F 	1	0	1	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	38	5
332	10	2015-11-22	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-2 	0	2	0	\N	\N	\N	\N	-0.200000000000000011	43	5
306	10	2015-11-22	CON	56	CON56	F 	1	1	2	0	2	1	0	0-0 	0	0	0	\N	\N	\N	\N	7.5	44	5
304	10	2015-11-22	CON	26	CON26	D 	0	3	3	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	46	5
303	10	2015-11-22	CON	13	CON13	D 	2	2	4	2	4	2	0	0-0 	0	0	0	\N	\N	\N	\N	15.5	49	5
321	10	2015-11-22	BUF	3	BUF3	F 	2	2	4	0	7	1	1	2-1 	2	1	0	\N	\N	1	\N	18.1000000000000014	52	5
310	10	2015-11-22	CON	61	CON61	F 	0	1	1	0	3	0	0	18-12 	18	12	0	\N	\N	\N	\N	4.09999999999999964	53	5
305	10	2015-11-22	CON	8	CON8	F 	1	1	2	0	2	1	0	10-5 	10	5	0	\N	\N	\N	1	13	54	5
324	10	2015-11-22	BUF	14	BUF14	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	56	5
323	10	2015-11-22	BUF	36	BUF36	F 	2	0	2	0	4	2	0	3-14 	3	14	0	\N	\N	\N	1	14.9000000000000004	60	5
330	10	2015-11-22	BUF	23	BUF23	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	63	5
334	10	2015-11-22	BUF	9	BUF9	D 	0	0	0	5	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.25	70	5
322	10	2015-11-22	BUF	10	BUF10	F 	1	2	3	0	1	0	0	9-10 	9	10	0	\N	\N	\N	\N	8.40000000000000036	71	5
313	10	2015-11-22	CON	16	CON16	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	73	5
329	10	2015-11-22	BUF	2	BUF2	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	78	5
308	10	2015-11-22	CON	28	CON28	F 	1	0	1	2	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	5.59999999999999964	80	5
312	10	2015-11-22	CON	6	CON6	D 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	81	5
325	10	2015-11-22	BUF	13	BUF13	F 	0	2	2	0	1	0	0	7-8 	7	8	0	\N	\N	\N	\N	4.40000000000000036	82	5
307	10	2015-11-22	CON	27	CON27	F 	1	0	1	0	4	0	0	3-1 	3	1	0	\N	\N	\N	\N	6.20000000000000018	84	5
316	10	2015-11-22	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	5
327	10	2015-11-22	BUF	43	BUF43	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	87	5
317	10	2015-11-22	CON	17	CON17	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	89	5
358	11	2015-11-29	BOS	2	BOS2	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	1	6
344	11	2015-11-29	CON	88	CON88	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	2	6
355	11	2015-11-29	BOS	16	BOS16	F 	1	0	1	0	4	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	4	6
362	11	2015-11-29	BOS	10	BOS10	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	10	6
352	11	2015-11-29	BOS	14	BOS14	F 	0	2	2	6	9	0	0	13-6 	13	6	0	\N	\N	\N	\N	10.6999999999999993	12	6
349	11	2015-11-29	CON	19	CON19	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	14	6
356	11	2015-11-29	BOS	23	BOS23	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	23	6
346	11	2015-11-29	CON	22	CON22	F 	0	0	0	0	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	0.5	25	6
364	11	2015-11-29	BOS	15	BOS15	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	29	6
353	11	2015-11-29	BOS	19	BOS19	D 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	34	6
361	11	2015-11-29	BOS	21	BOS21	F 	0	0	0	0	5	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.39999999999999991	39	6
345	11	2015-11-29	CON	56	CON56	F 	0	0	0	2	3	0	0	1-0 	1	\N	0	\N	\N	\N	\N	2.10000000000000009	44	6
360	11	2015-11-29	BOS	3	BOS3	F 	0	0	0	0	1	0	0	5-4 	5	4	0	\N	\N	\N	\N	0.599999999999999978	45	6
339	11	2015-11-29	CON	26	CON26	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	46	6
366	11	2015-11-29	BOS	11	BOS11	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	47	6
351	11	2015-11-29	BOS	22	BOS22	D 	1	1	2	0	4	1	0	0-0 	0	0	0	\N	\N	1	\N	9.5	48	6
347	11	2015-11-29	CON	13	CON13	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	6
341	11	2015-11-29	CON	5	CON5	F 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	50	6
343	11	2015-11-29	CON	61	CON61	F 	0	0	0	2	3	0	0	12-11 	12	11	0	\N	\N	\N	\N	2.10000000000000009	53	6
336	11	2015-11-29	CON	8	CON8	F 	0	2	2	2	2	0	0	7-5 	7	5	0	\N	\N	\N	\N	5.70000000000000018	54	6
365	11	2015-11-29	BOS	5	BOS5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	55	6
363	11	2015-11-29	BOS	12	BOS12	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	68	6
359	11	2015-11-29	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	6
348	11	2015-11-29	CON	16	CON16	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989	73	6
340	11	2015-11-29	CON	9	CON9	D 	1	0	1	0	1	0	0	0-0 	0	0	1	\N	\N	\N	\N	9.5	74	6
354	11	2015-11-29	BOS	91	BOS91	F 	1	0	1	0	3	0	0	6-10 	6	10	0	\N	\N	\N	\N	5.09999999999999964	79	6
350	11	2015-11-29	CON	28	CON28	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	80	6
337	11	2015-11-29	CON	6	CON6	D 	1	1	2	2	1	1	0	0-0 	0	0	0	\N	1	\N	\N	9.5	81	6
335	11	2015-11-29	CON	27	CON27	F 	2	0	2	0	3	0	0	2-2 	2	2	0	1	\N	\N	\N	12.5	84	6
342	11	2015-11-29	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	6
338	11	2015-11-29	CON	17	CON17	F 	0	1	1	0	0	0	0	2-8 	2	8	0	\N	\N	\N	\N	1.39999999999999991	89	6
357	11	2015-11-29	BOS	44	BOS44	F 	0	0	0	0	3	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.60000000000000009	90	6
400	12	2015-11-29	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	6
384	12	2015-11-29	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	6
396	12	2015-11-29	NYR	10	NYR10	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	8	6
390	12	2015-11-29	NYR	28	NYR28	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	9	6
393	12	2015-11-29	NYR	17	NYR17	F 	0	0	0	2	6	0	0	0-2 	0	2	0	\N	\N	\N	\N	3.29999999999999982	11	6
387	12	2015-11-29	NYR	24	NYR24	F 	0	0	0	6	0	0	0	6-9 	6	9	0	\N	\N	\N	\N	1.19999999999999996	18	6
398	12	2015-11-29	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	6
378	12	2015-11-29	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	6
367	12	2015-11-29	BUF	21	BUF21	F 	2	0	2	0	6	0	0	0-0 	0	0	1	1	\N	\N	\N	19	27	6
395	12	2015-11-29	NYR	4	NYR4	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	28	6
385	12	2015-11-29	BUF	7	BUF7	D 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	30	6
383	12	2015-11-29	BUF	20	BUF20	F 	0	0	0	0	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	1.10000000000000009	32	6
388	12	2015-11-29	NYR	21	NYR21	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	33	6
368	12	2015-11-29	BUF	24	BUF24	F 	1	0	1	0	9	0	0	1-0 	1	\N	0	\N	\N	\N	\N	8.59999999999999964	35	6
379	12	2015-11-29	BUF	12	BUF12	F 	0	0	0	2	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	36	6
375	12	2015-11-29	BUF	77	BUF77	F 	0	0	0	0	0	0	0	3-4 	3	4	0	\N	\N	\N	\N	-0.100000000000000006	38	6
399	12	2015-11-29	NYR	12	NYR12	F 	0	0	0	0	7	0	0	6-9 	6	9	0	\N	\N	\N	\N	3.20000000000000018	41	6
381	12	2015-11-29	BUF	6	BUF6	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	43	6
373	12	2015-11-29	BUF	3	BUF3	F 	0	0	0	0	8	0	0	1-0 	1	\N	0	\N	\N	\N	\N	4.09999999999999964	52	6
371	12	2015-11-29	BUF	14	BUF14	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	56	6
389	12	2015-11-29	NYR	26	NYR26	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	59	6
369	12	2015-11-29	BUF	36	BUF36	F 	0	1	1	2	0	0	0	11-4 	11	4	0	\N	\N	\N	\N	3.20000000000000018	60	6
377	12	2015-11-29	BUF	23	BUF23	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	63	6
386	12	2015-11-29	NYR	14	NYR14	F 	1	0	1	0	4	0	0	2-5 	2	5	0	\N	\N	1	\N	6.70000000000000018	65	6
372	12	2015-11-29	BUF	26	BUF26	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	66	6
370	12	2015-11-29	BUF	9	BUF9	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	70	6
380	12	2015-11-29	BUF	10	BUF10	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	71	6
392	12	2015-11-29	NYR	18	NYR18	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5	72	6
397	12	2015-11-29	NYR	11	NYR11	F 	0	0	0	0	5	0	0	2-1 	2	1	0	\N	\N	\N	\N	2.60000000000000009	75	6
374	12	2015-11-29	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	6
382	12	2015-11-29	BUF	13	BUF13	F 	0	0	0	0	1	0	0	13-7 	13	7	0	\N	\N	\N	\N	1.10000000000000009	82	6
394	12	2015-11-29	NYR	8	NYR8	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	6
376	12	2015-11-29	BUF	43	BUF43	F 	0	0	0	0	2	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.800000000000000044	87	6
391	12	2015-11-29	NYR	91	NYR91	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022	88	6
431	13	2015-12-05	BOS	2	BOS2	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	1	7
427	13	2015-12-05	BOS	16	BOS16	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	4	7
417	13	2015-12-05	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	7
428	13	2015-12-05	BOS	10	BOS10	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	10	7
426	13	2015-12-05	BOS	14	BOS14	F 	0	1	1	2	6	0	0	14-7 	14	7	0	\N	\N	\N	\N	6.20000000000000018	12	7
434	13	2015-12-05	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	7
435	13	2015-12-05	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	7
438	13	2015-12-05	BOS	23	BOS23	F 	0	0	0	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	23	7
412	13	2015-12-05	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	7
432	13	2015-12-05	BOS	24	BOS24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	26	7
402	13	2015-12-05	BUF	21	BUF21	F 	3	1	4	2	7	1	0	0-0 	0	0	0	\N	\N	\N	\N	18.5	27	7
424	13	2015-12-05	BOS	15	BOS15	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	29	7
406	13	2015-12-05	BUF	7	BUF7	D 	1	0	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	30	7
419	13	2015-12-05	BUF	20	BUF20	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	32	7
436	13	2015-12-05	BOS	19	BOS19	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	34	7
403	13	2015-12-05	BUF	24	BUF24	F 	1	3	4	2	5	1	0	1-2 	1	2	0	\N	\N	\N	\N	13.4000000000000004	35	7
418	13	2015-12-05	BUF	12	BUF12	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	36	7
407	13	2015-12-05	BUF	77	BUF77	F 	0	0	0	0	0	0	0	7-9 	7	9	0	\N	\N	\N	\N	-0.200000000000000011	38	7
421	13	2015-12-05	BOS	21	BOS21	F 	1	2	3	2	5	0	0	21-3 	21	3	0	\N	\N	\N	\N	12.8000000000000007	39	7
415	13	2015-12-05	BUF	6	BUF6	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	43	7
423	13	2015-12-05	BOS	3	BOS3	F 	2	0	2	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	10.5	45	7
429	13	2015-12-05	BOS	11	BOS11	F 	1	0	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	47	7
425	13	2015-12-05	BOS	22	BOS22	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	48	7
413	13	2015-12-05	BUF	3	BUF3	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	52	7
422	13	2015-12-05	BOS	5	BOS5	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	55	7
411	13	2015-12-05	BUF	14	BUF14	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	56	7
401	13	2015-12-05	BUF	36	BUF36	F 	1	3	4	0	2	0	0	6-19 	6	19	0	\N	\N	\N	\N	9.69999999999999929	60	7
408	13	2015-12-05	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	7
410	13	2015-12-05	BUF	26	BUF26	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	66	7
437	13	2015-12-05	BOS	12	BOS12	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	68	7
430	13	2015-12-05	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	7
404	13	2015-12-05	BUF	9	BUF9	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	70	7
416	13	2015-12-05	BUF	10	BUF10	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	71	7
414	13	2015-12-05	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	7
420	13	2015-12-05	BOS	91	BOS91	F 	1	2	3	0	4	0	0	9-8 	9	8	1	\N	\N	\N	\N	15.0999999999999996	79	7
405	13	2015-12-05	BUF	13	BUF13	F 	0	1	1	0	1	0	0	5-14 	5	14	0	\N	\N	\N	\N	1.60000000000000009	82	7
409	13	2015-12-05	BUF	43	BUF43	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	87	7
433	13	2015-12-05	BOS	44	BOS44	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	90	7
465	14	2015-12-06	BOS	2	BOS2	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	1	7
455	14	2015-12-06	BOS	16	BOS16	F 	1	0	1	0	2	0	0	1-0 	1	\N	0	\N	\N	\N	\N	5.09999999999999964	4	7
440	14	2015-12-06	NYR	10	NYR10	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	8	7
444	14	2015-12-06	NYR	28	NYR28	F 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	9	7
457	14	2015-12-06	BOS	10	BOS10	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	10	7
451	14	2015-12-06	NYR	17	NYR17	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	11	7
460	14	2015-12-06	BOS	14	BOS14	F 	0	1	1	0	8	0	0	17-3 	17	3	0	\N	\N	\N	\N	7.40000000000000036	12	7
447	14	2015-12-06	NYR	20	NYR20	F 	0	0	0	0	3	0	0	4-16 	4	16	0	\N	\N	\N	\N	0.299999999999999989	16	7
443	14	2015-12-06	NYR	24	NYR24	F 	0	0	0	2	1	0	0	3-12 	3	12	0	\N	\N	\N	\N	0.100000000000000006	18	7
456	14	2015-12-06	BOS	23	BOS23	F 	0	1	1	0	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	2.5	23	7
452	14	2015-12-06	NYR	4	NYR4	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	28	7
464	14	2015-12-06	BOS	15	BOS15	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	29	7
446	14	2015-12-06	NYR	21	NYR21	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	33	7
458	14	2015-12-06	BOS	19	BOS19	D 	0	1	1	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	34	7
454	14	2015-12-06	BOS	21	BOS21	F 	2	0	2	2	9	0	0	11-3 	11	3	1	\N	\N	\N	\N	18.8000000000000007	39	7
439	14	2015-12-06	NYR	12	NYR12	F 	0	1	1	0	2	0	0	0-4 	0	4	0	\N	\N	\N	\N	2.60000000000000009	41	7
459	14	2015-12-06	BOS	3	BOS3	F 	1	0	1	0	2	0	0	4-0 	4	0	0	\N	\N	\N	\N	5.40000000000000036	45	7
467	14	2015-12-06	BOS	11	BOS11	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	47	7
463	14	2015-12-06	BOS	22	BOS22	D 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	48	7
466	14	2015-12-06	BOS	5	BOS5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	55	7
442	14	2015-12-06	NYR	26	NYR26	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	59	7
453	14	2015-12-06	NYR	9	NYR9	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5	64	7
450	14	2015-12-06	NYR	14	NYR14	F 	0	0	0	0	3	0	0	2-4 	2	4	0	\N	\N	\N	\N	1.30000000000000004	65	7
468	14	2015-12-06	BOS	12	BOS12	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	68	7
441	14	2015-12-06	NYR	18	NYR18	F 	1	0	1	0	3	0	0	2-5 	2	5	0	\N	\N	\N	\N	5.20000000000000018	72	7
449	14	2015-12-06	NYR	11	NYR11	F 	0	0	0	0	3	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.30000000000000004	75	7
461	14	2015-12-06	BOS	91	BOS91	F 	0	0	0	2	1	0	0	11-5 	11	5	0	\N	\N	\N	\N	1.60000000000000009	79	7
448	14	2015-12-06	NYR	8	NYR8	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	85	7
445	14	2015-12-06	NYR	91	NYR91	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	88	7
462	14	2015-12-06	BOS	44	BOS44	F 	0	0	0	2	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.10000000000000009	90	7
488	15	2015-12-06	CON	88	CON88	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989	2	7
496	15	2015-12-06	CON	22	CON22	F 	0	0	0	4	1	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.30000000000000004	25	7
482	15	2015-12-06	BUF	21	BUF21	F 	0	0	0	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	27	7
474	15	2015-12-06	BUF	7	BUF7	D 	0	1	1	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	30	7
470	15	2015-12-06	BUF	20	BUF20	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	32	7
478	15	2015-12-06	BUF	24	BUF24	F 	0	0	0	4	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009	35	7
480	15	2015-12-06	BUF	12	BUF12	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009	36	7
477	15	2015-12-06	BUF	77	BUF77	F 	0	0	0	0	2	0	0	1-3 	1	3	0	\N	\N	\N	\N	0.800000000000000044	38	7
481	15	2015-12-06	BUF	6	BUF6	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006	43	7
491	15	2015-12-06	CON	56	CON56	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	1	6.5	44	7
490	15	2015-12-06	CON	26	CON26	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	46	7
486	15	2015-12-06	CON	13	CON13	D 	1	0	1	4	2	0	0	0-0 	0	0	0	1	\N	\N	\N	9	49	7
498	15	2015-12-06	CON	5	CON5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	50	7
487	15	2015-12-06	CON	61	CON61	F 	0	0	0	0	2	0	0	19-6 	19	6	0	\N	\N	\N	1	7.29999999999999982	53	7
492	15	2015-12-06	CON	8	CON8	F 	0	0	0	0	1	0	0	3-5 	3	5	0	\N	\N	\N	1	5.29999999999999982	54	7
473	15	2015-12-06	BUF	14	BUF14	D 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	56	7
471	15	2015-12-06	BUF	36	BUF36	F 	0	1	1	0	3	0	0	4-15 	4	15	0	\N	\N	\N	1	7.40000000000000036	60	7
479	15	2015-12-06	BUF	23	BUF23	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	63	7
483	15	2015-12-06	BUF	9	BUF9	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	70	7
472	15	2015-12-06	BUF	10	BUF10	F 	1	0	1	0	2	0	0	3-1 	3	1	0	\N	\N	\N	\N	5.20000000000000018	71	7
495	15	2015-12-06	CON	16	CON16	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	73	7
494	15	2015-12-06	CON	9	CON9	D 	0	0	0	15	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.75	74	7
475	15	2015-12-06	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	7
484	15	2015-12-06	CON	28	CON28	F 	1	1	2	2	2	1	0	0-0 	0	0	0	\N	1	\N	\N	10	80	7
493	15	2015-12-06	CON	6	CON6	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	81	7
469	15	2015-12-06	BUF	13	BUF13	F 	1	0	1	0	3	1	0	9-6 	9	6	0	\N	\N	\N	\N	6.29999999999999982	82	7
485	15	2015-12-06	CON	27	CON27	F 	0	1	1	0	2	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.89999999999999991	84	7
489	15	2015-12-06	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	7
476	15	2015-12-06	BUF	43	BUF43	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	87	7
497	15	2015-12-06	CON	17	CON17	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	89	7
507	16	2015-12-13	CON	88	CON88	F 	0	0	0	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	2	8
524	16	2015-12-13	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	8
526	16	2015-12-13	NYR	10	NYR10	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	8	8
520	16	2015-12-13	NYR	28	NYR28	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	9	8
513	16	2015-12-13	NYR	17	NYR17	F 	2	0	2	0	6	0	0	1-3 	1	3	0	\N	\N	1	\N	11.8000000000000007	11	8
512	16	2015-12-13	CON	19	CON19	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	14	8
516	16	2015-12-13	NYR	20	NYR20	F 	0	1	1	0	2	0	0	6-3 	6	3	0	\N	\N	\N	\N	3.29999999999999982	16	8
521	16	2015-12-13	NYR	24	NYR24	F 	0	0	0	0	3	0	0	4-14 	4	14	0	\N	\N	\N	\N	0.5	18	8
504	16	2015-12-13	CON	22	CON22	F 	0	1	1	0	2	0	0	8-5 	8	5	0	\N	\N	\N	\N	3.29999999999999982	25	8
523	16	2015-12-13	NYR	4	NYR4	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	28	8
519	16	2015-12-13	NYR	21	NYR21	D 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989	33	8
515	16	2015-12-13	NYR	12	NYR12	F 	0	1	1	0	1	0	0	7-14 	7	14	0	\N	\N	\N	\N	1.80000000000000004	41	8
502	16	2015-12-13	CON	26	CON26	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	46	8
509	16	2015-12-13	CON	13	CON13	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	49	8
510	16	2015-12-13	CON	5	CON5	F 	0	0	0	0	2	0	0	4-2 	4	2	0	\N	\N	\N	\N	1.19999999999999996	50	8
501	16	2015-12-13	CON	61	CON61	F 	0	2	2	0	4	0	0	15-10 	15	10	0	1	\N	\N	1	14.5	53	8
500	16	2015-12-13	CON	8	CON8	F 	0	2	2	2	5	0	0	12-7 	12	7	0	\N	\N	\N	\N	7.5	54	8
517	16	2015-12-13	NYR	26	NYR26	D 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	59	8
525	16	2015-12-13	NYR	9	NYR9	F 	0	0	0	2	1	0	0	8-5 	8	5	0	\N	\N	\N	\N	1.30000000000000004	64	8
522	16	2015-12-13	NYR	14	NYR14	F 	0	0	0	4	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009	65	8
527	16	2015-12-13	NYR	18	NYR18	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	72	8
511	16	2015-12-13	CON	16	CON16	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	73	8
514	16	2015-12-13	NYR	11	NYR11	F 	1	0	1	0	5	1	0	0-0 	0	0	0	\N	\N	\N	\N	7	75	8
508	16	2015-12-13	CON	28	CON28	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	80	8
506	16	2015-12-13	CON	6	CON6	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	81	8
499	16	2015-12-13	CON	27	CON27	F 	2	0	2	0	8	0	0	3-3 	3	3	0	\N	1	\N	\N	14	84	8
518	16	2015-12-13	NYR	8	NYR8	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	85	8
505	16	2015-12-13	CON	44	CON44	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	86	8
503	16	2015-12-13	CON	17	CON17	F 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	89	8
560	17	2015-12-20	BOS	2	BOS2	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	1	9
556	17	2015-12-20	BOS	16	BOS16	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	4	9
536	17	2015-12-20	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	9
561	17	2015-12-20	BOS	10	BOS10	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	10	9
564	17	2015-12-20	BOS	14	BOS14	F 	0	0	0	0	7	0	0	14-9 	14	9	0	\N	\N	\N	\N	4	12	9
557	17	2015-12-20	BOS	7	BOS7	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978	17	9
565	17	2015-12-20	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	9
551	17	2015-12-20	BOS	23	BOS23	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	23	9
539	17	2015-12-20	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	9
549	17	2015-12-20	BOS	24	BOS24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	26	9
530	17	2015-12-20	BUF	21	BUF21	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	27	9
563	17	2015-12-20	BOS	15	BOS15	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	29	9
542	17	2015-12-20	BUF	7	BUF7	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	30	9
531	17	2015-12-20	BUF	20	BUF20	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978	32	9
555	17	2015-12-20	BOS	19	BOS19	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	34	9
528	17	2015-12-20	BUF	24	BUF24	F 	0	0	0	2	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	35	9
545	17	2015-12-20	BUF	12	BUF12	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	36	9
533	17	2015-12-20	BUF	77	BUF77	F 	0	0	0	0	1	0	0	7-9 	7	9	0	\N	\N	\N	\N	0.299999999999999989	38	9
548	17	2015-12-20	BOS	21	BOS21	F 	1	0	1	0	13	0	0	11-8 	11	8	1	1	\N	\N	\N	18.8000000000000007	39	9
538	17	2015-12-20	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	9
559	17	2015-12-20	BOS	3	BOS3	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	45	9
547	17	2015-12-20	BOS	11	BOS11	F 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	47	9
550	17	2015-12-20	BOS	22	BOS22	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	48	9
540	17	2015-12-20	BUF	3	BUF3	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	52	9
558	17	2015-12-20	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	9
537	17	2015-12-20	BUF	14	BUF14	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	56	9
535	17	2015-12-20	BUF	36	BUF36	F 	0	0	0	0	3	0	0	6-8 	6	8	0	\N	\N	\N	\N	1.30000000000000004	60	9
529	17	2015-12-20	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	9
532	17	2015-12-20	BUF	26	BUF26	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	66	9
562	17	2015-12-20	BOS	12	BOS12	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	68	9
553	17	2015-12-20	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	9
543	17	2015-12-20	BUF	9	BUF9	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	70	9
546	17	2015-12-20	BUF	10	BUF10	F 	0	0	0	0	3	0	0	1-6 	1	6	0	\N	\N	\N	\N	1	71	9
541	17	2015-12-20	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	9
552	17	2015-12-20	BOS	91	BOS91	F 	0	0	0	2	3	0	0	8-5 	8	5	0	\N	\N	\N	\N	2.29999999999999982	79	9
544	17	2015-12-20	BUF	13	BUF13	F 	0	0	0	0	2	0	0	6-10 	6	10	0	\N	\N	\N	\N	0.599999999999999978	82	9
534	17	2015-12-20	BUF	43	BUF43	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006	87	9
554	17	2015-12-20	BOS	44	BOS44	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	90	9
581	18	2015-12-27	NYR	2	NYR2	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	5	10
594	18	2015-12-27	BUF	9	BUF9	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	10
574	18	2015-12-27	NYR	10	NYR10	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	8	10
576	18	2015-12-27	NYR	28	NYR28	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	9	10
572	18	2015-12-27	NYR	17	NYR17	F 	0	1	1	2	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	4.59999999999999964	11	10
579	18	2015-12-27	NYR	20	NYR20	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	16	10
570	18	2015-12-27	NYR	24	NYR24	F 	0	1	1	0	3	0	0	9-8 	9	8	0	\N	\N	\N	\N	3.60000000000000009	18	10
580	18	2015-12-27	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	10
598	18	2015-12-27	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	10
587	18	2015-12-27	BUF	21	BUF21	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	27	10
575	18	2015-12-27	NYR	4	NYR4	D 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	28	10
584	18	2015-12-27	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	10
597	18	2015-12-27	BUF	20	BUF20	F 	0	0	0	0	1	0	0	9-16 	9	16	0	\N	\N	\N	\N	-0.200000000000000011	32	10
583	18	2015-12-27	NYR	21	NYR21	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	33	10
592	18	2015-12-27	BUF	24	BUF24	F 	0	0	0	2	5	0	0	2-1 	2	1	0	\N	\N	\N	\N	3.10000000000000009	35	10
596	18	2015-12-27	BUF	12	BUF12	F	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	36	10
590	18	2015-12-27	BUF	77	BUF77	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5	38	10
566	18	2015-12-27	NYR	12	NYR12	F 	2	1	3	0	8	0	0	8-5 	8	5	0	\N	\N	1	\N	15.3000000000000007	41	10
595	18	2015-12-27	BUF	6	BUF6	F	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	43	10
585	18	2015-12-27	BUF	3	BUF3	F 	1	1	2	2	5	1	0	3-1 	3	1	0	1	\N	\N	\N	12.6999999999999993	52	10
577	18	2015-12-27	NYR	26	NYR26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	59	10
586	18	2015-12-27	BUF	36	BUF36	F 	1	0	1	0	5	0	1	13-10 	13	10	0	\N	\N	\N	\N	7.79999999999999982	60	10
593	18	2015-12-27	BUF	23	BUF23	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	63	10
567	18	2015-12-27	NYR	9	NYR9	F 	2	1	3	0	4	0	0	7-11 	7	11	1	\N	\N	\N	\N	16.6000000000000014	64	10
571	18	2015-12-27	NYR	14	NYR14	F 	0	1	1	2	3	0	0	0-3 	0	3	0	\N	\N	\N	\N	3.70000000000000018	65	10
588	18	2015-12-27	BUF	26	BUF26	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	66	10
582	18	2015-12-27	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	10
568	18	2015-12-27	NYR	18	NYR18	F 	3	0	3	2	5	0	0	2-1 	2	1	0	\N	1	\N	\N	17.1000000000000014	72	10
573	18	2015-12-27	NYR	11	NYR11	F 	0	1	1	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009	75	10
589	18	2015-12-27	BUF	2	BUF2	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	78	10
569	18	2015-12-27	NYR	8	NYR8	D 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	85	10
591	18	2015-12-27	BUF	43	BUF43	F	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	87	10
578	18	2015-12-27	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	88	10
616	19	2015-12-27	CON	88	CON88	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009	2	10
599	19	2015-12-27	BOS	10	BOS10	D 	0	2	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	10	10
624	19	2015-12-27	CON	19	CON19	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	14	10
609	19	2015-12-27	BOS	7	BOS7	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	17	10
606	19	2015-12-27	BOS	18	BOS18	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	20	10
610	19	2015-12-27	BOS	23	BOS23	F 	0	0	0	0	4	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.80000000000000004	23	10
617	19	2015-12-27	CON	22	CON22	F 	0	0	0	2	2	0	0	5-7 	5	7	0	\N	\N	\N	\N	1.30000000000000004	25	10
604	19	2015-12-27	BOS	24	BOS24	F 	0	0	0	0	1	0	0	3-6 	3	6	0	\N	\N	\N	\N	0.200000000000000011	26	10
601	19	2015-12-27	BOS	15	BOS15	F 	1	0	1	0	5	0	0	1-2 	1	2	1	1	\N	\N	\N	14.4000000000000004	29	10
607	19	2015-12-27	BOS	11	BOS11	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	37	10
613	19	2015-12-27	CON	56	CON56	F 	0	1	1	2	4	0	0	2-1 	2	1	0	\N	\N	\N	\N	4.59999999999999964	44	10
602	19	2015-12-27	BOS	3	BOS3	F 	0	1	1	0	7	0	0	12-4 	12	4	0	\N	\N	\N	\N	6.29999999999999982	45	10
614	19	2015-12-27	CON	26	CON26	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	46	10
621	19	2015-12-27	CON	13	CON13	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	49	10
612	19	2015-12-27	CON	5	CON5	F 	1	0	1	0	3	1	0	9-7 	9	7	0	\N	\N	1	\N	7.20000000000000018	50	10
615	19	2015-12-27	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	51	10
618	19	2015-12-27	CON	8	CON8	F 	0	0	0	0	2	0	0	10-9 	10	9	0	\N	\N	\N	\N	1.10000000000000009	54	10
600	19	2015-12-27	BOS	5	BOS5	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	1	\N	\N	7.5	55	10
608	19	2015-12-27	BOS	12	BOS12	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	68	10
605	19	2015-12-27	BOS	57	BOS57	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	69	10
623	19	2015-12-27	CON	16	CON16	F 	0	0	0	0	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.60000000000000009	73	10
620	19	2015-12-27	CON	9	CON9	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	74	10
603	19	2015-12-27	BOS	91	BOS91	F 	0	0	0	0	7	0	0	8-12 	8	12	0	\N	\N	\N	\N	3.10000000000000009	79	10
611	19	2015-12-27	CON	28	CON28	F 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	80	10
619	19	2015-12-27	CON	6	CON6	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	81	10
622	19	2015-12-27	CON	17	CON17	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	89	10
657	20	2016-01-03	BOS	2	BOS2	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	1	11
655	20	2016-01-03	BOS	16	BOS16	F 	0	0	0	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	4	11
635	20	2016-01-03	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	11
659	20	2016-01-03	BOS	10	BOS10	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	10	11
646	20	2016-01-03	BOS	14	BOS14	F 	1	1	2	4	9	0	0	10-8 	10	8	0	\N	\N	\N	\N	11.6999999999999993	12	11
658	20	2016-01-03	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	11
660	20	2016-01-03	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	11
650	20	2016-01-03	BOS	23	BOS23	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	23	11
637	20	2016-01-03	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	11
652	20	2016-01-03	BOS	24	BOS24	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	26	11
629	20	2016-01-03	BUF	21	BUF21	F 	1	0	1	2	3	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	27	11
662	20	2016-01-03	BOS	15	BOS15	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	29	11
628	20	2016-01-03	BUF	7	BUF7	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	30	11
643	20	2016-01-03	BUF	20	BUF20	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	32	11
663	20	2016-01-03	BOS	19	BOS19	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	34	11
627	20	2016-01-03	BUF	24	BUF24	F 	2	0	2	2	4	1	1	0-3 	0	3	0	\N	\N	\N	\N	11.6999999999999993	35	11
640	20	2016-01-03	BUF	12	BUF12	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	36	11
661	20	2016-01-03	BOS	0	BOS0	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	37	11
631	20	2016-01-03	BUF	77	BUF77	F 	0	0	0	0	1	0	0	5-8 	5	8	0	\N	\N	\N	\N	0.200000000000000011	38	11
644	20	2016-01-03	BOS	21	BOS21	F 	1	1	2	0	10	0	0	1-1 	1	1	0	\N	\N	\N	\N	11	39	11
636	20	2016-01-03	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	11
649	20	2016-01-03	BOS	3	BOS3	F 	0	1	1	0	3	0	0	12-4 	12	4	0	\N	\N	\N	\N	4.29999999999999982	45	11
645	20	2016-01-03	BOS	11	BOS11	F 	1	1	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7	47	11
651	20	2016-01-03	BOS	22	BOS22	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	48	11
638	20	2016-01-03	BUF	3	BUF3	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	52	11
656	20	2016-01-03	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	11
625	20	2016-01-03	BUF	14	BUF14	D 	0	3	3	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	56	11
626	20	2016-01-03	BUF	36	BUF36	F 	0	2	2	0	1	0	0	6-10 	6	10	0	\N	\N	\N	\N	4.09999999999999964	60	11
632	20	2016-01-03	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	11
633	20	2016-01-03	BUF	26	BUF26	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	66	11
648	20	2016-01-03	BOS	12	BOS12	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	68	11
647	20	2016-01-03	BOS	57	BOS57	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	69	11
630	20	2016-01-03	BUF	9	BUF9	D 	1	0	1	0	3	1	0	0-0 	0	0	1	\N	\N	\N	\N	11	70	11
639	20	2016-01-03	BUF	10	BUF10	F 	0	0	0	4	8	0	0	6-12 	6	12	0	\N	\N	\N	\N	4.40000000000000036	71	11
641	20	2016-01-03	BUF	2	BUF2	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	78	11
653	20	2016-01-03	BOS	91	BOS91	F 	0	0	0	2	1	0	0	11-4 	11	4	0	\N	\N	\N	\N	1.69999999999999996	79	11
642	20	2016-01-03	BUF	13	BUF13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	82	11
634	20	2016-01-03	BUF	43	BUF43	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	87	11
654	20	2016-01-03	BOS	44	BOS44	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	90	11
670	21	2016-01-03	CON	88	CON88	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	2	11
692	21	2016-01-03	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	11
688	21	2016-01-03	NYR	10	NYR10	D 	0	0	0	2	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	8	11
683	21	2016-01-03	NYR	28	NYR28	F 	0	0	0	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.39999999999999991	9	11
685	21	2016-01-03	NYR	17	NYR17	F 	0	0	0	0	3	0	0	2-3 	2	3	0	\N	\N	\N	\N	1.39999999999999991	11	11
677	21	2016-01-03	CON	19	CON19	F 	0	0	0	4	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	14	11
679	21	2016-01-03	NYR	24	NYR24	F 	0	1	1	0	1	0	0	2-7 	2	7	0	\N	\N	\N	\N	2	18	11
674	21	2016-01-03	CON	22	CON22	F 	0	0	0	2	0	0	0	6-4 	6	4	0	\N	\N	\N	\N	0.699999999999999956	25	11
687	21	2016-01-03	NYR	4	NYR4	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	28	11
681	21	2016-01-03	NYR	21	NYR21	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	11
691	21	2016-01-03	NYR	12	NYR12	F 	0	0	0	0	3	0	0	5-15 	5	15	0	\N	\N	\N	\N	0.5	41	11
673	21	2016-01-03	CON	56	CON56	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	44	11
664	21	2016-01-03	CON	26	CON26	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	46	11
668	21	2016-01-03	CON	13	CON13	D 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	49	11
666	21	2016-01-03	CON	61	CON61	F 	1	1	2	0	9	0	0	19-4 	19	4	0	\N	\N	\N	\N	12	53	11
669	21	2016-01-03	CON	8	CON8	F 	2	0	2	2	5	1	1	1-3 	1	3	0	\N	\N	\N	\N	12.3000000000000007	54	11
678	21	2016-01-03	NYR	26	NYR26	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	59	11
680	21	2016-01-03	NYR	9	NYR9	F 	1	0	1	0	10	1	0	1-7 	1	7	0	\N	\N	1	\N	9.90000000000000036	64	11
690	21	2016-01-03	NYR	14	NYR14	F 	0	0	0	4	2	0	0	0-2 	0	2	0	\N	\N	\N	\N	1.80000000000000004	65	11
682	21	2016-01-03	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	11
684	21	2016-01-03	NYR	18	NYR18	F 	0	0	0	0	4	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.89999999999999991	72	11
676	21	2016-01-03	CON	16	CON16	F 	0	0	0	19	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.75	73	11
675	21	2016-01-03	CON	9	CON9	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	74	11
689	21	2016-01-03	NYR	11	NYR11	F 	0	0	0	2	3	0	0	0-3 	0	3	0	\N	\N	\N	\N	1.69999999999999996	75	11
672	21	2016-01-03	CON	28	CON28	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	80	11
671	21	2016-01-03	CON	6	CON6	D 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	81	11
665	21	2016-01-03	CON	27	CON27	F 	2	0	2	0	4	0	1	11-0 	11	\N	1	1	\N	\N	\N	20.1000000000000014	84	11
686	21	2016-01-03	NYR	8	NYR8	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	85	11
667	21	2016-01-03	CON	17	CON17	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	89	11
716	22	2016-01-09	CON	88	CON88	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	2	12
695	22	2016-01-09	NYR	2	NYR2	D 	0	1	1	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	5	12
700	22	2016-01-09	NYR	28	NYR28	F 	0	0	0	0	0	0	0	1-1 	1	1	0	\N	\N	\N	\N	0	9	12
694	22	2016-01-09	NYR	17	NYR17	F 	0	1	1	0	4	0	0	1-3 	1	3	0	\N	\N	\N	\N	3.79999999999999982	11	12
707	22	2016-01-09	CON	19	CON19	F 	0	3	3	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	14	12
693	22	2016-01-09	NYR	20	NYR20	F 	2	0	2	0	6	1	0	5-9 	5	9	0	\N	1	\N	\N	13.0999999999999996	16	12
696	22	2016-01-09	NYR	24	NYR24	F 	0	1	1	0	0	0	0	6-6 	6	6	0	\N	\N	\N	\N	2	18	12
704	22	2016-01-09	NYR	13	NYR13	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	21	12
708	22	2016-01-09	CON	22	CON22	F 	2	0	2	0	3	0	0	7-6 	7	6	0	1	\N	\N	\N	12.5999999999999996	25	12
706	22	2016-01-09	NYR	21	NYR21	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	33	12
697	22	2016-01-09	NYR	12	NYR12	F 	1	0	1	0	6	0	1	5-6 	5	6	0	\N	\N	\N	\N	7.90000000000000036	41	12
714	22	2016-01-09	CON	56	CON56	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	44	12
717	22	2016-01-09	CON	26	CON26	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	46	12
713	22	2016-01-09	CON	13	CON13	D 	0	1	1	4	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	49	12
719	22	2016-01-09	CON	5	CON5	F 	0	0	0	0	3	0	0	6-10 	6	10	0	\N	\N	\N	\N	1.10000000000000009	50	12
710	22	2016-01-09	CON	61	CON61	F 	1	1	2	2	6	0	0	22-3 	22	3	1	\N	\N	1	\N	17.3999999999999986	53	12
712	22	2016-01-09	CON	8	CON8	F 	0	1	1	0	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	3.5	54	12
699	22	2016-01-09	NYR	26	NYR26	D 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	59	12
698	22	2016-01-09	NYR	9	NYR9	F 	0	1	1	0	4	0	0	5-11 	5	11	0	\N	\N	\N	\N	3.39999999999999991	64	12
705	22	2016-01-09	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	12
701	22	2016-01-09	NYR	18	NYR18	F 	0	0	0	0	1	0	0	0-2 	0	2	0	\N	\N	\N	\N	0.299999999999999989	72	12
703	22	2016-01-09	NYR	11	NYR11	F 	0	0	0	2	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.39999999999999991	75	12
720	22	2016-01-09	CON	28	CON28	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	80	12
718	22	2016-01-09	CON	6	CON6	D 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	81	12
709	22	2016-01-09	CON	27	CON27	F 	1	1	2	0	5	0	0	3-2 	3	2	0	\N	\N	\N	\N	8.59999999999999964	84	12
702	22	2016-01-09	NYR	8	NYR8	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	85	12
715	22	2016-01-09	CON	44	CON44	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	86	12
711	22	2016-01-09	CON	17	CON17	F 	0	1	1	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	89	12
753	23	2016-01-10	BOS	2	BOS2	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	1	12
743	23	2016-01-10	BOS	16	BOS16	F 	1	1	2	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	8	4	12
735	23	2016-01-10	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	12
726	23	2016-01-10	NYR	28	NYR28	F 	0	0	0	0	7	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	9	12
747	23	2016-01-10	BOS	10	BOS10	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	10	12
721	23	2016-01-10	NYR	17	NYR17	F 	1	0	1	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	5.40000000000000036	11	12
736	23	2016-01-10	BOS	14	BOS14	F 	1	2	3	0	6	1	0	15-7 	15	7	0	\N	\N	\N	\N	12.3000000000000007	12	12
722	23	2016-01-10	NYR	20	NYR20	F 	0	1	1	0	2	0	0	2-8 	2	8	0	\N	\N	\N	\N	2.39999999999999991	16	12
751	23	2016-01-10	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	12
724	23	2016-01-10	NYR	24	NYR24	F 	0	0	0	2	3	0	0	3-8 	3	8	0	\N	\N	\N	\N	1.5	18	12
750	23	2016-01-10	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	12
733	23	2016-01-10	NYR	13	NYR13	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	21	12
739	23	2016-01-10	BOS	23	BOS23	F 	1	1	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8	23	12
730	23	2016-01-10	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	12
740	23	2016-01-10	BOS	15	BOS15	F 	0	2	2	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	3.89999999999999991	29	12
723	23	2016-01-10	NYR	21	NYR21	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	33	12
741	23	2016-01-10	BOS	19	BOS19	D 	0	2	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	34	12
738	23	2016-01-10	BOS	21	BOS21	F 	1	2	3	0	4	0	0	4-0 	4	0	0	\N	\N	\N	\N	10.4000000000000004	39	12
734	23	2016-01-10	NYR	12	NYR12	F 	0	0	0	0	1	0	0	9-11 	9	11	0	\N	\N	\N	\N	0.299999999999999989	41	12
737	23	2016-01-10	BOS	3	BOS3	F 	2	1	3	2	6	0	0	13-6 	13	6	0	\N	\N	\N	\N	14.1999999999999993	45	12
745	23	2016-01-10	BOS	11	BOS11	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	47	12
749	23	2016-01-10	BOS	22	BOS22	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	48	12
752	23	2016-01-10	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	12
725	23	2016-01-10	NYR	26	NYR26	D 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	59	12
731	23	2016-01-10	NYR	9	NYR9	F 	0	0	0	0	4	0	0	4-9 	4	9	0	\N	\N	\N	\N	1.5	64	12
727	23	2016-01-10	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	12
742	23	2016-01-10	BOS	12	BOS12	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	68	12
748	23	2016-01-10	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	12
728	23	2016-01-10	NYR	18	NYR18	F 	0	0	0	2	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.10000000000000009	72	12
732	23	2016-01-10	NYR	11	NYR11	F 	0	0	0	0	1	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.400000000000000022	75	12
746	23	2016-01-10	BOS	91	BOS91	F 	1	0	1	2	3	0	0	9-6 	9	6	1	\N	\N	\N	\N	11.3000000000000007	79	12
729	23	2016-01-10	NYR	8	NYR8	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	85	12
744	23	2016-01-10	BOS	44	BOS44	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	90	12
778	24	2016-01-10	CON	88	CON88	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	2	12
780	24	2016-01-10	CON	19	CON19	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	14	12
773	24	2016-01-10	CON	22	CON22	F 	1	1	2	0	1	0	0	4-6 	4	6	0	\N	\N	\N	\N	6.29999999999999982	25	12
761	24	2016-01-10	BUF	21	BUF21	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	27	12
765	24	2016-01-10	BUF	7	BUF7	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	30	12
768	24	2016-01-10	BUF	20	BUF20	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	32	12
758	24	2016-01-10	BUF	24	BUF24	F 	0	0	0	2	3	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.89999999999999991	35	12
767	24	2016-01-10	BUF	12	BUF12	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	36	12
756	24	2016-01-10	BUF	77	BUF77	F 	0	1	1	0	2	0	0	6-7 	6	7	0	\N	\N	\N	\N	2.89999999999999991	38	12
763	24	2016-01-10	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	12
775	24	2016-01-10	CON	56	CON56	F 	0	0	0	2	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009	44	12
782	24	2016-01-10	CON	26	CON26	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	46	12
772	24	2016-01-10	CON	13	CON13	D 	0	2	2	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	49	12
781	24	2016-01-10	CON	5	CON5	F 	0	0	0	0	2	0	0	4-12 	4	12	0	\N	\N	\N	\N	0.200000000000000011	50	12
754	24	2016-01-10	BUF	3	BUF3	F 	2	1	3	2	8	0	0	3-5 	3	5	0	\N	\N	1	\N	15.3000000000000007	52	12
771	24	2016-01-10	CON	61	CON61	F 	2	0	2	4	10	1	1	24-6 	24	6	1	1	\N	\N	\N	25.3000000000000007	53	12
774	24	2016-01-10	CON	8	CON8	F 	0	1	1	0	12	0	0	5-4 	5	4	0	\N	\N	\N	\N	8.09999999999999964	54	12
762	24	2016-01-10	BUF	14	BUF14	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	56	12
759	24	2016-01-10	BUF	36	BUF36	F 	0	0	0	0	0	0	0	8-12 	8	12	0	\N	\N	\N	\N	-0.400000000000000022	60	12
757	24	2016-01-10	BUF	23	BUF23	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	63	12
766	24	2016-01-10	BUF	9	BUF9	D 	0	0	0	0	9	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	70	12
755	24	2016-01-10	BUF	10	BUF10	F 	1	1	2	0	6	0	0	15-13 	15	13	0	\N	\N	\N	\N	9.19999999999999929	71	12
770	24	2016-01-10	CON	16	CON16	F 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	73	12
783	24	2016-01-10	CON	9	CON9	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	74	12
764	24	2016-01-10	BUF	2	BUF2	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	78	12
777	24	2016-01-10	CON	6	CON6	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	81	12
779	24	2016-01-10	CON	27	CON27	F 	0	0	0	0	4	0	0	1-5 	1	5	0	\N	\N	\N	\N	1.60000000000000009	84	12
776	24	2016-01-10	CON	44	CON44	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	86	12
760	24	2016-01-10	BUF	43	BUF43	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	87	12
769	24	2016-01-10	CON	17	CON17	F 	2	1	3	2	3	0	0	0-0 	0	0	0	\N	1	\N	\N	14	89	12
812	25	2016-01-17	BOS	2	BOS2	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	1	13
786	25	2016-01-17	CON	88	CON88	F 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	2	13
804	25	2016-01-17	BOS	16	BOS16	F 	1	0	1	2	3	0	0	1-1 	1	1	0	\N	\N	\N	\N	6	4	13
814	25	2016-01-17	BOS	10	BOS10	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	10	13
815	25	2016-01-17	BOS	14	BOS14	F 	0	0	0	2	6	0	0	14-13 	14	13	0	\N	\N	\N	\N	3.60000000000000009	12	13
796	25	2016-01-17	CON	19	CON19	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	14	13
813	25	2016-01-17	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	13
816	25	2016-01-17	BOS	18	BOS18	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	20	13
805	25	2016-01-17	BOS	23	BOS23	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	23	13
790	25	2016-01-17	CON	22	CON22	F 	0	0	0	0	2	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.900000000000000022	25	13
809	25	2016-01-17	BOS	15	BOS15	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	29	13
800	25	2016-01-17	BOS	19	BOS19	D 	1	1	2	0	1	1	0	0-0 	0	0	1	\N	\N	\N	\N	12	34	13
799	25	2016-01-17	BOS	21	BOS21	F 	1	2	3	0	9	0	0	1-0 	1	0	0	\N	\N	\N	\N	12.5999999999999996	39	13
789	25	2016-01-17	CON	56	CON56	F 	0	0	0	2	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.39999999999999991	44	13
811	25	2016-01-17	BOS	3	BOS3	F 	0	0	0	0	4	0	0	7-8 	7	8	0	\N	\N	\N	\N	1.89999999999999991	45	13
788	25	2016-01-17	CON	26	CON26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	46	13
803	25	2016-01-17	BOS	11	BOS11	F 	1	0	1	0	2	1	0	0-0 	0	0	0	1	\N	\N	\N	8.5	47	13
802	25	2016-01-17	BOS	22	BOS22	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	48	13
794	25	2016-01-17	CON	13	CON13	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	13
798	25	2016-01-17	CON	5	CON5	F 	0	0	0	0	1	0	0	7-6 	7	6	0	\N	\N	\N	\N	0.599999999999999978	50	13
784	25	2016-01-17	CON	61	CON61	F 	0	1	1	2	2	0	0	17-9 	17	9	0	\N	\N	\N	\N	4.29999999999999982	53	13
792	25	2016-01-17	CON	8	CON8	F 	0	0	0	0	4	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.80000000000000004	54	13
810	25	2016-01-17	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	13
801	25	2016-01-17	BOS	12	BOS12	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	68	13
807	25	2016-01-17	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	13
795	25	2016-01-17	CON	16	CON16	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	73	13
791	25	2016-01-17	CON	9	CON9	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	74	13
806	25	2016-01-17	BOS	91	BOS91	F 	0	0	0	0	1	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.400000000000000022	79	13
793	25	2016-01-17	CON	6	CON6	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	81	13
787	25	2016-01-17	CON	27	CON27	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	84	13
785	25	2016-01-17	CON	44	CON44	D 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	1	\N	6.5	86	13
797	25	2016-01-17	CON	17	CON17	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	89	13
808	25	2016-01-17	BOS	44	BOS44	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	90	13
842	26	2016-01-17	NYR	10	NYR10	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	8	13
836	26	2016-01-17	NYR	28	NYR28	F 	0	1	1	0	2	0	0	1-1 	1	1	0	\N	\N	\N	\N	3	9	13
831	26	2016-01-17	NYR	17	NYR17	F 	2	0	2	10	4	2	0	0-0 	0	0	0	\N	\N	\N	\N	13.5	11	13
834	26	2016-01-17	NYR	20	NYR20	F 	0	2	2	24	11	0	0	8-6 	8	6	0	\N	\N	\N	1	20.6999999999999993	16	13
839	26	2016-01-17	NYR	24	NYR24	F 	0	1	1	2	2	0	0	7-3 	7	3	0	\N	\N	\N	\N	3.89999999999999991	18	13
818	26	2016-01-17	BUF	21	BUF21	F 	0	3	3	2	8	0	0	0-0 	0	0	0	\N	\N	\N	\N	10.5	27	13
843	26	2016-01-17	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	13
825	26	2016-01-17	BUF	7	BUF7	D 	1	0	1	2	3	0	0	0-0 	0	0	0	1	\N	\N	1	14	30	13
828	26	2016-01-17	BUF	20	BUF20	F 	0	0	0	0	0	0	0	0-1 	0	1	0	\N	\N	\N	\N	-0.100000000000000006	32	13
845	26	2016-01-17	NYR	21	NYR21	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	33	13
817	26	2016-01-17	BUF	24	BUF24	F 	0	3	3	2	4	0	0	2-2 	2	2	0	\N	\N	\N	\N	8.5	35	13
822	26	2016-01-17	BUF	12	BUF12	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	36	13
827	26	2016-01-17	BUF	77	BUF77	F 	0	0	0	4	2	0	0	7-6 	7	6	0	\N	\N	\N	\N	2.10000000000000009	38	13
837	26	2016-01-17	NYR	12	NYR12	F 	0	1	1	0	0	0	0	7-8 	7	8	0	\N	\N	\N	\N	1.89999999999999991	41	13
823	26	2016-01-17	BUF	6	BUF6	F 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	43	13
829	26	2016-01-17	BUF	14	BUF14	D 	0	0	0	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	56	13
833	26	2016-01-17	NYR	26	NYR26	D 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	59	13
819	26	2016-01-17	BUF	36	BUF36	F 	2	0	2	0	5	1	0	12-16 	12	16	0	\N	\N	1	\N	11.5999999999999996	60	13
830	26	2016-01-17	BUF	23	BUF23	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	63	13
838	26	2016-01-17	NYR	9	NYR9	F 	1	0	1	4	4	0	0	11-11 	11	11	0	\N	\N	\N	\N	7	64	13
835	26	2016-01-17	NYR	14	NYR14	F 	0	1	1	0	5	0	0	0-3 	0	3	0	\N	\N	\N	\N	4.20000000000000018	65	13
844	26	2016-01-17	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	13
826	26	2016-01-17	BUF	9	BUF9	D 	1	0	1	4	10	0	0	1-0 	1	0	0	\N	\N	\N	\N	10.0999999999999996	70	13
840	26	2016-01-17	NYR	18	NYR18	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	72	13
832	26	2016-01-17	NYR	11	NYR11	F 	2	0	2	2	7	1	0	0-2 	0	2	0	\N	1	\N	\N	14.3000000000000007	75	13
824	26	2016-01-17	BUF	2	BUF2	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	78	13
821	26	2016-01-17	BUF	13	BUF13	F 	0	1	1	0	1	0	0	12-9 	12	9	0	\N	\N	\N	1	7.79999999999999982	82	13
841	26	2016-01-17	NYR	8	NYR8	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	85	13
820	26	2016-01-17	BUF	43	BUF43	F 	1	0	1	2	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	7.5	87	13
862	27	2016-01-31	NYR	2	NYR2	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	5	14
881	27	2016-01-31	BUF	15	BUF15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	6	14
857	27	2016-01-31	NYR	10	NYR10	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	8	14
850	27	2016-01-31	NYR	28	NYR28	F 	1	0	1	0	5	0	0	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036	9	14
846	27	2016-01-31	NYR	17	NYR17	F 	1	1	2	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	6.59999999999999964	11	14
847	27	2016-01-31	NYR	20	NYR20	F 	0	1	1	0	2	0	0	11-10 	11	10	0	\N	\N	\N	\N	3.10000000000000009	16	14
854	27	2016-01-31	NYR	24	NYR24	F 	0	0	0	2	2	0	0	6-2 	6	2	0	\N	\N	\N	\N	1.89999999999999991	18	14
863	27	2016-01-31	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	14
877	27	2016-01-31	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	14
882	27	2016-01-31	BUF	21	BUF21	F 	0	0	0	2	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	27	14
859	27	2016-01-31	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	14
869	27	2016-01-31	BUF	7	BUF7	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	30	14
851	27	2016-01-31	NYR	22	NYR22	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	31	14
870	27	2016-01-31	BUF	20	BUF20	F 	1	0	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	32	14
852	27	2016-01-31	NYR	21	NYR21	D 	0	0	0	6	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	33	14
872	27	2016-01-31	BUF	24	BUF24	F 	0	0	0	2	3	0	0	3-0 	3	0	0	\N	\N	\N	\N	2.29999999999999982	35	14
880	27	2016-01-31	BUF	12	BUF12	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	36	14
873	27	2016-01-31	BUF	77	BUF77	F 	0	0	0	0	1	0	0	8-6 	8	6	0	\N	\N	\N	\N	0.699999999999999956	38	14
861	27	2016-01-31	NYR	12	NYR12	F 	0	0	0	0	1	0	0	2-11 	2	11	0	\N	\N	\N	\N	-0.400000000000000022	41	14
879	27	2016-01-31	BUF	6	BUF6	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	43	14
866	27	2016-01-31	BUF	3	BUF3	F 	2	1	3	0	8	2	0	0-0 	0	0	0	\N	\N	\N	\N	15	52	14
876	27	2016-01-31	BUF	14	BUF14	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	56	14
855	27	2016-01-31	NYR	26	NYR26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	59	14
875	27	2016-01-31	BUF	36	BUF36	F 	0	0	0	0	1	0	0	12-7 	12	7	0	\N	\N	\N	\N	1	60	14
874	27	2016-01-31	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	14
849	27	2016-01-31	NYR	9	NYR9	F 	0	1	1	2	2	0	0	8-10 	8	10	0	\N	\N	\N	\N	3.29999999999999982	64	14
848	27	2016-01-31	NYR	14	NYR14	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	65	14
871	27	2016-01-31	BUF	26	BUF26	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	66	14
864	27	2016-01-31	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	14
867	27	2016-01-31	BUF	9	BUF9	D 	0	2	2	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	70	14
865	27	2016-01-31	BUF	10	BUF10	F 	0	3	3	0	7	0	0	5-5 	5	5	0	\N	\N	\N	\N	9.5	71	14
856	27	2016-01-31	NYR	18	NYR18	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	72	14
860	27	2016-01-31	NYR	11	NYR11	F 	0	0	0	0	0	0	0	0-3 	0	3	0	\N	\N	\N	\N	-0.299999999999999989	75	14
878	27	2016-01-31	BUF	2	BUF2	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	78	14
868	27	2016-01-31	BUF	13	BUF13	F 	1	0	1	0	5	0	0	9-10 	9	10	1	\N	\N	\N	\N	11.4000000000000004	82	14
858	27	2016-01-31	NYR	8	NYR8	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	14
853	27	2016-01-31	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	88	14
894	28	2016-01-31	BOS	2	BOS2	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	1	14
905	28	2016-01-31	CON	88	CON88	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	2	14
898	28	2016-01-31	BOS	16	BOS16	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	4	14
912	28	2016-01-31	CON	4	CON4	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	7	14
896	28	2016-01-31	BOS	10	BOS10	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	10	14
884	28	2016-01-31	BOS	14	BOS14	F 	1	2	3	0	9	0	1	12-13 	12	13	0	\N	1	\N	\N	15.4000000000000004	12	14
901	28	2016-01-31	CON	19	CON19	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	14	14
895	28	2016-01-31	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	14
890	28	2016-01-31	BOS	23	BOS23	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	23	14
907	28	2016-01-31	CON	22	CON22	F 	0	0	0	0	2	0	0	2-12 	2	12	0	\N	\N	\N	\N	0	25	14
891	28	2016-01-31	BOS	15	BOS15	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	29	14
886	28	2016-01-31	BOS	19	BOS19	D 	1	1	2	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7	34	14
885	28	2016-01-31	BOS	21	BOS21	F 	2	1	3	0	9	0	0	4-1 	4	1	1	1	\N	\N	\N	22.8000000000000007	39	14
900	28	2016-01-31	CON	56	CON56	F 	0	1	1	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	44	14
893	28	2016-01-31	BOS	3	BOS3	F 	0	0	0	2	4	0	0	7-17 	7	17	0	\N	\N	\N	\N	1.5	45	14
906	28	2016-01-31	CON	26	CON26	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	46	14
883	28	2016-01-31	BOS	11	BOS11	F 	1	2	3	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	10	47	14
887	28	2016-01-31	BOS	22	BOS22	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	48	14
908	28	2016-01-31	CON	13	CON13	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	14
899	28	2016-01-31	CON	61	CON61	F 	1	0	1	2	6	0	0	24-7 	24	7	0	\N	\N	1	\N	10.1999999999999993	53	14
903	28	2016-01-31	CON	8	CON8	F 	1	0	1	0	2	1	0	9-9 	9	9	0	\N	\N	\N	\N	5.5	54	14
892	28	2016-01-31	BOS	5	BOS5	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	14
897	28	2016-01-31	BOS	12	BOS12	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	68	14
910	28	2016-01-31	CON	16	CON16	F 	0	0	0	2	4	0	0	2-2 	2	2	0	\N	\N	\N	\N	2.5	73	14
902	28	2016-01-31	CON	9	CON9	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	74	14
888	28	2016-01-31	BOS	91	BOS91	F 	0	0	0	0	2	0	0	10-7 	10	7	0	\N	\N	\N	\N	1.30000000000000004	79	14
909	28	2016-01-31	CON	6	CON6	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	81	14
904	28	2016-01-31	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	14
911	28	2016-01-31	CON	17	CON17	F 	0	0	0	0	0	0	0	3-1 	3	1	0	\N	\N	\N	\N	0.200000000000000011	89	14
889	28	2016-01-31	BOS	44	BOS44	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	90	14
916	29	2016-02-06	BOS	2	BOS2	D 	0	2	2	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	1	15
921	29	2016-02-06	BOS	16	BOS16	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	4	15
939	29	2016-02-06	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	15
941	29	2016-02-06	NYR	10	NYR10	D 	0	0	0	0	1	0	0	3-0 	3	0	0	\N	\N	\N	\N	0.800000000000000044	8	15
935	29	2016-02-06	NYR	28	NYR28	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	9	15
922	29	2016-02-06	BOS	10	BOS10	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	10	15
929	29	2016-02-06	NYR	17	NYR17	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	11	15
915	29	2016-02-06	BOS	14	BOS14	F 	1	1	2	0	6	0	0	5-0 	5	0	0	\N	1	\N	\N	11.5	12	15
932	29	2016-02-06	NYR	20	NYR20	F 	0	0	0	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.10000000000000009	16	15
923	29	2016-02-06	BOS	7	BOS7	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	17	15
933	29	2016-02-06	NYR	24	NYR24	F 	0	0	0	2	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009	18	15
926	29	2016-02-06	BOS	23	BOS23	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	23	15
938	29	2016-02-06	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	15
928	29	2016-02-06	BOS	15	BOS15	F 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	29	15
931	29	2016-02-06	NYR	21	NYR21	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	33	15
913	29	2016-02-06	BOS	19	BOS19	D 	1	1	2	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	7.5	34	15
918	29	2016-02-06	BOS	21	BOS21	F 	1	0	1	0	7	0	0	2-0 	2	0	0	\N	\N	\N	\N	7.70000000000000018	39	15
942	29	2016-02-06	NYR	12	NYR12	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	41	15
917	29	2016-02-06	BOS	3	BOS3	F 	1	1	2	0	5	1	0	3-0 	3	0	1	1	\N	\N	\N	17.3000000000000007	45	15
914	29	2016-02-06	BOS	11	BOS11	F 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	47	15
920	29	2016-02-06	BOS	5	BOS5	F 	1	0	1	0	2	0	0	1-0 	1	0	0	\N	\N	\N	\N	5.09999999999999964	55	15
934	29	2016-02-06	NYR	26	NYR26	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	59	15
930	29	2016-02-06	NYR	9	NYR9	F 	1	0	1	2	2	1	0	0-0 	0	0	0	\N	\N	1	\N	7	64	15
937	29	2016-02-06	NYR	14	NYR14	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	65	15
927	29	2016-02-06	BOS	12	BOS12	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	68	15
924	29	2016-02-06	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	15
936	29	2016-02-06	NYR	18	NYR18	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	72	15
943	29	2016-02-06	NYR	11	NYR11	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	75	15
925	29	2016-02-06	BOS	91	BOS91	F 	0	0	0	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	79	15
940	29	2016-02-06	NYR	8	NYR8	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	15
919	29	2016-02-06	BOS	44	BOS44	F 	1	0	1	4	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	7.59999999999999964	90	15
967	30	2016-02-07	CON	19	CON19	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	14	15
955	30	2016-02-07	BUF	21	BUF21	F 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	27	15
954	30	2016-02-07	BUF	7	BUF7	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	30	15
966	30	2016-02-07	CON	44	CON44	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	86	15
953	30	2016-02-07	BUF	24	BUF24	F 	0	0	0	4	2	0	0	0-4 	0	4	0	\N	\N	\N	\N	1.60000000000000009	35	15
965	30	2016-02-07	CON	56	CON56	F 	0	0	0	0	3	0	0	6-6 	6	6	0	\N	\N	\N	\N	1.5	44	15
952	30	2016-02-07	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	15
964	30	2016-02-07	CON	6	CON6	D 	0	1	1	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	81	15
963	30	2016-02-07	CON	5	CON5	F 	1	0	1	0	5	0	0	0-2 	0	2	0	\N	\N	\N	\N	6.29999999999999982	50	15
951	30	2016-02-07	BUF	43	BUF43	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	87	15
962	30	2016-02-07	CON	88	CON88	F 	1	0	1	0	2	1	0	1-0 	1	0	0	\N	\N	\N	\N	5.59999999999999964	2	15
950	30	2016-02-07	BUF	36	BUF36	F 	0	0	0	0	0	0	0	2-13 	2	13	0	\N	\N	\N	\N	-1.10000000000000009	60	15
949	30	2016-02-07	BUF	20	BUF20	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	32	15
961	30	2016-02-07	CON	16	CON16	F 	0	1	1	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	73	15
948	30	2016-02-07	BUF	12	BUF12	F 	1	0	1	0	3	0	1	0-1 	0	1	0	\N	\N	\N	\N	6.40000000000000036	36	15
960	30	2016-02-07	CON	9	CON9	D 	1	0	1	0	3	0	0	0-0 	0	0	1	1	\N	\N	\N	13.5	74	15
947	30	2016-02-07	BUF	77	BUF77	F 	0	1	1	0	3	0	0	5-8 	5	8	0	\N	\N	\N	\N	3.20000000000000018	38	15
959	30	2016-02-07	CON	61	CON61	F 	0	2	2	0	6	0	0	20-8 	20	8	0	\N	\N	\N	\N	8.19999999999999929	53	15
958	30	2016-02-07	CON	8	CON8	F 	0	2	2	4	1	0	0	5-5 	5	5	0	\N	1	\N	\N	7.5	54	15
946	30	2016-02-07	BUF	23	BUF23	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	63	15
971	30	2016-02-07	CON	22	CON22	F 	0	0	0	2	1	0	0	1-1 	1	1	0	\N	\N	\N	\N	1	25	15
969	30	2016-02-07	CON	13	CON13	D 	0	0	0	6	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	15
945	30	2016-02-07	BUF	14	BUF14	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	1	\N	4	56	15
957	30	2016-02-07	BUF	10	BUF10	F 	0	0	0	2	6	0	0	3-2 	3	2	0	\N	\N	\N	\N	3.60000000000000009	71	15
970	30	2016-02-07	CON	4	CON4	D 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006	7	15
956	30	2016-02-07	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	15
972	30	2016-02-07	CON	26	CON26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	46	15
944	30	2016-02-07	BUF	13	BUF13	F 	1	0	1	0	3	0	0	11-7 	11	7	0	\N	\N	\N	\N	5.90000000000000036	82	15
968	30	2016-02-07	CON	17	CON17	F 	0	0	0	0	3	0	0	1-0 	1	0	0	\N	\N	\N	\N	1.60000000000000009	89	15
1000	31	2016-02-14	NYR	10	NYR10	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	8	16
995	31	2016-02-14	NYR	28	NYR28	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	9	16
991	31	2016-02-14	NYR	17	NYR17	F 	1	0	1	0	2	1	0	2-1 	2	1	0	\N	\N	\N	\N	5.59999999999999964	11	16
988	31	2016-02-14	NYR	20	NYR20	F 	0	2	2	2	0	0	0	12-15 	12	15	0	\N	\N	\N	1	9.19999999999999929	16	16
994	31	2016-02-14	NYR	24	NYR24	F 	0	0	0	0	0	0	0	3-0 	3	0	0	\N	\N	\N	\N	0.299999999999999989	18	16
1002	31	2016-02-14	NYR	13	NYR13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	21	16
977	31	2016-02-14	BUF	21	BUF21	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	27	16
999	31	2016-02-14	NYR	4	NYR4	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	28	16
985	31	2016-02-14	BUF	7	BUF7	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	1	5	30	16
973	31	2016-02-14	BUF	20	BUF20	F 	0	2	2	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	32	16
996	31	2016-02-14	NYR	21	NYR21	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	16
980	31	2016-02-14	BUF	24	BUF24	F 	0	0	0	2	5	0	0	1-1 	1	1	0	\N	\N	\N	\N	3	35	16
986	31	2016-02-14	BUF	12	BUF12	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	36	16
978	31	2016-02-14	BUF	77	BUF77	F 	0	0	0	0	2	0	0	2-2 	2	2	0	\N	\N	\N	\N	1	38	16
1001	31	2016-02-14	NYR	12	NYR12	F 	0	0	0	0	1	0	0	10-9 	10	9	0	\N	\N	\N	\N	0.599999999999999978	41	16
983	31	2016-02-14	BUF	6	BUF6	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	43	16
974	31	2016-02-14	BUF	3	BUF3	F 	1	1	2	4	8	0	0	0-2 	0	2	0	\N	\N	\N	\N	10.8000000000000007	52	16
982	31	2016-02-14	BUF	14	BUF14	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	56	16
989	31	2016-02-14	NYR	26	NYR26	D 	0	2	2	0	1	0	0	0-0 	0	0	0	1	\N	\N	1	12.5	59	16
979	31	2016-02-14	BUF	36	BUF36	F 	0	0	0	0	6	0	0	12-11 	12	11	0	\N	\N	\N	\N	3.10000000000000009	60	16
987	31	2016-02-14	BUF	23	BUF23	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	63	16
993	31	2016-02-14	NYR	9	NYR9	F 	0	1	1	2	0	0	0	2-4 	2	4	0	\N	\N	\N	\N	2.29999999999999982	64	16
997	31	2016-02-14	NYR	14	NYR14	F 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	65	16
975	31	2016-02-14	BUF	9	BUF9	D 	0	2	2	0	5	0	0	1-0 	1	0	0	\N	\N	\N	\N	6.59999999999999964	70	16
990	31	2016-02-14	NYR	18	NYR18	F 	1	0	1	2	5	0	0	2-0 	2	0	0	\N	\N	\N	\N	7.20000000000000018	72	16
992	31	2016-02-14	NYR	11	NYR11	F 	1	0	1	0	4	0	0	0-0 	0	0	0	\N	\N	1	\N	7	75	16
984	31	2016-02-14	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	16
976	31	2016-02-14	BUF	13	BUF13	F 	1	0	1	0	2	0	0	12-15 	12	15	0	\N	\N	\N	\N	4.70000000000000018	82	16
998	31	2016-02-14	NYR	8	NYR8	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	85	16
981	31	2016-02-14	BUF	43	BUF43	F 	0	0	0	0	0	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.100000000000000006	87	16
1023	32	2016-02-14	BOS	2	BOS2	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	1	16
1010	32	2016-02-14	CON	88	CON88	F 	0	0	0	0	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	0.599999999999999978	2	16
1032	32	2016-02-14	BOS	16	BOS16	F 	0	0	0	0	2	0	0	1-2 	1	2	0	\N	\N	\N	\N	0.900000000000000022	4	16
1016	32	2016-02-14	CON	4	CON4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	7	16
1030	32	2016-02-14	BOS	10	BOS10	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	10	16
1020	32	2016-02-14	BOS	14	BOS14	F 	1	1	2	0	5	1	0	8-10 	8	10	0	\N	\N	\N	\N	8.80000000000000071	12	16
1005	32	2016-02-14	CON	19	CON19	F 	1	0	1	0	1	0	0	3-3 	3	3	0	\N	\N	\N	\N	4.5	14	16
1024	32	2016-02-14	BOS	23	BOS23	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	23	16
1011	32	2016-02-14	CON	22	CON22	F 	0	0	0	0	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	0.599999999999999978	25	16
1028	32	2016-02-14	BOS	15	BOS15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	29	16
1019	32	2016-02-14	BOS	19	BOS19	D 	1	1	2	2	7	0	1	0-0 	0	0	0	\N	\N	\N	\N	11	34	16
1021	32	2016-02-14	BOS	21	BOS21	F 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	39	16
1022	32	2016-02-14	BOS	3	BOS3	F 	0	1	1	0	5	0	0	5-11 	5	11	0	\N	\N	\N	\N	3.89999999999999991	45	16
1003	32	2016-02-14	CON	26	CON26	D 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	46	16
1018	32	2016-02-14	BOS	11	BOS11	F 	2	1	3	0	7	0	0	0-0 	0	0	1	\N	\N	\N	\N	18.5	47	16
1012	32	2016-02-14	CON	13	CON13	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	49	16
1007	32	2016-02-14	CON	5	CON5	F 	0	0	0	0	2	0	0	4-0 	4	0	0	\N	\N	\N	\N	1.39999999999999991	50	16
1009	32	2016-02-14	CON	61	CON61	F 	0	0	0	2	0	0	0	9-10 	9	10	0	\N	\N	\N	\N	0.400000000000000022	53	16
1004	32	2016-02-14	CON	8	CON8	F 	1	0	1	0	2	0	0	13-4 	13	4	0	\N	\N	\N	\N	5.90000000000000036	54	16
1029	32	2016-02-14	BOS	5	BOS5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	55	16
1031	32	2016-02-14	BOS	12	BOS12	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	68	16
1027	32	2016-02-14	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	16
1014	32	2016-02-14	CON	16	CON16	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	73	16
1013	32	2016-02-14	CON	9	CON9	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	74	16
1025	32	2016-02-14	BOS	91	BOS91	F 	0	0	0	0	1	0	0	4-8 	4	8	0	\N	\N	\N	\N	0.100000000000000006	79	16
1006	32	2016-02-14	CON	28	CON28	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	80	16
1017	32	2016-02-14	CON	6	CON6	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	81	16
1008	32	2016-02-14	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	16
1015	32	2016-02-14	CON	17	CON17	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	89	16
1026	32	2016-02-14	BOS	44	BOS44	F 	0	0	0	0	6	0	0	0-1 	0	1	0	\N	\N	\N	\N	2.89999999999999991	90	16
1041	33	2016-02-21	BOS	2	BOS2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	1	17
1054	33	2016-02-21	CON	88	CON88	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	2	17
1045	33	2016-02-21	BOS	16	BOS16	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	4	17
1044	33	2016-02-21	BOS	10	BOS10	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	10	17
1033	33	2016-02-21	BOS	14	BOS14	F 	3	1	4	0	8	0	1	10-13 	10	13	0	1	\N	\N	\N	21.6999999999999993	12	17
1056	33	2016-02-21	CON	19	CON19	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	14	17
1039	33	2016-02-21	BOS	23	BOS23	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	23	17
1061	33	2016-02-21	CON	22	CON22	F 	0	0	0	4	0	0	0	2-1 	2	1	0	\N	\N	\N	\N	1.10000000000000009	25	17
1038	33	2016-02-21	BOS	15	BOS15	F 	1	0	1	0	1	0	1	0-0 	0	0	0	\N	\N	\N	\N	5.5	29	17
1046	33	2016-02-21	BOS	19	BOS19	D 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	34	17
1034	33	2016-02-21	BOS	21	BOS21	F 	1	2	3	2	12	0	0	4-0 	4	0	1	\N	1	\N	\N	21.8999999999999986	39	17
1055	33	2016-02-21	CON	56	CON56	F 	0	0	0	0	1	0	0	5-6 	5	6	0	\N	\N	\N	\N	0.400000000000000022	44	17
1042	33	2016-02-21	BOS	3	BOS3	F 	0	0	0	2	6	0	0	12-17 	12	17	0	\N	\N	\N	\N	3	45	17
1050	33	2016-02-21	CON	26	CON26	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	46	17
1037	33	2016-02-21	BOS	11	BOS11	F 	0	1	1	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	47	17
1035	33	2016-02-21	BOS	22	BOS22	D 	0	2	2	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	48	17
1060	33	2016-02-21	CON	13	CON13	D 	0	0	0	4	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	17
1049	33	2016-02-21	CON	5	CON5	F 	0	1	1	0	2	0	0	2-1 	2	1	0	\N	\N	\N	\N	3.10000000000000009	50	17
1051	33	2016-02-21	CON	61	CON61	F 	1	0	1	2	7	0	0	19-12 	19	12	0	\N	\N	\N	\N	8.69999999999999929	53	17
1052	33	2016-02-21	CON	8	CON8	F 	0	1	1	2	3	0	0	13-10 	13	10	0	\N	\N	\N	\N	4.29999999999999982	54	17
1043	33	2016-02-21	BOS	5	BOS5	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	55	17
1059	33	2016-02-21	CON	10	CON10	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	62	17
1047	33	2016-02-21	BOS	12	BOS12	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	68	17
1048	33	2016-02-21	CON	16	CON16	F 	2	0	2	0	6	0	0	0-0 	0	0	0	\N	\N	1	\N	12	73	17
1057	33	2016-02-21	CON	9	CON9	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	74	17
1036	33	2016-02-21	BOS	91	BOS91	F 	0	1	1	2	1	0	0	5-11 	5	11	0	\N	\N	\N	\N	2.39999999999999991	79	17
1053	33	2016-02-21	CON	28	CON28	F 	0	0	0	2	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	80	17
1058	33	2016-02-21	CON	6	CON6	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	81	17
1062	33	2016-02-21	CON	17	CON17	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	89	17
1040	33	2016-02-21	BOS	44	BOS44	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	90	17
1073	34	2016-02-21	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	17
1075	34	2016-02-21	NYR	10	NYR10	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	8	17
1069	34	2016-02-21	NYR	28	NYR28	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	9	17
1063	34	2016-02-21	NYR	17	NYR17	F 	1	0	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	6	11	17
1065	34	2016-02-21	NYR	20	NYR20	F 	0	0	0	0	5	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	16	17
1067	34	2016-02-21	NYR	24	NYR24	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	18	17
1082	34	2016-02-21	BUF	21	BUF21	F 	0	1	1	2	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	27	17
1072	34	2016-02-21	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	17
1088	34	2016-02-21	BUF	7	BUF7	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	30	17
1090	34	2016-02-21	BUF	20	BUF20	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	32	17
1064	34	2016-02-21	NYR	21	NYR21	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	33	17
1089	34	2016-02-21	BUF	24	BUF24	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	35	17
1085	34	2016-02-21	BUF	12	BUF12	F 	0	1	1	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	36	17
1079	34	2016-02-21	BUF	77	BUF77	F 	0	2	2	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	38	17
1076	34	2016-02-21	NYR	12	NYR12	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	41	17
1086	34	2016-02-21	BUF	3	BUF3	F 	1	0	1	4	12	0	0	0-0 	0	0	0	\N	\N	\N	\N	11	52	17
1084	34	2016-02-21	BUF	14	BUF14	D 	0	1	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	56	17
1068	34	2016-02-21	NYR	26	NYR26	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	59	17
1083	34	2016-02-21	BUF	36	BUF36	F 	1	0	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	5.5	60	17
1091	34	2016-02-21	BUF	23	BUF23	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	17
1074	34	2016-02-21	NYR	9	NYR9	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	64	17
1070	34	2016-02-21	NYR	14	NYR14	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	65	17
1080	34	2016-02-21	BUF	9	BUF9	D 	1	1	2	2	3	0	0	0-0 	0	0	0	\N	1	\N	\N	10	70	17
1078	34	2016-02-21	BUF	10	BUF10	F 	1	1	2	0	3	0	0	0-0 	0	0	1	1	\N	\N	\N	15.5	71	17
1066	34	2016-02-21	NYR	18	NYR18	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	72	17
1077	34	2016-02-21	NYR	11	NYR11	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	75	17
1087	34	2016-02-21	BUF	2	BUF2	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	78	17
1092	34	2016-02-21	BUF	13	BUF13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	82	17
1071	34	2016-02-21	NYR	8	NYR8	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	17
1081	34	2016-02-21	BUF	43	BUF43	F 	1	0	1	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	87	17
1099	35	2016-02-28	BOS	2	BOS2	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	1	18
1107	35	2016-02-28	BOS	16	BOS16	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	4	18
1104	35	2016-02-28	BOS	10	BOS10	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	10	18
1098	35	2016-02-28	BOS	14	BOS14	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	12	18
1095	35	2016-02-28	BOS	23	BOS23	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	23	18
1114	35	2016-02-28	BUF	21	BUF21	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	27	18
1106	35	2016-02-28	BOS	15	BOS15	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	29	18
1119	35	2016-02-28	BUF	7	BUF7	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	30	18
1122	35	2016-02-28	BUF	20	BUF20	F 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	32	18
1103	35	2016-02-28	BOS	19	BOS19	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	34	18
1112	35	2016-02-28	BUF	24	BUF24	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	35	18
1120	35	2016-02-28	BUF	12	BUF12	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	36	18
1105	35	2016-02-28	BOS	0	BOS0	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	37	18
1093	35	2016-02-28	BOS	21	BOS21	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	39	18
1117	35	2016-02-28	BUF	6	BUF6	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	43	18
1100	35	2016-02-28	BOS	3	BOS3	F 	1	0	1	2	0	0	0	0-0 	0	0	1	\N	\N	\N	\N	9.5	45	18
1108	35	2016-02-28	BOS	11	BOS11	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	47	18
1094	35	2016-02-28	BOS	22	BOS22	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	48	18
1102	35	2016-02-28	BOS	5	BOS5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	55	18
1116	35	2016-02-28	BUF	14	BUF14	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	56	18
1115	35	2016-02-28	BUF	36	BUF36	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	60	18
1113	35	2016-02-28	BUF	23	BUF23	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	63	18
1097	35	2016-02-28	BOS	12	BOS12	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	68	18
1101	35	2016-02-28	BOS	57	BOS57	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	69	18
1109	35	2016-02-28	BUF	9	BUF9	D 	0	2	2	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	70	18
1110	35	2016-02-28	BUF	10	BUF10	F 	1	0	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	4	71	18
1118	35	2016-02-28	BUF	2	BUF2	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	78	18
1121	35	2016-02-28	BUF	13	BUF13	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	82	18
1111	35	2016-02-28	BUF	43	BUF43	F 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	87	18
1096	35	2016-02-28	BOS	44	BOS44	F 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	90	18
1146	36	2016-02-28	CON	88	CON88	F 	0	0	0	4	1	0	0	1-4 	1	4	0	\N	\N	\N	\N	1.19999999999999996	2	18
1136	36	2016-02-28	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	18
1150	36	2016-02-28	CON	4	CON4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	7	18
1124	36	2016-02-28	NYR	10	NYR10	D 	0	1	1	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3.5	8	18
1129	36	2016-02-28	NYR	28	NYR28	F 	0	0	0	4	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	9	18
1127	36	2016-02-28	NYR	17	NYR17	F 	1	0	1	0	3	1	0	1-0 	1	0	0	\N	\N	\N	\N	6.09999999999999964	11	18
1148	36	2016-02-28	CON	19	CON19	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	14	18
1123	36	2016-02-28	NYR	20	NYR20	F 	0	2	2	0	6	0	0	9-21 	9	21	0	\N	1	\N	\N	7.79999999999999982	16	18
1128	36	2016-02-28	NYR	24	NYR24	F 	0	0	0	2	3	0	0	2-0 	2	0	0	\N	\N	\N	\N	2.20000000000000018	18	18
1140	36	2016-02-28	CON	22	CON22	F 	1	1	2	2	1	0	0	2-1 	2	1	0	\N	\N	\N	\N	7.09999999999999964	25	18
1133	36	2016-02-28	NYR	4	NYR4	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	28	18
1130	36	2016-02-28	NYR	21	NYR21	D 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	18
1135	36	2016-02-28	NYR	12	NYR12	F 	0	0	0	0	0	0	0	4-4 	4	4	0	\N	\N	\N	\N	0	41	18
1145	36	2016-02-28	CON	56	CON56	F 	0	0	0	0	0	0	0	2-4 	2	4	0	\N	\N	\N	\N	-0.200000000000000011	44	18
1141	36	2016-02-28	CON	26	CON26	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	46	18
1151	36	2016-02-28	CON	13	CON13	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	49	18
1139	36	2016-02-28	CON	61	CON61	F 	0	2	2	0	6	0	0	18-5 	18	5	0	\N	\N	1	\N	9.30000000000000071	53	18
1142	36	2016-02-28	CON	8	CON8	F 	1	0	1	6	3	1	0	12-13 	12	13	1	\N	\N	\N	\N	12.4000000000000004	54	18
1125	36	2016-02-28	NYR	26	NYR26	D 	1	0	1	2	3	1	0	0-0 	0	0	0	\N	\N	\N	\N	6.5	59	18
1134	36	2016-02-28	NYR	9	NYR9	F 	0	0	0	0	1	0	0	8-8 	8	8	0	\N	\N	\N	\N	0.5	64	18
1126	36	2016-02-28	NYR	14	NYR14	F 	0	1	1	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	65	18
1137	36	2016-02-28	NYR	19	NYR19	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	67	18
1131	36	2016-02-28	NYR	18	NYR18	F 	0	0	0	0	1	0	0	4-3 	4	3	0	\N	\N	\N	\N	0.599999999999999978	72	18
1138	36	2016-02-28	CON	16	CON16	F 	1	1	2	2	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	8.5	73	18
1143	36	2016-02-28	CON	9	CON9	D 	0	1	1	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	74	18
1149	36	2016-02-28	CON	6	CON6	D 	0	0	0	6	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	81	18
1144	36	2016-02-28	CON	27	CON27	F 	1	0	1	0	4	0	0	0-0 	0	0	0	1	\N	\N	\N	9	84	18
1132	36	2016-02-28	NYR	8	NYR8	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	85	18
1147	36	2016-02-28	CON	44	CON44	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	86	18
1152	36	2016-02-28	CON	17	CON17	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	89	18
1179	37	2016-03-04	BOS	2	BOS2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	1	19
1171	37	2016-03-04	BOS	16	BOS16	F 	1	1	2	2	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	8.59999999999999964	4	19
1167	37	2016-03-04	NYR	2	NYR2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	5	19
1163	37	2016-03-04	NYR	10	NYR10	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	8	19
1156	37	2016-03-04	NYR	28	NYR28	F 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	9	19
1181	37	2016-03-04	BOS	10	BOS10	D 	0	0	0	0	6	0	0	0-0 	0	0	0	\N	\N	\N	\N	3	10	19
1165	37	2016-03-04	NYR	17	NYR17	F 	0	0	0	0	2	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.900000000000000022	11	19
1169	37	2016-03-04	BOS	14	BOS14	F 	2	1	3	4	9	1	0	17-5 	17	5	1	\N	\N	\N	\N	22.1999999999999993	12	19
1158	37	2016-03-04	NYR	20	NYR20	F 	0	0	0	2	2	0	0	9-8 	9	8	0	\N	\N	\N	\N	1.60000000000000009	16	19
1154	37	2016-03-04	NYR	24	NYR24	F 	0	0	0	2	0	0	0	2-2 	2	2	0	\N	\N	\N	\N	0.5	18	19
1175	37	2016-03-04	BOS	23	BOS23	F 	0	0	0	0	4	0	0	1-0 	1	0	0	\N	\N	\N	\N	2.10000000000000009	23	19
1162	37	2016-03-04	NYR	4	NYR4	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	28	19
1178	37	2016-03-04	BOS	15	BOS15	F 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	29	19
1155	37	2016-03-04	NYR	21	NYR21	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	33	19
1170	37	2016-03-04	BOS	19	BOS19	D 	0	2	2	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	4.5	34	19
1174	37	2016-03-04	BOS	21	BOS21	F 	1	0	1	0	9	0	0	0-0 	0	0	0	\N	\N	\N	\N	8.5	39	19
1164	37	2016-03-04	NYR	12	NYR12	F 	0	0	0	0	0	0	0	3-1 	3	1	0	\N	\N	\N	\N	0.200000000000000011	41	19
1168	37	2016-03-04	BOS	3	BOS3	F 	1	3	4	0	3	1	0	4-11 	4	11	0	\N	\N	\N	\N	11.3000000000000007	45	19
1182	37	2016-03-04	BOS	11	BOS11	F 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	47	19
1177	37	2016-03-04	BOS	22	BOS22	D 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	48	19
1180	37	2016-03-04	BOS	5	BOS5	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	55	19
1153	37	2016-03-04	NYR	26	NYR26	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	59	19
1160	37	2016-03-04	NYR	9	NYR9	F 	0	0	0	0	4	0	0	8-6 	8	6	0	\N	\N	\N	\N	2.20000000000000018	64	19
1166	37	2016-03-04	NYR	14	NYR14	F 	0	0	0	2	3	0	0	1-2 	1	2	0	\N	\N	\N	\N	1.89999999999999991	65	19
1172	37	2016-03-04	BOS	12	BOS12	D 	0	2	2	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	5	68	19
1159	37	2016-03-04	NYR	18	NYR18	F 	0	0	0	0	3	0	0	2-5 	2	5	0	\N	\N	\N	\N	1.19999999999999996	72	19
1176	37	2016-03-04	BOS	91	BOS91	F 	0	0	0	0	4	0	0	3-4 	3	4	0	\N	\N	\N	\N	1.89999999999999991	79	19
1161	37	2016-03-04	NYR	8	NYR8	D 	0	0	0	2	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	85	19
1157	37	2016-03-04	NYR	91	NYR91	F 	0	0	0	0	0	0	0	0-3 	0	3	0	\N	\N	\N	\N	-0.299999999999999989	88	19
1173	37	2016-03-04	BOS	44	BOS44	F 	1	0	1	0	3	1	0	1-1 	1	1	0	\N	\N	\N	\N	6	90	19
1189	38	2016-03-04	BUF	15	BUF15	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	6	19
1212	38	2016-03-04	CON	4	CON4	D 	0	0	0	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	7	19
1207	38	2016-03-04	CON	19	CON19	F 	0	0	0	0	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	14	19
1192	38	2016-03-04	BUF	5	BUF5	F 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	24	19
1199	38	2016-03-04	CON	22	CON22	F 	0	1	1	2	1	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.10000000000000009	25	19
1184	38	2016-03-04	BUF	21	BUF21	F 	0	0	0	0	3	0	0	0-1 	0	1	0	\N	\N	\N	\N	1.39999999999999991	27	19
1194	38	2016-03-04	BUF	7	BUF7	D 	0	0	0	0	4	0	0	0-0 	0	0	0	\N	\N	\N	\N	2	30	19
1185	38	2016-03-04	BUF	20	BUF20	F 	0	0	0	0	7	0	0	1-0 	1	0	0	\N	\N	\N	\N	3.60000000000000009	32	19
1186	38	2016-03-04	BUF	24	BUF24	F 	0	0	0	2	4	0	0	3-4 	3	4	0	\N	\N	\N	\N	2.39999999999999991	35	19
1197	38	2016-03-04	BUF	12	BUF12	F 	0	0	0	2	2	0	0	3-7 	3	7	0	\N	\N	\N	\N	1.10000000000000009	36	19
1191	38	2016-03-04	BUF	6	BUF6	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	43	19
1201	38	2016-03-04	CON	56	CON56	F 	0	1	1	0	0	0	0	11-6 	11	6	0	\N	\N	\N	\N	2.5	44	19
1206	38	2016-03-04	CON	26	CON26	D 	0	0	0	0	3	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	46	19
1208	38	2016-03-04	CON	13	CON13	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	49	19
1204	38	2016-03-04	CON	5	CON5	F 	0	1	1	0	0	0	0	1-3 	1	3	0	\N	\N	\N	\N	1.80000000000000004	50	19
1202	38	2016-03-04	CON	61	CON61	F 	1	0	1	0	5	0	0	16-4 	16	4	1	\N	1	\N	\N	14.6999999999999993	53	19
1205	38	2016-03-04	CON	8	CON8	F 	1	0	1	0	2	0	1	12-10 	12	10	0	\N	\N	\N	\N	6.20000000000000018	54	19
1190	38	2016-03-04	BUF	14	BUF14	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	56	19
1188	38	2016-03-04	BUF	36	BUF36	F 	0	0	0	0	2	0	0	4-14 	4	14	0	\N	\N	\N	\N	0	60	19
1183	38	2016-03-04	BUF	23	BUF23	D 	0	0	0	4	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	1	63	19
1195	38	2016-03-04	BUF	9	BUF9	D 	0	0	0	0	8	0	0	0-2 	0	2	0	\N	\N	\N	\N	3.79999999999999982	70	19
1210	38	2016-03-04	CON	16	CON16	F 	0	0	0	0	1	0	0	0-1 	0	1	0	\N	\N	\N	\N	0.400000000000000022	73	19
1209	38	2016-03-04	CON	9	CON9	D 	0	0	0	2	2	0	0	0-0 	0	0	0	\N	\N	\N	\N	1.5	74	19
1193	38	2016-03-04	BUF	2	BUF2	D 	0	0	0	0	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	0	78	19
1198	38	2016-03-04	CON	28	CON28	F 	1	0	1	0	1	1	0	1-1 	1	1	0	\N	\N	1	\N	6	80	19
1203	38	2016-03-04	CON	6	CON6	D 	0	1	1	2	0	0	0	0-0 	0	0	0	\N	\N	\N	\N	2.5	81	19
1196	38	2016-03-04	BUF	13	BUF13	F 	0	0	0	0	1	0	0	17-15 	17	15	0	\N	\N	\N	\N	0.699999999999999956	82	19
1200	38	2016-03-04	CON	27	CON27	F 	0	1	1	0	2	0	0	0-2 	0	2	0	\N	\N	\N	\N	2.79999999999999982	84	19
1187	38	2016-03-04	BUF	43	BUF43	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	87	19
1211	38	2016-03-04	CON	17	CON17	F 	0	0	0	0	1	0	0	0-0 	0	0	0	\N	\N	\N	\N	0.5	89	19
\.


--
-- Name: skaters_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('skaters_stats_id_seq', 1, false);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY teams (id, team_name, max_players, current_players, gm_id) FROM stdin;
1	London Calling	8	6	1
2	The Highlanders	8	6	2
4	PowderPuck Girls	8	7	4
5	Brad's Team	8	7	5
9	No pucks given	8	2	9
8	Magpies	8	2	8
7	Herons	8	2	7
10	Hula Dancers	8	0	4
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('teams_id_seq', 10, true);


--
-- Name: gms_leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY gms_leagues
    ADD CONSTRAINT gms_leagues_pkey PRIMARY KEY (id);


--
-- Name: gms_leagues_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY leagues_teams
    ADD CONSTRAINT gms_leagues_teams_pkey PRIMARY KEY (id);


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
-- Name: players_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY players_teams
    ADD CONSTRAINT players_teams_pkey PRIMARY KEY (id);


--
-- Name: rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT rosters_pkey PRIMARY KEY (id);


--
-- Name: skaters_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY skaters_stats
    ADD CONSTRAINT skaters_stats_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


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

