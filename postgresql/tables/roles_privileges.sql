CREATE TABLE IF NOT EXISTS vote.roles_privileges
(
    numero_privilege integer NOT NULL,
    numero_role integer NOT NULL,
    CONSTRAINT fk_numeroPrivilegeRole FOREIGN KEY(numero_privilege) REFERENCES vote.privileges(numero_privilege),
    CONSTRAINT fk_numeroRolePrivilege FOREIGN KEY(numero_role) REFERENCES vote.roles(numero_role)
)
TABLESPACE vote;
ALTER TABLE IF EXISTS vote.roles_privileges OWNER to vote;

CREATE INDEX IF NOT EXISTS ix_numeroPrivilegeRole ON vote.roles_privileges USING btree (numero_privilege) TABLESPACE vote;
CREATE INDEX IF NOT EXISTS ix_numeroRolePrivilege ON vote.roles_privileges USING btree (numero_role) TABLESPACE vote;
