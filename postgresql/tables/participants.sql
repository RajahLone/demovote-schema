CREATE TYPE vote.status_participant AS ENUM('EN_ATTENTE', 'PAYE_CHEQUE', 'PAYE_ESPECES', 'VIREMENT_BANCAIRE', 'VIREMENT_PAYPAL', 'ORGA', 'GUEST');
CREATE TYPE vote.mode_paiement AS ENUM('CHEQUE', 'VIREMENT', 'PAYPAL', 'ESPECES', 'AUTRE');

CREATE CAST (varchar AS vote.status_participant) WITH INOUT AS IMPLICIT;
CREATE CAST (varchar AS vote.mode_paiement) WITH INOUT AS IMPLICIT;

CREATE TABLE IF NOT EXISTS vote.participants
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_participant integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    flag_actif boolean DEFAULT true,
    nom character varying(128) COLLATE pg_catalog."default" NOT NULL DEFAULT '',
    prenom character varying(128) COLLATE pg_catalog."default" NOT NULL DEFAULT '',
    pseudonyme character varying(128) COLLATE pg_catalog."default" NOT NULL DEFAULT '',
    groupe character varying(128) COLLATE pg_catalog."default" NOT NULL DEFAULT '',
    mot_de_passe character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT '',
    flag_expire boolean DEFAULT false,
    date_expiration timestamp without time zone DEFAULT NULL,
    delai_deconnexion integer NOT NULL DEFAULT 15,
    adresse character varying(256) COLLATE pg_catalog."default" DEFAULT '',
    code_postal character varying(16) COLLATE pg_catalog."default" DEFAULT '',
    ville character varying(128) COLLATE pg_catalog."default" DEFAULT '',
    pays character varying(128) COLLATE pg_catalog."default" DEFAULT 'France',
    numero_telephone character varying(32) COLLATE pg_catalog."default" DEFAULT '',
    email character varying(128) COLLATE pg_catalog."default" DEFAULT '',
    status vote.status_participant DEFAULT 'EN_ATTENTE',
    flag_machine boolean DEFAULT true,
    commentaire text,
    flag_jour1 boolean DEFAULT false,
    flag_jour2 boolean DEFAULT false,
    flag_jour3 boolean DEFAULT false,
    flag_dodo_sur_place boolean DEFAULT true,
    flag_amigabus boolean DEFAULT false,
    mode_paiement vote.mode_paiement DEFAULT 'CHEQUE',
    date_inscription timestamp without time zone NOT NULL DEFAULT now(),
    somme_recue decimal(10,2) DEFAULT '0.00',
    flag_arrive boolean DEFAULT false
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.participants OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_nomParticipant ON vote.participants USING btree (nom) TABLESPACE vote;
CREATE UNIQUE INDEX IF NOT EXISTS ix_pseudonymeParticipant ON vote.participants USING btree (pseudonyme) TABLESPACE vote;

CREATE FUNCTION vote.dateModificationParticipant() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationParticipant() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationParticipant BEFORE UPDATE ON vote.participants FOR EACH ROW EXECUTE FUNCTION vote.dateModificationParticipant();
