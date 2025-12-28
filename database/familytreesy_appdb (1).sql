-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 28, 2025 at 11:40 PM
-- Server version: 10.5.29-MariaDB-log
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `familytreesy_appdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'دمشق', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(2, 'حلب', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(3, 'حمص', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(4, 'حماة', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(5, 'اللاذقية', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(6, 'طرطوس', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(7, 'دير الزور', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(8, 'الرقة', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(9, 'الحسكة', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(10, 'درعا', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(11, 'السويداء', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(12, 'القنيطرة', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(13, 'إدلب', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL),
(14, 'ريف دمشق', NULL, NULL, '2025-12-28 14:51:19', '2025-12-28 14:51:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `committees`
--

CREATE TABLE `committees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '2',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_events`
--

CREATE TABLE `committee_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `committee_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_members`
--

CREATE TABLE `committee_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `committee_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `votes_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_votes`
--

CREATE TABLE `committee_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `committee_id` bigint(20) UNSIGNED NOT NULL,
  `voter_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_family` varchar(191) DEFAULT NULL,
  `box` decimal(12,2) NOT NULL DEFAULT 0.00,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `historical_events`
--

CREATE TABLE `historical_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `join_request_reviews`
--

CREATE TABLE `join_request_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `join_request_id` bigint(20) UNSIGNED NOT NULL,
  `reviewer_id` bigint(20) UNSIGNED NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(191) NOT NULL,
  `extension` varchar(191) NOT NULL,
  `for` enum('user-profile','photograph','achievement','historical-event','certificate','committee-event','content') NOT NULL,
  `type` enum('1','2') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_photographs`
--

CREATE TABLE `media_photographs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `photograph_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `father_name` varchar(191) DEFAULT NULL,
  `mother_name` varchar(191) DEFAULT NULL,
  `family_name` varchar(191) DEFAULT NULL,
  `gender` enum('1','2') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `birth_place` varchar(191) DEFAULT NULL,
  `death_place` varchar(191) DEFAULT NULL,
  `health_status` text DEFAULT NULL,
  `work` text DEFAULT NULL,
  `number_of_family_members` int(11) DEFAULT NULL,
  `persons_know` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`persons_know`)),
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `marital_status` enum('1','2','3','4') DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `father_name`, `mother_name`, `family_name`, `gender`, `birth_date`, `death_date`, `birth_place`, `death_place`, `health_status`, `work`, `number_of_family_members`, `persons_know`, `status`, `blood_type`, `marital_status`, `user_id`, `city_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(11, 'محمد', 'سعاد', NULL, '1', '1990-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 24, 1, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(12, 'علي', 'نور', NULL, '2', '1991-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 8, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 25, 9, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(13, 'حسن', 'هدى', NULL, '1', '1992-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 7, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 26, 6, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(14, 'أحمد', 'فاطمة', NULL, '2', '1993-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 27, 4, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(15, 'سعيد', 'ليلى', NULL, '1', '1994-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 2, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 28, 2, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(16, 'محمود', 'آمنة', NULL, '2', '1995-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 7, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 29, 2, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(17, 'إبراهيم', 'خديجة', NULL, '1', '1996-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 30, 12, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(18, 'عبدالله', 'رقية', NULL, '2', '1997-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 31, 4, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(19, 'خالد', 'مريم', NULL, '1', '1998-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 5, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 32, 6, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17'),
(20, 'حسين', 'زهرة', NULL, '2', '1999-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', '1', 'O+', '2', 33, 14, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `member_certificates`
--

CREATE TABLE `member_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_01_03_203528_create_media_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2025_06_02_094640_create_permission_tables', 1),
(8, '2025_06_02_131701_create_cities_table', 1),
(9, '2025_06_02_132217_create_members_table', 1),
(10, '2025_06_03_084301_create_otps_table', 1),
(11, '2025_06_03_095135_create_nodes_table', 1),
(12, '2025_06_03_110107_create_join_request_reviews_table', 1),
(13, '2025_06_15_091630_create_historical_events_table', 1),
(14, '2025_06_15_092016_create_achievements_table', 1),
(15, '2025_06_15_095551_create_photographs_table', 1),
(16, '2025_06_15_113357_create_committees_table', 1),
(17, '2025_06_15_114503_create_committee_members_table', 1),
(18, '2025_06_15_115740_create_committee_votes_table', 1),
(19, '2025_06_16_074118_create_donations_table', 1),
(20, '2025_06_16_080800_create_general_settings_table', 1),
(21, '2025_06_18_071632_create_media_photographs_table', 1),
(22, '2025_06_26_172231_create_notifications_table', 1),
(23, '2025_07_28_071857_create_member_certificates_table', 1),
(24, '2025_08_02_063817_create_committee_events_table', 1),
(25, '2025_08_12_082731_add_attachment_id_to_users_table', 1),
(26, '2025_08_12_111627_change_content_col_to_longtext', 1),
(27, '2025_08_13_081904_add_family_name_to_nodes_table', 1),
(28, '2025_08_13_083358_add_family_name_to_members_table', 1),
(29, '2025_08_18_064703_create_node_certificates_table', 1),
(30, '2025_08_18_094722_add_birth_and_death_place_to_members_and_nodes_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33);

-- --------------------------------------------------------

--
-- Table structure for table `nodes`
--

CREATE TABLE `nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) DEFAULT NULL,
  `father_name` varchar(191) DEFAULT NULL,
  `mother_name` varchar(191) DEFAULT NULL,
  `gender` enum('1','2') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `birth_place` varchar(191) DEFAULT NULL,
  `death_place` varchar(191) DEFAULT NULL,
  `health_status` text DEFAULT NULL,
  `work` text DEFAULT NULL,
  `number_of_family_members` int(11) DEFAULT NULL,
  `persons_know` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`persons_know`)),
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `marital_status` enum('1','2','3','4') DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1',
  `family_name` varchar(191) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`id`, `full_name`, `father_name`, `mother_name`, `gender`, `birth_date`, `death_date`, `birth_place`, `death_place`, `health_status`, `work`, `number_of_family_members`, `persons_know`, `blood_type`, `marital_status`, `city_id`, `member_id`, `parent_id`, `type`, `family_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'أحمد محمد', 'محمد', 'سعاد', '1', '1990-01-15', NULL, NULL, NULL, 'جيدة', 'موظف', 4, '[\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 1\",\"\\u0634\\u062e\\u0635 \\u0645\\u0639\\u0631\\u0648\\u0641 2\"]', 'O+', '2', 1, 24, NULL, '1', NULL, 24, 24, '2025-12-28 15:11:13', '2025-12-28 15:11:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `node_certificates`
--

CREATE TABLE `node_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `node_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `type` enum('1','2','3','4','5','6','7','8','9') DEFAULT NULL,
  `slide` enum('1','2','3') DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime DEFAULT NULL,
  `topic_target` varchar(191) DEFAULT NULL,
  `entity_type` varchar(191) DEFAULT NULL,
  `entity_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `otp` varchar(191) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `mobile`, `otp`, `expires_at`, `is_verified`, `created_at`, `updated_at`) VALUES
(3, '999999999', '12345', '2025-12-28 14:49:16', 0, '2025-10-21 13:31:04', '2025-12-28 14:44:16'),
(4, '958909419', '12345', '2025-10-21 13:47:38', 0, '2025-10-21 13:42:38', '2025-10-21 13:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'can_view_general_settings', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(2, 'can_update_general_settings', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(3, 'can_view_member_statistic', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(4, 'can_view_admin_statistic', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(5, 'can_create_permissions', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(6, 'can_view_all_permissions', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(7, 'can_view_permissions', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(8, 'can_update_permissions', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(9, 'can_delete_permissions', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(10, 'can_create_media', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(11, 'can_view_all_media', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(12, 'can_view_media', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(13, 'can_update_media', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(14, 'can_delete_media', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(15, 'can_create_members', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(16, 'can_view_all_members', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(17, 'can_view_members', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(18, 'can_update_members', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(19, 'can_delete_members', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(20, 'can_create_cities', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(21, 'can_view_all_cities', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(22, 'can_view_cities', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(23, 'can_update_cities', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(24, 'can_delete_cities', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(25, 'can_create_nodes', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(26, 'can_view_all_nodes', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(27, 'can_view_nodes', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(28, 'can_update_nodes', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(29, 'can_delete_nodes', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(30, 'can_create_join_request_reviews', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(31, 'can_view_all_join_request_reviews', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(32, 'can_view_join_request_reviews', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(33, 'can_update_join_request_reviews', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(34, 'can_delete_join_request_reviews', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(35, 'can_create_historical_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(36, 'can_view_all_historical_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(37, 'can_view_historical_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(38, 'can_update_historical_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(39, 'can_delete_historical_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(40, 'can_create_achievements', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(41, 'can_view_all_achievements', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(42, 'can_view_achievements', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(43, 'can_update_achievements', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(44, 'can_delete_achievements', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(45, 'can_create_photographs', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(46, 'can_view_all_photographs', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(47, 'can_view_photographs', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(48, 'can_update_photographs', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(49, 'can_delete_photographs', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(50, 'can_create_committees', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(51, 'can_view_all_committees', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(52, 'can_view_committees', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(53, 'can_update_committees', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(54, 'can_delete_committees', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(55, 'can_create_donations', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(56, 'can_view_all_donations', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(57, 'can_view_donations', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(58, 'can_update_donations', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(59, 'can_delete_donations', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(60, 'can_create_committee_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(61, 'can_view_all_committee_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(62, 'can_view_committee_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(63, 'can_update_committee_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(64, 'can_delete_committee_events', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(65, 'can_create_join_requests', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(66, 'can_view_all_join_requests', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(67, 'can_view_join_requests', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(68, 'can_update_join_requests', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(69, 'can_delete_join_requests', 'sanctum', '2025-12-28 15:06:17', '2025-12-28 15:06:17'),
(70, 'can_view_member_stats', 'sanctum', '2025-12-28 15:09:18', '2025-12-28 15:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('1','2') NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photographs`
--

CREATE TABLE `photographs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '3',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'sanctum', '2025-12-28 14:39:45', '2025-12-28 14:39:45'),
(3, 'member', 'sanctum', '2025-12-28 14:39:45', '2025-12-28 14:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(3, 3),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(11, 3),
(12, 2),
(12, 3),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(16, 3),
(17, 2),
(17, 3),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(25, 3),
(26, 2),
(26, 3),
(27, 2),
(27, 3),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(35, 3),
(36, 2),
(36, 3),
(37, 2),
(37, 3),
(38, 2),
(39, 2),
(40, 2),
(40, 3),
(41, 2),
(41, 3),
(42, 2),
(42, 3),
(43, 2),
(44, 2),
(45, 2),
(45, 3),
(46, 2),
(46, 3),
(47, 2),
(47, 3),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(51, 3),
(52, 2),
(52, 3),
(53, 2),
(54, 2),
(55, 2),
(55, 3),
(56, 2),
(56, 3),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(61, 3),
(62, 2),
(62, 3),
(63, 2),
(64, 2),
(65, 2),
(65, 3),
(66, 2),
(67, 2),
(68, 2),
(69, 2);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(191) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '9ffc44ef-798d-468b-8855-9d9aa0bc5114', '9ffc44ef-7a90-4233-bf0f-be1e1049f26d', '2538d91a72170f16cb2ffb5805439a49', 1, 'exception', '{\"class\":\"Spatie\\\\Permission\\\\Exceptions\\\\RoleDoesNotExist\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Exceptions\\/RoleDoesNotExist.php\",\"line\":11,\"message\":\"There is no role named `member` for guard `sanctum`.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Models\\/Role.php\",\"line\":105},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasRoles.php\",\"line\":412},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasRoles.php\",\"line\":131},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Collections\\/Traits\\/EnumeratesValues.php\",\"line\":734},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasRoles.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasRoles.php\",\"line\":150},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Services\\/RequestJoinService.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Concerns\\/ManagesTransactions.php\",\"line\":30},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/DatabaseManager.php\",\"line\":469},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Facades\\/Facade.php\",\"line\":338},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Services\\/RequestJoinService.php\",\"line\":22},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Controllers\\/RequestJoinController.php\",\"line\":52},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Controller.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ControllerDispatcher.php\",\"line\":43},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":259},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":205},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":798},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":50},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":92},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"2\":\"\",\"3\":\"namespace Spatie\\\\Permission\\\\Exceptions;\",\"4\":\"\",\"5\":\"use InvalidArgumentException;\",\"6\":\"\",\"7\":\"class RoleDoesNotExist extends InvalidArgumentException\",\"8\":\"{\",\"9\":\"    public static function named(string $roleName, ?string $guardName)\",\"10\":\"    {\",\"11\":\"        return new static(__(\'There is no role named `:role` for guard `:guard`.\', [\",\"12\":\"            \'role\' => $roleName,\",\"13\":\"            \'guard\' => $guardName,\",\"14\":\"        ]));\",\"15\":\"    }\",\"16\":\"\",\"17\":\"    \\/**\",\"18\":\"     * @param  int|string  $roleId\",\"19\":\"     * @return static\",\"20\":\"     *\\/\",\"21\":\"    public static function withId($roleId, ?string $guardName)\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-09-28 11:19:31'),
(2, '9ffc44ef-7a4f-4bb1-b6d0-15839cdf8a12', '9ffc44ef-7a90-4233-bf0f-be1e1049f26d', NULL, 1, 'request', '{\"ip_address\":\"198.145.149.50\",\"uri\":\"\\/api\\/request\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\RequestJoinController@store\",\"middleware\":[\"api\"],\"headers\":{\"sec-fetch-site\":\"same-site\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"https:\\/\\/familytree-sy.com\\/\",\"connection\":\"keep-alive\",\"origin\":\"https:\\/\\/familytree-sy.com\",\"content-length\":\"287\",\"content-type\":\"application\\/json\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"accept-language\":\"null\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko\\/20100101 Firefox\\/143.0\",\"host\":\"backend.familytree-sy.com\",\"authorization\":\"********\"},\"payload\":{\"fullName\":\"\\u0644\\u064a\\u062b\",\"fatherName\":\"\\u062d\",\"motherName\":\"\\u0647\",\"mobile\":\"958909419\",\"personsKnow\":[],\"gender\":\"1\",\"birthDate\":\"1990-02-09\",\"healthStatus\":null,\"work\":\"\\u0645\\u0647\\u0646\\u062f\\u0633\",\"numberOfFamilyMembers\":0,\"bloodType\":\"A+\",\"maritalStatus\":\"2\",\"fcm_token\":null,\"certificates\":[],\"birthPlace\":\"\\u062f\"},\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Sun, 28 Sep 2025 11:19:31 GMT\",\"content-type\":\"application\\/json\",\"x-ratelimit-limit\":\"60\",\"x-ratelimit-remaining\":\"59\",\"access-control-allow-origin\":\"https:\\/\\/familytree-sy.com\",\"vary\":\"Origin\",\"access-control-allow-credentials\":\"true\"},\"response_status\":500,\"response\":{\"message\":\"Server Error\"},\"duration\":95,\"memory\":2,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-09-28 11:19:31'),
(3, 'a02b1523-9c80-496d-ad24-53aa583c0605', 'a02b1523-9dc8-47a5-ac83-45bc25902af2', 'fd93c7458d99d3cf6ed7fdff1336053a', 0, 'exception', '{\"class\":\"ParseError\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Requests\\/Auth\\/LoginRequest.php\",\"line\":29,\"message\":\"syntax error, unexpected token \\\"{\\\"\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/composer\\/ClassLoader.php\",\"line\":427},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Reflector.php\",\"line\":153},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":533},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":28},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":947},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":92},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/VerifyCsrfToken.php\",\"line\":78},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":121},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":64},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/EncryptCookies.php\",\"line\":67},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":162},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"20\":\"            \'fcm_token\' => [\'nullable\', \'string\'],\\r\",\"21\":\"            ];\\r\",\"22\":\"    }\\r\",\"23\":\"    \\r\",\"24\":\"    \\r\",\"25\":\"    \\r\",\"26\":\"    protected function passedValidation(): void\\r\",\"27\":\"    {\\r\",\"28\":\"        \\/\\/ Add the same transformation as SendOtpRequest\\r\",\"29\":\"        if (!empty($this->mobile) {\\r\",\"30\":\"            $mobile = substr($this->mobile, 1);\\r\",\"31\":\"            $this->merge([\'mobile\' => $mobile]);\\r\",\"32\":\"        }\\r\",\"33\":\"    }\\r\",\"34\":\"}\\r\",\"35\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-10-21 17:49:46'),
(4, 'a02b1523-9d76-4321-8033-0cae5bf3cfaf', 'a02b1523-9dc8-47a5-ac83-45bc25902af2', NULL, 1, 'request', '{\"ip_address\":\"217.138.162.236\",\"uri\":\"\\/api\\/auth\\/login-admin\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\AuthController@login\",\"middleware\":[\"api\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"referer\":\"https:\\/\\/dashboard.familytree-sy.com\\/\",\"sec-fetch-dest\":\"empty\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-site\":\"same-site\",\"origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"sec-ch-ua-mobile\":\"?0\",\"content-type\":\"application\\/json\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"141\\\", \\\"Not?A_Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"141\\\"\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/141.0.0.0 Safari\\/537.36\",\"x-xsrf-token\":\"********\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"content-length\":\"54\",\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\"},\"payload\":{\"code\":\"12345\",\"mobile\":\"999999999\",\"fcm_token\":null},\"session\":{\"_token\":\"********\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"https:\\/\\/backend.familytree-sy.com\\/api\\/get-admin-statistic\"}},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Tue, 21 Oct 2025 17:49:46 GMT\",\"content-type\":\"application\\/json\",\"x-ratelimit-limit\":\"60\",\"x-ratelimit-remaining\":\"56\",\"access-control-allow-origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"vary\":\"Origin\",\"access-control-allow-credentials\":\"true\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImhBNW01SlpUVzhvdE13WmdDTkJ4K3c9PSIsInZhbHVlIjoianNEQ0NFUytwMndCaDIwOFdEcWFDdDJZNGN2NnpiNmJEUEVVUGhrSTFTUG9kWE15YWdCeVNaYlE4bHhDYjE1NXhPS3V6QzhoN041RkFYMlBIZis3bzhzSFkvRUZ2RmhjSEZ5aStIRksycjlrSElnTlJzVkRJYWxrK1hwOS84d1MiLCJtYWMiOiI0OWFlN2JhZjVhNTRjOGNlYWZiZjVjZDY4YjVmMzFjMzM1MjcwYWZjOWVkMTIzNTdkMjg5MjhmYTc2Yjc0MzQ2IiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:49:46 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; samesite=lax, family_tree_backend_session=eyJpdiI6IlNaNnh2a09yT2RxUDVVY3R6ODFLWVE9PSIsInZhbHVlIjoiNUJoVU1Ub0J4WmJFcFJQZnZETWlWdHpOYmUvcWtEQkZEUndyVEtYVVlMcVpkck92U2ZkMWNKclJnbC9ub3ZXRkRmQVlOWFZzeFhkejB4VHgxTkxOZFdKdHhTSGRmTXZnS2FPWFN3OGJJWmM4SCtJajhSME10NGZHRktQaE5MS2ciLCJtYWMiOiI5ZTZmYjc5NGQ2YTI3NzgzMGYyNzY2MGM0NTY5MWNkOTY4YjVmMjI2NTdhYWIyNDkzMjkwYmU1NjgzMTY1NWE5IiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:49:46 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; httponly; samesite=lax\"},\"response_status\":500,\"response\":{\"message\":\"Server Error\"},\"duration\":30,\"memory\":2,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-10-21 17:49:46'),
(5, 'a02b153f-78b6-4a0f-a71b-330f80349a81', 'a02b153f-7950-4247-8772-38fbea7c1070', 'fd93c7458d99d3cf6ed7fdff1336053a', 0, 'exception', '{\"class\":\"ParseError\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Requests\\/Auth\\/LoginRequest.php\",\"line\":29,\"message\":\"syntax error, unexpected token \\\"{\\\"\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/composer\\/ClassLoader.php\",\"line\":427},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Reflector.php\",\"line\":153},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":533},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":28},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":947},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":92},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/VerifyCsrfToken.php\",\"line\":78},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":121},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":64},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/EncryptCookies.php\",\"line\":67},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":162},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"20\":\"            \'fcm_token\' => [\'nullable\', \'string\'],\\r\",\"21\":\"            ];\\r\",\"22\":\"    }\\r\",\"23\":\"    \\r\",\"24\":\"    \\r\",\"25\":\"    \\r\",\"26\":\"    protected function passedValidation(): void\\r\",\"27\":\"    {\\r\",\"28\":\"        \\/\\/ Add the same transformation as SendOtpRequest\\r\",\"29\":\"        if (!empty($this->mobile) {\\r\",\"30\":\"            $mobile = substr($this->mobile, 1);\\r\",\"31\":\"            $this->merge([\'mobile\' => $mobile]);\\r\",\"32\":\"        }\\r\",\"33\":\"    }\\r\",\"34\":\"}\\r\",\"35\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":2}', '2025-10-21 17:50:05'),
(6, 'a02b153f-7929-4d0b-aa88-61982b73c104', 'a02b153f-7950-4247-8772-38fbea7c1070', NULL, 1, 'request', '{\"ip_address\":\"217.138.162.236\",\"uri\":\"\\/api\\/auth\\/login-admin\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\AuthController@login\",\"middleware\":[\"api\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"referer\":\"https:\\/\\/dashboard.familytree-sy.com\\/\",\"sec-fetch-dest\":\"empty\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-site\":\"same-site\",\"origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"sec-ch-ua-mobile\":\"?0\",\"content-type\":\"application\\/json\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"141\\\", \\\"Not?A_Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"141\\\"\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/141.0.0.0 Safari\\/537.36\",\"x-xsrf-token\":\"********\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"content-length\":\"54\",\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\"},\"payload\":{\"code\":\"12345\",\"mobile\":\"999999999\",\"fcm_token\":null},\"session\":{\"_token\":\"********\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"https:\\/\\/backend.familytree-sy.com\\/api\\/get-admin-statistic\"}},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Tue, 21 Oct 2025 17:50:05 GMT\",\"content-type\":\"application\\/json\",\"x-ratelimit-limit\":\"60\",\"x-ratelimit-remaining\":\"59\",\"access-control-allow-origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"vary\":\"Origin\",\"access-control-allow-credentials\":\"true\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6InBlMnJ2QXJBN0FRRVpyQjlqdVVFbEE9PSIsInZhbHVlIjoiaXNYT3VPMnFmc2hNQ3haL21IamYyWVFOTDhjLzMzSTRKek92WWRVdUw4S3RveTFFbmJtbmlJZ3huSWxwWWNlczVjdWZONUlDbURoV0g2YldkOEg0dDI2ZE4veTRZZjFwU0VFVGtvVmZsNjhyejhSQnhFSnBlbElXWW1LTW0rdG4iLCJtYWMiOiJjN2YyMzc0MGViMmZlNzAyYzM5NzA4ZmY3ZTQ5Y2JiOTViNzc3YWQ3NTgxNDVhNTlkZTc1YTBhMDQ2M2RkNDIzIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:50:05 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; samesite=lax, family_tree_backend_session=eyJpdiI6IlNHa3FFTllBOXBoeElVZ1hTamV4R1E9PSIsInZhbHVlIjoiOEg2enJvK3ZrSUNZK2k4ZFBNZXBpTFBkbGFncHk3K2xFQ1h4QytRWkx1cUZnKzFveW1HdS84QTdvZkFzRXc2SWV0TS9MU3Q2eHBGK1pTZnoyU00vRmF6M2FqVDhDc2tmUmFCSnZEdTJiT0d6bldGczRnd2tJbkJHbWhUYlZOaVYiLCJtYWMiOiIyNDYyMzU0N2U3OGI0OWI4OTc4ZDQ5MzYzMGE2ZjU2NDc3ZjE1N2FiNGI5ZDgxZDZlOTE4M2JkZWYzMjY3ZDRhIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:50:05 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; httponly; samesite=lax\"},\"response_status\":500,\"response\":{\"message\":\"Server Error\"},\"duration\":18,\"memory\":2,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-10-21 17:50:05'),
(7, 'a02b18a5-ecdb-41db-8394-d92b5b42c8d6', 'a02b18a5-ed65-4cfd-9a42-b71d87aa111c', 'fd93c7458d99d3cf6ed7fdff1336053a', 0, 'exception', '{\"class\":\"ParseError\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Requests\\/Auth\\/LoginRequest.php\",\"line\":29,\"message\":\"syntax error, unexpected token \\\"{\\\"\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/composer\\/ClassLoader.php\",\"line\":427},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Reflector.php\",\"line\":153},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":533},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":28},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":947},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":92},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/VerifyCsrfToken.php\",\"line\":78},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":121},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":64},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/EncryptCookies.php\",\"line\":67},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":162},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"20\":\"            \'fcm_token\' => [\'nullable\', \'string\']\\r\",\"21\":\"            ];\\r\",\"22\":\"    }\\r\",\"23\":\"    \\r\",\"24\":\"    \\r\",\"25\":\"    \\r\",\"26\":\"    protected function passedValidation(): void\\r\",\"27\":\"    {\\r\",\"28\":\"        \\/\\/ Add the same transformation as SendOtpRequest\\r\",\"29\":\"        if (!empty($this->mobile) {\\r\",\"30\":\"            $mobile = substr($this->mobile, 1);\\r\",\"31\":\"            $this->merge([\'mobile\' => $mobile]);\\r\",\"32\":\"        }\\r\",\"33\":\"    }\\r\",\"34\":\"}\\r\",\"35\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":3}', '2025-10-21 17:59:35'),
(8, 'a02b18a5-ed37-4189-9fe4-0a67f92a40aa', 'a02b18a5-ed65-4cfd-9a42-b71d87aa111c', NULL, 1, 'request', '{\"ip_address\":\"217.138.162.236\",\"uri\":\"\\/api\\/auth\\/login-admin\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\AuthController@login\",\"middleware\":[\"api\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"referer\":\"https:\\/\\/dashboard.familytree-sy.com\\/\",\"sec-fetch-dest\":\"empty\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-site\":\"same-site\",\"origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"sec-ch-ua-mobile\":\"?0\",\"content-type\":\"application\\/json\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"141\\\", \\\"Not?A_Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"141\\\"\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/141.0.0.0 Safari\\/537.36\",\"x-xsrf-token\":\"********\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"content-length\":\"54\",\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\"},\"payload\":{\"code\":\"12345\",\"mobile\":\"999999999\",\"fcm_token\":null},\"session\":{\"_token\":\"********\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"https:\\/\\/backend.familytree-sy.com\\/api\\/get-admin-statistic\"}},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Tue, 21 Oct 2025 17:59:35 GMT\",\"content-type\":\"application\\/json\",\"x-ratelimit-limit\":\"60\",\"x-ratelimit-remaining\":\"56\",\"access-control-allow-origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"vary\":\"Origin\",\"access-control-allow-credentials\":\"true\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IkU1MnJBYi9vM2J0YktXT1ZLQnBJSlE9PSIsInZhbHVlIjoiQTVBTmRwLytGZW5Za3NJajh0UDRsTkI5bWdIa2lGNTlWSERuUTVoclo3bVhCV0U4aE1NcjNDUTdrQXpFbXpkazVVR3NEK0ZTVG5hRjcwVnpuMk9VY0FSTnBBTzl6TWZjWUVxZ01KUjZLSEZYTWZCR2pxT1VDUW1VZytJSVVFc0MiLCJtYWMiOiIwMzQ5ZTY4MjUwYzM0OWNmOWFjOGE3MDU3N2UyNWQxYzhjMjZiMTlhNDUwZWM5Y2FjZTJiNDUzMDBiY2NmZGFiIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:59:35 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; samesite=lax, family_tree_backend_session=eyJpdiI6IlpOR0pQUkdFcS9oWkprdHRsdm9LTXc9PSIsInZhbHVlIjoiVHpwNnBIa085QVhFNVNZOWNYb1krVmhqdFZ4L2Y1YUlXdFlkY2ZUZFErS2VTdjFVOFFLOVRCOXNacTdTLytlL3lTWmFDQXpqNGNJSmw3VUlmcWVFcHFkOWRBRXlCOURMc05CdjZJZ0FNcm1JOVRTVVFxUGc0ek1wTkI5WlVQb1QiLCJtYWMiOiJhNDg1YjY2MDFmNWZmYjVhZGJhYTg5NmJiYzQxYzdlMzNlNDYzZTBkZWIyOWI4ZjFjZjRmZTQ4YTkzZTVhZWFlIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:59:35 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; httponly; samesite=lax\"},\"response_status\":500,\"response\":{\"message\":\"Server Error\"},\"duration\":13,\"memory\":2,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-10-21 17:59:35');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(9, 'a02b18b1-ac86-46a3-8ed4-ba0e3e422dc2', 'a02b18b1-ad1f-4421-8280-0d2da9f7124d', 'fd93c7458d99d3cf6ed7fdff1336053a', 1, 'exception', '{\"class\":\"ParseError\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Requests\\/Auth\\/LoginRequest.php\",\"line\":29,\"message\":\"syntax error, unexpected token \\\"{\\\"\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/composer\\/ClassLoader.php\",\"line\":427},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Reflector.php\",\"line\":153},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},[],{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteSignatureParameters.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":533},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/ImplicitRouteBinding.php\",\"line\":28},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":947},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":126},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":92},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/ThrottleRequests.php\",\"line\":54},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/VerifyCsrfToken.php\",\"line\":78},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":121},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":64},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/EncryptCookies.php\",\"line\":67},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":162},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"20\":\"            \'fcm_token\' => [\'nullable\', \'string\']\\r\",\"21\":\"            ];\\r\",\"22\":\"    }\\r\",\"23\":\"    \\r\",\"24\":\"    \\r\",\"25\":\"    \\r\",\"26\":\"    protected function passedValidation(): void\\r\",\"27\":\"    {\\r\",\"28\":\"        \\/\\/ Add the same transformation as SendOtpRequest\\r\",\"29\":\"        if (!empty($this->mobile) {\\r\",\"30\":\"            $mobile = substr($this->mobile, 1);\\r\",\"31\":\"            $this->merge([\'mobile\' => $mobile]);\\r\",\"32\":\"        }\\r\",\"33\":\"    }\\r\",\"34\":\"}\\r\",\"35\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":4}', '2025-10-21 17:59:43'),
(10, 'a02b18b1-acf0-4a70-bd3a-5ced5967361d', 'a02b18b1-ad1f-4421-8280-0d2da9f7124d', NULL, 1, 'request', '{\"ip_address\":\"217.138.162.236\",\"uri\":\"\\/api\\/auth\\/login-admin\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\AuthController@login\",\"middleware\":[\"api\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br, zstd\",\"referer\":\"https:\\/\\/dashboard.familytree-sy.com\\/\",\"sec-fetch-dest\":\"empty\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-site\":\"same-site\",\"origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"sec-ch-ua-mobile\":\"?0\",\"content-type\":\"application\\/json\",\"sec-ch-ua\":\"\\\"Google Chrome\\\";v=\\\"141\\\", \\\"Not?A_Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"141\\\"\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/141.0.0.0 Safari\\/537.36\",\"x-xsrf-token\":\"********\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"content-length\":\"54\",\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\"},\"payload\":{\"code\":\"12345\",\"mobile\":\"999999999\",\"fcm_token\":null},\"session\":{\"_token\":\"********\",\"_flash\":{\"old\":[],\"new\":[]},\"_previous\":{\"url\":\"https:\\/\\/backend.familytree-sy.com\\/api\\/get-admin-statistic\"}},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Tue, 21 Oct 2025 17:59:43 GMT\",\"content-type\":\"application\\/json\",\"x-ratelimit-limit\":\"60\",\"x-ratelimit-remaining\":\"55\",\"access-control-allow-origin\":\"https:\\/\\/dashboard.familytree-sy.com\",\"vary\":\"Origin\",\"access-control-allow-credentials\":\"true\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IlgrbkIxRndaOGUzZ29NUkFlVWM4SVE9PSIsInZhbHVlIjoiMTdXL2JkTzhrcVQyL1oraitwTVV2Smw5aFh0T3dHdzdyR25hOVFSbExrR2tKcE96SVZhM2RMd1RVMEVuc3Q3eU1NZGdWUjRlRzZpTTROYTRiVm1Sdi9pUUpkMkJ5WnNZY0dzNVdGLzBLbmZORUppQlZrMWxiT0JzTFJVKy9KUDMiLCJtYWMiOiIzMTk4NDFjYzQ2NmQwNjM4ODMzNjJhZDg0Mjk2MzU0MmJhZDIwN2Q3ODk4ODZkMjlkOTk1YzcwNGE3YWVlNWUyIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:59:43 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; samesite=lax, family_tree_backend_session=eyJpdiI6IlpReC8vaERUSkVKZy9uR3dWTEM3NEE9PSIsInZhbHVlIjoiUi9aL3Z4anQyNlIzUk5sVG1iS0Zwc2VhRXQ0VWx3aXRkcFJBM25EaWdxNkJuZEE4TFdVYzk4NGI4RnJCRWFSRVBrVFZocWdvQ1lFZUVEY1cvNTVnbkxOOUlpUFR3WDRuT3VzQWpUWVhDVnRKMXRncWJSbDlUR0lLVE9mM3VLUzMiLCJtYWMiOiIyZjdiMjc1OWY2M2IxMGUxNWNmN2E0NTUyODVjYzBiMmFlYjNiZmM1NGQxYjQwYmEwNDQzZjNiOTdmNGQxOGRhIiwidGFnIjoiIn0%3D; expires=Tue, 21 Oct 2025 19:59:43 GMT; Max-Age=7200; path=\\/; domain=.familytree-sy.com; secure; httponly; samesite=lax\"},\"response_status\":500,\"response\":{\"message\":\"Server Error\"},\"duration\":13,\"memory\":2,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-10-21 17:59:43'),
(11, 'a02b4056-f23a-4ab1-9be8-3c7198cc3217', 'a02b4056-f5b1-473d-9f22-1db8627773f2', '9d405a145835f654852abb5cb672a06b', 1, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Console\\\\Exception\\\\CommandNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":737,\"message\":\"Command \\\"route:clear-v\\\" is not defined.\\n\\nDid you mean one of these?\\n    cache:clear\\n    config:clear\\n    event:clear\\n    optimize:clear\\n    queue:clear\\n    route:cache\\n    route:clear\\n    route:list\\n    telescope:clear\\n    view:clear\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":266},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"728\":\"\",\"729\":\"                if (1 == \\\\count($alternatives)) {\",\"730\":\"                    $message .= \\\"\\\\n\\\\nDid you mean this?\\\\n    \\\";\",\"731\":\"                } else {\",\"732\":\"                    $message .= \\\"\\\\n\\\\nDid you mean one of these?\\\\n    \\\";\",\"733\":\"                }\",\"734\":\"                $message .= implode(\\\"\\\\n    \\\", $alternatives);\",\"735\":\"            }\",\"736\":\"\",\"737\":\"            throw new CommandNotFoundException($message, array_values($alternatives));\",\"738\":\"        }\",\"739\":\"\",\"740\":\"        \\/\\/ filter out aliases for commands which are already on the list\",\"741\":\"        if (\\\\count($commands) > 1) {\",\"742\":\"            $commandList = $this->commandLoader ? array_merge(array_flip($this->commandLoader->getNames()), $this->commands) : $this->commands;\",\"743\":\"            $commands = array_unique(array_filter($commands, function ($nameOrAlias) use (&$commandList, $commands, &$aliases) {\",\"744\":\"                if (!$commandList[$nameOrAlias] instanceof Command) {\",\"745\":\"                    $commandList[$nameOrAlias] = $this->commandLoader->get($nameOrAlias);\",\"746\":\"                }\",\"747\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-10-21 19:50:34'),
(12, 'a0460bf0-3267-418e-9de4-66d5e76eecfa', 'a0460bf0-447e-4897-a44a-e6b51c5f0ae2', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-11-04 03:31:24'),
(13, 'a0460bf0-43db-43a9-b9d9-bce66a100091', 'a0460bf0-447e-4897-a44a-e6b51c5f0ae2', NULL, 1, 'request', '{\"ip_address\":\"57.141.0.15\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\",\"accept\":\"*\\/*\",\"user-agent\":\"meta-externalagent\\/1.1 (+https:\\/\\/developers.facebook.com\\/docs\\/sharing\\/webmasters\\/crawler)\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Tue, 04 Nov 2025 03:31:24 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":132,\"memory\":4,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-04 03:31:24'),
(14, 'a04a5398-1fbc-4507-bb88-ee2fb7ba6f82', 'a04a5398-3ebb-4da5-907d-3c9c8cffb4c6', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":2}', '2025-11-06 06:35:05'),
(15, 'a04a5398-3ce6-43e8-9bfe-5756750c3103', 'a04a5398-3ebb-4da5-907d-3c9c8cffb4c6', NULL, 1, 'request', '{\"ip_address\":\"57.141.0.39\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\",\"accept\":\"*\\/*\",\"user-agent\":\"meta-externalagent\\/1.1 (+https:\\/\\/developers.facebook.com\\/docs\\/sharing\\/webmasters\\/crawler)\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Thu, 06 Nov 2025 06:35:05 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":213,\"memory\":4,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-06 06:35:05'),
(16, 'a06abc54-43fe-4818-a6cc-e515ad5d0d9c', 'a06abc54-48d6-4d72-8a79-171ff207c8fa', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":3}', '2025-11-22 09:14:26'),
(17, 'a06abc54-47ec-4ce9-b8be-ebb759b5c70a', 'a06abc54-48d6-4d72-8a79-171ff207c8fa', NULL, 1, 'request', '{\"ip_address\":\"40.77.178.23\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"user-agent\":\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/100.0.4896.127 Safari\\/537.36\",\"host\":\"backend.familytree-sy.com\",\"from\":\"bingbot(at)microsoft.com\",\"accept-encoding\":\"\",\"accept\":\"*\\/*\",\"pragma\":\"no-cache\",\"connection\":\"Keep-Alive\",\"cache-control\":\"no-cache\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Sat, 22 Nov 2025 09:14:26 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":86,\"memory\":10,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-22 09:14:26'),
(18, 'a06abc56-85e0-4aa7-8bb2-49f5f0bdd7ec', 'a06abc56-8a0e-49ec-85c4-4d5d5836ac54', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":4}', '2025-11-22 09:14:27'),
(19, 'a06abc56-8975-4ca6-9e4a-3618593c5a93', 'a06abc56-8a0e-49ec-85c4-4d5d5836ac54', NULL, 1, 'request', '{\"ip_address\":\"40.77.177.71\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"user-agent\":\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/100.0.4896.127 Safari\\/537.36\",\"host\":\"backend.familytree-sy.com\",\"from\":\"bingbot(at)microsoft.com\",\"accept-encoding\":\"\",\"accept\":\"*\\/*\",\"pragma\":\"no-cache\",\"connection\":\"Keep-Alive\",\"cache-control\":\"no-cache\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Sat, 22 Nov 2025 09:14:27 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":49,\"memory\":10,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-22 09:14:27');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(20, 'a06abc57-3ca6-4534-969c-6351443b1774', 'a06abc57-404b-4b00-8ff3-2db3b35f799e', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":5}', '2025-11-22 09:14:28'),
(21, 'a06abc57-3fc2-49c5-94e6-d3cb0dd0a264', 'a06abc57-404b-4b00-8ff3-2db3b35f799e', NULL, 1, 'request', '{\"ip_address\":\"40.77.178.22\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"user-agent\":\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/100.0.4896.127 Safari\\/537.36\",\"host\":\"backend.familytree-sy.com\",\"from\":\"bingbot(at)microsoft.com\",\"accept-encoding\":\"\",\"accept\":\"*\\/*\",\"pragma\":\"no-cache\",\"connection\":\"Keep-Alive\",\"cache-control\":\"no-cache\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Sat, 22 Nov 2025 09:14:28 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":46,\"memory\":10,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-22 09:14:28'),
(22, 'a073cb18-62dc-4353-ace9-0a2cc5e54120', 'a073cb18-703f-44ff-b916-822f0b3ad3be', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":6}', '2025-11-26 21:18:10'),
(23, 'a073cb18-6f23-4f69-bf16-ce26bd1df2fc', 'a073cb18-703f-44ff-b916-822f0b3ad3be', NULL, 1, 'request', '{\"ip_address\":\"57.141.6.64\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\",\"accept\":\"*\\/*\",\"user-agent\":\"meta-externalagent\\/1.1 (+https:\\/\\/developers.facebook.com\\/docs\\/sharing\\/webmasters\\/crawler)\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Wed, 26 Nov 2025 21:18:10 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":167,\"memory\":20,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-11-26 21:18:10'),
(24, 'a08fc5a0-47d9-4525-91f7-0d30cecf353b', 'a08fc5a0-55da-4540-b56c-8a8e7ac13f44', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":7}', '2025-12-10 19:06:03'),
(25, 'a08fc5a0-54e6-412a-972b-77306af8c116', 'a08fc5a0-55da-4540-b56c-8a8e7ac13f44', NULL, 1, 'request', '{\"ip_address\":\"57.141.4.27\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"connection\":\"keep-alive\",\"host\":\"backend.familytree-sy.com\",\"accept\":\"*\\/*\",\"user-agent\":\"meta-externalagent\\/1.1 (+https:\\/\\/developers.facebook.com\\/docs\\/sharing\\/webmasters\\/crawler)\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Wed, 10 Dec 2025 19:06:03 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":170,\"memory\":18,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-12-10 19:06:03'),
(26, 'a09fa9af-ed24-4615-8a55-096fc2e461e3', 'a09fa9af-fd23-487a-bc10-c42b825dac54', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 0, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":8}', '2025-12-18 16:41:11'),
(27, 'a09fa9af-fb5d-4d10-88e4-e7f44d09648f', 'a09fa9af-fd23-487a-bc10-c42b825dac54', NULL, 1, 'request', '{\"ip_address\":\"40.77.177.157\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"user-agent\":\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/100.0.4896.127 Safari\\/537.36\",\"host\":\"backend.familytree-sy.com\",\"from\":\"bingbot(at)microsoft.com\",\"accept-encoding\":\"\",\"accept\":\"*\\/*\",\"pragma\":\"no-cache\",\"connection\":\"Keep-Alive\",\"cache-control\":\"no-cache\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Thu, 18 Dec 2025 16:41:11 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":479,\"memory\":20,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-12-18 16:41:11'),
(28, 'a09fa9b3-00ec-4dab-ba7d-503ce70e824b', 'a09fa9b3-0666-4add-a191-132dfb6d7610', '414ed18b7ce1bfb0fcce8595dd3ed0dd', 1, 'exception', '{\"class\":\"Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/UrlGenerator.php\",\"line\":467,\"message\":\"Route [login] not defined.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/helpers.php\",\"line\":826},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/app\\/Http\\/Middleware\\/Authenticate.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":83},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":68},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Auth\\/Middleware\\/Authenticate.php\",\"line\":42},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":25},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/sanctum\\/src\\/Http\\/Middleware\\/EnsureFrontendRequestsAreStateful.php\",\"line\":24},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":797},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":776},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":740},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":729},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":190},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":141},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TrimStrings.php\",\"line\":40},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/PreventRequestsDuringMaintenance.php\",\"line\":86},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/HandleCors.php\",\"line\":62},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Http\\/Middleware\\/TrustProxies.php\",\"line\":39},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":180},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":116},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":165},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":134},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/public\\/index.php\",\"line\":51}],\"line_preview\":{\"458\":\"     *\",\"459\":\"     * @throws \\\\Symfony\\\\Component\\\\Routing\\\\Exception\\\\RouteNotFoundException\",\"460\":\"     *\\/\",\"461\":\"    public function route($name, $parameters = [], $absolute = true)\",\"462\":\"    {\",\"463\":\"        if (! is_null($route = $this->routes->getByName($name))) {\",\"464\":\"            return $this->toRoute($route, $parameters, $absolute);\",\"465\":\"        }\",\"466\":\"\",\"467\":\"        throw new RouteNotFoundException(\\\"Route [{$name}] not defined.\\\");\",\"468\":\"    }\",\"469\":\"\",\"470\":\"    \\/**\",\"471\":\"     * Get the URL for a given route instance.\",\"472\":\"     *\",\"473\":\"     * @param  \\\\Illuminate\\\\Routing\\\\Route  $route\",\"474\":\"     * @param  mixed  $parameters\",\"475\":\"     * @param  bool  $absolute\",\"476\":\"     * @return string\",\"477\":\"     *\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":9}', '2025-12-18 16:41:13'),
(29, 'a09fa9b3-05ce-41e6-aee0-485e06549c4e', 'a09fa9b3-0666-4add-a191-132dfb6d7610', NULL, 1, 'request', '{\"ip_address\":\"40.77.178.156\",\"uri\":\"\\/api\\/get-nodes-with-children\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NodeController@getNodesWithChildren\",\"middleware\":[\"api\",\"auth:sanctum\"],\"headers\":{\"user-agent\":\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/100.0.4896.127 Safari\\/537.36\",\"host\":\"backend.familytree-sy.com\",\"from\":\"bingbot(at)microsoft.com\",\"accept-encoding\":\"\",\"accept\":\"*\\/*\",\"pragma\":\"no-cache\",\"connection\":\"Keep-Alive\",\"cache-control\":\"no-cache\"},\"payload\":[],\"session\":[],\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Thu, 18 Dec 2025 16:41:13 GMT\",\"content-type\":\"text\\/html; charset=UTF-8\",\"vary\":\"Origin\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":100,\"memory\":20,\"hostname\":\"host.hdtcconsulting.com\"}', '2025-12-18 16:41:13');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(30, 'a0b3f1ef-73d2-4b9c-a49c-c9de770b3e3f', 'a0b3f1ef-7717-4881-9f7e-cce1c71d7bd6', '341e9253936ece431baae9b5761f2fbe', 1, 'exception', '{\"class\":\"Error\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/DatabaseServiceProvider.php\",\"line\":93,\"message\":\"Class \\\"Faker\\\\Factory\\\" not found\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":885},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":770},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php\",\"line\":881},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":706},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php\",\"line\":866},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Factories\\/Factory.php\",\"line\":842},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Factories\\/Factory.php\",\"line\":153},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Factories\\/Factory.php\",\"line\":171},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Factories\\/Factory.php\",\"line\":821},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Factories\\/HasFactory.php\",\"line\":16},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/CitySeeder.php\",\"line\":18},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/DatabaseSeeder.php\",\"line\":17},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Concerns\\/GuardsAttributes.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Concerns\\/CallsCommands.php\",\"line\":67},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Concerns\\/CallsCommands.php\",\"line\":28},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php\",\"line\":97},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php\",\"line\":636},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":1078},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":324},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"84\":\"     *\",\"85\":\"     * @return void\",\"86\":\"     *\\/\",\"87\":\"    protected function registerEloquentFactory()\",\"88\":\"    {\",\"89\":\"        $this->app->singleton(FakerGenerator::class, function ($app, $parameters) {\",\"90\":\"            $locale = $parameters[\'locale\'] ?? $app[\'config\']->get(\'app.faker_locale\', \'en_US\');\",\"91\":\"\",\"92\":\"            if (! isset(static::$fakers[$locale])) {\",\"93\":\"                static::$fakers[$locale] = FakerFactory::create($locale);\",\"94\":\"            }\",\"95\":\"\",\"96\":\"            static::$fakers[$locale]->unique(true);\",\"97\":\"\",\"98\":\"            return static::$fakers[$locale];\",\"99\":\"        });\",\"100\":\"    }\",\"101\":\"\",\"102\":\"    \\/**\",\"103\":\"     * Register the queueable entity resolver implementation.\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-12-28 18:39:45'),
(31, 'a0b3f61c-163b-4a23-a11c-0e60862d80b9', 'a0b3f61c-179b-47ba-b08d-580fe79db9a2', '07ad7c76ef6ce016cf33362dcce18fa1', 1, 'exception', '{\"class\":\"Spatie\\\\Permission\\\\Exceptions\\\\RoleAlreadyExists\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Exceptions\\/RoleAlreadyExists.php\",\"line\":11,\"message\":\"A role `admin` already exists for guard `sanctum`.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Models\\/Role.php\",\"line\":58},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/RoleSeeder.php\",\"line\":22},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":61},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/DatabaseSeeder.php\",\"line\":17},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Concerns\\/GuardsAttributes.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":1078},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":324},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"2\":\"\",\"3\":\"namespace Spatie\\\\Permission\\\\Exceptions;\",\"4\":\"\",\"5\":\"use InvalidArgumentException;\",\"6\":\"\",\"7\":\"class RoleAlreadyExists extends InvalidArgumentException\",\"8\":\"{\",\"9\":\"    public static function create(string $roleName, string $guardName)\",\"10\":\"    {\",\"11\":\"        return new static(__(\'A role `:role` already exists for guard `:guard`.\', [\",\"12\":\"            \'role\' => $roleName,\",\"13\":\"            \'guard\' => $guardName,\",\"14\":\"        ]));\",\"15\":\"    }\",\"16\":\"}\",\"17\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-12-28 18:51:26'),
(32, 'a0b3f651-1636-4484-8ed9-9e29c3cbefc1', 'a0b3f651-18be-48d8-8e79-30eeb20b544f', '68ad531cc5c51dcae2624a3a27b17d16', 1, 'exception', '{\"class\":\"Error\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/MemberSeeder.php\",\"line\":23,\"message\":\"Class \\\"Faker\\\\Factory\\\" not found\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Concerns\\/GuardsAttributes.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":1078},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":324},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"14\":\"class MemberSeeder extends Seeder\\r\",\"15\":\"{\\r\",\"16\":\"    \\/**\\r\",\"17\":\"     * Run the database seeds.\\r\",\"18\":\"     *\\r\",\"19\":\"     * @return void\\r\",\"20\":\"     *\\/\\r\",\"21\":\"    public function run()\\r\",\"22\":\"    {\\r\",\"23\":\"        $faker = Faker::create();\\r\",\"24\":\"\\r\",\"25\":\"        $user = User::find(1);\\r\",\"26\":\"        $user->assignRole(RoleName::MEMBER->value);\\r\",\"27\":\"\\r\",\"28\":\"        $user->member()->create([\\r\",\"29\":\"            \'father_name\' => $faker->firstNameMale(),\\r\",\"30\":\"            \'mother_name\' => $faker->firstNameFemale(),\\r\",\"31\":\"            \'gender\' => Gender::MALE->value,\\r\",\"32\":\"            \'birth_date\' => $faker->date(),\\r\",\"33\":\"            \'health_status\' => $faker->sentence(3),\\r\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-12-28 18:52:00'),
(33, 'a0b3fb6c-684d-4d2f-bfc9-a44a5ad2caf8', 'a0b3fb6c-69bd-49ed-ab61-8a177e4a72d9', '1c7f9c4a6de4135a4d3c9809f4ca8fd4', 1, 'exception', '{\"class\":\"Spatie\\\\Permission\\\\Exceptions\\\\GuardDoesNotMatch\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Exceptions\\/GuardDoesNotMatch.php\",\"line\":12,\"message\":\"The given role or permission should use guard `` instead of `sanctum`.\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasPermissions.php\",\"line\":536},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasPermissions.php\",\"line\":381},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Collections\\/Traits\\/EnumeratesValues.php\",\"line\":734},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasPermissions.php\",\"line\":370},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/spatie\\/laravel-permission\\/src\\/Traits\\/HasPermissions.php\",\"line\":453},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/PermissionSeeder.php\",\"line\":23},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Concerns\\/GuardsAttributes.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":1078},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":324},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"3\":\"namespace Spatie\\\\Permission\\\\Exceptions;\",\"4\":\"\",\"5\":\"use Illuminate\\\\Support\\\\Collection;\",\"6\":\"use InvalidArgumentException;\",\"7\":\"\",\"8\":\"class GuardDoesNotMatch extends InvalidArgumentException\",\"9\":\"{\",\"10\":\"    public static function create(string $givenGuard, Collection $expectedGuards)\",\"11\":\"    {\",\"12\":\"        return new static(__(\'The given role or permission should use guard `:expected` instead of `:given`.\', [\",\"13\":\"            \'expected\' => $expectedGuards->implode(\', \'),\",\"14\":\"            \'given\' => $givenGuard,\",\"15\":\"        ]));\",\"16\":\"    }\",\"17\":\"}\",\"18\":\"\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-12-28 19:06:17'),
(34, 'a0b3fc3c-54c5-4608-8a09-ddd100db1f1b', 'a0b3fc3c-5612-43a1-be8c-10a051b23a56', 'c3b1a24f96b15461027bc6eab6bf843b', 1, 'exception', '{\"class\":\"Illuminate\\\\Database\\\\QueryException\",\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php\",\"line\":760,\"message\":\"SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'admin-sanctum\' for key \'roles_name_guard_name_unique\' (SQL: update `roles` set `guard_name` = sanctum, `roles`.`updated_at` = 2025-12-28 19:08:34 where `id` = 1)\",\"context\":null,\"trace\":[{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php\",\"line\":720},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php\",\"line\":558},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php\",\"line\":510},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Query\\/Builder.php\",\"line\":3356},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Builder.php\",\"line\":1011},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Model.php\",\"line\":1214},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Model.php\",\"line\":1131},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Model.php\",\"line\":991},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/database\\/seeders\\/PermissionSeeder.php\",\"line\":32},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":184},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Seeder.php\",\"line\":193},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":81},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Eloquent\\/Concerns\\/GuardsAttributes.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Seeds\\/SeedCommand.php\",\"line\":80},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":41},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":93},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":661},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":183},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Command\\/Command.php\",\"line\":326},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php\",\"line\":152},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":1078},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":324},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/symfony\\/console\\/Application.php\",\"line\":175},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Application.php\",\"line\":102},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php\",\"line\":155},{\"file\":\"\\/home\\/familytreesy\\/backend.familytree-sy.com\\/artisan\",\"line\":35}],\"line_preview\":{\"751\":\"        \\/\\/ took to execute and log the query SQL, bindings and time in our memory.\",\"752\":\"        try {\",\"753\":\"            return $callback($query, $bindings);\",\"754\":\"        }\",\"755\":\"\",\"756\":\"        \\/\\/ If an exception occurs when attempting to run a query, we\'ll format the error\",\"757\":\"        \\/\\/ message to include the bindings with SQL, which will make this exception a\",\"758\":\"        \\/\\/ lot more helpful to the developer instead of just the database\'s errors.\",\"759\":\"        catch (Exception $e) {\",\"760\":\"            throw new QueryException(\",\"761\":\"                $query, $this->prepareBindings($bindings), $e\",\"762\":\"            );\",\"763\":\"        }\",\"764\":\"    }\",\"765\":\"\",\"766\":\"    \\/**\",\"767\":\"     * Log a query in the connection\'s query log.\",\"768\":\"     *\",\"769\":\"     * @param  string  $query\",\"770\":\"     * @param  array  $bindings\"},\"hostname\":\"host.hdtcconsulting.com\",\"occurrences\":1}', '2025-12-28 19:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `fcm_token` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `attachment_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `mobile`, `email`, `password`, `status`, `fcm_token`, `image_id`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `attachment_id`) VALUES
(2, 'Super Admin', '0999999999', 'admin@familytree-sy.com', '$2y$10$ePl2tfxSrxoq/jOuAuMQmOKtTF3Ul9fi2EUQeckjwKCVrGiOKO85S', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'laith', '0958909419', 'laith@prove.ae', '$2y$10$BPaK5kdilL9vbT5E441isuKrmlK2K8iSwymkpOnQhj0etL9CNNoOK', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'أحمد محمد', '900000001', 'user1@familytree.com', '$2y$10$s0owf6CFxriecilzx.YlbeN.lml27lRRXpYCo.j69azn3ajd96bBS', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(25, 'فاطمة علي', '900000002', 'user2@familytree.com', '$2y$10$AZiKvVF7diB0UnN35qVlYOwGUXXZ.sKVw2ovrbmLYmi5nYu47hdom', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(26, 'خالد حسن', '900000003', 'user3@familytree.com', '$2y$10$Lml4hxq8.auraNA0ZSYbFOeZyyIV4RS46Q9VF6W8KXNmWaylI1jGS', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(27, 'مريم أحمد', '900000004', 'user4@familytree.com', '$2y$10$yeYishim5pxy0It.g5vqBO0KMjQwAQBxRcj5n9wx.KS5gcL8vmVMa', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(28, 'عمر سعيد', '900000005', 'user5@familytree.com', '$2y$10$0fkVsTC9q1TTG0uqouyJ9uDcBZbiBbMg58t.nyGUgdI9jj25V.P8m', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(29, 'زينب محمود', '900000006', 'user6@familytree.com', '$2y$10$4MS/TIc2i2Z9mO7jU9qbh.iRPuF/wL4Wel6S8um/tWKX.G9YZlYcS', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(30, 'يوسف إبراهيم', '900000007', 'user7@familytree.com', '$2y$10$j.C/KqoD.Xdgz6h8DuA40.uCsXeA9KVZyIYGRqgapmkjkChu5ld0q', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(31, 'سارة عبدالله', '900000008', 'user8@familytree.com', '$2y$10$DxAwtLHeAyNxt0dA7oAZpuQqTHKaP7MUtgjIwhdOmM/2/oDJanWCG', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(32, 'محمد خالد', '900000009', 'user9@familytree.com', '$2y$10$/n8A7hRvzW6eCEvLto6/k.YBcXaU5eM.11f0YdLJF/.jyklE4KWPS', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(33, 'نور حسين', '900000010', 'user10@familytree.com', '$2y$10$Ss1pRJWfY8hu.JsEjU4RXu.caNoqfw/AmL.T5OK6qdxhLfWVw2Neu', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:04:17', '2025-12-28 15:04:17', NULL, NULL),
(34, 'Ahmed Ali', '999999999', 'ahmed@example.com', '$2y$10$VJNMzCxaZKrqV73EedrH7.iN7W00/hBIwa0TFXk12lTh.FYfka.4O', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:25:18', '2025-12-28 15:25:18', NULL, NULL),
(35, 'Ahmed Ali', '934999999', 'ahmed@example.com', '$2y$10$cwfCXw6Lx0/X5TFLLDraHOmWaNwn0Xntuj1hB0hVtm/vrUBCUT9WK', '1', NULL, NULL, NULL, NULL, NULL, '2025-12-28 15:33:38', '2025-12-28 15:33:38', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_image_id_foreign` (`image_id`),
  ADD KEY `achievements_created_by_foreign` (`created_by`),
  ADD KEY `achievements_updated_by_foreign` (`updated_by`),
  ADD KEY `achievements_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_created_by_foreign` (`created_by`),
  ADD KEY `cities_updated_by_foreign` (`updated_by`),
  ADD KEY `cities_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `committees`
--
ALTER TABLE `committees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `committees_created_by_foreign` (`created_by`),
  ADD KEY `committees_updated_by_foreign` (`updated_by`),
  ADD KEY `committees_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `committee_events`
--
ALTER TABLE `committee_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `committee_events_committee_id_foreign` (`committee_id`),
  ADD KEY `committee_events_image_id_foreign` (`image_id`),
  ADD KEY `committee_events_created_by_foreign` (`created_by`),
  ADD KEY `committee_events_updated_by_foreign` (`updated_by`),
  ADD KEY `committee_events_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `committee_members`
--
ALTER TABLE `committee_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `committee_members_committee_id_member_id_unique` (`committee_id`,`member_id`),
  ADD KEY `committee_members_member_id_foreign` (`member_id`),
  ADD KEY `committee_members_created_by_foreign` (`created_by`),
  ADD KEY `committee_members_updated_by_foreign` (`updated_by`),
  ADD KEY `committee_members_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `committee_votes`
--
ALTER TABLE `committee_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `committee_votes_committee_id_voter_id_unique` (`committee_id`,`voter_id`),
  ADD KEY `committee_votes_voter_id_foreign` (`voter_id`),
  ADD KEY `committee_votes_candidate_id_foreign` (`candidate_id`),
  ADD KEY `committee_votes_created_by_foreign` (`created_by`),
  ADD KEY `committee_votes_updated_by_foreign` (`updated_by`),
  ADD KEY `committee_votes_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_created_by_foreign` (`created_by`),
  ADD KEY `donations_updated_by_foreign` (`updated_by`),
  ADD KEY `donations_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_settings_updated_by_foreign` (`updated_by`),
  ADD KEY `general_settings_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `historical_events`
--
ALTER TABLE `historical_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historical_events_image_id_foreign` (`image_id`),
  ADD KEY `historical_events_created_by_foreign` (`created_by`),
  ADD KEY `historical_events_updated_by_foreign` (`updated_by`),
  ADD KEY `historical_events_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `join_request_reviews`
--
ALTER TABLE `join_request_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `join_request_reviews_join_request_id_reviewer_id_unique` (`join_request_id`,`reviewer_id`),
  ADD KEY `join_request_reviews_reviewer_id_foreign` (`reviewer_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_photographs`
--
ALTER TABLE `media_photographs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_photographs_media_id_foreign` (`media_id`),
  ADD KEY `media_photographs_photograph_id_foreign` (`photograph_id`),
  ADD KEY `media_photographs_created_by_foreign` (`created_by`),
  ADD KEY `media_photographs_updated_by_foreign` (`updated_by`),
  ADD KEY `media_photographs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_user_id_foreign` (`user_id`),
  ADD KEY `members_city_id_foreign` (`city_id`),
  ADD KEY `members_created_by_foreign` (`created_by`),
  ADD KEY `members_updated_by_foreign` (`updated_by`),
  ADD KEY `members_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `member_certificates`
--
ALTER TABLE `member_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_certificates_member_id_foreign` (`member_id`),
  ADD KEY `member_certificates_media_id_foreign` (`media_id`),
  ADD KEY `member_certificates_created_by_foreign` (`created_by`),
  ADD KEY `member_certificates_updated_by_foreign` (`updated_by`),
  ADD KEY `member_certificates_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nodes_city_id_foreign` (`city_id`),
  ADD KEY `nodes_member_id_foreign` (`member_id`),
  ADD KEY `nodes_parent_id_foreign` (`parent_id`),
  ADD KEY `nodes_created_by_foreign` (`created_by`),
  ADD KEY `nodes_updated_by_foreign` (`updated_by`),
  ADD KEY `nodes_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `node_certificates`
--
ALTER TABLE `node_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `node_certificates_node_id_foreign` (`node_id`),
  ADD KEY `node_certificates_media_id_foreign` (`media_id`),
  ADD KEY `node_certificates_created_by_foreign` (`created_by`),
  ADD KEY `node_certificates_updated_by_foreign` (`updated_by`),
  ADD KEY `node_certificates_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_created_by_foreign` (`created_by`),
  ADD KEY `notifications_updated_by_foreign` (`updated_by`),
  ADD KEY `notifications_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otps_mobile_unique` (`mobile`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photographs`
--
ALTER TABLE `photographs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photographs_created_by_foreign` (`created_by`),
  ADD KEY `photographs_updated_by_foreign` (`updated_by`),
  ADD KEY `photographs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_image_id_foreign` (`image_id`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`),
  ADD KEY `users_deleted_by_foreign` (`deleted_by`),
  ADD KEY `users_attachment_id_foreign` (`attachment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `committees`
--
ALTER TABLE `committees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `committee_events`
--
ALTER TABLE `committee_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `committee_members`
--
ALTER TABLE `committee_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `committee_votes`
--
ALTER TABLE `committee_votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historical_events`
--
ALTER TABLE `historical_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `join_request_reviews`
--
ALTER TABLE `join_request_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_photographs`
--
ALTER TABLE `media_photographs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `member_certificates`
--
ALTER TABLE `member_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `nodes`
--
ALTER TABLE `nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `node_certificates`
--
ALTER TABLE `node_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `photographs`
--
ALTER TABLE `photographs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `achievements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `achievements_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `achievements_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `achievements_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cities_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cities_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `committees`
--
ALTER TABLE `committees`
  ADD CONSTRAINT `committees_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committees_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committees_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `committee_events`
--
ALTER TABLE `committee_events`
  ADD CONSTRAINT `committee_events_committee_id_foreign` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `committee_events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `committee_events_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `committee_events_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `committee_events_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `committee_members`
--
ALTER TABLE `committee_members`
  ADD CONSTRAINT `committee_members_committee_id_foreign` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`),
  ADD CONSTRAINT `committee_members_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committee_members_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committee_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`user_id`),
  ADD CONSTRAINT `committee_members_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `committee_votes`
--
ALTER TABLE `committee_votes`
  ADD CONSTRAINT `committee_votes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `committee_votes_committee_id_foreign` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `committee_votes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committee_votes_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committee_votes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `committee_votes_voter_id_foreign` FOREIGN KEY (`voter_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `donations_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `donations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD CONSTRAINT `general_settings_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `general_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `historical_events`
--
ALTER TABLE `historical_events`
  ADD CONSTRAINT `historical_events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `historical_events_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `historical_events_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `historical_events_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `join_request_reviews`
--
ALTER TABLE `join_request_reviews`
  ADD CONSTRAINT `join_request_reviews_join_request_id_foreign` FOREIGN KEY (`join_request_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `join_request_reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media_photographs`
--
ALTER TABLE `media_photographs`
  ADD CONSTRAINT `media_photographs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `media_photographs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `media_photographs_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_photographs_photograph_id_foreign` FOREIGN KEY (`photograph_id`) REFERENCES `photographs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_photographs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `members_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `members_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `members_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `member_certificates`
--
ALTER TABLE `member_certificates`
  ADD CONSTRAINT `member_certificates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `member_certificates_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `member_certificates_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_certificates_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_certificates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nodes`
--
ALTER TABLE `nodes`
  ADD CONSTRAINT `nodes_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `nodes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `nodes_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `nodes_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`user_id`),
  ADD CONSTRAINT `nodes_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `nodes` (`id`),
  ADD CONSTRAINT `nodes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `node_certificates`
--
ALTER TABLE `node_certificates`
  ADD CONSTRAINT `node_certificates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `node_certificates_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `node_certificates_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `node_certificates_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `node_certificates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `photographs`
--
ALTER TABLE `photographs`
  ADD CONSTRAINT `photographs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `photographs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `photographs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
