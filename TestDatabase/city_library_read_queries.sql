-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2021 at 06:22 PM
-- Server version: 8.0.23
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `city_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `DOCID` int NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

CREATE TABLE `borrowing` (
  `BOR_NO` int NOT NULL,
  `BDTIME` datetime DEFAULT NULL,
  `RDTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`BOR_NO`, `BDTIME`, `RDTIME`) VALUES
(1, '2021-04-12 00:58:30', NULL),
(2, '2021-04-12 20:37:57', NULL),
(3, '2021-04-12 20:38:11', NULL),
(4, '2021-04-12 21:52:33', NULL),
(5, '2021-04-01 00:58:30', NULL),
(6, '2021-04-05 00:58:30', NULL),
(7, '2021-04-06 00:58:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `BOR_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`BOR_NO`, `DOCID`, `COPYNO`, `BID`, `RID`) VALUES
(1, 1, 1, 1, 1),
(2, 3, 1, 1, 1),
(2, 4, 1, 1, 1),
(2, 5, 1, 1, 1),
(6, 5, 3, 3, 1),
(7, 1, 4, 2, 1),
(3, 3, 1, 2, 2),
(3, 4, 1, 2, 2),
(4, 3, 2, 1, 3),
(4, 4, 2, 1, 3),
(4, 5, 2, 1, 3),
(5, 1, 2, 1, 4),
(5, 5, 2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BID` int NOT NULL,
  `LNAME` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BID`, `LNAME`, `LOCATION`) VALUES
(1, 'LNAME1', 'LOCATION1'),
(2, 'LNAME2', 'LOCATION2'),
(3, 'LNAME3', 'LOCATION3'),
(4, 'LNAME4', 'LOCATION4'),
(5, 'LNAME5', 'LOCATION5');

-- --------------------------------------------------------

--
-- Table structure for table `chairs`
--

CREATE TABLE `chairs` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `COPYNO` int NOT NULL,
  `DOCID` int NOT NULL,
  `BID` int NOT NULL,
  `POSITION` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `copy`
--

INSERT INTO `copy` (`COPYNO`, `DOCID`, `BID`, `POSITION`) VALUES
(1, 1, 1, 'ABCDEF'),
(1, 1, 2, 'ABCDEF'),
(1, 1, 3, 'ABCDEF'),
(1, 2, 1, 'ASDFGH'),
(1, 2, 2, 'ABCDEF'),
(1, 2, 3, 'ABCDEF'),
(1, 3, 1, 'ABCDEF'),
(1, 3, 2, 'POIUYT'),
(1, 3, 3, 'ASDFGH'),
(1, 4, 1, 'ABCDEF'),
(1, 4, 2, 'XCVBNM'),
(1, 5, 1, 'ABCDEF'),
(1, 5, 2, 'POIUYT'),
(1, 5, 3, 'POIUYT'),
(2, 1, 1, 'POIUYT'),
(2, 1, 2, 'ASDFGH'),
(2, 1, 3, 'XCVBNM'),
(2, 2, 1, 'ABCDEF'),
(2, 2, 2, 'POIUYT'),
(2, 2, 3, 'ASDFGH'),
(2, 3, 1, 'ABCDEF'),
(2, 3, 2, 'ABCDEF'),
(2, 3, 3, 'ABCDEF'),
(2, 4, 1, 'POIUYT'),
(2, 5, 1, 'ABCDEF'),
(2, 5, 2, 'ABCDEF'),
(2, 5, 3, 'ABCDEF'),
(3, 1, 1, 'ABCDEF'),
(3, 1, 2, 'ABCDEF'),
(3, 2, 1, 'XCVBNM'),
(3, 4, 1, 'ABCDEF'),
(3, 5, 1, 'XCVBNM'),
(3, 5, 2, 'ABCDEF'),
(3, 5, 3, 'XCVBNM'),
(4, 1, 1, 'XCVBNM'),
(4, 1, 2, 'POIUYT');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `DOCID` int NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `PDATE` date DEFAULT NULL,
  `PUBLISHERID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`DOCID`, `TITLE`, `PDATE`, `PUBLISHERID`) VALUES
(1, 'DocTitle1', '2021-04-01', 1),
(2, 'DocTitle2', '2021-04-02', 2),
(3, 'DocTitle3', '2021-04-03', 3),
(4, 'DocTitle4', '2021-04-04', 4),
(5, 'DocTitle5', '2021-04-05', 5),
(6, 'DocTitle6', '2021-04-06', 1),
(7, 'DocTitle7', '2021-04-07', 2),
(8, 'DocTitle8', '2021-04-08', 3),
(9, 'DocTitle9', '2021-04-09', 4),
(10, 'DocTitle10', '2021-04-10', 5);

-- --------------------------------------------------------

--
-- Table structure for table `gedits`
--

CREATE TABLE `gedits` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `PID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_issue`
--

CREATE TABLE `journal_issue` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `SCOPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_volume`
--

CREATE TABLE `journal_volume` (
  `DOCID` int NOT NULL,
  `VOLUME_NO` varchar(255) DEFAULT NULL,
  `EDITOR` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PID` int NOT NULL,
  `PNAME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proceedings`
--

CREATE TABLE `proceedings` (
  `DOCID` int NOT NULL,
  `CDATE` datetime DEFAULT NULL,
  `CLOCATION` varchar(255) DEFAULT NULL,
  `CEDITOR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PUBLISHERID` int NOT NULL,
  `PUBNAME` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PUBLISHERID`, `PUBNAME`, `ADDRESS`) VALUES
(1, 'PubName1', 'PubAddress1'),
(2, 'PubName2', 'PubAddress2'),
(3, 'PubName3', 'PubAddress3'),
(4, 'PubName4', 'PubAddress4'),
(5, 'PubName5', 'PubAddress5');

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `RID` int NOT NULL,
  `RTYPE` int DEFAULT NULL,
  `RNAME` varchar(45) DEFAULT NULL,
  `RADDRESS` varchar(255) DEFAULT NULL,
  `PHONE_NO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`RID`, `RTYPE`, `RNAME`, `RADDRESS`, `PHONE_NO`) VALUES
(1, 1, 'RNAME1', 'RADDRESS1', 'PHONE1'),
(2, 2, 'RNAME2', 'RADDRESS2', 'PHONE2'),
(3, 1, 'RNAME3', 'RADDRESS3', 'PHONE3'),
(4, 1, 'RNAME4', 'RADDRESS4', 'PHONE4'),
(5, 2, 'RNAME5', 'RADDRESS5', 'PHONE5');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `RES_NO` int NOT NULL,
  `DTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`RES_NO`, `DTIME`) VALUES
(1, '2021-04-12 22:34:56'),
(2, '2021-04-12 22:35:53'),
(3, '2021-04-12 22:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `RESERVES`
--

CREATE TABLE `RESERVES` (
  `RESERVATION_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RESERVES`
--

INSERT INTO `RESERVES` (`RESERVATION_NO`, `DOCID`, `COPYNO`, `BID`, `RID`) VALUES
(1, 1, 3, 1, 1),
(2, 3, 2, 2, 2),
(3, 5, 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USERID` int NOT NULL,
  `USER_MOBILE_NO` int NOT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `RID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USERID`, `USER_MOBILE_NO`, `PASSWORD`, `RID`) VALUES
(1, 123456, '123456', NULL),
(3, 1918577976, '202cb962ac59075b964b07152d234b70', NULL),
(4, 1918577976, '202cb962ac59075b964b07152d234b70', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`PID`,`DOCID`),
  ADD KEY `DOCID` (`DOCID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`BOR_NO`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`BOR_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `COPYNO` (`COPYNO`),
  ADD KEY `BID` (`BID`),
  ADD KEY `RID` (`RID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `chairs`
--
ALTER TABLE `chairs`
  ADD PRIMARY KEY (`PID`,`DOCID`),
  ADD KEY `DOCID` (`DOCID`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`COPYNO`,`DOCID`,`BID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `BID` (`BID`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `PUBLISHERID` (`PUBLISHERID`);

--
-- Indexes for table `gedits`
--
ALTER TABLE `gedits`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`,`PID`),
  ADD KEY `ISSUE_NO` (`ISSUE_NO`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`),
  ADD KEY `ISSUE_NO` (`ISSUE_NO`),
  ADD KEY `ISSUE_NO_2` (`ISSUE_NO`);

--
-- Indexes for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `EDITOR` (`EDITOR`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PUBLISHERID`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RES_NO`);

--
-- Indexes for table `RESERVES`
--
ALTER TABLE `RESERVES`
  ADD PRIMARY KEY (`RESERVATION_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `RID` (`RID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `COPYNO` (`COPYNO`),
  ADD KEY `BID` (`BID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USERID`),
  ADD KEY `RID` (`RID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USERID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `authors_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `book` (`DOCID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `copy` (`DOCID`),
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`COPYNO`) REFERENCES `copy` (`COPYNO`),
  ADD CONSTRAINT `borrows_ibfk_4` FOREIGN KEY (`BID`) REFERENCES `copy` (`BID`),
  ADD CONSTRAINT `borrows_ibfk_5` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`);

--
-- Constraints for table `chairs`
--
ALTER TABLE `chairs`
  ADD CONSTRAINT `chairs_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `chairs_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `proceedings` (`DOCID`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `branch` (`BID`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`PUBLISHERID`) REFERENCES `publisher` (`PUBLISHERID`);

--
-- Constraints for table `gedits`
--
ALTER TABLE `gedits`
  ADD CONSTRAINT `gedits_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `journal_issue` (`DOCID`),
  ADD CONSTRAINT `gedits_ibfk_2` FOREIGN KEY (`ISSUE_NO`) REFERENCES `journal_issue` (`ISSUE_NO`),
  ADD CONSTRAINT `gedits_ibfk_3` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`);

--
-- Constraints for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD CONSTRAINT `journal_issue_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `journal_volume` (`DOCID`);

--
-- Constraints for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD CONSTRAINT `journal_volume_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`),
  ADD CONSTRAINT `journal_volume_ibfk_2` FOREIGN KEY (`EDITOR`) REFERENCES `person` (`PID`);

--
-- Constraints for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD CONSTRAINT `proceedings_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `RESERVES`
--
ALTER TABLE `RESERVES`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `RESERVATION` (`RES_NO`),
  ADD CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`DOCID`) REFERENCES `COPY` (`DOCID`),
  ADD CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`COPYNO`) REFERENCES `COPY` (`COPYNO`),
  ADD CONSTRAINT `reserves_ibfk_5` FOREIGN KEY (`BID`) REFERENCES `COPY` (`BID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
