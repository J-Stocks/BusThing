-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2018 at 10:35 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_thing`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `registration` char(8) NOT NULL,
  `make` varchar(20) NOT NULL,
  `model` varchar(30) NOT NULL,
  `capacity` tinyint(3) UNSIGNED NOT NULL,
  `icon_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`registration`, `make`, `model`, `capacity`, `icon_id`) VALUES
('BJ57 TWM', 'Trident 2', 'Dennis', 70, 2),
('MK02 VVG', 'Albion', 'Aberdonian ', 35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Smith'),
(2, 'Maryanne', 'Reed'),
(3, 'Alfreda', 'Kevins'),
(4, 'Hudson', 'Nicolson'),
(5, 'Tamika', 'Waldroup'),
(6, 'Perce', 'Russel'),
(7, 'Gamal', 'Warner'),
(8, 'Lena', 'Gilliam'),
(9, 'Finley', 'Hughes'),
(10, 'Shakil', 'Newport'),
(11, 'Dwight', 'Knaggs');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `icon_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(150) NOT NULL,
  `alt_text` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`icon_id`, `url`, `alt_text`) VALUES
(1, '../images/single_decker.svg', 'Single Decker'),
(2, '../images/double_decker.svg', 'Double Decker');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `route_name` varchar(50) NOT NULL,
  `total_distance` float UNSIGNED NOT NULL,
  `expected_duration` smallint(5) UNSIGNED NOT NULL,
  `fare` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_name`, `total_distance`, `expected_duration`, `fare`) VALUES
(1, '184 - Manchester to Huddersfield', 27, 119, 0.1),
(2, '229 - Leeds to Huddersfield', 22, 62, 0.11),
(3, '181 - Huddersfield to Wilberlee', 7, 29, 0.09),
(4, '36 - Manchester to Bolton', 16, 61, 0.12),
(5, '308 - Huddersfield to Holmfirth', 6, 46, 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `route_stop`
--

CREATE TABLE `route_stop` (
  `route_stop_id` int(10) UNSIGNED NOT NULL,
  `route_id` int(10) UNSIGNED NOT NULL,
  `stop_id` int(10) UNSIGNED NOT NULL,
  `stop_number` smallint(5) UNSIGNED NOT NULL,
  `time_offset` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_stop`
--

INSERT INTO `route_stop` (`route_stop_id`, `route_id`, `stop_id`, `stop_number`, `time_offset`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 2, 2, 13),
(3, 1, 3, 3, 9),
(4, 1, 4, 4, 6),
(5, 1, 5, 5, 11),
(6, 1, 6, 6, 11),
(7, 1, 7, 7, 8),
(8, 1, 8, 8, 3),
(9, 1, 9, 9, 9),
(10, 1, 10, 10, 6),
(11, 1, 11, 11, 12),
(12, 1, 12, 12, 8),
(13, 1, 13, 13, 8),
(14, 1, 14, 14, 15),
(15, 2, 15, 1, 0),
(16, 2, 16, 2, 15),
(17, 2, 17, 3, 17),
(18, 2, 18, 4, 9),
(19, 2, 19, 5, 11),
(20, 2, 20, 6, 10),
(21, 2, 21, 7, 9),
(22, 2, 14, 8, 14),
(23, 3, 14, 1, 0),
(24, 3, 13, 2, 10),
(25, 3, 22, 3, 5),
(26, 3, 23, 4, 7),
(27, 3, 24, 5, 8),
(28, 4, 1, 1, 0),
(29, 4, 25, 2, 11),
(30, 4, 26, 3, 11),
(31, 4, 27, 4, 8),
(32, 4, 28, 5, 13),
(33, 4, 29, 6, 7),
(34, 4, 30, 7, 11),
(35, 5, 14, 1, 0),
(36, 5, 31, 2, 10),
(37, 5, 32, 3, 5),
(38, 5, 33, 4, 8),
(39, 5, 34, 5, 5),
(40, 5, 35, 6, 3),
(41, 5, 36, 7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE `runs` (
  `run_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `route_id` int(10) UNSIGNED NOT NULL,
  `bus_reg` char(8) NOT NULL,
  `start_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runs`
--

INSERT INTO `runs` (`run_id`, `driver_id`, `route_id`, `bus_reg`, `start_time`) VALUES
(1, 1, 1, 'BJ57 TWM', '2018-12-24 09:28:00'),
(2, 2, 1, 'BJ57 TWM', '2018-12-24 09:58:00'),
(3, 3, 1, 'BJ57 TWM', '2018-12-24 10:28:00'),
(4, 4, 1, 'BJ57 TWM', '2018-12-24 10:58:00'),
(5, 5, 1, 'MK02 VVG', '2018-12-24 11:28:00'),
(6, 6, 1, 'MK02 VVG', '2018-12-24 11:58:00'),
(7, 7, 1, 'MK02 VVG', '2018-12-24 12:28:00'),
(8, 8, 1, 'MK02 VVG', '2018-12-24 12:58:00'),
(9, 9, 1, 'BJ57 TWM', '2018-12-24 13:28:00'),
(10, 10, 1, 'BJ57 TWM', '2018-12-24 13:58:00'),
(11, 11, 1, 'BJ57 TWM', '2018-12-24 14:28:00'),
(12, 1, 1, 'BJ57 TWM', '2018-12-24 14:58:00'),
(13, 2, 1, 'MK02 VVG', '2018-12-24 15:28:00'),
(14, 3, 1, 'MK02 VVG', '2018-12-24 15:58:00'),
(15, 4, 1, 'MK02 VVG', '2018-12-24 16:28:00'),
(16, 5, 1, 'BJ57 TWM', '2018-12-24 16:58:00'),
(17, 6, 1, 'BJ57 TWM', '2018-12-24 17:28:00'),
(18, 1, 1, 'BJ57 TWM', '2018-12-25 09:28:00'),
(19, 2, 1, 'BJ57 TWM', '2018-12-25 09:58:00'),
(20, 3, 1, 'BJ57 TWM', '2018-12-25 10:28:00'),
(21, 4, 1, 'BJ57 TWM', '2018-12-25 10:58:00'),
(22, 5, 1, 'MK02 VVG', '2018-12-25 11:28:00'),
(23, 6, 1, 'MK02 VVG', '2018-12-25 11:58:00'),
(24, 7, 1, 'MK02 VVG', '2018-12-25 12:28:00'),
(25, 8, 1, 'MK02 VVG', '2018-12-25 12:58:00'),
(26, 9, 1, 'BJ57 TWM', '2018-12-25 13:28:00'),
(27, 10, 1, 'BJ57 TWM', '2018-12-25 13:58:00'),
(28, 11, 1, 'BJ57 TWM', '2018-12-25 14:28:00'),
(29, 1, 1, 'BJ57 TWM', '2018-12-25 14:58:00'),
(30, 2, 1, 'MK02 VVG', '2018-12-25 15:28:00'),
(31, 3, 1, 'MK02 VVG', '2018-12-25 15:58:00'),
(32, 4, 1, 'MK02 VVG', '2018-12-25 16:28:00'),
(33, 5, 1, 'BJ57 TWM', '2018-12-25 16:58:00'),
(34, 6, 1, 'BJ57 TWM', '2018-12-25 17:28:00'),
(35, 1, 1, 'BJ57 TWM', '2018-12-26 09:28:00'),
(36, 2, 1, 'BJ57 TWM', '2018-12-26 09:58:00'),
(37, 3, 1, 'BJ57 TWM', '2018-12-26 10:28:00'),
(38, 4, 1, 'BJ57 TWM', '2018-12-26 10:58:00'),
(39, 5, 1, 'MK02 VVG', '2018-12-26 11:28:00'),
(40, 6, 1, 'MK02 VVG', '2018-12-26 11:58:00'),
(41, 7, 1, 'MK02 VVG', '2018-12-26 12:28:00'),
(42, 8, 1, 'MK02 VVG', '2018-12-26 12:58:00'),
(43, 9, 1, 'BJ57 TWM', '2018-12-26 13:28:00'),
(44, 10, 1, 'BJ57 TWM', '2018-12-26 13:58:00'),
(45, 11, 1, 'BJ57 TWM', '2018-12-26 14:28:00'),
(46, 1, 1, 'BJ57 TWM', '2018-12-26 14:58:00'),
(47, 2, 1, 'MK02 VVG', '2018-12-26 15:28:00'),
(48, 3, 1, 'MK02 VVG', '2018-12-26 15:58:00'),
(49, 4, 1, 'MK02 VVG', '2018-12-26 16:28:00'),
(50, 5, 1, 'BJ57 TWM', '2018-12-26 16:58:00'),
(51, 6, 1, 'BJ57 TWM', '2018-12-26 17:28:00'),
(52, 1, 2, 'BJ57 TWM', '2018-12-24 09:06:00'),
(53, 2, 2, 'BJ57 TWM', '2018-12-24 09:39:00'),
(54, 3, 2, 'BJ57 TWM', '2018-12-24 10:06:00'),
(55, 4, 2, 'BJ57 TWM', '2018-12-24 10:39:00'),
(56, 5, 2, 'MK02 VVG', '2018-12-24 11:06:00'),
(57, 6, 2, 'MK02 VVG', '2018-12-24 11:39:00'),
(58, 7, 2, 'MK02 VVG', '2018-12-24 12:06:00'),
(59, 8, 2, 'MK02 VVG', '2018-12-24 12:58:00'),
(60, 9, 2, 'BJ57 TWM', '2018-12-24 13:28:00'),
(61, 10, 2, 'BJ57 TWM', '2018-12-24 13:39:00'),
(62, 11, 2, 'BJ57 TWM', '2018-12-24 14:06:00'),
(63, 1, 2, 'BJ57 TWM', '2018-12-24 14:39:00'),
(64, 2, 2, 'MK02 VVG', '2018-12-24 15:06:00'),
(65, 3, 2, 'MK02 VVG', '2018-12-24 15:39:00'),
(66, 4, 2, 'MK02 VVG', '2018-12-24 16:39:00'),
(67, 5, 2, 'BJ57 TWM', '2018-12-24 16:06:00'),
(68, 6, 2, 'BJ57 TWM', '2018-12-24 17:39:00'),
(69, 1, 2, 'BJ57 TWM', '2018-12-25 09:06:00'),
(70, 2, 2, 'BJ57 TWM', '2018-12-25 09:39:00'),
(71, 3, 2, 'BJ57 TWM', '2018-12-25 10:06:00'),
(72, 4, 2, 'BJ57 TWM', '2018-12-25 10:39:00'),
(73, 5, 2, 'MK02 VVG', '2018-12-25 11:06:00'),
(74, 6, 2, 'MK02 VVG', '2018-12-25 11:39:00'),
(75, 7, 2, 'MK02 VVG', '2018-12-25 12:06:00'),
(76, 8, 2, 'MK02 VVG', '2018-12-25 12:39:00'),
(77, 9, 2, 'BJ57 TWM', '2018-12-25 13:06:00'),
(78, 10, 2, 'BJ57 TWM', '2018-12-25 13:39:00'),
(79, 11, 2, 'BJ57 TWM', '2018-12-25 14:06:00'),
(80, 1, 2, 'BJ57 TWM', '2018-12-25 14:39:00'),
(81, 2, 2, 'MK02 VVG', '2018-12-25 15:06:00'),
(82, 3, 2, 'MK02 VVG', '2018-12-25 15:39:00'),
(83, 4, 2, 'MK02 VVG', '2018-12-25 16:06:00'),
(84, 5, 2, 'BJ57 TWM', '2018-12-25 16:39:00'),
(85, 6, 2, 'BJ57 TWM', '2018-12-25 17:39:00'),
(86, 1, 2, 'BJ57 TWM', '2018-12-26 09:06:00'),
(87, 2, 2, 'BJ57 TWM', '2018-12-26 09:39:00'),
(88, 3, 2, 'BJ57 TWM', '2018-12-26 10:06:00'),
(89, 4, 2, 'BJ57 TWM', '2018-12-26 10:39:00'),
(90, 5, 2, 'MK02 VVG', '2018-12-26 11:06:00'),
(91, 6, 2, 'MK02 VVG', '2018-12-26 11:39:00'),
(92, 7, 2, 'MK02 VVG', '2018-12-26 12:06:00'),
(93, 8, 2, 'MK02 VVG', '2018-12-26 12:39:00'),
(94, 9, 2, 'BJ57 TWM', '2018-12-26 13:06:00'),
(95, 10, 2, 'BJ57 TWM', '2018-12-26 13:39:00'),
(96, 11, 2, 'BJ57 TWM', '2018-12-26 14:06:00'),
(97, 1, 2, 'BJ57 TWM', '2018-12-26 14:39:00'),
(98, 2, 2, 'MK02 VVG', '2018-12-26 15:06:00'),
(99, 3, 2, 'MK02 VVG', '2018-12-26 15:39:00'),
(100, 4, 2, 'MK02 VVG', '2018-12-26 16:06:00'),
(101, 5, 2, 'BJ57 TWM', '2018-12-26 16:39:00'),
(102, 6, 2, 'BJ57 TWM', '2018-12-26 17:06:00'),
(103, 1, 3, 'BJ57 TWM', '2018-12-24 09:12:00'),
(104, 3, 3, 'BJ57 TWM', '2018-12-24 10:12:00'),
(105, 5, 3, 'MK02 VVG', '2018-12-24 11:12:00'),
(106, 7, 3, 'MK02 VVG', '2018-12-24 12:12:00'),
(107, 9, 3, 'BJ57 TWM', '2018-12-24 13:12:00'),
(108, 11, 3, 'BJ57 TWM', '2018-12-24 14:12:00'),
(109, 2, 3, 'MK02 VVG', '2018-12-24 15:12:00'),
(110, 5, 3, 'BJ57 TWM', '2018-12-24 16:12:00'),
(111, 1, 3, 'BJ57 TWM', '2018-12-25 09:12:00'),
(112, 3, 3, 'BJ57 TWM', '2018-12-25 10:12:00'),
(113, 5, 3, 'MK02 VVG', '2018-12-25 11:12:00'),
(114, 7, 3, 'MK02 VVG', '2018-12-25 12:12:00'),
(115, 9, 3, 'BJ57 TWM', '2018-12-25 13:12:00'),
(116, 11, 3, 'BJ57 TWM', '2018-12-25 14:12:00'),
(117, 2, 3, 'MK02 VVG', '2018-12-25 15:12:00'),
(118, 4, 3, 'MK02 VVG', '2018-12-25 16:12:00'),
(119, 1, 3, 'BJ57 TWM', '2018-12-26 09:12:00'),
(120, 3, 3, 'BJ57 TWM', '2018-12-26 10:12:00'),
(121, 5, 3, 'MK02 VVG', '2018-12-26 11:12:00'),
(122, 7, 3, 'MK02 VVG', '2018-12-26 12:12:00'),
(123, 9, 3, 'BJ57 TWM', '2018-12-26 13:12:00'),
(124, 11, 3, 'BJ57 TWM', '2018-12-26 14:12:00'),
(125, 2, 3, 'MK02 VVG', '2018-12-26 15:12:00'),
(126, 4, 3, 'MK02 VVG', '2018-12-26 16:12:00'),
(127, 6, 3, 'BJ57 TWM', '2018-12-26 17:12:00'),
(128, 1, 4, 'BJ57 TWM', '2018-12-24 09:00:00'),
(129, 2, 4, 'BJ57 TWM', '2018-12-24 09:30:00'),
(130, 3, 4, 'BJ57 TWM', '2018-12-24 10:00:00'),
(131, 4, 4, 'BJ57 TWM', '2018-12-24 10:30:00'),
(132, 5, 4, 'MK02 VVG', '2018-12-24 11:00:00'),
(133, 6, 4, 'MK02 VVG', '2018-12-24 11:30:00'),
(134, 7, 4, 'MK02 VVG', '2018-12-24 12:00:00'),
(135, 8, 4, 'MK02 VVG', '2018-12-24 12:50:00'),
(136, 9, 4, 'BJ57 TWM', '2018-12-24 13:20:00'),
(137, 10, 4, 'BJ57 TWM', '2018-12-24 13:30:00'),
(138, 11, 4, 'BJ57 TWM', '2018-12-24 14:00:00'),
(139, 1, 4, 'BJ57 TWM', '2018-12-24 14:30:00'),
(140, 2, 4, 'MK02 VVG', '2018-12-24 15:00:00'),
(141, 3, 4, 'MK02 VVG', '2018-12-24 15:30:00'),
(142, 4, 4, 'MK02 VVG', '2018-12-24 16:30:00'),
(143, 5, 4, 'BJ57 TWM', '2018-12-24 16:00:00'),
(144, 6, 4, 'BJ57 TWM', '2018-12-24 17:30:00'),
(145, 1, 4, 'BJ57 TWM', '2018-12-25 09:00:00'),
(146, 2, 4, 'BJ57 TWM', '2018-12-25 09:30:00'),
(147, 3, 4, 'BJ57 TWM', '2018-12-25 10:00:00'),
(148, 4, 4, 'BJ57 TWM', '2018-12-25 10:30:00'),
(149, 5, 4, 'MK02 VVG', '2018-12-25 11:00:00'),
(150, 6, 4, 'MK02 VVG', '2018-12-25 11:30:00'),
(151, 7, 4, 'MK02 VVG', '2018-12-25 12:00:00'),
(152, 8, 4, 'MK02 VVG', '2018-12-25 12:30:00'),
(153, 9, 4, 'BJ57 TWM', '2018-12-25 13:00:00'),
(154, 10, 4, 'BJ57 TWM', '2018-12-25 13:30:00'),
(155, 11, 4, 'BJ57 TWM', '2018-12-25 14:00:00'),
(156, 1, 4, 'BJ57 TWM', '2018-12-25 14:30:00'),
(157, 2, 4, 'MK02 VVG', '2018-12-25 15:00:00'),
(158, 3, 4, 'MK02 VVG', '2018-12-25 15:30:00'),
(159, 4, 4, 'MK02 VVG', '2018-12-25 16:00:00'),
(160, 5, 4, 'BJ57 TWM', '2018-12-25 16:30:00'),
(161, 6, 4, 'BJ57 TWM', '2018-12-25 17:30:00'),
(162, 1, 4, 'BJ57 TWM', '2018-12-26 09:00:00'),
(163, 2, 4, 'BJ57 TWM', '2018-12-26 09:30:00'),
(164, 3, 4, 'BJ57 TWM', '2018-12-26 10:00:00'),
(165, 4, 4, 'BJ57 TWM', '2018-12-26 10:30:00'),
(166, 5, 4, 'MK02 VVG', '2018-12-26 11:00:00'),
(167, 6, 4, 'MK02 VVG', '2018-12-26 11:30:00'),
(168, 7, 4, 'MK02 VVG', '2018-12-26 12:00:00'),
(169, 8, 4, 'MK02 VVG', '2018-12-26 12:30:00'),
(170, 9, 4, 'BJ57 TWM', '2018-12-26 13:00:00'),
(171, 10, 4, 'BJ57 TWM', '2018-12-26 13:30:00'),
(172, 11, 4, 'BJ57 TWM', '2018-12-26 14:00:00'),
(173, 1, 4, 'BJ57 TWM', '2018-12-26 14:30:00'),
(174, 2, 4, 'MK02 VVG', '2018-12-26 15:00:00'),
(175, 3, 4, 'MK02 VVG', '2018-12-26 15:30:00'),
(176, 4, 4, 'MK02 VVG', '2018-12-26 16:00:00'),
(177, 5, 4, 'BJ57 TWM', '2018-12-26 16:30:00'),
(178, 6, 4, 'BJ57 TWM', '2018-12-26 17:00:00'),
(179, 1, 5, 'BJ57 TWM', '2018-12-24 09:15:00'),
(180, 2, 5, 'BJ57 TWM', '2018-12-24 09:45:00'),
(181, 3, 5, 'BJ57 TWM', '2018-12-24 10:15:00'),
(182, 4, 5, 'BJ57 TWM', '2018-12-24 10:45:00'),
(183, 5, 5, 'MK02 VVG', '2018-12-24 11:15:00'),
(184, 6, 5, 'MK02 VVG', '2018-12-24 11:45:00'),
(185, 7, 5, 'MK02 VVG', '2018-12-24 12:15:00'),
(186, 8, 5, 'MK02 VVG', '2018-12-24 12:45:00'),
(187, 9, 5, 'BJ57 TWM', '2018-12-24 13:15:00'),
(188, 10, 5, 'BJ57 TWM', '2018-12-24 13:45:00'),
(189, 11, 5, 'BJ57 TWM', '2018-12-24 14:15:00'),
(190, 1, 5, 'BJ57 TWM', '2018-12-24 14:45:00'),
(191, 2, 5, 'MK02 VVG', '2018-12-24 15:15:00'),
(192, 3, 5, 'MK02 VVG', '2018-12-24 15:45:00'),
(193, 4, 5, 'MK02 VVG', '2018-12-24 16:15:00'),
(194, 5, 5, 'BJ57 TWM', '2018-12-24 16:45:00'),
(195, 6, 5, 'BJ57 TWM', '2018-12-24 17:15:00'),
(196, 1, 5, 'BJ57 TWM', '2018-12-25 09:15:00'),
(197, 2, 5, 'BJ57 TWM', '2018-12-25 09:45:00'),
(198, 3, 5, 'BJ57 TWM', '2018-12-25 10:15:00'),
(199, 4, 5, 'BJ57 TWM', '2018-12-25 10:45:00'),
(200, 5, 5, 'MK02 VVG', '2018-12-25 11:15:00'),
(201, 6, 5, 'MK02 VVG', '2018-12-25 11:45:00'),
(202, 7, 5, 'MK02 VVG', '2018-12-25 12:15:00'),
(203, 8, 5, 'MK02 VVG', '2018-12-25 12:45:00'),
(204, 9, 5, 'BJ57 TWM', '2018-12-25 13:15:00'),
(205, 10, 5, 'BJ57 TWM', '2018-12-25 13:45:00'),
(206, 11, 5, 'BJ57 TWM', '2018-12-25 14:15:00'),
(207, 1, 5, 'BJ57 TWM', '2018-12-25 14:45:00'),
(208, 2, 5, 'MK02 VVG', '2018-12-25 15:15:00'),
(209, 3, 5, 'MK02 VVG', '2018-12-25 15:45:00'),
(210, 4, 5, 'MK02 VVG', '2018-12-25 16:15:00'),
(211, 5, 5, 'BJ57 TWM', '2018-12-25 16:45:00'),
(212, 6, 5, 'BJ57 TWM', '2018-12-25 17:15:00'),
(213, 1, 5, 'BJ57 TWM', '2018-12-26 09:15:00'),
(214, 2, 5, 'BJ57 TWM', '2018-12-26 09:45:00'),
(215, 3, 5, 'BJ57 TWM', '2018-12-26 10:15:00'),
(216, 4, 5, 'BJ57 TWM', '2018-12-26 10:45:00'),
(217, 5, 5, 'MK02 VVG', '2018-12-26 11:15:00'),
(218, 6, 5, 'MK02 VVG', '2018-12-26 11:45:00'),
(219, 7, 5, 'MK02 VVG', '2018-12-26 12:15:00'),
(220, 8, 5, 'MK02 VVG', '2018-12-26 12:45:00'),
(221, 9, 5, 'BJ57 TWM', '2018-12-26 13:15:00'),
(222, 10, 5, 'BJ57 TWM', '2018-12-26 13:45:00'),
(223, 11, 5, 'BJ57 TWM', '2018-12-26 14:15:00'),
(224, 1, 5, 'BJ57 TWM', '2018-12-26 14:45:00'),
(225, 2, 5, 'MK02 VVG', '2018-12-26 15:15:00'),
(226, 3, 5, 'MK02 VVG', '2018-12-26 15:45:00'),
(227, 4, 5, 'MK02 VVG', '2018-12-26 16:15:00'),
(228, 5, 5, 'BJ57 TWM', '2018-12-26 16:45:00'),
(229, 6, 5, 'BJ57 TWM', '2018-12-26 17:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stop_id` int(10) UNSIGNED NOT NULL,
  `stop_name` varchar(50) NOT NULL,
  `postcode` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`stop_id`, `stop_name`, `postcode`) VALUES
(1, 'Manchester Piccadilly', 'M1 1RG'),
(2, 'Newton Heath Dean Lane', 'M40 3AD'),
(3, 'Hollinwood Mersey Road North', 'M35 9FF'),
(4, 'Garden Suburb', 'OL8 3BE'),
(5, 'Oldham Bus Station', 'OL3 5SR'),
(6, 'Oldham Mumps Bridge', 'OL4 1SY'),
(7, 'Lees County End', 'OL4 4LY'),
(8, 'Grotton Station Road', 'OL4 5SF'),
(9, 'Uppermill', 'OL3 6BF'),
(10, 'Diggle Sunfield Lane', 'OL3 5PS'),
(11, 'Marsden Peel Street', 'HD7 6EZ'),
(12, 'Slaithwaite Star Hotel', 'HD7 5HR'),
(13, 'Cowlersley', 'HD7 5QZ'),
(14, 'Huddersfield Bus Station', 'HD1 2JN'),
(15, 'Leeds City Bus Station', 'LS2 7LA'),
(16, 'Domestic Road', 'LS11 9RS'),
(17, 'Birstall Market Place', 'WF17 9EL'),
(18, 'Batley Bus Station', 'WF17 5RN'),
(19, 'Heckmondwike Hub', 'WF16 0HR'),
(20, 'Hartshead Post Office', 'HD5 0RJ'),
(21, 'Sygenta', 'HD2 1FG'),
(22, 'Linthwaite Church', 'HD7 5TD'),
(23, 'Slaithwaite Carr Lane', 'HD7 5AF'),
(24, 'Wilberlee', ' HD7 5UX'),
(25, 'Salford Shopping Centre', 'M6 5JA'),
(26, 'Swinton Church', 'M27 6BP'),
(27, 'Walkden Ellesmere Centre', 'M39 3EE'),
(28, 'Little Hulton Cleggs Lane', 'M38 9RS'),
(29, 'Harper Green Road', 'BL4 0DS'),
(30, 'Bolton Interchange', 'BL1 1PF'),
(31, 'Newsome Church', 'HD4 6JR'),
(32, 'Hanging Stone Road', 'HD4 7QS'),
(33, 'Honley Bradshaw Road', 'HD9 6EE'),
(34, 'Church Street Holmfirth', 'HD9 3XZ'),
(35, 'Holme Valley Hospital', 'HD9 3TR'),
(36, 'Holmfirth Bus Station', 'HD9 2WZ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`registration`),
  ADD KEY `fk__buses_icons__icon_id` (`icon_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`icon_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `route_stop`
--
ALTER TABLE `route_stop`
  ADD PRIMARY KEY (`route_stop_id`),
  ADD KEY `fk__route_stop_routes__route_id` (`route_id`),
  ADD KEY `fk__route_stop_stops__stop_id` (`stop_id`);

--
-- Indexes for table `runs`
--
ALTER TABLE `runs`
  ADD PRIMARY KEY (`run_id`),
  ADD KEY `fk__run_drivers__driver_id` (`driver_id`),
  ADD KEY `fk__run_routes__route_id` (`route_id`),
  ADD KEY `fk__run_buses__bus_reg` (`bus_reg`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `icon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `route_stop`
--
ALTER TABLE `route_stop`
  MODIFY `route_stop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `run_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `fk__buses_icons__icon_id` FOREIGN KEY (`icon_id`) REFERENCES `icons` (`icon_id`);

--
-- Constraints for table `route_stop`
--
ALTER TABLE `route_stop`
  ADD CONSTRAINT `fk__route_stop_routes__route_id` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  ADD CONSTRAINT `fk__route_stop_stops__stop_id` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`stop_id`);

--
-- Constraints for table `runs`
--
ALTER TABLE `runs`
  ADD CONSTRAINT `fk__run_buses__bus_reg` FOREIGN KEY (`bus_reg`) REFERENCES `buses` (`registration`),
  ADD CONSTRAINT `fk__run_drivers__driver_id` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `fk__run_routes__route_id` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
