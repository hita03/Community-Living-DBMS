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
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `sid` char(4) NOT NULL,
  `month` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`sid`, `month`) VALUES
('S001', 'NOV'),
('S002', 'NOV'),
('S003', 'NOV'),
('S004', 'NOV'),
('S005', 'NOV'),
('S006', 'NOV'),
('S007', 'NOV'),
('S008', 'NOV'),
('S009', 'NOV'),
('S010', 'NOV');
COMMIT;

