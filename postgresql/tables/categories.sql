CREATE TABLE IF NOT EXISTS vote.categories
(
    date_creation timestamp without time zone NOT NULL DEFAULT now(),
    date_modification timestamp without time zone,
    numero_categorie integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    flag_actif boolean DEFAULT true,
    libelle character varying(128) COLLATE pg_catalog."default" NOT NULL,
    numero_ordre integer NOT NULL DEFAULT 1,
    flag_upload boolean DEFAULT true,
    flag_affiche boolean DEFAULT false,
    flag_vote_ouvert boolean DEFAULT false,
    flag_calcul boolean DEFAULT false,
    nombre_votants integer DEFAULT 0,
    flag_diaporama boolean DEFAULT false
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.categories OWNER to vote;

CREATE FUNCTION vote.dateModificationCategorie() RETURNS TRIGGER AS $$
BEGIN
  NEW.date_modification = now();
  return NEW;
END;
$$ LANGUAGE 'plpgsql';
ALTER FUNCTION vote.dateModificationCategorie() OWNER TO vote;

CREATE OR REPLACE TRIGGER dateModificationCategorie BEFORE UPDATE ON vote.categories FOR EACH ROW EXECUTE FUNCTION vote.dateModificationCategorie();
