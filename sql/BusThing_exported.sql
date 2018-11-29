-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2018 at 11:32 PM
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
('BJ57 TWM', 'Trident 2', 'Dennis', 70, 2);

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
(1, 'John', 'Smith');

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
(1, '184 - Manchester to Huddersfield', 27, 119, 0.1);

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
(14, 1, 14, 14, 15);

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
(1, 1, 1, 'BJ57 TWM', '2018-12-24 09:28:00');

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
(14, 'Huddersfield Bus Station', 'HD1 2JN');

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
  MODIFY `driver_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `icon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `route_stop`
--
ALTER TABLE `route_stop`
  MODIFY `route_stop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `runs`
--
ALTER TABLE `runs`
  MODIFY `run_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
