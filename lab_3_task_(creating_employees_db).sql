show databases;
drop database employees;
create database employees;
use employees;


-- CREATING TABLES --
create table EMPLOYEE
(
	Fname varchar(255) not null,
	Minit varchar(1),
    Lname varchar(255) not null,
    Ssn int not null,  -- changed --
    Bdate date,
    Address varchar(30),
    Sex varchar(1),
    Salary float,
    Super_ssn int, -- changed --
    Dno int not null,
    
    primary key(Ssn),
    foreign key(Super_ssn) references employee(ssn)
);

create table DEPARTMENT
(
	Dname varchar(15) unique not null,
    Dnumber int not null,
    Mgr_ssn int not null, -- changed --
    Mgr_start_date date,
    
    primary key(Dnumber),
    foreign key(Mgr_ssn) references employee(Ssn)
);

create table DEPT_LOCATIONS 
(
	Dnumber int, -- changed (removed not null constraint bcz its foreign key) --
    Dlocation varchar(20),
    
    primary key(Dnumber, Dlocation),
    foreign key(Dnumber) references department(Dnumber)
);

create  table PROJECT
(
	Pname varchar(20) unique not null,
    Pnumber int not null,
    Plocation varchar(20),
    Dnum int, -- changed (removed not null bcz foreign key) --
    
    primary key(Pnumber),
    foreign key(Dnum) references department(Dnumber)
);

create table WORKS_ON
(
	Essn int not null, -- changed --
    Pno int not null, 
    Hours float not null,
    
    primary key(Essn,Pno),
    foreign key(Essn) references employee(Ssn),
    foreign key(Pno) references project(Pnumber)
);

create table DEPENDENT 
(
	Essn int not null, -- changed --
    Dependent_name varchar(15) not null,
    Sex varchar(1),
    Bdate date,
    Relationship varchar(20),
    
    primary key(Essn,Dependent_name),
    foreign key(Essn) references employee(Ssn)
);


-- INSERTING DATA --
insert into employee
	(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
values
	('James', 'E', 'Borg', 888665555, '1937-11-10', '430 Stone, Houston, TX', 'M', 5500, NULL, 1);
    
insert into employee
	(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
values
	('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4),
    ('Franklin', 'B', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5),
    ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4),
    ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5),
    ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5),
    ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4),
    ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);

-- 
insert into department
	(Dname, Dnumber, Mgr_ssn, Mgr_start_date)
values
	('Research', 5, 333445555, '1988-05-22'),
    ('Administration', 4, 987654321, '1995-01-01'),
    ('Headquarters', 1, 888665555, '1981-06-19');

-- 
insert into dept_locations
	(Dnumber, Dlocation)
values
	(1,'Houston'),
    (4,'Stafford'),
    (5,'Bellaire'),
    (5,'Sugarland'),
    (4,'Houston');
    
--
insert into project
	(Pname, Pnumber, Plocation, Dnum)
values
	('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization', 20, 'Houston', 1),
    ('Newbenefits', 30, 'Stafford', 4);
    
-- 
insert into works_on
	(Essn, Pno, Hours)
values
	(123456789, 1, 32.5),
    (123456789, 2, 7.5),
    (666884444, 3, 40.0),
    (453453453, 1, 20.0),
    (453453453, 2, 20.0),
    (333445555, 2, 10.0),
    (333445555, 3, 10.0),
    (333445555, 10, 10.0),
    (333445555, 20, 10.0),
    (999887777, 30, 30.0),
    (999887777, 10, 10.0),
    (987987987, 10, 35.0),
    (987987987, 30, 5.0),
    (987654321, 30, 20.0),
    (987654321, 20, 15.0),
    (888665555, 20, 0.0);
    
-- 
insert into dependent
	(Essn, Dependent_name, Sex, Bdate, Relationship)
values
	(333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
    (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
    (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
    (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
    (123456789, 'Michael', 'M', '1988-01-04','Son'),
    (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
    (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
    

-- ALTERING TABLE --
alter table employee 
add constraint fk_manages 
foreign key(Dno) references department(Dnumber);


-- TESTING --
select * from dept_locations;