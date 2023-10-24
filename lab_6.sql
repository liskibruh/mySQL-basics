show databases;
use employees;
show tables;

-- view is a virtual table
-- view has a data definition but data is not stored in the view
select dname as "Department_Name", fname as "Manager_Name"
from employee, department
where mgr_ssn=ssn;

-- the data will not be stored in the view table
-- every time we run a query on the view, it fetches the data from the original tables
create view Department_Managers
as select  dname as "Department_Name", fname as "Manager_Name"
from employee, department
where mgr_ssn=ssn;

select * from Department_Managers;

show tables;
describe Department_Managers;

create view EmpD5
as select * from employee
where dno=5;

select * from EmpD5;

insert into employee
	values
		('Shoaib', 'M', 'Khan', 111222333, '1981-09-17', 'Nowshera KPK', 'M', 30000, 333445555, 5);

select * from EmpD5;

select * from employee
where dno=5;

select * from EmpD5
where salary>30000;

insert into EmpD5
	values
		('Shahab', 'M', 'Khan', 111222444, '1985-06-11', 'Nowshera KPK', 'M', 30000, 333445555, 1);
        
-- in the above query we can see that we're able to insert department 1 data in the empd5 view
-- but this table is only supposed to store data of employees that work in department 5
select * from empd5;
select * from employee;

-- to avoid the above issue we have to write 'with check options' while creating a view
create view EmpD4
as select * from employee
where dno=4
with check option;

-- now if we try to insert employee data of other than department 4, we'll get error
insert into EmpD4
	values
		('Owais', 'M', 'Tahir', 111222444, '1996-01-21', 'Dargai, KPK', 'M', 30000, 333445555, 1); -- throws error
        
-- if a view is created from joins of different tables, we cannot insert data in such a view
-- such views are for read-only purposes
-- changes in view data is reflected to the original table and vice versa

-- materialised view: a view that has data definition as well as data storage
-- not available in mysql but can be obtained by simply "create table" for the view, but there will be no link b/w the view and the original table

create table materialised_view
as select  dname as "Department_Name", fname as "Manager_Name"
from employee, department
where mgr_ssn=ssn;

select * from materialised_view;

drop table materialised_view;

select * from department;

-- sql functions
-- current_date(), current_time(); retrieves system date and time
select current_time(), current_date();

insert into employee
	values
		('Abdullah', 'M', 'Khan', 111222555, current_date(), 'Nowshera KPK', 'M', 30000, 333445555, 4);

select * from employee;

select date_format(bdate, '%D %b %y')
from employee; 

select date_format(bdate, '%d %b %y')
from employee;

select dayofmonth(bdate) as Day, month(bdate) as Month, year(bdate) as Year
from employee; 

select * from employee
where month(bdate) = 11; -- all employees that were born in november

select datediff('2008-12-25','2008-01-01'); -- difference between two dates
select datediff(current_date(), '2023-10-01');
select datediff(current_date(), '1996-01-22'); -- calculating dob

select adddate(current_date(), interval 11 month);
select adddate(current_date(), interval 11 day);
select adddate(current_date(), interval 11 year);

select subdate(current_date(), interval 11 month);

select concat(fname, ' ', minit, ' ', lname) as full_name
from employee;

select concat(lower(fname), ' ', minit, ' ', upper(lname)) as full_name
from employee;

select substr(fname, 1, 3)
from employee;

select length(fname)
from employee;