CREATE DATABASE lab4;

USE lab4;

-- CREATE TABLE User(
-- 	uid INT PRIMARY KEY auto_increment,
--     username VARCHAR(100),
--     fname VARCHAR(100),
--     lname VARCHAR(100)
-- );

CREATE TABLE Games(
	gid INT PRIMARY KEY auto_increment,
    gname VARCHAR(100)
);

INSERT INTO Games VALUES (gid,'Gears of War');

CREATE INDEX Lab4View ON Games(gname);

CREATE USER 'newu'@'localhost' IDENTIFIED BY '41PDMa1$1';

GRANT SELECT, DELETE, INSERT ON lab4.* TO 'newu'@'localhost';