CREATE TABLE product_type(
    id SERIAL PRIMARY KEY,
    name varchar(128),
    is_fragile BOOLEAN,
    is_cold_state BOOLEAN,
    is_over_18 BOOLEAN
);

CREATE TABLE product(
    type INTEGER REFERENCES product_type(id),
    id SERIAL PRIMARY KEY,
    price MONEY,
    color VARCHAR(128),
    weight NUMERIC,
    dimensions INTEGER,
    description varchar(256),
    is_certified BOOLEAN
);

CREATE TABLE type(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128),
    percent INTEGER,
    premium BOOLEAN
);

CREATE TABLE branches(
    branch_type INTEGER REFERENCES type(id),
    id SERIAL PRIMARY KEY,
    address VARCHAR(128),
    area INTEGER,
    rent INTEGER,
    id_responsible INTEGER,
    email VARCHAR(128),
    postcode INTEGER,
    phone_number VARCHAR(16),
    count_stuff SMALLINT,
    rating smallint
);

CREATE TABLE stuff(
     id SERIAL PRIMARY KEY,
     salary MONEY,
     job_title VARCHAR(256),
     first_name VARCHAR(64),
     last_name VARCHAR(64),
     age SMALLINT CHECK ( age < 100 AND AGE >= 18 ),
     experience SMALLINT,
     phone_number VARCHAR(16),
     email VARCHAR(128),
     description VARCHAR(256)
);

CREATE TABLE branches_stuff(
    branch_id INTEGER NOT NULL REFERENCES branches(id),
    stuff_id INTEGER NOT NULL REFERENCES stuff(id)
);

CREATE TABLE stock(
    product_id INTEGER REFERENCES product(id),
    branch_id INTEGER REFERENCES branches(id),
    id SERIAL PRIMARY KEY,
    count INTEGER,
    is_responsible BOOLEAN
);

CREATE TABLE status(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128)
);

CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    phone_number VARCHAR(16),
    email VARCHAR(32),
    password VARCHAR(256),
    status VARCHAR(128),
    turnover MONEY
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    product_id INTEGER REFERENCES product(id),
    amount MONEY,
    total_price MONEY,
    type_pay VARCHAR(128),
    branch_id INTEGER REFERENCES branches(id),
    status_id INTEGER REFERENCES status(id)
);


CREATE TRIGGER