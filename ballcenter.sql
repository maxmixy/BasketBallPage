-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 05:14 AM
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
-- Database: `ballcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `highlights`
--

CREATE TABLE `highlights` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `PlayerFName` varchar(100) NOT NULL,
  `PlayerLName` varchar(100) NOT NULL,
  `PlayerImage` varchar(200) NOT NULL,
  `VideoLink` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `PlayerID` int(11) NOT NULL,
  `PlayerImage` varchar(200) NOT NULL,
  `PlayerTeam` varchar(30) NOT NULL,
  `PlayerLName` varchar(100) NOT NULL,
  `PlayerFName` varchar(100) NOT NULL,
  `PlayerBDate` date NOT NULL,
  `PlayerPosition` varchar(20) NOT NULL,
  `PlayerWeight` float NOT NULL,
  `PlayerHeight` float NOT NULL,
  `PlayerJersey` int(11) NOT NULL,
  `PlayerPNumber` varchar(20) NOT NULL,
  `PlayerEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`PlayerID`, `PlayerImage`, `PlayerTeam`, `PlayerLName`, `PlayerFName`, `PlayerBDate`, `PlayerPosition`, `PlayerWeight`, `PlayerHeight`, `PlayerJersey`, `PlayerPNumber`, `PlayerEmail`) VALUES
(1, 'player1.jpg', 'Thunderhawks', 'Johnson', 'Ethan', '2000-05-14', 'Guard', 86, 190, 10, '1234567890', 'ethan.johnson@gmail.com'),
(2, 'player2.jpg', 'Thunderhawks', 'Smith', 'Jackson', '1998-11-21', 'Forward', 100, 201, 23, '9876543210', 'jackson.smith@yahoo.com'),
(3, 'player3.jpg', 'Stormbreakers', 'Davis', 'Mason', '1997-02-03', 'Center', 113, 213, 34, '5432167890', 'mason.davis@outlook.com'),
(4, 'player4.jpg', 'Stormbreakers', 'Brown', 'Logan', '2001-08-12', 'Guard', 82, 185, 2, '6789054321', 'logan.brown@gmail.com'),
(5, 'player5.jpg', 'Wildcats', 'Williams', 'Oliver', '1999-07-18', 'Forward', 104, 203, 45, '1293847560', 'oliver.williams@gmail.com'),
(6, 'player6.jpg', 'Wildcats', 'Wilson', 'Liam', '2000-03-15', 'Guard', 88, 193, 11, '6578492013', 'liam.wilson@gmail.com'),
(7, 'player7.jpg', 'Raptors', 'Martinez', 'Elijah', '2002-12-10', 'Center', 118, 208, 33, '9021837465', 'elijah.martinez@yahoo.com'),
(8, 'player8.jpg', 'Raptors', 'Anderson', 'James', '1998-09-05', 'Guard', 84, 188, 6, '7453829106', 'james.anderson@gmail.com'),
(9, 'player9.jpg', 'Skyhawks', 'Thomas', 'Lucas', '2001-04-23', 'Forward', 95, 198, 21, '3482901765', 'lucas.thomas@outlook.com'),
(10, 'player10.jpg', 'Skyhawks', 'Harris', 'Benjamin', '1999-06-11', 'Guard', 86, 193, 3, '7564901283', 'benjamin.harris@gmail.com'),
(11, 'player11.jpg', 'Panthers', 'Clark', 'Alexander', '2000-01-29', 'Forward', 102, 206, 12, '9843271056', 'alexander.clark@gmail.com'),
(12, 'player12.jpg', 'Panthers', 'Lewis', 'Samuel', '1997-05-06', 'Center', 109, 211, 50, '5623749108', 'samuel.lewis@gmail.com'),
(13, 'player13.jpg', 'Tornadoes', 'King', 'Henry', '2001-03-20', 'Guard', 82, 183, 7, '3198462750', 'henry.king@gmail.com'),
(14, 'player14.jpg', 'Tornadoes', 'Lee', 'Jacob', '1998-10-17', 'Forward', 97, 201, 32, '4729108653', 'jacob.lee@gmail.com'),
(15, 'player15.jpg', 'Mavericks', 'Wright', 'Gabriel', '1999-12-30', 'Guard', 91, 196, 5, '7185930426', 'gabriel.wright@yahoo.com'),
(16, 'player16.jpg', 'Mavericks', 'Walker', 'Michael', '2000-08-08', 'Center', 113, 216, 41, '6402958713', 'michael.walker@gmail.com'),
(17, 'player17.jpg', 'Falcons', 'Green', 'Caleb', '2002-02-15', 'Guard', 84, 188, 8, '3289140576', 'caleb.green@gmail.com'),
(18, 'player18.jpg', 'Falcons', 'Hall', 'Daniel', '1997-09-03', 'Forward', 100, 203, 18, '5720938641', 'daniel.hall@gmail.com'),
(19, 'player19.jpg', 'Titans', 'Perez', 'Nathan', '2000-06-28', 'Center', 111, 213, 15, '8193642057', 'nathan.perez@gmail.com'),
(20, 'player20.jpg', 'Titans', 'Adams', 'Matthew', '1999-11-19', 'Forward', 104, 206, 24, '4102957836', 'matthew.adams@gmail.com'),
(33, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(34, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(35, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(36, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(37, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(38, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(39, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(40, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(41, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(42, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com'),
(43, 'imgs/Jhin_0.jpg', 'Thunderhawks', 'Vilogue', 'Jhin', '2024-11-04', 'Power forward', 4, 4, 4, '0919-004-5161', 'test@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `playerstats`
--

CREATE TABLE `playerstats` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `PlayerFName` varchar(100) NOT NULL,
  `PlayerLName` varchar(100) NOT NULL,
  `GameID` int(11) NOT NULL,
  `PTS` int(11) NOT NULL DEFAULT 0,
  `FG` int(11) NOT NULL DEFAULT 0,
  `MFG` int(11) NOT NULL DEFAULT 0,
  `3PM` int(11) NOT NULL DEFAULT 0,
  `3PA` int(11) NOT NULL DEFAULT 0,
  `FT` int(11) NOT NULL DEFAULT 0,
  `MFT` int(11) NOT NULL DEFAULT 0,
  `OREB` int(11) NOT NULL DEFAULT 0,
  `DREB` int(11) NOT NULL DEFAULT 0,
  `REB` int(11) NOT NULL DEFAULT 0,
  `AST` int(11) NOT NULL DEFAULT 0,
  `TOV` int(11) NOT NULL DEFAULT 0,
  `STL` int(11) NOT NULL DEFAULT 0,
  `BLK` int(11) NOT NULL DEFAULT 0,
  `PF` int(11) NOT NULL DEFAULT 0,
  `FP` int(11) NOT NULL DEFAULT 0,
  `DD2` int(11) NOT NULL DEFAULT 0,
  `TD3` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playerstats`
--

INSERT INTO `playerstats` (`TeamID`, `TeamName`, `PlayerID`, `PlayerFName`, `PlayerLName`, `GameID`, `PTS`, `FG`, `MFG`, `3PM`, `3PA`, `FT`, `MFT`, `OREB`, `DREB`, `REB`, `AST`, `TOV`, `STL`, `BLK`, `PF`, `FP`, `DD2`, `TD3`) VALUES
(1, 'Thunderhawks', 1, 'Ethan', 'Johnson', 101, 15, 7, 5, 3, 7, 2, 1, 1, 3, 4, 6, 2, 2, 0, 3, 25, 0, 0),
(1, 'Thunderhawks', 1, 'Ethan', 'Johnson', 102, 18, 8, 6, 4, 9, 2, 0, 0, 2, 2, 5, 3, 3, 0, 4, 28, 0, 0),
(1, 'Thunderhawks', 2, 'Jackson', 'Smith', 101, 12, 5, 7, 1, 3, 1, 2, 2, 5, 7, 3, 4, 1, 1, 2, 21, 0, 0),
(1, 'Thunderhawks', 2, 'Jackson', 'Smith', 102, 20, 9, 8, 2, 4, 0, 1, 3, 6, 9, 4, 2, 2, 1, 3, 32, 1, 0),
(1, 'Thunderhawks', 43, 'Jhin', 'Vilogue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Stormbreakers', 3, 'Mason', 'Davis', 103, 8, 4, 3, 0, 1, 0, 1, 3, 7, 10, 2, 1, 0, 3, 1, 20, 1, 0),
(2, 'Stormbreakers', 3, 'Mason', 'Davis', 104, 14, 6, 5, 1, 2, 1, 1, 2, 8, 10, 3, 3, 1, 2, 3, 28, 1, 0),
(2, 'Stormbreakers', 4, 'Logan', 'Brown', 103, 19, 7, 6, 3, 6, 2, 1, 0, 2, 2, 7, 3, 2, 0, 1, 35, 0, 0),
(2, 'Stormbreakers', 4, 'Logan', 'Brown', 104, 21, 9, 5, 4, 8, 1, 1, 1, 3, 4, 8, 1, 1, 0, 2, 36, 0, 0),
(3, 'Wildcats', 5, 'Oliver', 'Williams', 105, 16, 6, 4, 2, 5, 2, 2, 2, 6, 8, 5, 2, 2, 1, 1, 30, 0, 0),
(3, 'Wildcats', 5, 'Oliver', 'Williams', 106, 14, 5, 6, 1, 3, 3, 0, 3, 8, 11, 4, 2, 1, 1, 2, 31, 1, 0),
(3, 'Wildcats', 6, 'Liam', 'Wilson', 105, 13, 5, 7, 2, 6, 1, 1, 1, 3, 4, 7, 3, 1, 0, 1, 25, 0, 0),
(3, 'Wildcats', 6, 'Liam', 'Wilson', 106, 16, 7, 6, 3, 8, 2, 0, 1, 2, 3, 8, 1, 3, 0, 1, 30, 0, 0),
(4, 'Raptors', 7, 'Lucas', 'Martinez', 107, 10, 4, 4, 1, 2, 0, 2, 2, 5, 7, 4, 2, 1, 0, 3, 18, 0, 0),
(4, 'Raptors', 7, 'Lucas', 'Martinez', 108, 12, 5, 6, 1, 3, 2, 1, 3, 6, 9, 5, 1, 1, 0, 2, 22, 0, 0),
(4, 'Raptors', 8, 'Henry', 'Garcia', 107, 14, 6, 5, 2, 4, 1, 1, 3, 4, 7, 3, 3, 0, 2, 1, 26, 0, 0),
(4, 'Raptors', 8, 'Henry', 'Garcia', 108, 20, 8, 7, 4, 7, 0, 1, 1, 3, 4, 4, 1, 2, 1, 3, 34, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `TeamLogo` varchar(200) NOT NULL,
  `TeamColor` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`TeamID`, `TeamName`, `TeamLogo`, `TeamColor`) VALUES
(1, 'Thunderhawks', 'imgs/thunderhawks_logo.png', '#FF4500'),
(2, 'Stormbreakers', 'imgs/stormbreakers_logo.png', '#1E90FF'),
(3, 'Wildcats', 'imgs/wildcats_logo.png', '#FFD700'),
(4, 'Raptors', 'imgs/raptors_logo.png', '#FF6347'),
(5, 'Skyhawks', 'imgs/skyhawks_logo.png', '#32CD32'),
(6, 'Tornadoes', 'imgs/tornadoes_logo.png', '#4682B4'),
(7, 'Mavericks', 'imgs/mavericks_logo.png', '#8B4513'),
(8, 'Panthers', 'imgs/panthers_logo.png', '#800080'),
(9, 'Falcons', 'imgs/falcons_logo.png', '#FF8C00'),
(10, 'Titans', 'imgs/titans_logo.png', '#FF0000');

-- --------------------------------------------------------

--
-- Table structure for table `teamstats`
--

CREATE TABLE `teamstats` (
  `TeamID` int(11) NOT NULL,
  `TeamLogo` varchar(200) NOT NULL,
  `TeamColor` varchar(7) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `TeamWins` int(11) NOT NULL,
  `TeamDraws` int(11) NOT NULL,
  `TeamLosses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teamstats`
--

INSERT INTO `teamstats` (`TeamID`, `TeamLogo`, `TeamColor`, `TeamName`, `TeamWins`, `TeamDraws`, `TeamLosses`) VALUES
(1, 'imgs/thunderhawks_logo.png', '#FF4500', 'Thunderhawks', 10, 2, 3),
(2, 'imgs/stormbreakers_logo.png', '#1E90FF', 'Stormbreakers', 8, 3, 4),
(3, 'imgs/wildcats_logo.png', '#FFD700', 'Wildcats', 12, 1, 2),
(4, 'imgs/raptors_logo.png', '#FF6347', 'Raptors', 9, 4, 2),
(5, 'imgs/skyhawks_logo.png', '#32CD32', 'Skyhawks', 7, 5, 3),
(6, 'imgs/tornadoes_logo.png', '#4682B4', 'Tornadoes', 11, 1, 3),
(7, 'imgs/mavericks_logo.png', '#8B4513', 'Maverick', 6, 2, 7),
(8, 'imgs/panthers_logo.png', '#800080', 'Panthers', 5, 3, 7),
(9, 'imgs/falcons_logo.png', '#FF8C00', 'Falcons', 8, 2, 5),
(10, 'imgs/titans_logo.png', '#FF0000', 'Titans', 9, 1, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`TeamID`,`VideoLink`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`PlayerID`);

--
-- Indexes for table `playerstats`
--
ALTER TABLE `playerstats`
  ADD PRIMARY KEY (`TeamID`,`PlayerID`,`GameID`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`TeamID`);

--
-- Indexes for table `teamstats`
--
ALTER TABLE `teamstats`
  ADD PRIMARY KEY (`TeamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
