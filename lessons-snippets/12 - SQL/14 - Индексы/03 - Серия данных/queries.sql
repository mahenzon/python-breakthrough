select generate_series(1, 10);

select idx, 'username_' || idx username
from generate_series(1, 10) as idx;
