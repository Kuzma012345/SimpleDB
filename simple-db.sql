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

INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (1, 'Bob', 'Butchers', '83532525252', 'test@ya.ru', 'c858c22846f95e0639ed5a86c46ae204333438f2e943fb467c0e2bb8676f8119', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (2, 'Stas', 'Asket', '86246726274', 'stasyan4ik@mail.ru', '3003d95c07f2a3039d667a2b751bffcadc50856f98666fe8d3bccdbbf971fcb8', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (3, 'Misha', 'Polyakov', '89434255621', 'MishGUN_228@yandex.ru', '0bf1d72f7de1e1df78ab0ced45800f2332a6e75c4309a901569789fd944c8a6b', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (4, 'Maligos', 'Malder', '89858724872', 'furriFan@yahoo.com', 'd4e66f99eb5a2662934e66124048e5dad19705344a38cb5e140b0001180d6e07', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (5, 'Tommy', 'Angelo', '88005553535', 'salieriii@icloud.com', '94dd972477ea6eccfd92cc646738a73ff77519c325fe41e5fd9c38a60104d6b4', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (6, 'Timmy', 'Castel', '84958232848', 'James_Bond_0007@ya.ru', '12cac52c49d871153915af3311bc403fd4d45984fc9cbc31594b075451c1864f', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (7, 'Egor', 'Suraev', '84495829839', 'BtwIUseAstraLinux@astra.ru', 'a6b839d4066b07a477fb96358e9b336926a570705d70b06685b4e104d08b7af5', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (8, 'Larisa', 'Dolina', '89850294092', 'Rattatatatat@google.com', '6b7094d619876644d04f25c637048a55c4d251d2fc00cd1feae32ca8b4c308e0', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (9, 'Anastasia', 'Komarova', '89854446363', 'Nastyha_1999@mail.ru', '2a4e68d2d36e8e5fc978efa104e87462fc892ff782e8a5a6b8c15babd06c64c0', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (10, 'Alextraza', 'Tears', '84953669234', 'Elena_Bodrova_1969@yandex.ru', 'ac3a97485a083696e93e1b56679cf4aa472347cd935905b684241b647f772609', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (11, 'Barbara', 'Antalia', '89292039309', 'GenshinFanKseno@gmail.com', 'd0c5a578808eb3fac5d536becaafff69c3da13c2f24c7fffcf0d3ff231b34b1e', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (12, 'Kirill', 'Krug', '84958381949', 'Little_Cowboy@ya.ru', '7198d230ff2b1998f8e7e82734aec0aac35d6d66dcccf75c0f5ba0ff3fb576d4', 'iron', '$0.00');
INSERT INTO public.clients (id, first_name, last_name, phone_number, email, password, status, turnover) VALUES (13, 'Igor', 'Kotelevec', '84959813981', 'PAPOCHKA@mail.ru', 'ee5ca09602bb435890e739608ee3ad93f4cb0d3da846ca5b1a809a613abcf74b', 'iron', '$0.00');

