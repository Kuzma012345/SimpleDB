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

INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (1, 'cigarettes', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (2, 'vaporizers', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (3, 'liquid', true, false, true);
INSERT INTO public.product_type (id, name, is_fragile, is_cold_state, is_over_18) VALUES (4, 'hookah', true, false, true);

INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 2, 50.00, 'Grey', 10, 'Premium cuban sigar Castro', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 1, 5.00, 'Black', 50, 'Premium liquid Husky', false);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 3, 5.00, 'Black', 50, 'Liquid voodoo', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (2, 4, 50.00, 'White', 50, 'Smok small vaporizer', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (4, 5, 1000.00, 'Black', 1000, 'Turkish hookah', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 2, 50.00, 'Grey', 10, 'Premium cuban sigar Castro', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 1, 5.00, 'Black', 50, 'Premium liquid Husky', false);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (3, 3, 5.00, 'Black', 50, 'Liquid voodoo', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (2, 4, 50.00, 'White', 50, 'Smok small vaporizer', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (4, 5, 1000.00, 'Black', 1000, 'Turkish hookah', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 6, 50, 'Grey', 10, 'БЕЛОМОР УЛЬТРА', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (4, 7, 2000.00, 'Black', 1200, 'Ultra premium from Turkey', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 8, 200, 'black', 25, 'MIREA PREMIUM CIG', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 9, 241.0, 'blue', 19, 'Lucia slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 10, 109.0, 'purple', 21, 'Lucia mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 11, 258.0, 'red', 31, 'Lucia mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 12, 189.0, 'red', 17, 'Lucia red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 13, 111.0, 'black', 25, 'Lucia blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 14, 158.0, 'red', 31, 'Lucia cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 15, 276.0, 'white', 18, 'Lucia apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 16, 296.0, 'blue', 32, 'Lucia premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 17, 251.0, 'purple', 18, 'Lucia hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 18, 274.0, 'black', 18, 'Lucia light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 19, 146.0, 'blue', 24, 'Lucia double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 20, 161.0, 'blue', 35, 'Lucia fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 21, 92.0, 'blue', 29, 'Lucia extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 22, 182.0, 'black', 27, 'Lucia chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 23, 178.0, 'white', 22, 'Sobranie slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 24, 244.0, 'blue', 25, 'Sobranie mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 25, 226.0, 'green', 27, 'Sobranie mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 26, 268.0, 'white', 20, 'Sobranie red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 27, 221.0, 'yellow', 16, 'Sobranie blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 28, 266.0, 'blue', 26, 'Sobranie cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 29, 256.0, 'green', 25, 'Sobranie apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 30, 273.0, 'green', 30, 'Sobranie premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 31, 168.0, 'black', 26, 'Sobranie hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 32, 181.0, 'blue', 19, 'Sobranie light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 33, 186.0, 'orange', 26, 'Sobranie double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 34, 112.0, 'red', 20, 'Sobranie fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 35, 205.0, 'black', 16, 'Sobranie extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 36, 113.0, 'white', 33, 'Sobranie chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 37, 155.0, 'blue', 33, 'Camel slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 38, 290.0, 'black', 27, 'Camel mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 39, 281.0, 'white', 28, 'Camel mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 40, 174.0, 'blue', 33, 'Camel red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 41, 128.0, 'green', 31, 'Camel blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 42, 300.0, 'green', 28, 'Camel cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 43, 129.0, 'purple', 15, 'Camel apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 44, 285.0, 'yellow', 24, 'Camel premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 45, 218.0, 'purple', 30, 'Camel hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 46, 231.0, 'red', 16, 'Camel light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 47, 193.0, 'black', 29, 'Camel double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 48, 85.0, 'orange', 18, 'Camel fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 49, 175.0, 'orange', 30, 'Camel extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 50, 192.0, 'purple', 22, 'Camel chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 51, 257.0, 'red', 29, 'Senator slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 52, 136.0, 'white', 20, 'Senator mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 53, 219.0, 'green', 30, 'Senator mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 54, 133.0, 'red', 29, 'Senator red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 55, 141.0, 'white', 34, 'Senator blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 56, 216.0, 'blue', 26, 'Senator cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 57, 141.0, 'white', 27, 'Senator apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 58, 255.0, 'orange', 26, 'Senator premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 59, 251.0, 'red', 29, 'Senator hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 60, 137.0, 'purple', 26, 'Senator light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 61, 168.0, 'black', 30, 'Senator double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 62, 271.0, 'white', 17, 'Senator fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 63, 297.0, 'white', 31, 'Senator extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 64, 106.0, 'black', 27, 'Senator chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 65, 129.0, 'white', 30, 'Русский стиль slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 66, 179.0, 'blue', 20, 'Русский стиль mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 67, 242.0, 'blue', 33, 'Русский стиль mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 68, 202.0, 'black', 28, 'Русский стиль red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 69, 159.0, 'green', 33, 'Русский стиль blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 70, 272.0, 'red', 20, 'Русский стиль cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 71, 92.0, 'red', 21, 'Русский стиль apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 72, 189.0, 'orange', 22, 'Русский стиль premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 73, 222.0, 'blue', 23, 'Русский стиль hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 74, 219.0, 'red', 31, 'Русский стиль light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 75, 231.0, 'orange', 15, 'Русский стиль double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 76, 104.0, 'green', 29, 'Русский стиль fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 77, 143.0, 'purple', 22, 'Русский стиль extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 78, 227.0, 'orange', 33, 'Русский стиль chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 79, 250.0, 'green', 33, 'LD slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 80, 91.0, 'orange', 22, 'LD mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 81, 292.0, 'green', 26, 'LD mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 82, 231.0, 'orange', 20, 'LD red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 83, 278.0, 'black', 27, 'LD blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 84, 290.0, 'green', 27, 'LD cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 85, 132.0, 'purple', 28, 'LD apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 86, 176.0, 'white', 26, 'LD premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 87, 208.0, 'orange', 22, 'LD hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 88, 154.0, 'red', 26, 'LD light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 89, 193.0, 'white', 24, 'LD double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 90, 226.0, 'black', 23, 'LD fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 91, 197.0, 'white', 30, 'LD extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 92, 212.0, 'black', 18, 'LD chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 93, 216.0, 'purple', 17, 'Космос slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 94, 246.0, 'white', 15, 'Космос mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 95, 181.0, 'black', 23, 'Космос mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 96, 253.0, 'purple', 18, 'Космос red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 97, 107.0, 'blue', 35, 'Космос blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 98, 168.0, 'yellow', 16, 'Космос cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 99, 141.0, 'red', 21, 'Космос apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 100, 258.0, 'white', 34, 'Космос premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 101, 274.0, 'yellow', 29, 'Космос hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 102, 115.0, 'yellow', 24, 'Космос light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 103, 184.0, 'blue', 20, 'Космос double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 104, 284.0, 'black', 16, 'Космос fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 105, 90.0, 'white', 28, 'Космос extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 106, 262.0, 'purple', 32, 'Космос chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 107, 202.0, 'black', 16, 'Невские slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 108, 126.0, 'orange', 18, 'Невские mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 109, 258.0, 'orange', 18, 'Невские mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 110, 239.0, 'white', 20, 'Невские red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 111, 196.0, 'blue', 25, 'Невские blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 112, 127.0, 'green', 26, 'Невские cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 113, 264.0, 'yellow', 29, 'Невские apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 114, 249.0, 'red', 28, 'Невские premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 115, 100.0, 'red', 20, 'Невские hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 116, 191.0, 'blue', 16, 'Невские light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 117, 240.0, 'blue', 25, 'Невские double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 118, 87.0, 'red', 23, 'Невские fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 119, 165.0, 'black', 33, 'Невские extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 120, 105.0, 'white', 19, 'Невские chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 121, 261.0, 'blue', 24, 'Беломорканал slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 122, 280.0, 'blue', 16, 'Беломорканал mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 123, 217.0, 'yellow', 27, 'Беломорканал mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 124, 214.0, 'blue', 19, 'Беломорканал red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 125, 150.0, 'green', 29, 'Беломорканал blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 126, 104.0, 'purple', 29, 'Беломорканал cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 127, 207.0, 'yellow', 15, 'Беломорканал apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 128, 165.0, 'black', 17, 'Беломорканал premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 129, 238.0, 'purple', 22, 'Беломорканал hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 130, 286.0, 'white', 17, 'Беломорканал light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 131, 156.0, 'purple', 30, 'Беломорканал double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 132, 146.0, 'red', 30, 'Беломорканал fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 133, 268.0, 'white', 34, 'Беломорканал extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 134, 291.0, 'white', 31, 'Беломорканал chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 135, 110.0, 'blue', 30, 'Прима slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 136, 231.0, 'purple', 34, 'Прима mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 137, 221.0, 'yellow', 16, 'Прима mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 138, 248.0, 'purple', 33, 'Прима red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 139, 142.0, 'yellow', 22, 'Прима blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 140, 218.0, 'green', 15, 'Прима cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 141, 213.0, 'purple', 21, 'Прима apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 142, 217.0, 'green', 21, 'Прима premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 143, 129.0, 'blue', 33, 'Прима hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 144, 164.0, 'orange', 21, 'Прима light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 145, 94.0, 'blue', 22, 'Прима double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 146, 283.0, 'red', 20, 'Прима fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 147, 123.0, 'red', 25, 'Прима extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 148, 211.0, 'green', 32, 'Прима chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 149, 176.0, 'black', 16, 'Parliament slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 150, 148.0, 'white', 27, 'Parliament mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 151, 140.0, 'black', 33, 'Parliament mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 152, 103.0, 'blue', 23, 'Parliament red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 153, 159.0, 'yellow', 30, 'Parliament blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 154, 123.0, 'black', 20, 'Parliament cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 155, 220.0, 'purple', 22, 'Parliament apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 156, 285.0, 'black', 27, 'Parliament premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 157, 89.0, 'blue', 23, 'Parliament hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 158, 269.0, 'yellow', 29, 'Parliament light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 159, 220.0, 'purple', 26, 'Parliament double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 160, 248.0, 'white', 22, 'Parliament fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 161, 246.0, 'green', 33, 'Parliament extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 162, 259.0, 'orange', 18, 'Parliament chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 163, 202.0, 'orange', 25, 'Chesterfield slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 164, 196.0, 'orange', 28, 'Chesterfield mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 165, 294.0, 'white', 25, 'Chesterfield mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 166, 276.0, 'purple', 24, 'Chesterfield red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 167, 124.0, 'yellow', 26, 'Chesterfield blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 168, 296.0, 'purple', 17, 'Chesterfield cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 169, 82.0, 'blue', 33, 'Chesterfield apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 170, 299.0, 'white', 19, 'Chesterfield premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 171, 244.0, 'orange', 34, 'Chesterfield hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 172, 126.0, 'green', 30, 'Chesterfield light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 173, 281.0, 'white', 30, 'Chesterfield double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 174, 293.0, 'blue', 33, 'Chesterfield fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 175, 112.0, 'yellow', 28, 'Chesterfield extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 176, 276.0, 'blue', 29, 'Chesterfield chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 177, 208.0, 'green', 15, 'Marlboro slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 178, 201.0, 'orange', 16, 'Marlboro mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 179, 126.0, 'orange', 23, 'Marlboro mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 180, 232.0, 'purple', 30, 'Marlboro red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 181, 244.0, 'yellow', 30, 'Marlboro blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 182, 208.0, 'purple', 20, 'Marlboro cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 183, 139.0, 'white', 20, 'Marlboro apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 184, 298.0, 'red', 28, 'Marlboro premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 185, 195.0, 'blue', 28, 'Marlboro hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 186, 93.0, 'white', 21, 'Marlboro light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 187, 92.0, 'red', 26, 'Marlboro double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 188, 128.0, 'orange', 32, 'Marlboro fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 189, 235.0, 'black', 32, 'Marlboro extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 190, 109.0, 'orange', 35, 'Marlboro chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 191, 239.0, 'purple', 26, 'Virginia slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 192, 250.0, 'orange', 16, 'Virginia mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 193, 228.0, 'purple', 30, 'Virginia mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 194, 118.0, 'purple', 21, 'Virginia red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 195, 187.0, 'green', 28, 'Virginia blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 196, 114.0, 'green', 30, 'Virginia cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 197, 196.0, 'orange', 15, 'Virginia apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 198, 98.0, 'green', 29, 'Virginia premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 199, 174.0, 'orange', 27, 'Virginia hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 200, 199.0, 'orange', 31, 'Virginia light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 201, 152.0, 'red', 25, 'Virginia double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 202, 210.0, 'green', 22, 'Virginia fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 203, 245.0, 'black', 32, 'Virginia extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 204, 188.0, 'green', 15, 'Virginia chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 205, 108.0, 'yellow', 15, 'L&M slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 206, 293.0, 'white', 29, 'L&M mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 207, 203.0, 'green', 31, 'L&M mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 208, 106.0, 'purple', 35, 'L&M red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 209, 134.0, 'purple', 15, 'L&M blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 210, 192.0, 'purple', 23, 'L&M cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 211, 131.0, 'purple', 25, 'L&M apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 212, 161.0, 'orange', 19, 'L&M premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 213, 133.0, 'orange', 20, 'L&M hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 214, 200.0, 'blue', 29, 'L&M light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 215, 276.0, 'purple', 28, 'L&M double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 216, 97.0, 'orange', 23, 'L&M fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 217, 254.0, 'purple', 24, 'L&M extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 218, 122.0, 'green', 20, 'L&M chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 219, 157.0, 'red', 19, 'Muratti slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 220, 154.0, 'black', 29, 'Muratti mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 221, 250.0, 'purple', 21, 'Muratti mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 222, 255.0, 'orange', 33, 'Muratti red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 223, 89.0, 'white', 34, 'Muratti blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 224, 83.0, 'black', 31, 'Muratti cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 225, 98.0, 'white', 23, 'Muratti apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 226, 89.0, 'yellow', 24, 'Muratti premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 227, 193.0, 'orange', 24, 'Muratti hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 228, 282.0, 'blue', 30, 'Muratti light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 229, 194.0, 'black', 31, 'Muratti double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 230, 177.0, 'blue', 17, 'Muratti fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 231, 132.0, 'yellow', 31, 'Muratti extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 232, 125.0, 'purple', 19, 'Muratti chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 233, 252.0, 'white', 32, 'Bond slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 234, 85.0, 'orange', 19, 'Bond mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 235, 92.0, 'yellow', 33, 'Bond mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 236, 243.0, 'yellow', 35, 'Bond red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 237, 268.0, 'red', 16, 'Bond blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 238, 114.0, 'red', 28, 'Bond cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 239, 288.0, 'purple', 21, 'Bond apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 240, 247.0, 'black', 26, 'Bond premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 241, 216.0, 'black', 21, 'Bond hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 242, 290.0, 'purple', 31, 'Bond light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 243, 140.0, 'white', 30, 'Bond double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 244, 287.0, 'orange', 15, 'Bond fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 245, 151.0, 'white', 31, 'Bond extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 246, 116.0, 'yellow', 29, 'Bond chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 247, 111.0, 'yellow', 35, 'Next slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 248, 182.0, 'white', 27, 'Next mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 249, 249.0, 'white', 28, 'Next mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 250, 160.0, 'blue', 17, 'Next red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 251, 119.0, 'red', 22, 'Next blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 252, 123.0, 'blue', 18, 'Next cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 253, 294.0, 'blue', 32, 'Next apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 254, 239.0, 'red', 34, 'Next premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 255, 286.0, 'blue', 28, 'Next hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 256, 225.0, 'black', 27, 'Next light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 257, 136.0, 'green', 25, 'Next double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 258, 184.0, 'blue', 28, 'Next fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 259, 95.0, 'red', 26, 'Next extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 260, 218.0, 'white', 22, 'Next chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 261, 171.0, 'orange', 23, 'Optima slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 262, 110.0, 'white', 33, 'Optima mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 263, 151.0, 'white', 24, 'Optima mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 264, 89.0, 'orange', 24, 'Optima red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 265, 134.0, 'yellow', 33, 'Optima blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 266, 250.0, 'orange', 28, 'Optima cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 267, 232.0, 'yellow', 35, 'Optima apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 268, 291.0, 'yellow', 26, 'Optima premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 269, 125.0, 'red', 32, 'Optima hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 270, 273.0, 'purple', 23, 'Optima light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 271, 184.0, 'yellow', 22, 'Optima double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 272, 196.0, 'red', 18, 'Optima fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 273, 125.0, 'red', 35, 'Optima extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 274, 279.0, 'yellow', 22, 'Optima chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 275, 91.0, 'yellow', 17, 'Trend slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 276, 267.0, 'green', 18, 'Trend mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 277, 203.0, 'blue', 35, 'Trend mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 278, 142.0, 'yellow', 33, 'Trend red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 279, 223.0, 'purple', 16, 'Trend blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 280, 122.0, 'blue', 15, 'Trend cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 281, 185.0, 'white', 34, 'Trend apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 282, 267.0, 'green', 30, 'Trend premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 283, 259.0, 'black', 22, 'Trend hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 284, 230.0, 'blue', 32, 'Trend light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 285, 141.0, 'red', 25, 'Trend double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 286, 260.0, 'black', 26, 'Trend fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 287, 296.0, 'blue', 15, 'Trend extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 288, 257.0, 'orange', 15, 'Trend chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 289, 247.0, 'purple', 27, 'Dunhill slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 290, 176.0, 'red', 25, 'Dunhill mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 291, 137.0, 'blue', 18, 'Dunhill mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 292, 106.0, 'purple', 29, 'Dunhill red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 293, 224.0, 'red', 32, 'Dunhill blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 294, 170.0, 'red', 28, 'Dunhill cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 295, 288.0, 'red', 33, 'Dunhill apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 296, 207.0, 'white', 28, 'Dunhill premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 297, 243.0, 'purple', 16, 'Dunhill hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 298, 278.0, 'orange', 29, 'Dunhill light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 299, 287.0, 'green', 15, 'Dunhill double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 300, 129.0, 'red', 16, 'Dunhill fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 301, 254.0, 'purple', 21, 'Dunhill extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 302, 155.0, 'orange', 28, 'Dunhill chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 303, 91.0, 'yellow', 32, 'Kent slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 304, 196.0, 'yellow', 20, 'Kent mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 305, 132.0, 'red', 19, 'Kent mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 306, 283.0, 'black', 23, 'Kent red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 307, 298.0, 'black', 19, 'Kent blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 308, 200.0, 'purple', 28, 'Kent cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 309, 159.0, 'yellow', 17, 'Kent apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 310, 296.0, 'purple', 29, 'Kent premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 311, 235.0, 'orange', 31, 'Kent hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 312, 92.0, 'orange', 34, 'Kent light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 313, 106.0, 'white', 30, 'Kent double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 314, 94.0, 'blue', 23, 'Kent fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 315, 250.0, 'orange', 35, 'Kent extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 316, 195.0, 'red', 30, 'Kent chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 317, 300.0, 'yellow', 26, 'Vogue slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 318, 206.0, 'blue', 17, 'Vogue mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 319, 242.0, 'black', 15, 'Vogue mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 320, 257.0, 'purple', 23, 'Vogue red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 321, 154.0, 'orange', 34, 'Vogue blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 322, 176.0, 'green', 29, 'Vogue cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 323, 122.0, 'orange', 17, 'Vogue apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 324, 91.0, 'purple', 22, 'Vogue premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 325, 234.0, 'yellow', 24, 'Vogue hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 326, 288.0, 'green', 28, 'Vogue light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 327, 96.0, 'purple', 34, 'Vogue double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 328, 172.0, 'yellow', 31, 'Vogue fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 329, 196.0, 'blue', 26, 'Vogue extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 330, 94.0, 'white', 22, 'Vogue chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 331, 246.0, 'purple', 34, 'Pall Mall slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 332, 158.0, 'white', 34, 'Pall Mall mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 333, 276.0, 'blue', 27, 'Pall Mall mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 334, 226.0, 'orange', 33, 'Pall Mall red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 335, 270.0, 'yellow', 21, 'Pall Mall blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 336, 289.0, 'blue', 30, 'Pall Mall cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 337, 193.0, 'purple', 21, 'Pall Mall apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 338, 273.0, 'blue', 22, 'Pall Mall premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 339, 158.0, 'yellow', 28, 'Pall Mall hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 340, 163.0, 'orange', 25, 'Pall Mall light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 341, 135.0, 'green', 27, 'Pall Mall double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 342, 133.0, 'purple', 27, 'Pall Mall fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 343, 205.0, 'red', 30, 'Pall Mall extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 344, 171.0, 'green', 26, 'Pall Mall chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 345, 94.0, 'black', 31, 'Capri slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 346, 90.0, 'blue', 25, 'Capri mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 347, 166.0, 'orange', 24, 'Capri mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 348, 245.0, 'blue', 23, 'Capri red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 349, 232.0, 'yellow', 35, 'Capri blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 350, 264.0, 'orange', 20, 'Capri cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 351, 176.0, 'yellow', 34, 'Capri apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 352, 191.0, 'orange', 17, 'Capri premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 353, 255.0, 'purple', 21, 'Capri hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 354, 266.0, 'orange', 26, 'Capri light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 355, 182.0, 'orange', 29, 'Capri double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 356, 252.0, 'orange', 34, 'Capri fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 357, 152.0, 'black', 25, 'Capri extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 358, 254.0, 'yellow', 20, 'Capri chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 359, 197.0, 'green', 27, 'Viceroy slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 360, 136.0, 'white', 31, 'Viceroy mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 361, 97.0, 'yellow', 17, 'Viceroy mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 362, 97.0, 'blue', 32, 'Viceroy red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 363, 108.0, 'orange', 22, 'Viceroy blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 364, 281.0, 'blue', 22, 'Viceroy cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 365, 146.0, 'red', 28, 'Viceroy apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 366, 235.0, 'purple', 26, 'Viceroy premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 367, 157.0, 'yellow', 26, 'Viceroy hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 368, 287.0, 'white', 32, 'Viceroy light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 369, 186.0, 'purple', 17, 'Viceroy double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 370, 205.0, 'blue', 28, 'Viceroy fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 371, 263.0, 'purple', 33, 'Viceroy extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 372, 97.0, 'yellow', 35, 'Viceroy chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 373, 121.0, 'black', 21, 'Lucky Strike slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 374, 228.0, 'black', 22, 'Lucky Strike mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 375, 104.0, 'white', 15, 'Lucky Strike mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 376, 221.0, 'green', 34, 'Lucky Strike red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 377, 169.0, 'purple', 21, 'Lucky Strike blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 378, 84.0, 'orange', 18, 'Lucky Strike cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 379, 245.0, 'purple', 24, 'Lucky Strike apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 380, 184.0, 'green', 15, 'Lucky Strike premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 381, 113.0, 'black', 17, 'Lucky Strike hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 382, 132.0, 'purple', 23, 'Lucky Strike light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 383, 205.0, 'orange', 29, 'Lucky Strike double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 384, 135.0, 'blue', 35, 'Lucky Strike fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 385, 244.0, 'red', 18, 'Lucky Strike extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 386, 275.0, 'orange', 32, 'Lucky Strike chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 387, 149.0, 'black', 25, 'Rothmans slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 388, 181.0, 'white', 35, 'Rothmans mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 389, 109.0, 'purple', 32, 'Rothmans mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 390, 189.0, 'purple', 18, 'Rothmans red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 391, 135.0, 'black', 31, 'Rothmans blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 392, 168.0, 'black', 17, 'Rothmans cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 393, 138.0, 'red', 32, 'Rothmans apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 394, 174.0, 'green', 16, 'Rothmans premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 395, 160.0, 'red', 25, 'Rothmans hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 396, 102.0, 'blue', 19, 'Rothmans light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 397, 135.0, 'purple', 35, 'Rothmans double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 398, 93.0, 'purple', 16, 'Rothmans fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 399, 155.0, 'yellow', 27, 'Rothmans extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 400, 175.0, 'orange', 15, 'Rothmans chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 401, 102.0, 'orange', 27, 'Alliance slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 402, 100.0, 'red', 34, 'Alliance mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 403, 281.0, 'green', 27, 'Alliance mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 404, 147.0, 'black', 23, 'Alliance red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 405, 261.0, 'red', 20, 'Alliance blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 406, 215.0, 'yellow', 27, 'Alliance cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 407, 193.0, 'orange', 24, 'Alliance apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 408, 143.0, 'blue', 35, 'Alliance premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 409, 174.0, 'blue', 16, 'Alliance hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 410, 117.0, 'green', 28, 'Alliance light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 411, 170.0, 'red', 34, 'Alliance double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 412, 137.0, 'white', 20, 'Alliance fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 413, 246.0, 'green', 21, 'Alliance extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 414, 193.0, 'yellow', 35, 'Alliance chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 415, 148.0, 'red', 35, 'Ява slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 416, 167.0, 'red', 33, 'Ява mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 417, 184.0, 'orange', 28, 'Ява mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 418, 97.0, 'red', 33, 'Ява red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 419, 134.0, 'white', 22, 'Ява blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 420, 226.0, 'yellow', 31, 'Ява cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 421, 252.0, 'red', 17, 'Ява apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 422, 109.0, 'red', 33, 'Ява premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 423, 206.0, 'yellow', 33, 'Ява hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 424, 86.0, 'orange', 29, 'Ява light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 425, 90.0, 'red', 15, 'Ява double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 426, 225.0, 'green', 27, 'Ява fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 427, 296.0, 'black', 35, 'Ява extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 428, 288.0, 'red', 28, 'Ява chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 429, 170.0, 'black', 19, 'Dallas slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 430, 114.0, 'black', 28, 'Dallas mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 431, 174.0, 'orange', 23, 'Dallas mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 432, 271.0, 'red', 21, 'Dallas red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 433, 248.0, 'blue', 20, 'Dallas blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 434, 174.0, 'orange', 30, 'Dallas cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 435, 130.0, 'yellow', 26, 'Dallas apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 436, 176.0, 'blue', 29, 'Dallas premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 437, 233.0, 'green', 24, 'Dallas hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 438, 189.0, 'yellow', 29, 'Dallas light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 439, 257.0, 'blue', 19, 'Dallas double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 440, 202.0, 'green', 23, 'Dallas fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 441, 230.0, 'orange', 18, 'Dallas extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 442, 121.0, 'red', 19, 'Dallas chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 443, 189.0, 'red', 19, 'Золотое Руно slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 444, 249.0, 'green', 27, 'Золотое Руно mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 445, 278.0, 'green', 25, 'Золотое Руно mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 446, 214.0, 'blue', 27, 'Золотое Руно red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 447, 156.0, 'black', 18, 'Золотое Руно blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 448, 190.0, 'green', 16, 'Золотое Руно cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 449, 185.0, 'yellow', 15, 'Золотое Руно apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 450, 168.0, 'blue', 28, 'Золотое Руно premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 451, 187.0, 'white', 26, 'Золотое Руно hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 452, 92.0, 'orange', 24, 'Золотое Руно light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 453, 90.0, 'black', 21, 'Золотое Руно double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 454, 146.0, 'white', 31, 'Золотое Руно fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 455, 178.0, 'blue', 29, 'Золотое Руно extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 456, 147.0, 'purple', 18, 'Золотое Руно chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 457, 282.0, 'blue', 34, 'Captain Black slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 458, 120.0, 'yellow', 21, 'Captain Black mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 459, 245.0, 'green', 21, 'Captain Black mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 460, 172.0, 'purple', 29, 'Captain Black red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 461, 176.0, 'blue', 19, 'Captain Black blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 462, 105.0, 'red', 25, 'Captain Black cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 463, 99.0, 'black', 34, 'Captain Black apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 464, 212.0, 'red', 27, 'Captain Black premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 465, 150.0, 'blue', 34, 'Captain Black hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 466, 261.0, 'green', 18, 'Captain Black light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 467, 208.0, 'white', 32, 'Captain Black double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 468, 154.0, 'purple', 33, 'Captain Black fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 469, 88.0, 'green', 28, 'Captain Black extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 470, 253.0, 'green', 29, 'Captain Black chocolate', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 471, 211.0, 'purple', 19, 'Донской табак slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 472, 209.0, 'white', 26, 'Донской табак mint button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 473, 296.0, 'purple', 33, 'Донской табак mentol', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 474, 276.0, 'blue', 19, 'Донской табак red button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 475, 199.0, 'white', 19, 'Донской табак blue button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 476, 138.0, 'orange', 19, 'Донской табак cherry', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 477, 184.0, 'white', 35, 'Донской табак apple', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 478, 272.0, 'orange', 20, 'Донской табак premium', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 479, 138.0, 'red', 22, 'Донской табак hard', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 480, 198.0, 'white', 16, 'Донской табак light', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 481, 183.0, 'yellow', 18, 'Донской табак double button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 482, 153.0, 'red', 33, 'Донской табак fresh button', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 483, 215.0, 'blue', 31, 'Донской табак extra slim', true);
INSERT INTO public.product (type, id, price, color, weight, description, is_certified) VALUES (1, 484, 268.0, 'red', 27, 'Донской табак chocolate', true);


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

--
-- Roles
--

CREATE ROLE "SimpleDB";
ALTER ROLE "SimpleDB" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md52af331842825ce8845352706931032d7';
CREATE ROLE admin_dan;
ALTER ROLE admin_dan WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md50c2f48d0ed8289953f0b79c460ed15e0';
CREATE ROLE admin_dima;
ALTER ROLE admin_dima WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md548f78cbffcf792af0f90075f90bfeb8f';
CREATE ROLE admins;
ALTER ROLE admins WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE analysts;
ALTER ROLE analysts WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE coders;
ALTER ROLE coders WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE main_managers;
ALTER ROLE main_managers WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE managers;
ALTER ROLE managers WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE sailer_igor;
ALTER ROLE sailer_igor WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5fb2131d7e7c7d36b38a842eacc3069bd';
CREATE ROLE sailers;
ALTER ROLE sailers WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;


--
-- Role memberships
--

GRANT admins TO admin_dan GRANTED BY "SimpleDB";
GRANT admins TO admin_dima GRANTED BY "SimpleDB";
GRANT sailers TO sailer_igor GRANTED BY "SimpleDB";

GRANT SELECT ON TABLE public.branches TO managers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.branches TO coders;
GRANT SELECT ON TABLE public.branches TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.branches TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.branches TO admins;


--
-- Name: TABLE branches_stuff; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.branches_stuff TO coders;
GRANT SELECT ON TABLE public.branches_stuff TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.branches_stuff TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.branches_stuff TO admins;


--
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT ON TABLE public.clients TO sailers;
GRANT SELECT,INSERT,UPDATE ON TABLE public.clients TO managers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.clients TO coders;
GRANT SELECT ON TABLE public.clients TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clients TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.clients TO admins;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT ON TABLE public.orders TO sailers;
GRANT SELECT,INSERT,UPDATE ON TABLE public.orders TO managers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.orders TO coders;
GRANT SELECT ON TABLE public.orders TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.orders TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.orders TO admins;


--
-- Name: TABLE product; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT ON TABLE public.product TO managers;
GRANT SELECT ON TABLE public.product TO sailers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.product TO coders;
GRANT SELECT ON TABLE public.product TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.product TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.product TO admins;


--
-- Name: TABLE product_type; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.product_type TO coders;
GRANT SELECT ON TABLE public.product_type TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.product_type TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.product_type TO admins;


--
-- Name: TABLE status; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.status TO coders;
GRANT SELECT ON TABLE public.status TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.status TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.status TO admins;


--
-- Name: TABLE stock; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT ON TABLE public.stock TO sailers;
GRANT SELECT,INSERT,UPDATE ON TABLE public.stock TO managers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.stock TO coders;
GRANT SELECT ON TABLE public.stock TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.stock TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.stock TO admins;


--
-- Name: TABLE stuff; Type: ACL; Schema: public; Owner: SimpleDB
--

GRANT SELECT ON TABLE public.stuff TO managers;
GRANT SELECT,REFERENCES,TRIGGER ON TABLE public.stuff TO coders;
GRANT SELECT ON TABLE public.stuff TO analysts;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.stuff TO main_managers;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE public.stuff TO admins;





