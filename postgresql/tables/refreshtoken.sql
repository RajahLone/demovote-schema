CREATE TABLE IF NOT EXISTS vote.refreshtoken
(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    numero_participant integer NOT NULL,
    token character varying(4000) NOT NULL COLLATE pg_catalog."default",
    expiry_date timestamp without time zone NOT NULL,
    CONSTRAINT fk_numeroParticipantRefreshtoken FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.refreshtoken OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroParticipantRefreshtoken ON vote.refreshtoken USING btree (numero_participant) TABLESPACE vote;
