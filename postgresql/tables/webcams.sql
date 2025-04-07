CREATE TABLE IF NOT EXISTS vote.webcams
(
  id integer NOT NULL PRIMARY KEY,
  flag_updated boolean DEFAULT true,
  crc32 bigint NOT NULL,
  vue bytea NOT NULL
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.webcams OWNER to vote;
