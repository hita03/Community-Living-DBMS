
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `tid` char(4) NOT NULL,
  `rid` char(4) NOT NULL,
  `flat` int(3) NOT NULL,
  `block` char(1) NOT NULL,
  `is_resolved` tinyint(1) DEFAULT 0,
  `complaint` varchar(50) NOT NULL,
  `response` varchar(50) DEFAULT NULL,
  `date_generated` date
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- housekeeping(H), security(S), manager(M), maintainence()- plumber and electrician

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`tid`, `rid`, `block`, `flat`, `is_resolved`, `complaint`, `response`, `date_generated`) VALUES
('T111', 'R333','A',204, 0, 'MCB switch - light tripped. Check with electrician', NULL, '2022-10-27'),
('T222', 'R444','B',304, 1,'No water in kitchen taps', NULL, '2022-10-28'),
('T333', 'R555', 'C',604, 0,'Dry waste not collected today', NULL, '2022-10-26');
COMMIT;





