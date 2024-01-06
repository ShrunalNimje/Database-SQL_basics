-- Practice question paper 4 --

create database mydatabase03;

use mydatabase03;

create table customer(
     cust_name varchar(50),
     city varchar(50),
     grade_value int not null
);

insert into customer 
(cust_name, city, grade_value) values
("David", "New York", 100),
("Rahul", "Delhi", 200),
("Denis", "New York", 100),
("Panjuta", "Paris", 300),
("Aman", "Maharashtra", 250);

-- Question 1 --
/*
Write a SQL query statement to display all customers in New York
who have a grade value above 50
*/

select cust_name
from customer
where city = "New York" and grade_value > 50;

-- Question 2 --
/*
Write a SQL query statement to display all customers, who are either
belongs to the city New York or had a grade above 200
*/

select cust_name
from customer
where city = "New York" or grade_value > 200;

-- Question 3 --
/*
Write a SQL query statement to display all customers, who are either
belongs to the city New York or not had a grade above 200
*/

select cust_name
from customer
where city = "New York" or not grade_value > 200; 

-- Question 4 --
/*
Write a SQL query statement to display those customers, who are neither
belongs to the city New York nor grade value is more than 300
*/

select cust_name
from customer
where city != "New York" or not grade_value > 300;



create table salesmen(
     sale_id int primary key,
     name varchar(50),
     my_order varchar(50),
     city varchar(50),
     commission float,
     my_year year not null,
     price int not null
);
drop table salesmen;

insert into salesmen
(sale_id, name, my_order, city, commission, my_year, price) values
(100, "Shrunal", "order1", "Nagpur", 0.10, 2023, 500),
(101, "Ayush", "order3", "Nashik", 0.30, 2024, 600),
(102, "Atharva", "order2", "Mumbai", 0.10, 2022, 700),
(103, "Shahid", "order4", "Pune", 0.40, 2022, 400),
(104, "Ritik", "order7", "Kolhapur", 0.70, 2020, 350);


-- Question 5 --
/*
Write a SQL statement to display sale_id, name, city and commission 
who gets the commission within the range more than 0.10% and less than 0.40%
*/

select * from salesmen;

select sale_id, name, city, commission 
from salesmen
where (commission > 0.10 and commission < 0.40);

-- Question 6 --
/*
Write a SQL statement to display either those orders which are not issued
on year 2020 and issued by the salesmen whose id is 505 and below or those
orders which purchase amount is 1000 and below
*/

select my_order 
from salesmen
where not my_year = 2020 and sale_id >105 or price > 500;
