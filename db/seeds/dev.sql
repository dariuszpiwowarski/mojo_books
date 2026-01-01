with p as (
  insert into publisher (name)
  values ('Zysk i S-ka')
  on conflict (name) do update set name = excluded.name
  returning id
),
w as (
  insert into work (title)
  values ('The Lord of the Rings')
  returning id
)
insert into edition (work_id, publisher_id, title, year, format, isbn)
select
  w.id,
  p.id,
  'Władca Pierścieni',
  2001,
  'hardcover',
  '9780000000000'
from w, p
returning id;
