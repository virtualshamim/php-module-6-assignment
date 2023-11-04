-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 01:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment_6`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5'),
(6, 'Category 6'),
(7, 'Category 7'),
(8, 'Category 8');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `location`) VALUES
(1, 'Customer 1', 'customer1@assignment6.com', 'Dhaka, Bangladesh'),
(2, 'Customer 2', 'customer2@assignment6.com', 'Chittagong, Bangladesh'),
(3, 'Customer 3', 'customer3@assignment6.com', 'Sylhet, Bangladesh'),
(4, 'Customer 4', 'customer4@assignment6.com', 'Khulna, Bangladesh'),
(5, 'Customer 5', 'customer5@assignment6.com', 'Rajshahi, Bangladesh'),
(6, 'Customer 6', 'customer6@assignment6.com', 'Barishal, Bangladesh'),
(7, 'Customer 7', 'customer7@assignment6.com', 'Comilla, Bangladesh'),
(8, 'Customer 8', 'customer8@assignment6.com', 'Narayanganj, Bangladesh'),
(9, 'Customer 9', 'customer9@assignment6.com', 'Dinajpur, Bangladesh'),
(10, 'Customer 10', 'customer10@assignment6.com', 'Rangpur, Bangladesh'),
(11, 'Customer 11', 'customer11@assignment6.com', 'Bogra, Bangladesh'),
(12, 'Customer 12', 'customer12@assignment6.com', 'Jessore, Bangladesh'),
(13, 'Customer 13', 'customer13@assignment6.com', 'Mymensingh, Bangladesh'),
(14, 'Customer 14', 'customer14@assignment6.com', 'Cox\'s Bazar, Bangladesh'),
(15, 'Customer 15', 'customer15@assignment6.com', 'Gazipur, Bangladesh'),
(16, 'Customer 16', 'customer16@assignment6.com', 'Savar, Bangladesh'),
(17, 'Customer 17', 'customer17@assignment6.com', 'Narshingdi, Bangladesh'),
(18, 'Customer 18', 'customer18@assignment6.com', 'Tangail, Bangladesh'),
(19, 'Customer 19', 'customer19@assignment6.com', 'Kushtia, Bangladesh'),
(20, 'Customer 20', 'customer20@assignment6.com', 'Noakhali, Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2023-11-03', 21.98),
(2, 2, '2023-11-03', 59.97),
(3, 3, '2023-11-03', 149.95),
(4, 4, '2023-11-02', 59.90),
(5, 10, '2023-11-03', 1299.00),
(6, 15, '2023-11-03', 3299.00),
(7, 1, '2023-11-03', 21.98),
(8, 4, '2023-11-02', 59.90);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 2, 10.99),
(2, 2, 2, 3, 19.99),
(3, 3, 4, 5, 29.99),
(4, 4, 6, 10, 5.99),
(5, 5, 9, 100, 12.99),
(6, 6, 15, 100, 32.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `category_id`) VALUES
(1, 'Product 1', 'Description of Product 1', 10.99, 1),
(2, 'Product 2', 'Description of Product 2', 19.99, 2),
(3, 'Product 3', 'Description of Product 3', 7.99, 1),
(4, 'Product 4', 'Description of Product 4', 29.99, 3),
(5, 'Product 5', 'Description of Product 5', 14.99, 2),
(6, 'Product 6', 'Description of Product 6', 5.99, 4),
(7, 'Product 7', 'Description of Product 7', 24.99, 5),
(8, 'Product 8', 'Description of Product 8', 9.99, 6),
(9, 'Product 9', 'Description of Product 9', 12.99, 7),
(10, 'Product 10', 'Description of Product 10', 8.99, 1),
(11, 'Product 11', 'Description of Product 11', 17.99, 3),
(12, 'Product 12', 'Description of Product 12', 6.99, 2),
(13, 'Product 13', 'Description of Product 13', 32.99, 5),
(14, 'Product 14', 'Description of Product 14', 11.99, 4),
(15, 'Product 15', 'Description of Product 15', 13.99, 6),
(16, 'Product 16', 'Description of Product 16', 15.99, 7),
(17, 'Product 17', 'Description of Product 17', 23.99, 3),
(18, 'Product 18', 'Description of Product 18', 18.99, 4),
(19, 'Product 19', 'Description of Product 19', 28.99, 5),
(20, 'Product 20', 'Description of Product 20', 9.99, 6),
(21, 'Product 21', 'Description of Product 21', 19.99, 7),
(22, 'Product 22', 'Description of Product 22', 7.99, 1),
(23, 'Product 23', 'Description of Product 23', 14.99, 2),
(24, 'Product 24', 'Description of Product 24', 6.99, 3),
(25, 'Product 25', 'Description of Product 25', 11.99, 4),
(26, 'Product 26', 'Description of Product 26', 29.99, 5),
(27, 'Product 27', 'Description of Product 27', 12.99, 6),
(28, 'Product 28', 'Description of Product 28', 15.99, 1),
(29, 'Product 29', 'Description of Product 29', 8.99, 2),
(30, 'Product 30', 'Description of Product 30', 17.99, 3),
(31, 'Product 31', 'Description of Product 31', 9.99, 4),
(32, 'Product 32', 'Description of Product 32', 16.99, 5),
(33, 'Product 33', 'Description of Product 33', 10.99, 6),
(34, 'Product 34', 'Description of Product 34', 22.99, 7),
(35, 'Product 35', 'Description of Product 35', 13.99, 1),
(36, 'Product 36', 'Description of Product 36', 21.99, 2),
(37, 'Product 37', 'Description of Product 37', 7.99, 3),
(38, 'Product 38', 'Description of Product 38', 19.99, 4),
(39, 'Product 39', 'Description of Product 39', 25.99, 5),
(40, 'Product 40', 'Description of Product 40', 9.99, 6),
(41, 'Product 41', 'Description of Product 41', 14.99, 7),
(42, 'Product 42', 'Description of Product 42', 6.99, 1),
(43, 'Product 43', 'Description of Product 43', 11.99, 2),
(44, 'Product 44', 'Description of Product 44', 8.99, 3),
(45, 'Product 45', 'Description of Product 45', 16.99, 4),
(46, 'Product 46', 'Description of Product 46', 29.99, 5),
(47, 'Product 47', 'Description of Product 47', 12.99, 6),
(48, 'Product 48', 'Description of Product 48', 14.99, 7),
(49, 'Product 49', 'Description of Product 49', 7.99, 1),
(50, 'Product 50', 'Description of Product 50', 18.99, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
