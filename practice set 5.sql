-- Practice question paper 5 --

create database mydatabase04;

use mydatabase04;

create table my_order (
     order_no int not null,
	 purchase_amt int not null
);

alter table my_order
modify column order_date int;
 
insert into my_order 
(order_no, purchase_amt, order_date) values
(101, 1000, 2024-02-12),
(102, 1300, 2024-03-15),
(103, 1250, 2024-02-12),
(104, 500, 2024-03-15),
(105, 800, 2024-03-15);

-- Question 1 --
/*
Write a SQL query to display order_no, purchase_amt, achieved, the 
unachieved percentage for those order which exceeds the 50% of 
the target value of 1000
*/

select order_no, purchase_amt,
(purchase_amt * 100)/1000 as 'Achieved %',
((1000 - purchase_amt) * 100)/1000 as "Unachieved %"
from my_order
where (purchase_amt * 100)/1000 > 50;

-- Question 3 --
/*
Write a SQL query to make a report with order date in such a manner that,
the latest order date will come first along with the total purchase amt
and total commission ( 15% for all salesmen ) for that date
*/

select order_date, sum(purchase_amt), 
sum(purchase_amt) * 0.15 as "Commission"
from  my_order
group by order_date
order by order_date;

-- Question 2 --
/*
Write a SQL query to display the commission with the percent 
sign ( % ) with salesmen id, name and city columns for all 
the salesmen
*/

create table salesmen(
     sale_id int primary key,
     name varchar(50),
     city varchar(50),
     commission float,
     sign varchar(5)
);

insert into salesmen
(sale_id, name, city, commission, sign) values
(100, "Shrunal", "Nagpur", 0.10, '%'),
(101, "Ayush", "Nashik", 0.30, '%'),
(102, "Atharva", "Mumbai", 0.10, '%'),
(103, "Shahid", "Pune", 0.40, '%'),
(104, "Ritik", "Kolhapur", 0.70, '%');

select sale_id, name, city, commission * 100 " commission %" 
from salesmen;

