select
      idx
    , case
        when idx < 10 then
            'username_0' || idx
        else
            'username_' || idx
    end as username

from generate_series(1, 120) as idx;


select
      idx
    , case
        when idx < 10 then
            'username_00' || idx
        when idx < 100 then
            'username_0' || idx
        else
            'username_' || idx
    end as username

from generate_series(1, 160) as idx;
