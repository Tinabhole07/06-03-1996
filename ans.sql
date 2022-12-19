create database project;
create table salespeople(
snum integer,
sname varchar(255),
city varchar(255),
comm integer);
select * from salespeople;
insert into salespeople value(1001, "peel","london",0.12);
insert into salespeople value(1002, "serres","san jose",0.13);
insert into salespeople value(1003, "Axelrod","New york",0.10);
insert into salespeople value(1004, "Motika","London",0.11);
insert into salespeople value(1007, "Rafkin","Barcelona",0.15);


create table Orders(
onum integer,
amount integer,
order_date date,
cnum integer, 
snum integer);
select * from orders;
insert into orders value(3001,18.69,"1994-10-03",2008,1007);
insert into orders value(3002,1900.10,"1994-10-03",2007,1004);
insert into orders value(3003,767.19,"1994-10-03",2001,1001);
insert into orders value(3005,5160.45,"1994-10-03",2003,1002);
insert into orders value(3006,1098.16,"1994-10-04",2008,1007);
insert into orders value(3007,75.75,"1994-10-05",2004,1002);
insert into orders value(3008,4723.00,"1994-10-05",2006,1001);
insert into orders value(3009,1713.23,"1994-10-04",2002,1003);
insert into orders value(3010,1309.95,"1994-10-06",2004,1002);
insert into orders value(3011,9891.88,"1994-10-06",2006,1001);


## 4.	Write a query to match the salespeople to the customers according to the city they are living.
		SELECT salespeople.sname AS "salesman_name",
		customer.city ,customer.cname
		FROM salespeople,customer 
		WHERE salespeople.city=customer.city;



##5.	Write a query to select the names of customers and the salespersons who are providing service to them.
		select a.sname,b.cname from salespeople a,customer b where a.snum=b.snum;
   
   

## 6.	Write a query to find out all orders by customers not located in the same cities as that of their salespeople
		select a.sname,a.city,b.cname,b.city as customer_city 
		from salespeople a,customer b where a.snum=b.snum and a.city!=b.city;




## 7.	Write a query that lists each order number followed by name of customer who made that order
		select a.onum,b.cname from orders a,customer b where a.cnum=b.cnum;



## 8.	Write a query that finds all pairs of customers having the same rating………………
		select * from customer order by rating ;
		


## 9.	Write a query to find out all pairs of customers served by a single salesperson………………..
	
        select
        c.cname as customer_name, 
        s.sname as sales_person 
        from customer c inner join salespeople s
        on c.snum = s.snum 
        group by sales_person 
        having count(s.sname)=2;
     
     
## 10.	Write a query that produces all pairs of salespeople who are living in same city………………..
		select 
        sname as sales_name ,
        city as city from salespeople
        where city in (select city from salespeople group by city having count(*) >1);
        
        
        
##11.	Write a Query to find all orders credited to the same salesperson who services Customer 2008
		select s.snum as serial_no, c.cnum as cutno, o.onum as orderno, o.order_date as orders_date , c.cname as cutname from 
        salespeople s inner join orders o on s.snum = o.snum inner join customer c on c.cnum = o.cnum
        where o.cnum =2008;



## 12.	Write a Query to find out all orders that are greater than the average for Oct 4th
		select * from orders where amount>(select avg(amount) from orders where order_date='1994-10-4');
     
## 13.	Write a Query to find all orders attributed to salespeople in London.
		select * from salespeople where city='london';


## 14.	Write a query to find all the customers whose cnum is 1000 above the snum of Serres. 
		select a.cnum,a.cname,b.snum,b.sname from customer a,salespeople b where b.snum+1000 =a.cnum;
        


##15.	Write a query to count customers with ratings above San Jose’s average rating.
		select count(*) from customer where rating >=(select avg(rating) from customer where city = "san jose" );


## 16.	Write a query to show each salesperson with multiple customers.
		select a.sname,b.cname from salespeople a,customer b where a.snum=b.snum limit 4;







