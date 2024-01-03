-- Practice question paper 2 --

create database mydatabase01;

use mydatabase01;

-- Question 1 --
/*
write a SQL query to display the order no. followed by order date and the purchase amt.
for each order which will be deliverd by the salesmen who is holding id 5001
*/

create table myorder(
     order_no int unique,
     order_date date not null,
     amount int not null,
     id int primary key);
     
insert into myorder 
(order_no, order_date, amount, id) values     
(100, 01-01-2024, 10000, 11),
(101, 10-01-2024, 15000, 12),
(102, 11-01-2024, 12000, 13),
(103, 02-01-2024, 1000, 14),
(104, 05-01-2024, 10000, 15);

update myorder
set id = 5001
where id = 15;

select order_no 
from myorder
where id = 5001;

-- Question 2 --
/*
write a SQL query to show all details of the Prime Ministerial winners
after 1972 of Menachem Begin and Yitzhak Rabin
*/

create table nobel_winner(
     name varchar(50),
     year_of_games year unique,
     event varchar(100)
);

insert into nobel_winner 
(name, year_of_games, event) values     
("adam", 1970, "Menachem Begin"),
("badam", 1974, "Yitzhak Rabin"),
("cadam", 1980, "Menachem Begin"),
("dadam", 1988, "no way home"),
("madam", 1998, "home coming");

select * from nobel_winner
where year_of_games > 1972 
and event in ( "Menachem Begin", "Yitzhak Rabin");

-- Question 3 --
/*
write a SQL query to show all details of the subject not started with letter M
and arranged the list as the most recent comes first, then by name in order
*/

select * from nobel_winner
where event not like 'm%'
order by year_of_games desc, name;

