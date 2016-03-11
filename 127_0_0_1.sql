-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 11 mars 2016 kl 11:56
-- Serverversion: 10.1.10-MariaDB
-- PHP-version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `epic_rpg`
--
CREATE DATABASE IF NOT EXISTS `epic_rpg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `epic_rpg`;

DELIMITER $$
--
-- Procedurer
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetItemsByRace` (IN `inputRace` VARCHAR(32))  BEGIN 
SELECT CONCAT(c.fname, " ", c.lname) AS "ownerName", i.name AS "itemName" FROM items i
JOIN characters c
ON c.id = i.owner
WHERE race = inputRace;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellstruktur `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `fname` char(32) DEFAULT NULL,
  `lname` char(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `race` varchar(32) DEFAULT NULL,
  `class` varchar(32) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `characters`
--

INSERT INTO `characters` (`id`, `fname`, `lname`, `level`, `experience`, `race`, `class`, `birthdate`) VALUES
(1, 'Lord', 'Xedric', 33, 33043, 'Titan', '5', '1977-11-22'),
(2, 'Percy', 'Prancealot', 2, 2012, 'Human', NULL, '1994-03-01'),
(3, 'Magda', 'Skullcrusher', 12, 12666, 'Orc', '1', '1963-12-12'),
(4, 'Testo', 'Bonebreaker', 14, 14564, 'Orc', '1', '1961-12-10'),
(5, 'Sarena', 'Raoden', 31, 31989, 'Elf', '4', '1979-09-25'),
(6, 'Johno', 'the Horn', 66, 66605, 'Elf', '6', '1975-06-21'),
(7, 'Rand', 'al-Thor', 25, 25877, 'Human', '2', '1982-05-23'),
(8, 'Benny', 'Bonebreaker', 13, 13444, 'Orc', '1', '1958-01-01'),
(9, 'Tam', 'al-Thor', 50, 50978, 'Human', '1', '1962-08-12'),
(10, 'Danny', 'Dancealot', 3, 3569, 'Elf', NULL, '1994-02-15'),
(11, 'Gunnar', 'Skullcrusher', 28, 28945, 'Orc', '1', '1965-10-15'),
(12, 'Martin', 'Bonecrusher', 29, 29932, 'Orc', '1', '1966-08-23'),
(13, 'Neo', 'Andersson', 12, 12765, 'Orc', '1', '1958-01-01');

-- --------------------------------------------------------

--
-- Tabellstruktur `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'Warrior'),
(2, 'Adventurer'),
(3, 'Monk'),
(4, 'Magician'),
(5, 'Paladin'),
(6, 'Assassin');

-- --------------------------------------------------------

--
-- Tabellstruktur `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `items`
--

INSERT INTO `items` (`id`, `name`, `owner`) VALUES
(1, 'Heavy Club of Bone', 4),
(2, 'Spiky Club', 3),
(3, 'Fancy Club', 2),
(4, 'Fancy Boots of Prancing', 2),
(5, 'Leather Helmet', 4),
(6, 'Iron Helmet', 3),
(7, 'Heron Marked Sword', 7),
(8, 'Beard of Wisdom', 6),
(9, 'Longsword of Meyer', 1),
(10, 'Epic Item of Epicness', NULL),
(11, 'Fancy Pants', 2);

-- --------------------------------------------------------

--
-- Tabellstruktur `test2`
--

CREATE TABLE `test2` (
  `fnamn` varchar(32) DEFAULT NULL,
  `enamn` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `test2`
--

INSERT INTO `test2` (`fnamn`, `enamn`) VALUES
('Kalle', 'Anka'),
('Kajsa', 'Anka'),
('Knatte', 'Anka'),
('Fnatte', 'Anka'),
('Tjatte', 'Anka'),
('Knatte', 'Gris');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT för tabell `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT för tabell `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;--
-- Databas: `netflix`
--
CREATE DATABASE IF NOT EXISTS `netflix` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `netflix`;

-- --------------------------------------------------------

--
-- Tabellstruktur `actorroles`
--

CREATE TABLE `actorroles` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `titleID` int(4) DEFAULT NULL,
  `actorID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `firstName` varchar(32) DEFAULT NULL,
  `lastName` varchar(32) DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `actors`
--

INSERT INTO `actors` (`id`, `firstName`, `lastName`, `sex`, `year`) VALUES
(1, 'Kevin', 'Spacey', 'male', 1959),
(2, 'Corey', 'Stoll', 'male', 1976),
(3, 'Robin', 'Wright', 'female', 1966),
(4, 'Jason', 'Bateman', 'male', 1969),
(5, 'Vince', 'Vaughn', 'male', 1970),
(6, 'Will', 'Ferrell', 'male', 1967),
(7, 'Ben', 'Stiller', 'male', 1965),
(8, 'Owen', 'Wilson', 'male', 1968),
(9, 'George', 'Clooney', 'male', 1961),
(10, 'Kate', 'Mara', 'female', 1983),
(11, 'Michael', 'Kelly', 'male', 1969),
(12, 'Robert', 'De Niro', 'male', 1943),
(13, 'Matt', 'Damon', 'male', 1970),
(14, 'Leonardo', 'Dicaprio', 'male', 1974),
(15, 'Tom', 'Hanks', 'male', 1956),
(16, 'Jack', 'Nicholson', 'male', 1937),
(17, 'Jennifer', 'Aniston', 'female', 1969),
(18, 'Paul', 'Rudd', 'male', 1969),
(19, 'Jason', 'Segel', 'male', 1980),
(20, 'Mark', 'Wahlberg', 'male', 1971),
(21, 'Jake', 'Gyllenhaal', 'male', 1980),
(22, 'Heath', 'Ledger', 'male', 1979),
(23, 'Matthew', 'Mcconaughey', 'male', 1969),
(24, 'Anne', 'Hathaway', 'female', 1982),
(25, 'Michelle', 'Williams', 'female', 1980),
(26, 'Katie', 'Holmes', 'female', 1978),
(27, 'Jim', 'Carrey', 'male', 1962),
(28, 'Michael', 'Caine', 'male', 1933),
(29, 'Mark', 'Ruffalo', 'male', 1967),
(30, 'Robert', 'Downey jr', 'male', 1965),
(31, 'Christian', 'Bale', 'male', 1974),
(32, 'Hugh', 'Jackman', 'male', 1968),
(33, 'Bill', 'Murray', 'male', 1950),
(34, 'Samuel', 'L Jackson', 'male', 1948),
(35, 'Elijah', 'Wood', 'male', 1981),
(36, 'David', 'Cross', 'male', 1964),
(37, 'Anna', 'Faris', 'female', 1976),
(38, 'Scarlett', 'Johansson', 'female', 1984),
(39, 'Cobie', 'Smulders', 'female', 1982),
(40, 'Jodie', 'Foster', 'female', 1962),
(41, 'Kate', 'Winslet', 'female', 1975),
(42, 'Kirsten', 'Dunst', 'female', 1982),
(43, 'Michelle', 'Yeoh', 'female', 1962),
(44, 'Donnie', 'Yen', 'male', 1963),
(45, 'Harry', 'Shum jr', 'male', 1982),
(46, 'Marion', 'Cotillard', 'female', 1975),
(47, 'William', 'H. Macy', 'male', 1950),
(48, 'Bryan', 'Cranston', 'male', 1956),
(49, 'Michael', 'C. Hall', 'male', 1971),
(50, 'Jennifer', 'Carpenter', 'female', 1979),
(51, 'David', 'Zayas', 'male', 1962),
(52, 'Zooey', 'Deschanel', 'female', 1980),
(53, 'Benedict', 'Cumberbatch', 'male', 1976),
(54, 'Martin', 'Freeman', 'male', 1971),
(55, 'Helen', 'Mirren', 'female', 1945),
(56, 'David', 'Tennant', 'male', 1971),
(57, 'Krysten', 'Ritter', 'female', 1981),
(58, 'Rachael', 'Taylor', 'female', 1984);

-- --------------------------------------------------------

--
-- Tabellstruktur `directorroles`
--

CREATE TABLE `directorroles` (
  `id` int(11) NOT NULL,
  `titleID` int(4) DEFAULT NULL,
  `directorID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `firstName` varchar(32) DEFAULT NULL,
  `lastName` varchar(32) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Drama'),
(2, 'Comedy'),
(3, 'Military & War'),
(4, 'Satire'),
(5, 'Romantic'),
(6, 'Sports'),
(7, 'Thriller'),
(8, 'Psychilogical'),
(9, 'Sci-Fi & Fantasy'),
(10, 'Crime'),
(11, 'Action'),
(12, 'Superhero'),
(13, 'Independent'),
(14, 'Martial Arts'),
(15, 'Mystery'),
(16, 'Non-Fiction');

-- --------------------------------------------------------

--
-- Tabellstruktur `genreconnections`
--

CREATE TABLE `genreconnections` (
  `id` int(11) NOT NULL,
  `titleID` int(4) DEFAULT NULL,
  `genreID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `titles`
--

CREATE TABLE `titles` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `minutes` int(3) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `original` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `titles`
--

INSERT INTO `titles` (`id`, `name`, `type`, `year`, `minutes`, `grade`, `original`) VALUES
(1, 'House Of Cards', 'Series', 2013, 50, 5, 1),
(2, 'Horrible Bosses 2', 'Movie', 2014, 108, 1.5, 0),
(3, 'The Men WHo Stare At Goats', 'Movie', 2009, 94, 1, 0),
(4, 'This Is Where I Leave You', 'Movie', 2014, 103, 3, 0),
(5, 'Arrested Development', 'Series', 2013, 22, 4, 1),
(6, 'Orange Is The New Black', 'Series', 2003, 59, 5, 1),
(7, 'Unbreakable Kimmy Schmidt', 'Series', 2015, 30, 4.5, 1),
(8, 'Up In The Air', 'Movie', 2009, 109, 3, 0),
(9, 'Dodgeball', 'Movie', 2004, 92, 3.5, 0),
(10, 'Zoolander', 'Movie', 2001, 90, 3.5, 0),
(11, 'Little Fockers', 'Movie', 2010, 108, 2, 0),
(12, 'The Departed', 'Movie', 2006, 151, 4.5, 0),
(13, 'Contact', 'Movie', 1997, 150, 3, 0),
(14, 'Interstellar', 'Movie', 2014, 169, 4.5, 0),
(15, 'Panic Room', 'Movie', 2002, 112, 3, 0),
(16, 'Taxi Driver', 'Movie', 1976, 113, 3, 0),
(17, 'Brokeback Mountain', 'Movie', 2005, 128, 4, 0),
(18, 'The Dark Knight', 'Movie', 2008, 152, 5, 0),
(19, 'The Fighter', 'Movie', 2010, 110, 4, 0),
(20, 'The Prestige', 'Movie', 2006, 130, 4, 0),
(21, 'Shutter Island', 'Movie', 2010, 138, 4, 0),
(22, 'Deception', 'Movie', 2008, 102, 2, 0),
(23, 'The Good Girl', 'Movie', 2002, 89, 3, 0),
(24, 'Zodiac', 'Movie', 2007, 157, 4, 0),
(25, 'Eternal Sunshine Of The Spotless', 'Movie', 2004, 107, 4, 0),
(26, 'Batman Begins', 'Movie', 2005, 139, 4, 0),
(27, 'Dawsons Creek', 'Series', 1999, 60, 2, 0),
(28, 'Lost In Translation', 'Movie', 2003, 101, 2, 0),
(29, 'Captain America: The Winter Sold', 'Movie', 2014, 136, 4, 0),
(30, 'Crouching Tiger, Hidden Dragon: ', 'Movie', 2016, 100, 4, 1),
(31, 'Ocean''s Eleven', 'Movie', 2001, 116, 4, 0),
(32, 'Midnight In Paris', 'Movie', 2011, 93, 3, 0),
(33, 'Good Will Hunting', 'Movie', 1997, 126, 3, 0),
(34, 'Starsky And Hutch', 'Movie', 2004, 100, 2, 0),
(35, 'What Just Happened', 'Movie', 2007, 99, 1, 0),
(36, 'How I Met Your Mother', 'Series', 2005, 22, 4, 0),
(37, 'Catch Me If You Can', 'Movie', 2002, 141, 5, 0),
(38, 'The Talented Mr. Ripley', 'Movie', 1999, 138, 5, 0),
(39, 'Forest Gump', 'Movie', 1994, 152, 5, 0),
(40, 'Shameless', 'Series', 2013, 56, 4.5, 0),
(41, 'Breaking Bad', 'Series', 2013, 47, 3, 0),
(42, 'Friends', 'Series', 1994, 22, 5, 0),
(43, 'Dexter', 'Series', 2006, 53, 4, 0),
(44, '24', 'Series', 2001, 44, 4, 0),
(45, 'Sherlock', 'Series', 2010, 88, 5, 0),
(46, 'The Pledge', 'Movie', 2001, 124, 2, 0),
(47, 'Jessica Jones', 'Series', 2015, 52, 4, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `writerroles`
--

CREATE TABLE `writerroles` (
  `id` int(11) NOT NULL,
  `titleID` int(4) DEFAULT NULL,
  `writerID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `writers`
--

CREATE TABLE `writers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(32) DEFAULT NULL,
  `lastName` varchar(32) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `writers`
--

INSERT INTO `writers` (`id`, `firstName`, `lastName`, `year`) VALUES
(1, 'Andrew', 'Davies', 1936),
(2, 'Michael', 'Dobbs', 1948),
(3, 'Bill', 'Kennedy', NULL),
(4, 'Beau', 'Willimon', 1977),
(5, 'Sean', 'Anders', 1969),
(6, 'John', 'Morris', NULL),
(7, 'Peter', 'Straughan', 1968),
(8, 'Jon', 'Ronson', 1967),
(9, 'Jonathan', 'Tropper', 1970),
(10, 'Mitchell', 'Hurwitz', 1963),
(11, 'Jenji', 'Kohan', 1969),
(12, 'Sian', 'Heder', 1977),
(13, 'Robert', 'Carlock', 1973),
(14, 'Tina', 'Fey', 1970),
(15, 'Walter', 'Kirn', 1962),
(16, 'Jason', 'Reitman', 1977),
(17, 'Rawson', 'Marshall Thurber', 1975),
(18, 'Drake', 'Sather', 1959),
(19, 'Melissa', 'Rosenberg', 1962),
(20, 'John', 'Hamburg', 1970),
(21, 'Larry', 'Stuckey', NULL),
(22, 'William', 'Monahan', 1960),
(23, 'Alan', 'Mak', 1965),
(24, 'James', 'V. Hart', 1960),
(25, 'Michael', 'Goldenberg', 1965),
(26, 'Jonathan', 'Nolan', 1976),
(27, 'Christopher', 'Nolan', 1970),
(28, 'David', 'Koepp', 1963),
(29, 'Paul', 'Schrader', 1946),
(30, 'Annie', 'Proulx', 1935),
(31, 'Larry', 'McMurtry', 1936),
(32, 'Scott', 'Silver', 1964),
(33, 'Paul', 'Tamasy', NULL),
(34, 'Laeta', 'Kalogridis', 1965),
(35, 'Dennis', 'Lehane', 1965),
(36, 'Mark', 'Bomback', 1971),
(37, 'Mike', 'White', 1970),
(38, 'James', 'Vanderbilt', 1975),
(39, 'Robert', 'Graysmith', 1942),
(40, 'Charlie', 'Kaufman', 1972),
(41, 'Michael', 'Gondry', 1963),
(42, 'Bob', 'Kane', 1915),
(43, 'David', 'S. Goyer', 1965),
(44, 'Kevin', 'Williamson', 1965),
(45, 'Sofia', 'Coppola', 1971),
(46, 'Cristopher', 'Markus', NULL),
(47, 'Stephen', 'McFeely', NULL),
(48, 'John', 'Fusco', NULL),
(49, 'Du', 'Lu Wang', 1909),
(50, 'George', 'Clayton Johnson', 1929),
(51, 'Jack', 'Golden Russell', NULL),
(52, 'Harry', 'Brown', 1917),
(53, 'Charles', 'Lederer', 1911),
(54, 'Ted', 'Griffin', 1970),
(55, 'Woody', 'Allen', 1935),
(56, 'Matt', 'Damon', 1970),
(57, 'Ben', 'Affleck', 1972),
(58, 'William', 'Blinn', 1938),
(59, 'Stevie', 'Long', 1972),
(60, 'John', 'O''''Brien', 1960),
(61, 'Art', 'Linson', 1942),
(62, 'Carter', 'Bays', 1975),
(63, 'Craig', 'Thomas', 1942),
(64, 'Frank', 'Abagnale Jr.', 1948),
(65, 'Patricia', 'Highsmith', 1921),
(66, 'Anthony', 'Minghella', 1954),
(67, 'Winston', 'Groom', 1944),
(68, 'Eric', 'Roth', 1945),
(69, 'Paul', 'Abbott', 1960),
(70, 'John', 'Wells', 1956),
(71, 'Jeff', 'Nathanson', 1965),
(72, 'Vince', 'Gilligan', 1967),
(73, 'David', 'Crane', 1957),
(74, 'Marta', 'Kauffman', 1956),
(75, 'James', 'Manos Jr.', NULL),
(76, 'Robert', 'Cochran', 1955),
(77, 'Joel', 'Surnow', 1954),
(78, 'Mark', 'Gatiss', 1966),
(79, 'Steven', 'Moffat', 1961),
(80, 'Friedrich', 'Dürrenmatt', 1921),
(81, 'Jerzy', 'Kromolowski', 1953),
(82, 'Melissa', 'Rosenberg', 1962);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `actorroles`
--
ALTER TABLE `actorroles`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `directorroles`
--
ALTER TABLE `directorroles`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `genreconnections`
--
ALTER TABLE `genreconnections`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `writerroles`
--
ALTER TABLE `writerroles`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `writers`
--
ALTER TABLE `writers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `actorroles`
--
ALTER TABLE `actorroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT för tabell `directorroles`
--
ALTER TABLE `directorroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT för tabell `genreconnections`
--
ALTER TABLE `genreconnections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `titles`
--
ALTER TABLE `titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT för tabell `writerroles`
--
ALTER TABLE `writerroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `writers`
--
ALTER TABLE `writers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;--
-- Databas: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumpning av Data i tabell `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'templateEx', '{"quick_or_custom":"quick","what":"sql","structure_or_data_forced":"0","table_select[]":["characters","class","items","test2"],"table_structure[]":["characters","class","items","test2"],"table_data[]":["characters","class","items","test2"],"output_format":"sendit","filename_template":"@DATABASE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Struktur fÃ¶r tabell @TABLE@","latex_structure_continued_caption":"Struktur fÃ¶r tabell @TABLE@ (fortsÃ¤ttning)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"InnehÃ¥ll i tabell @TABLE@","latex_data_continued_caption":"InnehÃ¥ll i tabell @TABLE@ (fortsÃ¤ttning)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"structure_and_data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"structure_and_data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_create_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumpning av Data i tabell `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"netflix","table":"actorroles"},{"db":"netflix","table":"actors"},{"db":"epic_rpg","table":"characters"},{"db":"epic_rpg","table":"class"}]');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumpning av Data i tabell `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'epic_rpg', 'characters', '{"sorted_col":"`characters`.`id` ASC"}', '2016-03-09 09:31:41');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumpning av Data i tabell `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-03-07 12:43:40', '{"lang":"sv","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index för tabell `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index för tabell `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index för tabell `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index för tabell `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index för tabell `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index för tabell `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index för tabell `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index för tabell `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index för tabell `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index för tabell `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index för tabell `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index för tabell `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index för tabell `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT för tabell `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Databas: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
