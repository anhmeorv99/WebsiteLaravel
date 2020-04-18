-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 11:58 AM
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
-- Database: `db_banhang1`
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
(34, 35, '2020-03-28', 120000, 'COD', NULL, '2020-03-28 09:53:08', '2020-03-28 09:53:08'),
(33, 35, '2020-03-28', 120000, 'COD', NULL, '2020-03-28 09:49:55', '2020-03-28 09:49:55');

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
(38, 34, 1, 1, 120000, '2020-03-28 09:53:08', '2020-03-28 09:53:08'),
(37, 33, 1, 1, 120000, '2020-03-28 09:49:55', '2020-03-28 09:49:55');

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
(35, 'Lê Thanh Tuấn', 'nam', NULL, 'Chi Cục thuế Hương Điền, 111 Cách Mạng Tháng Tám, Phường Tứ Hạ, Thị Xã Hương Trà, Thừa Thiên - Huế', '0905405311', NULL, '2020-03-28 09:49:55', '2020-03-28 09:49:55');

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

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(63, 'Áo001', 18, NULL, 150000, 0, 'ao001.jpg', NULL, 1, '2020-04-18 09:45:22', NULL),
(64, 'Áo002', 18, NULL, 150000, 0, 'ao002.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(65, 'Áo003', 18, NULL, 150000, 0, 'ao003.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(66, 'Áo004', 18, NULL, 150000, 0, 'ao004.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(67, 'Áo005', 18, NULL, 150000, 0, 'ao005.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(68, 'Áo006', 18, NULL, 150000, 0, 'ao006.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(69, 'Áo007', 18, NULL, 150000, 0, 'ao007.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(70, 'Áo008', 18, NULL, 150000, 0, 'ao008.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(71, 'Áo009', 18, NULL, 150000, 0, 'ao009.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(72, 'Áo010', 18, NULL, 150000, 0, 'ao010.jpg', NULL, 0, '2020-04-18 09:46:41', NULL),
(73, 'Set001', 21, NULL, 150000, 20000, 'set001.jpg', NULL, 0, '2020-04-18 09:47:43', NULL),
(74, 'Set002', 21, NULL, 150000, 20000, 'set002.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(75, 'Set003', 21, NULL, 150000, 20000, 'set003.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(76, 'Set004', 21, NULL, 150000, 20000, 'set004.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(77, 'Set005', 21, NULL, 150000, 20000, 'set005.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(78, 'Set006', 21, NULL, 150000, 20000, 'set006.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(79, 'Set007', 21, NULL, 150000, 20000, 'set007.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(80, 'Set008', 21, NULL, 150000, 20000, 'set008.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(81, 'Set009', 21, NULL, 150000, 20000, 'set009.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(82, 'Set010', 21, NULL, 150000, 20000, 'set010.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(83, 'Set011', 21, NULL, 150000, 20000, 'set011.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(84, 'Set012', 21, NULL, 150000, 20000, 'set012.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(85, 'Set013', 21, NULL, 150000, 20000, 'set013.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(86, 'Set014', 21, NULL, 150000, 20000, 'set014.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(87, 'Set015', 21, NULL, 150000, 20000, 'set015.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(88, 'Set016', 21, NULL, 150000, 20000, 'set016.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(89, 'Set017', 21, NULL, 150000, 20000, 'set017.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(90, 'Set018', 21, NULL, 150000, 20000, 'set018.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(91, 'Set019', 21, NULL, 150000, 20000, 'set019.jpg', NULL, 0, '2020-04-18 09:51:52', NULL),
(92, 'Set020', 21, NULL, 150000, 20000, 'set020.jpg', NULL, 0, '2020-04-18 09:51:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'slide1.jpg'),
(2, '', 'slide2.jpg'),
(3, '', 'slide3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `type_name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(18, 'Áo', '', '', NULL, NULL),
(19, 'Váy', '', '', NULL, NULL),
(20, 'Quần', '', '', NULL, NULL),
(21, 'Set', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Nguyễn Tuấn Anh', 'anhmeorv99@gmail.com', '$2y$10$BpLnCpqJjig4zShA/08.pe4CFSAcDfEfdXXi/tECBTh.wKW.WuTs.', '0988964753', '205 Bạch Mai.', NULL, '2020-04-18 09:35:40', '2020-04-18 09:35:40');

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
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
