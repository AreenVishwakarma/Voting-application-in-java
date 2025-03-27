-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 01:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `Name` varchar(100) NOT NULL,
  `PartyNAme` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registar`
--

CREATE TABLE `registar` (
  `Name` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Pname` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Number` bigint(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AadharNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registar`
--

INSERT INTO `registar` (`Name`, `Date`, `Pname`, `Email`, `Number`, `Password`, `AadharNo`) VALUES
('Areen Vishwakarma', '2002-07-26', 'abc', 'areenwish.mum@gmail.com', 8452817040, 'areen', '123456987412');

-- --------------------------------------------------------

--
-- Table structure for table `votecount`
--

CREATE TABLE `votecount` (
  `AadharNo` varchar(20) NOT NULL,
  `Candidates` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votecount`
--

INSERT INTO `votecount` (`AadharNo`, `Candidates`) VALUES
('123456987412', 'Baburao Ganpatrao Apte');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registar`
--
ALTER TABLE `registar`
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Number` (`Number`),
  ADD UNIQUE KEY `AadharNo` (`AadharNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
