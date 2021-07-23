CREATE DATABASE `SoftUniStoresSystem`;
USE `SoftUniStoresSystem`;

-- Section 1: Data Definition Language (DDL) – 40 pts

-- 1. Table Design
CREATE TABLE `towns`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `addresses`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `town_id` INT NOT NULL,
    CONSTRAINT fk_addresses_towns
    FOREIGN KEY (`town_id`)
    REFERENCES `towns`(`id`)
);

CREATE TABLE `stores`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) UNIQUE NOT NULL,
    `rating` FLOAT NOT NULL,
    `has_parking` TINYINT(1) DEFAULT FALSE,
    `address_id` INT NOT NULL,
    CONSTRAINT fk_stores_addresses
    FOREIGN KEY (`address_id`)
    REFERENCES `addresses`(`id`)
);

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(15) NOT NULL,
    `middle_name` CHAR(1),
	`last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(19,2) DEFAULT 0 NOT NULL,
    `hire_date` DATE NOT NULL,
    `manager_id` INT,
    `store_id` INT NOT NULL,
    CONSTRAINT fk_employees_stores
    FOREIGN KEY (`store_id`)
    REFERENCES `stores`(`id`),
    CONSTRAINT fk_employees_managers
    FOREIGN KEY (`manager_id`)
    REFERENCES `employees`(`id`)
);

CREATE TABLE `pictures` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `url` VARCHAR(100) NOT NULL,
    `added_on` DATETIME NOT NULL
);

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE `products` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL UNIQUE,
    `best_before` DATE,
    `price` DECIMAL(10,2) NOT NULL,
    `description` TEXT,
    `category_id` INT NOT NULL,
    `picture_id` INT NOT NULL,
    CONSTRAINT fk_products_categories
    FOREIGN KEY (`category_id`)
    REFERENCES `categories`(`id`),
    CONSTRAINT fk_products_pictures
    FOREIGN KEY (`picture_id`)
    REFERENCES `pictures`(`id`)
);

CREATE TABLE `products_stores` (
    `product_id` INT NOT NULL,
    `store_id` INT NOT NULL,
    CONSTRAINT pk_products_stores
    PRIMARY KEY (`product_id`,`store_id`),
    CONSTRAINT fk_products_stores_products
    FOREIGN KEY (`product_id`)
    REFERENCES `products`(`id`),
    CONSTRAINT fk_products_stores_stores
    FOREIGN KEY (`store_id`)
    REFERENCES `stores`(`id`)
);

insert into pictures (id, url, added_on) values (1, 'http://dummyimage.com/102x210.jpg/cc0000/ffffff', '2019-12-31 04:02:09');
insert into pictures (id, url, added_on) values (2, 'http://dummyimage.com/184x230.jpg/ff4444/ffffff', '2020-01-21 06:50:01');
insert into pictures (id, url, added_on) values (3, 'http://dummyimage.com/243x132.jpg/cc0000/ffffff', '2018-11-14 07:43:32');
insert into pictures (id, url, added_on) values (4, 'http://dummyimage.com/113x194.jpg/5fa2dd/ffffff', '2019-10-21 05:46:54');
insert into pictures (id, url, added_on) values (5, 'http://dummyimage.com/241x194.jpg/5fa2dd/ffffff', '2018-10-03 15:44:27');
insert into pictures (id, url, added_on) values (6, 'http://dummyimage.com/119x189.jpg/dddddd/000000', '2020-04-22 02:28:19');
insert into pictures (id, url, added_on) values (7, 'http://dummyimage.com/235x227.jpg/cc0000/ffffff', '2018-10-02 16:53:52');
insert into pictures (id, url, added_on) values (8, 'http://dummyimage.com/208x226.jpg/cc0000/ffffff', '2018-08-21 21:35:00');
insert into pictures (id, url, added_on) values (9, 'http://dummyimage.com/102x172.jpg/cc0000/ffffff', '2020-02-28 21:45:35');
insert into pictures (id, url, added_on) values (10, 'http://dummyimage.com/171x139.jpg/ff4444/ffffff', '2020-06-12 22:54:29');
insert into pictures (id, url, added_on) values (11, 'http://dummyimage.com/204x242.jpg/5fa2dd/ffffff', '2019-08-19 23:00:33');
insert into pictures (id, url, added_on) values (12, 'http://dummyimage.com/145x238.jpg/dddddd/000000', '2019-02-17 01:57:52');
insert into pictures (id, url, added_on) values (13, 'http://dummyimage.com/189x151.jpg/dddddd/000000', '2018-10-01 22:12:36');
insert into pictures (id, url, added_on) values (14, 'http://dummyimage.com/249x208.jpg/cc0000/ffffff', '2018-12-04 16:53:24');
insert into pictures (id, url, added_on) values (15, 'http://dummyimage.com/114x161.jpg/ff4444/ffffff', '2018-04-12 16:15:54');
insert into pictures (id, url, added_on) values (16, 'http://dummyimage.com/221x111.jpg/cc0000/ffffff', '2019-01-28 09:46:22');
insert into pictures (id, url, added_on) values (17, 'http://dummyimage.com/193x103.jpg/ff4444/ffffff', '2018-11-21 07:51:15');
insert into pictures (id, url, added_on) values (18, 'http://dummyimage.com/178x248.jpg/5fa2dd/ffffff', '2020-01-06 23:45:02');
insert into pictures (id, url, added_on) values (19, 'http://dummyimage.com/243x233.jpg/cc0000/ffffff', '2018-12-18 04:40:51');
insert into pictures (id, url, added_on) values (20, 'http://dummyimage.com/197x104.jpg/cc0000/ffffff', '2018-07-28 01:43:34');


insert into categories values
(1, 'foods'),
(2, 'drinks'),
(3, 'clothes'),
(4, 'others'),
(5, 'vehicles');


insert into towns (id, name) values 
(1, 'Sofia'),
(2, 'Plovdiv'), 
(3, 'Varna'),
(4, 'Burgas'),
(5, 'Blagoevgrad'),
(6, 'Vidin'),
(7, 'Lovech'),
(8, 'Pleven'),
(9, 'Silistra'),
(10, 'Razgrad'),
(11, 'Gabrovo'),
(12, 'Sliven'),
(13, 'Dobrich'),
(14, 'Shumen'),
(15, 'Ruse'),
(16, 'Pazardjik'),
(17, 'Nesebar'),
(18, 'Sozopol'),
(19, 'Sandanski'),
(20, 'Pamporovo');

insert into addresses (id, name, town_id) values (1, '1 Cody Pass', 13);
insert into addresses (id, name, town_id) values (2, '07 Armistice Parkway', 4);
insert into addresses (id, name, town_id) values (3, '2388 Erie Drive', 4);
insert into addresses (id, name, town_id) values (4, '4 Hansons Way', 15);
insert into addresses (id, name, town_id) values (5, '96 Pankratz Drive', 8);
insert into addresses (id, name, town_id) values (6, '51515 Loftsgordon Trail', 14);
insert into addresses (id, name, town_id) values (7, '29395 Larry Pass', 17);
insert into addresses (id, name, town_id) values (8, '396 Summerview Center', 18);
insert into addresses (id, name, town_id) values (9, '2217 Fieldstone Court', 20);
insert into addresses (id, name, town_id) values (10, '0155 Morningstar Junction', 1);
insert into addresses (id, name, town_id) values (11, '789 Lien Plaza', 5);
insert into addresses (id, name, town_id) values (12, '83637 Reinke Alley', 6);
insert into addresses (id, name, town_id) values (13, '1656 Anniversary Way', 14);
insert into addresses (id, name, town_id) values (14, '91 Bayside Pass', 1);
insert into addresses (id, name, town_id) values (15, '35952 Stoughton Circle', 5);
insert into addresses (id, name, town_id) values (16, '61346 Melody Lane', 6);
insert into addresses (id, name, town_id) values (17, '32759 Dwight Plaza', 5);
insert into addresses (id, name, town_id) values (18, '6 Caliangt Parkway', 8);
insert into addresses (id, name, town_id) values (19, '18645 Hollow Ridge Drive', 14);
insert into addresses (id, name, town_id) values (20, '816 Old Gate Point', 17);

insert into stores (id, name, rating, has_parking, address_id) values (1, 'Wrapsafe', 7.1, false, 20);
insert into stores (id, name, rating, has_parking, address_id) values (2, 'Solarbreeze', 2.3, true, 1);
insert into stores (id, name, rating, has_parking, address_id) values (3, 'Regrant', 1.2, false, 18);
insert into stores (id, name, rating, has_parking, address_id) values (4, 'Aerified', 6.5, false, 4);
insert into stores (id, name, rating, has_parking, address_id) values (5, 'Cardguard', 6.8, false, 16);
insert into stores (id, name, rating, has_parking, address_id) values (6, 'Duobam', 8.1, false, 15);
insert into stores (id, name, rating, has_parking, address_id) values (7, 'Keylex', 3.6, false, 14);
insert into stores (id, name, rating, has_parking, address_id) values (8, 'Alphazap', 6.5, true, 6);
insert into stores (id, name, rating, has_parking, address_id) values (9, 'Flexidy', 7.3, true, 12);
insert into stores (id, name, rating, has_parking, address_id) values (10, 'Bitwolf', 8.5, true, 8);
insert into stores (id, name, rating, has_parking, address_id) values (11, 'Home Ing', 6.3, true, 10);
insert into stores (id, name, rating, has_parking, address_id) values (12, 'SafeWithUs', 2.0, false, 9);
insert into stores (id, name, rating, has_parking, address_id) values (13, 'Konklab', 5.5, true, 11);
insert into stores (id, name, rating, has_parking, address_id) values (14, 'Veribet', 7.6, true, 7);
insert into stores (id, name, rating, has_parking, address_id) values (15, 'Zaam-Dox', 7.4, false, 13);
insert into stores (id, name, rating, has_parking, address_id) values (16, 'Lotstring', 8.2, false, 5);
insert into stores (id, name, rating, has_parking, address_id) values (17, 'Stronghold', 5.1, true, 17);
insert into stores (id, name, rating, has_parking, address_id) values (18, 'DuoStore', 7.8, false, 3);
insert into stores (id, name, rating, has_parking, address_id) values (19, 'Transcof', 3.0, false, 2);
insert into stores (id, name, rating, has_parking, address_id) values (20, 'Voltsillam', 9.9, false, 19);

insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (1, 'Clemence', 'F', 'Darthe', '9253.81', '2008-10-12', NULL, 18);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (2, 'Florian', 'E', 'Bamlet', '6266.27', '2018-02-19', NULL, 14);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (3, 'Carolyn', 'Q', 'Dyett', '1223.45', '2000-02-23', NULL, 5);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (4, 'Eba', 'X', 'Oleszkiewicz', '5268.40', '2015-02-09', NULL, 5);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (5, 'Fletch', 'Y', 'de Najera', '2144.71', '2007-04-14', NULL, 8);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (6, 'Roz', 'U', 'Dewdney', '9316.56', '2018-10-20', NULL, 6);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (7, 'Shae', 'O', 'Fasey', '7463.52', '2018-02-03', NULL, 12);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (8, 'Breena', 'S', 'Hymans', '7849.65', '2017-03-15', NULL, 17);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (9, 'Jonie', 'J', 'McNicol', '3597.01', '2012-01-11', NULL, 4);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (10, 'Goldina', 'G', 'Seabrocke', '3285.16', '2009-03-17', NULL, 17);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (11, 'Rhona', 'Q', 'Pettwood', '2651.20', '2011-04-08', NULL, 5);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (12, 'Jacintha', 'S', 'Polly', '2505.62', '2009-10-27', NULL, 7);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (13, 'Elwin', 'G', 'Rennock', '9538.20', '2017-05-12', NULL, 12);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (14, 'Dierdre', 'B', 'Jaggard', '3943.56', '2014-09-25', NULL, 4);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (15, 'Richy', 'E', 'Cady', '3091.96', '2002-12-21', NULL, 19);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (16, 'Rube', 'F', 'Daveren', '1028.20', '2014-02-24', NULL, 19);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (17, 'Faun', 'U', 'Winkworth', '6709.77', '2007-05-06', NULL, 1);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (18, 'Xylina', 'W', 'Apfelmann', '6845.08', '2013-05-03', NULL, 7);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (19, 'Frasquito', 'Y', 'Wimpey', '9124.43', '2011-11-25', NULL, 12);
insert into employees (id, first_name, middle_name, last_name, salary, hire_date, manager_id, store_id) values (20, 'Leigh', 'D', 'Vedenyakin', '2159.55', '2002-07-11', NULL, 17);

insert into products (id, name, best_before, price, description, category_id, picture_id) values (1, 'Container Clear 8 Oz', '2020-04-05', 6.12, 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 4, 4);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (2, 'Oil - Sunflower', '2019-10-25', 48.0, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 4, 19);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (3, 'Goat - Whole Cut', '2020-08-15', 39.78, 'Mauris ullamcorper purus sit amet nulla.', 1, 2);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (4, 'Cranberries - Fresh', '2019-10-18', 23.21, 'In hac habitasse platea dictumst.', 2, 3);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (5, 'Bamboo Shoots - Sliced', '2020-05-27', 14.46, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1, 1);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (6, 'Pasta - Bauletti, Chicken White', '2020-02-08', 48.85, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 1, 5);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (7, 'Lemonade - Mandarin, 591 Ml', '2020-04-03', 25.53, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 2, 8);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (8, 'Daikon Radish', '2019-12-28', 29.95, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 4, 10);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (9, 'Ostrich - Fan Fillet', '2019-10-08', 42.63, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 1, 6);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (10, 'Rabbit - Saddles', '2020-04-19', 32.01, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 1, 11);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (11, 'Green Scrubbie Pad H.duty', '2020-05-21', 31.29, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 4, 7);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (12, 'Chicken - Whole', '2020-05-25', 3.76, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 1, 9);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (13, 'Rice - Wild', '2019-12-21', 18.85, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1, 15);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (14, 'Pork - Back, Short Cut, Boneless', '2020-02-16', 32.83, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1, 13);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (15, 'Spic And Span All Purpose', '2020-05-31', 36.53, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 4, 14);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (16, 'Soup - Cream Of Potato / Leek', '2020-07-29', 26.41, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 1, 12);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (17, 'Wine - Ruffino Chianti Classico', '2020-03-03', 21.63, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 2, 18);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (18, 'Food Colouring - Green', '2020-03-12', 34.18, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 1, 17);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (19, 'Sour Puss Raspberry', '2019-09-03', 37.93, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1, 16);
insert into products (id, name, best_before, price, description, category_id, picture_id) values (20, 'Sugar - White Packet', '2019-11-14', 40.89, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 1, 20);


insert into products_stores (product_id, store_id) values (17, 2);
insert into products_stores (product_id, store_id) values (19, 20);
insert into products_stores (product_id, store_id) values (7, 9);
insert into products_stores (product_id, store_id) values (11, 12);
insert into products_stores (product_id, store_id) values (7, 17);
insert into products_stores (product_id, store_id) values (6, 10);
insert into products_stores (product_id, store_id) values (1, 14);
insert into products_stores (product_id, store_id) values (2, 18);
insert into products_stores (product_id, store_id) values (15, 19);
insert into products_stores (product_id, store_id) values (12, 11);
insert into products_stores (product_id, store_id) values (4, 5);
insert into products_stores (product_id, store_id) values (8, 15);
insert into products_stores (product_id, store_id) values (8, 13);
insert into products_stores (product_id, store_id) values (19, 18);
insert into products_stores (product_id, store_id) values (14, 3);
insert into products_stores (product_id, store_id) values (1, 11);
insert into products_stores (product_id, store_id) values (3, 7);
insert into products_stores (product_id, store_id) values (11, 3);
insert into products_stores (product_id, store_id) values (5, 14);
insert into products_stores (product_id, store_id) values (15, 18);
insert into products_stores (product_id, store_id) values (4, 12);
insert into products_stores (product_id, store_id) values (20, 6);
insert into products_stores (product_id, store_id) values (6, 8);
insert into products_stores (product_id, store_id) values (14, 13);
insert into products_stores (product_id, store_id) values (1, 18);
insert into products_stores (product_id, store_id) values (2, 8);
insert into products_stores (product_id, store_id) values (4, 2);
insert into products_stores (product_id, store_id) values (2, 6);
insert into products_stores (product_id, store_id) values (11, 11);

-- Section 2: Data Manipulation Language (DML) – 30 pts

-- 2. Insert
INSERT INTO `products_stores`(`product_id`,`store_id`)
SELECT p.`id` AS `product_id`,1 AS `store_id` FROM `products` AS p
LEFT JOIN `products_stores` as ps
ON p.`id`=ps.`product_id`
WHERE ps.`product_id` IS NULL;

-- 3. Update
UPDATE `employees` AS e
        LEFT JOIN
    `stores` AS s ON e.`store_id` = s.`id` 
SET 
    e.`salary` = e.`salary` - 500,
    e.`manager_id` = 3
WHERE
    YEAR(`hire_date`) > '2003'
        AND s.`name` NOT IN ('Cardguard' , 'Veribet');

-- 4. Delete
DELETE FROM `employees` 
WHERE
    `manager_id` IS NOT NULL
    AND `salary` >= 6000;

-- 5. Employees
SELECT 
    `first_name`,
    `middle_name`,
    `last_name`,
    `salary`,
    `hire_date`
FROM
    `employees`
ORDER BY `hire_date` DESC; 

-- 6. Products with old pictures
SELECT 
    p.`name` AS `product_name`,
    p.`price`,
    p.`best_before`,
    CONCAT(SUBSTRING(p.`description`, 1, 10), '...') AS `short_description`,
    pic.`url`
FROM
    `products` AS p
        JOIN
    `pictures` AS pic ON p.`picture_id` = pic.`id`
WHERE
    CHAR_LENGTH(`description`) > 100
        AND YEAR(`added_on`) < 2019
        AND p.`price` > 20
ORDER BY p.`price` DESC;


-- 7. Counts of products in stores and their average 
SELECT 
    s.`name`,
    COUNT(p.`id`) AS `product_count`,
    ROUND(AVG(p.`price`), 2) AS `avg`
FROM
    `stores` AS s
        LEFT JOIN
    `products_stores` AS ps ON s.`id` = ps.`store_id`
        LEFT JOIN
    `products` AS p ON p.`id` = ps.`product_id`
GROUP BY s.`name`
ORDER BY `product_count` DESC , `avg` DESC , s.`id`;

-- 8. Specific employee
SELECT 
    CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS `Full_name`,
    s.`name` AS `Store_name`,
    a.`name` AS `address`,
    e.`salary`
FROM
    `employees` AS e
        LEFT JOIN
    `stores` AS s ON e.`store_id` = s.`id`
        LEFT JOIN
    `addresses` AS a ON s.`address_id` = a.`id`
WHERE
    e.`salary` < 4000
        AND a.`name` LIKE '%5%'
        AND CHAR_LENGTH(s.`name`) > 8
        AND e.`last_name` LIKE '%n';


-- 9. Find all information of stores
SELECT 
    REVERSE(s.`name`),
    CONCAT_WS('-', UPPER(t.`name`), a.`name`) AS `full_address`,
    COUNT(e.`id`) AS `employees_count`
FROM
    `stores` AS s
        LEFT JOIN
    `addresses` AS a ON s.`address_id` = a.`id`
        LEFT JOIN
    `towns` AS t ON a.`town_id` = t.`id`
        LEFT JOIN
    `employees` AS e ON s.`id` = e.`store_id`
GROUP BY s.`id`
HAVING `employees_count` > 0
ORDER BY `full_address`;

-- Section 4: Programmability – 30 pts

-- 10. Find full name of top paid employee by store name
DELIMITER $$

CREATE FUNCTION udf_top_paid_employee_by_store(`store_name` VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	RETURN (SELECT CONCAT(e.`first_name`,' ',e.`middle_name`,'. ',e.`last_name`,' works in store for ', FLOOR(DATEDIFF('2020-10-18',e.`hire_date`)/365),' years') FROM `employees` AS e
	JOIN `stores` AS s
	ON e.`store_id`=s.`id`
	WHERE s.`name`=`store_name`
	ORDER BY e.`salary` DESC
	LIMIT 1);
END$$

DELIMITER ;


SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
SELECT udf_top_paid_employee_by_store('Keylex') as 'full_info';

-- 11. Update product price by address
DELIMITER $$

CREATE PROCEDURE udp_update_product_price (`address_name` VARCHAR (50))
BEGIN
	UPDATE `products` AS p
	JOIN `products_stores` AS ps
	ON p.`id`=ps.`product_id`
	JOIN `stores` AS s
	ON ps.`store_id`=s.`id`
	JOIN `addresses` AS a
	ON s.`address_id`=a.`id`
	SET p.price=IF(`address_name` LIKE '0%', p.`price`+100, p.`price`+200)
	WHERE a.`name`=`address_name`;
END$$
DELIMITER ;

CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;




