-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for event_management
CREATE DATABASE IF NOT EXISTS `event_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `event_management`;

-- Dumping structure for table event_management.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.city: ~33 rows (approximately)
DELETE FROM `city`;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'SUMATERA UTARA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(2, 'SUMATERA BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(3, 'RIAU\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(4, 'JAMBI\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(5, 'SUMATERA SELATAN\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(6, 'BENGKULU\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(7, 'LAMPUNG\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(8, 'KEPULAUAN BANGKA BELITUNG\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(9, 'KEPULAUAN RIAU\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(10, 'DKI JAKARTA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(11, 'JAWA BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(12, 'JAWA TENGAH\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(13, 'DI YOGYAKARTA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(14, 'JAWA TIMUR\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(15, 'BANTEN\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(16, 'BALI\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(17, 'NUSA TENGGARA BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(18, 'NUSA TENGGARA TIMUR\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(19, 'KALIMANTAN BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(20, 'KALIMANTAN TENGAH\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(21, 'KALIMANTAN SELATAN\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(22, 'KALIMANTAN TIMUR\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(23, 'KALIMANTAN UTARA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(24, 'SULAWESI UTARA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(25, 'SULAWESI TENGAH\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(26, 'SULAWESI SELATAN\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(27, 'SULAWESI TENGGARA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(28, 'GORONTALO\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(29, 'SULAWESI BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(30, 'MALUKU\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(31, 'MALUKU UTARA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(32, 'PAPUA BARAT\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08'),
	(33, 'PAPUA\r', '2020-10-03 12:08:08', '2020-10-03 12:08:08');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table event_management.detail_transactions
CREATE TABLE IF NOT EXISTS `detail_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) NOT NULL,
  `id_transaction` int(11) NOT NULL,
  `quote` int(11) NOT NULL,
  `price_per_ticket` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_detail_transactions_tickets` (`id_ticket`),
  KEY `FK_detail_transactions_transactions` (`id_transaction`),
  CONSTRAINT `FK_detail_transactions_tickets` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.detail_transactions: ~0 rows (approximately)
DELETE FROM `detail_transactions`;
/*!40000 ALTER TABLE `detail_transactions` DISABLE KEYS */;
INSERT INTO `detail_transactions` (`id`, `id_ticket`, `id_transaction`, `quote`, `price_per_ticket`, `created_at`, `updated_at`) VALUES
	(4, 1, 1, 10, 90000, '2020-10-04 06:24:54', '2020-10-04 06:24:54'),
	(5, 2, 1, 10, 50000, '2020-10-04 06:24:54', '2020-10-04 06:24:54'),
	(6, 2, 1, 10, 50000, '2020-10-04 06:24:54', '2020-10-04 06:24:54'),
	(7, 3, 1, 10, 70000, '2020-10-04 06:24:54', '2020-10-04 06:24:54'),
	(8, 1, 1, 10, 90000, '2020-10-04 06:24:54', '2020-10-04 06:24:54');
/*!40000 ALTER TABLE `detail_transactions` ENABLE KEYS */;

-- Dumping structure for table event_management.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `id_location` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `ticket_sale_open` timestamp NOT NULL,
  `ticket_sale_close` timestamp NOT NULL,
  `event_open_time` timestamp NOT NULL,
  `event_close_time` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_image_url` text,
  PRIMARY KEY (`id`),
  KEY `FK_events_locations` (`id_location`),
  CONSTRAINT `FK_events_locations` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.events: ~3 rows (approximately)
DELETE FROM `events`;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `name`, `id_location`, `description`, `ticket_sale_open`, `ticket_sale_close`, `event_open_time`, `event_close_time`, `created_at`, `updated_at`, `event_image_url`) VALUES
	(1, 'Student Seminar', 1, 'Seminar internasional', '2020-10-04 10:50:00', '2020-10-07 10:50:00', '2020-10-12 10:20:00', '2020-10-14 10:20:00', '2020-10-04 01:39:38', '2020-10-04 01:39:38', 'C:\\Users\\DANS\\Desktop\\Ticketing_System\\public/eventImages/myw3schoolsimage_1.jpg'),
	(2, 'Student National Seminar', 2, 'Seminar Nasional', '2020-10-04 10:50:00', '2020-10-07 10:50:00', '2020-10-12 10:20:00', '2020-10-14 10:20:00', '2020-10-04 01:40:09', '2020-10-04 01:40:09', 'C:\\Users\\DANS\\Desktop\\Ticketing_System\\public/eventImages/myw3schoolsimage_2.jpg'),
	(3, 'Student National Seminar Oktober 2020', 2, 'Seminar Nasional Seminar Oktober 2020', '2020-10-04 10:50:00', '2020-10-07 10:50:00', '2020-10-12 10:20:00', '2020-10-14 10:20:00', '2020-10-04 06:10:16', '2020-10-04 06:10:16', 'C:\\Users\\DANS\\Desktop\\Ticketing_System\\public/eventImages/myw3schoolsimage_3.jpg');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

-- Dumping structure for table event_management.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table event_management.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_detail` longtext NOT NULL,
  `id_city` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_locations_city` (`id_city`),
  CONSTRAINT `FK_locations_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.locations: ~8 rows (approximately)
DELETE FROM `locations`;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `location_detail`, `id_city`, `created_at`, `updated_at`) VALUES
	(1, 'Mampang', 8, '2020-10-03 12:07:22', '2020-10-03 12:07:22'),
	(2, 'Menteng', 8, '2020-10-04 08:27:05', '2020-10-04 08:40:24'),
	(3, 'Jatinegara', 12, '2020-10-04 08:27:05', '2020-10-04 08:40:24'),
	(4, 'Buaran', 12, '2020-10-04 08:27:05', '2020-10-04 08:40:24'),
	(5, 'Klender', 11, '2020-10-04 08:27:05', '2020-10-04 08:41:10'),
	(6, 'Rawamangun', 19, '2020-10-04 08:27:05', '2020-10-04 08:40:54'),
	(7, 'Tebet Barat', 18, '2020-10-04 13:07:12', '2020-10-04 13:07:12'),
	(8, 'Pancoran', 17, '2020-10-04 13:07:58', '2020-10-04 13:07:58');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Dumping structure for table event_management.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.migrations: ~3 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table event_management.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table event_management.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quote` bigint(20) NOT NULL,
  `available_stock` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_tickets_events` (`id_event`),
  CONSTRAINT `FK_tickets_events` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.tickets: ~6 rows (approximately)
DELETE FROM `tickets`;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `id_event`, `name`, `price`, `quote`, `available_stock`, `created_at`, `updated_at`) VALUES
	(1, 1, 'VIP', 90000, 40, 40, '2020-10-04 08:51:52', '2020-10-04 13:25:05'),
	(2, 1, 'Reguler', 50000, 40, 39, '2020-10-04 08:51:52', '2020-10-04 13:25:09'),
	(3, 1, 'Premium', 70000, 40, 30, '2020-10-04 08:51:52', '2020-10-04 13:25:11'),
	(4, 2, 'VIP', 120000, 1, 1, '2020-10-04 08:52:44', '2020-10-04 09:01:29'),
	(5, 2, 'First Class', 90000, 70, 70, '2020-10-04 08:53:10', '2020-10-04 09:01:27'),
	(6, 3, 'Second Grade', 100000, 50, 50, '2020-10-04 13:22:25', '2020-10-04 13:22:25');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Dumping structure for table event_management.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `id_event` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_transactions_users` (`id_user`),
  KEY `FK_transactions_events` (`id_event`),
  CONSTRAINT `FK_transactions_events` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`),
  CONSTRAINT `FK_transactions_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table event_management.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `id_user`, `id_event`, `total_price`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, 3500000, '2020-10-04 06:24:54', '2020-10-04 06:24:54');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table event_management.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.users: ~7 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Bara', 'bara12@gmail.com', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(2, 'Dimas', 'dimas12@gmail.com', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(3, 'Rendy', 'rendy12@mail.me', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(4, 'Dina', 'dina12@gmail.com', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(5, 'Dani', 'dani12@gmail.com', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(6, 'Putri', 'putri12@mail.me', NULL, '1231ajhdcba', NULL, NULL, NULL),
	(7, 'Rahmi', 'rahmi12@mail.me', NULL, '1231ajhdcba', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
