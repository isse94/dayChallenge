CREATE DATABASE IF NOT EXISTS onlineShop;
USE onlineShop;

-- #users  
CREATE TABLE IF NOT EXISTS user (
user_id int AUTO_INCREMENT ,
user_name varchar(30) NOT NULL,
user_email varchar(30) NOT NULL,
user_address varchar(30) NOT NULL,
user_phoneNum int(20) NOT NULL,
primary key(user_id)
);
-- INSERT INTO user (user_name, user_email, user_address, user_phoneNum )
-- VALUES('Jeff', "jeff.co", "15 London jkl ", 12345), ('John', "john.co", "16 Manchester yui ", 0134555 ), ('Alex', "alex.co","17 Newcastle jkl ", 3456667), ('Ronaldo', "ronaldo.co","18 Manchester iiw ", 63267), ('Messi', "messi.co","19 Paris tyu ", 664461);
-- select user_phoneNum from user -- view table list

-- #products 
CREATE TABLE IF NOT EXISTS products (
product_id int AUTO_INCREMENT ,
product_name varchar(30) NOT NULL,
product_colour varchar(30) NOT NULL,
product_type varchar(30) NOT NULL,
product_price int(20) NOT NULL,
primary key(product_id)
);
-- INSERT INTO products (product_name, product_colour, product_type, product_price )
-- VALUES('PS5', "Black", "Console ", 500), ('PS4', "White", "Console ", 200 ), ('Nike Jumper', "Navy","Clothing ", 54), ('Tie', "grey","clothing ", 100), ('MacBook', "Space grey","Computers", 4000);
-- select product_name from products -- view table list-- 


-- #orders 
CREATE TABLE IF NOT EXISTS orders (
order_id int AUTO_INCREMENT ,
user_id int,
product_id int,
order_date varchar(20),
primary key(order_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- INSERT INTO orders (order_date)
-- VALUES('2022-7-04'), ('2022-7-14'), ('2021-5-12'), ('2021-3-10'), ('2022-01-19');
--  select order_date from orders -- view table list-- 

-- CREATE TABLE IF NOT EXISTS orders (
-- order_id int AUTO_INCREMENT ,
-- user_id int,
-- product_id int,
-- order_date varchar(20),
-- primary key(order_id),
-- FOREIGN KEY (user_id) REFERENCES user(user_id),
-- FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- #orderline
CREATE TABLE IF NOT EXISTS orderline (
orderline_id int AUTO_INCREMENT ,
user_id int,
product_id int,
order_id int,
orderline_quantity int NOT NULL,
primary key(orderline_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO orderline (orderline_quantity)
VALUES(1), (1), (1), (1), (1);
--  select orderline_quantity from orderline -- view table list-- 

-- #### updating question
-- UPDATE user
-- SET user_name = 'mary'
-- WHERE user_name = 'Jeff';  ---- not working
-- UPDATE user
-- SET user_email = 'mary.co'
-- WHERE user_email = 'Jeff.co';  ---- not working


##part 3 querying databases (10 different ) * SEE AFTER revision notes
SHOW databases; -- To see what databases are in our entire MySQL server
SHOW TABLES; -- see all tables within a database
DESCRIBE user; -- see all of the properties of a specified table e.g user (table name)
-- SELECT user; -- select statement is used to read data from a database
SELECT * FROM user; -- .. e.g. select from user table. OR:
SELECT user_name FROM user; -- ^ 
-- SELECT DISTICT user_name FROM user -- DISTINCT keyword, which will only return unique values of a particular column, find all of the unique values in that column
-- to add further specifics and criteria to what we want to read from a table, we can use the WHERE clause in our SELECT statement.
-- SELECT * FROM user WHERE user_name = 'jeff'; -- showers all data related to user_name "jeff"


 -- ....QUESTION 3: query your database
 
ALTER TABLE products
ADD user_id int;
-- ALTER TABLE products
-- ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

-- added foreign key user_id to products . 
ALTER TABLE products
ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES user(user_id);
 -- assigning producs to users 
SELECT product_id, product_name, product_colour, product_type, product_price, user_name
FROM products, user
WHERE product_id = user.user_id
ORDER BY product_id; 

SELECT product_id, product_name, product_colour, product_type, product_price, user_name
FROM products, user
WHERE product_id = user.user_id 
ORDER BY product_id; 

SELECT order_id, order_date, product_name
FROM orders, products
WHERE order_id = products.product_id 
ORDER BY order_id; 



