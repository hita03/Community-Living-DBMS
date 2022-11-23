SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
ALTER TABLE `resident`
  ADD KEY(`flat`,`block`);

ALTER TABLE `visitor`
  ADD PRIMARY KEY(`rid`,`name`),
  ADD CONSTRAINT `vistor_fk1` FOREIGN KEY(`rid`) references `resident`(`rid`),
  ADD CONSTRAINT `vistor_fk2` FOREIGN KEY(`flat`) references `resident`(`flat`),
  ADD CONSTRAINT `vistor_fk3` FOREIGN KEY(`block`) references `resident`(`block`);

ALTER TABLE `ticket`
  ADD PRIMARY KEY(`tid`),
  ADD CONSTRAINT `ticket_fk1` FOREIGN KEY(`rid`) references `resident`(`rid`),
  ADD CONSTRAINT `ticket_fk2` FOREIGN KEY(`flat`) references `resident`(`flat`),
  ADD CONSTRAINT `ticket_fk3` FOREIGN KEY(`block`) references `resident`(`block`);

ALTER TABLE `staff`
  ADD PRIMARY KEY(`sid`),
  ADD CONSTRAINT `staff_fk1` FOREIGN KEY(`tid`) references `ticket`(`tid`) ON DELETE CASCADE;

ALTER TABLE `attendance`
  ADD PRIMARY KEY(`sid`,`intime`),
  ADD CONSTRAINT `attendance_fk1` FOREIGN KEY(`sid`) references `staff`(`sid`) ON DELETE CASCADE;
 

ALTER TABLE `record`
  ADD PRIMARY KEY(`sid`,`month`),
  ADD CONSTRAINT `record_fk1` FOREIGN KEY(`sid`) references `staff`(`sid`) ON DELETE CASCADE;
COMMIT;  

