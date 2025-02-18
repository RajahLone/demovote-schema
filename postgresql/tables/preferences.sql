CREATE TABLE IF NOT EXISTS vote.preferences
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_preference integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    numero_participant integer NOT NULL,
    numero_traitement integer NOT NULL,
    valeurs character varying(4000) COLLATE pg_catalog."default",
    CONSTRAINT fk_numeroParticipantPreference FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.preferences OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroParticipantPreference ON vote.preferences USING btree (numero_participant) TABLESPACE vote;

CREATE FUNCTION vote.dateModificationPreference() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationPreference() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationPreference BEFORE UPDATE ON vote.preferences FOR EACH ROW EXECUTE FUNCTION vote.dateModificationPreference();
