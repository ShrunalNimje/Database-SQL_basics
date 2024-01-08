-- Practice question paper 6 --

create database mydatabase05;

use mydatabase;

create table customer(
     cust_id int unique,
     cust_name varchar(50),
     city varchar(50),
     grade int not null,
     sale_id int unique
);

insert into customer 
(cust_id, cust_name, city, grade, sale_id) values
(101, 'Aman', 'Mumbai', 200, 501),
(102, 'Baman', 'Pune', 250, 502),
(103, 'Chaman', 'Nagpur', 300, 503),
(104, 'Daman', 'Nagpur', 500, 504),
(105, 'Faman', 'Mumbai', 150, 505);

create table salesmen(
     sale_id int unique,
     sale_name varchar(50),
     city varchar(50),
     commission float not null
);     

insert into salesmen 
(sale_id, sale_name, city, commission) values
(501, 'Andy', 'Pune', 0.20),
(502, 'Adam', 'Pune', 0.40),
(503, 'Scott', 'Nagpur', 0.40),
(504, 'Danny', 'Pune', 0.30),
(505, 'Nova', 'Mumbai', 0.20);

set sql_safe_updates = 0;

update salesmen 
set city = 'Nashik'
where city = 'Pune';

select * from salesmen;

create table orders(
     order_no int unique,
     purchase_amt int not null,
     order_date date not null,
	 cust_name varchar(50),
     sale_id int unique
);

alter table orders 
modify order_date int not null;

 insert into orders 
(order_no, purchase_amt, order_date, cust_name, sale_id) values
(5501, 2300, 12-12-2023, 'Aman', 501),
(5502, 2500, 04-01-2024, 'Baban', 502),
(5503, 3000, 07-03-2024, 'Chaman', 503),
(5504, 1500, 12-07-2024, 'Daman', 504),
(5505, 1000, 03-04-2024, 'Faman', 505);
 
 -- Question 1 --
 /*
 Write a query to find those customers with their name and those
 salesmen with their name and city who lives in the same city
 */
 
 select distinct c.cust_name, s.sale_name, s.city
 from customer as c, salesmen as s
 where c.city = s.city;
 
 -- Question 2 --
 /*
 write a sql statement to find the names of all customers
 along with the salesmen who works for them
 */
 
 select cust_name, sale_name
 from customer as c, salesmen as s
 where c.sale_id = s.sale_id;
 
  -- Question 3 --
 /*
 write a sql statement that produces all orders with the order_no, 
 cust_name, commission rate and earned commission amount for those 
 customers who carry their grade more than 200 and served by 
 existing salesmen
 */
 
 select order_no, cust_name, commission as "Commission % ",
 (purchase_amt * commission) as "Commission"
 from customer as c, salesmen as s, orders as o
 where o.sale_id = s.sale_id 
 and c.sale_id = o.sale_id 
 and c.grade >= 300;