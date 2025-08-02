-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 02, 2025 at 08:10 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pahana_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `billing_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bills_customer` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `customer_id`, `billing_date`, `total_amount`) VALUES
(9, 18, '2025-07-27 00:00:00', 6000.00),
(2, 18, '2025-07-26 00:00:00', 50.00),
(13, 1, '2025-07-29 00:00:00', 500.00),
(4, 18, '2025-07-26 00:00:00', 91.00),
(5, 18, '2025-07-27 00:00:00', 0.00),
(10, 21, '2025-07-27 00:00:00', 2900.00);

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE IF NOT EXISTS `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_items_bill` (`bill_id`),
  KEY `fk_bill_items_item` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `bill_id`, `item_id`, `quantity`, `total_amount`) VALUES
(6, 5, 16, 2, 4.00),
(5, 5, 2, 2, 4.00),
(7, 10, 2, 2, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_number` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `units_consumed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `account_number`, `name`, `address`, `telephone`, `units_consumed`) VALUES
(22, 1003, 'Andy', '10, Temple Road, Battaramulla', '0759876543', 90),
(18, 10302, 'Johnny', '258/5 IDH', '07521935876', 55),
(19, 20021030, 'Jane', 'IDH', '07521935874', 8),
(20, 1001, 'Jack', 'No. 12, Galle Road, Colombo', '0771234567', 150),
(21, 1002, 'Harry', '45/3, Kandy Road, Angoda', '0712345678', 230),
(23, 1004, 'Russel', '22, Lake View, Kandana', '0781122334', 180),
(24, 1005, 'Kane', '34, Hill Street, Wattala', '0723344556', 75);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `stock_quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category`, `stock_quantity`, `price_per_unit`) VALUES
(1, 'Red Riding Hood', 'Fiction', 50, 1200.00),
(2, 'A Brief History of Time', 'Science', 30, 1500.00),
(9, 'Famous Five', 'Fiction', 50, 1200.00),
(15, 'Percy Jackson-Sea of monsters', 'Fiction', 50, 1200.00),
(16, 'Harry Potter-Goblet of Fire', 'Science', 30, 1500.00),
(17, 'Black Beauty', 'Programming', 20, 3200.00),
(18, 'Cinderella', 'Fiction', 40, 1000.00),
(19, 'Introduction to Algorithms', 'Programming', 10, 4500.00),
(20, 'Sapiens', 'History', 25, 1800.00),
(21, 'Jacksman BBC', 'Self-help', 15, 1400.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'abcd', 'abcd1'),
(2, 'ume', 'ume123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
