CREATE TABLE IF NOT EXISTS vote.presentations
(
    numero_presentation integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    numero_categorie integer NOT NULL,
    numero_production integer NOT NULL,
    numero_ordre integer NOT NULL DEFAULT 0,
    media_mime character varying(128) COLLATE pg_catalog."default",
    media_data bytea,
    nombre_points integer NOT NULL DEFAULT 0,
    nombre_pole_position integer NOT NULL DEFAULT 0,
    CONSTRAINT fk_numeroCategoriePresentation FOREIGN KEY(numero_categorie) REFERENCES vote.categories(numero_categorie),
    CONSTRAINT fk_numeroProductionPresentation FOREIGN KEY(numero_production) REFERENCES vote.productions(numero_production)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.presentations OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroCategoriePresentation ON vote.presentations USING btree (numero_categorie) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroProductionPresentation ON vote.presentations USING btree (numero_production) TABLESPACE vote;
