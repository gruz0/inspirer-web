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
-- Name: body_measure_units; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.body_measure_units AS ENUM (
    'cm',
    'inch'
);


--
-- Name: distance_units; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.distance_units AS ENUM (
    'km',
    'mi'
);


--
-- Name: feelings; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.feelings AS ENUM (
    'amazing',
    'happy',
    'energetic',
    'good',
    'depressed',
    'afraid',
    'sad',
    'angry'
);


--
-- Name: learning_book_statuses; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.learning_book_statuses AS ENUM (
    'new_book',
    'want_to_read',
    'reading_now',
    'finished'
);


--
-- Name: weight_units; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.weight_units AS ENUM (
    'kg',
    'lbs'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    name character varying,
    website character varying,
    bio text,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: activity_custom_workouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_custom_workouts (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    feeling public.feelings NOT NULL,
    account_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: activity_custom_workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_custom_workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_custom_workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_custom_workouts_id_seq OWNED BY public.activity_custom_workouts.id;


--
-- Name: activity_outdoor_walks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_outdoor_walks (
    id bigint NOT NULL,
    distance double precision NOT NULL,
    distance_unit public.distance_units,
    steps integer NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activity_outdoor_walks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_outdoor_walks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_outdoor_walks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_outdoor_walks_id_seq OWNED BY public.activity_outdoor_walks.id;


--
-- Name: activity_yoga_asanas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_yoga_asanas (
    id bigint NOT NULL,
    feeling public.feelings NOT NULL,
    notes text NOT NULL,
    account_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: activity_yoga_asanas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_yoga_asanas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_yoga_asanas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_yoga_asanas_id_seq OWNED BY public.activity_yoga_asanas.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: health_body_measures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_body_measures (
    id bigint NOT NULL,
    chest double precision NOT NULL,
    waist double precision NOT NULL,
    hips double precision NOT NULL,
    unit public.body_measure_units,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: health_body_measures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.health_body_measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: health_body_measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.health_body_measures_id_seq OWNED BY public.health_body_measures.id;


--
-- Name: health_body_weights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_body_weights (
    id bigint NOT NULL,
    weight double precision NOT NULL,
    unit public.weight_units,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: health_body_weights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.health_body_weights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: health_body_weights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.health_body_weights_id_seq OWNED BY public.health_body_weights.id;


--
-- Name: health_sleeps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_sleeps (
    id bigint NOT NULL,
    woke_up_at_hour integer NOT NULL,
    woke_up_at_minutes integer NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: health_sleeps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.health_sleeps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: health_sleeps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.health_sleeps_id_seq OWNED BY public.health_sleeps.id;


--
-- Name: learning_articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_articles (
    id bigint NOT NULL,
    url character varying NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: learning_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_articles_id_seq OWNED BY public.learning_articles.id;


--
-- Name: learning_books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_books (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) DEFAULT ''::character varying NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    status public.learning_book_statuses NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: learning_books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_books_id_seq OWNED BY public.learning_books.id;


--
-- Name: learning_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_podcasts (
    id bigint NOT NULL,
    url character varying NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: learning_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_podcasts_id_seq OWNED BY public.learning_podcasts.id;


--
-- Name: learning_videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.learning_videos (
    id bigint NOT NULL,
    url character varying NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    feeling public.feelings NOT NULL,
    notes text DEFAULT ''::text NOT NULL,
    account_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: learning_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.learning_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: learning_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.learning_videos_id_seq OWNED BY public.learning_videos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: activity_custom_workouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_custom_workouts ALTER COLUMN id SET DEFAULT nextval('public.activity_custom_workouts_id_seq'::regclass);


--
-- Name: activity_outdoor_walks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_outdoor_walks ALTER COLUMN id SET DEFAULT nextval('public.activity_outdoor_walks_id_seq'::regclass);


--
-- Name: activity_yoga_asanas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_yoga_asanas ALTER COLUMN id SET DEFAULT nextval('public.activity_yoga_asanas_id_seq'::regclass);


--
-- Name: health_body_measures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_measures ALTER COLUMN id SET DEFAULT nextval('public.health_body_measures_id_seq'::regclass);


--
-- Name: health_body_weights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_weights ALTER COLUMN id SET DEFAULT nextval('public.health_body_weights_id_seq'::regclass);


--
-- Name: health_sleeps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_sleeps ALTER COLUMN id SET DEFAULT nextval('public.health_sleeps_id_seq'::regclass);


--
-- Name: learning_articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_articles ALTER COLUMN id SET DEFAULT nextval('public.learning_articles_id_seq'::regclass);


--
-- Name: learning_books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_books ALTER COLUMN id SET DEFAULT nextval('public.learning_books_id_seq'::regclass);


--
-- Name: learning_podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_podcasts ALTER COLUMN id SET DEFAULT nextval('public.learning_podcasts_id_seq'::regclass);


--
-- Name: learning_videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_videos ALTER COLUMN id SET DEFAULT nextval('public.learning_videos_id_seq'::regclass);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: activity_custom_workouts activity_custom_workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_custom_workouts
    ADD CONSTRAINT activity_custom_workouts_pkey PRIMARY KEY (id);


--
-- Name: activity_outdoor_walks activity_outdoor_walks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_outdoor_walks
    ADD CONSTRAINT activity_outdoor_walks_pkey PRIMARY KEY (id);


--
-- Name: activity_yoga_asanas activity_yoga_asanas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_yoga_asanas
    ADD CONSTRAINT activity_yoga_asanas_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: health_body_measures health_body_measures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_measures
    ADD CONSTRAINT health_body_measures_pkey PRIMARY KEY (id);


--
-- Name: health_body_weights health_body_weights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_weights
    ADD CONSTRAINT health_body_weights_pkey PRIMARY KEY (id);


--
-- Name: health_sleeps health_sleeps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_sleeps
    ADD CONSTRAINT health_sleeps_pkey PRIMARY KEY (id);


--
-- Name: learning_articles learning_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_articles
    ADD CONSTRAINT learning_articles_pkey PRIMARY KEY (id);


--
-- Name: learning_books learning_books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_books
    ADD CONSTRAINT learning_books_pkey PRIMARY KEY (id);


--
-- Name: learning_podcasts learning_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_podcasts
    ADD CONSTRAINT learning_podcasts_pkey PRIMARY KEY (id);


--
-- Name: learning_videos learning_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_videos
    ADD CONSTRAINT learning_videos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_accounts_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_confirmation_token ON public.accounts USING btree (confirmation_token);


--
-- Name: index_accounts_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_email ON public.accounts USING btree (email);


--
-- Name: index_accounts_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_reset_password_token ON public.accounts USING btree (reset_password_token);


--
-- Name: index_accounts_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_unlock_token ON public.accounts USING btree (unlock_token);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_activity_custom_workouts_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activity_custom_workouts_on_account_id ON public.activity_custom_workouts USING btree (account_id);


--
-- Name: index_activity_outdoor_walks_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activity_outdoor_walks_on_account_id ON public.activity_outdoor_walks USING btree (account_id);


--
-- Name: index_activity_yoga_asanas_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activity_yoga_asanas_on_account_id ON public.activity_yoga_asanas USING btree (account_id);


--
-- Name: index_health_body_measures_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_health_body_measures_on_account_id ON public.health_body_measures USING btree (account_id);


--
-- Name: index_health_body_weights_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_health_body_weights_on_account_id ON public.health_body_weights USING btree (account_id);


--
-- Name: index_health_sleeps_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_health_sleeps_on_account_id ON public.health_sleeps USING btree (account_id);


--
-- Name: index_learning_articles_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learning_articles_on_account_id ON public.learning_articles USING btree (account_id);


--
-- Name: index_learning_articles_on_account_id_and_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_learning_articles_on_account_id_and_url ON public.learning_articles USING btree (account_id, url);


--
-- Name: index_learning_books_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learning_books_on_account_id ON public.learning_books USING btree (account_id);


--
-- Name: index_learning_podcasts_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learning_podcasts_on_account_id ON public.learning_podcasts USING btree (account_id);


--
-- Name: index_learning_podcasts_on_account_id_and_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_learning_podcasts_on_account_id_and_url ON public.learning_podcasts USING btree (account_id, url);


--
-- Name: index_learning_videos_on_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_learning_videos_on_account_id ON public.learning_videos USING btree (account_id);


--
-- Name: index_learning_videos_on_account_id_and_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_learning_videos_on_account_id_and_url ON public.learning_videos USING btree (account_id, url);


--
-- Name: learning_videos fk_rails_020b008ddc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_videos
    ADD CONSTRAINT fk_rails_020b008ddc FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: activity_outdoor_walks fk_rails_021613d145; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_outdoor_walks
    ADD CONSTRAINT fk_rails_021613d145 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: activity_custom_workouts fk_rails_1758e66730; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_custom_workouts
    ADD CONSTRAINT fk_rails_1758e66730 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: learning_podcasts fk_rails_2351573e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_podcasts
    ADD CONSTRAINT fk_rails_2351573e8e FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: health_body_measures fk_rails_3e0b72e09b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_measures
    ADD CONSTRAINT fk_rails_3e0b72e09b FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: learning_articles fk_rails_a0af29c697; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_articles
    ADD CONSTRAINT fk_rails_a0af29c697 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: health_sleeps fk_rails_a99c3f91d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_sleeps
    ADD CONSTRAINT fk_rails_a99c3f91d2 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: learning_books fk_rails_ab2fcc0cae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.learning_books
    ADD CONSTRAINT fk_rails_ab2fcc0cae FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: health_body_weights fk_rails_b5376eb8b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_weights
    ADD CONSTRAINT fk_rails_b5376eb8b0 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: activity_yoga_asanas fk_rails_bbd7b33a72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_yoga_asanas
    ADD CONSTRAINT fk_rails_bbd7b33a72 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190924085225'),
('20190927174637'),
('20190928062958'),
('20190928153532'),
('20190929090725'),
('20190929180650'),
('20191001063046'),
('20191001071518'),
('20191002074140'),
('20191002075220'),
('20191002192310'),
('20191003181315'),
('20191003190615'),
('20191006175521'),
('20191007181126'),
('20191007182016'),
('20191007182944'),
('20191013130845'),
('20191013163300'),
('20191018155237'),
('20191026102514'),
('20191031175856'),
('20191031185135'),
('20191031185307'),
('20191104132420'),
('20191108060150'),
('20191116164957'),
('20191121061222'),
('20191227210048');


