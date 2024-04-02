
select * from Students

truncate table Students

insert into Students([Id],[Name],[Surname],[Age])
values  (1,'Ilqar','Siriyev',26),
		(2,'Resad','Agayev',21),
		(3,'Kamran','Muradov',24),
		(4,'Hacixan','Hacixanov',19),
		(5,'Zeyqem','Ashurov',39)


--Evvelden yaratmaq daha yaxsi olar?
alter table Students
add [SoftDeleted] bit default 0

update Students set [SoftDeleted] = 'true' where [Age] > 35

delete from Students where [SoftDeleted] = 'true'




create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)

select * from Countries

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int not null,
foreign key ([CountryId]) references Countries([Id])
)

select * from Cities

insert into Countries([Name])
values ('Azerbaijan'),
	   ('Turkey'),
	   ('Russia')

insert into Cities([Name],[CountryId])
values ('Baku',1),
	   ('Sumqayit',1),
	   ('Izmir',2),
	   ('Istanbul',2),
	   ('Lipetsk',3)

select * from Cities where [CountryId] = 1


create table Books(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
)

create table Authors(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50),
[Email] nvarchar(50)
)

create table BookAuthors(
[Id] int primary key identity(1,1),
[BookId] int
foreign key ([BookId]) references Books([Id]),
[AuthorId] int
foreign key ([AuthorId]) references Authors([Id])
)


select * from Books

select * from Authors

select * from BookAuthors

insert into Books([Name])
values ('Xosrov ve Sirin'),
	   ('Dede Qorqud Dastani'),
	   ('Oluler')

insert into Authors([FullName], [Email])
values ('Nizami Gencevi','nizami@gmail.com'),
	   ('Dede Qorqud','qorqud@mail.ru'),
	   ('Celil Memmedquluzade','celilmemmed1866@gmail.com')

insert into BookAuthors([BookId],[AuthorId])
values (1,1),
	   (2,2),
	   (3,3)

--Many to many
select ba.[Id],a.[FullName] as 'Author',b.[Name] as 'Book', a.[Email] from BookAuthors ba 
join Books b on b.Id = ba.BookId join Authors a on a.Id = ba.AuthorId

--One to Many
select * from Cities
select * from Countries

insert into Countries([Name])
values ('Belgium'),
	   ('Sweeden')


select ct.[Name] as 'City',ctr.[Name] as 'Country' from Cities ct join Countries ctr on ct.CountryId = ctr.Id

select ct.[Name] as 'City',ctr.[Name] as 'Country' from Cities ct left join Countries ctr on ct.CountryId = ctr.Id

select ct.[Name] as 'City',ctr.[Name] as 'Country' from Cities ct right join Countries ctr on ct.CountryId = ctr.Id

select ct.[Name] as 'City',ctr.[Name] as 'Country' from Cities ct full join Countries ctr on ct.CountryId = ctr.Id

select * from Countries ctr join Cities ct on ctr.Id = ct.CountryId

--SelfJoin
select * from Employees

alter table Employees
add [ManagerId] int

update Employees set [ManagerId] = 2 where [Id] = 1
update Employees set [ManagerId] = 1 where [Id] = 3

select m1.[Name] as 'Employee',m2.[Name] as 'Manager' from Employees m1 join Employees m2 on m1.[ManagerId] = m2.[Id] 

