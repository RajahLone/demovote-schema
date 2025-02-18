CREATE TABLE IF NOT EXISTS vote.participants_roles
(
    numero_participant integer NOT NULL,
    numero_role integer NOT NULL,
    CONSTRAINT fk_numeroParticpantRole FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant),
    CONSTRAINT fk_numeroRoleParticipant FOREIGN KEY(numero_role) REFERENCES vote.roles(numero_role)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.participants_roles OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroParticpantRole ON vote.participants_roles USING btree (numero_participant) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroRoleParticipant ON vote.participants_roles USING btree (numero_role) TABLESPACE vote;
