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
INSERT INTO user (id, login, email) VALUES (UUID_TO_BIN(UUID()), 'aKornalska', 'aKornalska@domain.com');
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
========================================================================================================================
