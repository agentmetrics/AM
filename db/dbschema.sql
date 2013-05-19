-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生日期: 2013 年 04 月 25 日 15:24
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
DROP DATABASE `agent_metrics`;
CREATE DATABASE `agent_metrics` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `agent_metrics`;

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

--
-- 轉存資料表中的資料 `account`
--

INSERT INTO `account` (`id`, `account`, `password`, `name`, `title`, `email`, `permission`, `team_id`, `group_id`, `create_time`, `modify_time`, `delete_time`, `creator`, `modifier`) VALUES
(1, 'chriss', '12345678', '李宗翰', 'title', 'chriss1008@msn.com', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'atenza', '701008', '李宗翰', 'title', 'atenza.lee@gmail.com', NULL, 1, 1, '1359358622', NULL, NULL, NULL, NULL),
(6, 'atenza', '701008', '李宗翰', '<script>alert(''hello', 'atenza.lee@gmail.comaa', NULL, 1, 1, '1359630330', NULL, NULL, NULL, NULL);

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

--
-- 轉存資料表中的資料 `customer`
--

INSERT INTO `customer` (`id`, `name`, `cellphone`, `address`, `telephone`, `company_title`, `email`, `birthday`, `marriage`, `child_boy`, `child_girl`, `note`, `company_name`, `company_address`, `company_phone`, `gender`, `agent_id`, `create_time`, `modify_time`, `delete_time`, `creator`, `modifier`, `fb_id`, `identify_no`, `thumbnail`, `company_category`, `personality`, `is_paying`) VALUES
(70, '李宗翰', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, '', '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'm', 0, '1359045643', '1359102345', NULL, NULL, NULL, NULL, 'A123456789', NULL, 0, 'D', 1),
(71, '黃鈞塘', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, '', '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'm', 1, '1359107343', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 1, 'I', 0),
(72, 'CT Huang', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, '', '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'm', 0, '1359107344', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 2, 'S', 0),
(73, '王教昌', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, '', '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'm', 1, '1359107345', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 3, 'D', 1),
(74, '史黛西', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, '', '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'f', 1, '1359107346', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 4, 'C', 1),
(75, 'Ted', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, NULL, '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'm', 1, '1359887631', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 5, 'D', 0),
(76, '機八芹', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, NULL, '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'f', 0, '1359888207', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 6, 'I', 1),
(77, '杜孟芹', '0911222333', '新北市新店區中興路三段88號', '0227787778', '主任工程師', 'ct_huang@htc.com', '1872739475', 0, 1, 1, NULL, '宏達國際股份有限公司', '新北市新店區中興路三段88號4樓', '0227761234', 'f', 1, '1359888209', NULL, NULL, NULL, NULL, NULL, 'A123456789', NULL, 7, 'S', 0);

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

--
-- 轉存資料表中的資料 `customer_evaluation`
--

INSERT INTO `customer_evaluation` (`id`, `customer_id`, `income_monthly`, `age`, `marriage`, `dependent_count`, `known_time`, `contact_frequency`, `contact_difficulty`, `weight`, `create_time`) VALUES
(16, 70, 4, 1, 3, 2, 4, 2, 1, 0.8, '1359102345'),
(17, 71, 4, 1, 3, 2, 4, 2, 1, 0.3, '1359107344'),
(18, 72, 4, 1, 3, 2, 4, 2, 1, 0.5, '1359107344'),
(19, 73, 4, 1, 3, 2, 4, 2, 1, 0.9, '1359107345'),
(20, 74, 4, 1, 3, 2, 4, 2, 1, 0.65, '1359107346'),
(21, 75, 4, 1, 3, 2, 4, 2, 1, 0.8, '1359887632'),
(22, 76, 4, 1, 3, 2, 4, 2, 1, 0.8, '1359888207'),
(23, 77, 4, 1, 3, 2, 4, 2, 1, 0.8, '1359888209');

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

--
-- 轉存資料表中的資料 `customer_relationship`
--

INSERT INTO `customer_relationship` (`id`, `customer_id`, `relationship_id`, `related`, `create_time`, `modify_time`) VALUES
(1, 70, 71, 1, NULL, NULL),
(2, 71, 70, 1, NULL, NULL),
(3, 71, 72, 2, NULL, NULL),
(4, 72, 71, 2, NULL, NULL),
(5, 70, 73, 3, NULL, NULL),
(6, 73, 70, 3, NULL, NULL);

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

--
-- 轉存資料表中的資料 `customer_tags`
--

INSERT INTO `customer_tags` (`id`, `customer_id`, `tag`, `create_time`, `creator`) VALUES
(32, 70, '可愛可愛', '1359102345', NULL),
(33, 70, '大方大方', '1359102345', NULL),
(34, 70, '健談', '1359102345', NULL),
(35, 70, '辣妹', '1359102345', NULL),
(36, 71, '可愛可愛', '1359107344', NULL),
(37, 71, '大方大方', '1359107344', NULL),
(38, 71, '健談', '1359107344', NULL),
(39, 71, '辣妹', '1359107344', NULL),
(40, 72, '可愛可愛', '1359107345', NULL),
(41, 72, '大方大方', '1359107345', NULL),
(42, 72, '健談', '1359107345', NULL),
(43, 72, '辣妹', '1359107345', NULL),
(44, 73, '可愛可愛', '1359107345', NULL),
(45, 73, '大方大方', '1359107345', NULL),
(46, 73, '健談', '1359107345', NULL),
(47, 73, '辣妹', '1359107345', NULL),
(48, 74, '可愛可愛', '1359107346', NULL),
(49, 74, '大方大方', '1359107346', NULL),
(50, 74, '健談', '1359107346', NULL),
(51, 74, '辣妹', '1359107346', NULL),
(52, 75, '可愛可愛', '1359887632', NULL),
(53, 75, '大方大方', '1359887632', NULL),
(54, 75, '健談', '1359887632', NULL),
(55, 75, '辣妹', '1359887632', NULL),
(56, 76, '可愛可愛', '1359888207', NULL),
(57, 76, '大方大方', '1359888207', NULL),
(58, 76, '健談', '1359888207', NULL),
(59, 76, '辣妹', '1359888207', NULL),
(60, 77, '可愛可愛', '1359888209', NULL),
(61, 77, '大方大方', '1359888209', NULL),
(62, 77, '健談', '1359888209', NULL),
(63, 77, '辣妹', '1359888209', NULL);

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

--
-- 轉存資料表中的資料 `customer_visit_history`
--

INSERT INTO `customer_visit_history` (`id`, `time`, `place`, `detail`, `customer_id`, `create_time`, `modify_time`, `delete_time`, `creator`, `modifier`) VALUES
(1, '19473013497549', '中興路星巴克', '向鈞塘說明大四喜10年期壽險,並且約定下次要介紹醫療險。', 70, '1838759373', NULL, NULL, NULL, NULL),
(2, '19473013480149', '中興路星巴克', '只是閒聊', 70, '1838759373', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

--
-- 轉存資料表中的資料 `personal_target`
--

INSERT INTO `personal_target` (`id`, `agent_id`, `type_id`, `target`, `value`, `creator`, `modifier`, `create_time`, `modify_time`, `delete_time`) VALUES
(1, 1, 1, 'criteria', 120000, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 'result', 88000, NULL, NULL, NULL, NULL, NULL),
(3, 1, 1, 'receive', 98000, NULL, NULL, NULL, NULL, NULL),
(4, 1, 2, 'criteria', 580000, NULL, NULL, NULL, NULL, NULL),
(5, 1, 2, 'result', 400000, NULL, NULL, NULL, NULL, NULL),
(6, 1, 2, 'receive', 400000, NULL, NULL, NULL, NULL, NULL),
(7, 1, 3, 'criteria', 900000, NULL, NULL, NULL, NULL, NULL),
(8, 1, 3, 'result', 450000, NULL, NULL, NULL, NULL, NULL),
(9, 1, 3, 'receive', 550000, NULL, NULL, NULL, NULL, NULL),
(10, 1, 4, 'criteria', 36000, NULL, NULL, NULL, NULL, NULL),
(11, 1, 4, 'result', 35990, NULL, NULL, NULL, NULL, NULL),
(12, 1, 4, 'receive', 35990, NULL, NULL, NULL, NULL, NULL),
(181, 101, 1, 'criteria', 120000, NULL, NULL, NULL, NULL, NULL),
(182, 101, 1, 'result', 88000, NULL, NULL, NULL, NULL, NULL),
(183, 101, 1, 'receive', 98000, NULL, NULL, NULL, NULL, NULL),
(184, 101, 2, 'criteria', 580000, NULL, NULL, NULL, NULL, NULL),
(185, 101, 2, 'result', 400000, NULL, NULL, NULL, NULL, NULL),
(186, 101, 2, 'receive', 400000, NULL, NULL, NULL, NULL, NULL),
(187, 101, 3, 'criteria', 900000, NULL, NULL, NULL, NULL, NULL),
(188, 101, 3, 'result', 450000, NULL, NULL, NULL, NULL, NULL),
(189, 101, 3, 'receive', 550000, NULL, NULL, NULL, NULL, NULL),
(190, 101, 4, 'criteria', 36000, NULL, NULL, NULL, NULL, NULL),
(191, 101, 4, 'result', 35990, NULL, NULL, NULL, NULL, NULL),
(192, 101, 4, 'receive', 35990, NULL, NULL, NULL, NULL, NULL),
(253, 102, 1, 'criteria', 120000, NULL, NULL, NULL, NULL, NULL),
(254, 102, 1, 'result', 88000, NULL, NULL, NULL, NULL, NULL),
(255, 102, 1, 'receive', 98000, NULL, NULL, NULL, NULL, NULL),
(256, 102, 2, 'criteria', 580000, NULL, NULL, NULL, NULL, NULL),
(257, 102, 2, 'result', 400000, NULL, NULL, NULL, NULL, NULL),
(258, 102, 2, 'receive', 400000, NULL, NULL, NULL, NULL, NULL),
(259, 102, 3, 'criteria', 900000, NULL, NULL, NULL, NULL, NULL),
(260, 102, 3, 'result', 450000, NULL, NULL, NULL, NULL, NULL),
(261, 102, 3, 'receive', 550000, NULL, NULL, NULL, NULL, NULL),
(262, 102, 4, 'criteria', 36000, NULL, NULL, NULL, NULL, NULL),
(263, 102, 4, 'result', 35990, NULL, NULL, NULL, NULL, NULL),
(264, 102, 4, 'receive', 35990, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的結構 `personal_target_item`
--

CREATE TABLE IF NOT EXISTS `personal_target_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 轉存資料表中的資料 `personal_target_item`
--

INSERT INTO `personal_target_item` (`id`, `type`) VALUES
(1, 'year'),
(2, 'race'),
(3, 'customer'),
(4, 'promote');

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

--
-- 轉存資料表中的資料 `relationship`
--

INSERT INTO `relationship` (`id`, `item`, `note`) VALUES
(1, '朋友', NULL),
(2, '同學', NULL),
(3, '兄弟', NULL),
(4, '姊妹', NULL);

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

-- --------------------------------------------------------

--
-- 表的結構 `uc_configuration`
--

CREATE TABLE IF NOT EXISTS `uc_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 轉存資料表中的資料 `uc_configuration`
--

INSERT INTO `uc_configuration` (`id`, `name`, `value`) VALUES
(1, 'website_name', 'UserCake'),
(2, 'website_url', 'localhost/'),
(3, 'email', 'noreply@ILoveUserCake.com'),
(4, 'activation', 'false'),
(5, 'resend_activation_threshold', '0'),
(6, 'language', 'models/languages/en.php'),
(7, 'template', 'models/site-templates/default.css');

-- --------------------------------------------------------

--
-- 表的結構 `uc_pages`
--

CREATE TABLE IF NOT EXISTS `uc_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(150) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- 轉存資料表中的資料 `uc_pages`
--

INSERT INTO `uc_pages` (`id`, `page`, `private`) VALUES
(1, 'account.php', 1),
(2, 'activate-account.php', 0),
(3, 'admin_configuration.php', 1),
(4, 'admin_page.php', 1),
(5, 'admin_pages.php', 1),
(6, 'admin_permission.php', 1),
(7, 'admin_permissions.php', 1),
(8, 'admin_user.php', 1),
(9, 'admin_users.php', 1),
(10, 'forgot-password.php', 0),
(11, 'index.php', 0),
(12, 'left-nav.php', 0),
(13, 'login.php', 0),
(14, 'logout.php', 1),
(15, 'register.php', 0),
(16, 'resend-activation.php', 0),
(17, 'user_settings.php', 1);

-- --------------------------------------------------------

--
-- 表的結構 `uc_permission_page_matches`
--

CREATE TABLE IF NOT EXISTS `uc_permission_page_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- 轉存資料表中的資料 `uc_permission_page_matches`
--

INSERT INTO `uc_permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(1, 1, 1),
(2, 1, 14),
(3, 1, 17),
(4, 2, 1),
(5, 2, 3),
(6, 2, 4),
(7, 2, 5),
(8, 2, 6),
(9, 2, 7),
(10, 2, 8),
(11, 2, 9),
(12, 2, 14),
(13, 2, 17);

-- --------------------------------------------------------

--
-- 表的結構 `uc_permissions`
--

CREATE TABLE IF NOT EXISTS `uc_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 轉存資料表中的資料 `uc_permissions`
--

INSERT INTO `uc_permissions` (`id`, `name`) VALUES
(1, 'New Member'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- 表的結構 `uc_user_permission_matches`
--

CREATE TABLE IF NOT EXISTS `uc_user_permission_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 轉存資料表中的資料 `uc_user_permission_matches`
--

INSERT INTO `uc_user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- 表的結構 `uc_users`
--

CREATE TABLE IF NOT EXISTS `uc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(150) NOT NULL,
  `activation_token` varchar(225) NOT NULL,
  `last_activation_request` int(11) NOT NULL,
  `lost_password_request` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(150) NOT NULL,
  `sign_up_stamp` int(11) NOT NULL,
  `last_sign_in_stamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 轉存資料表中的資料 `uc_users`
--

INSERT INTO `uc_users` (`id`, `user_name`, `display_name`, `password`, `email`, `activation_token`, `last_activation_request`, `lost_password_request`, `active`, `title`, `sign_up_stamp`, `last_sign_in_stamp`) VALUES
(1, 'chriss', 'chriss', '65eb7b3b67a1453c77269fb4b64f6367a6a967d30c819f4d8303bdd8bae6272c6', 'chriss1008@msn.com', '0d9ab02d9e87ac382d24d493f2c97a98', 1365932345, 0, 1, 'New Member', 1365932345, 1365932358);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
