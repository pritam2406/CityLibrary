-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2021 at 08:11 AM
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
-- Table structure for table `AUTHORS`
--

CREATE TABLE `AUTHORS` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BOOK`
--

CREATE TABLE `BOOK` (
  `DOCID` int NOT NULL,
  `ISBN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BORROWING`
--

CREATE TABLE `BORROWING` (
  `BOR_NO` int NOT NULL,
  `BDTIME` datetime DEFAULT NULL,
  `RDTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BORROWS`
--

CREATE TABLE `BORROWS` (
  `BOR_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BRANCH`
--

CREATE TABLE `BRANCH` (
  `BID` int NOT NULL,
  `LNAME` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CHAIRS`
--

CREATE TABLE `CHAIRS` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `COPY`
--

CREATE TABLE `COPY` (
  `COPYNO` int NOT NULL,
  `DOCID` int NOT NULL,
  `BID` int NOT NULL,
  `POSITION` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DOCUMENT`
--

CREATE TABLE `DOCUMENT` (
  `DOCID` int NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `PDATE` date DEFAULT NULL,
  `PUBLISHERID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GEDITS`
--

CREATE TABLE `GEDITS` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `PID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `JOURNAL_ISSUE`
--

CREATE TABLE `JOURNAL_ISSUE` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `SCOPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `JOURNAL_VOLUME`
--

CREATE TABLE `JOURNAL_VOLUME` (
  `DOCID` int NOT NULL,
  `VOLUME_NO` int DEFAULT NULL,
  `EDITOR` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PERSON`
--

CREATE TABLE `PERSON` (
  `PID` int NOT NULL,
  `PNAME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PROCEEDINGS`
--

CREATE TABLE `PROCEEDINGS` (
  `DOCID` int NOT NULL,
  `CDATE` datetime DEFAULT NULL,
  `CLOCATION` varchar(255) DEFAULT NULL,
  `CEDITOR` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PUBLISHER`
--

CREATE TABLE `PUBLISHER` (
  `PUBLISHERID` int NOT NULL,
  `PUBNAME` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `READER`
--

CREATE TABLE `READER` (
  `RID` int NOT NULL,
  `RTYPE` int DEFAULT NULL,
  `RNAME` varchar(45) DEFAULT NULL,
  `RADDRESS` varchar(255) DEFAULT NULL,
  `PHONE_NO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RESERVATION`
--

CREATE TABLE `RESERVATION` (
  `RES_NO` int NOT NULL,
  `DTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RESERVES`
--

CREATE TABLE `RESERVES` (
  `RES_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `id` int NOT NULL,
  `USER_MOBILE_NO` varchar(15) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `RID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AUTHORS`
--
ALTER TABLE `AUTHORS`
  ADD PRIMARY KEY (`PID`,`DOCID`),
  ADD KEY `DOCID` (`DOCID`);

--
-- Indexes for table `BOOK`
--
ALTER TABLE `BOOK`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `BORROWING`
--
ALTER TABLE `BORROWING`
  ADD PRIMARY KEY (`BOR_NO`);

--
-- Indexes for table `BORROWS`
--
ALTER TABLE `BORROWS`
  ADD PRIMARY KEY (`BOR_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `COPYNO` (`COPYNO`),
  ADD KEY `BID` (`BID`),
  ADD KEY `RID` (`RID`);

--
-- Indexes for table `BRANCH`
--
ALTER TABLE `BRANCH`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `CHAIRS`
--
ALTER TABLE `CHAIRS`
  ADD PRIMARY KEY (`PID`,`DOCID`),
  ADD KEY `DOCID` (`DOCID`);

--
-- Indexes for table `COPY`
--
ALTER TABLE `COPY`
  ADD PRIMARY KEY (`COPYNO`,`DOCID`,`BID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `BID` (`BID`);

--
-- Indexes for table `DOCUMENT`
--
ALTER TABLE `DOCUMENT`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `PUBLISHERID` (`PUBLISHERID`);

--
-- Indexes for table `GEDITS`
--
ALTER TABLE `GEDITS`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`,`PID`),
  ADD KEY `ISSUE_NO` (`ISSUE_NO`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `JOURNAL_ISSUE`
--
ALTER TABLE `JOURNAL_ISSUE`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`),
  ADD KEY `ISSUE_NO` (`ISSUE_NO`);

--
-- Indexes for table `JOURNAL_VOLUME`
--
ALTER TABLE `JOURNAL_VOLUME`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `EDITOR` (`EDITOR`);

--
-- Indexes for table `PERSON`
--
ALTER TABLE `PERSON`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `PROCEEDINGS`
--
ALTER TABLE `PROCEEDINGS`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `CEDITOR` (`CEDITOR`);

--
-- Indexes for table `PUBLISHER`
--
ALTER TABLE `PUBLISHER`
  ADD PRIMARY KEY (`PUBLISHERID`);

--
-- Indexes for table `READER`
--
ALTER TABLE `READER`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `RESERVATION`
--
ALTER TABLE `RESERVATION`
  ADD PRIMARY KEY (`RES_NO`);

--
-- Indexes for table `RESERVES`
--
ALTER TABLE `RESERVES`
  ADD PRIMARY KEY (`RES_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `RID` (`RID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `COPYNO` (`COPYNO`),
  ADD KEY `BID` (`BID`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`USER_MOBILE_NO`),
  ADD KEY `RID` (`RID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BORROWING`
--
ALTER TABLE `BORROWING`
  MODIFY `BOR_NO` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BRANCH`
--
ALTER TABLE `BRANCH`
  MODIFY `BID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DOCUMENT`
--
ALTER TABLE `DOCUMENT`
  MODIFY `DOCID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PERSON`
--
ALTER TABLE `PERSON`
  MODIFY `PID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PUBLISHER`
--
ALTER TABLE `PUBLISHER`
  MODIFY `PUBLISHERID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `READER`
--
ALTER TABLE `READER`
  MODIFY `RID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RESERVATION`
--
ALTER TABLE `RESERVATION`
  MODIFY `RES_NO` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AUTHORS`
--
ALTER TABLE `AUTHORS`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`),
  ADD CONSTRAINT `authors_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `BOOK` (`DOCID`);

--
-- Constraints for table `BOOK`
--
ALTER TABLE `BOOK`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`);

--
-- Constraints for table `BORROWS`
--
ALTER TABLE `BORROWS`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`BOR_NO`) REFERENCES `BORROWING` (`BOR_NO`) ON DELETE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `COPY` (`DOCID`),
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`COPYNO`) REFERENCES `COPY` (`COPYNO`),
  ADD CONSTRAINT `borrows_ibfk_4` FOREIGN KEY (`BID`) REFERENCES `COPY` (`BID`),
  ADD CONSTRAINT `borrows_ibfk_5` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`) ON DELETE CASCADE;

--
-- Constraints for table `CHAIRS`
--
ALTER TABLE `CHAIRS`
  ADD CONSTRAINT `chairs_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`),
  ADD CONSTRAINT `chairs_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `PROCEEDINGS` (`DOCID`);

--
-- Constraints for table `COPY`
--
ALTER TABLE `COPY`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `BRANCH` (`BID`);

--
-- Constraints for table `DOCUMENT`
--
ALTER TABLE `DOCUMENT`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`PUBLISHERID`) REFERENCES `PUBLISHER` (`PUBLISHERID`);

--
-- Constraints for table `GEDITS`
--
ALTER TABLE `GEDITS`
  ADD CONSTRAINT `gedits_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `JOURNAL_ISSUE` (`DOCID`),
  ADD CONSTRAINT `gedits_ibfk_2` FOREIGN KEY (`ISSUE_NO`) REFERENCES `JOURNAL_ISSUE` (`ISSUE_NO`),
  ADD CONSTRAINT `gedits_ibfk_3` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`);

--
-- Constraints for table `JOURNAL_ISSUE`
--
ALTER TABLE `JOURNAL_ISSUE`
  ADD CONSTRAINT `journal_issue_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `JOURNAL_VOLUME` (`DOCID`);

--
-- Constraints for table `JOURNAL_VOLUME`
--
ALTER TABLE `JOURNAL_VOLUME`
  ADD CONSTRAINT `journal_volume_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`),
  ADD CONSTRAINT `journal_volume_ibfk_2` FOREIGN KEY (`EDITOR`) REFERENCES `PERSON` (`PID`);

--
-- Constraints for table `PROCEEDINGS`
--
ALTER TABLE `PROCEEDINGS`
  ADD CONSTRAINT `proceedings_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`),
  ADD CONSTRAINT `proceedings_ibfk_2` FOREIGN KEY (`CEDITOR`) REFERENCES `PERSON` (`PID`);

--
-- Constraints for table `RESERVES`
--
ALTER TABLE `RESERVES`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`RES_NO`) REFERENCES `RESERVATION` (`RES_NO`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`DOCID`) REFERENCES `COPY` (`DOCID`),
  ADD CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`COPYNO`) REFERENCES `COPY` (`COPYNO`),
  ADD CONSTRAINT `reserves_ibfk_5` FOREIGN KEY (`BID`) REFERENCES `COPY` (`BID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
