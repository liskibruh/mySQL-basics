show databases;

create database mydatabase;

use mydatabase;

show tables in mydatabase;

create table employee (
	id int, 
    fname varchar(50), 
    lname varchar(50),
    salary int
    );
    
describe employee;

show tables;

select * from employee;

insert into employee(id, fname, lname, salary) 
	values(0, 'Owais', 'Tahir', 200000);
    
select * from employee;

drop table employee;

show tables in mydatabase;

create table employees(
	id int primary key,
    fname varchar(50),
    lname varchar(50),
    salary int
);

show tables in mydatabase;

select * from employees;

insert into employees(id, fname, lname, salary)
	values(0, 'Owais', 'Tahir', 200000);
    
select * from employees;

insert into employees(id, fname, lname, salary)
	values(0, 'Owais', 'Tahir', 863214);
    
select * from employees;

insert into employees
	(id, fname, lname, salary)
values
	(1, 'Abdul', 'Khan', 5632125),
	(2, 'Arman', 'Ali', 856216),
	(3, 'Abrar', 'Anjum', 4789652);
        
select * from employees;

select * from employees
	where fname='Owais';
    
select fname, salary from employees
	where id=2;
    
select fname, lname from employees
	where id=3;
    
select count(*) from employees;

select count(*) from employees
	where salary>=1000000;
    
drop table employees;

create table employees(
	id int primary key auto_increment,
    fname varchar(50),
    lname varchar(50),
    salary int,
    dept varchar(100)
);

insert into employees
	(fname, lname, salary, dept)
values
	('Owais', 'Tahir', 4786521, 'DS'),
    ('Abrar', 'Anjum', 4563263, 'CS'),
    ('Ashraf', 'Azam', 5632863, 'EE'),
    ('Akbar', 'Ali', 14785623, 'CS'),
    ('Rohail', 'Khan', 5325865, 'EE');
    
select * from employees;

select count(*) from employees
	where salary>=100000 and dept='CS';
    
select * from employees
	where salary>=100000 and dept='CS';
    
select avg(salary) from employees;

use company;
