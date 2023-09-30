create database employees;
use employees;

create table 
employee(
	Fname varchar(100) not null,
    Minit varchar(1),
    Lname varchar(100) not null,
    Ssn varchar(9) not null,
    Bdate date,
    Address varchar(30),
    Sex varchar(1),
    Salary float,
    Super_ssn varchar(9),
    Dno int not null,
    
    primary key(Ssn),
    foreign key(Super_ssn) references employee(Ssn)
    );
    

create table
	department(
		Dname varchar(100) unique not null,
        Dnumber int  unique not null,
        Mgr_ssn varchar(9),
        Mgr_start_date date,
        
        primary key(Dnumber),
        foreign key(Mgr_ssn) references employee(Ssn)
    );
    

create table 
	dept_locations(
		Dnumber int,
        Dlocation varchar(100),
        
        primary key(Dnumber, Dlocation),
        foreign key(Dnumber) references department(Dnumber)
    );
    

create table
	project(
		Pname varchar(100) unique,
        Pnumber int, 
        Plocation varchar(100),
        Dnum int,
        
        primary key(Pnumber),
        foreign key(Dnum) references department(Dnumber)
    );
    
    
create table
	works_on(
		Essn varchar(9) not null,
        Pno int,
        Hours float not null,
        
        primary key(Essn, Pno),
        foreign key(Essn) references employee(Ssn),
        foreign key(Pno) references project(Pnumber)
	);
    
    
create table
	dependent(
		Essn varchar(9) not null,
        Dependent_name varchar(100) not null,
        Sex varchar(1),
        Bdate date,
        Relationship varchar(50),
        
        primary key(Essn, Dependent_name),
        foreign key(Essn) references employee(Ssn)
    );
    

insert into employee
		(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
    values
		('James','E','Borg',888665555, '1937-11-10','430 Stoen, Houston, TX', 'M',55000, NULL, 1),
		('Jennifer','S','Wallace', 987654321, '1941-06-20','Berry, Bellaire, TX', 'F',43000, 888665555 , 4);
        

insert into department
		(Dname, Dnumber, Mgr_ssn, Mgr_start_date)
	values
		('Research', 5, 888665555, '1988-05-22'),
        ('Administrattion', 4, 888665555, '1955-01-01');
        

insert into dept_locations
		(Dnumber, Dlocation)
	values
		(5,'Houston'),
        (4, 'Stafford');
        

insert into project
		(Pname, Pnumber, Plocation, Dnum)
	values
		('ProductX', 1, 'Bellaire', 5),
        ('ProductY', 2, 'Sugarland', 4);
        

insert into dependent
		(Essn, Dependent_name, Sex, Bdate, Relationship)
	values
		(888665555, 'Alicia', 'F', '1986-04-05', 'Daughter'),
        (888665555, 'Theodore', 'M', '1983-10-25', 'Son');
        
select * from employee;