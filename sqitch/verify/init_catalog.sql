-- Verify mojo_books:init_catalog on pg

BEGIN;

-- verify/init_catalog.sql
select 1 from publisher limit 1;
select 1 from work limit 1;
select 1 from edition limit 1;

ROLLBACK;
