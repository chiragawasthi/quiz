-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2021 at 09:31 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `aid` int(255) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `ans_id` int(250) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(4) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`) VALUES
(12, 'css'),
(15, 'html'),
(16, 'javascript');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qid` int(250) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `ans_id` int(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `question`, `ans_id`, `course_name`) VALUES
(1, 'what does html stands for', 1, 'html'),
(2, ' Who is making the Web standards?', 5, 'html'),
(3, ' Choose the correct HTML element for the largest heading:', 9, 'html'),
(4, 'What is the correct HTML element for inserting a line break?', 13, 'html');

-- --------------------------------------------------------

--
-- Table structure for table `question_test`
--

CREATE TABLE `question_test` (
  `id` int(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `opt1` varchar(255) NOT NULL,
  `opt2` varchar(255) NOT NULL,
  `opt3` varchar(255) NOT NULL,
  `opt4` varchar(255) NOT NULL,
  `answer` int(100) NOT NULL,
  `course_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_test`
--

INSERT INTO `question_test` (`id`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`, `course_id`) VALUES
(25, 'full form of &quot;html&quot;?', 'hypertext markup language', 'hypertext makeup language', 'hyper markup language', 'markup hypertext language', 0, 15),
(26, 'css stands for ?', 'cascading Style sheet', 'cascade sheet style', 'care style sheet', 'cam style sheet', 0, 12),
(27, 'css is used for?', 'styling', 'making structure', 'managing', 'backend', 0, 12),
(28, 'The property in CSS used to change the background color of an element is -', 'bgcolor  ', 'color', 'background-color ', 'All of the above', 0, 12),
(29, 'The property in CSS used to change the text color of an element is -', 'bgcolor ', 'color', 'background-color ', 'All of the above', 1, 12),
(30, 'The correct sequence of HTML tags for starting a webpage is -', 'Head, Title, HTML, body', 'HTML, Body, Title, Head', 'HTML, Head, Title, Body', 'HTML, Head, Title, Body', 2, 15),
(31, 'Which of the following element is responsible for making the text bold in HTML?  ', '&lt;pre&gt; ', '&lt;a&gt; ', '&lt;b&gt; ', '&lt;br&gt;', 0, 15),
(32, 'Which of the following tag is used for inserting the largest heading in HTML?', '&lt;h3&gt; ', '&lt;h1&gt; ', '&lt;h5&gt; ', '&lt;h6&gt;', 0, 15),
(33, 'Which of the following tag is used to insert a line-break in HTML?  ', '&lt;br&gt; ', '&lt;a&gt; ', '&lt;pre&gt; ', '&lt;b&gt;', 0, 15),
(34, '', '', '', '', '', 0, 0),
(35, 'Which type of JavaScript language is ___', 'Object-Oriented ', 'Object-Based', 'Assembly-language', 'High-level', 1, 16),
(36, '', '', '', '', '', 0, 0),
(37, '', '', '', '', '', 0, 0),
(38, '', '', '', '', '', 0, 0),
(39, '', '', '', '', '', 0, 0),
(40, '', '', '', '', '', 0, 0),
(41, '', '', '', '', '', 0, 0),
(42, '', '', '', '', '', 0, 0),
(43, '', '', '', '', '', 0, 0),
(44, '', '', '', '', '', 0, 0),
(45, '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `role` enum('Student','Teacher') NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `role`, `username`, `password`, `name`) VALUES
(1, 'Student', 'student@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'Student one'),
(2, 'Teacher', 'teacher@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `question_test`
--
ALTER TABLE `question_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `aid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `question_test`
--
ALTER TABLE `question_test`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
