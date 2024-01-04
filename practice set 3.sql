-- Practice question paper 3 --

create database mydatabase02;

use mydatabase02;

create table company(
     product_name varchar(100),
     price int not null,
     manufacture_code int primary key
);

insert into company 
( product_name, price, manufacture_code ) values
("peanut butter", 350, 10),
("oats", 350, 11),
("creatine", 500, 16),
("chavanprash", 600, 18),
("ghee", 1000, 19);

-- Question 1 --
/*
Write a SQL query to find all the product with a price between 200/- and 600/-
*/

select product_name
from company
where price between 200 and 600;

-- Question 2 --
/*
Write a SQL query to calculate the average price of all products
of the manufacturer which code is 14 and 16
*/

alter table company
modify manufacture_code tinyint not null;

set sql_safe_updates = 0;

update company
set manufacture_code = 14
where manufacture_code =18;

select * from company;

select avg(price)
from company
where manufacture_code in (14, 16);

-- Question 3 --
/*
Write a SQL query to display the name and price of all the items
with a price is equal or more than 250/-, and the list contain 
the larger price first and then by name in ascending order
*/

select product_name, price
from company
where price >= 250 
order by price desc, product_name asc;

-- Question 4 --
/*
Write a SQL query to find the name and price of the cheapest item
*/

select product_name, price
from company
where price = (select min(price) from company);

-- Question 5 --
/*
Write a SQL query to find the data of employee whose last name is 'Snares'
*/

create table employee_data(
     name varchar(50),
     salary int );
     
insert into employee_data 
(name, salary) values
("Jack Snares", 24000),
("Scott Snares", 25000),
("Jack Jones", 29000),
("Nick Ley", 34000),
("pee Cott", 20000);

update employee_data
set name = "Snares"
where name = "Scott Snares";

update employee_data
set name = "Snares"
where name = "pee Cott";

select * from employee_data
where name = 'Snares';

-- Question 6 --
/*
Write a SQL query to find the last name of employee, without duplicates
*/

select distinct name from employee_data;

