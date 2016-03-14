-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 14 mars 2016 kl 11:12
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

--
-- Dumpning av Data i tabell `actorroles`
--

INSERT INTO `actorroles` (`id`, `name`, `titleID`, `actorID`) VALUES
(1, 'Francis Underwood', 1, 1),
(2, 'Peter Russo', 1, 2),
(3, 'Claire Underwood', 1, 3),
(4, 'Zoe Barnes', 1, 10),
(5, 'Doug Stamper', 1, 11),
(6, 'Remy Danton', 1, 100),
(7, 'Nick Hendricks', 2, 4),
(8, 'Dr. Julia Harris', 2, 17),
(9, 'Dave Harken', 2, 1),
(10, 'Lyn Cassady', 3, 9),
(11, 'Larry Hooper', 3, 1),
(12, 'Judd Altman', 4, 4),
(13, 'Paul Altman', 4, 2),
(14, 'Wendy Altman', 4, 99),
(15, 'Michael Bluth', 5, 4),
(16, 'Tony Wonder', 5, 7),
(17, 'Tobias Fünke', 5, 36),
(18, 'Ryan Bingham', 8, 9),
(19, 'Craig Gregory', 8, 4),
(20, 'Peter La Fleur', 9, 5),
(21, 'White Goodman', 9, 7),
(22, 'Kate Veatch', 9, 82),
(23, 'Derek Zoolander', 10, 7),
(24, 'Hansel', 10, 8),
(25, 'Mugato', 10, 6),
(26, 'Matilda Jeffries', 10, 58),
(27, 'Greg Focker', 11, 7),
(28, 'Kevin Rawley', 11, 8),
(29, 'Jack Byrnes', 11, 12),
(30, 'Billy', 12, 14),
(31, 'Colin Sullivan', 12, 13),
(32, 'Frank Costello', 12, 16),
(33, 'Dignam', 12, 20),
(34, 'Ellerby', 12, 89),
(35, 'Palmer Joss', 13, 23),
(36, 'Eleanor Arroway', 13, 40),
(37, 'Cooper', 14, 23),
(38, 'Professor Brand', 14, 28),
(39, 'Brand', 14, 24),
(40, 'Meg Altman', 15, 40),
(41, 'Travis Bickle', 16, 12),
(42, 'Iris', 16, 40),
(43, 'Jack Twist', 17, 21),
(44, 'Ennis Del Mar', 17, 22),
(45, 'Lureen Newsome', 17, 24),
(46, 'Alma', 17, 25),
(47, 'Alma Jr.', 17, 10),
(48, 'Joker', 18, 22),
(49, 'Bruce Wayne', 18, 31),
(50, 'Alfred', 18, 28),
(51, 'Micky Ward', 19, 20),
(52, 'Dicky Eklund', 19, 31),
(53, 'Alfred Borden', 20, 31),
(54, 'Cutter', 20, 28),
(55, 'Robert Angier', 20, 32),
(56, 'Teddy Daniels', 21, 14),
(57, 'Dolores', 21, 25),
(58, 'Chuck Aule', 21, 29),
(59, 'Wyat Bose', 22, 32),
(60, 'S', 22, 25),
(61, 'Justine Last', 23, 17),
(62, 'Holden Worther', 23, 21),
(63, 'Cheryl', 23, 52),
(64, 'Robert Graysmith', 24, 21),
(65, 'Inspector David Toschi', 24, 29),
(66, 'Paul Avery', 24, 30),
(67, 'Joel Barish', 25, 27),
(68, 'Patrick', 25, 35),
(69, 'Stan', 25, 29),
(70, 'Mary', 25, 42),
(71, 'Rob', 25, 36),
(72, 'Bruce Wayne', 26, 31),
(73, 'Alfred', 26, 28),
(74, 'Rachel Dawes', 26, 26),
(75, 'Joey Potter', 27, 26),
(76, 'Jen Lindley', 27, 25),
(77, 'Bob Harris', 28, 33),
(78, 'Charlotte', 28, 38),
(79, 'Kelly', 28, 37),
(80, 'Lashawn Malone', 17, 37),
(81, 'Nick Fury', 29, 34),
(82, 'Black Widow', 29, 38),
(83, 'Maria Hill', 29, 39),
(84, 'Silent Wolf', 30, 44),
(85, 'Yo Shu Lien', 30, 43),
(86, 'Wei Fang', 30, 45),
(87, 'Danny Ocean', 31, 9),
(88, 'Linus Caldwell', 31, 13),
(89, 'Gil', 32, 8),
(90, 'Ernest Hemmingway', 32, 2),
(91, 'Will Hunting', 33, 13),
(92, 'David Starsky', 34, 7),
(93, 'Ken Hutchinson', 34, 8),
(94, 'Reese Feldman', 34, 5),
(95, 'Kevin', 34, 4),
(96, 'Ben', 35, 12),
(97, 'Kelly', 35, 3),
(98, 'Robin Scherbatsky', 36, 39),
(99, 'Marshall Eriksen', 36, 19),
(100, 'Frank Abagnale Jr.', 37, 14),
(101, 'Carl Hanratty', 37, 15),
(102, 'Tom Ripley', 38, 13),
(103, 'Forrest Gump', 39, 15),
(104, 'Jenny Curran', 39, 3),
(105, 'Frank Gallagher', 40, 47),
(106, 'Adriana', 32, 46),
(107, 'Walter White', 41, 48),
(108, 'Hank Schrader', 41, 75),
(109, 'Rachel Green', 42, 17),
(110, 'Erica', 42, 37),
(111, 'Dexter Morgan', 43, 49),
(112, 'Debra Morgan', 43, 50),
(113, 'Angel Batista', 43, 51),
(114, 'Jack Bauer', 44, 84),
(115, 'Marianne Taylor', 44, 11),
(116, 'Aaron Pierce', 44, 85),
(117, 'Roger Stanton', 44, 98),
(118, 'Sherlock Holmes', 45, 53),
(119, 'Dr. John Watson', 45, 54),
(120, 'Doctor', 46, 55),
(121, 'Jerry Black', 46, 16),
(122, 'Kilgrave', 47, 56),
(123, 'Jessica Jones', 47, 57),
(124, 'Trish Walker', 47, 58),
(125, 'Groot', 48, 108),
(126, 'Rocket', 48, 94),
(127, 'Corpsman Dey', 48, 89),
(128, 'The Collector', 48, 88),
(129, 'Franky Four Fingers', 49, 88),
(130, 'Mickey O''''Neil', 49, 66),
(131, 'Booris The Blade', 49, 90),
(132, 'Detective Hatchner', 2, 76),
(133, 'Mike Ehrmantraut', 41, 76),
(134, 'Donnie Pritchett', 50, 76),
(135, 'FBI Deputy Director Max Adams', 43, 76),
(136, 'Brandon', 50, 77),
(137, 'Cliff', 42, 77),
(138, 'Larry Bloom', 6, 69),
(139, 'Galina ''''Red'''' Reznikov', 6, 67),
(140, 'Piper Chapman', 6, 68),
(141, 'Kimmy Schmidt', 7, 70),
(142, 'Jacqueline Voorhees', 7, 71),
(143, 'Le Loup', 7, 75),
(144, 'Marcia Clark', 7, 99),
(145, 'Deputy Warden McPherson', 21, 59),
(146, 'Arthur Leigh Allen', 24, 59),
(147, 'Jonathan McQuarry', 22, 60),
(148, 'Bob Wilton', 3, 60),
(149, 'Duane Bailey', 50, 36),
(150, 'Captain Miller', 51, 15),
(151, 'Sergeant Horvath', 51, 86),
(152, 'Private Mellish', 51, 78),
(153, 'Private Caparzo', 51, 108),
(154, 'Private Ryan', 51, 13),
(155, 'Jake Tyler Brigance', 52, 23),
(156, 'Carl Lee Hailey', 52, 34),
(157, 'D.A. Rufus Buckley', 52, 1),
(158, 'Freddie Lee Cobb', 52, 84),
(159, 'Grimes', 53, 60),
(160, 'McKnight', 53, 86),
(161, 'Sanderson', 53, 87),
(162, 'Matthews', 53, 85),
(163, 'Gabriel Casseus', 53, 93),
(164, 'Yurek', 53, 92),
(165, 'Brendan Harris', 66, 92),
(166, 'Jimmy Markum', 66, 62),
(167, 'Katie Markum', 66, 109),
(168, 'Fiona Gallagher', 40, 109),
(169, 'Major General Holtz', 3, 85),
(170, 'Bob Lee Swagger', 54, 20),
(171, 'Sarah Fenn', 54, 10),
(172, 'Jack Payne', 54, 91),
(173, 'Michael Sandor', 54, 90),
(174, 'Joel', 55, 4),
(175, 'Dean', 55, 72),
(176, 'Brian', 55, 107),
(177, 'Peter Klaven', 56, 18),
(178, 'Oswald Klaven', 56, 107),
(179, 'Sydney Fife', 56, 19),
(180, 'Eddie Morra', 57, 94),
(181, 'Carl Van Loon', 57, 12),
(182, 'Avery', 58, 94),
(183, 'Jennifer', 58, 95),
(184, 'Luke', 58, 96),
(185, 'Kofi', 58, 100),
(186, 'Al Cross', 58, 98),
(187, 'Noah', 59, 96),
(188, 'Allie', 59, 97),
(189, 'Inez', 32, 97),
(190, 'Brian Gilcrest', 67, 97),
(191, 'Tracy Woodside', 67, 97),
(192, 'Carson Welch', 67, 33),
(193, 'General Dixon', 67, 80),
(194, 'Regina George', 60, 97),
(195, 'Ms. Norbury', 60, 99),
(196, 'Mrs. George', 60, 105),
(197, 'Ron Burgundy', 61, 6),
(198, 'Veronica Corningstone', 61, 102),
(199, 'Brian Fantana', 61, 18),
(200, 'Brick Tamland', 61, 104),
(201, 'Arturo Mendes', 61, 7),
(202, 'Barry', 62, 104),
(203, 'Tim', 62, 18),
(204, 'Donna Jensen', 63, 101),
(205, 'Christine Montgomery', 63, 102),
(206, 'Ted Stewart', 63, 29),
(207, 'Co-Pilot Steve Bench', 63, 103),
(208, 'Beth', 64, 106),
(209, 'Janis Gold', 44, 106),
(210, 'Andy', 64, 18),
(211, 'Susie', 64, 105),
(212, 'Ben', 64, 94),
(213, 'Howard Hughes', 65, 14),
(214, 'Noah Dietrich', 65, 89),
(215, 'Juan Trippe', 65, 80),
(216, 'Errol Flynn', 65, 65),
(217, 'Will Colbert', 42, 66),
(218, 'Amy Green', 42, 102),
(219, 'Dr. Michael Mitchell', 42, 9),
(220, 'Eddie Menuek', 42, 78),
(221, 'Tomas', 42, 73),
(222, 'Richard Crosby', 42, 79),
(223, 'Jim Gordon', 18, 79),
(224, 'Jim Gordon', 26, 79),
(225, 'Parker', 42, 80),
(226, 'Sandy', 42, 81),
(227, 'Cole Ortiz', 44, 81),
(228, 'Bonnie', 42, 82),
(229, 'Gavin Mitchell', 42, 83),
(230, 'Sean Pierce', 40, 83),
(231, 'Captain Marty Lee', 24, 83),
(232, 'Mike Hannigan', 42, 18),
(233, 'Actor', 35, 110),
(234, 'Paul Stevens', 42, 110),
(235, 'Eric', 42, 62),
(236, 'Tommy', 42, 7),
(237, 'Charlie Wheeler', 42, 111),
(238, 'Wendy', 50, 111);

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
(58, 'Rachael', 'Taylor', 'female', 1984),
(59, 'John', 'Carroll Lynch', 'male', 1963),
(60, 'Ewan', 'McGregor', 'male', 1971),
(61, 'Kate', 'Winslet', 'female', 1975),
(62, 'Sean', 'Penn', 'male', 1960),
(63, 'Kristen', 'Stewart', 'female', 1990),
(64, 'Martin', 'Sheen', 'male', 1940),
(65, 'Jude', 'Law', 'male', 1972),
(66, 'Brad', 'Pitt', 'male', 1963),
(67, 'Kate', 'Mulgrew', 'female', 1955),
(68, 'Taylor', 'Schilling', 'female', 1984),
(69, 'Jason', 'Biggs', 'male', 1978),
(70, 'Jane', 'Krakowski', 'female', 1968),
(71, 'Ellie', 'Kemper', 'female', 1980),
(72, 'Ben', 'Affleck', 'male', 1972),
(73, 'Robin', 'Williams', 'male', 1951),
(74, 'Emma', 'Rossum', 'female', 2004),
(75, 'Dean', 'Norris', 'male', 1963),
(76, 'Jonathan', 'Banks', 'male', 1947),
(77, 'Eddie', 'McClintock', 'male', 1967),
(78, 'Adam', 'Goldberg', 'male', 1970),
(79, 'Gary Oldman', 'male', 'male', 1958),
(80, 'Alec', 'Baldwin', 'male', 1958),
(81, 'Freddie', 'Prinze Jr.', 'male', 1976),
(82, 'Christine', 'Taylor', 'female', 2004),
(83, 'Dermot', 'Mulroney', 'male', 1963),
(84, 'Kiefer', 'Sutherland', 'male', 1966),
(85, 'Glenn', 'Moreshower', 'male', 1959),
(86, 'Tom', 'Sizemore', 'male', 1961),
(87, 'William', 'Fitchner', 'male', 1956),
(88, 'Benicio', 'Del Toro', 'male', 1967),
(89, 'John', 'C. Reilly', 'male', 1965),
(90, 'Rade', 'Serbedzija', 'male', 1946),
(91, 'Elias', 'Koteas', 'male', 1961),
(92, 'Tom', 'Guiry', 'male', 1981),
(93, 'Gabriel', 'Casseus', 'male', 1972),
(94, 'Bradley', 'Cooper', 'male', 1975),
(95, 'Rose', 'Byrne', 'female', 1979),
(96, 'Ryan', 'Gosling', 'male', 1980),
(97, 'Rachel', 'McAdams', 'female', 1978),
(98, 'Harris', 'Yulin', 'male', 1937),
(99, 'Tina', 'Fey', 'female', 1970),
(100, 'Mahershala', 'Ali', 'male', 1974),
(101, 'Gwyneth', 'Paltrow', 'female', 1972),
(102, 'Christina', 'Applegate', 'female', 1971),
(103, 'Rob', 'Lowe', 'male', 1964),
(104, 'Steve', 'Carell', 'male', 1962),
(105, 'Amy', 'Poehler', 'female', 1971),
(106, 'Janeane', 'Garofalo', 'female', 1964),
(107, 'J.K.', 'Simmons', 'male', 1955),
(108, 'Vin', 'Diesel', 'male', 1967),
(109, 'Emmy', 'Rossum', 'female', 1986),
(110, 'Bruce', 'Willis', 'male', 1955),
(111, 'Aisha', 'Tyler', 'female', 1970);

-- --------------------------------------------------------

--
-- Tabellstruktur `directorroles`
--

CREATE TABLE `directorroles` (
  `id` int(11) NOT NULL,
  `titleID` int(4) DEFAULT NULL,
  `directorID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `directorroles`
--

INSERT INTO `directorroles` (`id`, `titleID`, `directorID`) VALUES
(1, 48, 50),
(2, 49, 51),
(3, 50, 52),
(4, 50, 53),
(5, 51, 31),
(6, 52, 54),
(7, 53, 55),
(8, 54, 56),
(9, 55, 57),
(10, 56, 58),
(11, 57, 59),
(12, 58, 43),
(13, 59, 44),
(14, 60, 45),
(15, 61, 46),
(16, 62, 47),
(17, 63, 48),
(18, 64, 49),
(19, 65, 13),
(20, 66, 63),
(21, 67, 60);

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

--
-- Dumpning av Data i tabell `directors`
--

INSERT INTO `directors` (`id`, `firstName`, `lastName`, `year`) VALUES
(1, 'John', 'David Coles', 1990),
(2, 'Sean', 'Anders', 1969),
(3, 'Grant', 'Heslov', 1963),
(4, 'Shawn', 'Levy', 1968),
(5, 'Ron', 'Howard', 1954),
(6, 'Jodie', 'Foster', 1962),
(7, 'Andrew', 'McCarthy', 1962),
(8, 'Jeff', 'Richmond', 1961),
(9, 'Jason', 'Reitman', 1977),
(10, 'Rawson', 'Marshall Thurber', 1975),
(11, 'Ben', 'Stiller', 1965),
(12, 'Paul', 'Weitz', 1965),
(13, 'Martin', 'Scorsese', 1942),
(14, 'Robert', 'Zemeckis', 1952),
(15, 'Christopher', 'Nolan', 1970),
(16, 'David', 'Fincher', 1962),
(17, 'Ang', 'Lee', 1954),
(18, 'David', 'O. Russel', 1958),
(19, 'Marcel', 'Langenegger', 1968),
(20, 'Miguel', 'Arteta', 1965),
(21, 'Michel', 'Gondry', 1963),
(22, 'Gregory', 'Prange', 1962),
(23, 'Sofia', 'Coppola', 1971),
(24, 'Joe', 'Johnston', 1950),
(25, 'Steven', 'Soderbergh', 1963),
(26, 'Woody', 'Allen', 1935),
(27, 'Gus', 'Van Sant', 1952),
(28, 'Todd', 'Phillips', 1970),
(29, 'Barry', 'Levinson', 1942),
(30, 'Pamela', 'Fryman', 1959),
(31, 'Steven', 'Spielberg', 1946),
(32, 'Anthony', 'MingHella', 1954),
(33, 'Mark', 'Mylod', 1956),
(34, 'Michelle', 'McLaren', 1965),
(35, 'Adam', 'Bernstein', 1960),
(36, 'Kevin', 'Bright', 1954),
(37, 'John', 'Dahl', 1956),
(38, 'Jon', 'Cassar', 1958),
(39, 'Paul', 'McGuigan', 1963),
(40, 'Coky', 'Giedroyc', 1962),
(41, 'Sean', 'Penn', 1960),
(42, 'Simon', 'Cellan Jones', 1963),
(43, 'Derek', 'Cianfrance', 1974),
(44, 'Nick', 'Cassavetes', 1959),
(45, 'Mark', 'Waters', 1964),
(46, 'Adam', 'McKay', 1968),
(47, 'Jay', 'Roach', 1957),
(48, 'Bruno', 'Barreto', 1955),
(49, 'David', 'Wain', 1969),
(50, 'James', 'Gunn', 1970),
(51, 'Guy', 'Ritchie', 1968),
(52, 'Steven', 'Levitan', 1990),
(53, 'Christopher', 'Lloyd', 1960),
(54, 'Joel', 'Schumacher', 1939),
(55, 'Ridley', 'Scott', 1937),
(56, 'Antoine', 'Fuqua', 1966),
(57, 'Mike', 'Judge', 1962),
(58, 'John', 'Hamburg', 1970),
(59, 'Neil', 'Burger', 1963),
(60, 'Cameron', 'Crowe', 1957),
(61, 'Brian', 'Helgeland', 1961),
(62, 'Dennis', 'Lehane', 1965),
(63, 'Clint', 'Eastwood', 1930);

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
(3, 'The Men Who Stare At Goats', 'Movie', 2009, 94, 1, 0),
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
(39, 'Forrest Gump', 'Movie', 1994, 152, 5, 0),
(40, 'Shameless', 'Series', 2013, 56, 4.5, 0),
(41, 'Breaking Bad', 'Series', 2013, 47, 3, 0),
(42, 'Friends', 'Series', 1994, 22, 5, 0),
(43, 'Dexter', 'Series', 2006, 53, 4, 0),
(44, '24', 'Series', 2001, 44, 4, 0),
(45, 'Sherlock', 'Series', 2010, 88, 5, 0),
(46, 'The Pledge', 'Movie', 2001, 124, 2, 0),
(47, 'Jessica Jones', 'Series', 2015, 52, 4, 1),
(48, 'Guardians Of The Galaxy', 'Movie', 2014, 121, 4.5, 0),
(49, 'Snatch', 'Movie', 2000, 104, 4, 0),
(50, 'Modern Family', 'Series', 2009, 22, 4, 0),
(51, 'Saving Private Ryan', 'Movie', 1998, 169, 5, 0),
(52, 'A Time To Kill', 'Movie', 1996, 149, 4.5, 0),
(53, 'Black Hawk Down', 'Movie', 2001, 144, 4, 0),
(54, 'Shooter', 'Movie', 2007, 124, 3, 0),
(55, 'Extract', 'Movie', 2009, 92, 3, 0),
(56, 'I Love You, Man', 'Movie', 2009, 105, 3, 0),
(57, 'Limitless', 'Movie', 2011, 105, 4, 0),
(58, 'The Place Beyond The Pines', 'Movie', 2012, 140, 3.5, 0),
(59, 'The Notebook', 'Movie', 2004, 123, 2.5, 0),
(60, 'Mean Girls', 'Movie', 2004, 107, 5, 0),
(61, 'Anchorman', 'Movie', 2004, 104, 3.5, 0),
(62, 'Dinner For Schmucks', 'Movie', 2010, 114, 3, 0),
(63, 'View From The Top', 'Movie', 2003, 87, 2.5, 0),
(64, 'Wet Hot American Summer', 'Movie', 2001, 97, 4, 0),
(65, 'The Aviator', 'Movie', 2004, 170, 3, 0),
(66, 'Mystic River', 'Movie', 2003, 138, 4, 0),
(67, 'Aloha', 'Movie', 2015, 104, 2, 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `writerroles`
--

CREATE TABLE `writerroles` (
  `id` int(11) NOT NULL,
  `titleID` int(4) DEFAULT NULL,
  `writerID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `writerroles`
--

INSERT INTO `writerroles` (`id`, `titleID`, `writerID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 4, 9),
(10, 5, 10),
(11, 6, 11),
(12, 6, 12),
(13, 7, 13),
(14, 7, 14),
(15, 8, 15),
(16, 8, 16),
(17, 9, 17),
(18, 10, 18),
(19, 47, 19),
(20, 43, 19),
(21, 11, 20),
(22, 11, 21),
(23, 12, 22),
(24, 12, 23),
(25, 13, 24),
(26, 13, 25),
(27, 26, 26),
(28, 26, 27),
(29, 18, 26),
(30, 18, 27),
(31, 14, 26),
(32, 14, 27),
(33, 20, 26),
(34, 20, 27),
(35, 15, 28),
(36, 16, 29),
(37, 17, 30),
(38, 17, 31),
(39, 19, 32),
(40, 19, 33),
(41, 21, 34),
(42, 21, 35),
(43, 22, 36),
(44, 23, 37),
(45, 24, 38),
(46, 24, 39),
(47, 25, 40),
(48, 25, 41),
(49, 26, 43),
(50, 18, 42),
(51, 26, 42),
(52, 18, 43),
(53, 27, 44),
(54, 28, 45),
(55, 29, 46),
(56, 29, 47),
(57, 30, 48),
(58, 30, 49),
(59, 31, 50),
(60, 31, 51),
(61, 31, 52),
(62, 31, 53),
(63, 31, 54),
(64, 32, 55),
(65, 33, 56),
(66, 33, 57),
(67, 34, 58),
(68, 34, 59),
(69, 34, 60),
(70, 35, 61),
(71, 36, 62),
(72, 36, 63),
(73, 37, 64),
(74, 38, 65),
(75, 38, 66),
(76, 39, 67),
(77, 39, 68),
(78, 40, 69),
(79, 40, 70),
(80, 37, 71),
(81, 41, 72),
(82, 42, 73),
(83, 42, 74),
(84, 43, 75),
(85, 44, 76),
(86, 44, 77),
(87, 45, 78),
(88, 45, 79),
(89, 46, 80),
(90, 46, 81),
(91, 48, 96),
(92, 48, 97),
(93, 49, 98),
(94, 50, 114),
(95, 50, 115),
(96, 51, 101),
(97, 52, 102),
(98, 52, 103),
(99, 53, 104),
(100, 53, 105),
(101, 54, 106),
(102, 54, 107),
(103, 55, 108),
(104, 56, 109),
(105, 56, 110),
(106, 57, 111),
(107, 57, 112),
(108, 58, 83),
(109, 58, 84),
(110, 59, 85),
(111, 59, 86),
(112, 60, 14),
(113, 60, 87),
(114, 61, 88),
(115, 61, 89),
(116, 62, 90),
(117, 62, 91),
(118, 63, 92),
(119, 64, 93),
(120, 64, 94),
(121, 65, 95),
(122, 67, 113),
(123, 66, 35),
(124, 66, 116);

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
(82, 'Melissa', 'Rosenberg', 1962),
(83, 'Derek', 'Cianfrance', 1974),
(84, 'Ben', 'Coccio', 1975),
(85, 'Jeremy', 'Leven', 1941),
(86, 'Jan', 'Sardi', NULL),
(87, 'Rosalind', 'Wisemen', 1969),
(88, 'Adam', 'McKay', 1968),
(89, 'Will', 'Ferrell', 1967),
(90, 'David', 'Guion', NULL),
(91, 'Michael', 'Handelman', NULL),
(92, 'Eric', 'Wald', NULL),
(93, 'David', 'Wain', 1969),
(94, 'Michael', 'Showalter', 1970),
(95, 'John', 'Logan', 1961),
(96, 'James', 'Gunn', 1970),
(97, 'Nicole', 'Perlman', NULL),
(98, 'Guy', 'Ritchie', 1968),
(99, 'Gail', 'Mancuso', 1958),
(100, 'Michael', 'Alan Spiller', 1961),
(101, 'Robert', 'Rodat', 1953),
(102, 'John', 'Grisham', 1955),
(103, 'Akiva', 'Goldsman', 1962),
(104, 'Mark', 'Bowden', 1951),
(105, 'Ken', 'Nolan', NULL),
(106, 'Jonathan', 'Lemkin', NULL),
(107, 'Stephen', 'Hunter', 1946),
(108, 'Mike', 'Judge', 1962),
(109, 'John', 'Hamburg', 1970),
(110, 'Larry', 'Levin', NULL),
(111, 'Leslie', 'Dixon', NULL),
(112, 'Alan', 'Glynn', NULL),
(113, 'Cameron', 'Crowe', 1957),
(114, 'Christopher', 'Lloyd', 1960),
(115, 'Steven', 'Levitan', 1962),
(116, 'Biran', 'Helgeland', 1961);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `actorroles`
--
ALTER TABLE `actorroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_actorRoles_title` (`titleID`),
  ADD KEY `FK_actorRoles_actor` (`actorID`);

--
-- Index för tabell `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `directorroles`
--
ALTER TABLE `directorroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_directorRoles_title` (`titleID`),
  ADD KEY `FK_directorRoles_director` (`directorID`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_genreConnections_title` (`titleID`),
  ADD KEY `FK_genreConnections_genre` (`genreID`);

--
-- Index för tabell `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `writerroles`
--
ALTER TABLE `writerroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_writerRoles_title` (`titleID`),
  ADD KEY `FK_writerRoles_writer` (`writerID`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT för tabell `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT för tabell `directorroles`
--
ALTER TABLE `directorroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT för tabell `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT för tabell `writerroles`
--
ALTER TABLE `writerroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT för tabell `writers`
--
ALTER TABLE `writers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `actorroles`
--
ALTER TABLE `actorroles`
  ADD CONSTRAINT `FK_actorRoles_actor` FOREIGN KEY (`actorID`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_actorRoles_title` FOREIGN KEY (`titleID`) REFERENCES `titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriktioner för tabell `directorroles`
--
ALTER TABLE `directorroles`
  ADD CONSTRAINT `FK_directorRoles_director` FOREIGN KEY (`directorID`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_directorRoles_title` FOREIGN KEY (`titleID`) REFERENCES `titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriktioner för tabell `genreconnections`
--
ALTER TABLE `genreconnections`
  ADD CONSTRAINT `FK_genreConnections_genre` FOREIGN KEY (`genreID`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_genreConnections_title` FOREIGN KEY (`titleID`) REFERENCES `titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriktioner för tabell `writerroles`
--
ALTER TABLE `writerroles`
  ADD CONSTRAINT `FK_writerRoles_title` FOREIGN KEY (`titleID`) REFERENCES `titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_writerRoles_writer` FOREIGN KEY (`writerID`) REFERENCES `writers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
