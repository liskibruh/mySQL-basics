use new_company;
show tables;
select * from emp;

-- minimum salary for each department
select deptno, min(salary)
from emp
group by deptno;

-- number of employees in each department
select deptno, count(*)
from emp
group by deptno;

-- group by based on job title and department
select job, deptno, avg(salary) 
from emp
group by job, deptno;

select distinct job
from emp;

select * from emp
where salary=(select max(salary) from emp);

-- all the employees who receive 2nd maximum salary
select * from emp
where salary=(select salary from emp order by salary desc limit 1 offset 2);

-- another way to write the above query
select * from emp
where salary=(select max(salary) from emp
where salary<(select max(salary) from emp));

-- cartesian product or cross join
select * from emp,dept;

-- cross join can also be done using the clause cross join and its the same as cartesian product
select * from emp cross join dept;

select * from dept;

-- natural join (joins on the common attribute automatically)
select e.ename, d.deptno, d.dname
from emp as e natural join dept as d;

select *
from emp natural join dept;

-- inner join
	-- inner join automatically joins of the common attribute in both tables
    -- inner join displays a common table only once in the resulted table
select *
from emp as e 
inner join dept as d on e.deptno=d.deptno;

select *
from emp
inner join dept on emp.deptno=dept.deptno;

select emp.ename as Employee_Name, dept.dname as Department_Name
from emp
inner join dept on emp.deptno=dept.deptno;

select emp.ename as "Employee Name", dept.dname as "Department Name"
from emp
inner join dept on emp.deptno=dept.deptno;

select e.ename as "Employee Name", d.dname as "Department Name"
from emp as e
inner join dept as d on e.deptno=d.deptno;

select * from emp;

-- self join
select m.ename as "Manager Name", e.ename as "Employee Name"
from emp as e
join emp as m on e.empno=m.mgr;

-- another way to write the above query
select a.ename as "Employee Name", b.ename as "Manager Name"
from emp as a
join emp as b on a.mgr=b.empno;

-- left join
select a.ename as "Employee Name", b.ename as "Manager Name"
from emp as a
left join emp as b on a.mgr=b.empno;

-- switching to a different database
use employees;
show tables;

select * from employee;
select * from dependent;

select e.fname, e.lname, d.dname
from employee as e
join department as d on e.dno=d.dnumber;

select fname, dependent_name
from employee, dependent
where ssn=essn;

select e.fname, d.dependent_name
from employee as e
left join dependent as d on e.ssn=d.essn; -- left table is employee, right is dependent
-- display all the rows in the left table that has/has no matching records in the right table

select e.fname, count(d.dependent_name)
from employee as e
join dependent as d on e.ssn=d.essn
group by e.fname;

-- another way to write the above query
select fname, count(*)
from employee,dependent
where ssn=essn
group by fname;

-- there's no full join in mysql but we can use union operation for the same purpose
select e.fname, d.dependent_name
from employee as e
left join dependent as d on e.ssn=d.essn
union
select e.fname, d.dependent_name
from employee as e
right join dependent as d on e.ssn=d.essn;