-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table iclop3.execution_steps
CREATE TABLE IF NOT EXISTS `execution_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commands` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.execution_steps: ~0 rows (approximately)
/*!40000 ALTER TABLE `execution_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_steps` ENABLE KEYS */;

-- Dumping structure for table iclop3.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table iclop3.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table iclop3.materials
CREATE TABLE IF NOT EXISTS `materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `folder_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.materials: ~4 rows (approximately)
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` (`id`, `title`, `description`, `folder_path`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '[CHAPTER 1] LOADING DATA', 'Mahasiswa akan memahami konsep, menerapkan teknik, dan memiliki dasar yang kuat untuk melakukan Data Loading dalam berbagai proyek analisis data.', NULL, '', '2024-08-07 14:08:50', '2024-08-07 14:08:51', NULL),
	(2, '[CHAPTER 2] CLEANING DATA', 'Mahasiswa mengenal materi pembersihan data (data cleaning). Pembersihan data adalah proses persiapan data yang melibatkan identifikasi, memahami, dan menangani kesalahan (errors), missing values, dan inkonsistensi dalam kumpulan data.', NULL, '', '2024-08-07 14:09:40', '2024-08-07 14:09:41', NULL),
	(3, '[CHAPTER 3] DATA MANIPULATION', 'Mahasiswa mengenal materi Manipulasi Data menggunakan bahasa pemrograman Python antara lain mahasiswa akan mempelajari tentang penggunaan library Python seperti NumPy dan Pandas.', NULL, '', '2024-08-07 14:09:39', '2024-08-07 14:09:39', NULL),
	(4, '[CHAPTER 4] DATA VISUALIZATION', 'Mahasiswa mengenal materi visualisasi data menggunakan Matplotlib pada bahasa pemrograman python.', NULL, '', '2024-08-07 14:45:27', '2024-08-07 14:45:28', NULL);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

-- Dumping structure for table iclop3.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.media: ~0 rows (approximately)
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table iclop3.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.migrations: ~13 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_08_10_070723_create_jobs_table', 1),
	(6, '2023_08_10_071422_nodejs_tables', 1),
	(7, '2023_08_10_074328_create_media_table', 1),
	(8, '2023_08_22_141816_create_sessions_table', 1),
	(9, '2024_08_02_163346_create_materials_table', 1),
	(10, '2024_08_02_163742_create_tasks_table', 1),
	(11, '2024_08_04_032352_add_pdf_path_to_tasks_table', 1),
	(12, '2024_08_04_034834_remove_material_column_from_tasks_table', 1),
	(13, '2024_08_04_103221_create_student_submissions_table', 1),
	(14, '2024_08_07_154955_add_new_column_to_student_submissions_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table iclop3.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.password_reset_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table iclop3.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table iclop3.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tech_stack` json NOT NULL COMMENT 'keys: framework, language, database, testing',
  `github_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.projects: ~0 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Dumping structure for table iclop3.projects_default_file_structures
CREATE TABLE IF NOT EXISTS `projects_default_file_structures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `structure` json NOT NULL,
  `excluded` json NOT NULL,
  `replacements` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_default_file_structures_project_id_foreign` (`project_id`),
  CONSTRAINT `projects_default_file_structures_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.projects_default_file_structures: ~0 rows (approximately)
/*!40000 ALTER TABLE `projects_default_file_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_default_file_structures` ENABLE KEYS */;

-- Dumping structure for table iclop3.project_execution_steps
CREATE TABLE IF NOT EXISTS `project_execution_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `execution_step_id` bigint(20) unsigned NOT NULL,
  `variables` json DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_execution_steps_project_id_foreign` (`project_id`),
  KEY `project_execution_steps_execution_step_id_foreign` (`execution_step_id`),
  CONSTRAINT `project_execution_steps_execution_step_id_foreign` FOREIGN KEY (`execution_step_id`) REFERENCES `execution_steps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_execution_steps_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.project_execution_steps: ~0 rows (approximately)
/*!40000 ALTER TABLE `project_execution_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_execution_steps` ENABLE KEYS */;

-- Dumping structure for table iclop3.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table iclop3.student_submissions
CREATE TABLE IF NOT EXISTS `student_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spring_boot_submission_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submission_count` int(11) NOT NULL DEFAULT '0',
  `test_result` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_submissions_user_id_foreign` (`user_id`),
  KEY `student_submissions_task_id_foreign` (`task_id`),
  CONSTRAINT `student_submissions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `student_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.student_submissions: ~333 rows (approximately)
/*!40000 ALTER TABLE `student_submissions` DISABLE KEYS */;
INSERT INTO `student_submissions` (`id`, `user_id`, `task_id`, `file_path`, `spring_boot_submission_id`, `submission_count`, `test_result`, `created_at`, `updated_at`) VALUES
	(28, 6, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\n   Kesalahan: ====> Error :Tidak Menampilkan nilai fungsi data_load() menggunakan print(): False should equal True\n2. Test Print Nilai Fungsi data_load() - <FAILED>', '2024-08-13 04:58:11', '2024-08-13 04:58:18'),
	(29, 6, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>\n   Kesalahan: ====> Error :Tidak Menampilkan nilai fungsi sample_rows() menggunakan print(): False should equal True\n3. Test Print Nilai Fungsi sample_rows() - <FAILED>', '2024-08-13 05:02:10', '2024-08-13 05:02:14'),
	(30, 6, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 3, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-13 05:05:27', '2024-08-23 16:12:54'),
	(31, 6, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 2 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>\n   Kesalahan: Error :Tidak Menampilkan nilai data_spesifik menggunakan print(): \' \' should equal \'[50 60]\'\n4. Test Print Hasil Pemotongan Array- - <FAILED>', '2024-08-13 05:10:06', '2024-08-13 05:10:07'),
	(32, 6, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 2 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n   Kesalahan: ====> Error: fungsi total_pendapatan. Cek nama dan atribut fungsi. \'numpy.float64\' object is not callable\n4. Test Nilai Variabel total_pendapatan - <FAILED>\n   Kesalahan: ====> Error :Tidak Menampilkan nilai fungsi jumalah_pendapatan() menggunakan print(): \' \' should equal \'307587.38\'\n5. Test Print Fungsi Jumlah Pendapatan - <FAILED>', '2024-08-13 05:14:01', '2024-08-13 05:15:37'),
	(33, 6, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n   Kesalahan: ====> Error Terdapat Typo pada fungsi critic_scores() pada kode: \'numpy.ndarray\' object is not callable\n2. Test Critic_Score Conversion - <FAILED>\n   Kesalahan: ====> Error Terdapat Typo pada blok fungsi sorted_indices() kode: \'DataFrame\' object is not callable\n2. Test Create Variable top_10_movies - <FAILED>\n   Kesalahan: ====> Error :Tidak Menampilkan 10 Movies menggunakan print(): False should equal True\n3. Test Print Top 10 Movies - <FAILED>', '2024-08-13 05:17:29', '2024-08-13 05:17:33'),
	(34, 6, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 4 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n   Kesalahan: ====> Error pada correlation(); Terdapat Typo pada kode function: \'numpy.float64\' object is not callable\n7. calculates correlation coefficient - <FAILED>', '2024-08-13 05:28:00', '2024-08-13 05:28:18'),
	(35, 6, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-13 05:37:23', '2024-08-13 05:37:30'),
	(36, 6, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\n   Kesalahan: Unexpected exception raised\nCheck Pie Chart - <FAILED>', '2024-08-13 05:46:08', '2024-08-13 06:14:37'),
	(38, 11, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-13 15:40:27', '2024-08-13 17:59:42'),
	(39, 11, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-13 15:41:48', '2024-08-13 18:00:07'),
	(40, 11, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-13 15:46:01', '2024-08-13 18:09:37'),
	(41, 11, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-13 15:49:45', '2024-08-13 17:35:57'),
	(42, 11, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-13 15:50:38', '2024-08-13 17:45:51'),
	(43, 11, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-13 16:13:15', '2024-08-13 17:47:42'),
	(44, 11, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 4 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-13 16:54:49', '2024-08-13 16:55:15'),
	(45, 11, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-13 16:56:37', '2024-08-13 16:56:40'),
	(46, 11, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-13 16:59:52', '2024-08-13 17:13:47'),
	(47, 10, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-19 20:09:42', '2024-08-19 20:09:51'),
	(48, 10, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-19 20:10:42', '2024-08-19 20:10:43'),
	(49, 10, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-19 20:18:37', '2024-08-19 20:18:49'),
	(50, 10, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-19 20:19:28', '2024-08-19 20:19:28'),
	(51, 10, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n   Kesalahan: ====> Error: fungsi total_pendapatan. Cek nama dan atribut fungsi. \'numpy.float64\' object is not callable\n4. Test Nilai Variabel total_pendapatan - <FAILED>', '2024-08-19 20:20:21', '2024-08-19 20:20:29'),
	(52, 10, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-19 20:21:29', '2024-08-19 20:22:12'),
	(53, 10, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-19 20:22:52', '2024-08-19 20:23:59'),
	(54, 10, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-19 20:24:17', '2024-08-19 20:24:22'),
	(55, 10, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-19 20:24:56', '2024-08-19 20:25:14'),
	(56, 12, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 05:56:51', '2024-08-20 05:57:00'),
	(57, 12, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 06:01:23', '2024-08-20 06:01:27'),
	(58, 12, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 06:02:30', '2024-08-20 06:02:45'),
	(59, 12, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 06:03:33', '2024-08-20 06:03:34'),
	(60, 12, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 06:03:49', '2024-08-20 06:05:01'),
	(61, 12, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 06:05:34', '2024-08-20 06:05:41'),
	(62, 12, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 06:06:30', '2024-08-20 06:07:37'),
	(63, 12, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 06:07:59', '2024-08-20 06:08:09'),
	(64, 12, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 06:08:47', '2024-08-20 06:09:06'),
	(65, 7, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 06:12:51', '2024-08-20 06:12:55'),
	(66, 7, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 06:16:48', '2024-08-20 06:16:50'),
	(67, 7, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 06:17:31', '2024-08-20 06:17:43'),
	(68, 7, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 06:25:50', '2024-08-20 06:25:51'),
	(69, 7, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 06:26:11', '2024-08-20 06:26:22'),
	(70, 7, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 06:26:47', '2024-08-20 06:26:54'),
	(71, 7, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 06:27:20', '2024-08-20 06:27:44'),
	(72, 7, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 06:29:39', '2024-08-20 06:29:47'),
	(73, 7, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 06:31:31', '2024-08-20 06:31:49'),
	(74, 8, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 06:34:56', '2024-08-20 06:35:00'),
	(75, 8, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 06:36:22', '2024-08-20 06:36:26'),
	(76, 8, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 06:37:11', '2024-08-20 06:37:25'),
	(77, 8, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 06:38:25', '2024-08-20 06:38:26'),
	(78, 8, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 06:38:51', '2024-08-20 06:39:01'),
	(79, 8, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 06:39:27', '2024-08-20 06:39:36'),
	(80, 8, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 06:40:42', '2024-08-20 06:41:09'),
	(81, 8, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 06:41:35', '2024-08-20 06:41:43'),
	(82, 8, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 06:42:50', '2024-08-20 06:43:03'),
	(83, 9, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 06:44:20', '2024-08-20 06:44:24'),
	(84, 9, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 06:45:05', '2024-08-20 06:45:09'),
	(85, 9, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 06:45:54', '2024-08-20 06:46:08'),
	(86, 9, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 06:47:16', '2024-08-20 06:47:17'),
	(87, 9, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 06:47:41', '2024-08-20 06:47:51'),
	(88, 9, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 06:48:55', '2024-08-20 06:49:02'),
	(89, 9, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 06:49:30', '2024-08-20 06:49:57'),
	(90, 9, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 2, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 06:52:02', '2024-08-20 06:52:29'),
	(91, 9, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 06:53:30', '2024-08-20 06:53:47'),
	(92, 13, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 07:00:02', '2024-08-20 07:00:07'),
	(93, 13, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 07:00:45', '2024-08-20 07:00:46'),
	(94, 13, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 07:01:17', '2024-08-20 07:01:30'),
	(95, 13, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 07:02:04', '2024-08-20 07:02:05'),
	(96, 13, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 07:02:36', '2024-08-20 07:03:35'),
	(97, 13, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 07:03:54', '2024-08-20 07:05:00'),
	(98, 13, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 07:05:32', '2024-08-20 07:07:07'),
	(99, 13, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 07:07:35', '2024-08-20 07:07:43'),
	(100, 13, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 07:08:09', '2024-08-20 07:09:10'),
	(101, 14, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 07:30:04', '2024-08-20 07:30:07'),
	(102, 14, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 07:31:10', '2024-08-20 07:31:15'),
	(103, 14, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 07:32:12', '2024-08-20 07:32:20'),
	(104, 14, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 07:33:17', '2024-08-20 07:33:18'),
	(105, 14, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 07:33:38', '2024-08-20 07:34:16'),
	(106, 14, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 07:34:48', '2024-08-20 07:35:17'),
	(107, 14, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 07:35:33', '2024-08-20 07:35:52'),
	(108, 14, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 07:36:12', '2024-08-20 07:36:19'),
	(109, 14, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 07:36:54', '2024-08-20 07:37:50'),
	(110, 15, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 07:39:56', '2024-08-20 07:39:59'),
	(111, 15, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 07:40:14', '2024-08-20 07:41:19'),
	(112, 15, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 07:41:46', '2024-08-20 07:41:53'),
	(113, 15, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 2, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 07:42:34', '2024-08-20 07:42:59'),
	(114, 15, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 07:43:16', '2024-08-20 07:43:52'),
	(115, 15, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 07:44:05', '2024-08-20 07:44:37'),
	(116, 15, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 3, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 07:45:01', '2024-08-20 07:46:38'),
	(117, 15, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 07:46:48', '2024-08-20 07:46:55'),
	(118, 15, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 07:48:00', '2024-08-20 07:48:45'),
	(119, 16, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 07:50:36', '2024-08-20 07:51:01'),
	(120, 16, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 07:51:22', '2024-08-20 07:52:37'),
	(121, 16, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 07:53:27', '2024-08-20 07:53:35'),
	(122, 16, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 07:54:12', '2024-08-20 07:54:12'),
	(123, 16, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 07:54:29', '2024-08-20 07:55:02'),
	(124, 16, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 07:56:38', '2024-08-20 07:56:43'),
	(125, 16, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 07:57:06', '2024-08-20 07:57:24'),
	(126, 16, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 07:57:40', '2024-08-20 07:57:47'),
	(127, 16, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 08:00:08', '2024-08-20 08:00:18'),
	(128, 17, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 09:16:30', '2024-08-20 09:20:41'),
	(129, 17, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 09:19:46', '2024-08-20 09:19:51'),
	(130, 17, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 09:22:56', '2024-08-20 09:22:57'),
	(131, 17, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 09:23:35', '2024-08-20 09:23:36'),
	(132, 17, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 09:24:18', '2024-08-20 09:25:00'),
	(133, 17, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 09:25:31', '2024-08-20 09:25:37'),
	(134, 17, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 09:26:23', '2024-08-20 09:27:33'),
	(135, 17, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 09:28:14', '2024-08-20 09:28:22'),
	(136, 17, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 09:28:57', '2024-08-20 09:29:39'),
	(137, 18, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 09:36:10', '2024-08-20 09:36:40'),
	(138, 18, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 09:37:04', '2024-08-20 09:37:26'),
	(139, 18, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 09:38:17', '2024-08-20 09:38:26'),
	(140, 18, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 09:39:03', '2024-08-20 09:39:04'),
	(141, 18, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 09:39:26', '2024-08-20 09:40:15'),
	(142, 18, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 09:44:02', '2024-08-20 09:44:25'),
	(143, 18, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 09:45:20', '2024-08-20 09:45:28'),
	(144, 18, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 09:47:23', '2024-08-20 09:47:40'),
	(145, 19, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 09:49:11', '2024-08-20 09:49:15'),
	(146, 19, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 3, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 09:49:35', '2024-08-20 09:50:58'),
	(147, 19, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 09:52:00', '2024-08-20 09:52:09'),
	(148, 19, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 09:52:38', '2024-08-20 09:52:39'),
	(149, 19, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 09:53:26', '2024-08-20 09:55:23'),
	(150, 19, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 09:56:55', '2024-08-20 09:58:21'),
	(151, 19, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 09:58:47', '2024-08-20 09:59:57'),
	(152, 19, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 10:00:33', '2024-08-20 10:00:42'),
	(153, 19, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 3, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 10:05:42', '2024-08-20 10:07:48'),
	(154, 20, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 10:10:43', '2024-08-20 10:10:46'),
	(155, 20, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 15:10:24', '2024-08-20 15:10:31'),
	(156, 20, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 2, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 15:10:52', '2024-08-20 15:11:50'),
	(157, 20, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 15:13:31', '2024-08-20 15:13:31'),
	(158, 20, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 15:13:51', '2024-08-20 15:14:52'),
	(159, 20, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 15:15:27', '2024-08-20 15:16:11'),
	(160, 20, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 15:16:54', '2024-08-20 15:17:15'),
	(161, 20, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 15:17:36', '2024-08-20 15:17:42'),
	(162, 20, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 15:18:33', '2024-08-20 15:23:54'),
	(163, 21, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 15:29:10', '2024-08-20 15:29:13'),
	(164, 21, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 15:29:30', '2024-08-20 15:29:57'),
	(165, 21, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 15:30:54', '2024-08-20 15:31:05'),
	(166, 21, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 2, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 15:34:46', '2024-08-20 15:35:03'),
	(167, 21, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 15:36:41', '2024-08-20 15:37:49'),
	(168, 21, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 15:38:16', '2024-08-20 15:38:39'),
	(169, 21, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 15:38:55', '2024-08-20 15:39:55'),
	(170, 21, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 15:40:40', '2024-08-20 15:40:46'),
	(171, 21, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 15:41:15', '2024-08-20 15:41:43'),
	(172, 22, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 15:45:42', '2024-08-20 15:45:45'),
	(173, 22, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 15:48:07', '2024-08-20 15:48:10'),
	(174, 22, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 15:49:14', '2024-08-20 15:49:21'),
	(175, 22, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 15:51:52', '2024-08-20 15:51:52'),
	(176, 22, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 15:52:04', '2024-08-20 15:52:39'),
	(177, 22, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 15:52:53', '2024-08-20 15:52:59'),
	(178, 22, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 15:53:59', '2024-08-20 15:54:19'),
	(179, 22, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 15:55:13', '2024-08-20 15:55:19'),
	(180, 22, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 15:56:05', '2024-08-20 15:56:44'),
	(181, 23, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 15:59:16', '2024-08-20 15:59:58'),
	(182, 23, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 16:00:42', '2024-08-20 16:00:47'),
	(183, 23, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 16:01:52', '2024-08-20 16:01:59'),
	(184, 23, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 16:05:56', '2024-08-20 16:05:56'),
	(185, 23, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 16:07:06', '2024-08-20 16:08:13'),
	(186, 23, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 16:10:47', '2024-08-20 16:10:53'),
	(187, 23, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 16:12:42', '2024-08-20 16:13:02'),
	(188, 23, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 16:14:02', '2024-08-20 16:14:08'),
	(189, 23, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 16:15:14', '2024-08-20 16:15:23'),
	(190, 24, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 16:17:36', '2024-08-20 16:17:39'),
	(191, 24, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 16:17:57', '2024-08-20 16:18:30'),
	(192, 24, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 16:20:31', '2024-08-20 16:20:37'),
	(193, 24, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 16:21:01', '2024-08-20 16:21:02'),
	(194, 24, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 16:21:13', '2024-08-20 16:22:24'),
	(195, 24, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 16:24:11', '2024-08-20 16:24:17'),
	(196, 24, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 16:24:39', '2024-08-20 16:25:59'),
	(197, 24, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 16:29:13', '2024-08-20 16:29:19'),
	(198, 24, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 16:30:15', '2024-08-20 16:30:25'),
	(199, 25, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 16:32:25', '2024-08-20 16:32:28'),
	(200, 25, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 16:33:36', '2024-08-20 16:33:40'),
	(201, 25, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 16:34:25', '2024-08-20 16:34:35'),
	(202, 25, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 16:35:01', '2024-08-20 16:35:01'),
	(203, 25, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 16:35:19', '2024-08-20 16:35:28'),
	(204, 25, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 16:35:52', '2024-08-20 16:35:57'),
	(205, 25, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 16:36:25', '2024-08-20 16:36:47'),
	(206, 25, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 16:38:16', '2024-08-20 16:38:23'),
	(207, 25, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 16:39:00', '2024-08-20 16:39:09'),
	(208, 26, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 16:41:57', '2024-08-20 16:41:59'),
	(209, 26, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 16:42:28', '2024-08-20 16:42:31'),
	(210, 26, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 16:43:03', '2024-08-20 16:43:17'),
	(211, 26, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 16:44:50', '2024-08-20 16:44:51'),
	(212, 26, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 16:45:05', '2024-08-20 16:45:45'),
	(213, 26, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 2, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 16:47:51', '2024-08-20 16:48:21'),
	(214, 26, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 16:48:47', '2024-08-20 16:49:06'),
	(215, 26, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 16:49:28', '2024-08-20 16:49:35'),
	(216, 26, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 16:50:19', '2024-08-20 16:50:59'),
	(217, 27, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 16:53:09', '2024-08-20 16:53:12'),
	(218, 27, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 16:53:27', '2024-08-20 16:53:29'),
	(219, 27, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 16:54:34', '2024-08-20 16:54:44'),
	(220, 27, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 16:55:20', '2024-08-20 16:55:20'),
	(221, 27, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 16:55:43', '2024-08-20 16:55:51'),
	(222, 27, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 16:56:05', '2024-08-20 16:56:11'),
	(223, 27, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 16:56:27', '2024-08-20 16:56:47'),
	(224, 27, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 16:57:18', '2024-08-20 16:57:24'),
	(225, 27, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 16:59:11', '2024-08-20 16:59:48'),
	(226, 28, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 17:07:05', '2024-08-20 17:07:29'),
	(227, 28, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 17:08:34', '2024-08-20 17:08:58'),
	(228, 28, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 17:09:53', '2024-08-20 17:10:04'),
	(229, 28, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 17:10:49', '2024-08-20 17:10:50'),
	(230, 28, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 2, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 17:11:14', '2024-08-20 17:11:44'),
	(231, 28, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 17:12:00', '2024-08-20 17:12:06'),
	(232, 28, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 17:12:20', '2024-08-20 17:13:19'),
	(233, 28, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 17:13:47', '2024-08-20 17:13:56'),
	(234, 28, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 2, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 17:14:17', '2024-08-20 17:15:48'),
	(235, 29, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 17:57:47', '2024-08-20 17:57:50'),
	(236, 29, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 17:58:05', '2024-08-20 17:58:08'),
	(237, 29, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 17:58:54', '2024-08-20 17:59:04'),
	(238, 29, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 17:59:37', '2024-08-20 17:59:38'),
	(239, 29, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 17:59:55', '2024-08-20 18:00:03'),
	(240, 29, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:01:05', '2024-08-20 18:01:11'),
	(241, 29, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:01:25', '2024-08-20 18:01:44'),
	(242, 29, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:03:12', '2024-08-20 18:03:18'),
	(243, 29, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:03:57', '2024-08-20 18:04:08'),
	(244, 30, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:06:59', '2024-08-20 18:07:02'),
	(245, 30, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:07:14', '2024-08-20 18:07:17'),
	(246, 30, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:07:44', '2024-08-20 18:07:44'),
	(247, 30, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:08:15', '2024-08-20 18:08:16'),
	(248, 30, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:08:29', '2024-08-20 18:08:37'),
	(249, 30, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:09:14', '2024-08-20 18:09:19'),
	(250, 30, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:09:49', '2024-08-20 18:10:08'),
	(251, 30, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:10:22', '2024-08-20 18:10:29'),
	(252, 30, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:11:52', '2024-08-20 18:12:01'),
	(253, 31, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:14:23', '2024-08-20 18:14:27'),
	(254, 31, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:14:37', '2024-08-20 18:14:40'),
	(255, 31, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:15:11', '2024-08-20 18:15:30'),
	(256, 31, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:16:25', '2024-08-20 18:16:25'),
	(257, 31, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:16:39', '2024-08-20 18:16:48'),
	(258, 31, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:17:38', '2024-08-20 18:17:43'),
	(259, 31, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:18:02', '2024-08-20 18:18:21'),
	(260, 31, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:19:07', '2024-08-20 18:19:14'),
	(261, 31, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:20:00', '2024-08-20 18:20:18'),
	(262, 32, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:22:01', '2024-08-20 18:22:04'),
	(263, 32, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:23:48', '2024-08-20 18:23:51'),
	(264, 32, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:24:12', '2024-08-20 18:24:23'),
	(265, 32, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:25:00', '2024-08-20 18:25:01'),
	(266, 32, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:25:33', '2024-08-20 18:25:54'),
	(267, 32, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:26:11', '2024-08-20 18:26:17'),
	(268, 32, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\r\n\r\n1. Test Memuat Data - <PASSED>\r\n2. TestShow First Five Rows - <PASSED>\r\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\r\n4. Test quartiles\'s value | Age - <PASSED>\r\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\r\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\r\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:26:58', '2024-08-20 18:26:58'),
	(269, 32, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:27:32', '2024-08-20 18:27:32'),
	(270, 32, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:28:06', '2024-08-20 18:28:15'),
	(271, 33, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:30:02', '2024-08-20 18:30:05'),
	(272, 33, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:30:36', '2024-08-20 18:30:38'),
	(273, 33, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:31:07', '2024-08-20 18:31:17'),
	(274, 33, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:32:07', '2024-08-20 18:32:08'),
	(275, 33, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:32:21', '2024-08-20 18:32:29'),
	(276, 33, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:32:46', '2024-08-20 18:32:51'),
	(277, 33, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:33:09', '2024-08-20 18:33:28'),
	(278, 33, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:33:45', '2024-08-20 18:33:52'),
	(279, 33, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:34:16', '2024-08-20 18:34:25'),
	(280, 34, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:35:54', '2024-08-20 18:35:57'),
	(281, 34, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:37:06', '2024-08-20 18:37:08'),
	(282, 34, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:37:44', '2024-08-20 18:37:54'),
	(283, 34, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:38:44', '2024-08-20 18:38:44'),
	(284, 34, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:38:54', '2024-08-20 18:39:03'),
	(285, 34, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:39:15', '2024-08-20 18:39:20'),
	(286, 34, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:39:43', '2024-08-20 18:40:02'),
	(287, 34, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:40:12', '2024-08-20 18:40:19'),
	(288, 34, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:41:15', '2024-08-20 18:41:29'),
	(289, 35, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-20 18:42:58', '2024-08-20 18:43:01'),
	(290, 35, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-20 18:43:27', '2024-08-20 18:43:30'),
	(291, 35, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-20 18:44:29', '2024-08-20 18:44:40'),
	(292, 35, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-20 18:45:27', '2024-08-20 18:45:27'),
	(293, 35, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-20 18:45:37', '2024-08-20 18:45:46'),
	(294, 35, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-20 18:45:58', '2024-08-20 18:46:04'),
	(295, 35, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-20 18:46:45', '2024-08-20 18:47:03'),
	(296, 35, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-20 18:47:36', '2024-08-20 18:47:42'),
	(297, 35, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-20 18:48:09', '2024-08-20 18:48:32'),
	(298, 36, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 05:42:04', '2024-08-21 05:42:09'),
	(299, 36, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 05:42:31', '2024-08-21 05:42:36'),
	(300, 36, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 05:43:02', '2024-08-21 05:43:15'),
	(301, 36, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 05:43:38', '2024-08-21 05:43:38'),
	(302, 36, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 05:43:52', '2024-08-21 05:44:02'),
	(303, 36, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 05:45:26', '2024-08-21 05:45:33'),
	(304, 36, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 05:45:51', '2024-08-21 05:45:51'),
	(305, 36, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 05:46:13', '2024-08-21 05:46:21'),
	(306, 36, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 05:46:49', '2024-08-21 05:47:03'),
	(307, 37, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 05:48:55', '2024-08-21 05:48:59'),
	(308, 37, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 05:49:17', '2024-08-21 05:49:21'),
	(309, 37, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 05:49:56', '2024-08-21 05:50:11'),
	(310, 37, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 05:52:21', '2024-08-21 05:52:32'),
	(311, 37, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 05:52:52', '2024-08-21 05:52:59'),
	(312, 37, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 05:53:13', '2024-08-21 05:53:37'),
	(313, 37, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 05:53:57', '2024-08-21 05:54:06'),
	(314, 37, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 05:54:34', '2024-08-21 05:54:47'),
	(315, 38, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 05:56:21', '2024-08-21 05:56:24'),
	(316, 38, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 05:56:37', '2024-08-21 05:56:41'),
	(317, 38, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 05:57:24', '2024-08-21 05:57:38'),
	(318, 38, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 05:58:04', '2024-08-21 05:58:04'),
	(319, 38, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 05:58:15', '2024-08-21 05:58:25'),
	(320, 38, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 05:58:37', '2024-08-21 05:58:44'),
	(321, 38, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 05:59:07', '2024-08-21 05:59:32'),
	(322, 38, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 05:59:54', '2024-08-21 06:00:02'),
	(323, 38, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:00:29', '2024-08-21 06:00:43'),
	(324, 39, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:01:54', '2024-08-21 06:01:57'),
	(325, 39, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:02:14', '2024-08-21 06:02:18'),
	(326, 39, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:02:38', '2024-08-21 06:02:51'),
	(327, 39, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:04:22', '2024-08-21 06:04:23'),
	(328, 39, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:04:49', '2024-08-21 06:04:59'),
	(329, 39, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:05:47', '2024-08-21 06:05:54'),
	(330, 39, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:06:14', '2024-08-21 06:06:37'),
	(331, 39, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:06:57', '2024-08-21 06:07:05'),
	(332, 39, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:07:30', '2024-08-21 06:07:43'),
	(333, 40, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:09:02', '2024-08-21 06:09:05'),
	(334, 40, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:09:25', '2024-08-21 06:09:29'),
	(335, 40, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:10:17', '2024-08-21 06:10:31'),
	(336, 40, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:11:04', '2024-08-21 06:11:05'),
	(337, 40, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:11:18', '2024-08-21 06:11:29'),
	(338, 40, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:11:43', '2024-08-21 06:11:49'),
	(339, 40, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:12:19', '2024-08-21 06:12:45'),
	(340, 40, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:13:01', '2024-08-21 06:13:09'),
	(341, 40, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:13:55', '2024-08-21 06:14:07'),
	(342, 41, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:16:12', '2024-08-21 06:16:15'),
	(343, 41, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:16:39', '2024-08-21 06:16:43'),
	(344, 41, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:17:12', '2024-08-21 06:17:24'),
	(345, 41, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:18:05', '2024-08-21 06:18:05'),
	(346, 41, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:18:24', '2024-08-21 06:18:34'),
	(347, 41, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:18:50', '2024-08-21 06:18:56'),
	(348, 41, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:19:18', '2024-08-21 06:19:44'),
	(349, 41, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:20:26', '2024-08-21 06:20:35'),
	(350, 41, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:22:27', '2024-08-21 06:22:39'),
	(351, 42, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:24:19', '2024-08-21 06:24:23'),
	(352, 42, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:27:22', '2024-08-21 06:27:26'),
	(353, 42, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:27:55', '2024-08-21 06:27:55'),
	(354, 42, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:28:07', '2024-08-21 06:28:17'),
	(355, 42, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:28:33', '2024-08-21 06:28:39'),
	(356, 42, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:29:01', '2024-08-21 06:29:01'),
	(357, 42, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:29:22', '2024-08-21 06:29:29'),
	(358, 42, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:29:56', '2024-08-21 06:30:06'),
	(359, 43, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:31:20', '2024-08-21 06:31:24'),
	(360, 43, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:31:48', '2024-08-21 06:31:52'),
	(361, 43, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:32:30', '2024-08-21 06:32:30'),
	(362, 43, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:33:00', '2024-08-21 06:33:01'),
	(363, 43, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:33:15', '2024-08-21 06:33:25'),
	(364, 43, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:33:40', '2024-08-21 06:33:46'),
	(365, 43, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:34:01', '2024-08-21 06:34:26'),
	(366, 43, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:34:50', '2024-08-21 06:34:57'),
	(367, 43, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:35:29', '2024-08-21 06:35:40'),
	(368, 44, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:37:26', '2024-08-21 06:37:29'),
	(369, 44, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:37:40', '2024-08-21 06:37:44'),
	(370, 44, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:38:12', '2024-08-21 06:38:25'),
	(371, 44, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:39:01', '2024-08-21 06:39:01'),
	(372, 44, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:39:14', '2024-08-21 06:39:27'),
	(373, 44, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:39:41', '2024-08-21 06:39:47'),
	(374, 44, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:40:26', '2024-08-21 06:40:51'),
	(375, 44, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:41:26', '2024-08-21 06:41:34'),
	(376, 44, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:41:59', '2024-08-21 06:42:11'),
	(377, 45, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:43:52', '2024-08-21 06:43:56'),
	(378, 45, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:44:12', '2024-08-21 06:44:17'),
	(379, 45, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:44:45', '2024-08-21 06:44:58'),
	(380, 45, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:45:26', '2024-08-21 06:45:26'),
	(381, 45, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:45:40', '2024-08-21 06:45:49'),
	(382, 45, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:46:13', '2024-08-21 06:46:19'),
	(383, 45, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 2, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:46:34', '2024-08-21 06:47:25'),
	(384, 45, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:49:04', '2024-08-21 06:49:12'),
	(385, 45, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:49:31', '2024-08-21 06:49:42'),
	(386, 46, 1, './public/submissions/answer_bab1_percobaan1.py', NULL, 1, '## BAB 1 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>', '2024-08-21 06:51:23', '2024-08-21 06:51:27'),
	(387, 46, 2, './public/submissions/answer_bab1_percobaan2.py', NULL, 1, '## BAB 1 | Percobaan 2\n\n1. Test Memuat Data  - <PASSED>\n2. Test Fungsi sample_rows() - <PASSED>', '2024-08-21 06:51:40', '2024-08-21 06:51:43'),
	(388, 46, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 1, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n3. Test Mengisi Nilai yang Hilang  - <PASSED>', '2024-08-21 06:52:07', '2024-08-21 06:52:20'),
	(389, 46, 5, './public/submissions/answer_bab3_percobaan1.py', NULL, 1, '## BAB 3 | Percobaan 1\n\n1. Test Dimensi Array- - <PASSED>\n2. Test Pemotongan Array- - <PASSED>\n3. Test Tipe Hasil Pemotongan Array- - <PASSED>', '2024-08-21 06:53:05', '2024-08-21 06:53:06'),
	(390, 46, 6, './public/submissions/answer_bab3_percobaan2.py', NULL, 1, '## BAB 3 | Percobaan 2\n\n1. Test Memuat Data - <PASSED>\n2. Test Fungsi head_rows() - <PASSED>\n3. Test Membuat Kolom Revenue  - <PASSED>\n4. Test Nilai Variabel total_pendapatan - <PASSED>', '2024-08-21 06:53:18', '2024-08-21 06:53:29'),
	(391, 46, 7, './public/submissions/answer_bab3_percobaan3.py', NULL, 1, '## BAB 3 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n2. Test Critic_Score Conversion - <PASSED>\n2. Test Create Variable top_10_movies - <PASSED>', '2024-08-21 06:54:00', '2024-08-21 06:54:07'),
	(392, 46, 8, './public/submissions/answer_bab3_percobaan4.py', NULL, 1, '## BAB 3 | Percobaan 4\n\n1. Test Memuat Data - <PASSED>\n2. TestShow First Five Rows - <PASSED>\n3. Test calculates descriptive statistics for Customer Age - <PASSED>\n4. Test quartiles\'s value | Age - <PASSED>\n5. Test calculates descriptive statistics for Total Spent - <PASSED>\n6. Test quartiles\'s value | Total Spent (USD) - <PASSED>\n7. calculates correlation coefficient - <PASSED>', '2024-08-21 06:54:24', '2024-08-21 06:54:48'),
	(393, 46, 9, './public/submissions/answer_bab3_percobaan5.py', NULL, 1, '## BAB 3 | Percobaan 5\n\n1. Test Memuat Data - <PASSED>\n2. Test Calculates Mean - <PASSED>\n3. Test Calculates Median - <PASSED>\n4. Test Calculates Mode - <PASSED>', '2024-08-21 06:55:02', '2024-08-21 06:55:09'),
	(394, 46, 10, './public/submissions/answer_bab4_percobaan1.py', NULL, 1, '## BAB 4 | Percobaan 1\n\n1. Test Memuat Data - <PASSED>\nGet Population Column - <PASSED>\nGet Age Group Column - <PASSED>\nCheck Pie Chart - <PASSED>', '2024-08-21 06:55:45', '2024-08-21 06:56:31'),
	(395, 47, 4, './public/submissions/answer_bab2_percobaan3.py', NULL, 2, '## BAB 2 | Percobaan 3\n\n1. Test Memuat Data - <PASSED>\n   Kesalahan: ====> Error pada update_data(); Terdapat Typo pada kode function: name \'updated_df\' is not defined\n3. Test Mengisi Nilai yang Hilang  - <FAILED>', '2024-08-23 16:18:12', '2024-08-23 16:22:23');
/*!40000 ALTER TABLE `student_submissions` ENABLE KEYS */;

-- Dumping structure for table iclop3.submission
CREATE TABLE IF NOT EXISTS `submission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) DEFAULT NULL,
  `submission_count` int(11) NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `test_result` text,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iclop3.submission: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;

-- Dumping structure for table iclop3.submissions
CREATE TABLE IF NOT EXISTS `submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `type` enum('file','url') COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The path to the file or the url',
  `status` enum('pending','processing','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` json DEFAULT NULL COMMENT 'The results of the submission',
  `attempts` int(11) NOT NULL DEFAULT '1' COMMENT 'The number of attempts to process the submission',
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT 'The port number of the submission',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_user_id_foreign` (`user_id`),
  KEY `submissions_project_id_foreign` (`project_id`),
  CONSTRAINT `submissions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.submissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;

-- Dumping structure for table iclop3.submission_histories
CREATE TABLE IF NOT EXISTS `submission_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `type` enum('file','url') COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The path to the file or the url',
  `status` enum('pending','processing','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` json DEFAULT NULL COMMENT 'The results of the submission',
  `attempts` int(11) NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT 'The port number of the submission',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'The description of the submission',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_histories_submission_id_foreign` (`submission_id`),
  KEY `submission_histories_user_id_foreign` (`user_id`),
  KEY `submission_histories_project_id_foreign` (`project_id`),
  CONSTRAINT `submission_histories_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submission_histories_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submission_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.submission_histories: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_histories` ENABLE KEYS */;

-- Dumping structure for table iclop3.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` bigint(20) unsigned NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_material_id_foreign` (`material_id`),
  CONSTRAINT `tasks_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.tasks: ~8 rows (approximately)
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `material_id`, `task_name`, `pdf_path`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Memuat Data dari CSV menggunakan URL', 'Data_analitik_bab1_Percobaan1.pdf', '2024-08-07 14:16:05', '2024-08-07 14:16:06'),
	(2, 1, 'Menampilkan Data Produk Online Store', 'Data_analitik_bab1_Percobaan2.pdf', '2024-08-07 14:16:41', '2024-08-07 14:16:43'),
	(3, 2, 'Pembersihan Data pada Data Perumahan NYC', 'Data_analitik_bab2_Percobaan2.pdf', '2024-08-07 14:17:29', '2024-08-07 14:17:30'),
	(4, 2, 'Mengisi Nilai Hilang pada Kolom Kalori', 'Data_analitik_bab2_Percobaan3.pdf', '2024-08-07 14:19:49', '2024-08-07 14:19:53'),
	(5, 3, 'Mengambil Data Spesifik Penjualan Produk ', 'Data_analitik_bab3_Percobaan1.pdf', '2024-08-07 14:20:34', '2024-08-07 14:24:29'),
	(6, 3, 'Menghitung Jumlah Total Pendapatan Produk ', 'Data_analitik_bab3_Percobaan2.pdf', '2024-08-07 14:21:03', '2024-08-07 14:24:29'),
	(7, 3, 'Menganalisis dataset film untuk menemukan 10 film Terbaik', 'Data_analitik_bab3_Percobaan3.pdf', '2024-08-07 14:21:31', '2024-08-07 14:24:30'),
	(8, 3, 'nalisa Umur Pelanggan dan Total Pengeluaran', 'Data_analitik_bab3_Percobaan4.pdf', '2024-08-07 14:23:08', '2024-08-07 14:24:30'),
	(9, 3, 'Analisis Penjualan Elektronik: Memahami Tren Penjualan Melalui Measures of Central Tendency', 'Data_analitik_bab3_Percobaan5.pdf', '2024-08-07 14:23:44', '2024-08-07 14:24:31'),
	(10, 4, 'Analisa Distribusi Usia Penduduk di Suatu Kota', 'Data_analitik_bab4_Percobaan1.pdf', '2024-08-07 14:24:27', '2024-08-07 14:24:31');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Dumping structure for table iclop3.temporary_files
CREATE TABLE IF NOT EXISTS `temporary_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `folder_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.temporary_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;

-- Dumping structure for table iclop3.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `google_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table iclop3.users: ~43 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `google_id`, `name`, `email`, `email_verified_at`, `role`, `password`, `teacher`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Noora', 'noora20fairy@gmail.com', '2024-08-04 19:48:56', 'student', '$2y$10$TVg35iSKJ6InmzPO3y0sO.ahlIqD3uIcgwMxOVTCsGo6Jp8wx6ys2', 'Yan Watequlis Syaifudin', NULL, '2024-08-03 06:58:31', '2024-08-07 06:58:31'),
	(2, NULL, 'Aulia', 'aulia20fh@gmail.com', '2024-08-04 19:48:54', '', '$2y$10$mtq7XsVGesZ7TMtaJRbQiOKuQ6PChciKt8nu52z8ZSMChI7fwbvjm', 'Pramana Yoga Syaputra', NULL, '2024-08-04 05:18:42', '2024-08-08 05:18:42'),
	(3, NULL, 'Liliana', 'liliana20@gmail.com', '2024-08-04 19:48:56', '', '$2y$10$9jwbuyJi9L9ng/R7I8PQmOTno6KTYa13GzXHcqUJxRx1NPtWnuM/q', 'Yan Watequlis Syaifudin', NULL, '2024-08-04 10:33:45', '2024-08-09 10:33:45'),
	(4, NULL, 'amalia', 'amalia20@gmail.com', '2024-08-04 09:42:25', '', '$2y$10$hUGrmCADhFXj4ZdiF4S/kOStAZjWXMuZ4wgLnL957LyPiXDP/RKyK', 'Yan Watequlis Syaifudin', NULL, '2024-08-04 13:03:42', '2024-08-09 13:03:42'),
	(5, NULL, 'ariana', 'ariana20@gmail.com', '2024-08-04 10:15:39', '', '$2y$10$HJ0V.WvITs8J37K/ozl0JOod6ZN8J/6vuL9Z/CRF9Mn5Lr.I/HwNq', 'Yan Watequlis Syaifudin', NULL, '2024-08-04 04:47:03', '2024-08-11 04:47:03'),
	(6, NULL, 'Amel', 'ammmel0@gmail.com', '2024-08-04 13:28:58', '', '$2y$10$oFMfCvAPIa3/uWSlGMYW4eqHX3sdZ/Ngx5bzKwN7izrQiwFAh9v5W', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 07:56:54', '2024-08-05 07:56:54'),
	(7, NULL, 'Rossa Akmalia', 'rossaakmalia66@gmail.com', '2024-08-05 12:00:09', '', '$2y$10$UUV7/fXyntJAzzO0Egl.ye6Cn982z5FLWYimB4Cp9T72DH/9mrApi', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 08:23:06', '2024-08-05 08:23:06'),
	(8, NULL, 'Annisa Aulia Nadhila', 'aanadhila225@gmail.com', '2024-08-05 12:30:10', '', '$2y$10$6KrSBjMgb0wwdn3PigWWPuzKo1pTYCCdWhz1yX0KgvushGoFf0HpK', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 10:23:43', '2024-08-05 10:23:43'),
	(9, NULL, 'Rofika Nur \'Aini', 'rofikanuraini30@gmail.com', '2024-08-05 13:12:11', '', '$2y$10$7Z6ub09CZ/OyHE0OtT2zP.fRYV2L3MiunKJYZ8xnm24VfbJn/w7HW', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 11:44:38', '2024-08-05 11:44:38'),
	(10, NULL, 'Amalia Nuraini', 'amalianuraini10@gmail.com', '2024-08-05 13:45:48', '', '$2y$10$dOlHviHqbdZDB1NYfOzvzeL0dNyp0IKsugsH7CpKHF5ZeSGDRzWaG', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:02:43', '2024-08-05 12:02:43'),
	(11, NULL, 'Akhmadheta Hafid Prasetyawan', 'akhmadheta097@gmail.com', '2024-08-05 14:18:27', '', '$2y$10$o8RZXMQFvnaqZaPN4Wc1.uiq7F1b0oM/utbXiuboP.Skh4BTVOnB6', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:04:39', '2024-08-05 12:04:39'),
	(12, NULL, 'Deatrisya Mirela Harahap', 'mirelldee47@gmail.com', '2024-08-05 14:50:25', '', '$2y$10$C9YNcBJPtrU78O97K9zmw.4AQ2vZ9EiKbXdFhOUeAaTmphPH8by3q', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:05:56', '2024-08-05 12:05:56'),
	(13, NULL, 'Chan Paul Amol', 'chan4172@gmail.com', '2024-08-05 15:25:33', '', '$2y$10$8HQJNWHrmnDX7yKaeKY68eiZ0scKuYWMosfG8ZZfYJppyz2DheUru', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:09:20', '2024-08-05 12:09:20'),
	(14, NULL, 'Elvira Sania Mufida', 'elvirasaniamufida@gmail.com', '2024-08-05 16:00:51', '', '$2y$10$237aA4ce4xvXFplyTwoRqOjPfvGOsr8MAo6gj1ogOHU13Cw0eRdhS', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:11:01', '2024-08-05 12:11:01'),
	(15, NULL, 'Eva Monika Septiana', 'evamonika99p@gmail.com', '2024-08-05 16:35:41', '', '$2y$10$tNKVYCnAI9Xb9mqKdeUFFucq6qFTQ94Jruan1OgI8/d4TB9rPu27i', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:12:35', '2024-08-05 12:12:35'),
	(16, NULL, 'FAHREZA PRIMA HAKIM', 'fahreza.prima@gmail.com', '2024-08-05 17:00:32', '', '$2y$10$fY1d2Hm4JIdsRd37xtXMPu33t/La9.hO5pMH6Yu0SfWKpZDiDTsOm', 'Yan Watequlis Syaifudin', NULL, '2024-08-05 12:15:28', '2024-08-05 12:15:28'),
	(17, NULL, 'Khofifah Amanda', 'khofifahamanda04@gmail.com', '2024-08-06 23:13:56', '', '$2y$10$Y4CEFiNPfHlzvsEMxQg5x.rLfLU/g78Lz4hc4qbn78yBTIJypw/fS', 'Pramana Yoga Syaputra', NULL, '2024-08-19 16:02:27', '2024-08-19 16:02:27'),
	(18, NULL, 'Maulana Bintang I.', 'maulanabintang6621@gmail.com', '2024-08-06 23:13:57', '', '$2y$10$7XcX4ObZ5MvsPJGXmRm.YeyZBBwQ96BBiYRTCKCNHJN1zg1SJoJIq', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:04:29', '2024-08-19 16:04:29'),
	(19, NULL, 'Mochammad Hairullah', 'vegetarianalami@gmail.com', '2024-08-06 23:13:57', '', '$2y$10$6hWvparS5r24UThEms1yR.JJMgSwtKxu3BhZFYIo.E7jpPT15ebd.', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:05:43', '2024-08-19 16:05:43'),
	(20, NULL, 'M. Thosin Yuhaililul Hilmi', 'thosinnhilmi@gmail.com', '2024-08-06 23:13:58', '', '$2y$10$gDCoLj2lMRWsgIOqkCr6OOqMw81YzWGfJpJnmVGkkGJeUnE0Xk3Om', 'Pramana Yoga Syaputra', NULL, '2024-08-19 16:06:35', '2024-08-19 16:06:35'),
	(21, NULL, 'Iftitah Hidayati', 'hidayatiiftitah@gmail.com', '2024-08-06 23:13:59', '', '$2y$10$w5TOa26azP2tO2RhLv55oOGvh6rJ2cIWnD/zCYDTUosbn6kKOCuaq', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:08:33', '2024-08-19 16:08:33'),
	(22, NULL, 'Hilda Khoirotul Hidayah', 'hildakh07@gmail.com', '2024-08-06 23:13:59', '', '$2y$10$nNzTaHWt7JCrxtV9BrlWMurebIe7tx6etq/HnGMu6RsCxxb3uqN.q', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:09:38', '2024-08-19 16:09:38'),
	(23, NULL, 'Muhammad Ilham El Hakim', 'ilhamelhakim6@gmail.com', '2024-08-06 23:14:00', '', '$2y$10$Dc4dYNIBYxHOkUQUt38CnOTqOz1CfxZZHI1vQWNfExDWw3AbEFPLa', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:10:22', '2024-08-19 16:10:22'),
	(24, NULL, 'Ibnu Khalis Rabbani', 'ibnukhalisr@gmail.com', '2024-08-06 23:14:00', '', '$2y$10$bRJdcqtb/WYciSTgjZi5M.ggEvN7TsdbP1Ve1yGy6PDi5kMFV6ODG', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:12:45', '2024-08-19 16:12:45'),
	(25, NULL, 'Annisa Fitri Yuliandra', 'annisafitryyuliandra@gmail.com', '2024-08-06 23:14:01', '', '$2y$10$u2yJ1bpBkhuzpQtgGavD6e/ink4r2EWRrdoDWRm574A/5pkvm96uS', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:13:28', '2024-08-19 16:13:28'),
	(26, NULL, 'Rabiatul Fitra Aulia', 'auliafitra2002@gmail.com', '2024-08-07 23:36:55', '', '$2y$10$R1PddO7SThq.duFi5bpoie9Yj8BsnLsLi7J5gJdTkXcCVWTxG0Po.', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:24:51', '2024-08-19 16:24:51'),
	(27, NULL, 'Neha Viranica Nauly', '20020828neha@gmail.com', '2024-08-07 23:36:56', '', '$2y$10$iJ.xWGwjnW4nz7ktggHFQuzkXODZWzVmhT6ESPhcqaXoAYsNGgOlu', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:26:20', '2024-08-19 16:26:20'),
	(28, NULL, 'Shine Devi Oktaviana Ronix Syah Putri', 'shinedevi02@gmail.com', '2024-08-07 23:36:57', '', '$2y$10$2dZaaVj1TVIYVyrjn3byvO8N5zQH6rkzHE.LRmHCY9kVv.B4L.gUK', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:27:38', '2024-08-19 16:27:38'),
	(29, NULL, 'Ahmad Farrel Sirajudin Zaidan', 'farrel.ahmad.zaidan@gmail.com', '2024-08-07 23:36:57', '', '$2y$10$xC3.V7UA/9dLOHl91jahdeLsoWXEpy9f4Fdt/o14yAw.YgzQA7Cny', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:28:21', '2024-08-19 16:28:21'),
	(30, NULL, 'Andre Maulana Mustofa', 'andremm73@gmail.com', '2024-08-07 23:37:01', '', '$2y$10$tyUnBMAJVPqn016nmmNaU.myVccGNP7j5snAefJ7hpoRSMBXVnYL2', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:29:20', '2024-08-19 16:29:20'),
	(31, NULL, 'Abdulilah Ali Qaid Al-shabany', 'alshabanyabdulilah2001@gmail.com', '2024-08-07 23:37:02', '', '$2y$10$vDg8.Hk2C.FDRPcCZktPhultxYZLZbdt52qKVP6v8GIgGPu6kPKjO', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:36:28', '2024-08-19 16:36:28'),
	(32, NULL, 'Atmayanti', 'mayablue74@gmail.com', '2024-08-08 23:47:28', '', '$2y$10$aLvYYvQ3CpIvgoDJ3WBmKeJuDZ1riqjs/Ys3Hb.B.Mk2Vm1GQkbNS', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:38:46', '2024-08-19 16:38:46'),
	(33, NULL, 'Della Jannata Febiana', 'dellajannatatie@gmail.com', '2024-08-08 23:47:29', '', '$2y$10$9T8UbJKA8/a5ENk.jU1gnu4akmoyftnRnuBP7yOkTTUORI0CBkVhK', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:41:13', '2024-08-19 16:41:13'),
	(34, NULL, 'Dherisma Hanindita Utami', 'dherismautami@gmail.com', '2024-08-08 23:47:30', '', '$2y$10$jYFcbA7QhH44sYW1KHar9OvMHKcDHIMtw2lydwf9a0M0nJdpS66Ym', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:42:00', '2024-08-19 16:42:00'),
	(35, NULL, 'farah zulfa hamidah', 'zulfafara1@gmail.com', '2024-08-08 23:47:31', '', '$2y$10$PvrDmNgBM.xOUd68stUm5Oz5EJADu7U3PoACi5Uz5ftCM0SFpwL/e', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:43:42', '2024-08-19 16:43:42'),
	(36, NULL, 'Lelyta salsabila', 'salsabilalelyta@gmail.com', '2024-08-09 00:33:10', '', '$2y$10$qBPf4QujGPSHoaFGOYKpWeD8BNaVArbnFTa5BYAUD7Ob7CGUvgqQ2', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 16:49:52', '2024-08-19 16:49:52'),
	(37, NULL, 'Mohammad Izamul Fikri Fahmi', 'fikriizamul@gmail.com', '2024-08-09 00:33:11', '', '$2y$10$trz0aMoOYyQ3bGXDYIxuDeaIL03.FQmRpJKa544yVbc5dDJbnt53C', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:27:59', '2024-08-19 17:27:59'),
	(38, NULL, 'Hafidz Irwan M', 'lefet313@gmail.com', '2024-08-09 00:33:11', '', '$2y$10$Nt7Rjt9OTixP721TnitgX.fzWXVZ36uRP1yGNBWZdn8713a2djzMm', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:30:31', '2024-08-19 17:30:31'),
	(39, NULL, 'Hanif Widyantoro', 'hnfwidian@gmail.com', '2024-08-09 00:34:56', '', '$2y$10$GFvgRwPnNw8XVhYSD6O04eQWRClyFTOOoL2eY0BEqDYGD7PeZZjt2', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:32:51', '2024-08-19 17:32:51'),
	(40, NULL, 'Izzatun Nauly', 'naulizzatun159@gmail.com', '2024-08-09 00:34:57', '', '$2y$10$hzuplKiU7WZnH0ynbJVox.P01AgtIJgJx7DV10uGS1YnZby4z5OPa', 'Pramana Yoga Syaputra', NULL, '2024-08-19 17:34:44', '2024-08-19 17:34:44'),
	(41, NULL, 'Nanda Shabrina Putri Kurnia', 'nandaashabrina2604@gmail.com', '2024-08-10 00:43:28', '', '$2y$10$VwpTpPz2E8YsxuHWcxfDJO2jbqp7bc6Tq5q/Fb.VZjdjbMDwGjKp6', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:38:24', '2024-08-19 17:38:24'),
	(42, NULL, 'Alifiyul Akyun', 'alifiyulakyun1@gmail.com', '2024-08-10 00:46:38', '', '$2y$10$9VVAqPa0fOYq/kn8AsKMpeq4bxtsP5MqacEb59l0d/hsNezD3aQmm', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:43:14', '2024-08-19 17:43:14'),
	(43, NULL, 'Salwa Zhafira Pratiwi Wahyudi', 'salwapw04@gmail.com', '2024-08-11 00:46:39', '', '$2y$10$7H7efRYEAkP3s0h0.0177O7utDJJ.MYgV0Lfh.engmo.k6CWDBXY2', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:45:43', '2024-08-19 17:45:43'),
	(44, NULL, 'Nurlaily Asrobika', 'asrobika01@gmail.com', '2024-08-11 00:51:24', '', '$2y$10$8mKRgA6LvQoKYdg2bhtJyOC5hW621//OG11HKcjMG5FRCPcFeOrIy', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:46:26', '2024-08-19 17:46:26'),
	(45, NULL, 'Yoby Ryaian Pratama', 'yobir231@gmail.com', '2024-08-12 00:51:30', '', '$2y$10$fwMxAe/QPIi.VnM5eYLT6eh2I1D75s.2ofIX9TnsTfNtTt4LywLzS', 'Yan Watequlis Syaifudin', NULL, '2024-08-19 17:49:12', '2024-08-19 17:49:12'),
	(46, NULL, 'Yaldika Putra Sinaga', 'yaldikaimagine@gmail.com', '2024-08-12 00:51:31', '', '$2y$10$ozSVNmlEjS1gd4IeEbG6z.SzlVVOWU4lkrec3SCGWyPqDRmPmf9XS', 'Yan Watequlis Syaifudin', NULL, '2024-08-12 00:51:31', '2024-08-12 00:51:31'),
	(47, NULL, 'sintia', 'sintia20@gmail.com', NULL, '', '$2y$10$CV1l6m/ev09L9D1G7Dexr.7/CMY2Oi.rSvBjkl.YINQqdPv9LWR3.', 'Yan Watequlis Syaifudin', NULL, '2024-08-23 16:17:00', '2024-08-23 16:17:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
