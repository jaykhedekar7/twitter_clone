-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2020 at 06:04 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbaforum`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `username` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `username`, `content`, `date`) VALUES
(1, 'jaykhedekar', 'Hey! This is the first post', '2020-06-11 15:59:33'),
(2, 'codingninja', 'How many numbers with distinct digits are possible product of whose digits is 28?\r\n\r\n6\r\n4\r\n8\r\n12', '2020-06-11 16:05:43'),
(3, 'ceat.guest', 'Is the event still on?', '2020-06-11 16:28:29'),
(4, 'swapanakhedekar', 'Hi I just joined this blog!', '2020-06-11 16:29:42'),
(10, 'nobita', 'Where\'s doreamon?', '2020-06-11 16:44:17'),
(11, 'suniyo', 'I need more money!', '2020-06-11 16:47:24'),
(18, 'kiteretsu', 'I am going to create some crazy shit', '2020-06-11 16:57:09'),
(19, 'shinchan', 'Hey baby kya tumhe shimla mirch pasand hai?', '2020-06-11 17:09:06'),
(20, 'Pikachu', 'Pikaa Pikaaa!', '2020-06-11 18:03:28'),
(21, 'jay7898', 'Numeric character works', '2020-06-11 18:04:10'),
(22, 'tesla', 'Now days there are many job search sites are available in USA you can easily get best jobs for your profile with the help of job search site.\r\n\r\nOne of the best job portal in USA for international candidates which provide best jobs placement for international candidates in USA is Optnation.\r\n\r\nYou can easily find Multiple jobs for multiple job profiles at Optnation.\r\n\r\nAlso find jobs for entry level mechanical engineering students in USA at', '2020-06-11 18:19:23'),
(23, 'samsung', 'Sale on Samsung galaxy S10+. Hurry', '2020-06-11 18:31:28'),
(24, 'jay1234', 'This is a test tweet!', '2020-06-11 19:13:37'),
(25, 'akshaypatil', 'I lost at ludo today!', '2020-06-11 20:06:21'),
(26, 'akpatil', 'Yo boyz', '2020-06-11 20:34:16'),
(27, 'jaykhed', 'Watching a movie now', '2020-06-11 21:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `sno` int(11) NOT NULL,
  `username` text NOT NULL,
  `email` varchar(40) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
