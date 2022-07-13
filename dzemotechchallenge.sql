-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2022 at 11:51 AM
-- Server version: 8.0.13
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dzemotechchallenge`
--
CREATE DATABASE IF NOT EXISTS `dzemotechchallenge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dzemotechchallenge`;

-- --------------------------------------------------------

--
-- Table structure for table `benefitiaries`
--

DROP TABLE IF EXISTS `benefitiaries`;
CREATE TABLE IF NOT EXISTS `benefitiaries` (
  `benefitiaryId` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `walletTypeId` int(11) NOT NULL,
  `benefitiaryName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`benefitiaryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `benefitiaries`
--

INSERT INTO `benefitiaries` (`benefitiaryId`, `account`, `walletTypeId`, `benefitiaryName`, `createdAt`) VALUES
(1, '254724040350', 1, 'John doe', '2022-07-13 02:14:05'),
(2, '234567890', 2, 'Margaret Thatcher ', '2022-07-13 02:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`profileId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profileId`, `fullname`, `email`, `phone`, `country`, `status`, `createdAt`) VALUES
(1, 'James Njuguna', 'jamesnjuguna0@gmail.com', '254724040350', 'Kenya', 0, '2022-07-13 02:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `profile_balance`
--

DROP TABLE IF EXISTS `profile_balance`;
CREATE TABLE IF NOT EXISTS `profile_balance` (
  `pbalanceId` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `balance` float NOT NULL,
  `bonus` int(11) NOT NULL,
  `loyaltyPoints` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pbalanceId`,`profileId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile_balance`
--

INSERT INTO `profile_balance` (`pbalanceId`, `profileId`, `balance`, `bonus`, `loyaltyPoints`, `createdAt`) VALUES
(1, 1, 100001, 90, 12, '2022-07-13 02:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `profile_loans`
--

DROP TABLE IF EXISTS `profile_loans`;
CREATE TABLE IF NOT EXISTS `profile_loans` (
  `loanId` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `loanAmount` float NOT NULL,
  `loanPeriodDays` int(11) NOT NULL DEFAULT '30',
  `interest` decimal(10,0) NOT NULL,
  `disburseDate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `instalments` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`loanId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile_loans`
--

INSERT INTO `profile_loans` (`loanId`, `profileId`, `loanAmount`, `loanPeriodDays`, `interest`, `disburseDate`, `status`, `instalments`, `createdAt`) VALUES
(1, 1, 30000, 120, '14', '2022-06-01 00:00:00', 1, 4, '2022-07-13 02:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `transactionId` int(11) NOT NULL AUTO_INCREMENT,
  `transactionCode` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL,
  `transactionTypeId` int(11) NOT NULL,
  `profileId` int(11) NOT NULL,
  `benefitiaryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionId`),
  UNIQUE KEY `transactionCode` (`transactionCode`),
  KEY `profileid` (`profileId`,`transactionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionId`, `transactionCode`, `amount`, `status`, `transactionTypeId`, `profileId`, `benefitiaryId`, `createdAt`) VALUES
(1, 'trewqy1', 900, 1, 1, 1, 1, '2022-07-13 02:12:44'),
(2, 'trewqy11', 8900, 2, 2, 1, 1, '2022-07-13 02:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

DROP TABLE IF EXISTS `transaction_types`;
CREATE TABLE IF NOT EXISTS `transaction_types` (
  `transactionTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`transactionTypeId`, `type_name`, `status`, `createdAt`) VALUES
(1, 'deposit', 0, '2022-07-12 22:54:23'),
(2, 'withdrawal', 0, '2022-07-12 22:54:23'),
(3, 'loan disbursement', 0, '2022-07-12 22:54:23'),
(4, 'points redemption', 0, '2022-07-12 22:54:23'),
(5, 'bonus redemption', 0, '2022-07-12 22:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `profileId` int(11) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_types`
--

DROP TABLE IF EXISTS `wallet_types`;
CREATE TABLE IF NOT EXISTS `wallet_types` (
  `walletTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `walletName` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walletTypeId`),
  UNIQUE KEY `walletName` (`walletName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_types`
--

INSERT INTO `wallet_types` (`walletTypeId`, `walletName`, `status`, `createdAt`) VALUES
(1, 'Mobile', 0, '2022-07-13 02:15:45'),
(2, 'Bank', 0, '2022-07-13 02:15:45');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
