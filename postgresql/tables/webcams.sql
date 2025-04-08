CREATE TABLE IF NOT EXISTS vote.webcams
(
  date_modification timestamp without time zone,
  id integer NOT NULL PRIMARY KEY,
  crc32 bigint NOT NULL,
  vue bytea NOT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.webcams OWNER to vote;

CREATE FUNCTION vote.dateModificationWebcam() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationWebcam() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationWebcam BEFORE UPDATE ON vote.webcams FOR EACH ROW EXECUTE FUNCTION vote.dateModificationWebcam();
