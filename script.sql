CREATE TABLE virtual_machines(
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    operational_system VARCHAR(64) NOT NULL,
    provider VARCHAR(64) NOT NULL,
    ip INET NOT NULL
);

CREATE TABLE source_computers(
    id SERIAL PRIMARY KEY,
    name varchar(64),
    operational_system VARCHAR(64) NOT NULL,
    ip INET NOT NULL
);

CREATE TABLE employee(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE ssh_access(
    id SERIAL PRIMARY KEY,
    accessed_at TIMESTAMP NOT NULL,
    virtual_machine_id INT REFERENCES virtual_machines(id) NOT NULL,
    source_computer_id INT references source_computers(id) NOT NULL,
    employee_id INT references employee(id) NOT NULL
);

INSERT INTO employee(name) VALUES ('John Doe');
INSERT INTO employee(name) VALUES ('Dwide Stingford');
INSERT INTO employee(name) VALUES ('Roshell Waterson');
INSERT INTO employee(name) VALUES ('Bill Smith');

INSERT INTO source_computers(name, operational_system, ip) VALUES ('PC-1', 'Alpine', '192.168.0.1');
INSERT INTO source_computers(name, operational_system, ip) VALUES ('PC-2', 'Windows 10', '192.168.0.2');
INSERT INTO source_computers(name, operational_system, ip) VALUES ('PC-3', 'Mac OS', '192.168.0.3');
INSERT INTO source_computers(name, operational_system, ip) VALUES ('PC-4', 'Colibri', '192.168.0.4');

INSERT INTO virtual_machines(name, operational_system, provider, ip) VALUES ('PC-5', 'Ubuntu', 'OVH', '192.168.0.5');
INSERT INTO virtual_machines(name, operational_system, provider, ip) VALUES ('PC-6', 'Mint', 'Amazon', '192.168.0.6');
INSERT INTO virtual_machines(name, operational_system, provider, ip) VALUES ('PC-7', 'Arch', 'Yandex cloud', '192.168.0.7');
INSERT INTO virtual_machines(name, operational_system, provider, ip) VALUES ('PC-8', 'Windows 9', 'Google cloud', '192.168.0.8');

INSERT INTO ssh_access(accessed_at, virtual_machine_id, source_computer_id, employee_id) VALUES (now(), 1, 2, 3);
INSERT INTO ssh_access(accessed_at, virtual_machine_id, source_computer_id, employee_id) VALUES (now(), 2, 3, 1);
INSERT INTO ssh_access(accessed_at, virtual_machine_id, source_computer_id, employee_id) VALUES (now(), 4, 1, 2);

-- MADE BY KOZHEMYAKIN DANILA BBSO-02-20 --