-- Revert mojo_books:init_catalog from pg

BEGIN;

-- revert/init_catalog.sql
drop table if exists edition;
drop table if exists work;
drop table if exists publisher;

COMMIT;
