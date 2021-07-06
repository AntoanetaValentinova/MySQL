CREATE DATABASE `minions`;
USE `minions`;

-- 1. Create Tables
CREATE TABLE `minions` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`age` INT
);

CREATE TABLE `towns` (
	`town_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL
);

-- 2 Alter Minions Table
ALTER TABLE `minions`
ADD COLUMN `town_id` INT,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`);

-- 3 Insert Records in Both Tables
INSERT INTO `towns`(`name`)
VALUES 
('Sofia'),
('Plovdiv'),
('Varna');

INSERT INTO `minions` (`name`,`age`,`town_id`)
VALUES
('Kevin',22,1),
('Bob',15,3),
('Steward',NULL,2);

-- 4 Truncate Table Minions
TRUNCATE `minions`;

-- 5 Drop All Tables
DROP TABLE `minions`;
DROP TABLE `towns`;


-- 6 Create Table People
CREATE TABLE `people` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` FLOAT(5,2),
    `weight` FLOAT(5,2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`,`picture`,`height`,`weight`,`gender`,`birthdate`,`biography`)
VALUES 
('Ivan Ivanov',NULL,172.50,72.50,'m','1993-01-02','biography biography biographybiographybiographybiographybiographybiographybiography'),
('Petar Petrov',NULL,174,74,'m','1994-01-02','biography'),
('Maria Marinova',NULL,170.5,54.5,'f','1991-01-02','biographybiographybiographybiographybiographybiographybiographybiographybiography'),
('Georgi Georgiev',NULL,180.50,72.50,'m','1991-04-20','biography biography biographybiographybiographybiographybiographybiographybiography'),
('Gergana Gocheva',NULL,160,72.50,'f','1987-10-30','biography biography biographybiographybiographybiographybiographybiographybiography');

-- 7 Create Table Users
CREATE TABLE `users` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATETIME ,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`,`password`,`profile_picture`,`last_login_time`,`is_deleted`)
VALUES 
('john','123',NULL, '2021-06-05 02:18:00',true),
('mary','1234',NULL, '2021-06-05 15:18',true),
('bob','12345',NULL, '2021-03-04 02:18',false),
('vivi','123456',NULL, '2021-06-05 02:18',false),
('ally','12334567',NULL, '2021-12-05 02:18',false);

-- 8 Change Primary Key
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY(`id`,`username`);

-- 9 Set Default Value of a Field
ALTER TABLE `users`
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME DEFAULT CURRENT_TIMESTAMP;

-- 10 Set Unique Field
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY(`id`);

ALTER TABLE `users`
CHANGE COLUMN `username` `username` VARCHAR(30) NOT NULL UNIQUE;

-- 11 Movies Database
CREATE DATABASE `Movies`;

CREATE TABLE `directors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`director_name` VARCHAR(50) NOT NULL,
	`notes` TEXT
);

INSERT INTO `directors` (`director_name`,`notes`)
VALUES 
('JOHN1','NOTES1'),
('JOHN2','NOTES2'),
('JOHN3','NOTES3'),
('JOHN4','NOTES4'),
('JOHN5','NOTES5');

CREATE TABLE `genres`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`genre_name` VARCHAR(50) NOT NULL,
	`notes` TEXT
);

INSERT INTO `genres` (`genre_name`,`notes`)
VALUES 
('ACTION','NOTES1'),
('COMEDY','NOTES2'),
('MISTERY','NOTES3'),
('ROMANTIC','NOTES4'),
('DRAMA','NOTES5');

CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`category_name` VARCHAR(50) NOT NULL,
	`notes` TEXT
);

INSERT INTO `categories` (`category_name`,`notes`)
VALUES 
('CATEGORY1','NOTES1'),
('CATEGORY2','NOTES2'),
('CATEGORY3','NOTES3'),
('CATEGORY4','NOTES4'),
('CATEGORY5','NOTES5');

CREATE TABLE `movies`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`title` VARCHAR(50) NOT NULL,
	`director_id` INT,
    `copyright_year` YEAR,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` VARCHAR(5),
    `notes` TEXT
);

INSERT INTO `MOVIES` (`title`,`director_id`,`copyright_year`,`length`,`genre_id`,`category_id`,`rating`,`notes`)
VALUES 
('TITLE1',1,'2021', 144,2,3,'5','note1'),
('TITLE2',5,'2020', 160,5,3,'5','note1'),
('TITLE3',2,'2021', 90,2,1,'5','note1'),
('TITLE4',3,'1992', 21,4,3,'5','note1'),
('TITLE5',4,'2021', 200,3,3,'5','note1')
;

ALTER TABLE `movies` 
ADD CONSTRAINT fk_movies_directors
FOREIGN KEY (`director_id`)
REFERENCES `directors`(`id`);

ALTER TABLE `movies` 
ADD CONSTRAINT fk_movies_genres
FOREIGN KEY (`genre_id`)
REFERENCES `genres`(`id`);

ALTER TABLE `movies` 
ADD CONSTRAINT fk_movies_categories
FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`);

-- 12 Car Rental Database
CREATE DATABASE `car_rental`;

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`category` VARCHAR(50) NOT NULL,
	`daily_rate` DOUBLE (5,2),
	`weekly_rate` DOUBLE (5,2),
	`monthly_rate` DOUBLE (5,2),
	`weekend_rate` DOUBLE (5,2)
);

INSERT INTO `categories`(`category`,`daily_rate`,`weekly_rate`,`monthly_rate`,`weekend_rate`)
VALUES 
('category1',23.64,56.78,70.11,200.11),
('category2',53.64,26.18,50.11,100.11),
('category3',23,56,70,200);

CREATE TABLE `cars`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`plate_number` VARCHAR(50) NOT NULL UNIQUE,
	`make` VARCHAR (50) NOT NULL,
	`model` VARCHAR(50)  NOT NULL,
	`car_year` DATE,
	`category_id` INT NOT NULL,
	`doors` INT,
	`car_condition` VARCHAR (50),
	`available` BOOLEAN
);

INSERT INTO `cars` (`plate_number`,`make`,`model`,`car_year`,`category_id`,`doors`,`car_condition`,`available`)
VALUES 
('121287412AJFB', 'MAKE1', 'MODEL1','1997-12-12',2,4,'CONDITION',true),
('5671287412AJFB', 'MAKE2', 'MODEL2','2020-12-12',2,NULL,NULL,NULL),
('856287412AJFB', 'MAKE3', 'MODEL3','1997-12-12',2,NULL,'CONDITION',NULL);

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `title` VARCHAR(30),
    `notes` TEXT
);

INSERT INTO `employees`(`first_name`,`last_name`,`title`,`notes`)
VALUES 
('JOSH','PETERSON','TITLEONE','NOTEONE'),
('ANNIE','PETERSON','TITLETWO',NULL),
('PETER','JACKSON','TITLETHREE','NOTES');

CREATE TABLE `customers`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `driver_licence_number` VARCHAR(50) NOT NULL UNIQUE,
    `full_name` VARCHAR(50) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `city` VARCHAR(30) NOT NULL,
    `zip_code` INT NOT NULL,
    `notes` TEXT
);

INSERT INTO `customers` (`driver_licence_number`,`full_name`,`address`,`city`,`zip_code`,`notes`)
VALUES
('1245634789567', 'MARY ANDERSON', 'ADDRESSONE', 'CITYONE',3600,'NOTESNOTES'),
('124543636434689567', 'JOHN ANDERSON', 'ADDRESSTWO', 'CITYTWO',1000,'NOTESNOTES'),
('234567834789567', 'PETER BRODERICK', 'ADDRESSTHREE', 'CITYTHREE',1000,'NOTESNOTES');

CREATE TABLE `rental_orders` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `customer_idrental_orders` INT NOT NULL,
    `car_id` INT NOT NULL,
    `car_condition` VARCHAR(50),
    `tank_level` DECIMAL (5,2),
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` BOOLEAN,
    `tax_rate` DECIMAL(5,2),
    `order_status` VARCHAR(10) NOT NULL,
    `notes` TEXT
);

INSERT INTO `rental_orders` (`employee_id`,`customer_id`,`car_id`,`car_condition`,`tank_level`,`kilometrage_start`,`kilometrage_end`,`total_kilometrage`, `start_date`,`end_date`,`total_days`,`rate_applied`,`tax_rate`,`order_status`,`notes`)
VALUES 
(3,1,2,'CONDITION',100,2300,23000,20000,'2020-11-11','2021-12-12',365,TRUE,20,'complited','notes'),
(2,2,2,'CONDITION',200,2300,23000,20000,'2020-11-11','2021-12-12',365,TRUE,20,'complited','notes'),
(1,1,2,'CONDITION',230,2300,23000,20000,'2020-11-11','2021-12-12',365,TRUE,20,'complited','notes'),
(3,3,1,'CONDITION',68,2300,23000,20000,'2020-11-11','2021-12-12',365,TRUE,20,'complited','notes');

-- 13 Basic Insert
CREATE DATABASE `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `addresses` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `address_text` VARCHAR(50) NOT NULL,
    `town_id` INT NOT NULL,
    CONSTRAINT fk_addresses_towns
    FOREIGN KEY (`town_id`)
    REFERENCES `towns`(`id`)
);

CREATE TABLE `departments` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `middle_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `town_id` INT,
    `job_title` VARCHAR(30),
    `department_id` INT,
    `hire_date` DATE,
    `salary` DECIMAL(10,2), 
    `address_id` INT,
    CONSTRAINT fk_employees_towns
    FOREIGN KEY (`town_id`)
    REFERENCES `towns`(`id`),
    CONSTRAINT fk_employees_departments
    FOREIGN KEY (`department_id`)
    REFERENCES `departments`(`id`),
    CONSTRAINT fk_employees_addresses
    FOREIGN KEY (`address_id`)
    REFERENCES `addresses`(`id`)
);

INSERT INTO `towns` (`name`)
VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO `departments` (`name`)
VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');



INSERT INTO `employees` (`first_name`,`middle_name`,`last_name`,`job_title`,`department_id`,`hire_date`,`salary`)
VALUES 
('Ivan', 'Ivanov', 'Ivanov','.NET Developer',4,'2013-02-01',3500.00),
('Petar', 'Petrov', 'Petrov','Senior Engineer',1,'2004-03-02',4000.00),
('Maria', 'Petrova', 'Ivanova','Intern',5,'2016-08-28',525.25),
('Georgi', 'Terziev', 'Ivanov','CEO',2,'2007-12-09',3000.00),
('Peter', 'Pan' ,'Pan','Intern',3,'2016-08-28',599.88);


-- 14 Basic Select
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- 15 Basic Select All Fields and Order Them
SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

-- 16 Basic Select Some Fields
SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`,`last_name`,`job_title`,`salary` FROM `employees`
ORDER BY `salary` DESC;

-- 17 Increase Employees Salary
UPDATE `employees`
SET `salary` = `salary` *1.1;

SELECT `salary` FROM `employees`;

-- 18 Delete All Records



