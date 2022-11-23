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
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `rid` char(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phno` int(10) DEFAULT NULL,
  `type` char(1) DEFAULT NULL, 
  `block` char(1) NOT NULL,
  `flat` int(3) NOT NULL,
  `intime` timestamp DEFAULT NOW(),
  `outtime` timestamp DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- type of visitor: guest(G), visiting help(H), cab(C), daily help(D)


--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`rid`,`name`, `phno`, `block`, `flat`, `type`,`intime`,`outtime`) VALUES
('R267', 'Rakesh', '9986573000', 'A', 701,'C','2022-25-10 08:30:01','2022-25-10 08:45:01'),
('O307', 'Sarita', '9916573000', 'C', 201,'D', '2022-12-08 10:45:01','2022-12-08 11:45:00'),
('O841', 'Divyansh Ghosh', '8310860218','A' ,101, 'G', '2022-03-04 12:15:01','2022-03-04 13:30:01'),
('R666', 'Naresh Gadi', '9935473000', 'B', 804,'G','2022-03-04 12:30:01','2022-03-04 18:30:00');
COMMIT;

-- G guest
-- D domestic help
-- C cab
