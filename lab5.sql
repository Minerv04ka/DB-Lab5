-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2023 at 01:22 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab5`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerSurname` varchar(100) DEFAULT NULL,
  `CustomerEmail` varchar(100) DEFAULT NULL,
  `CustomerPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerName`, `CustomerSurname`, `CustomerEmail`, `CustomerPhone`) VALUES
(1, 'Sasha', 'Zhuk', 'oleksandr.zhuk.2000@gmail.com', '321321321');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `DistributorID` int(11) NOT NULL,
  `DistributorName` varchar(100) DEFAULT NULL,
  `DistributorEmail` varchar(100) DEFAULT NULL,
  `DistributorPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`DistributorID`, `DistributorName`, `DistributorEmail`, `DistributorPhone`) VALUES
(1, 'Vlad', 'gipnoboy@gmail.com', '111222333');

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `MechanicsID` int(11) NOT NULL,
  `MechanicsName` varchar(100) DEFAULT NULL,
  `MechanicsSurname` varchar(100) DEFAULT NULL,
  `MechanicsEmail` varchar(100) DEFAULT NULL,
  `MechanicsPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`MechanicsID`, `MechanicsName`, `MechanicsSurname`, `MechanicsEmail`, `MechanicsPhone`) VALUES
(1, 'Maks', 'Skamer', 'maksskam228@gmail.com', '333222111');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `DistributorID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Spare_partsID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `DistributorID`, `CustomerID`, `Spare_partsID`, `Quantity`, `Total`) VALUES
(1, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `ReceiptID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `MechanicsID` int(11) DEFAULT NULL,
  `Spare_partsID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spare_parts`
--

CREATE TABLE `spare_parts` (
  `Spare_partsID` int(11) NOT NULL,
  `Spare_partsName` varchar(99) DEFAULT NULL,
  `Spare_partsPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spare_parts`
--

INSERT INTO `spare_parts` (`Spare_partsID`, `Spare_partsName`, `Spare_partsPrice`) VALUES
(1, 'Фара', 1000),
(2, 'Двигун', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `storage_`
--

CREATE TABLE `storage_` (
  `PlaceInStorage` varchar(100) NOT NULL,
  `Spare_partsID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `storage_`
--

INSERT INTO `storage_` (`PlaceInStorage`, `Spare_partsID`, `Quantity`) VALUES
('Склад', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`DistributorID`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`MechanicsID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `DistributorID` (`DistributorID`),
  ADD KEY `MechanicsID` (`CustomerID`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`ReceiptID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `MechanicsID` (`MechanicsID`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Indexes for table `spare_parts`
--
ALTER TABLE `spare_parts`
  ADD PRIMARY KEY (`Spare_partsID`);

--
-- Indexes for table `storage_`
--
ALTER TABLE `storage_`
  ADD PRIMARY KEY (`PlaceInStorage`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DistributorID`) REFERENCES `distributors` (`DistributorID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `mechanics` (`MechanicsID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`MechanicsID`) REFERENCES `mechanics` (`MechanicsID`),
  ADD CONSTRAINT `receipts_ibfk_3` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);

--
-- Constraints for table `storage_`
--
ALTER TABLE `storage_`
  ADD CONSTRAINT `storage__ibfk_1` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
