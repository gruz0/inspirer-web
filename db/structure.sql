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
    bio text
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: health_body_measures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_body_measures (
    id bigint NOT NULL,
    chest double precision,
    waist double precision,
    hips double precision,
    unit public.body_measure_units,
    feeling character varying,
    notes text,
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
    weight double precision,
    unit public.weight_units,
    feeling character varying,
    notes text,
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
    woke_up_at_hour integer,
    woke_up_at_minutes integer,
    feeling character varying,
    notes text,
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
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


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
-- Name: health_body_measures fk_rails_3e0b72e09b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_measures
    ADD CONSTRAINT fk_rails_3e0b72e09b FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: health_sleeps fk_rails_a99c3f91d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_sleeps
    ADD CONSTRAINT fk_rails_a99c3f91d2 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: health_body_weights fk_rails_b5376eb8b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_body_weights
    ADD CONSTRAINT fk_rails_b5376eb8b0 FOREIGN KEY (account_id) REFERENCES public.accounts(id);


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
('20190929180650');


