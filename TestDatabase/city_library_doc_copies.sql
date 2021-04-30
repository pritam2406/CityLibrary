-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2021 at 11:39 PM
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
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5);

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
(1, 'ISBN123456'),
(2, 'ISBN123'),
(3, 'ISBN123'),
(4, 'ISBN1234565'),
(5, 'ISBN12353');

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
(1, 'Branch1', 'BranchLocation1'),
(2, 'Branch2', 'BranchLocation2'),
(3, 'Branch3', 'BranchLocation3'),
(4, 'Branch4', 'BranchLocation4'),
(5, 'Branch5', 'BranchLocation5');

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
(4, 11),
(1, 12),
(4, 13);

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
(1, 1, 1, '00AB34'),
(1, 1, 2, '00AB31'),
(1, 2, 3, '00AB36'),
(1, 3, 1, '00AB31'),
(1, 4, 2, '00AB36'),
(1, 4, 5, '00AB36'),
(1, 5, 2, '00AB34'),
(1, 6, 2, '00CD34'),
(1, 6, 3, '00AB11'),
(1, 6, 5, '00AB39'),
(1, 7, 1, '00AB12'),
(1, 8, 2, '00AB12'),
(1, 9, 1, '00AB01'),
(1, 9, 2, '00AB45'),
(1, 11, 1, '00AB14'),
(1, 11, 2, '00AB45'),
(1, 11, 5, '00AB25'),
(1, 12, 4, '00AB32'),
(1, 13, 1, '00TY66'),
(1, 13, 3, '00CC34'),
(1, 13, 5, '00AB36'),
(2, 1, 1, '00AB34'),
(2, 1, 2, '00AB31'),
(2, 2, 3, '00AB36'),
(2, 3, 1, '00AB31'),
(2, 4, 2, '00AB36'),
(2, 4, 5, '00AB36'),
(2, 5, 2, '00AB34'),
(2, 6, 2, '00CD34'),
(2, 6, 3, '00AB11'),
(2, 6, 5, '00AB39'),
(2, 7, 1, '00AB12'),
(2, 8, 2, '00AB12'),
(2, 9, 2, '00AB45'),
(2, 11, 1, '00AB14'),
(2, 11, 2, '00AB45'),
(2, 11, 5, '00AB25'),
(2, 12, 4, '00AB32'),
(2, 13, 1, '00TY66'),
(2, 13, 3, '00CC34'),
(2, 13, 5, '00AB36'),
(3, 1, 2, '00AB31'),
(3, 2, 3, '00AB35'),
(3, 3, 1, '00AB31'),
(3, 4, 5, '00AB36'),
(3, 6, 2, '00CD34'),
(3, 6, 3, '00AB11'),
(3, 6, 5, '00AB39'),
(3, 8, 2, '00AB12'),
(3, 11, 1, '00AB14'),
(3, 11, 2, '00AB45'),
(3, 11, 5, '00AB25'),
(3, 13, 1, '00TY66'),
(3, 13, 5, '00AB36'),
(4, 6, 3, '00AB11'),
(4, 8, 2, '00AB12'),
(5, 8, 2, '00AB12'),
(6, 8, 2, '00AB78'),
(7, 8, 2, '00AB78');

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
(1, 'Book1', '2021-04-01', 1),
(2, 'Book2', '2021-04-08', 2),
(3, 'Book3', '2021-04-14', 3),
(4, 'Book4', '2021-03-30', 2),
(5, 'Book5', '2021-03-28', 1),
(6, 'Journal1', '2021-04-01', 1),
(7, 'Journal2', '2021-04-05', 2),
(8, 'Journal3', '2021-03-30', 2),
(9, 'Journal4', '2021-04-12', 4),
(10, 'Journal5', '2021-03-26', 2),
(11, 'Proceedings1', '2021-03-23', 2),
(12, 'Proceedings2', '2021-04-16', 4),
(13, 'Proceedings3', '2021-03-24', 1);

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

--
-- Dumping data for table `JOURNAL_VOLUME`
--

INSERT INTO `JOURNAL_VOLUME` (`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES
(6, 3, 3),
(7, 5, 3),
(8, 4, 3),
(9, 10, 3),
(10, 7, 2);

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
(1, 'Person1'),
(2, 'Person2'),
(3, 'Person3'),
(4, 'Person4'),
(5, 'Person5');

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
(11, '2021-04-08 00:00:00', 'ProceedingsLocation1', 2),
(12, '2021-04-15 00:00:00', 'ProceedingsLocation2', 3),
(13, '2021-02-28 00:00:00', 'ProceedingsLocation3', 2);

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
(1, 'Publisher1', 'PublisherAddress1'),
(2, 'Publisher2', 'PublisherAddress2'),
(3, 'Publisher3', 'PublisherAddress3'),
(4, 'Publisher4', 'PublisherAddress4'),
(5, 'Publisher5', 'PublisherAddress5');

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

--
-- Dumping data for table `READER`
--

INSERT INTO `READER` (`RID`, `RTYPE`, `RNAME`, `RADDRESS`, `PHONE_NO`) VALUES
(6, 1, 'Reader1', 'Reader Address 1', '123456'),
(7, 2, 'Reader2', 'Reader Address 2', '1234567'),
(8, 3, 'Reader3', 'Reader Address 3', '12345678'),
(9, 1, 'Reader4', 'Reader Address 4', '123456789'),
(10, 1, 'Reader5', 'Reader Address 5', '1234567890');

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
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`id`, `USER_MOBILE_NO`, `PASSWORD`, `RID`) VALUES
(6, '123456', '123456', 6),
(7, '1234567', '1234567', 7),
(8, '12345678', '12345678', 8),
(9, '123456789', '123456789', 9),
(10, '1234567890', '1234567890', 10);

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
  MODIFY `BID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `DOCUMENT`
--
ALTER TABLE `DOCUMENT`
  MODIFY `DOCID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `PERSON`
--
ALTER TABLE `PERSON`
  MODIFY `PID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PUBLISHER`
--
ALTER TABLE `PUBLISHER`
  MODIFY `PUBLISHERID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `READER`
--
ALTER TABLE `READER`
  MODIFY `RID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
