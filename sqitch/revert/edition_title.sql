-- Revert mojo_books:edition_title from pg

BEGIN;

-- revert/edition_title.sql

alter table edition
  drop column if exists title;

COMMIT;
