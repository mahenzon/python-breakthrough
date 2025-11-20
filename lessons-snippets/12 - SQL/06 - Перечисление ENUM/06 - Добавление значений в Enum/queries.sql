alter type support_request_priority
add value 'critical';


alter type support_request_priority
add value 'very-low' before 'low';


select *
from support_requests
order by priority desc, created_at, id;


select *
from support_requests
where priority >= 'medium'
order by priority desc, created_at, id;


select *
from support_requests
where priority < 'medium'
order by priority desc, created_at, id;
