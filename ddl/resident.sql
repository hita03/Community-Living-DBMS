
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mygate`
--

-- --------------------------------------------------------


--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `rid` char(4) NOT NULL,
  `fname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `is_owner` tinyint(1) DEFAULT 0,
  `dob` date,
  `block` char(1) NOT NULL,
  `flat` int(3) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT 'mygate',
  PRIMARY KEY(`rid`),
  KEY(`block`,`flat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resident`
--

INSERT INTO `resident` (`rid`, `email`, `fname`,`lname`,`is_owner`,`block`,`flat`,`password`,`dob`) VALUES
('R333', 'dsouza@gmail.com','Christon','DSouza',0, 'A', 204,'abcd','2001-08-08'),
('R444', 'bsubr@gmail.com','Bala','Subramanyan',0, 'B', 304,'1234','1999-01-12'),
('R555', 'namgyal@gmail.com','Namgyal','G', 0,'C', 604,'abcd','1999-01-12'),
('R757', 'jimmg@gmail.com','Jimmy','G', 0,'A', 704,'abcd','1985-06-12'),
('R666', 'ashraf@gmail.com','Ashraf','Muhammed',0, 'B', 804,'1234','1985-06-12'),
('R888', 'simmychahal@gmail.com','Simmy','Chahal',0, 'C', 904,'abcd','1989-01-09'),
('R999', 'dimplek@gmail.com','Dimple','Kapadia',0, 'A', 101,'1234','1989-01-09'),
('R901', 'sprakash@gmail.com','Sajan','Prakash',0, 'B', 102,'abcd','1999-01-12'),
('R244', 'pradeep@gmail.com','Pradeep','K',0, 'C', 403,'abcd','1999-01-12'),
('R267', 'zintapreity@gmail.com','Preity','Zinta',0, 'A', 701,'abcd','1999-01-12'),
('R273', 'chahatthakur@gmail.com','Chahat','Thakur', 0,'B', 401,'abcd','1992-01-12'),
('R297', 'kalrakamal@gmail.com','Kamalpreet','Kaur',0, 'C', 202,'abcd','1992-01-12'),
('O777', 'manisha@gmail.com','Manisha','Solanki',1, 'A', 505,'abcd','1992-01-12'),
('O985', 'bhartidev@gmail.com','Bharti','Devgan',1, 'B', 601,'1234','1980-01-01'),
('O487', 'pallavi@gmail.com','Pallavi','Ram',1, 'C', 602,'1234','1980-01-01'),
('O911', 'vk@gmail.com','Virat','Kohli',1, 'A', 603,'abcd','1980-01-01'),
('O142', 'ali@gmail.com','Muhammed','Ali',1, 'B', 402,'abcd','1991-09-12'),
('O307', 'msingh@gmail.com','Manmohan','Singh',1, 'C', 201,'abcd','1991-09-12'),
('O327', 'nani@gmail.com','Urmil','Kalra',1, 'A', 203,'abcd','1986-01-03'),
('O907', 'maamu@gmail.com','Kamal','Kalra',1, 'B', 702,'1234','1986-01-03'),
('O407', 'mam@gmail.com','Seema','Kalra',1, 'C', 801,'abcd','1986-01-03'),
('O387', 'manju@gmail.com','Manju','Munjal',1, 'A', 802,'abcd','1986-01-03'),
('O222', 'veer@gmail.com','Veer','Singh',1, 'B', 803,'abcd','1996-01-12'),
('O892', 'manpreet@gmail.com','Manpreet','Kaur',1, 'C', 103,'abcd','1996-01-12'),
('O841', 'preetkaur@gmail.com','Preet','Sinha',1, 'A', 101,'1234','1996-01-12'),
('O648', 'nsingh@gmail.com','Navneet','Singh',1, 'B', 202,'abcd','1990-02-10'),
('O645', 'apdhil@gmail.com','AP','Dhillion',1, 'C', 703,'abcd','1990-02-10'),
('O765', 'alka@gmail.com','Alka','Yagnik',1, 'C', 101,'1234','1990-02-10');
COMMIT;