-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 24, 2025 at 11:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spheria1`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment_text`, `created_at`, `updated_at`, `parent_id`) VALUES
(25, 40, 29, 'Nice pic👌', '2025-05-20 09:47:45', '2025-05-20 09:47:45', NULL),
(26, 38, 29, 'Nice', '2025-05-20 09:48:46', '2025-05-20 09:48:46', NULL),
(27, 41, 28, 'Nice pic👌', '2025-05-23 09:28:33', '2025-05-23 09:28:33', NULL),
(28, 33, 28, 'hi', '2025-05-23 09:55:32', '2025-05-23 09:55:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `user1_id`, `user2_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2025-03-23 02:15:37', '2025-03-23 04:44:12'),
(2, 1, 3, '2025-03-24 23:40:41', '2025-03-27 16:10:52'),
(3, 1, 4, '2025-04-10 23:09:56', '2025-04-10 23:09:56'),
(4, 1, 6, '2025-04-10 23:14:44', '2025-05-15 02:25:56'),
(5, 7, 1, '2025-04-26 20:51:49', '2025-04-26 20:51:49'),
(6, 26, 7, '2025-05-16 23:38:43', '2025-05-16 23:38:43'),
(7, 26, 16, '2025-05-16 23:54:17', '2025-05-16 23:54:17'),
(8, 28, 29, '2025-05-17 02:02:14', '2025-05-20 15:53:37'),
(9, 28, 31, '2025-05-20 15:53:05', '2025-05-20 15:53:05'),
(10, 28, 32, '2025-05-20 15:53:39', '2025-05-20 18:11:09'),
(11, 28, 30, '2025-05-20 22:34:27', '2025-05-20 22:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_participants`
--

CREATE TABLE `conversation_participants` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation_participants`
--

INSERT INTO `conversation_participants` (`id`, `conversation_id`, `user_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 2, 3),
(5, 3, 1),
(6, 3, 4),
(7, 4, 1),
(8, 4, 6),
(9, 5, 7),
(10, 5, 1),
(11, 6, 26),
(12, 6, 7),
(13, 7, 26),
(14, 7, 16),
(15, 8, 28),
(16, 8, 29),
(17, 9, 28),
(18, 9, 31),
(19, 10, 28),
(20, 10, 32),
(21, 11, 28),
(22, 11, 30);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  `followed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `following_id`, `followed_at`) VALUES
(155, 2, 1, '2025-03-27 02:15:51'),
(156, 3, 1, '2025-03-27 16:13:34'),
(157, 1, 2, '2025-04-08 20:21:55'),
(158, 1, 4, '2025-04-10 23:14:32'),
(159, 1, 6, '2025-04-10 23:14:41'),
(160, 6, 1, '2025-04-10 23:23:43'),
(161, 6, 4, '2025-04-10 23:24:02'),
(162, 7, 1, '2025-05-15 17:06:38'),
(163, 7, 6, '2025-05-15 17:10:24'),
(172, 1, 7, '2025-05-15 17:25:51'),
(174, 26, 6, '2025-05-16 23:54:27'),
(177, 31, 30, '2025-05-20 15:09:33'),
(178, 31, 28, '2025-05-20 15:09:38'),
(179, 31, 29, '2025-05-20 15:09:43'),
(182, 29, 30, '2025-05-20 15:12:26'),
(183, 29, 28, '2025-05-20 15:12:29'),
(184, 29, 31, '2025-05-20 15:12:34'),
(185, 28, 31, '2025-05-20 17:51:52'),
(186, 28, 29, '2025-05-20 17:52:00'),
(226, 28, 30, '2025-05-20 22:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `user_id`, `created_at`) VALUES
(228, 33, 28, '2025-05-18 16:00:27'),
(229, 40, 29, '2025-05-20 15:17:16'),
(230, 41, 29, '2025-05-20 15:17:54'),
(231, 39, 29, '2025-05-20 15:17:57'),
(232, 38, 29, '2025-05-20 15:18:00'),
(233, 37, 29, '2025-05-20 15:18:10'),
(235, 35, 29, '2025-05-20 15:18:19'),
(238, 40, 28, '2025-05-20 17:55:45'),
(240, 39, 28, '2025-05-20 17:55:51'),
(242, 35, 28, '2025-05-20 18:08:31'),
(249, 37, 28, '2025-05-20 18:15:03'),
(255, 38, 28, '2025-05-20 18:19:34'),
(260, 41, 28, '2025-05-23 14:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `media_url` varchar(255) DEFAULT NULL,
  `is_shared_post` tinyint(1) DEFAULT 0,
  `shared_post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `conversation_id`, `sender_id`, `content`, `is_read`, `created_at`, `media_url`, `is_shared_post`, `shared_post_id`) VALUES
(1, 1, 2, 'hello', 1, '2025-03-23 03:27:50', NULL, 0, NULL),
(2, 1, 2, 'how are you?', 1, '2025-03-23 03:28:12', NULL, 0, NULL),
(3, 1, 1, 'hii', 1, '2025-03-23 03:28:36', NULL, 0, NULL),
(4, 1, 1, 'i am fine, how are you', 1, '2025-03-23 03:28:49', NULL, 0, NULL),
(5, 1, 1, 'hi', 1, '2025-03-23 04:44:12', NULL, 0, NULL),
(6, 2, 1, 'Hello', 0, '2025-03-24 23:40:52', NULL, 0, NULL),
(7, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:09', NULL, 0, NULL),
(8, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:09', NULL, 0, NULL),
(9, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:16', NULL, 0, NULL),
(10, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:17', NULL, 0, NULL),
(11, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:17', NULL, 0, NULL),
(12, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:17', NULL, 0, NULL),
(13, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:17', NULL, 0, NULL),
(14, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:55:18', NULL, 0, NULL),
(15, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:56:58', NULL, 0, NULL),
(16, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:56:59', NULL, 0, NULL),
(17, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:56:59', NULL, 0, NULL),
(18, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:57:00', NULL, 0, NULL),
(19, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:57:02', NULL, 0, NULL),
(20, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:57:09', NULL, 0, NULL),
(21, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:57:09', NULL, 0, NULL),
(22, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:57:09', NULL, 0, NULL),
(23, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"28\",\"file_path\":\"uploads\\/posts\\/1\\/67e441d728868.mp4\",\"caption\":\"miza\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 00:59:54', NULL, 0, NULL),
(24, 1, 2, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 01:00:56', NULL, 0, NULL),
(25, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"30\",\"file_path\":\"uploads\\/posts\\/2\\/67e47aa206c72.mp4\",\"caption\":\"Nath vibes \\u2728, Nose ring and my roots \\ud83c\\uddee\\ud83c\\uddf3, Nath: a timeless treasure \\ud83d\\udc8e, Nath love \\u2764\\ufe0f, and Feeling my heritage \\ud83c\\udf38.\",\"original_user\":\"pvt.mdraza\"}', 1, '2025-03-27 15:15:46', NULL, 0, NULL),
(26, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"27\",\"file_path\":\"uploads\\/posts\\/1\\/67e4404bbddd1.mp4\",\"caption\":\"at kolkata\",\"original_user\":\"taksin01\"}', 1, '2025-03-27 15:31:06', NULL, 0, NULL),
(27, 2, 1, 'Kundhe chi re', 0, '2025-03-27 16:10:52', NULL, 0, NULL),
(28, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"30\",\"file_path\":\"uploads\\/posts\\/2\\/67e47aa206c72.mp4\",\"caption\":\"Nath vibes \\u2728, Nose ring and my roots \\ud83c\\uddee\\ud83c\\uddf3, Nath: a timeless treasure \\ud83d\\udc8e, Nath love \\u2764\\ufe0f, and Feeling my heritage \\ud83c\\udf38.\",\"original_user\":\"pvt.mdraza\"}', 1, '2025-03-29 17:08:01', NULL, 0, NULL),
(29, 2, 1, '', 0, '2025-04-09 19:38:25', NULL, 0, NULL),
(30, 2, 1, '', 0, '2025-04-09 19:38:59', NULL, 0, NULL),
(31, 2, 1, '', 0, '2025-04-09 19:42:43', NULL, 0, NULL),
(32, 2, 1, '', 0, '2025-04-09 19:49:22', NULL, 0, NULL),
(33, 1, 1, '', 1, '2025-04-09 19:50:31', NULL, 0, NULL),
(34, 1, 1, '', 1, '2025-04-09 19:52:26', NULL, 0, NULL),
(35, 1, 1, '', 1, '2025-04-09 20:02:43', NULL, 0, NULL),
(36, 1, 1, '{\"type\":\"shared_post\",\"post_id\":\"27\",\"file_path\":\"uploads\\/posts\\/1\\/67e4404bbddd1.mp4\",\"caption\":\"at kolkata\",\"original_user\":\"taksin01\"}', 0, '2025-04-10 00:31:03', NULL, 0, NULL),
(37, 3, 1, 'hello', 0, '2025-04-10 23:10:07', NULL, 0, NULL),
(38, 4, 1, 'hello', 1, '2025-04-10 23:15:13', NULL, 0, NULL),
(39, 4, 1, 'hello', 1, '2025-04-10 23:15:13', NULL, 0, NULL),
(40, 4, 6, 'Hii', 1, '2025-04-10 23:26:48', NULL, 0, NULL),
(41, 4, 6, 'Hii', 1, '2025-04-10 23:26:48', NULL, 0, NULL),
(42, 4, 6, '', 1, '2025-04-10 23:27:07', NULL, 0, NULL),
(43, 4, 6, '', 1, '2025-04-10 23:27:25', NULL, 0, NULL),
(44, 4, 1, 'What r u doing rn?', 1, '2025-04-27 01:53:51', NULL, 0, NULL),
(45, 4, 1, '{\"type\":\"shared_post\",\"post_id\":\"29\",\"file_path\":\"uploads\\/posts\\/1\\/67e442eb7bf20.mp4\",\"caption\":\"my birthday\\ud83c\\udf81\",\"original_user\":\"taksinnn_\"}', 1, '2025-04-28 01:19:59', NULL, 0, NULL),
(46, 4, 1, '{\"type\":\"shared_post\",\"post_id\":\"32\",\"file_path\":\"uploads\\/posts\\/6\\/67f804ef489ff.jpg\",\"caption\":\"Night out \",\"original_user\":\"pvt.mdraza\"}', 1, '2025-05-15 01:33:41', NULL, 0, NULL),
(47, 3, 1, '{\"type\":\"shared_post\",\"post_id\":\"32\",\"file_path\":\"uploads\\/posts\\/6\\/67f804ef489ff.jpg\",\"caption\":\"Night out \",\"original_user\":\"pvt.mdraza\"}', 0, '2025-05-15 01:34:15', NULL, 0, NULL),
(48, 4, 1, '{\"type\":\"shared_post\",\"post_id\":27}', 1, '2025-05-15 01:44:07', NULL, 0, NULL),
(49, 3, 1, 'hii', 0, '2025-05-15 01:53:44', NULL, 0, NULL),
(50, 4, 1, '{\"type\":\"shared_post\",\"post_id\":6}', 1, '2025-05-15 01:56:41', NULL, 0, NULL),
(51, 4, 1, 'hii', 1, '2025-05-15 01:58:52', NULL, 0, NULL),
(52, 4, 6, 'sdf', 1, '2025-05-15 02:16:03', NULL, 0, NULL),
(53, 4, 6, '{\"type\":\"story_reply\",\"story_id\":26,\"content\":\"sdgffweyif\"}', 1, '2025-05-15 02:22:02', NULL, 0, NULL),
(54, 4, 6, '{\"type\":\"story_reply\",\"story_id\":26,\"content\":\"rdgdfgdg\"}', 1, '2025-05-15 02:23:00', NULL, 0, NULL),
(55, 4, 6, '{\"type\":\"story_reply\",\"story_id\":26,\"content\":\"sdfsdf\"}', 1, '2025-05-15 02:23:32', NULL, 0, NULL),
(56, 4, 6, '{\"type\":\"story_reply\",\"story_id\":26,\"content\":\"sfdfgrg\"}', 1, '2025-05-15 02:24:15', NULL, 0, NULL),
(57, 4, 6, '{\"type\":\"story_reply\",\"story_id\":26,\"content\":\"dfsedf\"}', 1, '2025-05-15 02:25:28', NULL, 0, NULL),
(58, 4, 1, '{\"type\":\"shared_post\",\"post_id\":32}', 1, '2025-05-15 02:25:56', NULL, 0, NULL),
(59, 6, 26, '{\"type\":\"shared_post\",\"post_id\":27}', 0, '2025-05-16 23:38:43', NULL, 0, NULL),
(60, 8, 28, '{\"type\":\"shared_post\",\"post_id\":33}', 1, '2025-05-18 01:20:59', NULL, 0, NULL),
(61, 8, 29, '{\"type\":\"shared_post\",\"post_id\":38}', 1, '2025-05-20 15:19:01', NULL, 0, NULL),
(62, 9, 28, 'hii', 0, '2025-05-20 15:53:05', NULL, 0, NULL),
(63, 8, 28, '{\"type\":\"shared_post\",\"post_id\":41}', 0, '2025-05-20 15:53:37', NULL, 0, NULL),
(64, 10, 28, '{\"type\":\"shared_post\",\"post_id\":41}', 1, '2025-05-20 15:53:39', NULL, 0, NULL),
(65, 10, 28, '{\"type\":\"shared_post\",\"post_id\":38}', 1, '2025-05-20 18:11:09', NULL, 0, NULL),
(66, 9, 28, 'hi', 0, '2025-05-23 15:22:33', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_reactions`
--

CREATE TABLE `message_reactions` (
  `reaction_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction_type` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `type` enum('like','comment','follow','message') NOT NULL,
  `content` text DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `user_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `otp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `user_id`, `token`, `expires_at`, `created_at`) VALUES
(6, 28, 'd73b240241643997aebfbd2f90c0119e4ac705eda6bd74277a3cf8d767b83ee1', '2025-05-23 12:17:18', '2025-05-23 09:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `media_type` enum('image','video','sphere') DEFAULT 'image',
  `likes_count` int(11) DEFAULT 0,
  `comments_count` int(11) DEFAULT 0,
  `visibility` enum('public','private') DEFAULT 'public',
  `share_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `content`, `media_url`, `created_at`, `updated_at`, `media_type`, `likes_count`, `comments_count`, `visibility`, `share_count`) VALUES
(33, 28, 'Eid Mubarak✨', NULL, '2025-05-16 19:21:53', '2025-05-16 19:21:53', 'image', 0, 0, 'public', 0),
(35, 30, 'I’m so in love with you 🥰❣️🎶', NULL, '2025-05-20 09:26:40', '2025-05-20 09:26:40', 'image', 0, 0, 'public', 0),
(37, 30, 'Karke gustakhiyan👀♥️\r\n\r\n#reelsinstagram #exploremore #explorepage #reels #instagood #instagram #explore #viral #fyp', NULL, '2025-05-20 09:28:57', '2025-05-20 09:28:57', 'image', 0, 0, 'public', 0),
(38, 30, 'Anxiety🖤\r\n\r\n#reelsinstagram #exploremore #explorepage #explorepage #reels #fyp\r\n', NULL, '2025-05-20 09:30:07', '2025-05-20 09:30:07', 'image', 0, 0, 'public', 0),
(39, 31, 'Feeling like a whole vibe today 🔥👑\r\n.\r\n.\r\n.\r\n#iconicviews #tajmahalvibes #romanvibes #travelgoals #romanfeels #moderngladiator', NULL, '2025-05-20 09:38:58', '2025-05-20 09:38:58', 'image', 0, 0, 'public', 0),
(40, 28, 'Just out here stealing sunsets and maybe a few hearts🙃', NULL, '2025-05-20 09:41:45', '2025-05-20 09:41:45', 'image', 0, 0, 'public', 0),
(41, 29, 'at Indian Mesume', NULL, '2025-05-20 09:46:54', '2025-05-20 09:46:54', 'image', 0, 0, 'public', 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

CREATE TABLE `post_media` (
  `media_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `media_type` enum('image','video','sphere') DEFAULT 'image',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_size` bigint(20) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_media`
--

INSERT INTO `post_media` (`media_id`, `post_id`, `file_path`, `media_type`, `created_at`, `file_size`, `mime_type`) VALUES
(29, 33, 'uploads/posts/28/68279051d9808.jpg', 'image', '2025-05-16 19:21:53', 2222804, 'image/jpeg'),
(30, 33, 'uploads/posts/28/68279051da08d.jpg', 'image', '2025-05-16 19:21:53', 1962948, 'image/jpeg'),
(31, 33, 'uploads/posts/28/68279051da393.jpg', 'image', '2025-05-16 19:21:53', 2291971, 'image/jpeg'),
(32, 33, 'uploads/posts/28/68279051da707.jpg', 'image', '2025-05-16 19:21:53', 2764567, 'image/jpeg'),
(34, 35, 'uploads/posts/30/682c4ad0aa050.mp4', 'video', '2025-05-20 09:26:40', 1901714, 'video/mp4'),
(36, 37, 'uploads/posts/30/682c4b599ed3d.mp4', 'video', '2025-05-20 09:28:57', 7498109, 'video/mp4'),
(37, 38, 'uploads/posts/30/682c4b9f840ec.mp4', 'video', '2025-05-20 09:30:07', 3250616, 'video/mp4'),
(38, 39, 'uploads/posts/31/682c4db28e7d5.png', 'image', '2025-05-20 09:38:58', 2226732, 'image/png'),
(39, 40, 'uploads/posts/28/682c4e59e694d.jpg', 'image', '2025-05-20 09:41:45', 1094544, 'image/jpeg'),
(40, 40, 'uploads/posts/28/682c4e59e7024.jpg', 'image', '2025-05-20 09:41:45', 734351, 'image/jpeg'),
(41, 41, 'uploads/posts/29/682c4f8f004d6.jpg', 'image', '2025-05-20 09:46:55', 635824, 'image/jpeg'),
(42, 41, 'uploads/posts/29/682c4f8f01346.jpg', 'image', '2025-05-20 09:46:55', 613889, 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tag_id`, `post_id`, `tag_name`) VALUES
(12, 33, '#EidMubarak'),
(14, 35, '#love'),
(15, 37, '#reelsinstagram'),
(16, 38, '#explorepage #reels');

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `save_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`save_id`, `user_id`, `post_id`, `created_at`) VALUES
(91, 28, 38, '2025-05-23 09:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `searched_user_id` int(11) NOT NULL,
  `search_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `story_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `visibility` enum('public','followers') DEFAULT 'followers'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`story_id`, `user_id`, `content`, `created_at`, `expires_at`, `visibility`) VALUES
(28, 28, '', '2025-05-18 01:05:54', '2025-05-18 21:35:54', 'followers'),
(31, 28, '', '2025-05-18 15:59:05', '2025-05-19 12:29:05', 'followers'),
(32, 30, '', '2025-05-20 15:00:27', '2025-05-21 11:30:27', 'followers'),
(33, 31, '', '2025-05-20 15:09:23', '2025-05-21 11:39:23', 'followers'),
(34, 28, '', '2025-05-20 15:29:20', '2025-05-21 11:59:20', 'followers'),
(35, 28, '', '2025-05-23 14:50:38', '2025-05-24 11:20:38', 'followers');

-- --------------------------------------------------------

--
-- Table structure for table `story_media`
--

CREATE TABLE `story_media` (
  `media_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `media_type` enum('image','video') NOT NULL,
  `file_size` int(11) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `story_media`
--

INSERT INTO `story_media` (`media_id`, `story_id`, `file_path`, `media_type`, `file_size`, `mime_type`, `created_at`) VALUES
(26, 28, 'uploads/stories/28/6828e51a77a05.mp4', 'video', 203163, 'video/mp4', '2025-05-18 01:05:54'),
(29, 31, 'uploads/stories/28/6829b6718ce4e.mp4', 'video', 754307, 'video/mp4', '2025-05-18 15:59:05'),
(30, 32, 'uploads/stories/30/682c4bb3f0bf8.mp4', 'video', 3250616, 'video/mp4', '2025-05-20 15:00:27'),
(31, 33, 'uploads/stories/31/682c4dcbd37d9.png', 'image', 950800, 'image/png', '2025-05-20 15:09:23'),
(32, 34, 'uploads/stories/28/682c5278699b9.mp4', 'video', 866048, 'video/mp4', '2025-05-20 15:29:20'),
(33, 35, 'uploads/stories/28/68303de6a7a35.mp4', 'video', 866048, 'video/mp4', '2025-05-23 14:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `story_views`
--

CREATE TABLE `story_views` (
  `view_id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `viewer_id` int(11) NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `is_private` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `full_name`, `bio`, `profile_image`, `cover_image`, `created_at`, `updated_at`, `is_verified`, `is_private`) VALUES
(28, 'taksin01', 'taskinraja01@gmail.com', '$2y$10$yss.bKWfmzp547gx1aiv6uSCvUsQ1xe9OCKPbQj7qO29QZuo5zPtG', 'Taksin Raja', 'Making something big, wait for that🔱', 'uploads/profile_images/682f7da6aa4ed.jpg', 'uploads/cover_images/682cd5a35ab7e.jpg', '2025-05-16 19:19:01', '2025-05-23 09:17:45', 1, 0),
(29, 'pvt.mdraza', 'mdraza8297@gmail.com', '$2y$10$EyzTTdfGOSbBhFHl9ETLs.68UarW6dKyLt3JW.Cy6vzYQMP9ddUOC', 'Md Raza', NULL, 'uploads/profile_images/682c4f13a4cfd.jpg', 'uploads/cover_images/682c4f5aab298.jpg', '2025-05-16 19:22:56', '2025-05-20 09:46:02', 1, 0),
(30, '_.ri.ti.ka._', 'baris977546@gmail.com', '$2y$10$YAmWKWWhrGmIBRY2SqwysOrSwaq7QNuzyYlgMio6KJl07SUKO6ake', 'Ritika💫', NULL, 'uploads/profile_images/682c4a4494c3e.png', 'uploads/cover_images/682c4ab178f34.png', '2025-05-20 09:23:04', '2025-05-20 09:26:09', 1, 0),
(31, 'subham_', 'subhambhojgaria107@gmail.com', '$2y$10$ZmRvjl.Evf5vadlzxCdeEuWcWggN8WJdP0V.Y3eoBuvdpnuxjLIJG', 'Subham', NULL, 'uploads/profile_images/682c4d6a787c9.png', 'uploads/cover_images/682c4d88b8f21.jpeg', '2025-05-20 09:32:55', '2025-05-20 09:38:16', 1, 0),
(35, 'taksinraja', 'taksinraja@gmail.com', '$2y$10$.qA631PiXL4mz.vhmLOzxeJc0gKEs1UpXKbZwMMNWTtfuqE.hKEjC', 'Taksin', NULL, NULL, NULL, '2025-05-20 19:44:58', '2025-05-20 19:54:53', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `user1_id` (`user1_id`),
  ADD KEY `user2_id` (`user2_id`);

--
-- Indexes for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_follow` (`follower_id`,`following_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `unique_like` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD PRIMARY KEY (`reaction_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`otp_id`),
  ADD KEY `user_otp` (`user_id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_media`
--
ALTER TABLE `post_media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`save_id`),
  ADD UNIQUE KEY `unique_save` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `searched_user_id` (`searched_user_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`story_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `story_media`
--
ALTER TABLE `story_media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `story_id` (`story_id`);

--
-- Indexes for table `story_views`
--
ALTER TABLE `story_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `story_id` (`story_id`),
  ADD KEY `viewer_id` (`viewer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `message_reactions`
--
ALTER TABLE `message_reactions`
  MODIFY `reaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `save_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `story_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `story_media`
--
ALTER TABLE `story_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `story_views`
--
ALTER TABLE `story_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`comment_id`) ON DELETE SET NULL;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD CONSTRAINT `message_reactions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `user_otp` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD CONSTRAINT `password_reset_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_media`
--
ALTER TABLE `post_media`
  ADD CONSTRAINT `post_media_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD CONSTRAINT `saved_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `search_history_ibfk_2` FOREIGN KEY (`searched_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `story_media`
--
ALTER TABLE `story_media`
  ADD CONSTRAINT `story_media_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`story_id`) ON DELETE CASCADE;

--
-- Constraints for table `story_views`
--
ALTER TABLE `story_views`
  ADD CONSTRAINT `story_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`story_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_views_ibfk_2` FOREIGN KEY (`viewer_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
