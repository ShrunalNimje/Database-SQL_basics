-- Practice questions paper 8 --

create database mydatabase07;

use mydatabase07;

create table salesmen(
     sale_id int primary key,
     sale_name varchar(50),
     city varchar(50),
     commission float not null
);

insert into salesmen 
(sale_id, sale_name, city, commission) values
(501, 'Andy', 'Nashik', 0.20),
(502, 'Adam', 'Nashik', 0.40),
(503, 'Scott', 'Nagpur', 0.40),
(504, 'Danny', 'Nashik', 0.30),
(505, 'Nova', 'Mumbai', 0.20);

create table customer(
     cust_id int primary key,
     cust_name varchar(50),
     city varchar(50),
     grade int,
     sale_id int unique
);

insert into customer 
(cust_id, cust_name, city, grade, sale_id) values
(101, 'Aman', 'Mumbai', 200, 501),
(102, 'Baman', 'Pune', 250, 502),
(103, 'Chaman', 'Nagpur', 300, 503),
(104, 'Daman', 'Nagpur', 500, 504),
(105, 'Faman', 'Mumbai', 150, 505);

create table orders(
     order_no int unique,
     purchase_amt int not null,
     order_date int not null,
	 cust_id int primary key,
     sale_id int unique
);

insert into orders 
(order_no, purchase_amt, order_date, cust_id, sale_id) values
(5501, 2300, 12-12-2023, 101, 501),
(5502, 2500, 04-01-2024, 102, 502),
(5503, 3000, 07-03-2024, 103, 503),
(5504, 1500, 12-07-2024, 104, 504),
(5505, 1000, 03-04-2024, 105, 505);

set sql_safe_updates = 0;

update orders
set order_date = 12-12-2023
where order_date = 04-01-2024;

-- Question 1 --
/*
Write a query to display all the customers whose id is 103 below 
the salesman ID of Mc Lyon 
*/

select * from customer 
where cust_id < ( select sale_id = 103 
from salesmen /* where sale_name = 'Scott' */ ); 

-- Question 2 --
/*
Write a query to display all the orders which values are greater than the average 
order value for 10th October 2012
*/

select * from orders
where purchase_amt > ( select avg(purchase_amt) 
from orders where order_date = 12-12-2023);

-- Question 3 --
/*
Write a query to find the name and numbers of all salesmen who had more than 
one customer
*/

select sale_name 'Salesmen', sale_id 'Salesmen ID'
from salesmen s
where 1 < (select count(*) from customer c
          where s.sale_id = c.sale_id);

-- Question 4 --
/*
Write a query to find all orders with order amounts which are above - average
amounts for their customers
*/

select * from orders o1
where purchase_amt > ( select avg(purchase_amt) from orders o2);


