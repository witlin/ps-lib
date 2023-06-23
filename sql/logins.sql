--select * from sys.server_principals
--select * from sys.sysusers
--select * from sys.sql_logins
--select * from sys.databases

select
    sys.sql_logins.name as 'user name',
    sys.sql_logins.default_database_name as 'users default db',
    sys.databases.name as 'db by sid_owner'
from sys.sql_logins
    left join sys.databases on sys.sql_logins.sid = sys.databases.owner_sid
where sys.sql_logins.is_disabled != 1
