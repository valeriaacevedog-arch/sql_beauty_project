CREATE DATABASE IF NOT EXISTS beautydb;
USE beautydb;

CREATE TABLE IF NOT EXISTS country(
country_id INT,
country_name VARCHAR (15),
eu ENUM('yes','no'),
PRIMARY KEY (country_id)
);

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE country;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO country (country_id, country_name, eu) VALUES
(1, 'Australia', 'no'),
(2, 'France', 'yes'),
(3, 'Germany', 'yes'),
(4, 'Italy', 'yes'),
(5, 'Japan', 'no'),
(6, 'South Korea', 'no'),
(7, 'UK', 'no'),
(8, 'USA', 'no');

CREATE TABLE IF NOT EXISTS category(
category_id INT,
category_name VARCHAR (20),
PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS gender(
gender_id INT,
gender_name ENUM('female','male','unisex'),
PRIMARY KEY (gender_id)
);

CREATE TABLE IF NOT EXISTS beauty_sephora (
product_id  VARCHAR(20) NOT NULL,
product_name VARCHAR(200),
price_usd DECIMAL(8,2),
rating DECIMAL(4,2),
reviews INT,
category_id INT,
PRIMARY KEY (product_id),
FOREIGN KEY (category_id) REFERENCES category(category_id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS beauty_world (
product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_name VARCHAR (50),
price_usd DECIMAL (10,2),
rating DECIMAL (3,2),
number_of_reviews INT,
gender_target VARCHAR (10),
cruelty_free VARCHAR (10),
country_of_origin VARCHAR (15),
gender_id INT,
country_id INT,
FOREIGN KEY (country_id) REFERENCES country (country_id),
FOREIGN KEY (gender_id) REFERENCES gender (gender_id)
);
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE country;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO country (country_id, country_name, eu) VALUES
(1, 'Australia', 'no'),
(2, 'France', 'yes'),
(3, 'Germany', 'yes'),
(4, 'Italy', 'yes'),
(5, 'Japan', 'no'),
(6, 'South Korea', 'no'),
(7, 'UK', 'no'),
(8, 'USA', 'no');


