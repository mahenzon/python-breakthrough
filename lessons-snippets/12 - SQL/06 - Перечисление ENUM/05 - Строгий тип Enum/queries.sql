create type steak_doneness as enum (
  'rare',
  'medium-rare',
  'medium',
  'medium-well',
  'well-done'
);

create table if not exists steaks (
  id bigint generated always as identity primary key,
  title text not null default '',
  doneness steak_doneness not null
);

INSERT INTO steaks (title, doneness) VALUES
  ('Classic Ribeye', 'rare'),
  ('Garlic Butter Sirloin', 'medium-rare'),
  ('Grilled T-Bone', 'medium'),
  ('Peppercorn New York', 'medium-well'),
  ('Smoked Flank', 'well-done'),
  ('Herb-Crusted Filet', 'medium-rare'),
  ('Cajun Strip', 'medium');


select r.*, s.*
from support_requests r, steaks s;


select r.*, s.*
from support_requests r, steaks s
where r.priority = s.doneness;


select r.*, s.*
from support_requests r, steaks s
where r.priority::text = s.doneness::text;
