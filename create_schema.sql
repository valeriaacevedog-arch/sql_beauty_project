CREATE DATABASE IF NOT EXISTS beautydb;
USE beautydb;

CREATE TABLE IF NOT EXISTS beauty_sephora (
product_id INT PRIMARY KEY,
product_id,
product_name,
brand_id,
brand_name,
loves_count,
rating,
reviews,
size,
variation_type,
variation_value,
ingredients,
price_usd,
limited_edition,
new,
online_only,
out_of_stock,
sephora_exclusive,
highlights,
primary_category,
secondary_category,
tertiary_category,
child_count
);

CREATE TABLE IF NOT EXISTS beauty_world(
product_name,
price_usd,
rating,
number_of_reviews
gender_target
cruelty_free
);


CREATE TABLE IF NOT EXISTS passengers (
passenger_id INT PRIMARY KEY,
name VARCHAR(100),
class_id INT,
port_id INT,
age FLOAT,
survived TINYINT,
FOREIGN KEY (class_id) REFERENCES ticket_class(class_id),
FOREIGN KEY (port_id) REFERENCES port(port_id)
);