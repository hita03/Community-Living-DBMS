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
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `oid` char(4) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `block` char(1) NOT NULL,
  `flat` int(3) NOT NULL,
  PRIMARY KEY(`oid`),
  KEY(`block`,`flat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`oid`, `email`, `fname`, `lname`, `block`,`flat`) VALUES
('O101', 'sh@gmail.com','Sheela','Reddy', 'A', 101),
('O102', 'udupa@gmail.com','Srihari','Udupa', 'B', 102),
('O603', 'dixit@gmail.com','Sheela','Dixit', 'C', 403),
('O104', 'ab@gmail.com','Anshu','Bharadwaj', 'A', 104),
('O105', 'arun@gmail.com','Arun','Kumar', 'B', 701),
('O106', 'snayar@gmail.com','Shradha','Nayar', 'C', 401),
('O107', 'ramk@gmail.com','Ram','Kapoor', 'A', 502),
('O777', 'manisha@gmail.com','Manisha','Solanki', 'A', 504),
('O985', 'bhartidev@gmail.com','Bharti','Devgan', 'B', 601),
('O487', 'pallavi@gmail.com','Pallavi','Ram', 'C', 602),
('O911', 'vk@gmail.com','Virat','Kohli', 'A', 603),
('O142', 'ali@gmail.com','Muhammed','Ali', 'B', 402),
('O307', 'msingh@gmail.com','Manmohan','Singh', 'C', 201),
('O327', 'nani@gmail.com','Urmil','Kalra', 'A', 203),
('O907', 'maamu@gmail.com','Kamal','Kalra', 'B', 702),
('O407', 'mam@gmail.com','Seema','Kalra', 'C', 801),
('O387', 'manju@gmail.com','Manju','Munjal', 'A', 802),
('O222', 'veer@gmail.com','Veer','Singh', 'B', 803),
('O892', 'manpreet@gmail.com','Manpreet','Kaur', 'C', 103),
('O841', 'preetkaur@gmail.com','Preet','Sinha', 'A', 101),
('O648', 'nsingh@gmail.com','Navneet','Singh', 'B', 202),
('O645', 'apdhil@gmail.com','AP','Dhillion', 'C', 703),
('O765', 'alka@gmail.com','Alka','Yagnik', 'C', 101);
COMMIT;