-- Assingment question
create database facebook;
use facebook;
create table product_data(product_ID int, product varchar(20),primary key (product_ID));
insert into product_data values (1,'Vlog') , (2,'Education'),(3,'Research'),(4,'Youtube'),(5,'Article');
select * from product_data;

CREATE TABLE product_info_like (
    User_ID int,
    product_ID int,
    liked_date date,
    primary key (User_ID),
    foreign key (product_ID) references product_data (product_ID)
);
insert into product_info_like values (1001,1,'2023-01-01'),(1002,2,'2023-01-01'),
(1003,4,'2023-01-01'),(1004,5,'2023-05-08'),(1005,4,'2023-05-08'),
(1006,1,'2023-11-15'),(1007,4,'2023-05-05'),(1008,2,'2023-05-01'),
(1009,2,'2023-01-01'),(1010,4,'2023-01-01');
select * from product_info_like;

-- Question : Query to return ID's of the product info that have 0 likes.
-- Query :
select a.product_ID, a.product from product_data as a left join product_info_like as b on a.product_ID = b.product_ID
where b.product_id is null;

/* Output :
3	Research  */


-- Question : To list the condidates which have all required skills for job selection.
create database linkdin_data;
use linkdin_data;

create table linkdin(id int, skill varchar(15));
insert into linkdin values(1,'python'),(1,'SQL'),(1,'DS'),(1,'Tableu');
insert into linkdin values(2,'python'),(2,'SQL'),(2,'Tableu');
insert into linkdin values(3,'SQL'),(3,'Tableu');
insert into linkdin values(4,'python'),(4,'SQL'),(4,'DS'),(4,'Tableu');
insert into linkdin values(5,'python'),(5,'DS'),(5,'Tableu');
insert into linkdin values(6,'python'),(6,'SQL'),(6,'DS'),(6,'Tableu');
select * from linkdin;

SELECT id FROM linkdin where skill = 'python' and id in 
-- subquery 1
(select id from linkdin where skill = 'SQL' and id in
-- subquery 1-1  
(select id from linkdin where skill = 'DS' ) 
);