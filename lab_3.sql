select * from employee;
desc department;

-- adding table --
alter table employee
add column Tax float;

-- dropping table --
alter table employee 
drop column Tax;

-- adding values to table --
update employee
set tax = 200
where ssn=123456789;

-- adding values in all rows --
update employee
set Tax=salary*0.05; 

-- modifying columns --
alter table employee
modify column fname varchar(100);


insert into department
values 
	('Marketing', 3, 123456789, '2023-09-27'),
    ('Advertising', 2, 123456789, '2023-09-27');


delete from department
where Dnumber=3;

delete from department
where Dnumber=2;

select * from employee
where Bdate<'1960-01-01';

select * from employee
where Bdate between ('1960-01-01') and ('1980-01-01');

select * from employee
where Bdate between ('1960-01-01') and ('1970-01-01')
order by Bdate desc;

select * from employee
order by ssn;

select * from employee
order by fname desc;

select * from employee
where address like('%houston%');

select distinct super_ssn
from employee;

select distinct(super_ssn)
from employee;

select distinct(dno)
from employee;

-- aggregate functions --
select avg(salary) as Average_Salary
from employee;

select min(salary) as Minimum_Salary, 
max(salary) as Maximum_Salary, 
sum(salary) as Sum_of_salaries
from employee;

select min(Bdate) as Oldest_Employee,
max(Bdate) as Youngest_Employee
from employee;

select sex, count(sex)
from employee
group by sex;

select Dno, sex, count(sex)
from employee
group by sex, dno
order by dno;

select essn, count(relationship)
from dependent
group by essn;


-- joins --
select e.fname, count(d.relationship)
from employee as e
join dependent as d on e.ssn=d.essn
group by e.fname;


-- we can't delete an entire table that has foreign key because the 'restrict' 
-- constraint is set by default