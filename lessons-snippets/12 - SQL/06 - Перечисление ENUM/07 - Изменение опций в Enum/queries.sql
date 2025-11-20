alter type support_request_priority
add value 'important' after 'medium';

drop type support_request_priority;


alter type support_request_priority
rename value 'important' to '_deprecated_important';

update support_requests
set priority = 'high'
where priority = '_deprecated_important'
