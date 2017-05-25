/*
Navicat MySQL Data Transfer

Source Server         : localhost_3300
Source Server Version : 50505
Source Host           : localhost:3300
Source Database       : autumn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-25 22:38:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for autumn_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `autumn_admin_group`;
CREATE TABLE `autumn_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `limit` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_admin_group
-- ----------------------------
INSERT INTO `autumn_admin_group` VALUES ('1', '超级管理员', '0', 0x616C6C);
INSERT INTO `autumn_admin_group` VALUES ('11', '测试', '0', 0x5B2261646D696E5F757365725F637265617465222C2261646D696E5F757365725F656469745F6D79736C6566225D);

-- ----------------------------
-- Table structure for autumn_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `autumn_admin_user`;
CREATE TABLE `autumn_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remarks` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8_bin NOT NULL,
  `username` varchar(40) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `salt` int(6) NOT NULL,
  `createTime` int(11) NOT NULL,
  `LostTime` int(11) NOT NULL,
  `LostIp` varchar(20) COLLATE utf8_bin NOT NULL,
  `newTime` int(11) NOT NULL,
  `newIp` varchar(20) COLLATE utf8_bin NOT NULL,
  `header_image` varchar(32) COLLATE utf8_bin NOT NULL,
  `group` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `id_3` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_admin_user
-- ----------------------------
INSERT INTO `autumn_admin_user` VALUES ('1', '超级管理员', '', 'admin123456', 'ae2f4f5052e0096ca325861f1c6b510e', '818038', '0', '1495541522', '127.168.0.1', '1495718928', '127.168.0.1', '', '1', '0');

-- ----------------------------
-- Table structure for autumn_betting
-- ----------------------------
DROP TABLE IF EXISTS `autumn_betting`;
CREATE TABLE `autumn_betting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `from_game_rule` int(11) DEFAULT NULL,
  `from_periods` int(11) NOT NULL,
  `multiple` int(11) DEFAULT NULL,
  `notes` int(11) DEFAULT NULL,
  `pattern` int(11) DEFAULT NULL,
  `number` varchar(70) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `winning_money` double DEFAULT NULL,
  `rebate` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`from_periods`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_betting
-- ----------------------------
INSERT INTO `autumn_betting` VALUES ('1', '1', 'L2017052212345644', '2017-05-23 00:11:38', '20', '57', '100', '1', '2000', '0', '0123456789,0123456789,0123456789,0123456789,0123456789', '999', '0', '14', '1');

-- ----------------------------
-- Table structure for autumn_detail
-- ----------------------------
DROP TABLE IF EXISTS `autumn_detail`;
CREATE TABLE `autumn_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `from_game_rule` int(11) DEFAULT NULL,
  `from_periods` int(11) DEFAULT NULL,
  `pattern` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_detail
-- ----------------------------
INSERT INTO `autumn_detail` VALUES ('1', '1', 'L2017052345156', '20', '57', '100', '1', '100', '100', '0', '2017-05-23 00:36:15');

-- ----------------------------
-- Table structure for autumn_game_rule
-- ----------------------------
DROP TABLE IF EXISTS `autumn_game_rule`;
CREATE TABLE `autumn_game_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `byid` varchar(125) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `count` int(4) DEFAULT NULL,
  `rule` varchar(1024) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `winning_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `from_group` int(10) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `data` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `index` int(11) DEFAULT '0',
  `highest_bonus` double DEFAULT '0',
  `minimum_bonus` double DEFAULT '0',
  `topbet` int(11) DEFAULT '0',
  `minimum_money` double(255,0) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_game_rule
-- ----------------------------
INSERT INTO `autumn_game_rule` VALUES ('58', null, '时时彩', '6', null, null, null, null, '0', null, '0', '0', '0', '0', '0', '2017-05-23 11:57:34');
INSERT INTO `autumn_game_rule` VALUES ('59', null, '五星', null, null, null, null, '58', '1', null, '0', '0', '0', '0', '0', '2017-05-23 11:57:43');
INSERT INTO `autumn_game_rule` VALUES ('60', null, '五星直选', null, '????', '五星直选', '五星直选', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-23 11:57:54');
INSERT INTO `autumn_game_rule` VALUES ('61', null, '五星复试', null, '????', '五星复试', '五星复试', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-23 11:58:03');

-- ----------------------------
-- Table structure for autumn_lottery
-- ----------------------------
DROP TABLE IF EXISTS `autumn_lottery`;
CREATE TABLE `autumn_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `from_group` int(11) DEFAULT NULL,
  `periods` int(11) DEFAULT NULL,
  `stop_interval` int(11) DEFAULT NULL,
  `open_interval` int(11) DEFAULT NULL,
  `draw_interval` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery
-- ----------------------------
INSERT INTO `autumn_lottery` VALUES ('23', '测试', '58', '123', '31', '33', '20');

-- ----------------------------
-- Table structure for autumn_lottery_data
-- ----------------------------
DROP TABLE IF EXISTS `autumn_lottery_data`;
CREATE TABLE `autumn_lottery_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_time_id` int(11) NOT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `day` datetime DEFAULT NULL,
  `data` varchar(20) DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  `lottery_time` datetime DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `send_lottery_count` int(11) DEFAULT NULL,
  `winning_count` int(11) DEFAULT NULL,
  `participate_count` int(11) DEFAULT NULL,
  `betting_money` double NOT NULL,
  `winning_money` double NOT NULL,
  `rebate_money` double NOT NULL,
  `profit_loss` double DEFAULT NULL,
  PRIMARY KEY (`id`,`from_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9688 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_data
-- ----------------------------
INSERT INTO `autumn_lottery_data` VALUES ('8827', '33528', '23', '2017-05-25 00:00:00', '944409', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8828', '33527', '23', '2017-05-25 00:00:00', '342166', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8829', '33526', '23', '2017-05-25 00:00:00', '608612', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8830', '33525', '23', '2017-05-25 00:00:00', '443405', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8831', '33524', '23', '2017-05-25 00:00:00', '984289', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8832', '33523', '23', '2017-05-25 00:00:00', '920376', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8833', '33522', '23', '2017-05-25 00:00:00', '239801', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8834', '33521', '23', '2017-05-25 00:00:00', '124252', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8835', '33520', '23', '2017-05-25 00:00:00', '452880', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8836', '33519', '23', '2017-05-25 00:00:00', '428079', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8837', '33518', '23', '2017-05-25 00:00:00', '185638', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8838', '33517', '23', '2017-05-25 00:00:00', '801779', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8839', '33516', '23', '2017-05-25 00:00:00', '559558', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8840', '33515', '23', '2017-05-25 00:00:00', '187149', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8841', '33514', '23', '2017-05-25 00:00:00', '530499', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8842', '33513', '23', '2017-05-25 00:00:00', '872860', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8843', '33512', '23', '2017-05-25 00:00:00', '263696', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8844', '33511', '23', '2017-05-25 00:00:00', '169461', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8845', '33510', '23', '2017-05-25 00:00:00', '908758', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8846', '33509', '23', '2017-05-25 00:00:00', '984371', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8847', '33508', '23', '2017-05-25 00:00:00', '774670', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8848', '33507', '23', '2017-05-25 00:00:00', '796890', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8849', '33506', '23', '2017-05-25 00:00:00', '504791', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8850', '33505', '23', '2017-05-25 00:00:00', '433187', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8851', '33504', '23', '2017-05-25 00:00:00', '151855', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8852', '33503', '23', '2017-05-25 00:00:00', '241311', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8853', '33502', '23', '2017-05-25 00:00:00', '752972', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8854', '33501', '23', '2017-05-25 00:00:00', '766183', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8855', '33500', '23', '2017-05-25 00:00:00', '504626', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8856', '33499', '23', '2017-05-25 00:00:00', '724600', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8857', '33498', '23', '2017-05-25 00:00:00', '837677', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8858', '33497', '23', '2017-05-25 00:00:00', '380233', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8859', '33496', '23', '2017-05-25 00:00:00', '792358', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8860', '33495', '23', '2017-05-25 00:00:00', '418630', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8861', '33494', '23', '2017-05-25 00:00:00', '393280', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8862', '33493', '23', '2017-05-25 00:00:00', '822213', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8863', '33492', '23', '2017-05-25 00:00:00', '424426', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8864', '33491', '23', '2017-05-25 00:00:00', '645278', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8865', '33490', '23', '2017-05-25 00:00:00', '404156', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8866', '33489', '23', '2017-05-25 00:00:00', '488998', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8867', '33488', '23', '2017-05-25 00:00:00', '160205', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8868', '33487', '23', '2017-05-25 00:00:00', '476419', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8869', '33486', '23', '2017-05-25 00:00:00', '504681', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8870', '33485', '23', '2017-05-25 00:00:00', '927462', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8871', '33484', '23', '2017-05-25 00:00:00', '309069', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8872', '33483', '23', '2017-05-25 00:00:00', '333926', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8873', '33482', '23', '2017-05-25 00:00:00', '779229', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8874', '33481', '23', '2017-05-25 00:00:00', '534481', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8875', '33480', '23', '2017-05-25 00:00:00', '730395', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8876', '33479', '23', '2017-05-25 00:00:00', '189675', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8877', '33478', '23', '2017-05-25 00:00:00', '862176', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8878', '33477', '23', '2017-05-25 00:00:00', '856930', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8879', '33476', '23', '2017-05-25 00:00:00', '833557', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8880', '33475', '23', '2017-05-25 00:00:00', '465542', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8881', '33474', '23', '2017-05-25 00:00:00', '837896', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8882', '33473', '23', '2017-05-25 00:00:00', '291683', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8883', '33472', '23', '2017-05-25 00:00:00', '477929', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8884', '33471', '23', '2017-05-25 00:00:00', '233401', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8885', '33470', '23', '2017-05-25 00:00:00', '340765', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8886', '33469', '23', '2017-05-25 00:00:00', '385617', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8887', '33468', '23', '2017-05-25 00:00:00', '872888', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8888', '33467', '23', '2017-05-25 00:00:00', '815127', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8889', '33466', '23', '2017-05-25 00:00:00', '355157', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8890', '33465', '23', '2017-05-25 00:00:00', '435604', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8891', '33464', '23', '2017-05-25 00:00:00', '977807', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8892', '33463', '23', '2017-05-25 00:00:00', '382595', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8893', '33462', '23', '2017-05-25 00:00:00', '515447', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8894', '33461', '23', '2017-05-25 00:00:00', '188522', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8895', '33460', '23', '2017-05-25 00:00:00', '202062', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8896', '33459', '23', '2017-05-25 00:00:00', '257681', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8897', '33458', '23', '2017-05-25 00:00:00', '906011', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8898', '33457', '23', '2017-05-25 00:00:00', '741244', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8899', '33456', '23', '2017-05-25 00:00:00', '205029', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8900', '33455', '23', '2017-05-25 00:00:00', '412258', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8901', '33454', '23', '2017-05-25 00:00:00', '261224', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8902', '33453', '23', '2017-05-25 00:00:00', '940646', '2', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8903', '33452', '23', '2017-05-25 00:00:00', '396081', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8904', '33451', '23', '2017-05-25 00:00:00', '368203', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8905', '33450', '23', '2017-05-25 00:00:00', '465460', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8906', '33449', '23', '2017-05-25 00:00:00', '983602', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8907', '33448', '23', '2017-05-25 00:00:00', '634594', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8908', '33447', '23', '2017-05-25 00:00:00', '997390', '2', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8909', '33446', '23', '2017-05-25 00:00:00', '253094', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8910', '33445', '23', '2017-05-25 00:00:00', '616989', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8911', '33444', '23', '2017-05-25 00:00:00', '329943', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8912', '33443', '23', '2017-05-25 00:00:00', '921694', '2', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8913', '33442', '23', '2017-05-25 00:00:00', '608502', '2', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8914', '33441', '23', '2017-05-25 00:00:00', '937680', '2', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8915', '33440', '23', '2017-05-25 00:00:00', '241503', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8916', '33439', '23', '2017-05-25 00:00:00', '112991', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8917', '33438', '23', '2017-05-25 00:00:00', '266058', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8918', '33437', '23', '2017-05-25 00:00:00', '792550', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8919', '33436', '23', '2017-05-25 00:00:00', '678649', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8920', '33435', '23', '2017-05-25 00:00:00', '793154', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8921', '33434', '23', '2017-05-25 00:00:00', '210137', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8922', '33433', '23', '2017-05-25 00:00:00', '378475', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8923', '33432', '23', '2017-05-25 00:00:00', '600756', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8924', '33431', '23', '2017-05-25 00:00:00', '234060', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8925', '33430', '23', '2017-05-25 00:00:00', '975115', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8926', '33429', '23', '2017-05-25 00:00:00', '342330', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8927', '33428', '23', '2017-05-25 00:00:00', '317199', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8928', '33427', '23', '2017-05-25 00:00:00', '657583', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8929', '33426', '23', '2017-05-25 00:00:00', '845367', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8930', '33425', '23', '2017-05-25 00:00:00', '880990', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8931', '33424', '23', '2017-05-25 00:00:00', '587353', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8932', '33423', '23', '2017-05-25 00:00:00', '235598', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8933', '33422', '23', '2017-05-25 00:00:00', '355267', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8934', '33421', '23', '2017-05-25 00:00:00', '841329', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8935', '33420', '23', '2017-05-25 00:00:00', '820593', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8936', '33419', '23', '2017-05-25 00:00:00', '289981', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8937', '33418', '23', '2017-05-25 00:00:00', '489190', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8938', '33417', '23', '2017-05-25 00:00:00', '420223', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8939', '33416', '23', '2017-05-25 00:00:00', '876293', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8940', '33415', '23', '2017-05-25 00:00:00', '792605', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8941', '33414', '23', '2017-05-25 00:00:00', '881512', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8942', '33413', '23', '2017-05-25 00:00:00', '264547', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8943', '33412', '23', '2017-05-25 00:00:00', '163830', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8944', '33411', '23', '2017-05-25 00:00:00', '365347', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8945', '33410', '23', '2017-05-25 00:00:00', '716607', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8946', '33409', '23', '2017-05-25 00:00:00', '571176', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8947', '33408', '23', '2017-05-25 00:00:00', '342578', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8948', '33407', '23', '2017-05-25 00:00:00', '780081', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8949', '33406', '23', '2017-05-25 00:00:00', '528851', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8950', '33528', '23', '2017-05-26 00:00:00', '186984', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8951', '33527', '23', '2017-05-26 00:00:00', '821911', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8952', '33526', '23', '2017-05-26 00:00:00', '658682', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8953', '33525', '23', '2017-05-26 00:00:00', '402618', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8954', '33524', '23', '2017-05-26 00:00:00', '208847', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8955', '33523', '23', '2017-05-26 00:00:00', '561206', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8956', '33522', '23', '2017-05-26 00:00:00', '873025', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8957', '33521', '23', '2017-05-26 00:00:00', '872283', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8958', '33520', '23', '2017-05-26 00:00:00', '383639', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8959', '33519', '23', '2017-05-26 00:00:00', '769836', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8960', '33518', '23', '2017-05-26 00:00:00', '944985', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8961', '33517', '23', '2017-05-26 00:00:00', '222222', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8962', '33516', '23', '2017-05-26 00:00:00', '908236', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8963', '33515', '23', '2017-05-26 00:00:00', '407177', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8964', '33514', '23', '2017-05-26 00:00:00', '846438', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8965', '33513', '23', '2017-05-26 00:00:00', '786810', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8966', '33512', '23', '2017-05-26 00:00:00', '629513', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8967', '33511', '23', '2017-05-26 00:00:00', '682604', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8968', '33510', '23', '2017-05-26 00:00:00', '999258', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8969', '33509', '23', '2017-05-26 00:00:00', '850421', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8970', '33508', '23', '2017-05-26 00:00:00', '644345', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8971', '33507', '23', '2017-05-26 00:00:00', '555493', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8972', '33506', '23', '2017-05-26 00:00:00', '475320', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8973', '33505', '23', '2017-05-26 00:00:00', '947430', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8974', '33504', '23', '2017-05-26 00:00:00', '699606', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8975', '33503', '23', '2017-05-26 00:00:00', '335217', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8976', '33502', '23', '2017-05-26 00:00:00', '596499', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8977', '33501', '23', '2017-05-26 00:00:00', '262213', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8978', '33500', '23', '2017-05-26 00:00:00', '992172', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8979', '33499', '23', '2017-05-26 00:00:00', '781152', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8980', '33498', '23', '2017-05-26 00:00:00', '434671', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8981', '33497', '23', '2017-05-26 00:00:00', '229144', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8982', '33496', '23', '2017-05-26 00:00:00', '368917', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8983', '33495', '23', '2017-05-26 00:00:00', '402673', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8984', '33494', '23', '2017-05-26 00:00:00', '411709', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8985', '33493', '23', '2017-05-26 00:00:00', '932598', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8986', '33492', '23', '2017-05-26 00:00:00', '826718', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8987', '33491', '23', '2017-05-26 00:00:00', '859155', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8988', '33490', '23', '2017-05-26 00:00:00', '499490', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8989', '33489', '23', '2017-05-26 00:00:00', '206951', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8990', '33488', '23', '2017-05-26 00:00:00', '312448', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8991', '33487', '23', '2017-05-26 00:00:00', '659973', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8992', '33486', '23', '2017-05-26 00:00:00', '219888', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8993', '33485', '23', '2017-05-26 00:00:00', '836578', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8994', '33484', '23', '2017-05-26 00:00:00', '822982', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8995', '33483', '23', '2017-05-26 00:00:00', '564501', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8996', '33482', '23', '2017-05-26 00:00:00', '444778', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8997', '33481', '23', '2017-05-26 00:00:00', '655853', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8998', '33480', '23', '2017-05-26 00:00:00', '305197', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('8999', '33479', '23', '2017-05-26 00:00:00', '882116', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9000', '33478', '23', '2017-05-26 00:00:00', '696035', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9001', '33477', '23', '2017-05-26 00:00:00', '649151', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9002', '33476', '23', '2017-05-26 00:00:00', '755966', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9003', '33475', '23', '2017-05-26 00:00:00', '572192', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9004', '33474', '23', '2017-05-26 00:00:00', '945535', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9005', '33473', '23', '2017-05-26 00:00:00', '450848', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9006', '33472', '23', '2017-05-26 00:00:00', '122164', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9007', '33471', '23', '2017-05-26 00:00:00', '844104', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9008', '33470', '23', '2017-05-26 00:00:00', '715151', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9009', '33469', '23', '2017-05-26 00:00:00', '145318', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9010', '33468', '23', '2017-05-26 00:00:00', '400668', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9011', '33467', '23', '2017-05-26 00:00:00', '657226', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9012', '33466', '23', '2017-05-26 00:00:00', '876760', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9013', '33465', '23', '2017-05-26 00:00:00', '266937', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9014', '33464', '23', '2017-05-26 00:00:00', '438351', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9015', '33463', '23', '2017-05-26 00:00:00', '320935', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9016', '33462', '23', '2017-05-26 00:00:00', '952236', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9017', '33461', '23', '2017-05-26 00:00:00', '900079', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9018', '33460', '23', '2017-05-26 00:00:00', '432089', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9019', '33459', '23', '2017-05-26 00:00:00', '594604', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9020', '33458', '23', '2017-05-26 00:00:00', '913455', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9021', '33457', '23', '2017-05-26 00:00:00', '779119', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9022', '33456', '23', '2017-05-26 00:00:00', '128756', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9023', '33455', '23', '2017-05-26 00:00:00', '887609', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9024', '33454', '23', '2017-05-26 00:00:00', '282290', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9025', '33453', '23', '2017-05-26 00:00:00', '888433', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9026', '33452', '23', '2017-05-26 00:00:00', '625228', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9027', '33451', '23', '2017-05-26 00:00:00', '159326', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9028', '33450', '23', '2017-05-26 00:00:00', '830618', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9029', '33449', '23', '2017-05-26 00:00:00', '862396', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9030', '33448', '23', '2017-05-26 00:00:00', '768380', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9031', '33447', '23', '2017-05-26 00:00:00', '519128', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9032', '33446', '23', '2017-05-26 00:00:00', '280313', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9033', '33445', '23', '2017-05-26 00:00:00', '785382', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9034', '33444', '23', '2017-05-26 00:00:00', '755087', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9035', '33443', '23', '2017-05-26 00:00:00', '926391', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9036', '33442', '23', '2017-05-26 00:00:00', '403250', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9037', '33441', '23', '2017-05-26 00:00:00', '291766', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9038', '33440', '23', '2017-05-26 00:00:00', '332223', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9039', '33439', '23', '2017-05-26 00:00:00', '790490', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9040', '33438', '23', '2017-05-26 00:00:00', '721304', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9041', '33437', '23', '2017-05-26 00:00:00', '365924', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9042', '33436', '23', '2017-05-26 00:00:00', '596664', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9043', '33435', '23', '2017-05-26 00:00:00', '870800', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9044', '33434', '23', '2017-05-26 00:00:00', '306350', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9045', '33433', '23', '2017-05-26 00:00:00', '642230', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9046', '33432', '23', '2017-05-26 00:00:00', '395285', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9047', '33431', '23', '2017-05-26 00:00:00', '576696', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9048', '33430', '23', '2017-05-26 00:00:00', '480264', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9049', '33429', '23', '2017-05-26 00:00:00', '305059', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9050', '33428', '23', '2017-05-26 00:00:00', '824960', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9051', '33427', '23', '2017-05-26 00:00:00', '667553', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9052', '33426', '23', '2017-05-26 00:00:00', '314920', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9053', '33425', '23', '2017-05-26 00:00:00', '788787', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9054', '33424', '23', '2017-05-26 00:00:00', '732565', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9055', '33423', '23', '2017-05-26 00:00:00', '552746', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9056', '33422', '23', '2017-05-26 00:00:00', '232192', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9057', '33421', '23', '2017-05-26 00:00:00', '377789', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9058', '33420', '23', '2017-05-26 00:00:00', '314974', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9059', '33419', '23', '2017-05-26 00:00:00', '991650', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9060', '33418', '23', '2017-05-26 00:00:00', '203958', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9061', '33417', '23', '2017-05-26 00:00:00', '506439', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9062', '33416', '23', '2017-05-26 00:00:00', '219064', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9063', '33415', '23', '2017-05-26 00:00:00', '493640', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9064', '33414', '23', '2017-05-26 00:00:00', '652090', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9065', '33413', '23', '2017-05-26 00:00:00', '359112', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9066', '33412', '23', '2017-05-26 00:00:00', '641708', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9067', '33411', '23', '2017-05-26 00:00:00', '718090', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9068', '33410', '23', '2017-05-26 00:00:00', '648464', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9069', '33409', '23', '2017-05-26 00:00:00', '470184', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9070', '33408', '23', '2017-05-26 00:00:00', '429782', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9071', '33407', '23', '2017-05-26 00:00:00', '174377', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9072', '33406', '23', '2017-05-26 00:00:00', '614956', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9073', '33528', '23', '2017-05-27 00:00:00', '924029', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9074', '33527', '23', '2017-05-27 00:00:00', '680160', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9075', '33526', '23', '2017-05-27 00:00:00', '521875', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9076', '33525', '23', '2017-05-27 00:00:00', '523440', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9077', '33524', '23', '2017-05-27 00:00:00', '455023', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9078', '33523', '23', '2017-05-27 00:00:00', '239718', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9079', '33522', '23', '2017-05-27 00:00:00', '269958', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9080', '33521', '23', '2017-05-27 00:00:00', '795791', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9081', '33520', '23', '2017-05-27 00:00:00', '947540', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9082', '33519', '23', '2017-05-27 00:00:00', '205331', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9083', '33518', '23', '2017-05-27 00:00:00', '178002', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9084', '33517', '23', '2017-05-27 00:00:00', '503884', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9085', '33516', '23', '2017-05-27 00:00:00', '235955', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9086', '33515', '23', '2017-05-27 00:00:00', '323873', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9087', '33514', '23', '2017-05-27 00:00:00', '555383', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9088', '33513', '23', '2017-05-27 00:00:00', '969595', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9089', '33512', '23', '2017-05-27 00:00:00', '204644', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9090', '33511', '23', '2017-05-27 00:00:00', '792221', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9091', '33510', '23', '2017-05-27 00:00:00', '361474', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9092', '33509', '23', '2017-05-27 00:00:00', '364797', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9093', '33508', '23', '2017-05-27 00:00:00', '487982', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9094', '33507', '23', '2017-05-27 00:00:00', '457247', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9095', '33506', '23', '2017-05-27 00:00:00', '805651', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9096', '33505', '23', '2017-05-27 00:00:00', '911367', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9097', '33504', '23', '2017-05-27 00:00:00', '270343', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9098', '33503', '23', '2017-05-27 00:00:00', '415829', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9099', '33502', '23', '2017-05-27 00:00:00', '847290', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9100', '33501', '23', '2017-05-27 00:00:00', '781179', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9101', '33500', '23', '2017-05-27 00:00:00', '986102', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9102', '33499', '23', '2017-05-27 00:00:00', '414840', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9103', '33498', '23', '2017-05-27 00:00:00', '795764', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9104', '33497', '23', '2017-05-27 00:00:00', '396109', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9105', '33496', '23', '2017-05-27 00:00:00', '919635', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9106', '33495', '23', '2017-05-27 00:00:00', '651156', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9107', '33494', '23', '2017-05-27 00:00:00', '510449', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9108', '33493', '23', '2017-05-27 00:00:00', '628030', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9109', '33492', '23', '2017-05-27 00:00:00', '605316', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9110', '33491', '23', '2017-05-27 00:00:00', '871652', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9111', '33490', '23', '2017-05-27 00:00:00', '300720', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9112', '33489', '23', '2017-05-27 00:00:00', '998818', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9113', '33488', '23', '2017-05-27 00:00:00', '127520', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9114', '33487', '23', '2017-05-27 00:00:00', '373202', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9115', '33486', '23', '2017-05-27 00:00:00', '925952', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9116', '33485', '23', '2017-05-27 00:00:00', '580349', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9117', '33484', '23', '2017-05-27 00:00:00', '920623', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9118', '33483', '23', '2017-05-27 00:00:00', '702682', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9119', '33482', '23', '2017-05-27 00:00:00', '895520', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9120', '33481', '23', '2017-05-27 00:00:00', '694497', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9121', '33480', '23', '2017-05-27 00:00:00', '369000', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9122', '33479', '23', '2017-05-27 00:00:00', '256967', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9123', '33478', '23', '2017-05-27 00:00:00', '968798', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9124', '33477', '23', '2017-05-27 00:00:00', '413137', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9125', '33476', '23', '2017-05-27 00:00:00', '807025', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9126', '33475', '23', '2017-05-27 00:00:00', '582931', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9127', '33474', '23', '2017-05-27 00:00:00', '555163', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9128', '33473', '23', '2017-05-27 00:00:00', '158145', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9129', '33472', '23', '2017-05-27 00:00:00', '519073', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9130', '33471', '23', '2017-05-27 00:00:00', '977450', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9131', '33470', '23', '2017-05-27 00:00:00', '413989', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9132', '33469', '23', '2017-05-27 00:00:00', '801394', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9133', '33468', '23', '2017-05-27 00:00:00', '939520', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9134', '33467', '23', '2017-05-27 00:00:00', '287399', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9135', '33466', '23', '2017-05-27 00:00:00', '854650', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9136', '33465', '23', '2017-05-27 00:00:00', '964761', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9137', '33464', '23', '2017-05-27 00:00:00', '352740', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9138', '33463', '23', '2017-05-27 00:00:00', '509652', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9139', '33462', '23', '2017-05-27 00:00:00', '836523', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9140', '33461', '23', '2017-05-27 00:00:00', '620120', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9141', '33460', '23', '2017-05-27 00:00:00', '193109', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9142', '33459', '23', '2017-05-27 00:00:00', '491085', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9143', '33458', '23', '2017-05-27 00:00:00', '668981', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9144', '33457', '23', '2017-05-27 00:00:00', '189346', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9145', '33456', '23', '2017-05-27 00:00:00', '545001', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9146', '33455', '23', '2017-05-27 00:00:00', '428573', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9147', '33454', '23', '2017-05-27 00:00:00', '211401', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9148', '33453', '23', '2017-05-27 00:00:00', '544314', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9149', '33452', '23', '2017-05-27 00:00:00', '142791', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9150', '33451', '23', '2017-05-27 00:00:00', '968991', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9151', '33450', '23', '2017-05-27 00:00:00', '673156', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9152', '33449', '23', '2017-05-27 00:00:00', '306900', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9153', '33448', '23', '2017-05-27 00:00:00', '870855', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9154', '33447', '23', '2017-05-27 00:00:00', '509213', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9155', '33446', '23', '2017-05-27 00:00:00', '113623', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9156', '33445', '23', '2017-05-27 00:00:00', '348977', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9157', '33444', '23', '2017-05-27 00:00:00', '563568', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9158', '33443', '23', '2017-05-27 00:00:00', '596115', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9159', '33442', '23', '2017-05-27 00:00:00', '642175', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9160', '33441', '23', '2017-05-27 00:00:00', '192422', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9161', '33440', '23', '2017-05-27 00:00:00', '205303', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9162', '33439', '23', '2017-05-27 00:00:00', '526571', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9163', '33438', '23', '2017-05-27 00:00:00', '318188', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9164', '33437', '23', '2017-05-27 00:00:00', '709109', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9165', '33436', '23', '2017-05-27 00:00:00', '330438', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9166', '33435', '23', '2017-05-27 00:00:00', '947457', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9167', '33434', '23', '2017-05-27 00:00:00', '351037', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9168', '33433', '23', '2017-05-27 00:00:00', '520913', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9169', '33432', '23', '2017-05-27 00:00:00', '123345', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9170', '33431', '23', '2017-05-27 00:00:00', '255648', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9171', '33430', '23', '2017-05-27 00:00:00', '600097', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9172', '33429', '23', '2017-05-27 00:00:00', '499710', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9173', '33428', '23', '2017-05-27 00:00:00', '118402', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9174', '33427', '23', '2017-05-27 00:00:00', '898019', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9175', '33426', '23', '2017-05-27 00:00:00', '474743', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9176', '33425', '23', '2017-05-27 00:00:00', '167373', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9177', '33424', '23', '2017-05-27 00:00:00', '399981', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9178', '33423', '23', '2017-05-27 00:00:00', '371444', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9179', '33422', '23', '2017-05-27 00:00:00', '734350', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9180', '33421', '23', '2017-05-27 00:00:00', '395779', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9181', '33420', '23', '2017-05-27 00:00:00', '602459', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9182', '33419', '23', '2017-05-27 00:00:00', '222799', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9183', '33418', '23', '2017-05-27 00:00:00', '788293', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9184', '33417', '23', '2017-05-27 00:00:00', '706802', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9185', '33416', '23', '2017-05-27 00:00:00', '810211', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9186', '33415', '23', '2017-05-27 00:00:00', '648959', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9187', '33414', '23', '2017-05-27 00:00:00', '495947', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9188', '33413', '23', '2017-05-27 00:00:00', '172317', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9189', '33412', '23', '2017-05-27 00:00:00', '657611', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9190', '33411', '23', '2017-05-27 00:00:00', '496798', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9191', '33410', '23', '2017-05-27 00:00:00', '166687', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9192', '33409', '23', '2017-05-27 00:00:00', '114199', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9193', '33408', '23', '2017-05-27 00:00:00', '229034', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9194', '33407', '23', '2017-05-27 00:00:00', '863192', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9195', '33406', '23', '2017-05-27 00:00:00', '559887', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9196', '33528', '23', '2017-05-28 00:00:00', '504324', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9197', '33527', '23', '2017-05-28 00:00:00', '958856', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9198', '33526', '23', '2017-05-28 00:00:00', '595016', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9199', '33525', '23', '2017-05-28 00:00:00', '184924', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9200', '33524', '23', '2017-05-28 00:00:00', '864566', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9201', '33523', '23', '2017-05-28 00:00:00', '231451', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9202', '33522', '23', '2017-05-28 00:00:00', '789144', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9203', '33521', '23', '2017-05-28 00:00:00', '701171', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9204', '33520', '23', '2017-05-28 00:00:00', '266799', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9205', '33519', '23', '2017-05-28 00:00:00', '381195', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9206', '33518', '23', '2017-05-28 00:00:00', '292453', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9207', '33517', '23', '2017-05-28 00:00:00', '618005', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9208', '33516', '23', '2017-05-28 00:00:00', '932901', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9209', '33515', '23', '2017-05-28 00:00:00', '592462', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9210', '33514', '23', '2017-05-28 00:00:00', '201815', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9211', '33513', '23', '2017-05-28 00:00:00', '694799', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9212', '33512', '23', '2017-05-28 00:00:00', '134744', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9213', '33511', '23', '2017-05-28 00:00:00', '499627', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9214', '33510', '23', '2017-05-28 00:00:00', '264108', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9215', '33509', '23', '2017-05-28 00:00:00', '340930', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9216', '33508', '23', '2017-05-28 00:00:00', '994204', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9217', '33507', '23', '2017-05-28 00:00:00', '187066', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9218', '33506', '23', '2017-05-28 00:00:00', '676205', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9219', '33505', '23', '2017-05-28 00:00:00', '315771', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9220', '33504', '23', '2017-05-28 00:00:00', '783157', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9221', '33503', '23', '2017-05-28 00:00:00', '189154', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9222', '33502', '23', '2017-05-28 00:00:00', '284982', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9223', '33501', '23', '2017-05-28 00:00:00', '928698', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9224', '33500', '23', '2017-05-28 00:00:00', '823477', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9225', '33499', '23', '2017-05-28 00:00:00', '590264', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9226', '33498', '23', '2017-05-28 00:00:00', '187313', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9227', '33497', '23', '2017-05-28 00:00:00', '239086', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9228', '33496', '23', '2017-05-28 00:00:00', '187039', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9229', '33495', '23', '2017-05-28 00:00:00', '124774', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9230', '33494', '23', '2017-05-28 00:00:00', '130075', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9231', '33493', '23', '2017-05-28 00:00:00', '356311', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9232', '33492', '23', '2017-05-28 00:00:00', '195718', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9233', '33491', '23', '2017-05-28 00:00:00', '677056', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9234', '33490', '23', '2017-05-28 00:00:00', '310140', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9235', '33489', '23', '2017-05-28 00:00:00', '239746', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9236', '33488', '23', '2017-05-28 00:00:00', '821389', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9237', '33487', '23', '2017-05-28 00:00:00', '981488', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9238', '33486', '23', '2017-05-28 00:00:00', '474386', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9239', '33485', '23', '2017-05-28 00:00:00', '198767', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9240', '33484', '23', '2017-05-28 00:00:00', '685928', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9241', '33483', '23', '2017-05-28 00:00:00', '222442', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9242', '33482', '23', '2017-05-28 00:00:00', '819686', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9243', '33481', '23', '2017-05-28 00:00:00', '992749', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9244', '33480', '23', '2017-05-28 00:00:00', '661209', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9245', '33479', '23', '2017-05-28 00:00:00', '734295', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9246', '33478', '23', '2017-05-28 00:00:00', '192916', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9247', '33477', '23', '2017-05-28 00:00:00', '231066', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9248', '33476', '23', '2017-05-28 00:00:00', '269107', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9249', '33475', '23', '2017-05-28 00:00:00', '801422', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9250', '33474', '23', '2017-05-28 00:00:00', '590951', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9251', '33473', '23', '2017-05-28 00:00:00', '473095', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9252', '33472', '23', '2017-05-28 00:00:00', '381497', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9253', '33471', '23', '2017-05-28 00:00:00', '958197', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9254', '33470', '23', '2017-05-28 00:00:00', '860665', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9255', '33469', '23', '2017-05-28 00:00:00', '228210', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9256', '33468', '23', '2017-05-28 00:00:00', '520254', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9257', '33467', '23', '2017-05-28 00:00:00', '388995', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9258', '33466', '23', '2017-05-28 00:00:00', '298934', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9259', '33465', '23', '2017-05-28 00:00:00', '255786', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9260', '33464', '23', '2017-05-28 00:00:00', '657254', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9261', '33463', '23', '2017-05-28 00:00:00', '528192', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9262', '33462', '23', '2017-05-28 00:00:00', '452633', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9263', '33461', '23', '2017-05-28 00:00:00', '865197', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9264', '33460', '23', '2017-05-28 00:00:00', '314370', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9265', '33459', '23', '2017-05-28 00:00:00', '560162', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9266', '33458', '23', '2017-05-28 00:00:00', '618637', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9267', '33457', '23', '2017-05-28 00:00:00', '115820', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9268', '33456', '23', '2017-05-28 00:00:00', '363479', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9269', '33455', '23', '2017-05-28 00:00:00', '119281', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9270', '33454', '23', '2017-05-28 00:00:00', '543820', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9271', '33453', '23', '2017-05-28 00:00:00', '117028', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9272', '33452', '23', '2017-05-28 00:00:00', '326455', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9273', '33451', '23', '2017-05-28 00:00:00', '189923', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9274', '33450', '23', '2017-05-28 00:00:00', '425057', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9275', '33449', '23', '2017-05-28 00:00:00', '728198', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9276', '33448', '23', '2017-05-28 00:00:00', '175173', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9277', '33447', '23', '2017-05-28 00:00:00', '406463', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9278', '33446', '23', '2017-05-28 00:00:00', '909225', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9279', '33445', '23', '2017-05-28 00:00:00', '458703', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9280', '33444', '23', '2017-05-28 00:00:00', '331509', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9281', '33443', '23', '2017-05-28 00:00:00', '853277', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9282', '33442', '23', '2017-05-28 00:00:00', '393197', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9283', '33441', '23', '2017-05-28 00:00:00', '967919', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9284', '33440', '23', '2017-05-28 00:00:00', '767337', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9285', '33439', '23', '2017-05-28 00:00:00', '264739', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9286', '33438', '23', '2017-05-28 00:00:00', '423849', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9287', '33437', '23', '2017-05-28 00:00:00', '765222', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9288', '33436', '23', '2017-05-28 00:00:00', '104531', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9289', '33435', '23', '2017-05-28 00:00:00', '525225', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9290', '33434', '23', '2017-05-28 00:00:00', '298056', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9291', '33433', '23', '2017-05-28 00:00:00', '609985', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9292', '33432', '23', '2017-05-28 00:00:00', '114968', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9293', '33431', '23', '2017-05-28 00:00:00', '369110', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9294', '33430', '23', '2017-05-28 00:00:00', '662692', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9295', '33429', '23', '2017-05-28 00:00:00', '811584', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9296', '33428', '23', '2017-05-28 00:00:00', '320523', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9297', '33427', '23', '2017-05-28 00:00:00', '780767', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9298', '33426', '23', '2017-05-28 00:00:00', '814633', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9299', '33425', '23', '2017-05-28 00:00:00', '329394', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9300', '33424', '23', '2017-05-28 00:00:00', '693069', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9301', '33423', '23', '2017-05-28 00:00:00', '494573', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9302', '33422', '23', '2017-05-28 00:00:00', '500753', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9303', '33421', '23', '2017-05-28 00:00:00', '372790', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9304', '33420', '23', '2017-05-28 00:00:00', '754483', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9305', '33419', '23', '2017-05-28 00:00:00', '494903', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9306', '33418', '23', '2017-05-28 00:00:00', '817929', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9307', '33417', '23', '2017-05-28 00:00:00', '801147', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9308', '33416', '23', '2017-05-28 00:00:00', '476638', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9309', '33415', '23', '2017-05-28 00:00:00', '416131', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9310', '33414', '23', '2017-05-28 00:00:00', '613034', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9311', '33413', '23', '2017-05-28 00:00:00', '123840', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9312', '33412', '23', '2017-05-28 00:00:00', '281411', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9313', '33411', '23', '2017-05-28 00:00:00', '342633', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9314', '33410', '23', '2017-05-28 00:00:00', '982943', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9315', '33409', '23', '2017-05-28 00:00:00', '900244', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9316', '33408', '23', '2017-05-28 00:00:00', '140676', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9317', '33407', '23', '2017-05-28 00:00:00', '808782', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9318', '33406', '23', '2017-05-28 00:00:00', '774533', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9319', '33528', '23', '2017-05-29 00:00:00', '739733', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9320', '33527', '23', '2017-05-29 00:00:00', '476309', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9321', '33526', '23', '2017-05-29 00:00:00', '998956', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9322', '33525', '23', '2017-05-29 00:00:00', '184677', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9323', '33524', '23', '2017-05-29 00:00:00', '401684', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9324', '33523', '23', '2017-05-29 00:00:00', '360183', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9325', '33522', '23', '2017-05-29 00:00:00', '547528', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9326', '33521', '23', '2017-05-29 00:00:00', '760250', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9327', '33520', '23', '2017-05-29 00:00:00', '195471', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9328', '33519', '23', '2017-05-29 00:00:00', '214175', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9329', '33518', '23', '2017-05-29 00:00:00', '438873', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9330', '33517', '23', '2017-05-29 00:00:00', '898129', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9331', '33516', '23', '2017-05-29 00:00:00', '880468', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9332', '33515', '23', '2017-05-29 00:00:00', '910159', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9333', '33514', '23', '2017-05-29 00:00:00', '307366', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9334', '33513', '23', '2017-05-29 00:00:00', '345187', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9335', '33512', '23', '2017-05-29 00:00:00', '966052', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9336', '33511', '23', '2017-05-29 00:00:00', '170010', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9337', '33510', '23', '2017-05-29 00:00:00', '237384', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9338', '33509', '23', '2017-05-29 00:00:00', '198300', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9339', '33508', '23', '2017-05-29 00:00:00', '311596', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9340', '33507', '23', '2017-05-29 00:00:00', '665603', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9341', '33506', '23', '2017-05-29 00:00:00', '763299', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9342', '33505', '23', '2017-05-29 00:00:00', '204342', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9343', '33504', '23', '2017-05-29 00:00:00', '126477', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9344', '33503', '23', '2017-05-29 00:00:00', '118814', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9345', '33502', '23', '2017-05-29 00:00:00', '169488', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9346', '33501', '23', '2017-05-29 00:00:00', '560189', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9347', '33500', '23', '2017-05-29 00:00:00', '270068', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9348', '33499', '23', '2017-05-29 00:00:00', '301516', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9349', '33498', '23', '2017-05-29 00:00:00', '790325', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9350', '33497', '23', '2017-05-29 00:00:00', '112716', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9351', '33496', '23', '2017-05-29 00:00:00', '151745', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9352', '33495', '23', '2017-05-29 00:00:00', '735586', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9353', '33494', '23', '2017-05-29 00:00:00', '910186', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9354', '33493', '23', '2017-05-29 00:00:00', '858798', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9355', '33492', '23', '2017-05-29 00:00:00', '530883', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9356', '33491', '23', '2017-05-29 00:00:00', '492898', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9357', '33490', '23', '2017-05-29 00:00:00', '163446', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9358', '33489', '23', '2017-05-29 00:00:00', '745309', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9359', '33488', '23', '2017-05-29 00:00:00', '816857', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9360', '33487', '23', '2017-05-29 00:00:00', '895327', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9361', '33486', '23', '2017-05-29 00:00:00', '434478', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9362', '33485', '23', '2017-05-29 00:00:00', '869125', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9363', '33484', '23', '2017-05-29 00:00:00', '869042', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9364', '33483', '23', '2017-05-29 00:00:00', '114749', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9365', '33482', '23', '2017-05-29 00:00:00', '457659', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9366', '33481', '23', '2017-05-29 00:00:00', '977120', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9367', '33480', '23', '2017-05-29 00:00:00', '996813', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9368', '33479', '23', '2017-05-29 00:00:00', '373037', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9369', '33478', '23', '2017-05-29 00:00:00', '317364', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9370', '33477', '23', '2017-05-29 00:00:00', '366171', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9371', '33476', '23', '2017-05-29 00:00:00', '159545', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9372', '33475', '23', '2017-05-29 00:00:00', '742068', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9373', '33474', '23', '2017-05-29 00:00:00', '547967', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9374', '33473', '23', '2017-05-29 00:00:00', '583151', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9375', '33472', '23', '2017-05-29 00:00:00', '466613', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9376', '33471', '23', '2017-05-29 00:00:00', '743716', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9377', '33470', '23', '2017-05-29 00:00:00', '333843', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9378', '33469', '23', '2017-05-29 00:00:00', '924935', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9379', '33468', '23', '2017-05-29 00:00:00', '877392', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9380', '33467', '23', '2017-05-29 00:00:00', '349856', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9381', '33466', '23', '2017-05-29 00:00:00', '209368', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9382', '33465', '23', '2017-05-29 00:00:00', '238400', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9383', '33464', '23', '2017-05-29 00:00:00', '801257', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9384', '33463', '23', '2017-05-29 00:00:00', '882363', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9385', '33462', '23', '2017-05-29 00:00:00', '258917', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9386', '33461', '23', '2017-05-29 00:00:00', '520419', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9387', '33460', '23', '2017-05-29 00:00:00', '997583', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9388', '33459', '23', '2017-05-29 00:00:00', '513113', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9389', '33458', '23', '2017-05-29 00:00:00', '116864', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9390', '33457', '23', '2017-05-29 00:00:00', '617868', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9391', '33456', '23', '2017-05-29 00:00:00', '875744', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9392', '33455', '23', '2017-05-29 00:00:00', '563980', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9393', '33454', '23', '2017-05-29 00:00:00', '767584', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9394', '33453', '23', '2017-05-29 00:00:00', '727621', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9395', '33452', '23', '2017-05-29 00:00:00', '295117', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9396', '33451', '23', '2017-05-29 00:00:00', '106838', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9397', '33450', '23', '2017-05-29 00:00:00', '945452', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9398', '33449', '23', '2017-05-29 00:00:00', '596554', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9399', '33448', '23', '2017-05-29 00:00:00', '465075', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9400', '33447', '23', '2017-05-29 00:00:00', '463565', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9401', '33446', '23', '2017-05-29 00:00:00', '734844', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9402', '33445', '23', '2017-05-29 00:00:00', '421542', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9403', '33444', '23', '2017-05-29 00:00:00', '344995', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9404', '33443', '23', '2017-05-29 00:00:00', '706033', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9405', '33442', '23', '2017-05-29 00:00:00', '670135', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9406', '33441', '23', '2017-05-29 00:00:00', '849459', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9407', '33440', '23', '2017-05-29 00:00:00', '244250', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9408', '33439', '23', '2017-05-29 00:00:00', '356118', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9409', '33438', '23', '2017-05-29 00:00:00', '835699', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9410', '33437', '23', '2017-05-29 00:00:00', '277182', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9411', '33436', '23', '2017-05-29 00:00:00', '922216', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9412', '33435', '23', '2017-05-29 00:00:00', '285696', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9413', '33434', '23', '2017-05-29 00:00:00', '865911', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9414', '33433', '23', '2017-05-29 00:00:00', '251583', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9415', '33432', '23', '2017-05-29 00:00:00', '888269', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9416', '33431', '23', '2017-05-29 00:00:00', '916641', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9417', '33430', '23', '2017-05-29 00:00:00', '845147', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9418', '33429', '23', '2017-05-29 00:00:00', '969540', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9419', '33428', '23', '2017-05-29 00:00:00', '901782', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9420', '33427', '23', '2017-05-29 00:00:00', '420828', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9421', '33426', '23', '2017-05-29 00:00:00', '407781', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9422', '33425', '23', '2017-05-29 00:00:00', '377926', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9423', '33424', '23', '2017-05-29 00:00:00', '372131', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9424', '33423', '23', '2017-05-29 00:00:00', '120132', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9425', '33422', '23', '2017-05-29 00:00:00', '538189', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9426', '33421', '23', '2017-05-29 00:00:00', '473617', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9427', '33420', '23', '2017-05-29 00:00:00', '958691', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9428', '33419', '23', '2017-05-29 00:00:00', '886428', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9429', '33418', '23', '2017-05-29 00:00:00', '870745', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9430', '33417', '23', '2017-05-29 00:00:00', '103488', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9431', '33416', '23', '2017-05-29 00:00:00', '270837', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9432', '33415', '23', '2017-05-29 00:00:00', '441592', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9433', '33414', '23', '2017-05-29 00:00:00', '589825', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9434', '33413', '23', '2017-05-29 00:00:00', '364413', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9435', '33412', '23', '2017-05-29 00:00:00', '867944', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9436', '33411', '23', '2017-05-29 00:00:00', '557498', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9437', '33410', '23', '2017-05-29 00:00:00', '229803', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9438', '33409', '23', '2017-05-29 00:00:00', '103268', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9439', '33408', '23', '2017-05-29 00:00:00', '359387', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9440', '33407', '23', '2017-05-29 00:00:00', '756021', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9441', '33406', '23', '2017-05-29 00:00:00', '775054', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9442', '33528', '23', '2017-05-30 00:00:00', '416928', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9443', '33527', '23', '2017-05-30 00:00:00', '404541', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9444', '33526', '23', '2017-05-30 00:00:00', '109036', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9445', '33525', '23', '2017-05-30 00:00:00', '959954', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9446', '33524', '23', '2017-05-30 00:00:00', '152267', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9447', '33523', '23', '2017-05-30 00:00:00', '412780', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9448', '33522', '23', '2017-05-30 00:00:00', '838418', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9449', '33521', '23', '2017-05-30 00:00:00', '868878', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9450', '33520', '23', '2017-05-30 00:00:00', '406161', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9451', '33519', '23', '2017-05-30 00:00:00', '243481', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9452', '33518', '23', '2017-05-30 00:00:00', '216043', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9453', '33517', '23', '2017-05-30 00:00:00', '136199', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9454', '33516', '23', '2017-05-30 00:00:00', '925485', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9455', '33515', '23', '2017-05-30 00:00:00', '206018', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9456', '33514', '23', '2017-05-30 00:00:00', '463784', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9457', '33513', '23', '2017-05-30 00:00:00', '646295', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9458', '33512', '23', '2017-05-30 00:00:00', '107113', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9459', '33511', '23', '2017-05-30 00:00:00', '159765', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9460', '33510', '23', '2017-05-30 00:00:00', '653518', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9461', '33509', '23', '2017-05-30 00:00:00', '233538', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9462', '33508', '23', '2017-05-30 00:00:00', '397921', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9463', '33507', '23', '2017-05-30 00:00:00', '414099', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9464', '33506', '23', '2017-05-30 00:00:00', '307119', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9465', '33505', '23', '2017-05-30 00:00:00', '782305', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9466', '33504', '23', '2017-05-30 00:00:00', '194784', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9467', '33503', '23', '2017-05-30 00:00:00', '828393', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9468', '33502', '23', '2017-05-30 00:00:00', '296463', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9469', '33501', '23', '2017-05-30 00:00:00', '126971', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9470', '33500', '23', '2017-05-30 00:00:00', '144577', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9471', '33499', '23', '2017-05-30 00:00:00', '812023', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9472', '33498', '23', '2017-05-30 00:00:00', '143423', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9473', '33497', '23', '2017-05-30 00:00:00', '151910', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9474', '33496', '23', '2017-05-30 00:00:00', '444174', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9475', '33495', '23', '2017-05-30 00:00:00', '224365', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9476', '33494', '23', '2017-05-30 00:00:00', '719876', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9477', '33493', '23', '2017-05-30 00:00:00', '491497', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9478', '33492', '23', '2017-05-30 00:00:00', '840451', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9479', '33491', '23', '2017-05-30 00:00:00', '274792', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9480', '33490', '23', '2017-05-30 00:00:00', '647695', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9481', '33489', '23', '2017-05-30 00:00:00', '330108', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9482', '33488', '23', '2017-05-30 00:00:00', '630282', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9483', '33487', '23', '2017-05-30 00:00:00', '822680', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9484', '33486', '23', '2017-05-30 00:00:00', '798757', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9485', '33485', '23', '2017-05-30 00:00:00', '202117', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9486', '33484', '23', '2017-05-30 00:00:00', '460543', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9487', '33483', '23', '2017-05-30 00:00:00', '377404', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9488', '33482', '23', '2017-05-30 00:00:00', '694937', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9489', '33481', '23', '2017-05-30 00:00:00', '191900', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9490', '33480', '23', '2017-05-30 00:00:00', '528109', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9491', '33479', '23', '2017-05-30 00:00:00', '598339', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9492', '33478', '23', '2017-05-30 00:00:00', '308108', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9493', '33477', '23', '2017-05-30 00:00:00', '833831', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9494', '33476', '23', '2017-05-30 00:00:00', '579855', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9495', '33475', '23', '2017-05-30 00:00:00', '894860', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9496', '33474', '23', '2017-05-30 00:00:00', '960147', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9497', '33473', '23', '2017-05-30 00:00:00', '412286', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9498', '33472', '23', '2017-05-30 00:00:00', '812655', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9499', '33471', '23', '2017-05-30 00:00:00', '226342', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9500', '33470', '23', '2017-05-30 00:00:00', '822927', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9501', '33469', '23', '2017-05-30 00:00:00', '361639', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9502', '33468', '23', '2017-05-30 00:00:00', '973385', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9503', '33467', '23', '2017-05-30 00:00:00', '702160', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9504', '33466', '23', '2017-05-30 00:00:00', '318325', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9505', '33465', '23', '2017-05-30 00:00:00', '766265', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9506', '33464', '23', '2017-05-30 00:00:00', '358920', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9507', '33463', '23', '2017-05-30 00:00:00', '381689', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9508', '33462', '23', '2017-05-30 00:00:00', '318215', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9509', '33461', '23', '2017-05-30 00:00:00', '360540', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9510', '33460', '23', '2017-05-30 00:00:00', '516134', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9511', '33459', '23', '2017-05-30 00:00:00', '474304', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9512', '33458', '23', '2017-05-30 00:00:00', '344473', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9513', '33457', '23', '2017-05-30 00:00:00', '128839', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9514', '33456', '23', '2017-05-30 00:00:00', '741903', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9515', '33455', '23', '2017-05-30 00:00:00', '839379', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9516', '33454', '23', '2017-05-30 00:00:00', '368972', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9517', '33453', '23', '2017-05-30 00:00:00', '605535', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9518', '33452', '23', '2017-05-30 00:00:00', '783102', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9519', '33451', '23', '2017-05-30 00:00:00', '886291', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9520', '33450', '23', '2017-05-30 00:00:00', '813589', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9521', '33449', '23', '2017-05-30 00:00:00', '975006', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9522', '33448', '23', '2017-05-30 00:00:00', '836605', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9523', '33447', '23', '2017-05-30 00:00:00', '474414', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9524', '33446', '23', '2017-05-30 00:00:00', '750198', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9525', '33445', '23', '2017-05-30 00:00:00', '871624', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9526', '33444', '23', '2017-05-30 00:00:00', '649288', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9527', '33443', '23', '2017-05-30 00:00:00', '813122', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9528', '33442', '23', '2017-05-30 00:00:00', '600674', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9529', '33441', '23', '2017-05-30 00:00:00', '379766', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9530', '33440', '23', '2017-05-30 00:00:00', '418026', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9531', '33439', '23', '2017-05-30 00:00:00', '861791', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9532', '33438', '23', '2017-05-30 00:00:00', '336892', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9533', '33437', '23', '2017-05-30 00:00:00', '933807', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9534', '33436', '23', '2017-05-30 00:00:00', '789694', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9535', '33435', '23', '2017-05-30 00:00:00', '929797', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9536', '33434', '23', '2017-05-30 00:00:00', '380728', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9537', '33433', '23', '2017-05-30 00:00:00', '818121', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9538', '33432', '23', '2017-05-30 00:00:00', '161166', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9539', '33431', '23', '2017-05-30 00:00:00', '876513', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9540', '33430', '23', '2017-05-30 00:00:00', '704055', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9541', '33429', '23', '2017-05-30 00:00:00', '567083', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9542', '33428', '23', '2017-05-30 00:00:00', '979318', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9543', '33427', '23', '2017-05-30 00:00:00', '111315', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9544', '33426', '23', '2017-05-30 00:00:00', '828750', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9545', '33425', '23', '2017-05-30 00:00:00', '265069', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9546', '33424', '23', '2017-05-30 00:00:00', '741024', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9547', '33423', '23', '2017-05-30 00:00:00', '293579', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9548', '33422', '23', '2017-05-30 00:00:00', '726687', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9549', '33421', '23', '2017-05-30 00:00:00', '446453', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9550', '33420', '23', '2017-05-30 00:00:00', '993161', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9551', '33419', '23', '2017-05-30 00:00:00', '832678', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9552', '33418', '23', '2017-05-30 00:00:00', '819741', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9553', '33417', '23', '2017-05-30 00:00:00', '295611', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9554', '33416', '23', '2017-05-30 00:00:00', '132601', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9555', '33415', '23', '2017-05-30 00:00:00', '687988', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9556', '33414', '23', '2017-05-30 00:00:00', '179788', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9557', '33413', '23', '2017-05-30 00:00:00', '346917', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9558', '33412', '23', '2017-05-30 00:00:00', '606222', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9559', '33411', '23', '2017-05-30 00:00:00', '168884', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9560', '33410', '23', '2017-05-30 00:00:00', '128701', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9561', '33409', '23', '2017-05-30 00:00:00', '684747', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9562', '33408', '23', '2017-05-30 00:00:00', '810897', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9563', '33407', '23', '2017-05-30 00:00:00', '934741', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9564', '33406', '23', '2017-05-30 00:00:00', '638357', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9565', '33528', '23', '2017-05-31 00:00:00', '943475', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9566', '33527', '23', '2017-05-31 00:00:00', '493502', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9567', '33526', '23', '2017-05-31 00:00:00', '594934', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9568', '33525', '23', '2017-05-31 00:00:00', '330630', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9569', '33524', '23', '2017-05-31 00:00:00', '307476', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9570', '33523', '23', '2017-05-31 00:00:00', '750912', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9571', '33522', '23', '2017-05-31 00:00:00', '808837', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9572', '33521', '23', '2017-05-31 00:00:00', '977395', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9573', '33520', '23', '2017-05-31 00:00:00', '211126', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9574', '33519', '23', '2017-05-31 00:00:00', '430001', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9575', '33518', '23', '2017-05-31 00:00:00', '985827', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9576', '33517', '23', '2017-05-31 00:00:00', '300527', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9577', '33516', '23', '2017-05-31 00:00:00', '738800', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9578', '33515', '23', '2017-05-31 00:00:00', '627645', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9579', '33514', '23', '2017-05-31 00:00:00', '985278', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9580', '33513', '23', '2017-05-31 00:00:00', '971902', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9581', '33512', '23', '2017-05-31 00:00:00', '624871', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9582', '33511', '23', '2017-05-31 00:00:00', '190719', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9583', '33510', '23', '2017-05-31 00:00:00', '216564', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9584', '33509', '23', '2017-05-31 00:00:00', '713394', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9585', '33508', '23', '2017-05-31 00:00:00', '853717', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9586', '33507', '23', '2017-05-31 00:00:00', '216098', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9587', '33506', '23', '2017-05-31 00:00:00', '339062', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9588', '33505', '23', '2017-05-31 00:00:00', '396878', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9589', '33504', '23', '2017-05-31 00:00:00', '159710', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9590', '33503', '23', '2017-05-31 00:00:00', '450656', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9591', '33502', '23', '2017-05-31 00:00:00', '762145', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9592', '33501', '23', '2017-05-31 00:00:00', '444229', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9593', '33500', '23', '2017-05-31 00:00:00', '427227', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9594', '33499', '23', '2017-05-31 00:00:00', '191268', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9595', '33498', '23', '2017-05-31 00:00:00', '445190', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9596', '33497', '23', '2017-05-31 00:00:00', '827322', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9597', '33496', '23', '2017-05-31 00:00:00', '390643', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9598', '33495', '23', '2017-05-31 00:00:00', '984811', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9599', '33494', '23', '2017-05-31 00:00:00', '597570', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9600', '33493', '23', '2017-05-31 00:00:00', '168032', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9601', '33492', '23', '2017-05-31 00:00:00', '134332', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9602', '33491', '23', '2017-05-31 00:00:00', '328158', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9603', '33490', '23', '2017-05-31 00:00:00', '178662', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9604', '33489', '23', '2017-05-31 00:00:00', '238235', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9605', '33488', '23', '2017-05-31 00:00:00', '192669', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9606', '33487', '23', '2017-05-31 00:00:00', '668185', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9607', '33486', '23', '2017-05-31 00:00:00', '397839', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9608', '33485', '23', '2017-05-31 00:00:00', '559805', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9609', '33484', '23', '2017-05-31 00:00:00', '650030', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9610', '33483', '23', '2017-05-31 00:00:00', '401766', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9611', '33482', '23', '2017-05-31 00:00:00', '214477', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9612', '33481', '23', '2017-05-31 00:00:00', '204617', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9613', '33480', '23', '2017-05-31 00:00:00', '240789', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9614', '33479', '23', '2017-05-31 00:00:00', '175778', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9615', '33478', '23', '2017-05-31 00:00:00', '837951', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9616', '33477', '23', '2017-05-31 00:00:00', '494546', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9617', '33476', '23', '2017-05-31 00:00:00', '849322', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9618', '33475', '23', '2017-05-31 00:00:00', '187094', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9619', '33474', '23', '2017-05-31 00:00:00', '327636', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9620', '33473', '23', '2017-05-31 00:00:00', '501467', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9621', '33472', '23', '2017-05-31 00:00:00', '310003', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9622', '33471', '23', '2017-05-31 00:00:00', '182589', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9623', '33470', '23', '2017-05-31 00:00:00', '792907', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9624', '33469', '23', '2017-05-31 00:00:00', '647256', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9625', '33468', '23', '2017-05-31 00:00:00', '507208', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9626', '33467', '23', '2017-05-31 00:00:00', '359140', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9627', '33466', '23', '2017-05-31 00:00:00', '293139', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9628', '33465', '23', '2017-05-31 00:00:00', '903787', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9629', '33464', '23', '2017-05-31 00:00:00', '175311', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9630', '33463', '23', '2017-05-31 00:00:00', '463619', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9631', '33462', '23', '2017-05-31 00:00:00', '937707', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9632', '33461', '23', '2017-05-31 00:00:00', '792935', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9633', '33460', '23', '2017-05-31 00:00:00', '298687', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9634', '33459', '23', '2017-05-31 00:00:00', '692904', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9635', '33458', '23', '2017-05-31 00:00:00', '785986', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9636', '33457', '23', '2017-05-31 00:00:00', '286575', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9637', '33456', '23', '2017-05-31 00:00:00', '511712', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9638', '33455', '23', '2017-05-31 00:00:00', '793869', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9639', '33454', '23', '2017-05-31 00:00:00', '147351', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9640', '33453', '23', '2017-05-31 00:00:00', '706582', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9641', '33452', '23', '2017-05-31 00:00:00', '898760', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9642', '33451', '23', '2017-05-31 00:00:00', '963388', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9643', '33450', '23', '2017-05-31 00:00:00', '681176', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9644', '33449', '23', '2017-05-31 00:00:00', '224832', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9645', '33448', '23', '2017-05-31 00:00:00', '194207', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9646', '33447', '23', '2017-05-31 00:00:00', '948336', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9647', '33446', '23', '2017-05-31 00:00:00', '896838', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9648', '33445', '23', '2017-05-31 00:00:00', '163198', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9649', '33444', '23', '2017-05-31 00:00:00', '282427', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9650', '33443', '23', '2017-05-31 00:00:00', '945590', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9651', '33442', '23', '2017-05-31 00:00:00', '653710', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9652', '33441', '23', '2017-05-31 00:00:00', '493557', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9653', '33440', '23', '2017-05-31 00:00:00', '797796', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9654', '33439', '23', '2017-05-31 00:00:00', '702023', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9655', '33438', '23', '2017-05-31 00:00:00', '261169', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9656', '33437', '23', '2017-05-31 00:00:00', '737783', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9657', '33436', '23', '2017-05-31 00:00:00', '924688', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9658', '33435', '23', '2017-05-31 00:00:00', '414511', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9659', '33434', '23', '2017-05-31 00:00:00', '478588', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9660', '33433', '23', '2017-05-31 00:00:00', '867752', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9661', '33432', '23', '2017-05-31 00:00:00', '297479', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9662', '33431', '23', '2017-05-31 00:00:00', '729928', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9663', '33430', '23', '2017-05-31 00:00:00', '715344', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9664', '33429', '23', '2017-05-31 00:00:00', '405337', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9665', '33428', '23', '2017-05-31 00:00:00', '800543', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9666', '33427', '23', '2017-05-31 00:00:00', '945150', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9667', '33426', '23', '2017-05-31 00:00:00', '830810', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9668', '33425', '23', '2017-05-31 00:00:00', '222415', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9669', '33424', '23', '2017-05-31 00:00:00', '268255', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9670', '33423', '23', '2017-05-31 00:00:00', '807052', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9671', '33422', '23', '2017-05-31 00:00:00', '234362', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9672', '33421', '23', '2017-05-31 00:00:00', '740859', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9673', '33420', '23', '2017-05-31 00:00:00', '584991', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9674', '33419', '23', '2017-05-31 00:00:00', '512509', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9675', '33418', '23', '2017-05-31 00:00:00', '585375', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9676', '33417', '23', '2017-05-31 00:00:00', '132546', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9677', '33416', '23', '2017-05-31 00:00:00', '485125', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9678', '33415', '23', '2017-05-31 00:00:00', '708395', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9679', '33414', '23', '2017-05-31 00:00:00', '393225', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9680', '33413', '23', '2017-05-31 00:00:00', '619351', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9681', '33412', '23', '2017-05-31 00:00:00', '953033', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9682', '33411', '23', '2017-05-31 00:00:00', '691586', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9683', '33410', '23', '2017-05-31 00:00:00', '417285', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9684', '33409', '23', '2017-05-31 00:00:00', '373147', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9685', '33408', '23', '2017-05-31 00:00:00', '723089', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9686', '33407', '23', '2017-05-31 00:00:00', '208956', '0', null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('9687', '33406', '23', '2017-05-31 00:00:00', '966931', '0', null, null, null, null, null, '0', '0', '0', null);

-- ----------------------------
-- Table structure for autumn_lottery_time
-- ----------------------------
DROP TABLE IF EXISTS `autumn_lottery_time`;
CREATE TABLE `autumn_lottery_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periods` int(11) DEFAULT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `time` varchar(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33529 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_time
-- ----------------------------
INSERT INTO `autumn_lottery_time` VALUES ('33406', '1', '23', '21:02', '75720');
INSERT INTO `autumn_lottery_time` VALUES ('33407', '2', '23', '21:04', '75840');
INSERT INTO `autumn_lottery_time` VALUES ('33408', '3', '23', '21:06', '75960');
INSERT INTO `autumn_lottery_time` VALUES ('33409', '4', '23', '21:08', '76080');
INSERT INTO `autumn_lottery_time` VALUES ('33410', '5', '23', '21:10', '76200');
INSERT INTO `autumn_lottery_time` VALUES ('33411', '6', '23', '21:12', '76320');
INSERT INTO `autumn_lottery_time` VALUES ('33412', '7', '23', '21:14', '76440');
INSERT INTO `autumn_lottery_time` VALUES ('33413', '8', '23', '21:16', '76560');
INSERT INTO `autumn_lottery_time` VALUES ('33414', '9', '23', '21:18', '76680');
INSERT INTO `autumn_lottery_time` VALUES ('33415', '10', '23', '21:20', '76800');
INSERT INTO `autumn_lottery_time` VALUES ('33416', '11', '23', '21:22', '76920');
INSERT INTO `autumn_lottery_time` VALUES ('33417', '12', '23', '21:24', '77040');
INSERT INTO `autumn_lottery_time` VALUES ('33418', '13', '23', '21:26', '77160');
INSERT INTO `autumn_lottery_time` VALUES ('33419', '14', '23', '21:28', '77280');
INSERT INTO `autumn_lottery_time` VALUES ('33420', '15', '23', '21:30', '77400');
INSERT INTO `autumn_lottery_time` VALUES ('33421', '16', '23', '21:32', '77520');
INSERT INTO `autumn_lottery_time` VALUES ('33422', '17', '23', '21:34', '77640');
INSERT INTO `autumn_lottery_time` VALUES ('33423', '18', '23', '21:36', '77760');
INSERT INTO `autumn_lottery_time` VALUES ('33424', '19', '23', '21:38', '77880');
INSERT INTO `autumn_lottery_time` VALUES ('33425', '20', '23', '21:40', '78000');
INSERT INTO `autumn_lottery_time` VALUES ('33426', '21', '23', '21:42', '78120');
INSERT INTO `autumn_lottery_time` VALUES ('33427', '22', '23', '21:44', '78240');
INSERT INTO `autumn_lottery_time` VALUES ('33428', '23', '23', '21:46', '78360');
INSERT INTO `autumn_lottery_time` VALUES ('33429', '24', '23', '21:48', '78480');
INSERT INTO `autumn_lottery_time` VALUES ('33430', '25', '23', '21:50', '78600');
INSERT INTO `autumn_lottery_time` VALUES ('33431', '26', '23', '21:52', '78720');
INSERT INTO `autumn_lottery_time` VALUES ('33432', '27', '23', '21:54', '78840');
INSERT INTO `autumn_lottery_time` VALUES ('33433', '28', '23', '21:56', '78960');
INSERT INTO `autumn_lottery_time` VALUES ('33434', '29', '23', '21:58', '79080');
INSERT INTO `autumn_lottery_time` VALUES ('33435', '30', '23', '22:00', '79200');
INSERT INTO `autumn_lottery_time` VALUES ('33436', '31', '23', '22:02', '79320');
INSERT INTO `autumn_lottery_time` VALUES ('33437', '32', '23', '22:04', '79440');
INSERT INTO `autumn_lottery_time` VALUES ('33438', '33', '23', '22:06', '79560');
INSERT INTO `autumn_lottery_time` VALUES ('33439', '34', '23', '22:08', '79680');
INSERT INTO `autumn_lottery_time` VALUES ('33440', '35', '23', '22:10', '79800');
INSERT INTO `autumn_lottery_time` VALUES ('33441', '36', '23', '22:12', '79920');
INSERT INTO `autumn_lottery_time` VALUES ('33442', '37', '23', '22:14', '80040');
INSERT INTO `autumn_lottery_time` VALUES ('33443', '38', '23', '22:16', '80160');
INSERT INTO `autumn_lottery_time` VALUES ('33444', '39', '23', '22:18', '80280');
INSERT INTO `autumn_lottery_time` VALUES ('33445', '40', '23', '22:20', '80400');
INSERT INTO `autumn_lottery_time` VALUES ('33446', '41', '23', '22:22', '80520');
INSERT INTO `autumn_lottery_time` VALUES ('33447', '42', '23', '22:24', '80640');
INSERT INTO `autumn_lottery_time` VALUES ('33448', '43', '23', '22:26', '80760');
INSERT INTO `autumn_lottery_time` VALUES ('33449', '44', '23', '22:28', '80880');
INSERT INTO `autumn_lottery_time` VALUES ('33450', '45', '23', '22:30', '81000');
INSERT INTO `autumn_lottery_time` VALUES ('33451', '46', '23', '22:32', '81120');
INSERT INTO `autumn_lottery_time` VALUES ('33452', '47', '23', '22:34', '81240');
INSERT INTO `autumn_lottery_time` VALUES ('33453', '48', '23', '22:36', '81360');
INSERT INTO `autumn_lottery_time` VALUES ('33454', '49', '23', '22:38', '81480');
INSERT INTO `autumn_lottery_time` VALUES ('33455', '50', '23', '22:40', '81600');
INSERT INTO `autumn_lottery_time` VALUES ('33456', '51', '23', '22:42', '81720');
INSERT INTO `autumn_lottery_time` VALUES ('33457', '52', '23', '22:44', '81840');
INSERT INTO `autumn_lottery_time` VALUES ('33458', '53', '23', '22:46', '81960');
INSERT INTO `autumn_lottery_time` VALUES ('33459', '54', '23', '22:48', '82080');
INSERT INTO `autumn_lottery_time` VALUES ('33460', '55', '23', '22:50', '82200');
INSERT INTO `autumn_lottery_time` VALUES ('33461', '56', '23', '22:52', '82320');
INSERT INTO `autumn_lottery_time` VALUES ('33462', '57', '23', '22:54', '82440');
INSERT INTO `autumn_lottery_time` VALUES ('33463', '58', '23', '22:56', '82560');
INSERT INTO `autumn_lottery_time` VALUES ('33464', '59', '23', '22:58', '82680');
INSERT INTO `autumn_lottery_time` VALUES ('33465', '60', '23', '23:00', '82800');
INSERT INTO `autumn_lottery_time` VALUES ('33466', '61', '23', '23:02', '82920');
INSERT INTO `autumn_lottery_time` VALUES ('33467', '62', '23', '23:04', '83040');
INSERT INTO `autumn_lottery_time` VALUES ('33468', '63', '23', '23:06', '83160');
INSERT INTO `autumn_lottery_time` VALUES ('33469', '64', '23', '23:08', '83280');
INSERT INTO `autumn_lottery_time` VALUES ('33470', '65', '23', '23:10', '83400');
INSERT INTO `autumn_lottery_time` VALUES ('33471', '66', '23', '23:12', '83520');
INSERT INTO `autumn_lottery_time` VALUES ('33472', '67', '23', '23:14', '83640');
INSERT INTO `autumn_lottery_time` VALUES ('33473', '68', '23', '23:16', '83760');
INSERT INTO `autumn_lottery_time` VALUES ('33474', '69', '23', '23:18', '83880');
INSERT INTO `autumn_lottery_time` VALUES ('33475', '70', '23', '23:20', '84000');
INSERT INTO `autumn_lottery_time` VALUES ('33476', '71', '23', '23:22', '84120');
INSERT INTO `autumn_lottery_time` VALUES ('33477', '72', '23', '23:24', '84240');
INSERT INTO `autumn_lottery_time` VALUES ('33478', '73', '23', '23:26', '84360');
INSERT INTO `autumn_lottery_time` VALUES ('33479', '74', '23', '23:28', '84480');
INSERT INTO `autumn_lottery_time` VALUES ('33480', '75', '23', '23:30', '84600');
INSERT INTO `autumn_lottery_time` VALUES ('33481', '76', '23', '23:32', '84720');
INSERT INTO `autumn_lottery_time` VALUES ('33482', '77', '23', '23:34', '84840');
INSERT INTO `autumn_lottery_time` VALUES ('33483', '78', '23', '23:36', '84960');
INSERT INTO `autumn_lottery_time` VALUES ('33484', '79', '23', '23:38', '85080');
INSERT INTO `autumn_lottery_time` VALUES ('33485', '80', '23', '23:40', '85200');
INSERT INTO `autumn_lottery_time` VALUES ('33486', '81', '23', '23:42', '85320');
INSERT INTO `autumn_lottery_time` VALUES ('33487', '82', '23', '23:44', '85440');
INSERT INTO `autumn_lottery_time` VALUES ('33488', '83', '23', '23:46', '85560');
INSERT INTO `autumn_lottery_time` VALUES ('33489', '84', '23', '23:48', '85680');
INSERT INTO `autumn_lottery_time` VALUES ('33490', '85', '23', '23:50', '85800');
INSERT INTO `autumn_lottery_time` VALUES ('33491', '86', '23', '23:52', '85920');
INSERT INTO `autumn_lottery_time` VALUES ('33492', '87', '23', '23:54', '86040');
INSERT INTO `autumn_lottery_time` VALUES ('33493', '88', '23', '23:56', '86160');
INSERT INTO `autumn_lottery_time` VALUES ('33494', '89', '23', '23:58', '86280');
INSERT INTO `autumn_lottery_time` VALUES ('33495', '90', '23', '00:00', '86400');
INSERT INTO `autumn_lottery_time` VALUES ('33496', '91', '23', '00:02', '86520');
INSERT INTO `autumn_lottery_time` VALUES ('33497', '92', '23', '00:04', '86640');
INSERT INTO `autumn_lottery_time` VALUES ('33498', '93', '23', '00:06', '86760');
INSERT INTO `autumn_lottery_time` VALUES ('33499', '94', '23', '00:08', '86880');
INSERT INTO `autumn_lottery_time` VALUES ('33500', '95', '23', '00:10', '87000');
INSERT INTO `autumn_lottery_time` VALUES ('33501', '96', '23', '00:12', '87120');
INSERT INTO `autumn_lottery_time` VALUES ('33502', '97', '23', '00:14', '87240');
INSERT INTO `autumn_lottery_time` VALUES ('33503', '98', '23', '00:16', '87360');
INSERT INTO `autumn_lottery_time` VALUES ('33504', '99', '23', '00:18', '87480');
INSERT INTO `autumn_lottery_time` VALUES ('33505', '100', '23', '00:20', '87600');
INSERT INTO `autumn_lottery_time` VALUES ('33506', '101', '23', '00:22', '87720');
INSERT INTO `autumn_lottery_time` VALUES ('33507', '102', '23', '00:24', '87840');
INSERT INTO `autumn_lottery_time` VALUES ('33508', '103', '23', '00:26', '87960');
INSERT INTO `autumn_lottery_time` VALUES ('33509', '104', '23', '00:28', '88080');
INSERT INTO `autumn_lottery_time` VALUES ('33510', '105', '23', '00:30', '88200');
INSERT INTO `autumn_lottery_time` VALUES ('33511', '106', '23', '00:32', '88320');
INSERT INTO `autumn_lottery_time` VALUES ('33512', '107', '23', '00:34', '88440');
INSERT INTO `autumn_lottery_time` VALUES ('33513', '108', '23', '00:36', '88560');
INSERT INTO `autumn_lottery_time` VALUES ('33514', '109', '23', '00:38', '88680');
INSERT INTO `autumn_lottery_time` VALUES ('33515', '110', '23', '00:40', '88800');
INSERT INTO `autumn_lottery_time` VALUES ('33516', '111', '23', '00:42', '88920');
INSERT INTO `autumn_lottery_time` VALUES ('33517', '112', '23', '00:44', '89040');
INSERT INTO `autumn_lottery_time` VALUES ('33518', '113', '23', '00:46', '89160');
INSERT INTO `autumn_lottery_time` VALUES ('33519', '114', '23', '00:48', '89280');
INSERT INTO `autumn_lottery_time` VALUES ('33520', '115', '23', '00:50', '89400');
INSERT INTO `autumn_lottery_time` VALUES ('33521', '116', '23', '00:52', '89520');
INSERT INTO `autumn_lottery_time` VALUES ('33522', '117', '23', '00:54', '89640');
INSERT INTO `autumn_lottery_time` VALUES ('33523', '118', '23', '00:56', '89760');
INSERT INTO `autumn_lottery_time` VALUES ('33524', '119', '23', '00:58', '89880');
INSERT INTO `autumn_lottery_time` VALUES ('33525', '120', '23', '01:00', '90000');
INSERT INTO `autumn_lottery_time` VALUES ('33526', '121', '23', '01:02', '90120');
INSERT INTO `autumn_lottery_time` VALUES ('33527', '122', '23', '01:04', '90240');
INSERT INTO `autumn_lottery_time` VALUES ('33528', '123', '23', '01:06', '90360');

-- ----------------------------
-- Table structure for autumn_recharge
-- ----------------------------
DROP TABLE IF EXISTS `autumn_recharge`;
CREATE TABLE `autumn_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `money` double DEFAULT NULL,
  `out_time` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_recharge
-- ----------------------------
INSERT INTO `autumn_recharge` VALUES ('1', '1', 'C2017052201561', '2017-05-22 23:57:11', '100', '0', '1', '0');

-- ----------------------------
-- Table structure for autumn_user
-- ----------------------------
DROP TABLE IF EXISTS `autumn_user`;
CREATE TABLE `autumn_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `salt` int(11) NOT NULL,
  `integral` int(11) DEFAULT '0',
  `source` int(11) DEFAULT '0',
  `reg_time` datetime NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `money` double NOT NULL,
  `rebate` double DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_user
-- ----------------------------
INSERT INTO `autumn_user` VALUES ('1', 'xiaodao', 'xiaodao', 'd5a73923a187b6eddec095bb238df363', '473645', '0', null, '2017-05-21 06:48:32', 'localhost', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for autumn_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `autumn_withdrawals`;
CREATE TABLE `autumn_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_withdrawals
-- ----------------------------
INSERT INTO `autumn_withdrawals` VALUES ('1', '1', 'T20170522153153', '2017-05-23 00:05:27', null, '100', '1');
