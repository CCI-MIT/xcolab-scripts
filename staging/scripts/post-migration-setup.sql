-- Homolog-specific database changes
-- Add sql statements here is there is any set up required after a new database dump is imported

-- we don't have a connection to the Solve CoLab, so we remove shared contests
delete from xcolab_Contest where isSharedContest = 1 and sharedOrigin = "Solve CoLab";


-- give admin rights to testers
insert into Users_Roles (userId, roleId) select id_, 10118 from members_Member m
    where not exists (select * from Users_Roles as ur where m.id_ = ur.userId and ur.roleId = 10118)
    and screenName in ('yingxi', 'umov', 'cwoebker');
