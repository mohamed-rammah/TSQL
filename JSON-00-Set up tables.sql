use testdb;
go
drop table if exists Header;
create table Header (HeaderID int identity primary key, TS date not null default(getdate()));
go
drop table if exists Detail;
create table Detail (ID int identity primary key, val int null, HeaderID int);
go

insert Header default values; --should be 1
declare @ID int = scope_identity();
insert Detail values (110, @ID);
insert Detail values (180, @ID);
insert Detail values (null, @ID);

insert Header default values; --should be 2
set @ID = scope_identity();
insert Detail values (240, @ID);
insert Detail values (270, @ID);


go

--update Header set TS = dateadd(day,HeaderID-3, TS);
update Header set TS = choose(HeaderID, '2020-04-12', '2020-04-13');



select * from Header;
select * from Detail;