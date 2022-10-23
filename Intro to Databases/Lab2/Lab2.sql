CREATE DATABASE CSC315Lab2;

USE CSC315Lab2;

CREATE TABLE Suppliers(
sid INTEGER,
sname VARCHAR(40),
address VARCHAR(40),
PRIMARY KEY(sid)
);

CREATE TABLE Parts(
pid INTEGER,
pname VARCHAR(40),
color VARCHAR(20),
PRIMARY KEY(pid)
);

CREATE TABLE Catalog(
sid_fk INTEGER,
pid_fk INTEGER,
cost REAL,
PRIMARY KEY(sid_fk, pid_fk),
FOREIGN KEY(sid_fk) REFERENCES Suppliers(sid),
FOREIGN KEY(pid_fk) REFERENCES Parts(pid)
);

INSERT INTO Suppliers(sid, sname, address) VALUES (1, 'Coffee Maker', '123 Bellvue');
INSERT INTO Suppliers(sid, sname, address) VALUES (2, 'Air Controller', '32 Nowhere');
INSERT INTO Suppliers(sid, sname, address) VALUES (3, 'Acme Widget Suppliers', '425 Acme Street');
INSERT INTO Suppliers(sid, sname, address) VALUES (4, 'Bags', '234 Luggage Street');

INSERT INTO Parts(pid, pname, color) VALUES (1, 'Coffee Beans', 'brown');
INSERT INTO Parts(pid, pname, color) VALUES (2, 'machine', 'silver');
INSERT INTO Parts(pid, pname, color) VALUES (3, 'pen', 'red');
INSERT INTO Parts(pid, pname, color) VALUES (4, 'clock', 'green');

INSERT INTO Catalog(sid_fk, pid_fk, cost) VALUES (1, 1, 42.43);
INSERT INTO Catalog(sid_fk, pid_fk, cost) VALUES (2, 2, 300.00);
INSERT INTO Catalog(sid_fk, pid_fk, cost) VALUES (3, 3, 3.99);
INSERT INTO Catalog(sid_fk, pid_fk, cost) VALUES (4, 4, 69.98);
