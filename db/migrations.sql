CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE items (id SERIAL PRIMARY KEY, name varchar(255), quantity integer);
CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name varchar(255), user_email varchar(255), password_digest varchar(255), is_admin BOOLEAN);
