-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2026 at 10:18 AM
-- Server version: 8.4.7
-- PHP Version: 8.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE IF NOT EXISTS `alerts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `refrigerator_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'critical_temperature',
  `message` text NOT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `alerted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alerts_refrigerator_id_foreign` (`refrigerator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `refrigerator_id`, `type`, `message`, `temperature`, `alerted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'critical_temperature', 'Critical temperature detected above 8°C', 9.50, '2026-06-12 00:53:11', '2026-06-12 00:53:11', '2026-06-12 00:53:11'),
(2, 1, 'critical_temperature', 'Critical temperature above 8°C detected', 10.50, '2026-06-12 03:16:40', '2026-06-12 03:16:40', '2026-06-12 03:16:40'),
(3, 1, 'critical_temperature', 'Critical temperature above 8°C detected', 10.50, '2026-06-12 03:17:07', '2026-06-12 03:17:07', '2026-06-12 03:17:07'),
(4, 1, 'critical_temperature', 'Critical temperature above 8°C detected', 10.50, '2026-06-12 03:39:53', '2026-06-12 03:39:53', '2026-06-12 03:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `blood_bags`
--

DROP TABLE IF EXISTS `blood_bags`;
CREATE TABLE IF NOT EXISTS `blood_bags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `refrigerator_id` bigint UNSIGNED NOT NULL,
  `bag_number` varchar(191) NOT NULL,
  `blood_group` varchar(191) NOT NULL,
  `donor_name` varchar(191) NOT NULL,
  `collection_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity_ml` int NOT NULL,
  `status` enum('Available','Reserved','Dispatched','Expired') NOT NULL DEFAULT 'Available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blood_bags_bag_number_unique` (`bag_number`),
  KEY `blood_bags_refrigerator_id_foreign` (`refrigerator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood_bags`
--

INSERT INTO `blood_bags` (`id`, `refrigerator_id`, `bag_number`, `blood_group`, `donor_name`, `collection_date`, `expiry_date`, `quantity_ml`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'BAG-003', 'A-', 'Sangeeta', '2026-06-12', '2026-07-12', 500, 'Available', '2026-06-12 04:00:52', '2026-06-12 04:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `blood_banks`
--

DROP TABLE IF EXISTS `blood_banks`;
CREATE TABLE IF NOT EXISTS `blood_banks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood_banks`
--

INSERT INTO `blood_banks` (`id`, `name`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Central Blood Bank', 'Kochi', '2026-06-12 00:38:04', '2026-06-12 00:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_12_045920_create_personal_access_tokens_table', 1),
(5, '2026_06_12_050021_create_blood_banks_table', 1),
(6, '2026_06_12_050022_create_blood_bags_table', 1),
(7, '2026_06_12_050022_create_refrigerators_table', 1),
(8, '2026_06_12_050022_create_temperature_logs_table', 1),
(9, '2026_06_12_050025_create_alerts_table', 1),
(10, '2026_06_12_050041_add_role_to_users_table', 1),
(11, '2026_06_12_052816_add_role_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', '915e158e09a60c5ea914e145c6b844339eccbd1f4b2fb5aa3eefb066b86a8d5a', '[\"*\"]', NULL, NULL, '2026-06-12 00:30:18', '2026-06-12 00:30:18'),
(2, 'App\\Models\\User', 1, 'api-token', 'bb978d6205a54bfd5981412560479aad569068077e55f70b350daa78c3851f21', '[\"*\"]', '2026-06-12 01:45:17', NULL, '2026-06-12 00:34:43', '2026-06-12 01:45:17'),
(4, 'App\\Models\\User', 1, 'api-token', '22d1c77f28632162efa73f2a6f459a3e7b83ccc0f31c5d1f0d133ff0819bf942', '[\"*\"]', '2026-06-12 03:52:56', NULL, '2026-06-12 01:50:44', '2026-06-12 03:52:56'),
(5, 'App\\Models\\User', 1, 'api-token', '0abfde2da73146cf41e1fad2e3ab2537ac72c52e0433201a965d8e52d615b575', '[\"*\"]', NULL, NULL, '2026-06-12 01:52:33', '2026-06-12 01:52:33'),
(6, 'App\\Models\\User', 1, 'api-token', '823fc47b1c2940ec88d79b6279eef848e4e50d4d79617631c1e5f7d69e1a6231', '[\"*\"]', NULL, NULL, '2026-06-12 03:16:08', '2026-06-12 03:16:08'),
(7, 'App\\Models\\User', 1, 'api-token', '79c2420664348c469ea858d2f806d91cf173858789bf9d8c0e722ef755e88ee5', '[\"*\"]', '2026-06-12 03:39:54', NULL, '2026-06-12 03:38:36', '2026-06-12 03:39:54'),
(8, 'App\\Models\\User', 1, 'api-token', 'a6d83f13ae134f800bac97d7da8a7e068cfc437260b7cf611428084531f8d8ae', '[\"*\"]', NULL, NULL, '2026-06-12 03:39:50', '2026-06-12 03:39:50'),
(10, 'App\\Models\\User', 1, 'api-token', '8a480af2fac30a8046f3b70ab6779320fdb68e1ed81debabf697da73a17c1f68', '[\"*\"]', NULL, NULL, '2026-06-12 04:04:52', '2026-06-12 04:04:52'),
(11, 'App\\Models\\User', 1, 'api-token', '509bb643e2c857789e0b7c84a202413ad612e060ef77fb52de319e03115d8600', '[\"*\"]', '2026-06-12 04:14:05', NULL, '2026-06-12 04:07:22', '2026-06-12 04:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `refrigerators`
--

DROP TABLE IF EXISTS `refrigerators`;
CREATE TABLE IF NOT EXISTS `refrigerators` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `blood_bank_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refrigerators_code_unique` (`code`),
  KEY `refrigerators_blood_bank_id_foreign` (`blood_bank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `refrigerators`
--

INSERT INTO `refrigerators` (`id`, `blood_bank_id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Refrigerator', 'REF-001', 'active', '2026-06-12 00:38:18', '2026-06-12 00:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WalPmeeSGOsPJbw5Tl4JKgR0kTuwD2fCe7tSzTbo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYld3TXlnUkFHTlZEV3oyMlhjR0I1QWltOUtOVW8ycjNyQUh0aGRrTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781247885),
('qRskGgJ8usNgV8tgwXOpYLiSi79iDVKuEMRCk5Qs', NULL, '127.0.0.1', 'PostmanRuntime/7.54.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0VDOHFLOXNVN2g0dWtRNFdialdGWFVsVjNnRDVLblRaelJCc01uNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781255392);

-- --------------------------------------------------------

--
-- Table structure for table `temperature_logs`
--

DROP TABLE IF EXISTS `temperature_logs`;
CREATE TABLE IF NOT EXISTS `temperature_logs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `refrigerator_id` bigint UNSIGNED NOT NULL,
  `temperature` decimal(5,2) NOT NULL,
  `logged_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temperature_logs_refrigerator_id_foreign` (`refrigerator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `temperature_logs`
--

INSERT INTO `temperature_logs` (`id`, `refrigerator_id`, `temperature`, `logged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 9.50, '2026-06-12 00:53:11', '2026-06-12 00:53:11', '2026-06-12 00:53:11'),
(2, 1, 10.50, '2026-06-12 03:16:40', '2026-06-12 03:16:40', '2026-06-12 03:16:40'),
(3, 1, 10.50, '2026-06-12 03:17:07', '2026-06-12 03:17:07', '2026-06-12 03:17:07'),
(4, 1, 10.50, '2026-06-12 03:39:53', '2026-06-12 03:39:53', '2026-06-12 03:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$c20sVlh56cXsPFQAgm2C1O7vFy1jsx.zW.ydZy1XdpLtsIRYy7lbK', 'admin', NULL, '2026-06-12 00:29:35', '2026-06-12 00:29:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
