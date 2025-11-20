create type support_request_priority as enum (
  'low',
  'medium',
  'high');

create table if not exists support_requests (
  id bigint generated always as identity primary key,
  message text not null default '',
  priority support_request_priority not null,
  created_at timestamptz not null default now()
);

INSERT INTO support_requests (message, priority) VALUES
('Unable to reset my password through the website.', 'high'),
('Feature request: add dark mode for the dashboard.', 'low'),
('Error 500 when uploading CSV files.', 'high'),
('Clarification needed on billing invoice dates.', 'medium'),
('Mobile app crashes when opening settings.', 'high'),
('Typo found on the FAQ page.', 'low'),
('Request to increase API rate limits for our account.', 'medium'),
('Scheduled report did not arrive this morning.', 'medium'),
('Unable to connect to the SMTP server for notifications.', 'high'),
('Suggestion: allow custom fields on user profiles.', 'low');



insert into support_requests (message, priority)
values ('Unable to reset my password through the website.', 'high');

insert into support_requests (message, priority)
values ('Feature request: add dark mode for the dashboard.', 'low');

insert into support_requests (message, priority)
values ('Error 500 when uploading CSV files.', 'high');

insert into support_requests (message, priority)
values ('Clarification needed on billing invoice dates.', 'medium');

insert into support_requests (message, priority)
values ('Mobile app crashes when opening settings.', 'high');

insert into support_requests (message, priority)
values ('Typo found on the FAQ page.', 'low');

insert into support_requests (message, priority)
values ('Request to increase API rate limits for our account.', 'medium');

insert into support_requests (message, priority)
values ('Scheduled report did not arrive this morning.', 'medium');

insert into support_requests (message, priority)
values ('Unable to connect to the SMTP server for notifications.', 'high');

insert into support_requests (message, priority)
values ('Suggestion: allow custom fields on user profiles.', 'low');
