-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2024 at 08:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(4, 'edit name', 'hello form pos app', '2024-09-03 18:54:10.063676', '2024-09-04 18:12:50.000000'),
(5, 'child sport', 'Sale', '2024-09-03 18:54:24.419199', '2024-09-03 18:54:24.419199'),
(6, 'child books', 'Sale', '2024-09-03 18:54:32.110843', '2024-09-03 18:54:32.110843'),
(7, 'child watches', 'Sale', '2024-09-03 18:54:42.103968', '2024-09-03 18:54:42.103968'),
(8, 'child bags', 'Sale', '2024-09-03 18:54:51.810286', '2024-09-03 18:54:51.810286'),
(9, 'man bags', 'Sale', '2024-09-03 19:31:24.389242', '2024-09-03 19:31:24.389242'),
(10, 'woman bags', 'Sale', '2024-09-03 19:31:33.252529', '2024-09-03 19:31:33.252529'),
(11, 'man shoelace', 'Sale', '2024-09-04 18:12:27.371005', '2024-09-04 18:12:27.371005'),
(12, 'bobob', 'hello bobo', '2024-09-04 18:36:58.041285', '2024-09-04 18:36:58.041285'),
(13, 'string', 'string', '2024-09-04 18:39:29.678126', '2024-09-04 18:39:29.678126'),
(14, 'child bags1', 'Sale', '2024-09-18 08:01:23.950025', '2024-09-18 08:01:23.950025'),
(15, 'child bags2', 'Sale', '2024-09-18 08:01:34.853317', '2024-09-18 08:01:34.853317'),
(16, 'child bags42', 'Sale', '2024-09-18 08:01:39.667575', '2024-09-18 08:01:39.667575'),
(17, 'child bags4w2', 'Sale', '2024-09-18 08:01:42.465861', '2024-09-18 08:01:42.465861'),
(18, 'chiwld bags4w2', 'Sale', '2024-09-18 08:01:45.028552', '2024-09-18 08:01:45.028552'),
(19, 'chidwld bags4w2', 'Sale', '2024-09-18 08:01:52.243528', '2024-09-18 08:01:52.243528');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('Percentage','Fixed Amount') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` enum('Cashier','Manager','Administrator') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `inventory_log_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_change` int(11) NOT NULL,
  `log_type` enum('Purchase','Sale','Adjustment') NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_programs`
--

CREATE TABLE `loyalty_programs` (
  `loyalty_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `tier` enum('Bronze','Silver','Gold','Platinum') DEFAULT 'Bronze',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','Mobile Payment','Bank Transfer') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sku` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `sku`, `price`, `cost`, `quantity_in_stock`, `category_id`, `created_at`, `updated_at`, `color`) VALUES
(4, 'Sample ddqa', 'A detailed description zz of the sample product.', 'ttt', 66.00, 15.00, 100, 5, '2024-09-03 19:34:39.350555', '2024-09-11 09:21:40.000000', 'red'),
(5, 'Sample edit product', 'A detailed description of the sample product.', 'pos134', 100.00, 300.00, 100, 5, '2024-09-03 19:34:47.737401', '2024-09-11 09:24:07.000000', 'red'),
(6, 'Sample Product2', 'A detailed description of the sample product.', 'pos23454', 29.99, 15.50, 100, 6, '2024-09-04 19:23:38.694095', '2024-09-04 19:23:38.694095', ''),
(7, 'Sample Product2', 'A detailed description of the sample product.', 'pos234ss54', 29.99, 15.50, 100, 6, '2024-09-04 19:24:02.476045', '2024-09-04 19:24:02.476045', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `product_tax_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `purchase_item_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_discounts`
--

CREATE TABLE `sale_discounts` (
  `sale_discount_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift_logs`
--

CREATE TABLE `shift_logs` (
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `shift_start` timestamp NOT NULL DEFAULT current_timestamp(),
  `shift_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_configurations`
--

CREATE TABLE `tax_configurations` (
  `tax_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(4, 'bobo', 'bobo2@gmail.com', '$2b$10$pUFMBfQHKoum6xdRMcFF8.Y/iIrQH/xTkbT/kV3gyAhCUH6hm6f/m'),
(5, 'bobo', 'bobo4@gmail.com', '$2b$10$9zJI3FlJXC1xbD9sb7S0geQ6BbYaQLvcwZS6gw.03S4QOkSHuBAZ.'),
(6, 'bobo', 'nono@gmail.com', '$2b$10$t4XQ3Mzh6Kq9NvHrmrLCZ.IPikqQrpW5RYuebq.VjoJxRcSMP38sy'),
(7, 'mgmg', 'mgmg@gmail.com', '$2b$10$wt/Ret0W1eNgXj67/vxA7eukatVxMpqulo3de7U/32CGlG7lh1l9W'),
(8, 'mgmg', 'mgmg2@gmail.com', '$2b$10$c0m5hqft1iZ5H5bqbn43Su7oZgO1vmAXwp.gcW5eYUxzAsatGBQIK'),
(9, 'mgmg', 'mgmg3@gmail.com', '$2b$10$AtMceq3.PP.RjeLGbRIvFeKGamQbV.6vySro6jbTU3hPAga9FkrKG'),
(11, 'bobo', 'nnn@gmail.com', '$2b$10$vYVtSB.7n/VU1BUMtmHHrOymoqtpMfVqgJbVF/yfcGtfvYAVDKjne'),
(12, 'mgmg', 'mgmg22@gmail.com', '$2b$10$LA7e1LaJvpsAmQbFkgCVBeYLQDzxnjumlk2/3R6/hOaA6Vnwk1zPW'),
(13, 'popo', 'popo@gmail.com', '$2b$10$iv8NbLB/0kYzp8/F5iM1XOm4Q8nCv2kqPfrKBuSximrpWpCA2Jlt6'),
(14, 'popo', 'popo123@gmail.com', '$2b$10$ptDOZzp2i8F6HM8gYaIST.pEqdZCDwGz16zdTPbQdv7KCiboAtFHm'),
(15, 'nk', 'nk@gmail.com', '$2b$10$01tC574oOk1qAWINf6Mq6OtK1BsLiT3wFXqOYwvIT8s.cZK.Rj/se'),
(16, 'nk', 'nnk@gmail.com', 'hello123'),
(17, 'nk', 'kk@gmail.com', '$2b$10$8PiDPWVEIVAQjfGIAwMM9uuWlxHefOjX1p4I/ns7n0ncD9xBGjN0e'),
(18, 'nk', 'kssk@gmail.com', '$2b$10$gw0YKC4n5FcVSxFyI/TkPOc3l6ApfDOf8OBd66wT039D7ovGsalnO'),
(19, 'nk', 'one@gmail.com', '$2b$10$HcX8AUGj1JPCuUBBdcc1R.jg/q0hlISWeHdAnFL6.if6acoWnqxwe'),
(20, 'nk', 'one2@gmail.com', '$2b$10$91cyFx3SFAMCNPxxAD1NmuTuEiHLher85yrtkBwhmDvzaKjVG5pB2'),
(21, 'mgmg', 'mgmg1@gmail.com', '$2b$10$aA0fU/gxWntAecWmhYa4yufounlomLM.OtjcqgAITkQ5DDk2cwLVK'),
(22, 'uu', 'uu@gmail.com', '$2b$10$TwLI5dnSYC05FFeBPm6.TOFhPz972rR5e2.91p0yQU6Gg2GSy8hz6'),
(23, 'uu', 'uus@gmail.com', '$2b$10$MWtNCVPM7DJj1zL9fT.pL.iLQKYpEtL3q2jmK5Ld7WTVglvgg/yke'),
(24, 'cepup', 'mylefagyhe@mailinator.com', '$2b$10$XW2qzf3leisFEdlvW7RYDOQeWI1cf/8zvJA8niFIhvNn6KtEU9sza'),
(25, 'howasimol', 'xynygi@mailinator.com', '$2b$10$Flkoax04g90UKhXwOMo64uFUYaCoK2J/fF639oie7f8KXO5bvdlOm'),
(26, 'rozim', 'xypigi@mailinator.com', '$2b$10$0M49ewHTxnL/QFjrUAgOPOVmueHqHsCcbwgmI1ebu0PZ8hpQ72Mmq'),
(27, 'nnn', 'pop@gmail.com', '$2b$10$IzJC1rjGIa9OUf.IpxXhwOEXrg329IBOG7Cw4lZQN1EW/kfksLXLO'),
(28, 'nnn', 'pop2@gmail.com', '$2b$10$WBXAG55tF.mwsK4ZRcEeKeyhOJk0L0EX706qpDqOIrOFQvPr6XwvW'),
(29, 'delyq', 'sovajixy@mailinator.com', '$2b$10$Ck2qb2w2.q9RsNspt8IX7es6bOfu0UGt5MUQlo6gRkLFs4YmMlare'),
(30, 'xypiqewyr', 'zuhukunis@mailinator.com', '$2b$10$PTeZCD5vGhp73I0XkwYNtOMjMAzD70C.P.l5yQcHB/SM7TmC8U5M2'),
(31, 'kiki', 'kiki@gmail.com', '$2b$10$VqKq4C4hxIGkTYWl3bTjF.85OQCGYyHSdFPByo4u5YVW/l.wqFes.'),
(32, 'abc', 'abc@gmail.com', '$2b$10$zZYGv0tqZqK1uE6fi9e3D.XYM4h7Kf7FWv07Cnkj1QGqA3nft/IL.'),
(33, 'nnn', 'po2@gmail.com', '$2b$10$UMddB12mBAK.Cr5w0CnPGOd94.kOp0cX/0bH2sBPCbzXyA407zQNy'),
(34, 'nnn', 'pos2@gmail.com', '$2b$10$45wC81sJFPXy4IdKVNXZ5.22vRaoioKXDMiJ32iY0i1Na6ELepI.K'),
(35, 'uu', 'uusa@gmail.com', '$2b$10$ckqntavMisDJXCCF2bt03u8GAFaD76xiaXcAL6emCjM7.GT.AaSlG'),
(36, 'aa', 'aabb@gmail.com', '$2b$10$5WzgEDYIS86T6sfAkzMlMe.quA3Pdk5Gck9zFkHfqKbxseI44veKG'),
(37, 'boss', 'boss@gmail.com', '$2b$10$c5ZBNdXS3WhlLTPx9rvtFe8IJGxtWjMqC8zOK04JfB2jNY4ZkrtAG'),
(38, '', '', '$2b$10$9YfyVycZ1gi6w9NuBGieQufj9zWiFaGYGzhsmLqzj25rZbLWV6FT2'),
(39, 'mijede', 'jiquhipig@mailinator.com', '$2b$10$ryQX1cCYOzKeX3VilU.j2uFq1j6rYV32AleBMxcuFGPEVmx6b2dUC'),
(40, 'dytoqu', 'fepaguri@mailinator.com', '$2b$10$ndVhKSfApZLrrzhK4kwhl.v/4n/vA5D3uXdA9PkhEUVOgYO10X8G6'),
(41, 'biporo', 'seketytonu@mailinator.com', '$2b$10$VY3ChpF22Ufkq3Ct7Jw7VeNQWOZLiB4Yrd2i0fAyxy9mQH6XaILXS'),
(42, 'gyxili', 'rucypur@mailinator.com', '$2b$10$3Sc4eIlJO64s8CNY2YeY0eWgDRPWHVpyIJp3KUbJdpcrjWp9Lrgzy'),
(43, 'cexexisah', 'cowyh@mailinator.com', '$2b$10$791nemIkD6PN3Z3nQbow1.VX3B9rQrrpff40JFuZiTRTCmW76u8fq'),
(44, 'koko', 'koko12@gmail.com', '$2b$10$j7j.ckLt4smz3Gav5yWLhOpG2CirZuO/IjTLIlSgfeENLjYHHmEpq'),
(45, 'dolygev', 'ppp@mailinator.com', '$2b$10$vdqPLWKXXKWgGg/rkOpaD..Qbz2eDb5alzE90HR5575SKvdFSrFgO'),
(46, 'hello', 'hello@hello.com', '$2b$10$9/cSS8A1k2kE98RikSQF7uI/sk6ACukgEZqZv2ZHGgSM3xG.apKtC'),
(47, 'cykyvo', 'bbb@mailinator.com', '$2b$10$iDU4Q6h3hmqFUEGLMLcfcuXT2STliWR.ixRZlX2ehrjDPBoCnln1q'),
(48, 'xikari', 'qa@mailinator.com', '$2b$10$cB8/evS3mReWIHbUYKT30.p8EHbhFnuONrfRjJTWITbFGP4YVvT6W'),
(49, 'mudydocehy', 'gg@mailinator.com', '$2b$10$1BjV8h5zwmOwc1LtI2Qdb.VUNf.UG1SVpd23BD06mHhfwtUV27grq');

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
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`inventory_log_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `loyalty_programs`
--
ALTER TABLE `loyalty_programs`
  ADD PRIMARY KEY (`loyalty_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `IDX_c44ac33a05b144dd0d9ddcf932` (`sku`),
  ADD KEY `FK_9a5f6868c96e0069e699f33e124` (`category_id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`product_tax_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `tax_id` (`tax_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`purchase_item_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `sale_discounts`
--
ALTER TABLE `sale_discounts`
  ADD PRIMARY KEY (`sale_discount_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `shift_logs`
--
ALTER TABLE `shift_logs`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tax_configurations`
--
ALTER TABLE `tax_configurations`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `inventory_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_programs`
--
ALTER TABLE `loyalty_programs`
  MODIFY `loyalty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `product_tax_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `purchase_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_discounts`
--
ALTER TABLE `sale_discounts`
  MODIFY `sale_discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `sale_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift_logs`
--
ALTER TABLE `shift_logs`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_configurations`
--
ALTER TABLE `tax_configurations`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `loyalty_programs`
--
ALTER TABLE `loyalty_programs`
  ADD CONSTRAINT `loyalty_programs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_9a5f6868c96e0069e699f33e124` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD CONSTRAINT `product_taxes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_taxes_ibfk_2` FOREIGN KEY (`tax_id`) REFERENCES `tax_configurations` (`tax_id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `sale_discounts`
--
ALTER TABLE `sale_discounts`
  ADD CONSTRAINT `sale_discounts_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_discounts_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `shift_logs`
--
ALTER TABLE `shift_logs`
  ADD CONSTRAINT `shift_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
