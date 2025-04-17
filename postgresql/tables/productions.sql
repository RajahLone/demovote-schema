CREATE TYPE vote.type_production AS ENUM('EXECUTABLE', 'GRAPHE', 'MUSIQUE', 'VIDEO', 'TOPIC', 'AUTRE');

CREATE CAST (varchar AS vote.type_production) WITH INOUT AS IMPLICIT;

CREATE TABLE IF NOT EXISTS vote.productions
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_production integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    flag_actif boolean DEFAULT true,
    numero_participant integer NOT NULL,
    adresse_ip inet NOT NULL,
    type vote.type_production DEFAULT 'AUTRE',
    titre character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT 'unknown compo entry name',
    auteurs character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT 'unknown author(s)',
    groupes character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT 'unknown group(s)',
    plateforme character varying(128) COLLATE pg_catalog."default" NULL DEFAULT '',
    commentaire text,
    informations_privees text,
    nom_archive character varying(256) COLLATE pg_catalog."default",
    nom_local character varying(256) COLLATE pg_catalog."default",
    vignette bytea,
    numero_version integer DEFAULT 1,
    CONSTRAINT fk_numeroParticipantProduction FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.productions OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroParticipantProduction ON vote.productions USING btree (numero_participant) TABLESPACE vote;

CREATE FUNCTION vote.dateModificationProduction() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationProduction() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationProduction BEFORE UPDATE ON vote.productions FOR EACH ROW EXECUTE FUNCTION vote.dateModificationProduction();
