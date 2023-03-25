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


INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (1, 'Bob', 'Butchers', '83532525252', 'test@ya.ru', '12345', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (2, 'Stas', 'Asket', '86246726274', 'stasyan4ik@mail.ru', '12345', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (3, 'Misha', 'Polyakov', '89434255621', 'MishGUN_228@yandex.ru', 'esg', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (4, 'Maligos', 'Malder', '89858724872', 'furriFan@yahoo.com', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (5, 'Tommy', 'Angelo', '88005553535', 'salieriii@icloud.com', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (6, 'Timmy', 'Castel', '84958232848', 'James_Bond_0007@ya.ru', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (7, 'Egor', 'Suraev', '84495829839', 'BtwIUseAstraLinux@astra.ru', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (8, 'Larisa', 'Dolina', '89850294092', 'Rattatatatat@google.com', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (9, 'Anastasia', 'Komarova', '89854446363', 'Nastyha_1999@mail.ru', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (10, 'Alextraza', 'Tears', '84953669234', 'Elena_Bodrova_1969@yandex.ru', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (11, 'Barbara', 'Antalia', '89292039309', 'GenshinFanKseno@gmail.com', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (12, 'Kirill', 'Krug', '84958381949', 'Little_Cowboy@ya.ru', null, 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (13, 'Igor', 'Kotelevec', '84959813981', 'PAPOCHKA@mail.ru', null, 'iron', '$0.00');
