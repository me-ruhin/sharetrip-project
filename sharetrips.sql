-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2022 at 01:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharetrips`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` int(11) NOT NULL,
  `acheive_point` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'reward point after product purchase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `mobile`, `acheive_point`, `created_at`, `updated_at`) VALUES
(1, 'Customer Bd', 171411155, 50020.00, '2022-01-26 03:15:09', '2022-01-26 06:26:53'),
(2, 'hello', 1714028589, 10000.00, '2022-01-26 03:17:20', '2022-01-26 06:25:12'),
(3, 'Testss', 1714446443, 5000.00, '2022-01-26 03:17:43', '2022-01-26 03:17:43'),
(4, 'Testss', 1714446442, 0.00, '2022-01-26 06:24:53', '2022-01-26 06:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_25_180500_create_point_settings_table', 1),
(6, '2022_01_25_181509_create_reward_settings_table', 1),
(7, '2022_01_25_181708_create_customers_table', 1),
(8, '2022_01_25_181918_create_products_table', 1),
(9, '2022_01_25_182222_create_sale_masters_table', 1),
(10, '2022_01_25_182950_create_sale_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'Laravel', 'd5941286e64cc294a7e10aaedc032f52f6713d89fa4a3051a274558e7b51e546', '[\"*\"]', '2022-01-26 06:20:25', '2022-01-26 06:13:40', '2022-01-26 06:20:25'),
(4, 'App\\Models\\User', 1, 'Laravel', '1cab2bf95e9ce13c96af0c20231c10770f270aaf48e5255ebf7917006ecf0c0a', '[\"*\"]', '2022-01-26 06:26:53', '2022-01-26 06:23:16', '2022-01-26 06:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `point_settings`
--

CREATE TABLE `point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minimun_purchase_amount` double(8,2) NOT NULL COMMENT 'minimum purchase amount to acheive reward point',
  `acheive_point` double(8,2) NOT NULL COMMENT 'point while match the minimun purchase amount',
  `acheive_point_to_taka_conversion` double(8,2) NOT NULL COMMENT 'point to taka conversation . ex 1 point 1 taka',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_settings`
--

INSERT INTO `point_settings` (`id`, `minimun_purchase_amount`, `acheive_point`, `acheive_point_to_taka_conversion`, `created_at`, `updated_at`) VALUES
(1, 100.00, 1.00, 1.00, '2022-01-26 03:15:09', '2022-01-26 03:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_price` double(8,2) NOT NULL COMMENT 'product purchase price',
  `selling_price` double(8,2) NOT NULL COMMENT 'product selling price',
  `available_qty` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'product available qty to sell',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `purchase_price`, `selling_price`, `available_qty`, `created_at`, `updated_at`) VALUES
(2, 'Testss', 150.00, 180.00, -240.00, '2022-01-26 03:16:17', '2022-01-26 06:26:53'),
(3, 'Potato Chips', 150.00, 180.00, -180.00, '2022-01-26 03:16:31', '2022-01-26 06:26:53'),
(4, 'Potato Chips2', 150.00, 180.00, 0.00, '2022-01-26 06:23:48', '2022-01-26 06:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `reward_settings`
--

CREATE TABLE `reward_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_acheive_point` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_settings`
--

INSERT INTO `reward_settings` (`id`, `name`, `minimum_acheive_point`, `created_at`, `updated_at`) VALUES
(1, 'silver', 5000.00, NULL, NULL),
(2, 'gold', 10000.00, NULL, NULL),
(3, 'platinum', 20000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2022-01-26',
  `product_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'purchase product reference id',
  `qty` double(8,2) NOT NULL COMMENT 'purchase product qty',
  `price` double(8,2) NOT NULL COMMENT 'product current purchase price while purchasing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `ref_number`, `date`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(9, '', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:20:50', '2022-01-26 03:20:50'),
(11, 'sell-1643188921', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:22:01', '2022-01-26 03:22:01'),
(12, 'sell-1643188921', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:22:01', '2022-01-26 03:22:01'),
(13, 'sell-1643188921', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:22:01', '2022-01-26 03:22:01'),
(14, 'sell-1643188930', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:22:10', '2022-01-26 03:22:10'),
(15, 'sell-1643188930', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:22:10', '2022-01-26 03:22:10'),
(16, 'sell-1643188930', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:22:10', '2022-01-26 03:22:10'),
(17, 'sell-1643188948', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:22:28', '2022-01-26 03:22:28'),
(18, 'sell-1643188948', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:22:28', '2022-01-26 03:22:28'),
(19, 'sell-1643188948', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:22:28', '2022-01-26 03:22:28'),
(20, 'sell-1643188959', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:22:39', '2022-01-26 03:22:39'),
(21, 'sell-1643188959', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:22:39', '2022-01-26 03:22:39'),
(22, 'sell-1643188959', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:22:39', '2022-01-26 03:22:39'),
(23, 'sell-1643188990', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:23:10', '2022-01-26 03:23:10'),
(24, 'sell-1643188990', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:23:10', '2022-01-26 03:23:10'),
(25, 'sell-1643188990', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:23:10', '2022-01-26 03:23:10'),
(26, 'sell-1643189098', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:24:58', '2022-01-26 03:24:58'),
(27, 'sell-1643189098', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:24:58', '2022-01-26 03:24:58'),
(28, 'sell-1643189098', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:24:58', '2022-01-26 03:24:58'),
(29, 'sell-1643189134', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 03:25:34', '2022-01-26 03:25:34'),
(30, 'sell-1643189134', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 03:25:34', '2022-01-26 03:25:34'),
(31, 'sell-1643189134', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 03:25:34', '2022-01-26 03:25:34'),
(32, 'sell-1643200013', '2022-01-26', 2, 20.00, 25.00, '2022-01-26 06:26:53', '2022-01-26 06:26:53'),
(33, 'sell-1643200013', '2022-01-26', 3, 20.00, 50.00, '2022-01-26 06:26:53', '2022-01-26 06:26:53'),
(34, 'sell-1643200013', '2022-01-26', 2, 10.00, 70.00, '2022-01-26 06:26:53', '2022-01-26 06:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `sale_masters`
--

CREATE TABLE `sale_masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2022-01-26',
  `ref_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) NOT NULL COMMENT 'Total purchase amount',
  `discount` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Discount amount',
  `payment` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Total payment after purchase',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment method ex: bKash,rocket,wallet..',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'customer reference',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_masters`
--

INSERT INTO `sale_masters` (`id`, `date`, `ref_number`, `total`, `discount`, `payment`, `payment_type`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '2022-01-26', 'sell-1643188697', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:18:17', '2022-01-26 03:18:17'),
(2, '2022-01-26', 'sell-1643188712', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:18:32', '2022-01-26 03:18:32'),
(3, '2022-01-26', 'sell-1643188739', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:18:59', '2022-01-26 03:18:59'),
(4, '2022-01-26', 'sell-1643188921', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:22:01', '2022-01-26 03:22:01'),
(5, '2022-01-26', 'sell-1643188959', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:22:39', '2022-01-26 03:22:39'),
(6, '2022-01-26', 'sell-1643188990', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:23:10', '2022-01-26 03:23:10'),
(7, '2022-01-26', 'sell-1643189098', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:24:58', '2022-01-26 03:24:58'),
(8, '2022-01-26', 'sell-1643189134', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 03:25:35', '2022-01-26 03:25:35'),
(9, '2022-01-26', 'sell-1643200013', 2000.00, 25.00, 1200.00, 'bKash', 1, '2022-01-26 06:26:53', '2022-01-26 06:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'System-Admin', 'admin@gmail.com', NULL, '$2y$10$Tx0Jq2aFpD3EDTzrN8YRX.cNEMCDhT1k58sedwzYOKTRejhBJLZSe', NULL, '2022-01-26 03:15:09', '2022-01-26 03:15:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_mobile_unique` (`mobile`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `point_settings`
--
ALTER TABLE `point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`);

--
-- Indexes for table `reward_settings`
--
ALTER TABLE `reward_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_masters`
--
ALTER TABLE `sale_masters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sale_masters_ref_number_unique` (`ref_number`),
  ADD KEY `sale_masters_customer_id_foreign` (`customer_id`);

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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `point_settings`
--
ALTER TABLE `point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reward_settings`
--
ALTER TABLE `reward_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sale_masters`
--
ALTER TABLE `sale_masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_masters`
--
ALTER TABLE `sale_masters`
  ADD CONSTRAINT `sale_masters_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
