-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2026 at 11:00 AM
-- Server version: 8.4.8
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sutariya_hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` enum('present','absent','half_day','late','on_leave') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `date`, `check_in`, `check_out`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 2, '2026-02-06', '11:21:11', '01:53:19', 'half_day', 'for home work regarding', '2026-02-06 00:22:14', '2026-02-06 00:22:14'),
(2, 2, '2026-02-07', '10:22:37', '16:22:53', 'present', NULL, '2026-02-06 05:23:08', '2026-02-06 05:23:08'),
(4, 2, '2026-02-16', '12:17:33', '14:34:08', 'late', NULL, '2026-02-16 06:47:33', '2026-02-16 09:04:08'),
(5, 2, '2026-02-17', '10:06:57', NULL, 'late', NULL, '2026-02-17 04:36:57', '2026-02-17 04:36:57'),
(6, 4, '2026-02-17', '11:04:14', '16:13:01', 'late', NULL, '2026-02-17 05:34:14', '2026-02-17 10:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('sutariya-hrms-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:4;', 1771324962),
('sutariya-hrms-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1771324962;', 1771324962),
('sutariya-hrms-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:101:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:18:\"ViewAny:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"View:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:17:\"Create:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:17:\"Update:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:17:\"Delete:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:18:\"Restore:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:22:\"ForceDelete:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:25:\"ForceDeleteAny:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:21:\"RestoreAny:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:20:\"Replicate:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:18:\"Reorder:Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:17:\"ViewAny:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:14:\"View:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:16:\"Create:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:16:\"Update:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:16:\"Delete:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:17:\"Restore:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:21:\"ForceDelete:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:24:\"ForceDeleteAny:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:20:\"RestoreAny:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:19:\"Replicate:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:17:\"Reorder:LeaveType\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:16:\"ViewAny:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"View:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"Create:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:15:\"Update:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"Delete:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:16:\"Restore:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:20:\"ForceDelete:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:23:\"ForceDeleteAny:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:19:\"RestoreAny:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:18:\"Replicate:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:16:\"Reorder:Position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:12:\"ViewAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:9:\"View:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:11:\"Create:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:11:\"Update:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:11:\"Delete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:12:\"Restore:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:16:\"ForceDelete:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:19:\"ForceDeleteAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:15:\"RestoreAny:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:14:\"Replicate:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:12:\"Reorder:User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:12:\"ViewAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:9:\"View:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:11:\"Create:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:11:\"Update:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:11:\"Delete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:12:\"Restore:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:16:\"ForceDelete:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:19:\"ForceDeleteAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:15:\"RestoreAny:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:14:\"Replicate:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:12:\"Reorder:Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:18:\"View:StatsOverview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:18:\"ViewAny:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:15:\"View:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:17:\"Create:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"Update:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:17:\"Delete:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:18:\"Restore:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:22:\"ForceDelete:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:25:\"ForceDeleteAny:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"RestoreAny:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:20:\"Replicate:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:18:\"Reorder:Attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:20:\"ViewAny:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:17:\"View:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:19:\"Create:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:19:\"Update:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:19:\"Delete:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:20:\"Restore:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:24:\"ForceDelete:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:27:\"ForceDeleteAny:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:23:\"RestoreAny:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:22:\"Replicate:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:20:\"Reorder:LeaveRequest\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:15:\"ViewAny:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:12:\"View:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:14:\"Create:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:14:\"Update:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:14:\"Delete:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:15:\"Restore:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:19:\"ForceDelete:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:22:\"ForceDeleteAny:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:18:\"RestoreAny:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:17:\"Replicate:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:15:\"Reorder:Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:25:\"ViewAny:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:22:\"View:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:24:\"Create:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:24:\"Update:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:24:\"Delete:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:25:\"Restore:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:29:\"ForceDelete:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:32:\"ForceDeleteAny:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:28:\"RestoreAny:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:27:\"Replicate:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:25:\"Reorder:PerformanceReview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:15:\"View:CheckInOut\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"hr_manager\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:8:\"employee\";s:1:\"c\";s:3:\"web\";}}}', 1771408027);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `manager_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `manager_id`, `created_at`, `updated_at`, `color`) VALUES
(1, 'Sales', 'this is sales department', NULL, '2026-02-05 06:35:15', '2026-02-05 06:49:03', '#de1d1d'),
(2, 'Human Resource', 'This is Human Resource Department', NULL, '2026-02-05 23:40:58', '2026-02-05 23:40:58', '#21db17'),
(3, 'wordpress Developers', 'ram singh is manger of wordpress develpoer', 2, '2026-02-16 12:22:18', '2026-02-16 12:22:18', '#ab35db');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(4, 'default', '{\"uuid\":\"a7a9b1e7-fc98-4a90-8d23-c220fc0878cc\",\"displayName\":\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:231:\\\"http:\\/\\/127.0.0.1:8000\\/employee\\/password-reset\\/reset?email=rajputkhushal04%40gmail.com&token=27d887177a787c32bf4764d8c14ae99b9061903e0bbb5a1568ebf64391edbe90&signature=78951dce4d61e42be8a8a462c028fe663faa1a71816d0ce9727fede2a2279b12\\\";s:5:\\\"token\\\";s:64:\\\"27d887177a787c32bf4764d8c14ae99b9061903e0bbb5a1568ebf64391edbe90\\\";s:2:\\\"id\\\";s:36:\\\"639cc706-f29c-4c78-99d0-38082aabb959\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1771215658,\"delay\":null}', 0, NULL, 1771215658, 1771215658);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `leave_type_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_type_id`, `start_date`, `end_date`, `days`, `reason`, `status`, `approved_by`, `approved_at`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2026-02-16', '2026-03-19', 32, 'wedding ', 'approved', NULL, NULL, NULL, '2026-02-16 07:25:29', '2026-02-16 08:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days_per_year` int NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `days_per_year`, `is_paid`, `created_at`, `updated_at`) VALUES
(1, 'Annual Leave', 56, 1, '2026-02-06 00:58:37', '2026-02-06 00:58:37'),
(2, 'monthly Leave', 2, 1, '2026-02-06 00:59:29', '2026-02-06 00:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_05_111207_create_departments_table', 2),
(5, '2026_02_05_111447_create_positions_table', 2),
(6, '2026_02_05_111726_name', 2),
(7, '2026_02_05_111859_add_hr_fields_to_users_table', 2),
(8, '2026_02_05_112028_create_attendances_table', 2),
(9, '2026_02_05_112329_create_leave_types_table', 2),
(10, '2026_02_05_112537_create_leave_requests_table', 2),
(11, '2026_02_05_112705_create_payrolls_table', 2),
(12, '2026_02_05_112851_create_performance_reviews_table', 2),
(13, '2026_02_05_113819_create_permission_tables', 3),
(14, '2026_02_05_120320_add_color_to_departments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('rajputkhushal04@gmail.com', '$2y$12$tCzTW1wbcJ/ny7s.hkNwD.twbwCc/LUgpvZpuyjxNQHQIVx71ocZm', '2026-02-15 22:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `allowances` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deductions` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `net_salary` decimal(10,2) NOT NULL,
  `status` enum('draft','processed','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `paid_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `user_id`, `month`, `year`, `basic_salary`, `allowances`, `deductions`, `bonus`, `net_salary`, `status`, `paid_at`, `created_at`, `updated_at`) VALUES
(2, 2, 'February', 2026, 19500.00, 500.00, 150.00, 200.00, 20050.00, 'draft', NULL, '2026-02-06 04:13:29', '2026-02-06 04:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `performance_reviews`
--

CREATE TABLE `performance_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reviewer_id` bigint UNSIGNED NOT NULL,
  `review_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality_of_work` int NOT NULL COMMENT '1-10',
  `productivity` int NOT NULL COMMENT '1-10',
  `communication` int NOT NULL COMMENT '1-10',
  `teamwork` int NOT NULL COMMENT '1-10',
  `leadership` int NOT NULL COMMENT '1-10',
  `overall_rating` decimal(3,2) NOT NULL,
  `strengths` text COLLATE utf8mb4_unicode_ci,
  `areas_for_improvement` text COLLATE utf8mb4_unicode_ci,
  `goals` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performance_reviews`
--

INSERT INTO `performance_reviews` (`id`, `user_id`, `reviewer_id`, `review_period`, `quality_of_work`, `productivity`, `communication`, `teamwork`, `leadership`, `overall_rating`, `strengths`, `areas_for_improvement`, `goals`, `comments`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2026-02-06', 5, 4, 7, 2, 5, 4.60, 'cdxfdffdgbfghfghfghgh', 'fghdfghdfhfghdfghdfgh', 'dfgdfghdfghdfghdfgdfhdfg', 'fdgdfghdfgdfghdfghdfgfdg', '2026-02-06 04:46:27', '2026-02-06 04:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ViewAny:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(2, 'View:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(3, 'Create:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(4, 'Update:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(5, 'Delete:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(6, 'Restore:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(7, 'ForceDelete:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(8, 'ForceDeleteAny:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(9, 'RestoreAny:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(10, 'Replicate:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(11, 'Reorder:Department', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(12, 'ViewAny:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(13, 'View:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(14, 'Create:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(15, 'Update:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(16, 'Delete:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(17, 'Restore:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(18, 'ForceDelete:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(19, 'ForceDeleteAny:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(20, 'RestoreAny:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(21, 'Replicate:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(22, 'Reorder:LeaveType', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(23, 'ViewAny:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(24, 'View:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(25, 'Create:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(26, 'Update:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(27, 'Delete:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(28, 'Restore:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(29, 'ForceDelete:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(30, 'ForceDeleteAny:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(31, 'RestoreAny:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(32, 'Replicate:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(33, 'Reorder:Position', 'web', '2026-02-06 00:02:31', '2026-02-06 00:02:31'),
(34, 'ViewAny:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(35, 'View:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(36, 'Create:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(37, 'Update:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(38, 'Delete:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(39, 'Restore:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(40, 'ForceDelete:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(41, 'ForceDeleteAny:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(42, 'RestoreAny:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(43, 'Replicate:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(44, 'Reorder:User', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(45, 'ViewAny:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(46, 'View:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(47, 'Create:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(48, 'Update:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(49, 'Delete:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(50, 'Restore:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(51, 'ForceDelete:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(52, 'ForceDeleteAny:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(53, 'RestoreAny:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(54, 'Replicate:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(55, 'Reorder:Role', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(56, 'View:StatsOverview', 'web', '2026-02-06 00:02:32', '2026-02-06 00:02:32'),
(57, 'ViewAny:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(58, 'View:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(59, 'Create:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(60, 'Update:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(61, 'Delete:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(62, 'Restore:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(63, 'ForceDelete:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(64, 'ForceDeleteAny:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(65, 'RestoreAny:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(66, 'Replicate:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(67, 'Reorder:Attendance', 'web', '2026-02-06 00:02:54', '2026-02-06 00:02:54'),
(68, 'ViewAny:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(69, 'View:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(70, 'Create:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(71, 'Update:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(72, 'Delete:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(73, 'Restore:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(74, 'ForceDelete:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(75, 'ForceDeleteAny:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(76, 'RestoreAny:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(77, 'Replicate:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(78, 'Reorder:LeaveRequest', 'web', '2026-02-06 00:34:54', '2026-02-06 00:34:54'),
(79, 'ViewAny:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(80, 'View:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(81, 'Create:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(82, 'Update:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(83, 'Delete:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(84, 'Restore:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(85, 'ForceDelete:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(86, 'ForceDeleteAny:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(87, 'RestoreAny:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(88, 'Replicate:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(89, 'Reorder:Payroll', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(90, 'ViewAny:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(91, 'View:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(92, 'Create:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(93, 'Update:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(94, 'Delete:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(95, 'Restore:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(96, 'ForceDelete:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(97, 'ForceDeleteAny:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(98, 'RestoreAny:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(99, 'Replicate:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(100, 'Reorder:PerformanceReview', 'web', '2026-02-06 00:41:25', '2026-02-06 00:41:25'),
(101, 'View:CheckInOut', 'web', '2026-02-15 23:31:14', '2026-02-15 23:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departments_id` bigint UNSIGNED NOT NULL,
  `min_salary` decimal(10,2) NOT NULL,
  `max_salary` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `title`, `departments_id`, `min_salary`, `max_salary`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Sale\'s Manager', 1, 19500.00, 19500.00, 'this is our manager', '2026-02-05 06:40:11', '2026-02-05 06:40:11'),
(2, 'Human Resource Manager', 2, 19500.00, 19500.00, 'This is our Hr_manager position', '2026-02-05 23:42:36', '2026-02-05 23:42:36'),
(3, 'wordpress developer', 3, 13500.00, 13500.00, 'best employess', '2026-02-16 12:23:43', '2026-02-16 12:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2026-02-05 06:14:25', '2026-02-05 06:14:25'),
(2, 'hr_manager', 'web', '2026-02-05 23:35:14', '2026-02-05 23:35:14'),
(3, 'employee', 'web', '2026-02-06 05:57:07', '2026-02-06 05:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(62, 2),
(65, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(57, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(79, 3),
(80, 3),
(90, 3),
(91, 3),
(101, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eEDNSFBXnJYJQIGAuywjMVrKqUMP5lV7ZGqfJUOy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjF2czR0eGF3N1ZYUURmbjNXR0hiazF2YlJxWkc1ZHNzQjJYdjlsNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lbXBsb3llZS9sb2dpbiI7czo1OiJyb3V0ZSI7czoyODoiZmlsYW1lbnQuZW1wbG95ZWUuYXV0aC5sb2dpbiI7fX0=', 1771325167),
('RbINgs9KGOyBFRFOzpzJUVBfrYDbXMCXTjBbCD2f', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ1lYUFVVdnlyTEx0dVlBdGh5ZFNkcWNRd3RJVndmbE80VzdOejhEOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7czo1OiJyb3V0ZSI7czozMDoiZmlsYW1lbnQuYWRtaW4ucGFnZXMuZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMWEwNDQ2YzcwOWI0ZmIxNDUwOGEyODJiMGEwZTMzYmZjZmZkYjNhZjU5MzY1MjUwOWFmZjYyYzQ4MzVhYjhmNyI7fQ==', 1771321690);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `departments_id` bigint UNSIGNED DEFAULT NULL,
  `positions_id` bigint UNSIGNED DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `employment_type` enum('full_time','part_time','contract','intern') COLLATE utf8mb4_unicode_ci DEFAULT 'full_time',
  `status` enum('active','inactive','on_leave','terminated') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `salary` decimal(10,2) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `emergency_contact_name` text COLLATE utf8mb4_unicode_ci,
  `emergency_contact_phone` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `departments_id`, `positions_id`, `employee_id`, `phone`, `date_of_birth`, `hire_date`, `employment_type`, `status`, `salary`, `address`, `emergency_contact_name`, `emergency_contact_phone`) VALUES
(1, 'Super Admin', 'rajputkhushal04@gmail.com', NULL, '$2y$12$eNyoSGvN52ohl3EP5vQ8lOh.kv/U3ANg0xkDuXQ6NL6zunrTY1roG', 'FCe3PGRhFhnTfhHT6enbn2fdgkLrH4odAvZNcv1hMOKR4aGRxmhAEbHNpU7o', '2026-02-05 06:14:25', '2026-02-05 06:14:25', NULL, NULL, 'EMP-000001', NULL, NULL, NULL, 'full_time', 'active', NULL, NULL, NULL, NULL),
(2, 'ram singh', 'ramsingh@gmail.com', NULL, '$2y$12$nyZ6GcWjLykF9uMGadyXVeSGQN.Vjmyibs8QL6bvQouCbOsH3JcCy', 'ShpblVBEV71vZgdYCIXRQGMiV6fG4sOr861UrmxhiobheNi6y9VrbTT8vaiA', '2026-02-05 23:46:11', '2026-02-05 23:46:11', 2, 2, 'EMP-000002', '8141233405', '2026-02-06', '2026-02-06', 'full_time', 'active', 19500.00, '45,shamladham soc, near shanimandir, goadadra ,surat 395010', 'ramu', '8141233405'),
(3, 'khushal singh chundawat', 'khushalsinghchundawat@gmail.com', NULL, '$2y$12$FO2aVddSnrwN/14y8kHJROctkSuBSYuuJXq73b2Q289JrwHVOKG.O', 'mqOpzhOplwzcBKHGy8kO3XIrMdQZ7Gfl0UXLZA3HdVr5rJoxKMCSzvVFM6gp', '2026-02-06 06:06:49', '2026-02-06 06:06:49', 1, 2, 'EMP-000003', '9527456248', '2001-07-12', '2026-02-06', 'full_time', 'active', 7500.00, '02 ram mandir , shetan gali , surat -396010', 'khushal', '9527456248'),
(4, 'nelish', 'nelish@gmail.com', NULL, '$2y$12$Jy99MC0IJouYQi4wd91p5u05Lpp6DrX.Yi9kH0MfdmavvzWONyd9u', NULL, '2026-02-17 05:29:19', '2026-02-17 05:29:19', 3, 3, 'EMP-000004', '7142455415', '2026-02-17', '2026-02-17', 'intern', 'active', 14500.00, '109, sam sangani soc near sham mandir baruch surat - 380510', 'nelish bro', '7142455415');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendances_user_id_date_unique` (`user_id`,`date`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`),
  ADD KEY `departments_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_user_id_foreign` (`user_id`),
  ADD KEY `leave_requests_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leave_requests_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payrolls_user_id_month_year_unique` (`user_id`,`month`,`year`);

--
-- Indexes for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `performance_reviews_user_id_foreign` (`user_id`),
  ADD KEY `performance_reviews_reviewer_id_foreign` (`reviewer_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_departments_id_foreign` (`departments_id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_employee_id_unique` (`employee_id`),
  ADD KEY `users_departments_id_foreign` (`departments_id`),
  ADD KEY `users_positions_id_foreign` (`positions_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leave_requests_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  ADD CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  ADD CONSTRAINT `performance_reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `performance_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_departments_id_foreign` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_departments_id_foreign` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_positions_id_foreign` FOREIGN KEY (`positions_id`) REFERENCES `positions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
