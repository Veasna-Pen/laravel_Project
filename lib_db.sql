/*
SQLyog Enterprise - MySQL GUI v8.18 
MySQL - 5.5.5-10.4.10-MariaDB : Database - lib_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lib_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `lib_db`;

/*Table structure for table `tbl_author` */

DROP TABLE IF EXISTS `tbl_author`;

CREATE TABLE `tbl_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_author` */

insert  into `tbl_author`(`id`,`author_name`,`create_date`) values (7,'errr','2022-09-14 21:37:16');

/*Table structure for table `tbl_book` */

DROP TABLE IF EXISTS `tbl_book`;

CREATE TABLE `tbl_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_book` */

insert  into `tbl_book`(`id`,`book_title`,`categoryId`,`authorId`,`status`,`create_date`) values (5,'Horo',4,6,6,'2022-09-07 22:36:57'),(6,'qww',4,7,7,'2022-09-14 21:37:46');

/*Table structure for table `tbl_brrow` */

DROP TABLE IF EXISTS `tbl_brrow`;

CREATE TABLE `tbl_brrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `borrow_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_brrow` */

/*Table structure for table `tbl_category` */

DROP TABLE IF EXISTS `tbl_category`;

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_category` */

insert  into `tbl_category`(`id`,`category_name`,`create_date`) values (4,'enchy','2022-09-07 22:16:46');

/*Table structure for table `tbl_class` */

DROP TABLE IF EXISTS `tbl_class`;

CREATE TABLE `tbl_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(220) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_class` */

/*Table structure for table `tbl_status` */

DROP TABLE IF EXISTS `tbl_status`;

CREATE TABLE `tbl_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(250) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_status` */

insert  into `tbl_status`(`id`,`status_name`,`create_date`) values (7,'gggg','2022-09-14 21:37:31');

/*Table structure for table `tbl_student` */

DROP TABLE IF EXISTS `tbl_student`;

CREATE TABLE `tbl_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_student` */

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  `verify_password` int(11) NOT NULL,
  `time_login` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_user` */

/*Table structure for table `vbook` */

DROP TABLE IF EXISTS `vbook`;

/*!50001 DROP VIEW IF EXISTS `vbook` */;
/*!50001 DROP TABLE IF EXISTS `vbook` */;

/*!50001 CREATE TABLE  `vbook`(
 `id` int(11) ,
 `book_title` varchar(255) ,
 `category_name` varchar(255) ,
 `author_name` varchar(255) ,
 `status_name` varchar(250) ,
 `create_date` timestamp 
)*/;

/*View structure for view vbook */

/*!50001 DROP TABLE IF EXISTS `vbook` */;
/*!50001 DROP VIEW IF EXISTS `vbook` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vbook` AS select `tbl_book`.`id` AS `id`,`tbl_book`.`book_title` AS `book_title`,`tbl_category`.`category_name` AS `category_name`,`tbl_author`.`author_name` AS `author_name`,`tbl_status`.`status_name` AS `status_name`,`tbl_book`.`create_date` AS `create_date` from (((`tbl_book` join `tbl_category` on(`tbl_book`.`categoryId` = `tbl_category`.`id`)) join `tbl_author` on(`tbl_book`.`authorId` = `tbl_author`.`id`)) join `tbl_status` on(`tbl_book`.`status` = `tbl_status`.`id`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
