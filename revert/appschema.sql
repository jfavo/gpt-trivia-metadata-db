-- Revert metadata-db:appschema from pg

BEGIN;

DROP SCHEMA metadata;

COMMIT;
