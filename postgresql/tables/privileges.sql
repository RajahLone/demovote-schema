CREATE TABLE IF NOT EXISTS vote.privileges
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_privilege integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    libelle character varying(128) COLLATE pg_catalog."default" NOT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.privileges OWNER to vote;

CREATE FUNCTION vote.dateModificationPrivilege() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationPrivilege() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationPrivilege BEFORE UPDATE ON vote.privileges FOR EACH ROW EXECUTE FUNCTION vote.dateModificationPrivilege();
