CREATE TABLE IF NOT EXISTS vote.variables
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_variable integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type character varying(64) COLLATE pg_catalog."default" NOT NULL,
    code character varying(64) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(4000) COLLATE pg_catalog."default" NOT NULL,
    notes character varying(4000) COLLATE pg_catalog."default"
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.variables OWNER to vote;

CREATE FUNCTION vote.dateModificationVariable() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationVariable() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationVariable BEFORE UPDATE ON vote.variables FOR EACH ROW EXECUTE FUNCTION vote.dateModificationVariable();
