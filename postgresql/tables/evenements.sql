CREATE TYPE vote.type_evenement AS ENUM('GENERAL', 'REPAS', 'CONFERENCE', 'DEMOPARTY', 'DIVERS');

CREATE CAST (varchar AS vote.type_evenement) WITH INOUT AS IMPLICIT;

DROP TABLE IF EXISTS vote.evenements CASCADE;

CREATE TABLE IF NOT EXISTS vote.evenements
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_evenement integer NOT NULL PRIMARY KEY,
    date_debut timestamp without time zone NOT NULL DEFAULT now(),
    date_fin timestamp without time zone,
    type vote.type_evenement DEFAULT 'GENERAL',
    intitule character varying(256) COLLATE pg_catalog."default" DEFAULT NULL,
    descriptif character varying(4000) COLLATE pg_catalog."default" DEFAULT NULL,
    lien character varying(512) COLLATE pg_catalog."default" DEFAULT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.evenements OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_dateDebut ON vote.evenements USING btree (date_debut) TABLESPACE vote;

CREATE OR REPLACE FUNCTION vote.dateModificationEvenement() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationEvenement() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationEvenement BEFORE UPDATE ON vote.evenements FOR EACH ROW EXECUTE FUNCTION vote.dateModificationEvenement();
