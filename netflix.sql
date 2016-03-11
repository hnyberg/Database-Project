-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 11 mars 2016 kl 12:02
-- Serverversion: 10.1.10-MariaDB
-- PHP-version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `netflix`
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
