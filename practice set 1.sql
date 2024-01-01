-- Practice questions papar 1 --

create database myDatabase;

use myDatabase;

create table employee (
     employee_name varchar(50),
     street varchar(100),
     city varchar(50)
);   

insert into employee 
(employee_name, street, city) values
("vishal", "hingana", "nagpur"),
("shivam", "daman nagar", "chandrapur"),
("ayush", "aman nagar", "bhandara"),
("Shrunal", "Anand nagar", "Nagpur"),
("saurabh", "aman nagar", "bhandara");

create table works (
     employee_name varchar(50),
     company_name varchar(100),
     salary int not null
);   

insert into works 
(employee_name, company_name, salary) values
("vishal", "first bank corporation", 25000),
("shivam", "small bank corporation", 30000),
("ayush", "first bank corporation", 40000),
("Shrunal", "first bank corporation", 25000),
("saurabh", "small bank corporationr", 30000);

create table company (
     company_name varchar(100),
     city varchar(50)
); 

insert into company 
(company_name, city) values
("first bank corporation", "nagpur"),
("small bank corporation", "bhandara"),
("first bank corporation", "raipur"),
("first bank corporation", "chandrapur"),
("small bank corporationr", "nagpur");

create table manager (
     employee_name varchar(50),
     manager_name varchar(100)
); 

insert into manager 
(employee_name, manager_name) values
("vishal", "aman"),
("shivam", "daman"),
("ayush", "chaman"),
("Shrunal", "baban"),
("saurabh", "jamaal");

-- Question 1 --
/* 
Find the names, street address and cities of residence for all employee 
who works for 'first bank corporation' and earn more than 10000/- 
*/

select e.employee_name, e.street, e.city
from employee as e, works as w
where e.employee_name = w.employee_name 
and company_name = "first bank corporation" 
and salary > 10000;

-- Question 2 --
/* 
Find the names of all employees in database who live 
in the same cities as the companies for which they work 
*/

select e.employee_name
from employee as e
inner join works as w
on ( e.employee_name = w.employee_name )
inner join company as c
on ( w.company_name = c.company_name) 
where e.city = c.city;

-- Question 3 --
/* 
Find the names of all employees in the database who do not work 
for 'first bank corporation'. Assume that all people work for 
exactly one company
*/

select w.employee_name 
from works as w
where w.company_name = "first bank corporation";

-- Question 4 --
/* 
Find the names of all employees in the database who earn more
than every employee of 'small bank corporation',
*/

select w.employee_name 
from works as w
where w.salary > all( select salary from works where company_name = "small bank corporation" );

-- Question 5 --
/* 
Find the names of all employees in the database who earn more
than avg salary of all employee of their company
*/

select employee_name
from works
where salary > (select avg(salary) from works);

-- Question 6 --
/* 
Find the name of the company that has the smallest payroll
*/

select company_name
from works
group by company_name
having sum(salary) <= all (select sum(salary) from works group by company_name); 

