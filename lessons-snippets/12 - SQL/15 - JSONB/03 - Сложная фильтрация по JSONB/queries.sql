select profile
     , profile -> 'name'     name
     , profile -> 'role'     role
     , profile -> 'settings' settings
from flexi_users;


select profile
     , profile -> 'name'                 name
     , profile -> 'role'                 role
     , profile -> 'settings' -> 'theme'  selected_theme
     , profile -> 'settings' ->> 'theme' selected_theme_name
from flexi_users;



select profile
     , profile -> 'name'                 name
     , profile -> 'role'                 role
     , profile -> 'settings' -> 'theme'  selected_theme
     , profile -> 'settings' ->> 'theme' selected_theme_name
from flexi_users
where profile -> 'settings' ->> 'theme' = 'dark';



select profile
     , profile -> 'name'                 name
     , profile -> 'role'                 role
     , profile -> 'settings' -> 'theme'  selected_theme
     , profile -> 'settings' ->> 'theme' selected_theme_name
from flexi_users
where profile -> 'settings' @> '{"theme": "light"}';
-- where profile -> 'settings' @> '{"theme": "dark"}'::jsonb;


select profile
     , profile -> 'name'                 name
     , profile -> 'role'                 role
     , profile -> 'settings' -> 'theme'  selected_theme
     , profile -> 'settings' ->> 'theme' selected_theme_name
from flexi_users
where profile @> '{
  "settings": {
    "theme": "dark"
  },
  "role": "developer"
}'::jsonb;



select profile -> 'name'     name
     , profile -> 'role'     role
     , profile -> 'motto'    motto
     , profile ? 'motto'     has_motto
     , profile -> 'settings' settings
     , profile ? 'settings'  has_settings
from flexi_users;



select profile -> 'name'     name
     , profile -> 'role'     role
     , profile -> 'settings' settings
from flexi_users
where profile ? 'settings';


select profile -> 'name'                  name
     , profile -> 'role'                  role
     , profile -> 'settings'              settings
     , profile -> 'settings' -> 'plugins' plugins
     , profile
from flexi_users
where profile -> 'settings' ? 'plugins';


select profile -> 'name'     name
     , profile -> 'role'     role
     , profile -> 'settings' settings
     , profile -> 'settings' -> 'plugins' -> 1
     , profile
from flexi_users
where profile -> 'settings' ? 'plugins';


select profile -> 'name' name
     , profile -> 'role' role
     , profile
from flexi_users
where profile ? 'settings'
   or profile ? 'duty';


select profile -> 'name' name
     , profile -> 'role' role
     , profile
from flexi_users
where profile ?| array ['settings', 'duty'];

select profile ->> 'name' name
     , profile -> 'age'   age
     , profile
from flexi_users
where profile ?& array ['age', 'name'];
