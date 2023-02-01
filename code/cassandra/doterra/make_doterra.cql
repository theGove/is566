CREATE KEYSPACE doterra
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

use doterra;


drop TABLE if exists doterra.sale;
CREATE TABLE sale(
   id uuid,
   customer_id uuid,
   order_date timestamp,
   product_id uuid,
   category text,
   product_name text,
   size text, 
   price decimal, 
   quantity int, 
   amount decimal,
   primary key((customer_id),order_date,id));

drop TABLE if exists doterra.customer;
CREATE TABLE doterra.customer(
   partition_key text,
   customer_id uuid,
   first_name text,
   last_name text,
   email text,
   gender text,
   phone text,
   address text,
   city text,
   state text,
   zip text,
   balance float,
   primary key((partition_key),customer_id)
);

drop table if exists doterra.product;
create table doterra.product(
product_id uuid primary key,
product_name text,
category text,
unit text,
retail decimal,
wholesale decimal

);

/*make an index on the city of the customer table*/
create custom index customer_city on doterra.customer(city) using 'StorageAttachedIndex';

/* import a csv file*/
COPY doterra.product from '/home/student/code/cassandra/doterra/product.csv' WITH HEADER = TRUE; 

/* delete all records from a table*/
truncate doterra.product;

/*run a CQL script*/
source '/home/student/code/cassandra/doterra/product.cql'




