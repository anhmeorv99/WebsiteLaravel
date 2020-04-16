-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2020 at 09:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(46, 37, '2020-04-13', 180000, 'COD', NULL, '2020-04-13 15:48:56', '2020-04-13 15:48:56'),
(45, 38, '2020-04-08', 180000, 'COD', NULL, '2020-04-07 17:39:29', '2020-04-07 17:39:29'),
(44, 37, '2020-04-08', 180000, 'ATM', NULL, '2020-04-07 17:38:52', '2020-04-07 17:38:52'),
(43, 37, '2020-04-08', 180000, 'COD', NULL, '2020-04-07 17:07:36', '2020-04-07 17:07:36'),
(41, 38, '2020-04-08', 180000, 'COD', NULL, '2020-04-07 17:03:31', '2020-04-07 17:03:31'),
(42, 37, '2020-04-08', 180000, 'COD', NULL, '2020-04-07 17:04:32', '2020-04-07 17:04:32'),
(40, 37, '2020-04-08', 180000, 'COD', NULL, '2020-04-07 17:01:56', '2020-04-07 17:01:56'),
(39, 37, '2020-04-07', 230000, 'COD', NULL, '2020-04-07 16:58:51', '2020-04-07 16:58:51'),
(38, 37, '2020-04-07', 180000, 'ATM', NULL, '2020-04-07 16:47:20', '2020-04-07 16:47:20'),
(37, 38, '2020-04-07', 170000, 'COD', NULL, '2020-04-07 16:45:03', '2020-04-07 16:45:03'),
(36, 37, '2020-04-02', 590000, 'ATM', NULL, '2020-04-02 10:59:40', '2020-04-02 10:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(50, 46, 67, 1, 180000, '2020-04-13 15:48:56', '2020-04-13 15:48:56'),
(49, 45, 66, 1, 180000, '2020-04-07 17:39:29', '2020-04-07 17:39:29'),
(48, 44, 67, 1, 180000, '2020-04-07 17:38:52', '2020-04-07 17:38:52'),
(47, 43, 67, 1, 180000, '2020-04-07 17:07:36', '2020-04-07 17:07:36'),
(46, 42, 66, 1, 180000, '2020-04-07 17:04:32', '2020-04-07 17:04:32'),
(45, 41, 66, 1, 180000, '2020-04-07 17:03:31', '2020-04-07 17:03:31'),
(44, 40, 67, 1, 180000, '2020-04-07 17:01:56', '2020-04-07 17:01:56'),
(43, 39, 75, 1, 230000, '2020-04-07 16:58:51', '2020-04-07 16:58:51'),
(42, 38, 67, 1, 180000, '2020-04-07 16:47:20', '2020-04-07 16:47:20'),
(41, 37, 68, 1, 170000, '2020-04-07 16:45:03', '2020-04-07 16:45:03'),
(40, 36, 69, 1, 230000, '2020-04-02 10:59:40', '2020-04-02 10:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(37, 'Nguyễn Tuấn Anh', 'nam', NULL, '205 Bạch Mai.', '0988964753', NULL, '2020-04-02 10:59:40', '2020-04-02 10:59:40'),
(38, 'Lê Thanh Tuấn', 'nam', NULL, 'Chi Cục thuế Hương Điền, 111 Cách Mạng Tháng Tám, Phường Tứ Hạ, Thị Xã Hương Trà, Thừa Thiên - Huế', '0905405311', NULL, '2020-04-07 16:45:03', '2020-04-07 16:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--
-- Error reading structure for table db_banhang.products: #1932 - Table 'db_banhang.products' doesn't exist in engine
-- Error reading data for table db_banhang.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`products`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--
-- Error reading structure for table db_banhang.slide: #1932 - Table 'db_banhang.slide' doesn't exist in engine
-- Error reading data for table db_banhang.slide: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`slide`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--
-- Error reading structure for table db_banhang.type_products: #1932 - Table 'db_banhang.type_products' doesn't exist in engine
-- Error reading data for table db_banhang.type_products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`type_products`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Error reading structure for table db_banhang.users: #1932 - Table 'db_banhang.users' doesn't exist in engine
-- Error reading data for table db_banhang.users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `db_banhang`.`users`' at line 1

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
