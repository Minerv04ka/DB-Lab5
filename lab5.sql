-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Лис 20 2023 р., 10:24
-- Версія сервера: 5.7.24
-- Версія PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `lab5`
--

-- --------------------------------------------------------

--
-- Структура таблиці `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerSurname` varchar(100) DEFAULT NULL,
  `CustomerEmail` varchar(100) DEFAULT NULL,
  `CustomerPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `distributors`
--

CREATE TABLE `distributors` (
  `DistributorID` int(11) NOT NULL,
  `DistributorName` varchar(100) DEFAULT NULL,
  `DistributorEmail` varchar(100) DEFAULT NULL,
  `DistributorPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mechanics`
--

CREATE TABLE `mechanics` (
  `MechanicsID` int(11) NOT NULL,
  `MechanicsName` varchar(100) DEFAULT NULL,
  `MechanicsSurname` varchar(100) DEFAULT NULL,
  `MechanicsEmail` varchar(100) DEFAULT NULL,
  `MechanicsPhone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `DistributorID` int(11) DEFAULT NULL,
  `MechanicsID` int(11) DEFAULT NULL,
  `Spare_partsID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `receipts`
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
-- Структура таблиці `spare_parts`
--

CREATE TABLE `spare_parts` (
  `Spare_partsID` int(11) NOT NULL,
  `Spare_partsName` int(11) DEFAULT NULL,
  `Spare_partsPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `storage_`
--

CREATE TABLE `storage_` (
  `PlaceInStorage` int(11) NOT NULL,
  `Spare_partsID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Індекси таблиці `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`DistributorID`);

--
-- Індекси таблиці `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`MechanicsID`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `DistributorID` (`DistributorID`),
  ADD KEY `MechanicsID` (`MechanicsID`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Індекси таблиці `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`ReceiptID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `MechanicsID` (`MechanicsID`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Індекси таблиці `spare_parts`
--
ALTER TABLE `spare_parts`
  ADD PRIMARY KEY (`Spare_partsID`);

--
-- Індекси таблиці `storage_`
--
ALTER TABLE `storage_`
  ADD PRIMARY KEY (`PlaceInStorage`),
  ADD KEY `Spare_partsID` (`Spare_partsID`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DistributorID`) REFERENCES `distributors` (`DistributorID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`MechanicsID`) REFERENCES `mechanics` (`MechanicsID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);

--
-- Обмеження зовнішнього ключа таблиці `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`MechanicsID`) REFERENCES `mechanics` (`MechanicsID`),
  ADD CONSTRAINT `receipts_ibfk_3` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);

--
-- Обмеження зовнішнього ключа таблиці `storage_`
--
ALTER TABLE `storage_`
  ADD CONSTRAINT `storage__ibfk_1` FOREIGN KEY (`Spare_partsID`) REFERENCES `spare_parts` (`Spare_partsID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
