-- --------------------------------------------------------
-- Host:                         212.1.215.42
-- Server version:               5.1.65-cll - MySQL Community Server (GPL)
-- Server OS:                    unknown-linux-gnu
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-10 09:45:09
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table cirashea_myphr.user
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `username` text COLLATE utf8_bin,
  `userpassword` text COLLATE utf8_bin,
  `userfname` text COLLATE utf8_bin,
  `userlname` text COLLATE utf8_bin,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table cirashea_myphr.user: 2 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userid`, `username`, `userpassword`, `userfname`, `userlname`) VALUES
	(1, 'gabmaster', 'mygab', 'Gabrielle', 'Vanderburgh'),
	(2, 'rwcost', 'mypassword', 'Bob', 'Cost');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for view cirashea_myphr.usermaxima
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `usermaxima` (
	`userid` INT(20) NULL DEFAULT NULL,
	`max(RAS)` INT(11) NULL DEFAULT NULL,
	`max(ldl)` INT(11) NULL DEFAULT NULL,
	`max(hdl)` INT(11) NULL DEFAULT NULL,
	`max(systolic)` INT(11) NULL DEFAULT NULL,
	`max(diastolic)` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- Dumping structure for view cirashea_myphr.usermeanima
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `usermeanima` (
	`userid` INT(20) NULL DEFAULT NULL,
	`avg(RAS)` DECIMAL(14,4) NULL DEFAULT NULL,
	`avg(ldl)` DECIMAL(14,4) NULL DEFAULT NULL,
	`avg(hdl)` INT(11) NULL DEFAULT NULL,
	`avg(systolic)` INT(11) NULL DEFAULT NULL,
	`avg(diastolic)` DECIMAL(14,4) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- Dumping structure for view cirashea_myphr.userminima
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `userminima` (
	`userid` INT(20) NULL DEFAULT NULL,
	`min(RAS)` INT(11) NULL DEFAULT NULL,
	`min(ldl)` INT(11) NULL DEFAULT NULL,
	`min(hdl)` INT(11) NULL DEFAULT NULL,
	`min(systolic)` INT(11) NULL DEFAULT NULL,
	`min(diastolic)` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- Dumping structure for table cirashea_myphr.user_vitals
CREATE TABLE IF NOT EXISTS `user_vitals` (
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(20) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `systolic` int(11) DEFAULT NULL,
  `diastolic` int(11) DEFAULT NULL,
  `hdl` int(11) DEFAULT NULL,
  `ldl` int(11) DEFAULT NULL,
  `RAS` int(11) DEFAULT NULL,
  `isOnMeds` int(11) DEFAULT NULL,
  `isSmoker` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isDiabetic` int(11) DEFAULT NULL,
  `isMale` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='table for patient vitals';

-- Dumping data for table cirashea_myphr.user_vitals: 94 rows
/*!40000 ALTER TABLE `user_vitals` DISABLE KEYS */;
INSERT INTO `user_vitals` (`key`, `userid`, `date_time`, `systolic`, `diastolic`, `hdl`, `ldl`, `RAS`, `isOnMeds`, `isSmoker`, `age`, `isDiabetic`, `isMale`) VALUES
	(1, 2, '2012-10-22 00:06:18', 110, 60, 45, 85, 4, 0, 0, 21, 0, 0),
	(2, 2, '2012-10-22 00:06:18', 110, 62, 45, 85, 4, 0, 0, 21, 0, 0),
	(3, 2, '2012-10-22 00:06:18', 110, 61, 45, 85, 4, 0, 0, 21, 0, 0),
	(4, 1, '2012-10-22 00:04:36', 122, 85, 45, 112, 8, 0, 0, 32, 0, 0),
	(5, 1, '2012-10-22 00:04:36', 120, 80, 50, 100, 20, 0, 0, 32, 0, 0),
	(104, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(103, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 0, 0, 72, 0, 1),
	(102, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 0, 0, 72, 0, 1),
	(101, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 0, 0, 72, 0, 1),
	(100, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 0, 0, 72, 0, 1),
	(99, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(98, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(97, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(96, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(95, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(94, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(93, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(92, 1, '0000-00-00 00:00:00', 80, 150, 66, 78, 30, 0, 0, 70, 0, 1),
	(91, 1, '0000-00-00 00:00:00', 80, 120, 40, 120, 1, 0, 0, 52, 0, 1),
	(105, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(106, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(107, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(108, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(109, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(110, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(111, 1, '0000-00-00 00:00:00', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(112, 1, '2012-11-13 07:49:53', 74, 73, 70, 71, 2, 1, 1, 72, 1, 1),
	(113, 0, '2012-11-13 10:02:08', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114, 0, '2012-11-13 10:02:12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115, 0, '2012-11-13 10:02:14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116, 0, '2012-11-13 10:02:15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117, 0, '2012-11-16 18:31:28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118, 1, '2012-11-19 18:50:38', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1),
	(119, 1, '2012-11-20 11:15:13', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(120, 1, '2012-11-20 11:34:07', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(121, 1, '2012-11-20 11:34:20', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(122, 1, '2012-11-20 11:35:10', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(123, 1, '2012-11-20 11:35:12', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(124, 1, '2012-11-20 11:35:13', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(125, 1, '2012-11-20 11:41:41', 0, 0, 0, 86, 0, 0, 0, 0, 0, 0),
	(126, 1, '2012-11-20 11:42:03', 0, 0, 0, 121, 0, 0, 0, 0, 0, 0),
	(127, 1, '2012-11-20 11:42:23', 0, 0, 0, 122, 0, 0, 0, 0, 0, 0),
	(128, 1, '2012-11-20 12:11:21', 0, 0, 0, 123, 0, 0, 0, 0, 0, 0),
	(129, 1, '2012-11-20 12:11:51', 0, 0, 0, 123, 0, 0, 0, 0, 0, 0),
	(130, 1, '2012-11-20 12:11:51', 0, 0, 0, 123, 0, 0, 0, 0, 0, 0),
	(131, 1, '2012-11-24 19:41:48', 80, 120, 56, 60, 0, 0, 0, 52, 0, 1),
	(132, 1, '2012-11-24 19:42:21', 80, 120, 100, 60, 0, 0, 0, 52, 0, 1),
	(133, 1, '2012-11-24 19:42:48', 80, 120, 58, 90, 0, 0, 0, 52, 0, 1),
	(134, 1, '2012-11-24 19:43:15', 80, 120, 58, 90, 0, 0, 0, 52, 0, 1),
	(135, 1, '2012-11-24 19:43:15', 80, 120, 58, 90, 0, 0, 0, 52, 0, 1),
	(136, 1, '2012-11-24 19:43:51', 80, 123, 58, 90, 0, 0, 0, 52, 0, 1),
	(137, 1, '2012-11-24 19:44:27', 80, 151, 58, 90, 0, 0, 0, 52, 0, 1),
	(138, 1, '2012-11-29 21:10:25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(139, 0, '2012-12-03 00:28:14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(140, 1, '2012-12-03 11:38:40', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(141, 1, '2012-12-03 11:51:31', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142, 1, '2012-12-03 12:39:14', 5, 55, 55, 5, 2, 1, 1, 55, 1, 1),
	(143, 1, '2012-12-03 12:39:30', 5, 55, 55, 5, 2, 1, 1, 55, 1, 1),
	(144, 1, '2012-12-04 08:33:47', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(145, 1, '2012-12-04 08:39:50', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146, 1, '2012-12-04 08:40:18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(147, 1, '2012-12-04 08:41:43', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(148, 1, '2012-12-04 09:48:03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(149, 1, '2012-12-04 09:48:33', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(150, 1, '2012-12-04 09:49:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151, 1, '2012-12-04 09:53:56', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152, 1, '2012-12-04 09:55:21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153, 1, '2012-12-04 09:58:13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(154, 1, '2012-12-04 10:00:04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(155, 1, '2012-12-04 10:02:33', 80, 120, 70, 120, 0, 0, 0, 30, 0, 1),
	(156, 1, '2012-12-04 10:03:30', 80, 120, 70, 120, 0, 0, 0, 30, 0, 1),
	(157, 1, '2012-12-04 10:04:33', 80, 140, 150, 40, 0, 1, 1, 30, 1, 1),
	(158, 1, '2012-12-04 10:05:12', 80, 140, 150, 40, 0, 1, 1, 30, 1, 1),
	(159, 1, '2012-12-04 17:23:46', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160, 1, '2012-12-04 17:24:17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161, 1, '2012-12-04 17:24:40', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(162, 1, '2012-12-04 17:34:43', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163, 1, '2012-12-04 17:43:33', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(164, 1, '2012-12-04 18:05:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(165, 1, '2012-12-04 18:08:33', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(166, 1, '2012-12-04 18:08:38', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(167, 1, '2012-12-04 18:09:34', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(168, 1, '2012-12-05 15:00:05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(169, 1, '2012-12-05 15:00:20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(170, 1, '2012-12-05 15:08:28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(171, 0, '2012-12-05 15:11:46', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(172, 1, '2012-12-05 15:12:19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(173, 2, '2012-12-05 15:13:05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(174, 0, '2012-12-05 15:23:50', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(175, 0, '2012-12-05 15:24:46', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(176, 0, '2012-12-05 15:27:12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(177, 0, '2012-12-05 15:34:13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(178, 1, '2012-12-05 15:34:30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(179, 0, '2012-12-05 15:36:25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `user_vitals` ENABLE KEYS */;


-- Dumping structure for view cirashea_myphr.usermaxima
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `usermaxima`;
CREATE ALGORITHM=UNDEFINED DEFINER=`cirashea_rwcost`@`174.102.42.96` SQL SECURITY DEFINER VIEW `cirashea_myphr`.`usermaxima` AS select `cirashea_myphr`.`user_vitals`.`userid` AS `userid`,max(`cirashea_myphr`.`user_vitals`.`RAS`) AS `max(RAS)`,max(`cirashea_myphr`.`user_vitals`.`ldl`) AS `max(ldl)`,max(`cirashea_myphr`.`user_vitals`.`hdl`) AS `max(hdl)`,max(`cirashea_myphr`.`user_vitals`.`systolic`) AS `max(systolic)`,max(`cirashea_myphr`.`user_vitals`.`diastolic`) AS `max(diastolic)` from `cirashea_myphr`.`user_vitals` group by `cirashea_myphr`.`user_vitals`.`userid`;


-- Dumping structure for view cirashea_myphr.usermeanima
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `usermeanima`;
CREATE ALGORITHM=UNDEFINED DEFINER=`cirashea_rwcost`@`174.102.42.96` SQL SECURITY DEFINER VIEW `cirashea_myphr`.`usermeanima` AS select `cirashea_myphr`.`user_vitals`.`userid` AS `userid`,avg(`cirashea_myphr`.`user_vitals`.`RAS`) AS `avg(RAS)`,avg(`cirashea_myphr`.`user_vitals`.`ldl`) AS `avg(ldl)`,max(`cirashea_myphr`.`user_vitals`.`hdl`) AS `avg(hdl)`,max(`cirashea_myphr`.`user_vitals`.`systolic`) AS `avg(systolic)`,avg(`cirashea_myphr`.`user_vitals`.`diastolic`) AS `avg(diastolic)` from `cirashea_myphr`.`user_vitals` group by `cirashea_myphr`.`user_vitals`.`userid`;


-- Dumping structure for view cirashea_myphr.userminima
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `userminima`;
CREATE ALGORITHM=UNDEFINED DEFINER=`cirashea_rwcost`@`174.102.42.96` SQL SECURITY DEFINER VIEW `cirashea_myphr`.`userminima` AS select `cirashea_myphr`.`user_vitals`.`userid` AS `userid`,min(`cirashea_myphr`.`user_vitals`.`RAS`) AS `min(RAS)`,min(`cirashea_myphr`.`user_vitals`.`ldl`) AS `min(ldl)`,max(`cirashea_myphr`.`user_vitals`.`hdl`) AS `min(hdl)`,max(`cirashea_myphr`.`user_vitals`.`systolic`) AS `min(systolic)`,min(`cirashea_myphr`.`user_vitals`.`diastolic`) AS `min(diastolic)` from `cirashea_myphr`.`user_vitals` group by `cirashea_myphr`.`user_vitals`.`userid`;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
