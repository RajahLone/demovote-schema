CREATE TABLE IF NOT EXISTS vote.evenements
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_evenement integer NOT NULL PRIMARY KEY,
    libelle character varying(256) COLLATE pg_catalog."default" DEFAULT NULL,
    lien character varying(256) COLLATE pg_catalog."default" DEFAULT NULL,
    nom character varying(256) COLLATE pg_catalog."default" DEFAULT NULL,
    numero_parent integer DEFAULT NULL,
    numero_niveau integer DEFAULT NULL,
    numero_ordre integer DEFAULT NULL,
    script character varying(256) COLLATE pg_catalog."default" DEFAULT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.evenements OWNER to vote;

CREATE FUNCTION vote.dateModificationEvenement() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationEvenement() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationEvenement BEFORE UPDATE ON vote.evenements FOR EACH ROW EXECUTE FUNCTION vote.dateModificationEvenement();
