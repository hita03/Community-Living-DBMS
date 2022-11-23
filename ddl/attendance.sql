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
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `sid` char(4) NOT NULL,
  `intime` timestamp NOT NULL,
  `outtime` timestamp DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`sid`, `intime`, `outtime`) VALUES
('S010', '2022-11-01 08:08:48', NULL),
('S009', '2022-11-01 08:08:48', '2022-11-01 12:08:48'),
('S004', '2022-10-01 08:08:48', NULL),
('S008', '2022-11-01 08:08:48', NULL),
('S004', '2022-11-01 08:08:48', '2022-11-01 16:08:48'),
('S004', '2022-11-02 08:08:48', '2022-11-02 16:08:48'),
('S004', '2022-11-07 08:08:48', '2022-11-07 16:08:48'),
('S004', '2022-11-10 08:08:48', '2022-11-10 16:08:48'),
('S004', '2022-11-12 08:08:48', '2022-11-12 16:08:48'),
('S004', '2022-11-14 08:08:48', '2022-11-14 16:08:48'),
('S004', '2022-11-15 08:08:48', '2022-11-15 16:08:48'),
('S004', '2022-11-23 08:08:48', '2022-11-23 16:08:48'),
('S001', '2022-11-15 08:08:48', '2022-11-15 16:08:48'),
('S002', '2022-11-15 08:08:48', '2022-11-15 16:08:48'),
('S005', '2022-11-15 08:08:48', '2022-11-15 16:08:48'),
('S006', '2022-11-15 08:08:48', '2022-11-15 16:08:48');
COMMIT;

