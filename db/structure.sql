--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name character varying(255),
    end_time timestamp without time zone,
    completed boolean DEFAULT false,
    user_id uuid,
    device_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE devices (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: help_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE help_requests (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    device_id uuid,
    short_url character varying(255),
    user_alerted_at timestamp without time zone,
    emergency_contact_alerted_at timestamp without time zone,
    services_alerted_at timestamp without time zone,
    rescued_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    locatable_id uuid,
    locatable_type character varying(255),
    data hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: user_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_contacts (
    id integer NOT NULL,
    user_id uuid,
    contact_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_contacts_id_seq OWNED BY user_contacts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_contacts ALTER COLUMN id SET DEFAULT nextval('user_contacts_id_seq'::regclass);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: help_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY help_requests
    ADD CONSTRAINT help_requests_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: user_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_contacts
    ADD CONSTRAINT user_contacts_pkey PRIMARY KEY (id);


--
-- Name: index_activities_on_completed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_completed ON activities USING btree (completed);


--
-- Name: index_activities_on_device_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_device_id ON activities USING btree (device_id);


--
-- Name: index_activities_on_end_time; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_end_time ON activities USING btree (end_time);


--
-- Name: index_activities_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_user_id ON activities USING btree (user_id);


--
-- Name: index_contacts_on_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contacts_on_id_and_type ON contacts USING btree (id, type);


--
-- Name: index_devices_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_devices_on_user_id ON devices USING btree (user_id);


--
-- Name: index_help_requests_on_emergency_contact_alerted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_help_requests_on_emergency_contact_alerted_at ON help_requests USING btree (emergency_contact_alerted_at);


--
-- Name: index_help_requests_on_rescued_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_help_requests_on_rescued_at ON help_requests USING btree (rescued_at);


--
-- Name: index_help_requests_on_services_alerted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_help_requests_on_services_alerted_at ON help_requests USING btree (services_alerted_at);


--
-- Name: index_help_requests_on_short_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_help_requests_on_short_url ON help_requests USING btree (short_url);


--
-- Name: index_help_requests_on_user_alerted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_help_requests_on_user_alerted_at ON help_requests USING btree (user_alerted_at);


--
-- Name: index_locations_on_data; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_locations_on_data ON locations USING gin (data);


--
-- Name: index_locations_on_locatable_id_and_locatable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_locations_on_locatable_id_and_locatable_type ON locations USING btree (locatable_id, locatable_type);


--
-- Name: index_user_contacts_on_user_id_and_contact_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_contacts_on_user_id_and_contact_id ON user_contacts USING btree (user_id, contact_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130510030000');

INSERT INTO schema_migrations (version) VALUES ('20130510030001');

INSERT INTO schema_migrations (version) VALUES ('20130601165029');

INSERT INTO schema_migrations (version) VALUES ('20130601172247');

INSERT INTO schema_migrations (version) VALUES ('20130601174402');

INSERT INTO schema_migrations (version) VALUES ('20130601175445');

INSERT INTO schema_migrations (version) VALUES ('20130601180502');

INSERT INTO schema_migrations (version) VALUES ('20130601203350');
