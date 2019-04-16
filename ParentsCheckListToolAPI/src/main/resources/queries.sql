create database pclt_db;
use pclt_db;

========================================================================================================================

CREATE TABLE user (
    id BINARY(16) PRIMARY KEY NOT NULL,
    login VARCHAR(70) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'jKowalski', 'j.kowalski@domain.pl');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'eKwiatkowska', 'e.kwiatkowska@domain.com');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', 'a.kornalska@domain.com');
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'kHaran', 'k.haran@domain.com');
========================================================================================================================

CREATE TABLE user_details (
                              id BINARY(16) PRIMARY KEY NOT NULL,
                              login VARCHAR(70) NOT NULL UNIQUE,
                              registration_date DATE NOT NULL,
                              name VARCHAR(100),
                              surname VARCHAR(120),
                              birth_date DATE,
                              FOREIGN KEY (login) REFERENCES user(login)
);

INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'jKowalski', '2019-03-12', 'Jan', 'Kowalski', '1980-07-17');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'eKwiatkowska', '2019-04-02', 'Elwira', 'Kwiatkowska', '1989-02-27');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', '2019-04-04', 'Anna', 'Kornalska', '1991-09-01');
INSERT INTO user_details (id, login, registration_date, name, surname, birth_date) VALUES (UUID_TO_BIN(UUID()), 'kHaran', '2019-03-15', 'Karolina', 'Haran', '1988-04-20');

========================================================================================================================

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

========================================================================================================================
