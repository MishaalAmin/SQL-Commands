use Test;
Create table users (user_id varchar(20) Primary key, name_emp varchar(20));
Insert into users values ('bob','Bob Vance');
Insert into users values ('alice','Alice Vance');
Insert into users values ('eve','Eve Hopps');
select * from users;

update users
set user_id='bobe'
where name_emp='Bob Vance';

select * from users;

delete from users where user_id='bobe';

drop database Test;

Select * from users where not user_id='alice';

Select * from users where user_id like 'e%';
Select * from users where user_id like '%v_';

Create table pay (user_id varchar(20) , payment INT, 
CONSTRAINT fk_user_id
  FOREIGN KEY (user_id)
  REFERENCES Users (user_id) );
  
Insert into pay values ('bob',1000);
Insert into pay values ('bob',2000);
Insert into pay values ('bob',2000);
Insert into pay values ('eve',3000);
Insert into pay values ('eve',3000);


select * from pay order by payment;
select top 3 * from pay order by payment desc;

select *,grade=
case 
when salary>20 then 'C'
when salary<20 then 'B'
else 'A'
end
from emp
go

