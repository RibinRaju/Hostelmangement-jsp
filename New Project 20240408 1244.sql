-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.11-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema myhostel
--

CREATE DATABASE IF NOT EXISTS myhostel;
USE myhostel;

--
-- Definition of table `residentials`
--

DROP TABLE IF EXISTS `residentials`;
CREATE TABLE `residentials` (
  `res_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `res_name` varchar(45) NOT NULL,
  `res_phNo` decimal(10,0) NOT NULL,
  `res_Address` varchar(225) NOT NULL,
  `res_username` varchar(45) NOT NULL,
  `res_password` varchar(45) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `residentials`
--

/*!40000 ALTER TABLE `residentials` DISABLE KEYS */;
INSERT INTO `residentials` (`res_id`,`res_name`,`res_phNo`,`res_Address`,`res_username`,`res_password`) VALUES 
 (101,'Abin Wilson ','8698598477','abin bhavan,padamaghal allapuzha','abin','abin01'),
 (102,'Abhishek james','8869575868','abhishek bhavn  kalllumtazham,palakkad','abhishek','abhishek01'),
 (105,'RibinRaju','9072906518','Panikkarazhikathu veedu\r\nMylomkulam\r\nPuthoor (post office)','ribin','ribin01'),
 (106,'ciril','8921099479','ciril bhavan','ciril','ciril01'),
 (107,'hamal','9745805295','hamal bhavan','hamal','hamal01'),
 (108,'anju','9745805295','anju bhavan','anju','anj01'),
 (109,'Arya krishna','9745805295','arya bhavan','arya','arya01');
/*!40000 ALTER TABLE `residentials` ENABLE KEYS */;


--
-- Definition of table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `res_id` int(10) unsigned DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `rentAmount` float DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `res_id` FOREIGN KEY (`res_id`) REFERENCES `residentials` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`res_id`,`join_date`,`leave_date`,`rentAmount`) VALUES 
 (1,101,'2023-09-04','2024-09-04',40000),
 (2,102,'2023-08-19','2024-08-19',41000),
 (3,NULL,NULL,NULL,NULL),
 (4,105,'2024-04-10','2024-04-20',3500),
 (5,107,'2024-04-11','2024-04-13',700),
 (6,NULL,NULL,NULL,NULL),
 (7,106,'2024-04-04','2024-04-27',8050),
 (8,NULL,NULL,NULL,NULL),
 (9,109,'2024-04-06','2024-04-11',1750),
 (10,NULL,NULL,NULL,NULL),
 (11,108,'2024-04-13','2024-04-29',5600);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
