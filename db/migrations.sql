CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE items (id SERIAL PRIMARY KEY, name varchar(255), quantity integer);
