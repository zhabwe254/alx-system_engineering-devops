CREATE DATABASE IF NOT EXISTS `tyrell_corp`;
USE `tyrell_corp`;
CREATE TABLE IF NOT EXISTS `nexus6` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `nexus6` (`name`) VALUES ('Leon');
