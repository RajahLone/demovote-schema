CREATE TABLE IF NOT EXISTS vote.bulletins
(
    numero_bulletin integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    numero_categorie integer NOT NULL,
    numero_participant integer NOT NULL,
    numero_production01 integer DEFAULT NULL,
    numero_production02 integer DEFAULT NULL,
    numero_production03 integer DEFAULT NULL,
    numero_production04 integer DEFAULT NULL,
    numero_production05 integer DEFAULT NULL,
    numero_production06 integer DEFAULT NULL,
    numero_production07 integer DEFAULT NULL,
    numero_production08 integer DEFAULT NULL,
    numero_production09 integer DEFAULT NULL,
    numero_production10 integer DEFAULT NULL,
    flag_valide boolean DEFAULT false,
    CONSTRAINT fk_numeroCategorieUrne FOREIGN KEY(numero_categorie) REFERENCES vote.categories(numero_categorie),
    CONSTRAINT fk_numeroParticipantUrne FOREIGN KEY(numero_participant) REFERENCES vote.participants(numero_participant),
    CONSTRAINT fk_numeroProduction01Urne FOREIGN KEY(numero_production01) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction02Urne FOREIGN KEY(numero_production02) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction03Urne FOREIGN KEY(numero_production03) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction04Urne FOREIGN KEY(numero_production04) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction05Urne FOREIGN KEY(numero_production05) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction06Urne FOREIGN KEY(numero_production06) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction07Urne FOREIGN KEY(numero_production07) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction08Urne FOREIGN KEY(numero_production08) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction09Urne FOREIGN KEY(numero_production09) REFERENCES vote.productions(numero_production),
    CONSTRAINT fk_numeroProduction10Urne FOREIGN KEY(numero_production10) REFERENCES vote.productions(numero_production)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.bulletins OWNER to vote;

ALTER TABLE IF EXISTS vote.bulletins ADD CONSTRAINT ix_ParticipantCategorieUrne UNIQUE (numero_categorie, numero_participant);

CREATE INDEX IF NOT EXISTS ix_numeroCategorieUrne ON vote.bulletins USING btree (numero_categorie) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_inumeroParticipantUrne ON vote.bulletins USING btree (numero_participant) TABLESPACE vote;

CREATE INDEX IF NOT EXISTS ix_numeroProduction01Urne ON vote.bulletins USING btree (numero_production01) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction02Urne ON vote.bulletins USING btree (numero_production02) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction03Urne ON vote.bulletins USING btree (numero_production03) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction04Urne ON vote.bulletins USING btree (numero_production04) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction05Urne ON vote.bulletins USING btree (numero_production05) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction06Urne ON vote.bulletins USING btree (numero_production06) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction07Urne ON vote.bulletins USING btree (numero_production07) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction08Urne ON vote.bulletins USING btree (numero_production08) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction09Urne ON vote.bulletins USING btree (numero_production09) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProduction10Urne ON vote.bulletins USING btree (numero_production10) TABLESPACE vote;
