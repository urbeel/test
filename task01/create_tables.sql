/*
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_statuses;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
*/
CREATE TABLE IF NOT EXISTS roles
(
	id bigserial PRIMARY KEY,
	name varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS users
(
    id bigserial PRIMARY KEY,
    first_name varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    email      varchar(60) NOT NULL,
    phone      varchar(20),
    password   varchar(60) NOT NULL,
    address    text,
    role_id    bigint NOT NULL REFERENCES roles(id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS product_categories
(
	id bigserial PRIMARY KEY,
	name varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS products
(
	id bigserial PRIMARY KEY,
	name varchar(50) NOT NULL,
	category_id bigint NOT NULL REFERENCES product_categories(id),
	description text,
	price int NOT NULL,
	quantity smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS order_statuses
(
	id bigserial PRIMARY KEY,
	name varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders
(
	id bigserial PRIMARY KEY,
	order_status_id bigint NOT NULL REFERENCES order_statuses(id),
	user_id bigint NOT NULL REFERENCES users(id),
	order_time timestamp NOT NULL,
	total_price bigint NOT NULL
);

CREATE TABLE IF NOT EXISTS order_items
(
	order_id bigint NOT NULL REFERENCES orders(id),
	product_id bigint NOT NULL REFERENCES products(id),
	quantity smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS carts
(
	id bigserial PRIMARY KEY,
	user_id bigint UNIQUE NOT NULL REFERENCES users(id),
	total_price bigint NOT NULL
);

CREATE TABLE IF NOT EXISTS cart_items
(
	cart_id bigint NOT NULL REFERENCES carts(id),
	product_id bigint NOT NULL REFERENCES products(id),
	quantity smallint NOT NULL
);
	
	