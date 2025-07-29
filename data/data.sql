--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_group (
    id character varying(1) DEFAULT NULL::character varying,
    name character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_group OWNER TO postgres;

--
-- Name: _auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_group_permissions (
    id character varying(1) DEFAULT NULL::character varying,
    group_id character varying(1) DEFAULT NULL::character varying,
    permission_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_group_permissions OWNER TO postgres;

--
-- Name: _auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_permission (
    id smallint,
    content_type_id smallint,
    codename character varying(18) DEFAULT NULL::character varying,
    name character varying(23) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_permission OWNER TO postgres;

--
-- Name: _auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_user (
    id smallint,
    password character varying(88) DEFAULT NULL::character varying,
    last_login character varying(10) DEFAULT NULL::character varying,
    is_superuser smallint,
    username character varying(5) DEFAULT NULL::character varying,
    last_name character varying(3) DEFAULT NULL::character varying,
    email character varying(13) DEFAULT NULL::character varying,
    is_staff smallint,
    is_active smallint,
    date_joined character varying(10) DEFAULT NULL::character varying,
    first_name character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_user OWNER TO postgres;

--
-- Name: _auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_user_groups (
    id character varying(1) DEFAULT NULL::character varying,
    user_id character varying(1) DEFAULT NULL::character varying,
    group_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_user_groups OWNER TO postgres;

--
-- Name: _auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._auth_user_user_permissions (
    id character varying(1) DEFAULT NULL::character varying,
    user_id character varying(1) DEFAULT NULL::character varying,
    permission_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_user_user_permissions OWNER TO postgres;

--
-- Name: _django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_admin_log (
    id smallint,
    object_id smallint,
    object_repr character varying(131) DEFAULT NULL::character varying,
    action_flag smallint,
    change_message character varying(44) DEFAULT NULL::character varying,
    content_type_id smallint,
    user_id smallint,
    action_time character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._django_admin_log OWNER TO postgres;

--
-- Name: _django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_content_type (
    id smallint,
    app_label character varying(12) DEFAULT NULL::character varying,
    model character varying(11) DEFAULT NULL::character varying
);


ALTER TABLE public._django_content_type OWNER TO postgres;

--
-- Name: _django_flatpage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_flatpage (
    id smallint,
    url character varying(7) DEFAULT NULL::character varying,
    title character varying(5) DEFAULT NULL::character varying,
    content character varying(170) DEFAULT NULL::character varying,
    enable_comments smallint,
    template_name character varying(22) DEFAULT NULL::character varying,
    registration_required smallint
);


ALTER TABLE public._django_flatpage OWNER TO postgres;

--
-- Name: _django_flatpage_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_flatpage_sites (
    id smallint,
    flatpage_id smallint,
    site_id smallint
);


ALTER TABLE public._django_flatpage_sites OWNER TO postgres;

--
-- Name: _django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_migrations (
    id smallint,
    app character varying(12) DEFAULT NULL::character varying,
    name character varying(40) DEFAULT NULL::character varying,
    applied character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._django_migrations OWNER TO postgres;

--
-- Name: _django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_session (
    session_key character varying(32) DEFAULT NULL::character varying,
    session_data character varying(227) DEFAULT NULL::character varying,
    expire_date character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._django_session OWNER TO postgres;

--
-- Name: _django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._django_site (
    id smallint,
    name character varying(11) DEFAULT NULL::character varying,
    domain character varying(11) DEFAULT NULL::character varying
);


ALTER TABLE public._django_site OWNER TO postgres;

--
-- Name: _simpleapp_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._simpleapp_category (
    id smallint,
    name character varying(26) DEFAULT NULL::character varying
);


ALTER TABLE public._simpleapp_category OWNER TO postgres;

--
-- Name: _simpleapp_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._simpleapp_product (
    id smallint,
    name character varying(29) DEFAULT NULL::character varying,
    description character varying(372) DEFAULT NULL::character varying,
    quantity smallint,
    price numeric(5,2) DEFAULT NULL::numeric,
    category_id smallint
);


ALTER TABLE public._simpleapp_product OWNER TO postgres;

--
-- Name: _sqlite_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._sqlite_sequence (
    name character varying(21) DEFAULT NULL::character varying,
    seq smallint
);


ALTER TABLE public._sqlite_sequence OWNER TO postgres;

--
-- Data for Name: _auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: _auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: _auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_permission (id, content_type_id, codename, name) FROM stdin;
1	1	add_logentry	Can add log entry
2	1	change_logentry	Can change log entry
3	1	delete_logentry	Can delete log entry
4	1	view_logentry	Can view log entry
5	2	add_permission	Can add permission
6	2	change_permission	Can change permission
7	2	delete_permission	Can delete permission
8	2	view_permission	Can view permission
9	3	add_group	Can add group
10	3	change_group	Can change group
11	3	delete_group	Can delete group
12	3	view_group	Can view group
13	4	add_user	Can add user
14	4	change_user	Can change user
15	4	delete_user	Can delete user
16	4	view_user	Can view user
17	5	add_contenttype	Can add content type
18	5	change_contenttype	Can change content type
19	5	delete_contenttype	Can delete content type
20	5	view_contenttype	Can view content type
21	6	add_session	Can add session
22	6	change_session	Can change session
23	6	delete_session	Can delete session
24	6	view_session	Can view session
25	7	add_site	Can add site
26	7	change_site	Can change site
27	7	delete_site	Can delete site
28	7	view_site	Can view site
29	8	add_flatpage	Can add flat page
30	8	change_flatpage	Can change flat page
31	8	delete_flatpage	Can delete flat page
32	8	view_flatpage	Can view flat page
33	9	add_product	Can add product
34	9	change_product	Can change product
35	9	delete_product	Can delete product
36	9	view_product	Can view product
37	10	add_category	Can add category
38	10	change_category	Can change category
39	10	delete_category	Can delete category
40	10	view_category	Can view category
\.


--
-- Data for Name: _auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) FROM stdin;
1	pbkdf2_sha256$390000$pIRJikUM2W30KPaglrnTWq$SlYVhOzWC78x7D+eRB+1ml0L7sC1FprwAq22woNjv6o=	2024-12-12	1	kav	'' ''	1	1	2024-11-21 kav
2	pbkdf2_sha256$390000$akHTwwOhU1Hj1jxBNU0Wvx$+Zlo8XZ+0TEfBUfzXeBwEZqhFoK7nqKFtWzbFpu+e8M=	2025-02-05	1	bulba	'' ''	1	1	2025-02-02 bulba
3	pbkdf2_sha256$390000$QBymNDR7ceF7HkhWBFOjb9$IuEST5vHlQUmBzPnqagfETDHXsus7w5zngrwgtQBWXU=	2025-02-05	1 test	p	p@gmail.com	0	1	2025-02-05	test
4	pbkdf2_sha256$390000$lxAwwMO0H0wjT9fFV0Wb6Z$nUl5uW6Q7igY7LoLA9243kn14uSHjVTO/rO6EO0G2n8=	2025-02-05	0	Bob	Bob	bob@gmail.com	0	1	2025-02-05	Bob
\.


--
-- Data for Name: _auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: _auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: _django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) FROM stdin;
1	1	/about/ -- About	1	[{"added": {}}]	8	1	2024-11-21
2	1	/about/ -- About	2	[{"changed": {"fields": ["Template name"]}}]	8	1	2024-11-21
3	1	/about/ -- About	2	[{"changed": {"fields": ["Content"]}}]	8	1	2024-11-21
4	1	/about/ -- About	2	[{"changed": {"fields": ["Content"]}}]	8	1	2024-11-21
5	1	/about/ -- About	2	[{"changed": {"fields": ["Content"]}}]	8	1	2024-11-22
6	1	/about/ -- About	2	[{"changed": {"fields": ["Content"]}}]	8	1	2024-11-22
7	1	Cырок Творожный: Творожный глазирован	1	[{"added": {}}]	9	1	2024-11-23
8	2	/products/ -- Products	1	[{"added": {}}]	8	1	2024-11-23
9	2	/products/ -- Products	2	[]	8	1	2024-11-23
10	2	/products/ -- Products	3		8	1	2024-11-23
11	1	Cырок Творожный: Творожный глазированный сырок в молочном шоколаде с ванилью изготавливается из натуральных компонент	2	[]	9	1	2024-11-24
12	2	Фрукты	1	[{"added": {}}]	10	1	2024-11-24
13	2	Авокадо: Авокадо уже стал символом здорового образа жизни. За высокое содержание полезных жирных кислот и вит	1	[{"added": {}}]	9	1	2024-11-24
14	3	Масло	1	[{"added": {}}]	10	1	2024-11-24
15	3	Масло Сливочное Эконива 82.5%: Сливочное масло «ЭкоНива» 82,5% получают из натуральных высокожирных сливок методом сбивания или пре	1	[{"added": {}}]	9	1	2024-11-24
16	4	Киви: В зависимости от сезона страна поставки может быть одной из: Иран, Чили	1	[{"added": {}}]	9	1	2024-12-12
17	4	Шоколад, Конфеты, Сладости	1	[{"added": {}}]	10	1	2024-12-24
18	1	Творог, Творожки, Сырки	2	[{"changed": {"fields": ["Name"]}}]	10	1	2024-12-24
\.


--
-- Data for Name: _django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
3	auth	group
2	auth	permission
4	auth	user
5	contenttypes	contenttype
8	flatpages	flatpage
6	sessions	session
10	simpleapp	category
9	simpleapp	product
7	sites	site
\.


--
-- Data for Name: _django_flatpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/about/	About	<h3>Пожалуйста Артем возьми и позанимайся 15 минуток и так каждый</h3>\r\n<h1>У меня для тебя плохие новости, закончилось это время. По 4 часа каждый день, только так!</h1>	0	flatpages/default.html	0
\.


--
-- Data for Name: _django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: _django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-11-20
2	auth	0001_initial	2024-11-20
3	admin	0001_initial	2024-11-20
4	admin	0002_logentry_remove_auto_add	2024-11-20
5	admin	0003_logentry_add_action_flag_choices	2024-11-20
6	contenttypes	0002_remove_content_type_name	2024-11-20
7	auth	0002_alter_permission_name_max_length	2024-11-20
8	auth	0003_alter_user_email_max_length	2024-11-20
9	auth	0004_alter_user_username_opts	2024-11-20
10	auth	0005_alter_user_last_login_null	2024-11-20
11	auth	0006_require_contenttypes_0002	2024-11-20
12	auth	0007_alter_validators_add_error_messages	2024-11-20
13	auth	0008_alter_user_username_max_length	2024-11-20
14	auth	0009_alter_user_last_name_max_length	2024-11-20
15	auth	0010_alter_group_name_max_length	2024-11-20
16	auth	0011_update_proxy_permissions	2024-11-20
17	auth	0012_alter_user_first_name_max_length	2024-11-20
18	sessions	0001_initial	2024-11-20
19	sites	0001_initial	2024-11-21
20	flatpages	0001_initial	2024-11-21
21	sites	0002_alter_domain_unique	2024-11-21
22	simpleapp	0001_initial	2024-11-21
\.


--
-- Data for Name: _django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_session (session_key, session_data, expire_date) FROM stdin;
37yvrl3t1qdce17khp7au8qvf7rqmxex	.eJxVjEEOwiAQRe_C2hCgA0WX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7d2QyYXlc-GLEDWKnMCTISEoCznYQDSbFgbJDB5PDuIHpK1pCP60Yv3BwOJOIM:1tE3wA:A4Wg8KEdbu95cMYuSBlhRadF9l_uYXcjBqWuTpbz6TM	2024-12-05
qk3cjkizaqpif2hplpkefogvecnm8pw6	.eJxVjMsOwiAUBf-FtSG0V6C4dN9vaO4DpGogKe3K-O_apAvdnpk5LzXhtuZpa3GZZlEX1anT70bIj1h2IHcst6q5lnWZSe-KPmjTY5X4vB7u30HGlr91IEkhBbAWwZ2JB4O9gegTR-cHQOwZjSdDAYlEfEfMiSIxOA-erHp_AAhmOUY:1tEwoy:-ZWaOaU9gcE3jw1kn-5wQ-ZByjI1yCudxUNKIkts97Q	2024-12-07
ao2jshh2spx65kt29ahrc0bquv7y7aik	.eJxVjE0OwiAYBe_C2hBpC4hL9z0D-f6QqoGktCvj3W2TLnT7Zt68VYR1yXFtMseJ1VUZdfrdEOgpZQf8gHKvmmpZ5gn1ruiDNj1WltftcP8CGVre3pTkEgZxIITOBYDkmRC97QeynvozdtBbMmzTFh2C9exDZzqHLgTDoj5fG604zw:1tItfp:UpCy0MB39DTIV0ORMu-hlbelyiHw4dhZj4CEDCY35n8	2024-12-18
ezp66xzf4rcufvicfqml96jigetvymak	.eJxVjE0OwiAYBe_C2hBpC4hL9z0D-f6QqoGktCvj3W2TLnT7Zt68VYR1yXFtMseJ1VUZdfrdEOgpZQf8gHKvmmpZ5gn1ruiDNj1WltftcP8CGVre3pTkEgZxIITOBYDkmRC97QeynvozdtBbMmzTFh2C9exDZzqHLgTDoj5fG604zw:1tLoyr:wQvIGF29g-T1Cco_QiMg3JHSVgv5LjwDwN5vflvq0tQ	2024-12-26
8ni4k9q80mfo49du1rj2iqrqbrqctcxg	.eJxVjEsOwjAMBe-SNYrcD3bKkn3PUDm2SwsokZp2hbg7VOoCtm9m3ssNvK3TsBVbhlndxdXu9LtFloelHeid0y17yWld5uh3xR-0-D6rPa-H-3cwcZm-dWi7ltEUBCoMDSCPsa2VqhAbGc9giNwRsxEHQEQJAkAqSjaSRnbvD91mOGM:1tfkFP:ZBafJnyjdZNaSjr9vplck1ckYmEzQTxa-6Zqb-ijlRU	2025-02-19
\.


--
-- Data for Name: _django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._django_site (id, name, domain) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: _simpleapp_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._simpleapp_category (id, name) FROM stdin;
3	Масло
1	Творог, творожки, сырки
2	Фрукты
4	Шоколад, конфеты, сладости
\.


--
-- Data for Name: _simpleapp_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._simpleapp_product (id, name, description, quantity, price, category_id) FROM stdin;
1	Cырок творожный	Творожный глазированный сырок в молочном шоколаде с ванилью изготавливается из натуральных компонентов высокого качества. Кондитерскую глазурь в глазированном сырке заменяет настоящий молочный шоколад. Аромат ванили создан не с помощью ароматизаторов, а благодаря добавлению натуральной специи. Продукт имеет полноценный и изысканный вкус настоящего качественного десерта.	11	59.99	1
2	Авокадо	Авокадо уже стал символом здорового образа жизни. За высокое содержание полезных жирных кислот и витаминов его обожают и веганы, и поклонники кето-диеты	119	519.99	2
3	Масло сливочное ЭкоНива 82.5%	Сливочное масло «ЭкоНива» 82,5% получают из натуральных высокожирных сливок методом сбивания или преобразования. Оно обладает ярко выраженным сливочным вкусом и придает изысканную нежность любимым блюдам, будь то каши и картофельное пюре или торты и печенья.	93	269.99	3
4	Киви	В зависимости от сезона страна поставки может быть одной из: Иран, Чили	145	229.99	2
5	Манго	Очень вкусный фрукт	100	790.00	2
6	Апельсины	Свежие, сочные	3	250.00	2
7	OREO	описание печенью орео Печенье Oreo - это знаменитое шоколадное печенье с кремовой начинкой, которое давно завоевало сердца сладкоежек по всему миру.	560	79.00	4
8	Юбилейное	Печенье "Юбилейное" - это одно из самых известных и популярных печений на российском рынке. Выпускается с 1913 года и с тех пор стало символом вкуса и качества.	400	59.00	4
9	Творог Б.Ю, Александров	Рады представить Вам творог «Б.Ю. Александров» c массовой долей жира 5 %. Он несомненно придется по вкусу всем ценителям натурального, полезного и вкусного творога. Мы производим его по особой технологии из отборного молока с собственной фермы. Именно поэтому у него такой нежный вкус	450	99.00	1
10	Коровка	Конфетки Коровка - вкус из детства	5900	58.00	4
11	Виноград	Текст по виноград без косточек	345	349.00	2
\.


--
-- Data for Name: _sqlite_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._sqlite_sequence (name, seq) FROM stdin;
django_migrations	22
django_admin_log	18
django_content_type	10
auth_permission	40
auth_group	0
auth_user	4
django_site	1
django_flatpage	2
django_flatpage_sites	2
simpleapp_category	4
simpleapp_product	11
\.


--
-- PostgreSQL database dump complete
--
