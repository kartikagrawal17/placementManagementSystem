-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2020 at 10:57 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `placement`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `invigilator_id` int(11) NOT NULL,
  `task_for` int(11) NOT NULL COMMENT '1-enroll ,2-bio-approved ,3-not-interest',
  `created` bigint(20) NOT NULL,
  `modified` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `company_id`, `invigilator_id`, `task_for`, `created`, `modified`) VALUES
(1, 20, 4, 1, 1, 1562848320, 0),
(2, 3, 2, 0, 1, 1563177355, 0),
(3, 3, 3, 0, 1, 1563430012, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drive_date` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `skills` varchar(255) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `package` bigint(20) NOT NULL,
  `created` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-active,2-inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `drive_date`, `location`, `latitude`, `longitude`, `designation`, `stream`, `skills`, `batch`, `package`, `created`, `status`) VALUES
(1, 'Appsquadz', 1563400800, 'Mathura', '22.556450', '88.391830', 'Software Developer', 'b.tech', 'legend', '2017-2021', 21, 1562322571, 1),
(2, 'HCL', 1563228000, 'njcdkb', '', '', 'Software Developer', 'btech', 'nfsjbhbjh', '2018', 20, 0, 1),
(3, 'Wipro', 1546210800, 'Noida, Uttar Pradesh, India', '', '', 'developer', 'btech', 'php', '2018', 20, 0, 1),
(4, 'Infosys', 1563487200, 'noida', '', '', 'Software Developer', 'btech', 'android', '2018', 40, 0, 1),
(5, 'Google', 1563487200, 'Noida, Uttar Pradesh, India', '', '', 'Java Developer', 'CSE', '.Net', '2019', 2, 0, 1),
(6, 'Google', 1564524000, 'Noida, Uttar Pradesh, India', '', '', '', 'CSE', '.Net', '2019', 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_criteria`
--

CREATE TABLE `company_criteria` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `criteria` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_criteria`
--

INSERT INTO `company_criteria` (`id`, `company_id`, `education_id`, `criteria`, `created`) VALUES
(1, 4, 1, '20', 1562756131),
(2, 5, 1, '20', 1562846212),
(3, 5, 2, '5', 1562846212),
(4, 5, 3, '1', 1562846212),
(5, 6, 1, '20', 1562848421),
(6, 6, 2, '5', 1562848421),
(7, 6, 3, '1', 1562848421),
(8, 7, 1, '20', 1563003015);

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-Active , 2-inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `title`, `created`, `status`) VALUES
(1, '10th', 0, 1),
(2, '12th', 0, 1),
(3, 'BTECH', 0, 1),
(7, 'MTECH', 0, 1),
(8, 'M.PHARMA', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `c_code` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `biometric` tinytext NOT NULL,
  `device_token` tinytext NOT NULL,
  `stream` varchar(255) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `appeared_in` int(11) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1-admin,2-invigilator,3-user',
  `skills` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1-active ,2-inactive ,3-delete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `c_code`, `mobile`, `password`, `biometric`, `device_token`, `stream`, `batch`, `appeared_in`, `user_type`, `skills`, `created`, `status`) VALUES
(1, 'Kartik Agrawal', 'kanu@go.com', '+91', 7895905598, 'c8d39cdb56a46ad807969ee04c4e660b', 'hello', '', '', '', 0, 1, '', 2, 1),
(2, 'Aman', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'btech', '2018', 10, 3, 'php', 0, 1),
(3, 'Vaibhav', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 9, 3, '', 0, 1),
(4, 'Adesh', 'anu@gmail.com', '+91', 5365, '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', 8, 3, '', 0, 1),
(5, 'Shani', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 7, 3, '', 0, 1),
(6, 'Kartik', 'kk@go.in', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 6, 3, '', 0, 1),
(7, 'Abhinav', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 7, 3, '', 0, 1),
(8, 'Shubham', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 8, 3, '', 0, 1),
(9, 'Muskan', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 9, 3, '', 0, 1),
(10, 'Kanhaiya', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 10, 3, '', 0, 1),
(11, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(12, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(13, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(14, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(15, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(16, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(17, 'anu', 'anu@gmail.com', '+91', 5365, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', 0, 3, '', 0, 1),
(18, 'Anugrah', 'a@gmail.com', '', 7895905598, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'science', '', 0, 3, 'good in php ', 0, 1),
(19, 'Anugrah', 'a@gmail.com', '', 7895905598, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'science', '', 0, 3, 'good in php ', 0, 1),
(20, 'Anugrah Agarwal', 'anugrah@gmail.com', '', 7895, '25f9e794323b453885f5181f1b624d0b', '', 'device_token', 'btech', '', 0, 3, 'php', 0, 1),
(21, 'Mohit Kumar', 'mohit@gmail.com', '', 999999999, '5d41402abc4b2a76b9719d911017c592', '', 'device_token', '0', '0', 0, 2, '0', 0, 1),
(22, 'Mohit Developer', 'shani@gmail.com', '', 7054048089, '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', 0, 1, '', 0, 1),
(23, 'abcd', 'abcd@gmail.com', '+91', 7054048089, '21232f297a57a5a743894a0e4a801fc3', 'hello', '', 'b.tech', '2015', 0, 3, 'android', 2, 1),
(24, 'Jack', 'jack@gmail.com', '', 11111, '12345678', 'sdfsfdsfdsfdsfsdfsd', '', 'M.Tech', '2019-20', 0, 0, 'PHP', 1563271195, 1),
(25, 'Jack', 'jack@gmail.com', '', 11111, '12345678', 'sdfsfdsfdsfdsfsdfsd', '', 'M.Tech', '2019-20', 0, 0, 'PHP', 1563273051, 1),
(26, 'Jack', 'jack@gmail.com', '', 11111, '12345678', 'sdfsfdsfdsfdsfsdfsd', '', 'M.Tech', '2019-20', 0, 0, 'PHP', 1563349954, 1),
(27, 'aman', 'as@bh.s', '', 12, '5a4cd850fc787d454416aa3a47580468', '', '', '0', '0', 0, 2, '0', 0, 1),
(28, 'rahul', 'sad@dss.das', '', 213, 'ccda1683d8c97f8f2dff2ea7d649b42c', '', '', '0', '0', 0, 2, '0', 0, 1),
(29, 'Punit Chaurasia', 'punit@gmail.com', '', 123466789, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '0', '0', 0, 2, '0', 0, 1),
(30, 'Jack', 'jack@gmail.com', '', 11111, '12345678', 'sdfsfdsfdsfdsfsdfsd', '', 'M.Tech', '2019-20', 0, 0, 'PHP', 1563430118, 1),
(31, 'Jack', 'jack@gmail.com', '', 11111, '12345678', 'sdfsfdsfdsfdsfsdfsd', '', 'M.Tech', '2019-20', 0, 0, 'PHP', 1563450113, 1),
(32, 'sagar', 'sa@gamu.com', '', 261651, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'Playboy', '2017', 0, 3, '10_girls_at_once', 0, 1),
(33, 'shruti', 'shruti@go.com', '', 789456123, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'btech', '2018', 0, 3, 'php', 0, 1),
(34, 'Anugrah', 'anugr@gmail.com', '', 7895905598, '12345', 'jijijijiiji', '', 'Btech', '2014', 0, 0, 'php', 1567190116, 1),
(35, 'gitansh', 'git@gmail.com', '', 17147714, '827ccb0eea8a706c4c34a16891f84e7b', '', '', 'btech', '2015', 0, 3, 'android', 0, 1),
(36, 'Anugrah', 'anugr12@gmail.com', '', 1234567890, 'hello', 'jijijijiiji', '', 'btech', '2018', 0, 0, 'php', 1569610099, 1),
(37, 'kartik', 'kk@go.in', '', 14435545, '0ca4d4353a6b2d838c36ef1f75de606a', '', '', '', '', 0, 1, '', 0, 1),
(39, 'kartik agrawal', 'kk@go.in', '', 0, 'kk277290', '', '', '', '', 0, 0, '', 0, 0),
(40, 'kartik agrawal', 'kk@go.in', '', 0, 'kk277290', '', '', '', '', 0, 0, '', 0, 0),
(41, 'Kart', 'kkk@go.in', '+91', 564565467, 'c8d39cdb56a46ad807969ee04c4e660b', 'hello', 'hello', 'cs', '2021', 4, 3, 'java', 0, 1),
(42, 'Kart', 'kkk@go.in', '+91', 564565467, 'c8d39cdb56a46ad807969ee04c4e660b', 'hello', 'hello', 'cs', '2021', 4, 3, 'java', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_educational_detail`
--

CREATE TABLE `user_educational_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `max_marks` int(11) NOT NULL,
  `roll_no` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-active , 2- inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_educational_detail`
--

INSERT INTO `user_educational_detail` (`id`, `user_id`, `education_id`, `marks`, `max_marks`, `roll_no`, `created`, `status`) VALUES
(1, 18, 1, 500, 600, '123', 1562087272, 1),
(2, 18, 2, 400, 500, '234', 1562087272, 1),
(3, 19, 1, 500, 600, '123', 1562090110, 1),
(4, 19, 2, 400, 500, '234', 1562090110, 1),
(5, 20, 1, 200, 250, '566', 1562090423, 1),
(6, 20, 2, 200, 25, '566', 1562090423, 1),
(7, 20, 3, 200, 25, '566', 1562090423, 1),
(8, 25, 1, 20, 200, '1478610006', 1563273051, 1),
(9, 25, 1, 20, 200, '1478610006', 1563273051, 1),
(10, 26, 1, 20, 200, '1478610006', 1563349955, 1),
(11, 23, 1, 20, 200, '1478610006', 1563349955, 1),
(12, 30, 1, 20, 200, '1478610006', 1563430118, 1),
(13, 30, 1, 20, 200, '1478610006', 1563430118, 1),
(14, 31, 1, 20, 200, '1478610006', 1563450113, 1),
(15, 31, 1, 20, 200, '1478610006', 1563450113, 1),
(16, 32, 1, 5, 5, '5', 1564946446, 1),
(17, 33, 1, 10, 10, '1', 1565175788, 1),
(18, 35, 1, 50, 50, '1', 1567190732, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_criteria`
--
ALTER TABLE `company_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_educational_detail`
--
ALTER TABLE `user_educational_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_criteria`
--
ALTER TABLE `company_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_educational_detail`
--
ALTER TABLE `user_educational_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
