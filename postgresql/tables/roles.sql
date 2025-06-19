CREATE TABLE IF NOT EXISTS vote.roles
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_role integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    flag_actif boolean DEFAULT true,
    libelle character varying(64) COLLATE pg_catalog."default" NOT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.roles OWNER to vote;

CREATE FUNCTION vote.dateModificationRole() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationRole() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationRole BEFORE UPDATE ON vote.roles FOR EACH ROW EXECUTE FUNCTION vote.dateModificationRole();
