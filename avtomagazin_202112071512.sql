﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.689.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 07.12.2021 15:12:39
-- Server version: 8.0.27
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE avtomagazin;

--
-- Drop table `клиенты`
--
DROP TABLE IF EXISTS клиенты;

--
-- Drop table ` model avto`
--
DROP TABLE IF EXISTS ` model avto`;

--
-- Drop table `коробка передач`
--
DROP TABLE IF EXISTS `коробка передач`;

--
-- Drop table `обивка`
--
DROP TABLE IF EXISTS обивка;

--
-- Drop table `цвет`
--
DROP TABLE IF EXISTS цвет;

--
-- Set default database
--
USE avtomagazin;

--
-- Create table `цвет`
--
CREATE TABLE цвет (
  id_color int NOT NULL AUTO_INCREMENT,
  цвет tinytext DEFAULT NULL,
  PRIMARY KEY (id_color)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create table `обивка`
--
CREATE TABLE обивка (
  id_obivka int NOT NULL AUTO_INCREMENT,
  обивка tinytext DEFAULT NULL,
  PRIMARY KEY (id_obivka)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create table `коробка передач`
--
CREATE TABLE `коробка передач` (
  id_korobka int NOT NULL AUTO_INCREMENT,
  `коробка передач` tinytext DEFAULT NULL,
  PRIMARY KEY (id_korobka)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create table ` model avto`
--
CREATE TABLE ` model avto` (
  id_model int NOT NULL AUTO_INCREMENT,
  модель tinytext DEFAULT NULL,
  id_color int DEFAULT NULL,
  id_obivka int DEFAULT NULL,
  `заводская цена` tinytext DEFAULT NULL,
  id_korobka int DEFAULT NULL,
  PRIMARY KEY (id_model)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create foreign key
--
ALTER TABLE ` model avto`
ADD CONSTRAINT `FK_ model avto_коробка передач_id_korobka` FOREIGN KEY (id_korobka)
REFERENCES `коробка передач` (id_korobka);

--
-- Create foreign key
--
ALTER TABLE ` model avto`
ADD CONSTRAINT `FK_ model avto_обивка_id_obivka` FOREIGN KEY (id_obivka)
REFERENCES обивка (id_obivka);

--
-- Create foreign key
--
ALTER TABLE ` model avto`
ADD CONSTRAINT `FK_ model avto_цвет_id_color` FOREIGN KEY (id_color)
REFERENCES цвет (id_color);

--
-- Create table `клиенты`
--
CREATE TABLE клиенты (
  id_zakaza int NOT NULL AUTO_INCREMENT,
  id_model int DEFAULT NULL,
  `фамилия заказчика` tinytext DEFAULT NULL,
  город tinytext DEFAULT NULL,
  телефон tinytext DEFAULT NULL,
  `дата заказа` tinytext DEFAULT NULL,
  PRIMARY KEY (id_zakaza)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create foreign key
--
ALTER TABLE клиенты
ADD CONSTRAINT `FK_клиенты_ model avto_id_model` FOREIGN KEY (id_model)
REFERENCES ` model avto` (id_model);

-- 
-- Dumping data for table цвет
--
INSERT INTO цвет VALUES
(1, 'Черный'),
(2, 'Белый'),
(3, 'Зелёный'),
(4, 'Красный');

-- 
-- Dumping data for table обивка
--
INSERT INTO обивка VALUES
(1, 'кожаное'),
(2, 'заменитель кожы'),
(3, 'алькантара');

-- 
-- Dumping data for table `коробка передач`
--
INSERT INTO `коробка передач` VALUES
(1, 'Автомат'),
(2, 'Механическая');

-- 
-- Dumping data for table ` model avto`
--
INSERT INTO ` model avto` VALUES
(1, 'LADA', 2, 3, '350000 р.', 2),
(2, 'Nissan', 3, 1, '1675000', 1),
(3, 'Тойта', 1, 2, '650000', 1),
(4, 'КаМаЗ', 4, 3, '3000000', 2);

-- 
-- Dumping data for table клиенты
--
INSERT INTO клиенты VALUES
(1, 1, 'Бузмаков', 'Белореченск', '89229094632', '15.12.2021'),
(2, 2, 'Родыгин', 'Ежово', '89229619913', '04.01.2022'),
(3, 3, 'Смагин', 'Ежово', '89229221421', '04.02.2022'),
(4, 4, 'Шустов', 'Омутнинск', '89229139961', '27.12.2021');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;