CREATE TABLE Author (
author_id SMALLINT PRIMARY KEY, 
first_name VARCHAR(100),
last_name VARCHAR(100),
);

CREATE TABLE Publisher (
pub_id SMALLINT PRIMARY KEY, 
name VARCHAR(100) NOT NULL,
p_address VARCHAR(80)
);

CREATE TABLE Genre (
gen_id SMALLINT PRIMARY KEY, 
name VARCHAR(50) NOT NULL,

);

CREATE TABLE Book (
isbn SMALLINT PRIMARY KEY, 
title varchar(100) NOT NULL,
author_id SMALLINT REFERENCES Author(author_id),
price SMALLINT,
book_language VARCHAR(50),
pub_id SMALLINT REFERENCES Publisher(pub_id), 
gen_id SMALLINT REFERENCES Genre(gen_id), 

);

CREATE TABLE Customer (
ct_id SMALLINT PRIMARY KEY, 
first_name VARCHAR(100), 
last_name VARCHAR(100), 
address VARCHAR(100),
phoneNumber VARCHAR(10),
);

CREATE TABLE Book_Order (
order_id SMALLINT PRIMARY KEY, 
ct_id SMALLINT NOT NULL REFERENCES Customer(ct_id),
shipper VARCHAR(50) 
);

CREATE TABLE Order_details ( 
isbn SMALLINT REFERENCES Book(isbn), 
order_id SMALLINT REFERENCES Book_Order(order_id), 
amount INTEGER CHECK (amount > 0) 
); 