-- Homolog-specific database changes
-- Add sql statements here is there is any set up required after a new database dump is imported

-- give admin rights to testers
insert into user__user_role (user_id, role_id) select user.id, 10118 from user__user user
    where not exists (select * from user__user_role as ur where user.id = ur.user_id and ur.role_id = 10118)
    and user.screen_name in ('testername');
