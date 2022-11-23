
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
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `sid` char(4) NOT NULL,
  `tid` char(4) DEFAULT NULL,  
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `shift` int(1) DEFAULT 1,
  `type` varchar(15) NOT NULL,
  `password` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- housekeeping(H), security(S), manager(M), maintainence()- plumber and electrician

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`sid`, `tid`, `fname`, `lname`, `dob`, `shift`, `type`,`password`) VALUES
('S001', 'T111', 'Gopal', 'Murthy', '1985-06-12', 1,'plumber','1234'),
('S002', 'T222', 'Imtiaz', 'Ali', '1989-01-09', 1,'electrician','1234'),
('S003', 'T333', 'Abhishekh','Srinivasa', '1999-01-12', 1, 'housekeeping','1234'),
('S004', NULL, 'Sampoorna ', 'K', '1992-01-12', 1,'housekeeping','1234'),
('S005', NULL, 'Manjumma ', 'Kumari', '1990-02-10',1, 'housekeeping','1234'),
('S006', NULL, 'Madhu', 'Kishore', '1980-01-01',1, 'housekeeping','1234'),
('S007', NULL, 'Radha', 'Gopalchand', '1991-09-12',1, 'housekeeping','1234'),
('S008', NULL, 'Abdul', 'Mukit', '1986-01-03',1, 'security','1234'),
('S009', NULL, 'Ranjit', 'Kumar', '1996-01-12',2, 'security','1234'),
('S010', NULL, 'Sampath', 'Kumar', '1996-01-12',2, 'supervisor','1234');
COMMIT;