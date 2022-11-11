-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mtest
CREATE DATABASE IF NOT EXISTS `mtest` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mtest`;

-- Dumping structure for table mtest.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_group: ~0 rows (approximately)

-- Dumping structure for table mtest.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table mtest.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_permission: ~24 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session');

-- Dumping structure for table mtest.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `marks` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_user: ~3 rows (approximately)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `marks`) VALUES
	(1, 'pbkdf2_sha256$390000$jR1EIWH40ivqilV3yF6548$zDdddYlo/U1uQ1i3Bwuq/nks/KxqS9/CRf4j5MRYCmg=', '2022-11-02 21:40:03.193467', 1, 'admin', '', '', '', 1, 1, '2022-11-01 15:04:41.364840', NULL),
	(3, 'pbkdf2_sha256$390000$kuAlN1LC5ht4MkOvYsXPyE$4C7uXuMM0ySaa78aCBaCDROI7woQtDcHExKYCWL8c08=', '2022-11-02 21:36:30.517383', 0, 'shan', '', '', 'shan@gmail.com', 0, 1, '2022-11-02 15:55:40.520227', 8),
	(4, 'pbkdf2_sha256$390000$Bq7pTriSVj89HdYwEulEL0$0N7GNCCtCWTxga/YjO0GqH//qMIqhKWAbrRk+MMYXzQ=', '2022-11-02 16:04:15.642505', 0, 'rahul', 'Rahul', 'R', 'rahul@gmail.com', 0, 1, '2022-11-02 16:04:13.953805', 0);

-- Dumping structure for table mtest.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_user_groups: ~0 rows (approximately)

-- Dumping structure for table mtest.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table mtest.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.django_admin_log: ~0 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-11-01 17:02:19.106627', '5', 'test object (5)', 1, '[{"added": {}}]', 7, 1);

-- Dumping structure for table mtest.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.django_content_type: ~6 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'gadd', 'test'),
	(6, 'sessions', 'session');

-- Dumping structure for table mtest.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.django_migrations: ~18 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-11-01 14:57:00.642036'),
	(2, 'auth', '0001_initial', '2022-11-01 14:57:11.395861'),
	(3, 'admin', '0001_initial', '2022-11-01 14:57:14.395333'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-01 14:57:14.564665'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-01 14:57:14.632554'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-01 14:57:15.966627'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-01 14:57:17.477081'),
	(8, 'auth', '0003_alter_user_email_max_length', '2022-11-01 14:57:17.997616'),
	(9, 'auth', '0004_alter_user_username_opts', '2022-11-01 14:57:18.186832'),
	(10, 'auth', '0005_alter_user_last_login_null', '2022-11-01 14:57:19.844363'),
	(11, 'auth', '0006_require_contenttypes_0002', '2022-11-01 14:57:19.886996'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-01 14:57:19.974494'),
	(13, 'auth', '0008_alter_user_username_max_length', '2022-11-01 14:57:20.194147'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-01 14:57:20.377675'),
	(15, 'auth', '0010_alter_group_name_max_length', '2022-11-01 14:57:20.534206'),
	(16, 'auth', '0011_update_proxy_permissions', '2022-11-01 14:57:20.692396'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-01 14:57:20.971756'),
	(18, 'sessions', '0001_initial', '2022-11-01 14:57:21.678700');

-- Dumping structure for table mtest.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.django_session: ~4 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('2t7rirawrgbe3v2r6nz1vcm4s0uripya', '.eJxVjEEOwiAQRe_C2pDCgExduu8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIilDj9boH4keoO4p3qrUludV3mIHdFHrTLqcX0vB7u30GhXr51IAsjngEVRebMAyJolyNl7RKBHUBhBs3gyFm0aFCxGTUackHHoMT7A-B4N3c:1oqLSt:4-W2YqP6f3E2Q-8mPexd_sxokWT7oSz0YfJ0PPtkC58', '2022-11-16 21:40:03.351438'),
	('2x1zpzlh1n59d0y6m5ngbxfc6igz86nx', 'e30:1opwpv:gCDpKPeH9Wo3rZkkYeZKygchY1G8RKV03wQWVhlPRIc', '2022-11-15 19:22:11.036923'),
	('dkqacrsvs2wzt7euk5y0iyzso2pc9h7j', 'e30:1opwkn:A-fCpOuSwKMmzWU7xjjhCfugoZSMAMiOQEftJa3OTws', '2022-11-15 19:16:53.611672'),
	('v057z0eibe5wes3nv741og9qjoi6idpw', 'e30:1opwno:QZ_SdLMC33wiCWioXOPrr8UUmbPnBA1w-d0QJ5eXRdI', '2022-11-15 19:20:00.500460');

-- Dumping structure for table mtest.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) DEFAULT NULL,
  `answer` char(50) DEFAULT NULL,
  `opt2` char(50) DEFAULT NULL,
  `opt3` char(50) DEFAULT NULL,
  `opt1` char(50) DEFAULT NULL,
  `time` int(11) DEFAULT 30 COMMENT 'in seconds',
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.test: ~5 rows (approximately)
INSERT INTO `test` (`id`, `question`, `answer`, `opt2`, `opt3`, `opt1`, `time`, `status`) VALUES
	(1, 'Tell me if you …………any help.', 'need', 'needed', 'would', 'did need', 30, 1),
	(2, 'The first time I ………… him was at university.', 'met', 'will met', 'had met', 'meet', 30, 1),
	(3, 'This is the garage ………they used to work.', 'where', 'where is', 'is', 'are', 30, 1),
	(4, 'I ……a terrible experience yesterday.', 'had', 'have', 'am', 'would had', 30, 1),
	(5, 'where ....... you last night?', 'where', 'had', 'did', 'is', 30, 1);

-- Dumping structure for table mtest.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` char(50) DEFAULT NULL,
  `sname` char(50) DEFAULT NULL,
  `username` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  `email` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mtest.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `fname`, `sname`, `username`, `password`, `email`) VALUES
	(1, NULL, NULL, 'shan', '12345', 'shan@mail.com'),
	(6, NULL, NULL, 'rahul', '123', 'rahul@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
