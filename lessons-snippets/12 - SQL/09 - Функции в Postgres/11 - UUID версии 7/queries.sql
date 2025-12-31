select now();

select gen_random_uuid();


select uuid_extract_version(gen_random_uuid());


select uuid_extract_version(uuid), uuid
from (
select gen_random_uuid() uuid
);


select uuidv4();

select uuidv7();


select uuid_extract_version(uuid), uuid
from (
select uuidv7() uuid
);


select uuid_extract_version(uuid)
	   , uuid
	   , uuid_extract_timestamp(uuid)
	   , now()
from (
select uuidv7() uuid
);
