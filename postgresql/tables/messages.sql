CREATE TABLE IF NOT EXISTS vote.messages
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    numero_message integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    numero_participant integer NOT NULL,
    numero_destinataire integer,
    ligne character varying(4000) COLLATE pg_catalog."default",
    CONSTRAINT fk_numeroParticipantMessage FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant),
    CONSTRAINT fk_numeroDestinataireMessage FOREIGN KEY(numero_destinataire) REFERENCES vote.participants(numero_participant)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.messages OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroParticipantMessage ON vote.messages USING btree (numero_participant) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroDestinataireMessage ON vote.messages USING btree (numero_destinataire) TABLESPACE vote;
