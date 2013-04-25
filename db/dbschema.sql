-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生日期: 2013 年 04 月 14 日 17:17
-- 伺服器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `agent_metrics`
--

-- --------------------------------------------------------

--
-- 表的結構 `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_account` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的結構 `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `company_title` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `marriage` tinyint(1) DEFAULT NULL,
  `child_boy` int(11) DEFAULT NULL,
  `child_girl` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_address` varchar(400) DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `fb_id` varchar(50) DEFAULT NULL,
  `identify_no` varchar(10) DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `company_category` int(11) DEFAULT NULL,
  `personality` varchar(1) DEFAULT NULL,
  `is_paying` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_customer` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

-- --------------------------------------------------------

--
-- 表的結構 `customer_evaluation`
--

CREATE TABLE IF NOT EXISTS `customer_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `income_monthly` double DEFAULT NULL,
  `age` double DEFAULT NULL,
  `marriage` double DEFAULT NULL,
  `dependent_count` double DEFAULT NULL,
  `known_time` double DEFAULT NULL,
  `contact_frequency` double DEFAULT NULL,
  `contact_difficulty` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_eval` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的結構 `customer_relationship`
--

CREATE TABLE IF NOT EXISTS `customer_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `relationship_id` int(11) NOT NULL,
  `related` int(11) NOT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_relationship` (`relationship_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的結構 `customer_tags`
--

CREATE TABLE IF NOT EXISTS `customer_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tag` varchar(15) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_tags` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- 表的結構 `customer_visit_history`
--

CREATE TABLE IF NOT EXISTS `customer_visit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(100) NOT NULL,
  `place` varchar(100) DEFAULT NULL,
  `detail` text,
  `customer_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的結構 `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_type` varchar(20) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `personal_target`
--

CREATE TABLE IF NOT EXISTS `personal_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `modify_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=205 ;

-- --------------------------------------------------------

--
-- 表的結構 `personal_target_item`
--

CREATE TABLE IF NOT EXISTS `personal_target_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的結構 `relationship`
--

CREATE TABLE IF NOT EXISTS `relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(30) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的結構 `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `detail` text,
  `customer_visit_history_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` TIMESTAMP DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_schedule_0` (`customer_visit_history_id`),
  KEY `idx_schedule` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_team` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `detail` text,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_transaction_0` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
