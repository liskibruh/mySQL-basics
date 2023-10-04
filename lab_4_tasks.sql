show databases;
use employees;

-- Find the names of all employees who are directly supervised by ‘Franklin Wong’.
select m.fname
from employee as e
join employee as m on e.ssn=m.super_ssn
where e.fname='Franklin';

-- For each department, retrieve the department name and the average salary of all employees working in that department.
select d.dname, avg(salary)
from employee as e
join department as d on e.dno=d.dnumber
group by e.dno;

-- Retrieve the names of all employees who do not work on any project.
select e.fname, e.lname
from employee as e
left join works_on as w on e.ssn = w.essn
where w.pno is null;

-- average, min, max salary of employees from houston
select d.dlocation, min(e.salary), max(e.salary), avg(e.salary)
from employee as e
join dept_locations as d on e.dno=d.dnumber
where d.dlocation='Houston';

-- Find the names of employees who are working on ProjectX
select  e.fname, e.lname 
from employee as e
join project as p on e.dno=p.dnum
where pname='ProductX';

select * from employee;