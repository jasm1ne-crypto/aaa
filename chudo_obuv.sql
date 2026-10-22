--
-- PostgreSQL database dump
--

\restrict JlMi82UiLJwffwcPk5XMe54AYeEKbrMzJeKLdZpBU65thXvyKl53wmvxVHIhxb0

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-22 08:42:35

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
-- TOC entry 224 (class 1259 OID 25097)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categorie_id integer NOT NULL,
    categorie_name character varying(200)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25096)
-- Name: categories_categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_categorie_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_categorie_id_seq OWNED BY public.categories.categorie_id;


--
-- TOC entry 232 (class 1259 OID 25193)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orders_id integer NOT NULL,
    number_orders character varying(50),
    data_orders date,
    user_id integer NOT NULL,
    categorie_id integer NOT NULL,
    orders_name character varying(255),
    proizvoditel character varying(200),
    size_id integer NOT NULL,
    kolvo character varying(200),
    price_unit character varying(50)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25192)
-- Name: orders_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orders_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 231
-- Name: orders_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orders_id_seq OWNED BY public.orders.orders_id;


--
-- TOC entry 230 (class 1259 OID 25167)
-- Name: pozitcia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pozitcia (
    pozitcia_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    size_id integer NOT NULL,
    kolvo character varying(200)
);


ALTER TABLE public.pozitcia OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25166)
-- Name: pozitcia_pozitcia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pozitcia_pozitcia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pozitcia_pozitcia_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 229
-- Name: pozitcia_pozitcia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pozitcia_pozitcia_id_seq OWNED BY public.pozitcia.pozitcia_id;


--
-- TOC entry 226 (class 1259 OID 25105)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(200),
    proizvoditel character varying(200),
    categorie_id integer NOT NULL,
    subcategories character varying(200),
    image character varying(200),
    sostav character varying(200),
    opisanie character varying(200),
    price numeric NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25104)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 220 (class 1259 OID 25073)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(200)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25072)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_role_id_seq OWNER TO postgres;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- TOC entry 228 (class 1259 OID 25122)
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    size_id integer NOT NULL,
    size_name character varying(30)
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25121)
-- Name: sizes_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sizes_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sizes_size_id_seq OWNER TO postgres;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 227
-- Name: sizes_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sizes_size_id_seq OWNED BY public.sizes.size_id;


--
-- TOC entry 234 (class 1259 OID 25221)
-- Name: stock_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_items (
    stock_items_id integer NOT NULL,
    stock_items_name character varying(200),
    proizvoditel character varying(200),
    size_id integer NOT NULL,
    kolvo_orders character varying(200)
);


ALTER TABLE public.stock_items OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25220)
-- Name: stock_items_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_items_stock_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_items_stock_items_id_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 233
-- Name: stock_items_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_items_stock_items_id_seq OWNED BY public.stock_items.stock_items_id;


--
-- TOC entry 222 (class 1259 OID 25081)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    last_name character varying(200),
    first_name character varying(200),
    middle_name character varying(200),
    login character varying(200),
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25080)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4792 (class 2604 OID 25100)
-- Name: categories categorie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN categorie_id SET DEFAULT nextval('public.categories_categorie_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 25196)
-- Name: orders orders_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orders_id SET DEFAULT nextval('public.orders_orders_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 25170)
-- Name: pozitcia pozitcia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pozitcia ALTER COLUMN pozitcia_id SET DEFAULT nextval('public.pozitcia_pozitcia_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 25108)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 25076)
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 25125)
-- Name: sizes size_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes ALTER COLUMN size_id SET DEFAULT nextval('public.sizes_size_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 25224)
-- Name: stock_items stock_items_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_items ALTER COLUMN stock_items_id SET DEFAULT nextval('public.stock_items_stock_items_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 25084)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4974 (class 0 OID 25097)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, 'Детская обувь');
INSERT INTO public.categories VALUES (2, 'Женская обувь');
INSERT INTO public.categories VALUES (3, 'Мужская обувь');


--
-- TOC entry 4982 (class 0 OID 25193)
-- Dependencies: 232
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, '1', '2026-04-02', 3, 1, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 3, '1', '490');
INSERT INTO public.orders VALUES (2, '1', '2026-04-02', 3, 1, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 5, '1', '2790');
INSERT INTO public.orders VALUES (3, '2', '2026-04-05', 17, 2, 'Сапоги зимние натуральная кожа', 'Барбари', 19, '1', '25000');
INSERT INTO public.orders VALUES (4, '2', '2026-04-05', 17, 2, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 23, '1', '7500');
INSERT INTO public.orders VALUES (5, '3', '2026-04-08', 7, 2, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 4, '1', '17000');
INSERT INTO public.orders VALUES (6, '3', '2026-04-08', 7, 2, 'Кроссовки летние кожаные', 'Топ-Топ', 4, '1', '8565');
INSERT INTO public.orders VALUES (7, '3', '2026-04-08', 7, 2, 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', 1, '1', '7795');
INSERT INTO public.orders VALUES (8, '4', '2026-04-12', 15, 2, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 23, '1', '7757');
INSERT INTO public.orders VALUES (9, '4', '2026-04-12', 15, 2, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 23, '1', '12327');
INSERT INTO public.orders VALUES (10, '4', '2026-04-12', 15, 2, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 25, '1', '7130');
INSERT INTO public.orders VALUES (11, '4', '2026-04-12', 15, 2, 'Кроссовки кожаные', 'Стиль и комфорт', 19, '1', '8765');
INSERT INTO public.orders VALUES (12, '4', '2026-04-12', 15, 2, 'Сапоги осенние натуральная кожа', 'Барбари', 25, '1', '15000');
INSERT INTO public.orders VALUES (13, '5', '2026-04-01', 12, 3, 'Кроссовки', 'Топ-Топ', 29, '1', '9567');
INSERT INTO public.orders VALUES (14, '5', '2026-04-01', 12, 3, 'Ботинки мужские демисезонные', 'Барбари', 29, '1', '4500');
INSERT INTO public.orders VALUES (15, '5', '2026-04-01', 12, 3, 'Кроссовки «Азимут Бег»', 'Азимут', 25, '1', '7890');
INSERT INTO public.orders VALUES (16, '6', '2026-04-05', 9, 3, 'Черные туфли в классическом стиле', 'Барбари', 27, '1', '24569');
INSERT INTO public.orders VALUES (17, '6', '2026-04-05', 9, 3, 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', 31, '1', '14567');
INSERT INTO public.orders VALUES (18, '6', '2026-04-05', 9, 3, 'Ботинки зимние классические', 'Барбари', 29, '1', '15670');
INSERT INTO public.orders VALUES (19, '7', '2026-04-25', 14, 1, 'Сапожки детские «Принцесса» кожаные', 'Весна', 1, '1', '3190');
INSERT INTO public.orders VALUES (20, '7', '2026-04-25', 14, 1, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 4, '2', '490');
INSERT INTO public.orders VALUES (21, '7', '2026-04-25', 14, 1, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 11, '1', '1690');
INSERT INTO public.orders VALUES (22, '8', '2026-04-11', 3, 3, 'Туфли из натуральной кожи', 'Берестов', 34, '1', '25625');
INSERT INTO public.orders VALUES (23, '8', '2026-04-11', 3, 3, 'Кроссовки «Азимут Бег»', 'Азимут', 27, '3', '7890');
INSERT INTO public.orders VALUES (24, '8', '2026-04-11', 3, 3, 'Кроссовки для бега «Драйв»', 'Азимут', 16, '2', '6550');
INSERT INTO public.orders VALUES (25, '9', '2026-05-05', 5, 1, 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', 16, '1', '2490');
INSERT INTO public.orders VALUES (26, '9', '2026-05-05', 5, 1, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 5, '2', '3190');
INSERT INTO public.orders VALUES (27, '10', '2026-05-08', 17, 2, 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', 1, '1', '7550');
INSERT INTO public.orders VALUES (28, '10', '2026-05-08', 17, 2, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 4, '1', '7130');
INSERT INTO public.orders VALUES (29, '10', '2026-05-08', 17, 2, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 19, '1', '12327');
INSERT INTO public.orders VALUES (30, '10', '2026-05-08', 17, 2, 'Кроссовки кожаные', 'Стиль и комфорт', 1, '2', '8765');


--
-- TOC entry 4980 (class 0 OID 25167)
-- Dependencies: 230
-- Data for Name: pozitcia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4976 (class 0 OID 25105)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 1, 'Кроссовки', 'IMG_KS_195217.png', 'Верх — экокожа (полиуретан на хлопковой основе), подкладка — хлопок 100%, подошва — ПВХ', 'Кроссовки детские «Звёздочка» экокожа. Производитель: ООО «Малыш-Спорт», г. Смоленск', 2190);
INSERT INTO public.products VALUES (2, 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', 1, 'Кроссовки', 'IMG_KS_195213.png', 'Верх — экокожа (микрофибра), подкладка — текстиль сетчатый (полиэстер), подошва — термопластичная резина (ТЭП)', 'Кроссовки детские «Гонщик» экокожа. Производитель: Фабрика «Топ-Топ», г. Киров', 2490);
INSERT INTO public.products VALUES (3, 'Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', 1, 'Кроссовки', 'IMG_KS_195222.png', 'Верх — экокожа перфорированная, вставки — нейлон, стелька — ортопедическая с латексной подушкой, подошва — ЭВА', 'Кроссовки детские «Радуга» экокожа перфорированная. Производитель: ИП Смирнова Л.В. (бренд «Лапушка»), г. Вологда', 1990);
INSERT INTO public.products VALUES (4, 'Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', 1, 'Сапоги', 'IMG_KB_185501.png', 'Верх — экокожа морозостойкая, утеплитель — искусственный мех (акрил 70%, полиэстер 30%), подкладка — флис, подошва — термоэластопласт (ТЭП)', 'Сапожки детские «Снежинка» зимние на меху. Производитель: ООО «Тёплые ножки», г. Новосибирск', 3490);
INSERT INTO public.products VALUES (5, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 1, 'Сапоги', 'IMG_KB_164816.png', 'Верх — плащёвая ткань с водоотталкивающей пропиткой (полиэстер 100%), отделка — экокожа, подкладка — микрофибра, мембрана — AirTex, подошва — резина', 'Сапожки детские «Медвежонок» демисезонные непромокаемые. Производитель: Компания «Северята», г. Архангельск', 3190);
INSERT INTO public.products VALUES (6, 'Сапожки детские «Принцесса» кожаные', 'Весна', 1, 'Сапоги', 'IMG_KB_164811.png', 'Верх — натуральная кожа (КРС), подкладка — шерсть натуральная (70%), байка (30%), стелька — войлочная, подошва — полиуретан', 'Сапожки детские «Принцесса» кожаные. Производитель: Мастерская «Весна», г. Тула', 4290);
INSERT INTO public.products VALUES (7, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 1, 'Босоножки', 'IMG_KSd_195207.png', 'Верх — нубук натуральный, подкладка — кожа растительного дубления, стелька — анатомическая с супинатором (латекс + пробка), подошва — каучук', 'Сандалии детские «Пчёлка» ортопедические летние. Производитель: ООО «Здоровый шаг», г. Воронеж', 2790);
INSERT INTO public.products VALUES (8, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 1, 'Босоножки', 'IMG_KSd_185508.png', 'Верх — джинсовая ткань (хлопок 100%), окантовка — искусственная кожа, подкладка — хлопок, подошва — ЭВА лёгкая', 'Сандалии детские «Морячок» текстильные с фиксатором. Производитель: ИП Кузнецов А.Д. (бренд «Карапуз»), г. Краснодар', 1690);
INSERT INTO public.products VALUES (9, 'Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', 1, 'Туфли', 'IMG_KSho_185512.png', 'Верх — искусственная лаковая кожа (ПВХ), носок усиленный — термопластичный полиуретан, подкладка — кожа искусственная дышащая, стелька — анатомическая с амортизацией, подошва — полиуретан', 'Туфли детские «Бантик» лаковые праздничные. Производитель: Дом обуви «Маленький франт», г. Москва', 2390);
INSERT INTO public.products VALUES (10, 'Сапоги зимние натуральная кожа', 'Барбари', 2, 'Сапоги', 'IMG_WB_170905.png', 'Верх — натуральная кожа, подкладка — евромех, натуральный мех, текстильный утеплитель, подошва — резина', 'Сапоги женские зимние, нескользящая, устойчивая подошва, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', 25000);
INSERT INTO public.products VALUES (11, 'Сапоги осенние натуральная кожа', 'Барбари', 2, 'Сапоги', 'IMG_WB_170859.png', 'Верх — натуральная кожа, подкладка — текстильный утеплитель, стелька — текстиль, подошва — ТПР', 'Сапоги женские демисезонные из высококачественной натуральной кожи. Производитель: Дом обуви «Барбари», г. Новороссийск ', 15000);
INSERT INTO public.products VALUES (12, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 2, 'Сапоги', 'IMG_WB_170906.png', 'Верх — натуральная замша, утепленные, тракторная подошва, стелька — байка, подошва — резина', 'Сапоги женские демисезонные замшевые. Производитель: ОАО «Твой комфорт», г. Ярославль', 17000);
INSERT INTO public.products VALUES (13, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 2, 'Босоножки', 'IMG_WSd_174332.png', 'Верх — 100% козья кожа, подкладка — 100% кожа; подошва: 100% кожа', 'Коричневая кожаная модель с открытым носком, боковой пряжкой и закрытым каблуком. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 7500);
INSERT INTO public.products VALUES (14, 'Женские босоножки «Черный кофе» со скульптурным каблуком', 'Кожевенные традиции', 2, 'Босоножки', 'IMG_WSd_185156.png', 'Верх — кожа собственного производств, подкладка — кожа; подошва: резина', 'Открытый носок и ремешок со сборной пряжкой, низкий каблук и резиновая подошва гарантируют комфорт. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 5600);
INSERT INTO public.products VALUES (15, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 2, 'Босоножки', 'IMG_WSd_185551.png', 'Верх — натуральная кожа, подкладка — натуральная кожа, подошва — кожа', 'Босоножки женские кожаные белые, регулируемый ремешок, закрытый каблук и кожаная подошва. Производитель: ООО «Модный силуэт», г. Кострома', 7130);
INSERT INTO public.products VALUES (16, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 2, 'Туфли', 'IMG_WSho_174409.png', 'Верх — натуральная овечья кожа, подкладка и стелька — натуральная овечья кожа, подошва — резина', 'Комфортные лаконичные лодочки, классический дизайна с современными акцентами. Производитель: ООО «Модный силуэт», г. Кострома', 12340);
INSERT INTO public.products VALUES (17, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 2, 'Туфли', 'IMG_WSho_185202.png', 'Верх — натуральная телячьей кожа, металлическая пряжка, подкладка и стелька— натуральная овечья кожа, подошва — резина', 'Стильные туфли для весеннего и летнего сезона. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 7757);
INSERT INTO public.products VALUES (18, 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', 2, 'Туфли', 'IMG_WSho_185545.png', 'Верх — натуральная кожа, подкладка и стелька — натуральная кожа, подошва — тунит', 'Модель из натуральной кожи, классический острый носок и изящная шпилька. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 7550);
INSERT INTO public.products VALUES (19, 'Кроссовки белые с оранжевым и красным', 'Топ-Топ', 2, 'Кроссовки', 'IMG_WS_174110.png', 'Верх — 70% кожа, 30% текстиль, подкладка — текстиль, подошва — резина', 'Многослойный верх из кожи и текстиля. Производитель: Фабрика «Топ-Топ», г. Киров', 9450);
INSERT INTO public.products VALUES (20, 'Кроссовки летние кожаные', 'Топ-Топ', 2, 'Кроссовки', 'IMG_WS_185528.png', 'Верх — 87% кожа, 11% текстиль, 2% синтетика; подкладка: 100% текстиль; подошва: резина, пластик', 'Уверенность на каждом шагу. Материал обеспечивает долговечность и комфорт при носке. Производитель: Фабрика «Топ-Топ», г. Киров', 8565);
INSERT INTO public.products VALUES (21, 'Кроссовки кожаные', 'Стиль и комфорт', 2, 'Кроссовки', 'IMG_WS_185535.png', 'Верх — натуральная кожа, подкладка — кожа, подошва — полиуретан', 'Кроссовки женские из натуральной кожи. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 8765);
INSERT INTO public.products VALUES (22, 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', 2, 'Кроссовки', 'IMG_WS_185538.png', 'Верх — 70% кожа, 20% полиамид, 10% полиуретан; подкладка — текстиль, подошва — ТПУ', 'Кроссовки женские из натуральной кожи и синтетических материалов, сетчатые вставки. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', 7795);
INSERT INTO public.products VALUES (23, 'Кроссовки для бега «Драйв»', 'Азимут', 3, 'Кроссовки', 'IMG_MS_185531.png', 'Верх —  сетка, подкладка — текстиль, подошва —  резина', 'Сочетание стиля, комфорта и современных технологий. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 6550);
INSERT INTO public.products VALUES (24, 'Кроссовки «Азимут Бег» ', 'Азимут', 3, 'Кроссовки', 'IMG_MS_185532.png', 'Верх — 6% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 'Универсальный выбор для повседневного использования. Производитель: Фабрика «Азимут», г. Санкт-Петербург', 7890);
INSERT INTO public.products VALUES (25, 'Кроссовки', 'Топ-Топ', 3, 'Кроссовки', 'IMG_MS_185533.png', 'Верх — 56% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', 'Кроссовки для мужчин, идеальное сочетание стиля и комфорта. Производитель: Фабрика «Топ-Топ», г. Киров', 9567);
INSERT INTO public.products VALUES (26, 'Черные туфли в классическом стиле — база для деловых образов', 'Барбари', 3, 'Туфли', 'IMG_MSho_190514.png', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — резина', 'Модель выполнена из натуральной кожи, на резиновой подошве. Производитель: Дом обуви «Барбари», г. Новороссийск ', 24569);
INSERT INTO public.products VALUES (27, 'Туфли мужские светлые классика демисезонные', 'Берестов', 3, 'Туфли', 'IMG_MSho_190518.png', 'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — ТЭП', 'Туфли на низком каблуке кожаные', 10155);
INSERT INTO public.products VALUES (28, 'Туфли из натуральной кожи', 'Берестов', 3, 'Туфли', 'IMG_MSho_191612.png', 'Верх — натуральная кожа, подкладка — натуральная кожа, стелька — натуральная кожа, подошва — резина', 'Модель выполнена из натуральной кожи, на резиновой подошве, поддеживает классический и деловой стиль образов. Производитель: Дом обуви «Берестов», г. Москва', 25625);
INSERT INTO public.products VALUES (29, 'Ботинки мужские демисезонные', 'Барбари', 3, 'Ботинки', 'IMG_MB_174349.png', 'Верх — натуральная кожа, подкладка — текстиль, подошва — искусственный материал', 'Ботинки из натуральной кожи темно-коричневого и черного цвета на шнурках. Производитель: Дом обуви «Берестов», г. Москва', 21500);
INSERT INTO public.products VALUES (30, 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', 3, 'Ботинки', 'IMG_MB_191200.png', 'Верх — натуральная кожа, подкладка — ворсин, стелька — ворсин, подошва — тунит', 'Ботинки представляют баланс традиций и современности. Выполнены из натуральной кожи насыщенного черного цвета. Производитель: ЗАО «Кожевенные традиции», г. Вятка', 14567);
INSERT INTO public.products VALUES (31, 'Ботинки зимние классические', 'Барбари', 3, 'Ботинки', 'IMG_MB_191205.png', 'Верх — натуральная кожа, подкладка — натуральный мех, стелька — натуральный мех, подошва — ТЭП', 'Выбор на каждый день — натуральная кожа, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', 15670);


--
-- TOC entry 4970 (class 0 OID 25073)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'Администратор');
INSERT INTO public.roles VALUES (2, 'Менеджер');
INSERT INTO public.roles VALUES (3, 'Авторизованный пользователь');


--
-- TOC entry 4978 (class 0 OID 25122)
-- Dependencies: 228
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sizes VALUES (1, '18');
INSERT INTO public.sizes VALUES (2, '19');
INSERT INTO public.sizes VALUES (3, '20');
INSERT INTO public.sizes VALUES (4, '21');
INSERT INTO public.sizes VALUES (5, '22');
INSERT INTO public.sizes VALUES (6, '23');
INSERT INTO public.sizes VALUES (7, '24');
INSERT INTO public.sizes VALUES (8, '25');
INSERT INTO public.sizes VALUES (9, '26');
INSERT INTO public.sizes VALUES (10, '27');
INSERT INTO public.sizes VALUES (11, '28');
INSERT INTO public.sizes VALUES (12, '29');
INSERT INTO public.sizes VALUES (13, '30');
INSERT INTO public.sizes VALUES (14, '31');
INSERT INTO public.sizes VALUES (15, '32');
INSERT INTO public.sizes VALUES (16, '33');
INSERT INTO public.sizes VALUES (17, '34');
INSERT INTO public.sizes VALUES (18, '35');
INSERT INTO public.sizes VALUES (19, '36');
INSERT INTO public.sizes VALUES (20, '36.5');
INSERT INTO public.sizes VALUES (21, '37');
INSERT INTO public.sizes VALUES (22, '37.5');
INSERT INTO public.sizes VALUES (23, '38');
INSERT INTO public.sizes VALUES (24, '38.5');
INSERT INTO public.sizes VALUES (25, '39');
INSERT INTO public.sizes VALUES (26, '39.5');
INSERT INTO public.sizes VALUES (27, '40');
INSERT INTO public.sizes VALUES (28, '40.5');
INSERT INTO public.sizes VALUES (29, '41');
INSERT INTO public.sizes VALUES (30, '41.5');
INSERT INTO public.sizes VALUES (31, '42');
INSERT INTO public.sizes VALUES (32, '42.5');
INSERT INTO public.sizes VALUES (33, '43');
INSERT INTO public.sizes VALUES (34, '44');
INSERT INTO public.sizes VALUES (35, '45');


--
-- TOC entry 4984 (class 0 OID 25221)
-- Dependencies: 234
-- Data for Name: stock_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock_items VALUES (1, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 3, '3');
INSERT INTO public.stock_items VALUES (2, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 4, '3');
INSERT INTO public.stock_items VALUES (3, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 5, '3');
INSERT INTO public.stock_items VALUES (4, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 6, '3');
INSERT INTO public.stock_items VALUES (5, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 7, '3');
INSERT INTO public.stock_items VALUES (6, 'Кроссовки детские «Звёздочка» экокожа', 'Малыш-Спорт', 8, '3');
INSERT INTO public.stock_items VALUES (7, 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', 16, '2');
INSERT INTO public.stock_items VALUES (8, 'Кроссовки детские «Гонщик» экокожа', 'Топ-Топ', 17, '2');
INSERT INTO public.stock_items VALUES (9, 'Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', 2, '13');
INSERT INTO public.stock_items VALUES (10, 'Кроссовки детские «Радуга» экокожа перфорированная', 'Лапушка', 3, '13');
INSERT INTO public.stock_items VALUES (11, 'Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', 2, '15');
INSERT INTO public.stock_items VALUES (12, 'Сапожки детские «Снежинка» зимние на меху', 'Тёплые ножки', 3, '15');
INSERT INTO public.stock_items VALUES (13, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 4, '5');
INSERT INTO public.stock_items VALUES (14, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 5, '5');
INSERT INTO public.stock_items VALUES (15, 'Сапожки детские «Медвежонок» демисезонные непромокаемые', 'Северята', 6, '5');
INSERT INTO public.stock_items VALUES (16, 'Сапожки детские «Принцесса» кожаные', 'Весна', 1, '4');
INSERT INTO public.stock_items VALUES (17, 'Сапожки детские «Принцесса» кожаные', 'Весна', 2, '4');
INSERT INTO public.stock_items VALUES (18, 'Сапожки детские «Принцесса» кожаные', 'Весна', 3, '4');
INSERT INTO public.stock_items VALUES (19, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 4, '4');
INSERT INTO public.stock_items VALUES (20, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 5, '4');
INSERT INTO public.stock_items VALUES (21, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 6, '4');
INSERT INTO public.stock_items VALUES (22, 'Сандалии детские «Пчёлка» ортопедические летние', 'Здоровый шаг', 7, '4');
INSERT INTO public.stock_items VALUES (23, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 10, '7');
INSERT INTO public.stock_items VALUES (24, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 11, '7');
INSERT INTO public.stock_items VALUES (25, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 12, '7');
INSERT INTO public.stock_items VALUES (26, 'Сандалии детские «Морячок» текстильные с фиксатором', 'Карапуз', 13, '7');
INSERT INTO public.stock_items VALUES (27, 'Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', 1, '7');
INSERT INTO public.stock_items VALUES (28, 'Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', 2, '7');
INSERT INTO public.stock_items VALUES (29, 'Туфли детские «Бантик» лаковые праздничные', 'Маленький франт', 3, '7');
INSERT INTO public.stock_items VALUES (30, 'Сапоги зимние натуральная кожа', 'Барбари', 19, '12');
INSERT INTO public.stock_items VALUES (31, 'Сапоги зимние натуральная кожа', 'Барбари', 21, '12');
INSERT INTO public.stock_items VALUES (32, 'Сапоги осенние натуральная кожа', 'Барбари', 25, '2');
INSERT INTO public.stock_items VALUES (33, 'Сапоги осенние натуральная кожа', 'Барбари', 27, '2');
INSERT INTO public.stock_items VALUES (34, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 21, '5');
INSERT INTO public.stock_items VALUES (35, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 25, '5');
INSERT INTO public.stock_items VALUES (36, 'Сапоги трубы демисезонные замшевые', 'Твой комфорт', 27, '5');
INSERT INTO public.stock_items VALUES (37, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 19, '10');
INSERT INTO public.stock_items VALUES (38, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 21, '10');
INSERT INTO public.stock_items VALUES (39, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 23, '10');
INSERT INTO public.stock_items VALUES (40, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 25, '10');
INSERT INTO public.stock_items VALUES (41, 'Босоножки «Песчаный берег» коричневые', 'Стиль и комфорт', 27, '10');
INSERT INTO public.stock_items VALUES (42, 'Женские босоножки «Черный кофе» со скульптурным каблуком', 'Кожевенные традиции', 35, '3');
INSERT INTO public.stock_items VALUES (43, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 21, '6');
INSERT INTO public.stock_items VALUES (44, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 25, '6');
INSERT INTO public.stock_items VALUES (45, 'Босоножки женские «Летний бриз»', 'Модный силуэт', 27, '6');
INSERT INTO public.stock_items VALUES (46, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 19, '8');
INSERT INTO public.stock_items VALUES (47, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 21, '8');
INSERT INTO public.stock_items VALUES (48, 'Демисезонные туфли натуральная кожа', 'Модный силуэт', 23, '8');
INSERT INTO public.stock_items VALUES (49, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 19, '4');
INSERT INTO public.stock_items VALUES (50, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 23, '4');
INSERT INTO public.stock_items VALUES (51, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 25, '4');
INSERT INTO public.stock_items VALUES (52, 'Туфли женские натуральная кожа с металлическими вставками', 'Кожевенные традиции', 27, '4');
INSERT INTO public.stock_items VALUES (53, 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', 35, '9');
INSERT INTO public.stock_items VALUES (54, 'Туфли классические лодочки натуральная кожа', 'Стиль и комфорт', 23, '9');
INSERT INTO public.stock_items VALUES (55, 'Кроссовки белые с оранжевым и красным', 'Топ-Топ', 35, '2');
INSERT INTO public.stock_items VALUES (56, 'Кроссовки белые с оранжевым и красным', 'Топ-Топ', 19, '2');
INSERT INTO public.stock_items VALUES (57, 'Кроссовки летние кожаные', 'Топ-Топ', 21, '5');
INSERT INTO public.stock_items VALUES (58, 'Кроссовки летние кожаные', 'Топ-Топ', 22, '5');
INSERT INTO public.stock_items VALUES (59, 'Кроссовки летние кожаные', 'Топ-Топ', 23, '5');
INSERT INTO public.stock_items VALUES (60, 'Кроссовки летние кожаные', 'Топ-Топ', 24, '5');
INSERT INTO public.stock_items VALUES (61, 'Кроссовки кожаные', 'Стиль и комфорт', 35, '16');
INSERT INTO public.stock_items VALUES (62, 'Кроссовки кожаные', 'Стиль и комфорт', 19, '16');
INSERT INTO public.stock_items VALUES (63, 'Кроссовки кожаные', 'Стиль и комфорт', 23, '16');
INSERT INTO public.stock_items VALUES (64, 'Кроссовки кожаные', 'Стиль и комфорт', 25, '16');
INSERT INTO public.stock_items VALUES (65, 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', 35, '3');
INSERT INTO public.stock_items VALUES (66, 'Кроссовки «Стиль и комфорт»', 'Стиль и комфорт', 23, '3');
INSERT INTO public.stock_items VALUES (67, 'Кроссовки для бега «Драйв»', 'Азимут', 30, '1');
INSERT INTO public.stock_items VALUES (68, 'Кроссовки для бега «Драйв»', 'Азимут', 31, '1');
INSERT INTO public.stock_items VALUES (69, 'Кроссовки для бега «Драйв»', 'Азимут', 32, '1');
INSERT INTO public.stock_items VALUES (70, 'Кроссовки для бега «Драйв»', 'Азимут', 33, '1');
INSERT INTO public.stock_items VALUES (71, 'Кроссовки «Азимут Бег»', 'Азимут', 23, '50');
INSERT INTO public.stock_items VALUES (72, 'Кроссовки «Азимут Бег»', 'Азимут', 24, '50');
INSERT INTO public.stock_items VALUES (73, 'Кроссовки «Азимут Бег»', 'Азимут', 25, '50');
INSERT INTO public.stock_items VALUES (74, 'Кроссовки «Азимут Бег»', 'Азимут', 26, '50');
INSERT INTO public.stock_items VALUES (75, 'Кроссовки «Азимут Бег»', 'Азимут', 27, '50');
INSERT INTO public.stock_items VALUES (76, 'Кроссовки «Азимут Бег»', 'Азимут', 29, '50');
INSERT INTO public.stock_items VALUES (77, 'Кроссовки', 'Топ-Топ', 29, '3');
INSERT INTO public.stock_items VALUES (78, 'Кроссовки', 'Топ-Топ', 31, '3');
INSERT INTO public.stock_items VALUES (79, 'Кроссовки', 'Топ-Топ', 34, '3');
INSERT INTO public.stock_items VALUES (80, 'Черные туфли в классическом стиле', 'Барбари', 27, '6');
INSERT INTO public.stock_items VALUES (81, 'Черные туфли в классическом стиле', 'Барбари', 29, '6');
INSERT INTO public.stock_items VALUES (82, 'Черные туфли в классическом стиле', 'Барбари', 33, '6');
INSERT INTO public.stock_items VALUES (83, 'Туфли мужские светлые классика демисезонные', 'Берестов', 31, '15');
INSERT INTO public.stock_items VALUES (84, 'Туфли мужские светлые классика демисезонные', 'Берестов', 33, '15');
INSERT INTO public.stock_items VALUES (85, 'Туфли мужские светлые классика демисезонные', 'Берестов', 34, '15');
INSERT INTO public.stock_items VALUES (86, 'Туфли из натуральной кожи', 'Берестов', 34, '3');
INSERT INTO public.stock_items VALUES (87, 'Ботинки мужские демисезонные', 'Барбари', 29, '1');
INSERT INTO public.stock_items VALUES (88, 'Ботинки мужские демисезонные', 'Барбари', 31, '1');
INSERT INTO public.stock_items VALUES (89, 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', 31, '3');
INSERT INTO public.stock_items VALUES (90, 'Ботинки черные из натуральной кожи', 'Кожевенные традиции', 33, '3');
INSERT INTO public.stock_items VALUES (91, 'Ботинки зимние классические', 'Барбари', 29, '13');
INSERT INTO public.stock_items VALUES (92, 'Ботинки зимние классические', 'Барбари', 31, '13');


--
-- TOC entry 4972 (class 0 OID 25081)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Иванов', 'Иван', 'Сергеевич', 'isivanov', 1);
INSERT INTO public.users VALUES (2, 'Петров', 'Пётр', 'Алексеевич', 'papetrov', 2);
INSERT INTO public.users VALUES (3, 'Сидорова', 'Анна', 'Дмитриевна', 'asidorova', 3);
INSERT INTO public.users VALUES (4, 'Кузнецова', 'Екатерина', 'Андреевна', 'ekuznetsova', 2);
INSERT INTO public.users VALUES (5, 'Смирнов', 'Дмитрий', 'Владимирович', 'dsmirnov', 3);
INSERT INTO public.users VALUES (6, 'Попов', 'Алексей', 'Николаевич', 'apopov', 1);
INSERT INTO public.users VALUES (7, 'Васильева', 'Ольга', 'Игоревна', 'ovasileva', 3);
INSERT INTO public.users VALUES (8, 'Соколов', 'Павел', 'Викторович', 'psokolov', 2);
INSERT INTO public.users VALUES (9, 'Михайлова', 'Татьяна', 'Юрьевна', 'tmikhailova', 3);
INSERT INTO public.users VALUES (10, 'Новикова', 'Наталья', 'Сергеевна', 'nnovikova', 2);
INSERT INTO public.users VALUES (11, 'Фёдоров', 'Андрей', 'Максимович', 'afedorov', 1);
INSERT INTO public.users VALUES (12, 'Морозов', 'Сергей', 'Павлович', 'smorozov', 3);
INSERT INTO public.users VALUES (13, 'Волкова', 'Юлия', 'Александровна', 'jvolkova', 2);
INSERT INTO public.users VALUES (14, 'Алексеев', 'Артём', 'Евгеньевич', 'aalekseev', 3);
INSERT INTO public.users VALUES (15, 'Лебедева', 'Ирина', 'Владимировна', 'ilebedeva', 3);
INSERT INTO public.users VALUES (16, 'Егоров', 'Никита', 'Денисович', 'negorov', 2);
INSERT INTO public.users VALUES (17, 'Павлова', 'Елена', 'Петровна', 'epavlova', 3);
INSERT INTO public.users VALUES (18, 'Козлов', 'Роман', 'Олегович', 'rkozlov', 1);
INSERT INTO public.users VALUES (19, 'Степанова', 'Виктория', 'Романовна', 'vstepanova', 2);
INSERT INTO public.users VALUES (20, 'Николаев', 'Владимир', 'Иванович', 'vnikolaev', 3);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_categorie_id_seq', 3, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 231
-- Name: orders_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orders_id_seq', 30, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: pozitcia_pozitcia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pozitcia_pozitcia_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 31, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 227
-- Name: sizes_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sizes_size_id_seq', 35, true);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 233
-- Name: stock_items_stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_items_stock_items_id_seq', 92, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- TOC entry 4803 (class 2606 OID 25103)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categorie_id);


--
-- TOC entry 4811 (class 2606 OID 25204)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);


--
-- TOC entry 4809 (class 2606 OID 25176)
-- Name: pozitcia pozitcia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pozitcia
    ADD CONSTRAINT pozitcia_pkey PRIMARY KEY (pozitcia_id);


--
-- TOC entry 4805 (class 2606 OID 25115)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4799 (class 2606 OID 25079)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 4807 (class 2606 OID 25128)
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (size_id);


--
-- TOC entry 4813 (class 2606 OID 25230)
-- Name: stock_items stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_items
    ADD CONSTRAINT stock_items_pkey PRIMARY KEY (stock_items_id);


--
-- TOC entry 4801 (class 2606 OID 25090)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4818 (class 2606 OID 25210)
-- Name: orders orders_categorie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categories(categorie_id);


--
-- TOC entry 4819 (class 2606 OID 25215)
-- Name: orders orders_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- TOC entry 4820 (class 2606 OID 25205)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4816 (class 2606 OID 25182)
-- Name: pozitcia pozitcia_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pozitcia
    ADD CONSTRAINT pozitcia_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4817 (class 2606 OID 25187)
-- Name: pozitcia pozitcia_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pozitcia
    ADD CONSTRAINT pozitcia_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- TOC entry 4815 (class 2606 OID 25116)
-- Name: products products_categorie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categories(categorie_id);


--
-- TOC entry 4821 (class 2606 OID 25231)
-- Name: stock_items stock_items_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_items
    ADD CONSTRAINT stock_items_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- TOC entry 4814 (class 2606 OID 25091)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


-- Completed on 2026-10-22 08:42:35

--
-- PostgreSQL database dump complete
--

\unrestrict JlMi82UiLJwffwcPk5XMe54AYeEKbrMzJeKLdZpBU65thXvyKl53wmvxVHIhxb0

