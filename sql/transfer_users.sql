begin tran
	create table #tmp_users (username nvarchar(256));

	insert into #tmp_users (username) values ('craig');

	-- create table #fetched_users (username nvarchar(256));

	-- 1. Users

	merge Users AS t
	using (
		select * from [ifix_staging].dbo.Users u
		where u.Username in (select username from #tmp_users)
	) as s
	on s.Username = t.Username
	-- ,
	when not matched by target then
	insert (UserId, Username, Email, FirstName, LastName, DisplayName, Phone, DateCreated, DateModified, LastSeen, Description, PasswordSalt, PasswordHash, IsActive, DismissedMessagesOn)
	values (s.UserId, s.Username, s.Email, s.FirstName, s.LastName, s.DisplayName, s.Phone, s.DateCreated, s.DateModified, s.LastSeen, s.Description, s.PasswordSalt, s.PasswordHash, s.IsActive, s.DismissedMessagesOn)
	-- ,
	when matched then
	update set PasswordHash = s.PasswordHash, PasswordSalt = s.PasswordSalt, FirstName = s.FirstName, LastName = s.LastName, Phone = s.Phone, Description = s.Description, DisplayName = s.DisplayName, IsActive = s.IsActive
	output s.*, $action, inserted.*;

	--select * from users

	-- User Roles

	merge UserRoles AS t
	using (
		select ur.*, lu.UserId as LocalUserId
		from [ifix_staging].dbo.UserRoles ur -- input source
		inner join [ifix_staging].dbo.Users u -- input source
		 on ur.UserId = u.UserId
		inner join Users lu
		 on lu.Username = u.Username
		where u.Username in (select username from #tmp_users)
	) as s
	on t.UserId = s.LocalUserId and s.RoleId = t.RoleId -- roleid only works because Roles have the same IDs, coincidentally.
	when not matched by target then
	insert (UserId, RoleId, ValidFrom, ValidUntil)
	values (s.LocalUserId, s.RoleId, s.ValidFrom, s.ValidUntil)
	output s.*, $action, inserted.*;

	--select * from userroles

	drop table #tmp_users;

commit tran
