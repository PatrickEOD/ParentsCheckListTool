create database pclt_db;
use pclt_db;
show tables;

CREATE TABLE user (
id BINARY(16) PRIMARY KEY NOT NULL,
login VARCHAR(70) NOT NULL UNIQUE,
email VARCHAR(255) NOT NULL UNIQUE
);
describe user;

INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'jKowalski', 'j.kowalski@domain.pl');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'eKwiatkowska', 'e.kwiatkowska@domain.com');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', 'a.kornalska@domain.com');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'kHaran', 'k.haran@domain.com');
select BIN_TO_UUID(id) as id, login, email from user;
select * from user;
UPDATE user SET email = 'j.kowalski@domain.pl' WHERE login = 'jKowalski';
UPDATE user SET email = 'e.kwiatkowska@domain.pl' WHERE login = 'eKwiatkowska';
UPDATE user SET email = 'a.kornalska@domain.pl' WHERE login = 'aKornalska';
UPDATE user SET email = 'k.haran@domain.pl' WHERE login = 'kHaran';


CREATE TABLE user_details (
id BINARY(16) PRIMARY KEY NOT NULL,
login VARCHAR(70) NOT NULL UNIQUE,
registration_date DATE NOT NULL,
name VARCHAR(100),
surname VARCHAR(120),
birth_date DATE,
FOREIGN KEY (login) REFERENCES user(login)
);
describe user_details;

INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'jKowalski', '2019-03-12', 'Jan', 'Kowalski', '1980-07-17');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'eKwiatkowska', '2019-04-02', 'Elwira', 'Kwiatkowska', '1989-02-27');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', '2019-04-04', 'Anna', 'Kornalska', '1991-09-01');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'kHaran', '2019-03-15', 'Karolina', 'Haran', '1988-04-20');
select BIN_TO_UUID(id) as id, login, registration_date, name, surname, birth_date from user_details;

CREATE TABLE passwds (
id BINARY(16) NOT NULL PRIMARY KEY,
login VARCHAR(70) NOT NULL UNIQUE,
passwd BLOB NOT NULL,
FOREIGN KEY (login) REFERENCES user(login)
);
INSERT INTO passwds (id, login, passwd) VALUES (UUID_TO_BIN(UUID()), 'jKowalski', AES_ENCRYPT('jKowalskiPassword', 'customSalt'));
INSERT INTO passwds (id, login, passwd) VALUES (UUID_TO_BIN(UUID()), 'eKwiatkowska', AES_ENCRYPT('eKwiatkowskaPassword', 'customSalt'));
INSERT INTO passwds (id, login, passwd) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', AES_ENCRYPT('aKornalskaPassword', 'customSalt'));
INSERT INTO passwds (id, login, passwd) VALUES (UUID_TO_BIN(UUID()), 'kHaran', AES_ENCRYPT('kHaranPassword', 'customSalt'));
truncate table passwds;
select * from passwds;
select AES_DECRYPT(passwd, 'customSalt') as unecrptedPasswd, BIN_TO_UUID(id) as id, login from passwds;

CREATE TABLE img_src (
id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(120),
img varchar(250)
);
INSERT INTO img_src (id, name, img) VALUES (UUID_TO_BIN(UUID()), 'chusteczki_nawilzane', LOAD_FILE('C:/DataMatrix/Projects/Proj1_ParentsCheckListTool/workspace/ParentsCheckListToolAPI/web/images/shopping_list/chusteczki_nawilzane.png')); 
INSERT INTO img_src (id, name, img) VALUES (UUID_TO_BIN(UUID()), 'chusteczki_nawilzane', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pclt_db_upload/chusteczki_nawilzane')); 
INSERT INTO img_src (id, name, img) VALUES (UUID_TO_BIN(UUID()), 'chusteczki_nawilzane', 'web/images/shopping_list/chusteczki_nawilzane.png');
INSERT INTO img_src (id, name, img) VALUES (1, 'chusteczki_nawilzane', 'web/images/shopping_list/chusteczki_nawilzane.png');
select * from img_src;
select BIN_TO_UUID(id) id, name, img from img_src;
truncate table img_src;
drop table img_src;
set foreign_key_checks = 0;
set foreign_key_checks = 1;

CREATE TABLE categories (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(120)
);

CREATE TABLE shopingList_categories (
shoppingList_id INTEGER NOT NULL,
categories_id INTEGER NOT NULL,
FOREIGN KEY (shoppingList_id) REFERENCES shopping_list(id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (categories_id) REFERENCES categories(id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (shoppingList_id, categories_id)
);

CREATE TABLE shopping_list (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
item_name VARCHAR(250) NOT NULL UNIQUE,
item_price_from DECIMAL(10,2),
item_price_to DECIMAL(10,2),
currency VARCHAR(50),
recomm_amount DECIMAL(10,2),
imgSrc_id INTEGER,
description TEXT,
characteristic TEXT,
category VARCHAR(120),
FOREIGN KEY (imgSrc_id) REFERENCES img_src(id)
);
drop table shopping_list;
describe shopping_list;
