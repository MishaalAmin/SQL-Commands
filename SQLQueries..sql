create database xyz;
use xyz;

Create table users (user_id varchar(20) Primary key, name_emp varchar(20));
Insert into users values ('bob','Bob Vance');
Insert into users values ('alice','Alice Vance');
Insert into users values ('eve','Eve Hopps');
select * from users;

//Create table users (user_id varchar(20) not null, name_emp varchar(20), Primary key(user_id) );

Create table pay (user_id varchar(20) , payment INT, 
CONSTRAINT fk_user_id
  FOREIGN KEY (user_id)
  REFERENCES Users (user_id) );
  
Insert into pay values ('bob',10);
Insert into pay values ('bob',20);
Insert into pay values ('bob',20);
Insert into pay values ('eve',30);
Insert into pay values ('eve',30);

select * from pay;

select user_id,sum(payment) from pay
group by user_id
having sum(payment) >=50;
 
select users.name_emp,sum(payment) from pay inner join users on (users.user_id=pay.user_id)
having sum(payment) >=50
group by users.name_emp;
 
select users.name_emp,sum(payment) from pay right join users on (users.user_id=pay.user_id)
group by users.name_emp;

select avg(salary),gender from emp group by gender;
select avg(age),dept from emp group by dept order by avg(age) desc; // first its group by and then sorted by order
select dept,avg(salary) from emp group by dept having avg(salary)>10000;
select from where group by having order by;
truncate table pay;
select emp.name,emp.dep,dept.name,dept.location from emp full join dept on emp.dept=dept.name;

update emp
set age=10
from emp
join dep on emp.dep=dep.name
where location='new york';


delete emp
from emp
join dept on ()
where location='new york';

select * from emp
union 
select * from emp1;

select * from emp
except
select * from emp1;

select * from emp
Intersect
select * from emp1;

create view female_emp AS
select * from emp
where gender='F' ;
select * from female_emp;
drop view female_emp;

alter table emp
add dob date;

alter table emp
drop dob;


merge emp_target AS T
using emp_source AS S
         ON T.id=S.id
When matched 
         then update set T.salary=S.salary,T.age=S.age
When not matched by target
         then insert (S.id,S.name,S.salary,S.age,S.gender,S.dept)
when not matched by source
         then delete


**Scalar value Function**
create function add_five(@num as int)
RETURNS int
AS
BEGIN
RETURN(
@num+5
)
END
select dbo.add_five(10)

***Table value function***
create function select_gender(@gender as varchar(20))
RETURNS table
AS
RETURN
(select * from emp where gender=@genfr
)
select * from dbo.select_gender("Male")

**Temp table**
create table #student(s_id int, s_name varchar(20));// stored in tempdb section
insert into #student values()

**Case**
select *,grade=
case 
when salary>20 then 'C'
when salary<20 then 'B'
else 'A'
end
from emp
go

**IIF***
select id,name,ag,
iif(age>20,"A","B") as grade from emp;

**procedure**
create procedure emp_age
as
select age from emp
go

exec emp_age;

***stored procedure with parameter syntax***
create procedure emp_gender @gender varchar(20)
as
select * from emp
where gender=@gender
go

exec emp_gender @gender='Male'

**try/catch**
declare @val1 int;
declare @val2 int;

begin try
set @val1=8;
set @val2=@val1/0;
end try
begin catch
print error_message()
end catch

begin try 
select salary=e_name from emp
end try
begin catch 
print "error"
end catch
go

***Transactions in SQL***
begin transaction
update emp
set age=30 where name='sam'
rollback transaction// if we want to
commit transaction

begin try
      begin transaction
      update emp set salary=30 when gender='Male'
      update...
      commit transaction
      print
end try
begin catch 
      rollback transaction
      print 'rollback'
end catch

**Backup***
databas>task>backup>types>remove all other>add>script>okay

**Simple/full/bulked_logged recovery***
use [master]
go
alter database name
set recovery simple/full/bulk_logged with no_wait
go

**execution related DMV's-typical query to gather info about a queries own connection**
select c.session_id,s.host_name,s.login_name,c.connection_time,s.login_ti,t
from sys.dm_exec_connections AS c
join sys.dm_exec_sessions AS s
on c.session_id=s.session_id
where c.session_id=@@SPID;

**active users***
select login_name, count(session_id) as session_count
from sys.dm_exec_sessions
group by login_name;


**activity monitor***
right click>activity monitor
sql server profiler
***index***
indexes>new index>name>

***default constraint***
create table stu(mark int default 50)
insert into stu() values ()
**unique constraint**
create table stu2(s_id int unique,name varchar(20))

2nd highest salary?***
select max(salary) from emp where salary not in (select max(salay) from emp)

stuff(string1/replaced,position,length,string2//stuffed)

**view**
create view femaleemp as select * from emp where gender='F';
select * from femaleemp;

***copy data of one table into another table**
create table emp_dup(give all columns in same order)
insert into emp_dup select * from emp 
