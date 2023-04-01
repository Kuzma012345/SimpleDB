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
    price NUMERIC,
    color VARCHAR(128),
    weight NUMERIC,
    description varchar(256),
    is_certified BOOLEAN
);


CREATE TABLE branches(
    id SERIAL PRIMARY KEY,
    address VARCHAR(128),
    area INTEGER,
    rent NUMERIC,
    email VARCHAR(128),
    postcode INTEGER,
    phone_number VARCHAR(16),
    count_stuff SMALLINT,
    order_average_cost NUMERIC
);

CREATE TABLE stuff(
     id SERIAL PRIMARY KEY,
     salary NUMERIC,
     job_title VARCHAR(256),
     first_name VARCHAR(64),
     last_name VARCHAR(64),
     age SMALLINT CHECK ( age < 100 AND AGE >= 18 ),
     experience SMALLINT,
     phone_number VARCHAR(16),
     email VARCHAR(128),
     password VARCHAR(128),
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
    email VARCHAR(32) UNIQUE,
    password VARCHAR(256),
    status VARCHAR(32) DEFAULT 'silver',
    turnover NUMERIC DEFAULT 0
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    total_price NUMERIC,
    type_pay VARCHAR(128),
    branch_id INTEGER REFERENCES branches(id),
    status_id INTEGER REFERENCES status(id)
);

INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Bob', 'Butchers', '83532525252', 'test@ya.ru', 'c858c22846f95e0639ed5a86c46ae204333438f2e943fb467c0e2bb8676f8119', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Stas', 'Asket', '86246726274', 'stasyan4ik@mail.ru', '3003d95c07f2a3039d667a2b751bffcadc50856f98666fe8d3bccdbbf971fcb8', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Misha', 'Polyakov', '89434255621', 'MishGUN_228@yandex.ru', '0bf1d72f7de1e1df78ab0ced45800f2332a6e75c4309a901569789fd944c8a6b', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Maligos', 'Malder', '89858724872', 'furriFan@yahoo.com', 'd4e66f99eb5a2662934e66124048e5dad19705344a38cb5e140b0001180d6e07', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Tommy', 'Angelo', '88005553535', 'salieriii@icloud.com', '94dd972477ea6eccfd92cc646738a73ff77519c325fe41e5fd9c38a60104d6b4', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Timmy', 'Castel', '84958232848', 'James_Bond_0007@ya.ru', '12cac52c49d871153915af3311bc403fd4d45984fc9cbc31594b075451c1864f', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Egor', 'Suraev', '84495829839', 'BtwIUseAstraLinux@astra.ru', 'a6b839d4066b07a477fb96358e9b336926a570705d70b06685b4e104d08b7af5', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Larisa', 'Dolina', '89850294092', 'Rattatatatat@google.com', '6b7094d619876644d04f25c637048a55c4d251d2fc00cd1feae32ca8b4c308e0', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Anastasia', 'Komarova', '89854446363', 'Nastyha_1999@mail.ru', '2a4e68d2d36e8e5fc978efa104e87462fc892ff782e8a5a6b8c15babd06c64c0', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Alextraza', 'Tears', '84953669234', 'Elena_Bodrova_1969@yandex.ru', 'ac3a97485a083696e93e1b56679cf4aa472347cd935905b684241b647f772609', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Barbara', 'Antalia', '89292039309', 'GenshinFanKseno@gmail.com', 'd0c5a578808eb3fac5d536becaafff69c3da13c2f24c7fffcf0d3ff231b34b1e', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Kirill', 'Krug', '84958381949', 'Little_Cowboy@ya.ru', '7198d230ff2b1998f8e7e82734aec0aac35d6d66dcccf75c0f5ba0ff3fb576d4', 'iron', 0.00);
INSERT INTO public.clients (first_name, last_name, phone_number, email, password, status, turnover) VALUES ('Igor', 'Kotelevec', '84959813981', 'PAPOCHKA@mail.ru', 'ee5ca09602bb435890e739608ee3ad93f4cb0d3da846ca5b1a809a613abcf74b', 'iron', 0.00);

INSERT INTO public.status (id, name) VALUES (1, 'paid');
INSERT INTO public.status (id, name) VALUES (2, 'waiting');
INSERT INTO public.status (id, name) VALUES (3, 'rejected');

INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (1, 'sigar', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (2, 'vaporizers', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (3, 'liquid', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (4, 'hookah', true, false, true);

INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 2, 50.00, 'Grey', 10, 'Premium cuban sigar Castro', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 1, 5.00, 'Black', 50, 'Premium liquid Husky', false);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 3, 5.00, 'Black', 50, 'Liquid voodoo', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (2, 4, 50.00, 'White', 50, 'Smok small vaporizer', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (4, 5, 1000.00, 'Black', 1000, 'Turkish hookah', true);

INSERT INTO public.branches (id, address, area, rent, email, postcode, phone_number, count_stuff, order_average_cost) VALUES (1, 'Sergey Radonezshky Street, 9', 200, 1000.00, 'vasilev@email.com', 101524, '89150034112', 3, 0);
INSERT INTO public.branches (id, address, area, rent, email, postcode, phone_number, count_stuff, order_average_cost) VALUES (2, 'Stroykovskaya, 10', 200, 800.00, 'abakanov@tabacoo.shop', 101812, '89123241123', 3, 0);
INSERT INTO public.branches (id, address, area, rent, email, postcode, phone_number, count_stuff, order_average_cost) VALUES (3, 'Abelmanovskaya, 4', 200, 750.00, 'termanov@tabacoo.shop', 101231, '89230345824', 3, 0);
INSERT INTO public.branches (id, address, area, rent, email, postcode, phone_number, count_stuff, order_average_cost) VALUES (4, 'Talalikhina, 12', 200, 825.00, 'suraev@astralinux.com', 101912, '89011019324', 3, 0);
INSERT INTO public.branches (id, address, area, rent, email, postcode, phone_number, count_stuff, order_average_cost) VALUES (5, 'Delovoy, 15', 400, 2000.00, 'barinov@tabacoo.com', 101235, '89251844212', 3, 0);

INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (300.00, 'Seller', 'Vadim', 'Abramovich', 30, 2, '89208312332', 'abramovich@tabacoo.shop', NULL, 'Продавец');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (300.00, 'Seller', 'Ivan', 'Ivanov', 24, 4, '89104239423', 'Ivanov@tabacoo.shop', NULL, 'Продавец');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (300.00, 'Seller', 'Oleg', 'Lobaev', 26, 2, '89031214323', 'lobaev@tacoo.shop', NULL, 'Продавец');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (300.00, 'Seller', 'Dmitriy', 'Avagov', 28, 5, '88005553535', 'avagov@tacoo.shop', NULL, 'Продавец');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (300.00, 'Seller', 'Dmitriy', 'Chegov', 31, 6, '89154291313', 'Chegov@tacoo.shop', NULL, 'Продавец');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (150.00, 'Supplier', 'Ahmed', 'Dzhagov', 40, 10, '31949231323', 'Dzhagov@tabacoo.shop', NULL, 'Грузчик');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (150.00, 'Supplier', 'Azamat', 'Mahmedov', 32, 4, '80132341952', 'Mahmedov@tabacoo.shop', NULL, 'Грузчик');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (150.00, 'Supplier', 'Muhamed', 'Mambek', 34, 6, '80192354123', 'Mambek@tabacoo.shop', NULL, 'Грузчик');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (150.00, 'Supplier', 'Akhmat', 'Medov', 28, 3, '89231320423', 'Medov@tabacoo.shop', NULL, 'Грузчик');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (150.00, 'Supplier', 'Alavan', 'Alavanov', 31, 4, '89231332434', 'Alavanov@tabacoo.shop', NULL, 'Грузчик');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (1000.00, 'Director', 'Ivan', 'Kuzbasov', 40, 10, '89012375983', 'Kuzbasov@tabacoo.shop', NULL, 'Директор');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (1000.00, 'Director', 'Stanislav', 'Kopal', 34, 4, '89012375443', 'Kopal@tabacoo.shop', NULL, 'Директор');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (1000.00, 'Director', 'Olga', 'Ivanova', 35, 5, '89251239292', 'Ivanova@tabacoo.shop', NULL, 'Директор');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (1000.00, 'Director', 'Egor', 'Valuev', 42, 12, '89234251234', 'Valuev@tabacoo.shop', NULL, 'Директор');
INSERT INTO public.stuff (salary, job_title, first_name, last_name, age, experience, phone_number, email, password, description) VALUES (1000.00, 'Direcot', 'Dmitriy', 'Chubaev', 23, 5, '89102342554', 'Chubaev@tabacoo.shop', NULL, 'Директор');

INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (1, 1);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (2, 2);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (3, 3);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (4, 4);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (5, 5);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (1, 6);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (2, 7);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (3, 8);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (4, 9);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (5, 10);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (1, 11);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (2, 12);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (3, 13);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (4, 14);
INSERT INTO public.branches_stuff (branch_id, stuff_id) VALUES (5, 15);

INSERT INTO public.stock (product_id, branch_id, id, count, is_responsible) VALUES (2, 1, 1, 50, true);
INSERT INTO public.stock (product_id, branch_id, id, count, is_responsible) VALUES (2, 2, 2, 50, true);
INSERT INTO public.stock (product_id, branch_id, id, count, is_responsible) VALUES (3, 3, 3, 100, true);
INSERT INTO public.stock (product_id, branch_id, id, count, is_responsible) VALUES (5, 4, 4, 5, true);
INSERT INTO public.stock (product_id, branch_id, id, count, is_responsible) VALUES (4, 5, 5, 15, true);
