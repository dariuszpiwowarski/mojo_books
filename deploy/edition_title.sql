-- Deploy mojo_books:edition_title to pg

BEGIN;

-- deploy/edition_title.sql

alter table edition
  add column title text;

comment on column edition.title is
  'Title as shown on this edition (e.g. translated or marketing title)';
COMMIT;
