CREATE DATABASE  IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookshop`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshop
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J. K.','Rowling','United Kingdom'),(2,'George R. R.','Martin','USA'),(3,'Yaniv','Zlotnik','Israel'),(4,'Anar','Djafarov','Israel'),(5,'William','Shakespeare','United Kindom'),(6,'Charles','Dickens','United Kindom'),(7,'Ernest Miller','Hemingway','USA'),(8,'Lev Nikolaevich','Tolstoy','Russia'),(9,'Lea','Goldberg','Israel'),(10,'Amos','Oz','Israel');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(40) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Harry Poter'),(2,'A Song of Ice and Fire'),(3,'Introduction to SQL'),(4,'Introduction to Algorithms'),(5,'Advanced Programming'),(6,'The Art of Computer Programming'),(7,'Introduction to AI'),(8,'JavaScript'),(9,'Computer Architecture'),(10,'Data Science');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author_relation`
--

DROP TABLE IF EXISTS `book_author_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author_relation` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  KEY `book_id_idx` (`book_id`),
  KEY `author_id_idx` (`author_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author_relation`
--

LOCK TABLES `book_author_relation` WRITE;
/*!40000 ALTER TABLE `book_author_relation` DISABLE KEYS */;
INSERT INTO `book_author_relation` VALUES (1,1),(2,2),(3,3),(4,4),(5,4),(6,4),(6,7),(6,10),(7,3),(7,5),(8,1),(9,6),(9,9),(10,8),(10,2);
/*!40000 ALTER TABLE `book_author_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_extension`
--

DROP TABLE IF EXISTS `book_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_extension` (
  `book_extension_id` int unsigned NOT NULL,
  `book_id` int NOT NULL,
  `language` varchar(30) DEFAULT NULL,
  `translator_name` varchar(30) DEFAULT NULL,
  `publisher_name` varchar(30) NOT NULL,
  `publish_year` year NOT NULL,
  `weight` decimal(3,2) NOT NULL,
  PRIMARY KEY (`book_extension_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_id2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_extension`
--

LOCK TABLES `book_extension` WRITE;
/*!40000 ALTER TABLE `book_extension` DISABLE KEYS */;
INSERT INTO `book_extension` VALUES (1,4,'Hebrew','Cohen Cohen','Cohen Publish',2005,1.35),(2,4,'Arabic','Mohamed Mohamed','Mohamed Publish',2006,1.49),(3,4,'Spanish','Miguel Miguel','Miguel Publish',2007,1.39),(4,3,'Spanish','Miguel Miguel','Miguel Publish',2007,0.76),(5,1,'Spanish','Miguel Miguel','Miguel Publish',2007,1.90),(6,2,'Spanish','Miguel Miguel','Miguel Publish',2007,1.77),(8,5,'Spanish','Miguel Miguel','Miguel Publish',2007,0.91),(9,6,'Hebrew','Cohen Cohen','Cohen Publish',2008,0.65),(10,6,'Arabic','Mohamed Mohamed','Mohamed Publish',2008,0.63),(11,7,'Hebrew','Cohen Cohen','Cohen Publish',2011,1.10),(12,7,'Arabic','Mohamed Mohamed','Mohamed Publish',2008,1.15),(13,8,'Hebrew','Cohen Cohen','Cohen Publish',2008,2.01),(14,8,'Arabic','Mohamed Mohamed','Mohamed Publish',2008,1.99),(15,9,'Hebrew','Cohen Cohen','Cohen Publish',2008,2.88),(16,9,'Arabic','Mohamed Mohamed','Mohamed Publish',2008,2.76),(17,10,'Hebrew','Cohen Cohen','Cohen Publish',2008,1.30),(18,10,'Arabic','Mohamed Mohamed','Mohamed Publish',2008,1.25);
/*!40000 ALTER TABLE `book_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_instock`
--

DROP TABLE IF EXISTS `book_instock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_instock` (
  `book_InStock_id` int unsigned NOT NULL AUTO_INCREMENT,
  `condition_type` varchar(20) NOT NULL,
  `book_extension_id` int unsigned NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `date_in` date NOT NULL,
  `isInStorage` tinyint NOT NULL,
  PRIMARY KEY (`book_InStock_id`),
  KEY `book_extension_idx` (`book_extension_id`),
  KEY `book_extension` (`book_extension_id`),
  CONSTRAINT `book_extension3` FOREIGN KEY (`book_extension_id`) REFERENCES `book_extension` (`book_extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_instock`
--

LOCK TABLES `book_instock` WRITE;
/*!40000 ALTER TABLE `book_instock` DISABLE KEYS */;
INSERT INTO `book_instock` VALUES (1,'Good',1,19.99,'2020-07-21',0),(2,'New',2,29.99,'2020-07-21',1),(3,'New',4,29.99,'2020-07-21',1),(4,'Like New',10,45.50,'2020-02-10',0),(5,'Not Good',10,31.20,'2020-02-10',1),(6,'New',17,80.00,'2018-03-08',0),(7,'Like New',9,45.50,'2020-02-10',1),(8,'Average',3,90.00,'2016-11-04',1),(9,'New',6,15.50,'2020-02-19',0),(10,'Like New',12,41.20,'2020-07-10',1),(11,'Good',11,45.50,'2020-01-10',0),(12,'Like New',13,60.00,'2019-12-12',0),(13,'Not Good',11,9.50,'2020-05-05',1),(14,'Average',8,33.30,'2016-11-11',1),(15,'Like New',10,45.50,'2020-02-10',0),(16,'Not Good',10,31.20,'2020-02-10',1),(17,'New',17,80.00,'2018-03-08',0),(18,'Like New',9,45.50,'2020-02-10',1),(19,'Average',3,90.00,'2016-11-04',1),(20,'New',6,15.50,'2020-02-19',0),(21,'Like New',12,41.20,'2020-07-10',1),(22,'Good',11,45.50,'2020-01-10',0),(23,'Like New',13,60.00,'2019-12-12',0),(24,'Not Good',11,9.50,'2020-05-05',1),(25,'Average',8,33.30,'2016-11-11',1);
/*!40000 ALTER TABLE `book_instock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_sales`
--

DROP TABLE IF EXISTS `books_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_sales` (
  `books_sale_id` int NOT NULL AUTO_INCREMENT,
  `book_extension_id` int unsigned NOT NULL,
  `condition_type` varchar(20) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `sale_date` date NOT NULL,
  PRIMARY KEY (`books_sale_id`),
  KEY `book_id_key_idx` (`book_extension_id`),
  CONSTRAINT `book_extension` FOREIGN KEY (`book_extension_id`) REFERENCES `book_extension` (`book_extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_sales`
--

LOCK TABLES `books_sales` WRITE;
/*!40000 ALTER TABLE `books_sales` DISABLE KEYS */;
INSERT INTO `books_sales` VALUES (1,3,'New',49.99,'2020-07-24'),(2,3,'Like New',39.99,'2020-07-24'),(3,3,'New',49.99,'2020-07-24'),(4,3,'Like New',39.99,'2020-07-25'),(5,1,'Like New',39.99,'2020-07-24'),(6,5,'New',20.00,'2020-07-27'),(7,6,'New',25.00,'2020-07-27'),(8,4,'New',28.50,'2020-07-27'),(9,3,'New',32.50,'2020-07-27'),(10,8,'New',20.00,'2020-07-27'),(11,1,'Used',14.00,'2020-07-27'),(12,17,'Used',29.50,'2018-03-21'),(13,13,'Average',41.70,'2019-12-19'),(14,11,'Not Good',15.50,'2020-07-31'),(15,16,'New',70.00,'2020-07-22'),(16,1,'Used',49.00,'2020-08-02');
/*!40000 ALTER TABLE `books_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Jonathan','Koubany','+9723-6079090','+97252-9999999'),(2,'Daniel','Modilvsky','+9723-6502156','+97254-8888888'),(3,'Lucas','Lucas','+9723-7894001','+97253-0909178'),(4,'Captain','America','+9723-9093021','+97252-7090134'),(5,'Moshe','Moshe','+9723-7893401','+97253-0435678'),(6,'Superman','Superman','+9723-7894500','+97253-0978678'),(7,'Mike','Ross','+9723-7891200','+97252-2229178'),(8,'Michael','Jordan','+9723-8709065','+97250-4329567'),(9,'Magic','Johnson','+9723-6543315','+97255-4567398'),(10,'Larry','Bird','+9723-7531156','+97254-6541287');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `deal_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date_in` date NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  PRIMARY KEY (`deal_id`),
  KEY `empolyee_id_key_idx` (`employee_id`),
  KEY `customer_id_key_idx` (`customer_id`),
  CONSTRAINT `customer_id_key` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `empolyee_id_key` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
INSERT INTO `deal` VALUES (1,2,1,'2020-07-24',295.46,'Bit'),(2,1,2,'2019-12-19',41.70,'Credit Card'),(3,3,2,'2017-12-19',15.50,'Bank transfer'),(4,4,2,'2020-07-22',70.00,'Bit'),(5,5,3,'2020-08-02',49.00,'Credit card'),(6,6,4,'2020-08-01',80.50,'Bit'),(7,7,2,'2020-08-01',100.00,'Bank transfer'),(8,8,1,'2020-08-01',45.00,'Credit card'),(9,9,1,'2020-08-01',192.00,'Bit'),(10,10,2,'2020-08-01',67.70,'Bit');
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_books_relation`
--

DROP TABLE IF EXISTS `deal_books_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_books_relation` (
  `deal_id` int NOT NULL,
  `book_sale_id` int NOT NULL,
  KEY `deal_id_idx` (`deal_id`),
  KEY `book_sale_id_idx` (`book_sale_id`),
  CONSTRAINT `book_sale_id` FOREIGN KEY (`book_sale_id`) REFERENCES `books_sales` (`books_sale_id`),
  CONSTRAINT `deal_id` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_books_relation`
--

LOCK TABLES `deal_books_relation` WRITE;
/*!40000 ALTER TABLE `deal_books_relation` DISABLE KEYS */;
INSERT INTO `deal_books_relation` VALUES (1,1),(1,2),(1,3),(1,5);
/*!40000 ALTER TABLE `deal_books_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `courier_company` varchar(30) NOT NULL,
  `delivery_type` varchar(30) NOT NULL,
  `delivery_status` varchar(30) NOT NULL,
  `deal_id` int NOT NULL,
  `tracking_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `tracking_id_UNIQUE` (`tracking_id`),
  KEY `deal_id_idx2` (`deal_id`),
  CONSTRAINT `deal_id2` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`deal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Xpress','TA','Waiting for collection',1,'P244-0901-0902'),(2,'Israel Post','Fast courier mail','Arrived',1,'IL12344'),(3,'Israel Post','Fast courier mail','Arrived',2,'IL31211'),(4,'Xpress','Courier mail','Sent',3,'P423-0862-6553'),(5,'Israel Post','Courier mail','Arrived',4,'IL89067'),(6,'Israel Post','Registered mail','In Preparation',5,'IL56201'),(7,'Xpress','TA','Arrived',6,'P090-6783-8989'),(8,'Xpress','Courier mail','In Preparation',7,'P654-9090-1212'),(9,'Israel Post','Registered mail','In Prepration',8,'IL67809'),(10,'Israel Post','Registered mail','In Prepration',9,'IL34341');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_books_relation`
--

DROP TABLE IF EXISTS `delivery_books_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_books_relation` (
  `delivery_id` int NOT NULL,
  `book_sale_id` int NOT NULL,
  KEY `dealivery_id_idx` (`delivery_id`),
  KEY `book_sale_id_idx` (`book_sale_id`),
  KEY `book_sale_id` (`book_sale_id`),
  KEY `book_sale_id2` (`book_sale_id`),
  CONSTRAINT `book_sale_id2` FOREIGN KEY (`book_sale_id`) REFERENCES `books_sales` (`books_sale_id`),
  CONSTRAINT `delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_books_relation`
--

LOCK TABLES `delivery_books_relation` WRITE;
/*!40000 ALTER TABLE `delivery_books_relation` DISABLE KEYS */;
INSERT INTO `delivery_books_relation` VALUES (1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(2,12),(3,13),(4,14),(5,15),(6,16);
/*!40000 ALTER TABLE `delivery_books_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `isManager` tinyint DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Omri','Haham','Shoam','+97250-8908900','omri','123123',40,1),(2,'Ariel','Lunenfeld','Tel-Aviv','+97252-5205200','ariel','1234',30,0),(3,'Israel','Israeli','Tel-Aviv','+97250-5055050','israel','pass',30,0),(4,'admin','admin','Jerusalem','+97250-5055012','admin','admin',30,1),(5,'Lionel','Messi','Barcelona','+97254-9087734','messi','messi',30,0),(6,'Cristiano','Ronaldo','Torino','+97253-5367540','ronaldo','ronaldo',30,0),(7,'Nemyar','JR','Paris','+97254-7681062','neymar','neymar',30,0),(8,'Sergio','Ramos','Madrid','+97255-0980909','ramos','ramos',30,0),(9,'Zlatan','Ibrahimovich','Milano','+97255-6580914','zlatan','zlatan',30,0),(10,'David','Beckham','London','+97253-8796509','beckham','beckham',30,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_hours`
--

DROP TABLE IF EXISTS `employees_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_hours` (
  `employee_id` int NOT NULL,
  `month` date NOT NULL,
  `monthly_hours` decimal(5,2) NOT NULL,
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_hours`
--

LOCK TABLES `employees_hours` WRITE;
/*!40000 ALTER TABLE `employees_hours` DISABLE KEYS */;
INSERT INTO `employees_hours` VALUES (1,'2020-03-01',200.00),(2,'2020-03-01',180.00),(1,'2020-04-01',220.00),(2,'2020-04-01',200.00),(1,'2020-05-01',150.00),(2,'2020-05-01',170.00),(1,'2020-06-01',210.00),(2,'2020-06-01',220.00),(1,'2020-07-01',190.00),(2,'2020-07-01',180.00);
/*!40000 ALTER TABLE `employees_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ongoing_payments`
--

DROP TABLE IF EXISTS `ongoing_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ongoing_payments` (
  `idOngoing_Payments` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `rental_price` decimal(8,2) DEFAULT NULL,
  `water` decimal(8,2) DEFAULT NULL,
  `electricity` decimal(8,2) DEFAULT NULL,
  `landline` decimal(8,2) DEFAULT NULL,
  `cellular` decimal(8,2) DEFAULT NULL,
  `deliveries_price` decimal(8,2) DEFAULT NULL,
  `workers_payments` decimal(8,2) DEFAULT NULL,
  `Various_payments` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`idOngoing_Payments`),
  UNIQUE KEY `date_UNIQUE` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ongoing_payments`
--

LOCK TABLES `ongoing_payments` WRITE;
/*!40000 ALTER TABLE `ongoing_payments` DISABLE KEYS */;
INSERT INTO `ongoing_payments` VALUES (1,'2019-10-01',1250.00,230.31,510.10,80.00,125.00,2880.00,9771.00,309.00),(2,'2019-11-01',1250.00,198.11,444.55,80.00,125.00,2900.00,18002.00,570.00),(3,'2019-12-01',1250.00,192.76,479.02,80.00,125.00,1980.00,12930.00,1750.00),(4,'2020-01-01',1250.00,206.90,502.72,80.00,125.00,2770.00,14378.00,1334.00),(5,'2020-02-01',1250.00,90.10,370.90,80.00,125.00,1020.00,7650.00,890.00),(6,'2020-03-01',1250.00,227.58,450.55,80.00,120.50,1930.00,10904.00,219.00),(7,'2020-04-01',1250.00,291.43,523.01,80.00,120.50,2340.00,14300.00,390.00),(8,'2020-05-01',1250.00,124.02,212.43,80.00,120.50,1480.00,9800.00,203.00),(9,'2020-06-01',1250.00,227.58,533.12,80.00,120.50,1930.00,10904.00,219.00),(10,'2020-07-01',1250.00,251.50,609.98,80.00,130.00,3100.00,15876.00,444.00);
/*!40000 ALTER TABLE `ongoing_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `book_extension_id` int unsigned NOT NULL,
  `customer_id` int NOT NULL,
  `date_in` date NOT NULL,
  `isArrived` tinyint DEFAULT NULL,
  `date_arrived` date DEFAULT NULL,
  `isBought` tinyint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `book_extension_idx` (`book_extension_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `book_extension_idx2` (`book_extension_id`),
  KEY `book_extension` (`book_extension_id`),
  CONSTRAINT `book_extension_2` FOREIGN KEY (`book_extension_id`) REFERENCES `book_extension` (`book_extension_id`),
  CONSTRAINT `costomer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2020-07-03',1,'2020-07-12',0),(2,2,1,'2020-07-23',0,NULL,0),(3,1,2,'2020-07-23',0,NULL,0),(4,2,2,'2020-07-23',0,NULL,0),(5,3,1,'2020-07-23',0,NULL,0),(6,5,1,'2020-07-23',0,NULL,0),(7,10,3,'2020-08-01',0,NULL,0),(8,18,4,'2020-08-01',0,NULL,0),(9,9,5,'2020-08-01',0,NULL,0),(10,12,6,'2020-08-01',0,NULL,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 18:20:24
