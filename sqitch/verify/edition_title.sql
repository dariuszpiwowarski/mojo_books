-- Verify mojo_books:edition_title on pg

BEGIN;

-- verify/edition_title.sql

select title
from edition
limit 1;


ROLLBACK;
