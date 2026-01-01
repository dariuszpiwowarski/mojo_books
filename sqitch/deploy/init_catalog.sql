-- Deploy mojo_books:init_catalog to pg

BEGIN;

-- deploy/init_catalog.sql

create table publisher (
  id bigserial primary key,
  name text not null,
  created_at timestamptz not null default now(),
  unique (name)
);

create table work (
  id bigserial primary key,
  title text not null,
  original_language text,
  created_at timestamptz not null default now()
);

create table edition (
  id bigserial primary key,
  work_id bigint not null references work(id) on delete cascade,
  publisher_id bigint references publisher(id) on delete set null,
  isbn text,
  year int,
  format text, -- hardcover, paperback, ebook...
  created_at timestamptz not null default now(),
  unique (isbn)
);

create index edition_work_id_idx on edition(work_id);
create index edition_publisher_id_idx on edition(publisher_id);


COMMIT;
