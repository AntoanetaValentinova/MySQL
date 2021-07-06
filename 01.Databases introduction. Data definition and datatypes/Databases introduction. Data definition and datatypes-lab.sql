-- 1 Create database and tables
CREATE DATABASE `gamebar`;

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `products`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `category_id` INT NOT NULL
);


-- 2 insert data in tables
INSERT INTO `employees` (`first_name`, `last_name`) 
VALUES 
('Ivan','Ivanov'),
('Georgi','Georgiev'),
('Petar','Petrov');


-- 3 alter table
ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(50) NOT NULL;

-- 4 Adding Constraints
ALTER TABLE `products`
ADD CONSTRAINT fk_products_categories 
FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`);  

-- 4 Modifying Columns
ALTER TABLE `employees`
MODIFY `middle_name` VARCHAR(100) NOT NULL;









