-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2021 at 01:46 AM
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

--
-- Dumping data for table `AUTHORS`
--

INSERT INTO `AUTHORS` (`PID`, `DOCID`) VALUES
(45, 12),
(46, 12),
(47, 12);

-- --------------------------------------------------------

--
-- Table structure for table `BOOK`
--

CREATE TABLE `BOOK` (
  `DOCID` int NOT NULL,
  `ISBN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BOOK`
--

INSERT INTO `BOOK` (`DOCID`, `ISBN`) VALUES
(12, 'ISBN1');

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

--
-- Dumping data for table `BRANCH`
--

INSERT INTO `BRANCH` (`BID`, `LNAME`, `LOCATION`) VALUES
(1, 'Branch1', 'BranchLocation1');

-- --------------------------------------------------------

--
-- Table structure for table `CHAIRS`
--

CREATE TABLE `CHAIRS` (
  `PID` int NOT NULL,
  `DOCID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CHAIRS`
--

INSERT INTO `CHAIRS` (`PID`, `DOCID`) VALUES
(37, 10),
(38, 10),
(39, 10),
(41, 11),
(42, 11),
(43, 11);

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

--
-- Dumping data for table `COPY`
--

INSERT INTO `COPY` (`COPYNO`, `DOCID`, `BID`, `POSITION`) VALUES
(1, 10, 1, 'A1B2C3');

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

--
-- Dumping data for table `DOCUMENT`
--

INSERT INTO `DOCUMENT` (`DOCID`, `TITLE`, `PDATE`, `PUBLISHERID`) VALUES
(8, 'Proceeding1', '2021-01-11', 10),
(9, 'Proceeding1', '2021-01-11', 11),
(10, 'Proceeding1', '2021-01-11', 12),
(11, 'Proceeding1', '2021-01-11', 13),
(12, 'Book1', '2021-01-05', 14),
(13, 'JournalVolume1', '2021-01-11', 16),
(14, 'JournalVolume1', '2021-01-11', 17),
(15, 'JournalVolume1', '2021-01-11', 18);

-- --------------------------------------------------------

--
-- Table structure for table `GEDITS`
--

CREATE TABLE `GEDITS` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `PID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `GEDITS`
--

INSERT INTO `GEDITS` (`DOCID`, `ISSUE_NO`, `PID`) VALUES
(13, 1, 50),
(13, 1, 51),
(14, 1, 55),
(14, 1, 56),
(15, 1, 60),
(15, 1, 61),
(13, 2, 52),
(13, 2, 53),
(14, 2, 57),
(14, 2, 58),
(15, 2, 62),
(15, 2, 63);

-- --------------------------------------------------------

--
-- Table structure for table `JOURNAL_ISSUE`
--

CREATE TABLE `JOURNAL_ISSUE` (
  `DOCID` int NOT NULL,
  `ISSUE_NO` int NOT NULL,
  `SCOPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `JOURNAL_ISSUE`
--

INSERT INTO `JOURNAL_ISSUE` (`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES
(13, 1, ''),
(13, 2, ''),
(14, 1, ''),
(14, 2, ''),
(15, 1, ''),
(15, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `JOURNAL_VOLUME`
--

CREATE TABLE `JOURNAL_VOLUME` (
  `DOCID` int NOT NULL,
  `VOLUME_NO` int DEFAULT NULL,
  `EDITOR` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `JOURNAL_VOLUME`
--

INSERT INTO `JOURNAL_VOLUME` (`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES
(13, 1, 49),
(14, 1, 54),
(15, 1, 59);

-- --------------------------------------------------------

--
-- Table structure for table `PERSON`
--

CREATE TABLE `PERSON` (
  `PID` int NOT NULL,
  `PNAME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `PERSON`
--

INSERT INTO `PERSON` (`PID`, `PNAME`) VALUES
(25, 'PersonName4'),
(26, 'PersonName5'),
(27, 'PersonName6'),
(28, 'PersonName7'),
(29, 'PersonName4'),
(30, 'PersonName5'),
(31, 'PersonName6'),
(32, 'PersonName7'),
(33, 'PersonName4'),
(34, 'PersonName5'),
(35, 'PersonName6'),
(36, 'PersonName7'),
(37, 'PersonName4'),
(38, 'PersonName5'),
(39, 'PersonName6'),
(40, 'PersonName7'),
(41, 'PersonName4'),
(42, 'PersonName5'),
(43, 'PersonName6'),
(44, 'PersonName7'),
(45, 'PersonName1'),
(46, 'PersonName2'),
(47, 'PersonName3'),
(48, 'PersonName8'),
(49, 'PersonName8'),
(50, 'PersonName9'),
(51, 'PersonName10'),
(52, 'PersonName11'),
(53, 'PersonName12'),
(54, 'PersonName8'),
(55, 'PersonName9'),
(56, 'PersonName10'),
(57, 'PersonName11'),
(58, 'PersonName12'),
(59, 'PersonName8'),
(60, 'PersonName9'),
(61, 'PersonName10'),
(62, 'PersonName11'),
(63, 'PersonName12');

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

--
-- Dumping data for table `PROCEEDINGS`
--

INSERT INTO `PROCEEDINGS` (`DOCID`, `CDATE`, `CLOCATION`, `CEDITOR`) VALUES
(8, '2021-01-02 00:00:00', 'Kearny', 32),
(9, '2021-01-02 00:00:00', 'Kearny', 36),
(10, '2021-01-02 00:00:00', 'Kearny', 40),
(11, '2021-01-02 00:00:00', 'Kearny', 44);

-- --------------------------------------------------------

--
-- Table structure for table `PUBLISHER`
--

CREATE TABLE `PUBLISHER` (
  `PUBLISHERID` int NOT NULL,
  `PUBNAME` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `PUBLISHER`
--

INSERT INTO `PUBLISHER` (`PUBLISHERID`, `PUBNAME`, `ADDRESS`) VALUES
(9, 'PublisherName2', 'PublisherAddress2'),
(10, 'PublisherName2', 'PublisherAddress2'),
(11, 'PublisherName2', 'PublisherAddress2'),
(12, 'PublisherName2', 'PublisherAddress2'),
(13, 'PublisherName2', 'PublisherAddress2'),
(14, 'PublisherName1', 'PublisherAddress1'),
(15, 'PublisherName3', 'PublisherAddress3'),
(16, 'PublisherName3', 'PublisherAddress3'),
(17, 'PublisherName3', 'PublisherAddress3'),
(18, 'PublisherName3', 'PublisherAddress3');

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
  `RESERVATION_NO` int NOT NULL,
  `DOCID` int NOT NULL,
  `COPYNO` int NOT NULL,
  `BID` int NOT NULL,
  `RID` int DEFAULT NULL
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
  ADD PRIMARY KEY (`RESERVATION_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `RID` (`RID`),
  ADD KEY `DOCID` (`DOCID`),
  ADD KEY `COPYNO` (`COPYNO`),
  ADD KEY `BID` (`BID`);

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
  MODIFY `BID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `DOCUMENT`
--
ALTER TABLE `DOCUMENT`
  MODIFY `DOCID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `PERSON`
--
ALTER TABLE `PERSON`
  MODIFY `PID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `PUBLISHER`
--
ALTER TABLE `PUBLISHER`
  MODIFY `PUBLISHERID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`BOR_NO`) REFERENCES `BORROWING` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `COPY` (`DOCID`),
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`COPYNO`) REFERENCES `COPY` (`COPYNO`),
  ADD CONSTRAINT `borrows_ibfk_4` FOREIGN KEY (`BID`) REFERENCES `COPY` (`BID`),
  ADD CONSTRAINT `borrows_ibfk_5` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`);

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
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `READER` (`RID`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `RESERVATION` (`RES_NO`),
  ADD CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`DOCID`) REFERENCES `COPY` (`DOCID`),
  ADD CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`COPYNO`) REFERENCES `COPY` (`COPYNO`),
  ADD CONSTRAINT `reserves_ibfk_5` FOREIGN KEY (`BID`) REFERENCES `COPY` (`BID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
