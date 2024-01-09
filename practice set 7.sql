-- Practice question paper 7 --

create database mydatabase06;

use mydatabase06;

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

-- Question 1 --
/*
Write a SQL statement to prepare a list with salesmen name,
customer name and their cities for the salesmen and customer 
who belongs to the same city
*/

select sale_name as 'Salesmen', cust_name as 'Customer', c.city as 'City'
from salesmen as s, customer as c
where s.city = c.city;

/* 
     another solution ---
select sale_name as 'Salesmen', cust_name as 'Customer', c.city as 'City'
from salesmen as s
inner join customer as c
where s.city = c.city;
*/

-- Question 2 --
/*
Write a SQL statement to prepare a list with order number,
purchase amount, customer name and their cities for those orders 
which order amount between 500 and 2000
*/

create table orders(
     order_no int unique,
     purchase_amt int not null,
     order_date int not null,
	 cust_name varchar(50),
     sale_id int unique
);

insert into orders 
(order_no, purchase_amt, order_date, cust_name, sale_id) values
(5501, 2300, 12-12-2023, 'Aman', 501),
(5502, 2500, 04-01-2024, 'Baban', 502),
(5503, 3000, 07-03-2024, 'Chaman', 503),
(5504, 1500, 12-07-2024, 'Daman', 504),
(5505, 1000, 03-04-2024, 'Faman', 505);

select o.order_no as 'Order No.', o.purchase_amt as 'Amount', 
c.cust_name as 'Name', c.city as 'City'
from orders as o, customer as c
where c.cust_name = o.cust_name
and purchase_amt between 500 and 2000;

/*
     another solution ---
select o.order_no as 'Order No.', o.purchase_amt as 'Amount', 
c.cust_name as 'Name', c.city as 'City'
from orders as o
inner join customer as c
where c.cust_name = o.cust_name
and purchase_amt between 500 and 2000;
*/

-- Question 3 --
/*
Write a SQL statement to prepare a list of customers who 
appointed a salesmen for their jobs who gets a commission from
the company is more than 35 %
*/

select * -- c.cust_name as 'Customers', s.sale_name as 'Salesmen' --
from salesmen as s
inner join customer as c
on s.sale_id = c.sale_id 
and commission > 0.35;

-- Question 4 --
/*
Write a SQL statement to prepare a list in ascending order for the
customer who works either through a salesmen or by own
*/

select c.cust_name as 'Customer', c.city, 
s.sale_name as 'Salesmen', s.city
from customer as c
left join salesmen as s
on c.sale_id = s.sale_id 
order by c.cust_id;

-- Question 5 --
/*
Write a SQL statement to find the details of a order i.e. order number,
order date, amount of order, which customer gives the order and which salesmen 
works for that customer and how much commission he gets for an order
*/

select o.order_no as 'Order No.', o.order_date as 'Order Date', 
o.purchase_amt as 'Amount', c.cust_name as 'Customer Name',
s.sale_name as'Salesmen Name', s.commission as 'Commission'
from orders as o
inner join customer as c
on o.cust_name = c.cust_name
inner join salesmen as s
on c.sale_id = s.sale_id;

-- Question 6 --
/*
Write a SQL statement to make a list in ascending order for the 
salesmen who works either for one or more customer or not yet join under any of the customer
*/

select c.cust_name 'Customer Name', c.city, c.grade,
s.sale_name 'Salesmen Name'
from salesmen s
left outer join customer c
on s.sale_id = c.sale_id
order by s.sale_id;

-- Question 7 --
/*
Write a SQL statement to make a report with customer name, city, order number,
order date, purchase amount for those customers from those existing list who placed 
one or more orders or which order(s) have been placed by the customers 
who is not on th list
*/

select c.cust_name 'Customer Name', c.city,
o.order_no 'Order No.', o.order_date 'Order Date', 
o.purchase_amt 'Amount'
from customer c
left join orders o
on c.cust_name = o.cust_name
union
select c.cust_name 'Customer Name', c.city,
o.order_no 'Order No.', o.order_date 'Order Date', 
o.purchase_amt 'Amount'
from customer c
right join orders o
on c.cust_name = o.cust_name;

-- Question 8 --
/*
Write a SQL statement to make a cartesian product between salesmen and customer
i.e. each salesmen will appear for all customer and vice versa for 
that customer who belongs to a city
*/

select * from salesmen s
cross join customer c
where c.city is not null;

