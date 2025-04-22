
-- DROP ROLE IF EXISTS vote;
CREATE ROLE vote WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  NOBYPASSRLS
  ENCRYPTED PASSWORD 'pharmago$2024';

-- DROP TABLESPACE IF EXISTS vote;
CREATE TABLESPACE vote OWNER vote LOCATION '/Users/Rajah/Documents/www.triplea.fr/vote/base';
ALTER TABLESPACE vote OWNER TO vote;

-- DROP DATABASE IF EXISTS vote;
CREATE DATABASE vote WITH
    OWNER = vote
    TEMPLATE = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = vote
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\c vote

-- DROP SCHEMA IF EXISTS vote ;
CREATE SCHEMA IF NOT EXISTS vote AUTHORIZATION vote;

\ir ./tables/variables.sql
\ir ./tables/evenements.sql
\ir ./tables/roles.sql
\ir ./tables/participants.sql
\ir ./tables/participants_roles.sql
\ir ./tables/refreshtoken.sql
\ir ./tables/messages.sql
\ir ./tables/preferences.sql
\ir ./tables/categories.sql
\ir ./tables/productions.sql
\ir ./tables/presentations.sql
\ir ./tables/bulletins.sql
\ir ./tables/webcams.sql
