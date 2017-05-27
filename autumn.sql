/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : autumn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-28 00:05:27
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
INSERT INTO `autumn_admin_user` VALUES ('1', '超级管理员', '', 'admin123456', 'ae2f4f5052e0096ca325861f1c6b510e', '818038', '0', '1495758274', '127.168.0.1', '1495835277', '127.168.0.1', '', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_game_rule
-- ----------------------------
INSERT INTO `autumn_game_rule` VALUES ('51', null, '五星', null, null, null, null, '50', '1', null, '0', '0', '0', '0', '0', '2017-05-19 12:09:07');
INSERT INTO `autumn_game_rule` VALUES ('53', null, '三星', null, null, null, null, '50', '1', null, '0', '0', '0', '0', '0', '2017-05-19 12:09:20');
INSERT INTO `autumn_game_rule` VALUES ('55', null, '时时彩', '5', null, null, null, null, '0', null, '0', '0', '0', '0', '0', '2017-05-20 03:06:51');
INSERT INTO `autumn_game_rule` VALUES ('56', null, '五星', null, null, null, null, '55', '1', null, '0', '0', '0', '0', '0', '2017-05-20 03:07:00');
INSERT INTO `autumn_game_rule` VALUES ('57', 'five_stars', '五星复式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '五星复式', '五星复式', '56', '2', null, '1', '199000', '170000', '75000', '0', '2017-05-27 09:26:49');
INSERT INTO `autumn_game_rule` VALUES ('58', 'five_star', '五星单式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '五星', '五星', '56', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:27:50');
INSERT INTO `autumn_game_rule` VALUES ('59', null, '四星', null, null, null, null, '55', '1', null, '0', '0', '0', '0', '0', '2017-05-27 09:28:02');
INSERT INTO `autumn_game_rule` VALUES ('60', 'start_four_stars', '前四复式', null, '1=a&&2=b&&3=c&&4=d', '前四复式', '前四复式', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:28:25');
INSERT INTO `autumn_game_rule` VALUES ('61', 'start_four_star', '前四单式', null, '1=a&&2=b&&3=c&&4=d', 'start_four_star', 'start_four_star', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:28:41');
INSERT INTO `autumn_game_rule` VALUES ('62', 'end_four_stars', '后四复式', null, '2=b&&3=c&&4=d&&5=e', 'end_four_stars', 'end_four_stars', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:28:55');
INSERT INTO `autumn_game_rule` VALUES ('63', 'end_four_star', '后四单式', null, '2=b&&3=c&&4=d&&5=e', 'end_four_star', 'end_four_star', '59', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:29:11');
INSERT INTO `autumn_game_rule` VALUES ('64', null, '三星', null, null, null, null, '55', '1', null, '0', '0', '0', '0', '0', '2017-05-27 09:29:22');
INSERT INTO `autumn_game_rule` VALUES ('65', 'start_three_stars', '前三复式', null, '1=a&&2=b&&3=c', 'start_three_stars', 'start_three_stars', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:29:53');
INSERT INTO `autumn_game_rule` VALUES ('66', 'start_three_star', '前三单式', null, '1=a&&2=b&&3=c', 'start_three_star', 'start_three_star', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:30:08');
INSERT INTO `autumn_game_rule` VALUES ('67', 'center_three_stars', '中三复式', null, '2=b&&3=c&&4=d', 'center_three_stars', 'center_three_stars', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:30:24');
INSERT INTO `autumn_game_rule` VALUES ('68', 'center_three_star', '中三单式', null, '2=b&&3=c&&4=d', 'center_three_star', 'center_three_star', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:30:41');
INSERT INTO `autumn_game_rule` VALUES ('69', 'end_three_stars', '后三复式', null, '3=c&&4=d&&5=e', 'end_three_stars', 'end_three_stars', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:30:59');
INSERT INTO `autumn_game_rule` VALUES ('70', 'end_three_star', '后三单式', null, '3=c&&4=d&&5=e', 'end_three_star', 'end_three_star', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:31:18');
INSERT INTO `autumn_game_rule` VALUES ('71', 'end_three_group_three', '后三组三', null, 'null', 'end_three_group_three', 'end_three_group_three', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:31:35');
INSERT INTO `autumn_game_rule` VALUES ('72', 'end_three_group_six', '后三组六', null, 'end_three_group_six', 'end_three_group_six', 'end_three_group_six', '64', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:31:46');
INSERT INTO `autumn_game_rule` VALUES ('73', null, '二星', null, null, null, null, '55', '1', null, '0', '0', '0', '0', '0', '2017-05-27 09:31:53');
INSERT INTO `autumn_game_rule` VALUES ('74', 'start_two_stars', '前二复式', null, '1=a&&2=b', 'start_two_stars', 'start_two_stars', '73', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:32:07');
INSERT INTO `autumn_game_rule` VALUES ('75', 'start_two_star', '前二单式', null, '1=a&&2=b', 'start_two_star', 'start_two_star', '73', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:32:21');
INSERT INTO `autumn_game_rule` VALUES ('76', 'end_two_stars', '后二复式', null, '4=d&&5=e', 'end_two_stars', 'end_two_stars', '73', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:32:35');
INSERT INTO `autumn_game_rule` VALUES ('77', 'end_two_star', '后二单式', null, '4=d&&5=e', 'end_two_star', 'end_two_star', '73', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:33:06');
INSERT INTO `autumn_game_rule` VALUES ('78', null, '定位胆', null, null, null, null, '55', '1', null, '0', '0', '0', '0', '0', '2017-05-27 09:37:54');
INSERT INTO `autumn_game_rule` VALUES ('79', 'five_location', '五星定位胆', null, '1=a||2=b||3=c||4=d||5=e', 'five_location', 'five_location', '78', '2', null, '0', '0', '0', '0', '0', '2017-05-27 09:38:07');

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
  `draw_interval` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery
-- ----------------------------
INSERT INTO `autumn_lottery` VALUES ('20', '重庆时时彩', '55', '120', '20', '300', '20');

-- ----------------------------
-- Table structure for autumn_lottery_data
-- ----------------------------
DROP TABLE IF EXISTS `autumn_lottery_data`;
CREATE TABLE `autumn_lottery_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `byid` varchar(32) NOT NULL,
  `periods` int(11) DEFAULT NULL,
  `from_time_id` int(11) NOT NULL,
  `from_lottery` int(11) NOT NULL,
  `day` datetime DEFAULT NULL,
  `data` varchar(20) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `lottery_time` datetime DEFAULT NULL,
  `order_count` int(11) DEFAULT '0',
  `send_lottery_count` int(11) DEFAULT '0',
  `winning_count` int(11) DEFAULT '0',
  `participate_count` int(11) DEFAULT '0',
  `betting_money` double NOT NULL DEFAULT '0',
  `winning_money` double NOT NULL DEFAULT '0',
  `rebate_money` double NOT NULL DEFAULT '0',
  `profit_loss` double DEFAULT '0',
  PRIMARY KEY (`id`,`from_time_id`,`from_lottery`)
) ENGINE=InnoDB AUTO_INCREMENT=21121 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_data
-- ----------------------------
INSERT INTO `autumn_lottery_data` VALUES ('20161', '20170527120', '120', '33165', '20', '2017-05-27 00:00:00', '290859', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20162', '20170527119', '119', '33164', '20', '2017-05-27 00:00:00', '134991', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20163', '20170527118', '118', '33163', '20', '2017-05-27 00:00:00', '962509', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20164', '20170527117', '117', '33162', '20', '2017-05-27 00:00:00', '135375', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20165', '20170527116', '116', '33161', '20', '2017-05-27 00:00:00', '582546', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20166', '20170527115', '115', '33160', '20', '2017-05-27 00:00:00', '935125', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20167', '20170527114', '114', '33159', '20', '2017-05-27 00:00:00', '258395', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20168', '20170527113', '113', '33158', '20', '2017-05-27 00:00:00', '843225', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20169', '20170527112', '112', '33157', '20', '2017-05-27 00:00:00', '169351', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20170', '20170527111', '111', '33156', '20', '2017-05-27 00:00:00', '503033', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20171', '20170527110', '110', '33155', '20', '2017-05-27 00:00:00', '241586', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20172', '20170527109', '109', '33154', '20', '2017-05-27 00:00:00', '867285', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20173', '20170527108', '108', '33153', '20', '2017-05-27 00:00:00', '823147', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20174', '20170527107', '107', '33152', '20', '2017-05-27 00:00:00', '273089', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20175', '20170527106', '106', '33151', '20', '2017-05-27 00:00:00', '658956', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20176', '20170527105', '105', '33150', '20', '2017-05-27 00:00:00', '516931', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20177', '20170527104', '104', '33149', '20', '2017-05-27 00:00:00', '265811', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20178', '20170527103', '103', '33148', '20', '2017-05-27 00:00:00', '329669', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20179', '20170527102', '102', '33147', '20', '2017-05-27 00:00:00', '807382', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20180', '20170527101', '101', '33146', '20', '2017-05-27 00:00:00', '551538', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20181', '20170527100', '100', '33145', '20', '2017-05-27 00:00:00', '269216', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20182', '2017052799', '99', '33144', '20', '2017-05-27 00:00:00', '307147', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20183', '2017052798', '98', '33143', '20', '2017-05-27 00:00:00', '433737', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20184', '2017052797', '97', '33142', '20', '2017-05-27 00:00:00', '380480', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20185', '2017052796', '96', '33141', '20', '2017-05-27 00:00:00', '355239', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20186', '2017052795', '95', '33140', '20', '2017-05-27 00:00:00', '289898', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20187', '2017052794', '94', '33139', '20', '2017-05-27 00:00:00', '634896', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20188', '2017052793', '93', '33138', '20', '2017-05-27 00:00:00', '763134', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20189', '2017052792', '92', '33137', '20', '2017-05-27 00:00:00', '495755', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20190', '2017052791', '91', '33136', '20', '2017-05-27 00:00:00', '812298', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20191', '2017052790', '90', '33135', '20', '2017-05-27 00:00:00', '257736', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20192', '2017052789', '89', '33134', '20', '2017-05-27 00:00:00', '208874', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20193', '2017052788', '88', '33133', '20', '2017-05-27 00:00:00', '212637', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20194', '2017052787', '87', '33132', '20', '2017-05-27 00:00:00', '158721', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20195', '2017052786', '86', '33131', '20', '2017-05-27 00:00:00', '399130', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20196', '2017052785', '85', '33130', '20', '2017-05-27 00:00:00', '377075', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20197', '2017052784', '84', '33129', '20', '2017-05-27 00:00:00', '377761', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20198', '2017052783', '83', '33128', '20', '2017-05-27 00:00:00', '663543', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20199', '2017052782', '82', '33127', '20', '2017-05-27 00:00:00', '805953', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20200', '2017052781', '81', '33126', '20', '2017-05-27 00:00:00', '677111', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20201', '2017052780', '80', '33125', '20', '2017-05-27 00:00:00', '513003', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20202', '2017052779', '79', '33124', '20', '2017-05-27 00:00:00', '611138', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20203', '2017052778', '78', '33123', '20', '2017-05-27 00:00:00', '775082', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20204', '2017052777', '77', '33122', '20', '2017-05-27 00:00:00', '968359', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20205', '2017052776', '76', '33121', '20', '2017-05-27 00:00:00', '590237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20206', '2017052775', '75', '33120', '20', '2017-05-27 00:00:00', '535882', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20207', '2017052774', '74', '33119', '20', '2017-05-27 00:00:00', '953390', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20208', '2017052773', '73', '33118', '20', '2017-05-27 00:00:00', '660192', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20209', '2017052772', '72', '33117', '20', '2017-05-27 00:00:00', '131338', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20210', '2017052771', '71', '33116', '20', '2017-05-27 00:00:00', '522149', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20211', '2017052770', '70', '33115', '20', '2017-05-27 00:00:00', '637753', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20212', '2017052769', '69', '33114', '20', '2017-05-27 00:00:00', '511987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20213', '2017052768', '68', '33113', '20', '2017-05-27 00:00:00', '908181', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20214', '2017052767', '67', '33112', '20', '2017-05-27 00:00:00', '204315', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20215', '2017052766', '66', '33111', '20', '2017-05-27 00:00:00', '475045', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20216', '2017052765', '65', '33110', '20', '2017-05-27 00:00:00', '833117', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20217', '2017052764', '64', '33109', '20', '2017-05-27 00:00:00', '642642', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20218', '2017052763', '63', '33108', '20', '2017-05-27 00:00:00', '566754', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20219', '2017052762', '62', '33107', '20', '2017-05-27 00:00:00', '662142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20220', '2017052761', '61', '33106', '20', '2017-05-27 00:00:00', '582958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20221', '2017052760', '60', '33105', '20', '2017-05-27 00:00:00', '206594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20222', '2017052759', '59', '33104', '20', '2017-05-27 00:00:00', '343841', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20223', '2017052758', '58', '33103', '20', '2017-05-27 00:00:00', '945919', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20224', '2017052757', '57', '33102', '20', '2017-05-27 00:00:00', '970886', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20225', '2017052756', '56', '33101', '20', '2017-05-27 00:00:00', '921914', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20226', '2017052755', '55', '33100', '20', '2017-05-27 00:00:00', '519952', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20227', '2017052754', '54', '33099', '20', '2017-05-27 00:00:00', '623251', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20228', '2017052753', '53', '33098', '20', '2017-05-27 00:00:00', '956274', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20229', '2017052752', '52', '33097', '20', '2017-05-27 00:00:00', '960476', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20230', '2017052751', '51', '33096', '20', '2017-05-27 00:00:00', '729461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20231', '2017052750', '50', '33095', '20', '2017-05-27 00:00:00', '341012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20232', '2017052749', '49', '33094', '20', '2017-05-27 00:00:00', '848498', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20233', '2017052748', '48', '33093', '20', '2017-05-27 00:00:00', '744155', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20234', '2017052747', '47', '33092', '20', '2017-05-27 00:00:00', '156744', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20235', '2017052746', '46', '33091', '20', '2017-05-27 00:00:00', '296078', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20236', '2017052745', '45', '33090', '20', '2017-05-27 00:00:00', '506933', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20237', '2017052744', '44', '33089', '20', '2017-05-27 00:00:00', '244827', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20238', '2017052743', '43', '33088', '20', '2017-05-27 00:00:00', '236175', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20239', '2017052742', '42', '33087', '20', '2017-05-27 00:00:00', '235324', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20240', '2017052741', '41', '33086', '20', '2017-05-27 00:00:00', '240954', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20241', '2017052740', '40', '33085', '20', '2017-05-27 00:00:00', '784365', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20242', '2017052739', '39', '33084', '20', '2017-05-27 00:00:00', '152130', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20243', '2017052738', '38', '33083', '20', '2017-05-27 00:00:00', '355624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20244', '2017052737', '37', '33082', '20', '2017-05-27 00:00:00', '809936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20245', '2017052736', '36', '33081', '20', '2017-05-27 00:00:00', '534646', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20246', '2017052735', '35', '33080', '20', '2017-05-27 00:00:00', '438983', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20247', '2017052734', '34', '33079', '20', '2017-05-27 00:00:00', '403854', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20248', '2017052733', '33', '33078', '20', '2017-05-27 00:00:00', '723254', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20249', '2017052732', '32', '33077', '20', '2017-05-27 00:00:00', '817544', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20250', '2017052731', '31', '33076', '20', '2017-05-27 00:00:00', '281109', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20251', '2017052730', '30', '33075', '20', '2017-05-27 00:00:00', '576889', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20252', '2017052729', '29', '33074', '20', '2017-05-27 00:00:00', '740283', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20253', '2017052728', '28', '33073', '20', '2017-05-27 00:00:00', '704934', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20254', '2017052727', '27', '33072', '20', '2017-05-27 00:00:00', '212884', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20255', '2017052726', '26', '33071', '20', '2017-05-27 00:00:00', '621603', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20256', '2017052725', '25', '33070', '20', '2017-05-27 00:00:00', '270397', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20257', '2017052724', '24', '33069', '20', '2017-05-27 00:00:00', '618692', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20258', '2017052723', '23', '33068', '20', '2017-05-27 00:00:00', '318682', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20259', '2017052722', '22', '33067', '20', '2017-05-27 00:00:00', '734872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20260', '2017052721', '21', '33066', '20', '2017-05-27 00:00:00', '972973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20261', '2017052720', '20', '33065', '20', '2017-05-27 00:00:00', '530691', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20262', '2017052719', '19', '33064', '20', '2017-05-27 00:00:00', '232879', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20263', '2017052718', '18', '33063', '20', '2017-05-27 00:00:00', '663571', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20264', '2017052717', '17', '33062', '20', '2017-05-27 00:00:00', '457385', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20265', '2017052716', '16', '33061', '20', '2017-05-27 00:00:00', '862808', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20266', '2017052715', '15', '33060', '20', '2017-05-27 00:00:00', '939849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20267', '2017052714', '14', '33059', '20', '2017-05-27 00:00:00', '604574', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20268', '2017052713', '13', '33058', '20', '2017-05-27 00:00:00', '383007', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20269', '2017052712', '12', '33057', '20', '2017-05-27 00:00:00', '686917', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20270', '2017052711', '11', '33056', '20', '2017-05-27 00:00:00', '273968', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20271', '2017052710', '10', '33055', '20', '2017-05-27 00:00:00', '304757', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20272', '201705279', '9', '33054', '20', '2017-05-27 00:00:00', '159216', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20273', '201705278', '8', '33053', '20', '2017-05-27 00:00:00', '424893', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20274', '201705277', '7', '33052', '20', '2017-05-27 00:00:00', '119610', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20275', '201705276', '6', '33051', '20', '2017-05-27 00:00:00', '860995', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20276', '201705275', '5', '33050', '20', '2017-05-27 00:00:00', '545385', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20277', '201705274', '4', '33049', '20', '2017-05-27 00:00:00', '948611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20278', '201705273', '3', '33048', '20', '2017-05-27 00:00:00', '111151', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20279', '201705272', '2', '33047', '20', '2017-05-27 00:00:00', '220162', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20280', '201705271', '1', '33046', '20', '2017-05-27 00:00:00', '950891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20281', '20170528120', '120', '33165', '20', '2017-05-28 00:00:00', '879946', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20282', '20170528119', '119', '33164', '20', '2017-05-28 00:00:00', '332965', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20283', '20170528118', '118', '33163', '20', '2017-05-28 00:00:00', '379135', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20284', '20170528117', '117', '33162', '20', '2017-05-28 00:00:00', '335107', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20285', '20170528116', '116', '33161', '20', '2017-05-28 00:00:00', '190774', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20286', '20170528115', '115', '33160', '20', '2017-05-28 00:00:00', '419427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20287', '20170528114', '114', '33159', '20', '2017-05-28 00:00:00', '184786', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20288', '20170528113', '113', '33158', '20', '2017-05-28 00:00:00', '807409', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20289', '20170528112', '112', '33157', '20', '2017-05-28 00:00:00', '202969', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20290', '20170528111', '111', '33156', '20', '2017-05-28 00:00:00', '454913', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20291', '20170528110', '110', '33155', '20', '2017-05-28 00:00:00', '733993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20292', '20170528109', '109', '33154', '20', '2017-05-28 00:00:00', '427172', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20293', '20170528108', '108', '33153', '20', '2017-05-28 00:00:00', '888406', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20294', '20170528107', '107', '33152', '20', '2017-05-28 00:00:00', '973797', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20295', '20170528106', '106', '33151', '20', '2017-05-28 00:00:00', '873629', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20296', '20170528105', '105', '33150', '20', '2017-05-28 00:00:00', '403771', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20297', '20170528104', '104', '33149', '20', '2017-05-28 00:00:00', '868960', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20298', '20170528103', '103', '33148', '20', '2017-05-28 00:00:00', '260455', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20299', '20170528102', '102', '33147', '20', '2017-05-28 00:00:00', '800570', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20300', '20170528101', '101', '33146', '20', '2017-05-28 00:00:00', '596582', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20301', '20170528100', '100', '33145', '20', '2017-05-28 00:00:00', '116506', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20302', '2017052899', '99', '33144', '20', '2017-05-28 00:00:00', '649261', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20303', '2017052898', '98', '33143', '20', '2017-05-28 00:00:00', '261691', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20304', '2017052897', '97', '33142', '20', '2017-05-28 00:00:00', '414978', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20305', '2017052896', '96', '33141', '20', '2017-05-28 00:00:00', '852920', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20306', '2017052895', '95', '33140', '20', '2017-05-28 00:00:00', '424591', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20307', '2017052894', '94', '33139', '20', '2017-05-28 00:00:00', '353866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20308', '2017052893', '93', '33138', '20', '2017-05-28 00:00:00', '618334', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20309', '2017052892', '92', '33137', '20', '2017-05-28 00:00:00', '350076', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20310', '2017052891', '91', '33136', '20', '2017-05-28 00:00:00', '120819', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20311', '2017052890', '90', '33135', '20', '2017-05-28 00:00:00', '823971', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20312', '2017052889', '89', '33134', '20', '2017-05-28 00:00:00', '616027', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20313', '2017052888', '88', '33133', '20', '2017-05-28 00:00:00', '829849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20314', '2017052887', '87', '33132', '20', '2017-05-28 00:00:00', '722320', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20315', '2017052886', '86', '33131', '20', '2017-05-28 00:00:00', '968881', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20316', '2017052885', '85', '33130', '20', '2017-05-28 00:00:00', '267431', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20317', '2017052884', '84', '33129', '20', '2017-05-28 00:00:00', '464114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20318', '2017052883', '83', '33128', '20', '2017-05-28 00:00:00', '963470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20319', '2017052882', '82', '33127', '20', '2017-05-28 00:00:00', '535470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20320', '2017052881', '81', '33126', '20', '2017-05-28 00:00:00', '781921', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20321', '2017052880', '80', '33125', '20', '2017-05-28 00:00:00', '574746', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20322', '2017052879', '79', '33124', '20', '2017-05-28 00:00:00', '928643', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20323', '2017052878', '78', '33123', '20', '2017-05-28 00:00:00', '620614', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20324', '2017052877', '77', '33122', '20', '2017-05-28 00:00:00', '218872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20325', '2017052876', '76', '33121', '20', '2017-05-28 00:00:00', '233621', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20326', '2017052875', '75', '33120', '20', '2017-05-28 00:00:00', '252215', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20327', '2017052874', '74', '33119', '20', '2017-05-28 00:00:00', '971188', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20328', '2017052873', '73', '33118', '20', '2017-05-28 00:00:00', '687658', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20329', '2017052872', '72', '33117', '20', '2017-05-28 00:00:00', '762612', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20330', '2017052871', '71', '33116', '20', '2017-05-28 00:00:00', '818560', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20331', '2017052870', '70', '33115', '20', '2017-05-28 00:00:00', '884066', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20332', '2017052869', '69', '33114', '20', '2017-05-28 00:00:00', '247656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20333', '2017052868', '68', '33113', '20', '2017-05-28 00:00:00', '333596', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20334', '2017052867', '67', '33112', '20', '2017-05-28 00:00:00', '462054', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20335', '2017052866', '66', '33111', '20', '2017-05-28 00:00:00', '106124', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20336', '2017052865', '65', '33110', '20', '2017-05-28 00:00:00', '108239', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20337', '2017052864', '64', '33109', '20', '2017-05-28 00:00:00', '268447', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20338', '2017052863', '63', '33108', '20', '2017-05-28 00:00:00', '167071', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20339', '2017052862', '62', '33107', '20', '2017-05-28 00:00:00', '634237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20340', '2017052861', '61', '33106', '20', '2017-05-28 00:00:00', '128784', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20341', '2017052860', '60', '33105', '20', '2017-05-28 00:00:00', '539041', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20342', '2017052859', '59', '33104', '20', '2017-05-28 00:00:00', '467987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20343', '2017052858', '58', '33103', '20', '2017-05-28 00:00:00', '415280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20344', '2017052857', '57', '33102', '20', '2017-05-28 00:00:00', '618664', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20345', '2017052856', '56', '33101', '20', '2017-05-28 00:00:00', '667251', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20346', '2017052855', '55', '33100', '20', '2017-05-28 00:00:00', '549176', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20347', '2017052854', '54', '33099', '20', '2017-05-28 00:00:00', '546127', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20348', '2017052853', '53', '33098', '20', '2017-05-28 00:00:00', '537255', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20349', '2017052852', '52', '33097', '20', '2017-05-28 00:00:00', '624954', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20350', '2017052851', '51', '33096', '20', '2017-05-28 00:00:00', '945013', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20351', '2017052850', '50', '33095', '20', '2017-05-28 00:00:00', '773654', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20352', '2017052849', '49', '33094', '20', '2017-05-28 00:00:00', '193933', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20353', '2017052848', '48', '33093', '20', '2017-05-28 00:00:00', '834024', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20354', '2017052847', '47', '33092', '20', '2017-05-28 00:00:00', '839874', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20355', '2017052846', '46', '33091', '20', '2017-05-28 00:00:00', '394735', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20356', '2017052845', '45', '33090', '20', '2017-05-28 00:00:00', '348071', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20357', '2017052844', '44', '33089', '20', '2017-05-28 00:00:00', '366336', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20358', '2017052843', '43', '33088', '20', '2017-05-28 00:00:00', '768133', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20359', '2017052842', '42', '33087', '20', '2017-05-28 00:00:00', '956246', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20360', '2017052841', '41', '33086', '20', '2017-05-28 00:00:00', '409045', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20361', '2017052840', '40', '33085', '20', '2017-05-28 00:00:00', '543765', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20362', '2017052839', '39', '33084', '20', '2017-05-28 00:00:00', '814166', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20363', '2017052838', '38', '33083', '20', '2017-05-28 00:00:00', '855062', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20364', '2017052837', '37', '33082', '20', '2017-05-28 00:00:00', '236230', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20365', '2017052836', '36', '33081', '20', '2017-05-28 00:00:00', '438186', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20366', '2017052835', '35', '33080', '20', '2017-05-28 00:00:00', '612347', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20367', '2017052834', '34', '33079', '20', '2017-05-28 00:00:00', '738058', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20368', '2017052833', '33', '33078', '20', '2017-05-28 00:00:00', '139001', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20369', '2017052832', '32', '33077', '20', '2017-05-28 00:00:00', '471475', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20370', '2017052831', '31', '33076', '20', '2017-05-28 00:00:00', '247052', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20371', '2017052830', '30', '33075', '20', '2017-05-28 00:00:00', '802108', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20372', '2017052829', '29', '33074', '20', '2017-05-28 00:00:00', '876733', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20373', '2017052828', '28', '33073', '20', '2017-05-28 00:00:00', '615505', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20374', '2017052827', '27', '33072', '20', '2017-05-28 00:00:00', '252655', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20375', '2017052826', '26', '33071', '20', '2017-05-28 00:00:00', '794088', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20376', '2017052825', '25', '33070', '20', '2017-05-28 00:00:00', '958801', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20377', '2017052824', '24', '33069', '20', '2017-05-28 00:00:00', '392153', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20378', '2017052823', '23', '33068', '20', '2017-05-28 00:00:00', '713531', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20379', '2017052822', '22', '33067', '20', '2017-05-28 00:00:00', '910873', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20380', '2017052821', '21', '33066', '20', '2017-05-28 00:00:00', '244580', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20381', '2017052820', '20', '33065', '20', '2017-05-28 00:00:00', '673294', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20382', '2017052819', '19', '33064', '20', '2017-05-28 00:00:00', '364056', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20383', '2017052818', '18', '33063', '20', '2017-05-28 00:00:00', '899337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20384', '2017052817', '17', '33062', '20', '2017-05-28 00:00:00', '843444', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20385', '2017052816', '16', '33061', '20', '2017-05-28 00:00:00', '980801', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20386', '2017052815', '15', '33060', '20', '2017-05-28 00:00:00', '188604', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20387', '2017052814', '14', '33059', '20', '2017-05-28 00:00:00', '956356', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20388', '2017052813', '13', '33058', '20', '2017-05-28 00:00:00', '814770', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20389', '2017052812', '12', '33057', '20', '2017-05-28 00:00:00', '386550', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20390', '2017052811', '11', '33056', '20', '2017-05-28 00:00:00', '721551', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20391', '2017052810', '10', '33055', '20', '2017-05-28 00:00:00', '828805', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20392', '201705289', '9', '33054', '20', '2017-05-28 00:00:00', '467932', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20393', '201705288', '8', '33053', '20', '2017-05-28 00:00:00', '212417', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20394', '201705287', '7', '33052', '20', '2017-05-28 00:00:00', '247271', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20395', '201705286', '6', '33051', '20', '2017-05-28 00:00:00', '713558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20396', '201705285', '5', '33050', '20', '2017-05-28 00:00:00', '562304', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20397', '201705284', '4', '33049', '20', '2017-05-28 00:00:00', '430276', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20398', '201705283', '3', '33048', '20', '2017-05-28 00:00:00', '200140', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20399', '201705282', '2', '33047', '20', '2017-05-28 00:00:00', '357492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20400', '201705281', '1', '33046', '20', '2017-05-28 00:00:00', '507263', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20401', '20170529120', '120', '33165', '20', '2017-05-29 00:00:00', '562002', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20402', '20170529119', '119', '33164', '20', '2017-05-29 00:00:00', '664532', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20403', '20170529118', '118', '33163', '20', '2017-05-29 00:00:00', '857479', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20404', '20170529117', '117', '33162', '20', '2017-05-29 00:00:00', '162182', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20405', '20170529116', '116', '33161', '20', '2017-05-29 00:00:00', '579470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20406', '20170529115', '115', '33160', '20', '2017-05-29 00:00:00', '374822', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20407', '20170529114', '114', '33159', '20', '2017-05-29 00:00:00', '160397', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20408', '20170529113', '113', '33158', '20', '2017-05-29 00:00:00', '736437', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20409', '20170529112', '112', '33157', '20', '2017-05-29 00:00:00', '904556', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20410', '20170529111', '111', '33156', '20', '2017-05-29 00:00:00', '315386', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20411', '20170529110', '110', '33155', '20', '2017-05-29 00:00:00', '263119', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20412', '20170529109', '109', '33154', '20', '2017-05-29 00:00:00', '289404', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20413', '20170529108', '108', '33153', '20', '2017-05-29 00:00:00', '609133', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20414', '20170529107', '107', '33152', '20', '2017-05-29 00:00:00', '120599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20415', '20170529106', '106', '33151', '20', '2017-05-29 00:00:00', '912521', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20416', '20170529105', '105', '33150', '20', '2017-05-29 00:00:00', '930456', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20417', '20170529104', '104', '33149', '20', '2017-05-29 00:00:00', '115078', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20418', '20170529103', '103', '33148', '20', '2017-05-29 00:00:00', '774835', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20419', '20170529102', '102', '33147', '20', '2017-05-29 00:00:00', '505477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20420', '20170529101', '101', '33146', '20', '2017-05-29 00:00:00', '718969', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20421', '20170529100', '100', '33145', '20', '2017-05-29 00:00:00', '294265', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20422', '2017052999', '99', '33144', '20', '2017-05-29 00:00:00', '112469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20423', '2017052998', '98', '33143', '20', '2017-05-29 00:00:00', '588864', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20424', '2017052997', '97', '33142', '20', '2017-05-29 00:00:00', '864318', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20425', '2017052996', '96', '33141', '20', '2017-05-29 00:00:00', '668569', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20426', '2017052995', '95', '33140', '20', '2017-05-29 00:00:00', '917877', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20427', '2017052994', '94', '33139', '20', '2017-05-29 00:00:00', '459555', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20428', '2017052993', '93', '33138', '20', '2017-05-29 00:00:00', '325878', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20429', '2017052992', '92', '33137', '20', '2017-05-29 00:00:00', '309866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20430', '2017052991', '91', '33136', '20', '2017-05-29 00:00:00', '125433', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20431', '2017052990', '90', '33135', '20', '2017-05-29 00:00:00', '764425', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20432', '2017052989', '89', '33134', '20', '2017-05-29 00:00:00', '313024', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20433', '2017052988', '88', '33133', '20', '2017-05-29 00:00:00', '540029', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20434', '2017052987', '87', '33132', '20', '2017-05-29 00:00:00', '519512', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20435', '2017052986', '86', '33131', '20', '2017-05-29 00:00:00', '800350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20436', '2017052985', '85', '33130', '20', '2017-05-29 00:00:00', '685131', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20437', '2017052984', '84', '33129', '20', '2017-05-29 00:00:00', '430935', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20438', '2017052983', '83', '33128', '20', '2017-05-29 00:00:00', '834490', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20439', '2017052982', '82', '33127', '20', '2017-05-29 00:00:00', '314205', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20440', '2017052981', '81', '33126', '20', '2017-05-29 00:00:00', '851574', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20441', '2017052980', '80', '33125', '20', '2017-05-29 00:00:00', '404458', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20442', '2017052979', '79', '33124', '20', '2017-05-29 00:00:00', '254742', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20443', '2017052978', '78', '33123', '20', '2017-05-29 00:00:00', '402865', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20444', '2017052977', '77', '33122', '20', '2017-05-29 00:00:00', '671728', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20445', '2017052976', '76', '33121', '20', '2017-05-29 00:00:00', '432473', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20446', '2017052975', '75', '33120', '20', '2017-05-29 00:00:00', '214642', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20447', '2017052974', '74', '33119', '20', '2017-05-29 00:00:00', '813204', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20448', '2017052973', '73', '33118', '20', '2017-05-29 00:00:00', '454968', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20449', '2017052972', '72', '33117', '20', '2017-05-29 00:00:00', '936856', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20450', '2017052971', '71', '33116', '20', '2017-05-29 00:00:00', '798565', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20451', '2017052970', '70', '33115', '20', '2017-05-29 00:00:00', '842098', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20452', '2017052969', '69', '33114', '20', '2017-05-29 00:00:00', '960668', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20453', '2017052968', '68', '33113', '20', '2017-05-29 00:00:00', '989480', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20454', '2017052967', '67', '33112', '20', '2017-05-29 00:00:00', '740887', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20455', '2017052966', '66', '33111', '20', '2017-05-29 00:00:00', '236422', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20456', '2017052965', '65', '33110', '20', '2017-05-29 00:00:00', '698205', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20457', '2017052964', '64', '33109', '20', '2017-05-29 00:00:00', '112222', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20458', '2017052963', '63', '33108', '20', '2017-05-29 00:00:00', '125982', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20459', '2017052962', '62', '33107', '20', '2017-05-29 00:00:00', '993051', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20460', '2017052961', '61', '33106', '20', '2017-05-29 00:00:00', '426953', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20461', '2017052960', '60', '33105', '20', '2017-05-29 00:00:00', '976956', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20462', '2017052959', '59', '33104', '20', '2017-05-29 00:00:00', '388226', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20463', '2017052958', '58', '33103', '20', '2017-05-29 00:00:00', '158859', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20464', '2017052957', '57', '33102', '20', '2017-05-29 00:00:00', '456286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20465', '2017052956', '56', '33101', '20', '2017-05-29 00:00:00', '405557', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20466', '2017052955', '55', '33100', '20', '2017-05-29 00:00:00', '711993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20467', '2017052954', '54', '33099', '20', '2017-05-29 00:00:00', '630722', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20468', '2017052953', '53', '33098', '20', '2017-05-29 00:00:00', '645581', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20469', '2017052952', '52', '33097', '20', '2017-05-29 00:00:00', '169900', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20470', '2017052951', '51', '33096', '20', '2017-05-29 00:00:00', '731658', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20471', '2017052950', '50', '33095', '20', '2017-05-29 00:00:00', '355514', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20472', '2017052949', '49', '33094', '20', '2017-05-29 00:00:00', '404211', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20473', '2017052948', '48', '33093', '20', '2017-05-29 00:00:00', '691860', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20474', '2017052947', '47', '33092', '20', '2017-05-29 00:00:00', '531597', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20475', '2017052946', '46', '33091', '20', '2017-05-29 00:00:00', '430111', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20476', '2017052945', '45', '33090', '20', '2017-05-29 00:00:00', '491552', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20477', '2017052944', '44', '33089', '20', '2017-05-29 00:00:00', '143313', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20478', '2017052943', '43', '33088', '20', '2017-05-29 00:00:00', '646185', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20479', '2017052942', '42', '33087', '20', '2017-05-29 00:00:00', '601388', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20480', '2017052941', '41', '33086', '20', '2017-05-29 00:00:00', '316979', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20481', '2017052940', '40', '33085', '20', '2017-05-29 00:00:00', '746133', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20482', '2017052939', '39', '33084', '20', '2017-05-29 00:00:00', '259796', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20483', '2017052938', '38', '33083', '20', '2017-05-29 00:00:00', '166220', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20484', '2017052937', '37', '33082', '20', '2017-05-29 00:00:00', '639868', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20485', '2017052936', '36', '33081', '20', '2017-05-29 00:00:00', '672195', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20486', '2017052935', '35', '33080', '20', '2017-05-29 00:00:00', '806805', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20487', '2017052934', '34', '33079', '20', '2017-05-29 00:00:00', '671481', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20488', '2017052933', '33', '33078', '20', '2017-05-29 00:00:00', '869592', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20489', '2017052932', '32', '33077', '20', '2017-05-29 00:00:00', '343374', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20490', '2017052931', '31', '33076', '20', '2017-05-29 00:00:00', '571588', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20491', '2017052930', '30', '33075', '20', '2017-05-29 00:00:00', '514047', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20492', '2017052929', '29', '33074', '20', '2017-05-29 00:00:00', '865527', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20493', '2017052928', '28', '33073', '20', '2017-05-29 00:00:00', '631546', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20494', '2017052927', '27', '33072', '20', '2017-05-29 00:00:00', '988519', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20495', '2017052926', '26', '33071', '20', '2017-05-29 00:00:00', '340792', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20496', '2017052925', '25', '33070', '20', '2017-05-29 00:00:00', '937048', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20497', '2017052924', '24', '33069', '20', '2017-05-29 00:00:00', '158584', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20498', '2017052923', '23', '33068', '20', '2017-05-29 00:00:00', '341973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20499', '2017052922', '22', '33067', '20', '2017-05-29 00:00:00', '348593', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20500', '2017052921', '21', '33066', '20', '2017-05-29 00:00:00', '943530', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20501', '2017052920', '20', '33065', '20', '2017-05-29 00:00:00', '696365', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20502', '2017052919', '19', '33064', '20', '2017-05-29 00:00:00', '966326', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20503', '2017052918', '18', '33063', '20', '2017-05-29 00:00:00', '284323', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20504', '2017052917', '17', '33062', '20', '2017-05-29 00:00:00', '294348', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20505', '2017052916', '16', '33061', '20', '2017-05-29 00:00:00', '866763', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20506', '2017052915', '15', '33060', '20', '2017-05-29 00:00:00', '245953', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20507', '2017052914', '14', '33059', '20', '2017-05-29 00:00:00', '344857', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20508', '2017052913', '13', '33058', '20', '2017-05-29 00:00:00', '648876', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20509', '2017052912', '12', '33057', '20', '2017-05-29 00:00:00', '641653', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20510', '2017052911', '11', '33056', '20', '2017-05-29 00:00:00', '515228', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20511', '2017052910', '10', '33055', '20', '2017-05-29 00:00:00', '277072', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20512', '201705299', '9', '33054', '20', '2017-05-29 00:00:00', '516491', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20513', '201705298', '8', '33053', '20', '2017-05-29 00:00:00', '442910', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20514', '201705297', '7', '33052', '20', '2017-05-29 00:00:00', '958526', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20515', '201705296', '6', '33051', '20', '2017-05-29 00:00:00', '277841', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20516', '201705295', '5', '33050', '20', '2017-05-29 00:00:00', '656567', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20517', '201705294', '4', '33049', '20', '2017-05-29 00:00:00', '242410', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20518', '201705293', '3', '33048', '20', '2017-05-29 00:00:00', '310223', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20519', '201705292', '2', '33047', '20', '2017-05-29 00:00:00', '994039', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20520', '201705291', '1', '33046', '20', '2017-05-29 00:00:00', '478479', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20521', '20170530120', '120', '33165', '20', '2017-05-30 00:00:00', '462026', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20522', '20170530119', '119', '33164', '20', '2017-05-30 00:00:00', '454693', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20523', '20170530118', '118', '33163', '20', '2017-05-30 00:00:00', '822543', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20524', '20170530117', '117', '33162', '20', '2017-05-30 00:00:00', '741601', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20525', '20170530116', '116', '33161', '20', '2017-05-30 00:00:00', '173635', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20526', '20170530115', '115', '33160', '20', '2017-05-30 00:00:00', '126312', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20527', '20170530114', '114', '33159', '20', '2017-05-30 00:00:00', '410226', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20528', '20170530113', '113', '33158', '20', '2017-05-30 00:00:00', '855310', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20529', '20170530112', '112', '33157', '20', '2017-05-30 00:00:00', '699111', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20530', '20170530111', '111', '33156', '20', '2017-05-30 00:00:00', '309454', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20531', '20170530110', '110', '33155', '20', '2017-05-30 00:00:00', '853964', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20532', '20170530109', '109', '33154', '20', '2017-05-30 00:00:00', '678979', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20533', '20170530108', '108', '33153', '20', '2017-05-30 00:00:00', '210330', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20534', '20170530107', '107', '33152', '20', '2017-05-30 00:00:00', '638494', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20535', '20170530106', '106', '33151', '20', '2017-05-30 00:00:00', '100631', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20536', '20170530105', '105', '33150', '20', '2017-05-30 00:00:00', '521984', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20537', '20170530104', '104', '33149', '20', '2017-05-30 00:00:00', '929165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20538', '20170530103', '103', '33148', '20', '2017-05-30 00:00:00', '297808', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20539', '20170530102', '102', '33147', '20', '2017-05-30 00:00:00', '147103', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20540', '20170530101', '101', '33146', '20', '2017-05-30 00:00:00', '243701', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20541', '20170530100', '100', '33145', '20', '2017-05-30 00:00:00', '127493', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20542', '2017053099', '99', '33144', '20', '2017-05-30 00:00:00', '721771', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20543', '2017053098', '98', '33143', '20', '2017-05-30 00:00:00', '740255', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20544', '2017053097', '97', '33142', '20', '2017-05-30 00:00:00', '153503', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20545', '2017053096', '96', '33141', '20', '2017-05-30 00:00:00', '927188', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20546', '2017053095', '95', '33140', '20', '2017-05-30 00:00:00', '194757', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20547', '2017053094', '94', '33139', '20', '2017-05-30 00:00:00', '276962', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20548', '2017053093', '93', '33138', '20', '2017-05-30 00:00:00', '110766', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20549', '2017053092', '92', '33137', '20', '2017-05-30 00:00:00', '600125', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20550', '2017053091', '91', '33136', '20', '2017-05-30 00:00:00', '151141', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20551', '2017053090', '90', '33135', '20', '2017-05-30 00:00:00', '304098', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20552', '2017053089', '89', '33134', '20', '2017-05-30 00:00:00', '424865', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20553', '2017053088', '88', '33133', '20', '2017-05-30 00:00:00', '468179', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20554', '2017053087', '87', '33132', '20', '2017-05-30 00:00:00', '675299', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20555', '2017053086', '86', '33131', '20', '2017-05-30 00:00:00', '118539', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20556', '2017053085', '85', '33130', '20', '2017-05-30 00:00:00', '955175', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20557', '2017053084', '84', '33129', '20', '2017-05-30 00:00:00', '503225', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20558', '2017053083', '83', '33128', '20', '2017-05-30 00:00:00', '501605', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20559', '2017053082', '82', '33127', '20', '2017-05-30 00:00:00', '367160', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20560', '2017053081', '81', '33126', '20', '2017-05-30 00:00:00', '211071', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20561', '2017053080', '80', '33125', '20', '2017-05-30 00:00:00', '227139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20562', '2017053079', '79', '33124', '20', '2017-05-30 00:00:00', '614434', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20563', '2017053078', '78', '33123', '20', '2017-05-30 00:00:00', '346835', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20564', '2017053077', '77', '33122', '20', '2017-05-30 00:00:00', '751928', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20565', '2017053076', '76', '33121', '20', '2017-05-30 00:00:00', '511795', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20566', '2017053075', '75', '33120', '20', '2017-05-30 00:00:00', '648162', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20567', '2017053074', '74', '33119', '20', '2017-05-30 00:00:00', '704440', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20568', '2017053073', '73', '33118', '20', '2017-05-30 00:00:00', '187121', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20569', '2017053072', '72', '33117', '20', '2017-05-30 00:00:00', '879067', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20570', '2017053071', '71', '33116', '20', '2017-05-30 00:00:00', '687164', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20571', '2017053070', '70', '33115', '20', '2017-05-30 00:00:00', '736849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20572', '2017053069', '69', '33114', '20', '2017-05-30 00:00:00', '176025', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20573', '2017053068', '68', '33113', '20', '2017-05-30 00:00:00', '400833', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20574', '2017053067', '67', '33112', '20', '2017-05-30 00:00:00', '365814', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20575', '2017053066', '66', '33111', '20', '2017-05-30 00:00:00', '190939', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20576', '2017053065', '65', '33110', '20', '2017-05-30 00:00:00', '128015', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20577', '2017053064', '64', '33109', '20', '2017-05-30 00:00:00', '398965', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20578', '2017053063', '63', '33108', '20', '2017-05-30 00:00:00', '668487', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20579', '2017053062', '62', '33107', '20', '2017-05-30 00:00:00', '163583', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20580', '2017053061', '61', '33106', '20', '2017-05-30 00:00:00', '802465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20581', '2017053060', '60', '33105', '20', '2017-05-30 00:00:00', '845339', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20582', '2017053059', '59', '33104', '20', '2017-05-30 00:00:00', '329559', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20583', '2017053058', '58', '33103', '20', '2017-05-30 00:00:00', '401657', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20584', '2017053057', '57', '33102', '20', '2017-05-30 00:00:00', '708752', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20585', '2017053056', '56', '33101', '20', '2017-05-30 00:00:00', '361831', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20586', '2017053055', '55', '33100', '20', '2017-05-30 00:00:00', '333404', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20587', '2017053054', '54', '33099', '20', '2017-05-30 00:00:00', '202035', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20588', '2017053053', '53', '33098', '20', '2017-05-30 00:00:00', '606250', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20589', '2017053052', '52', '33097', '20', '2017-05-30 00:00:00', '720315', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20590', '2017053051', '51', '33096', '20', '2017-05-30 00:00:00', '314398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20591', '2017053050', '50', '33095', '20', '2017-05-30 00:00:00', '211593', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20592', '2017053049', '49', '33094', '20', '2017-05-30 00:00:00', '804333', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20593', '2017053048', '48', '33093', '20', '2017-05-30 00:00:00', '542666', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20594', '2017053047', '47', '33092', '20', '2017-05-30 00:00:00', '356915', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20595', '2017053046', '46', '33091', '20', '2017-05-30 00:00:00', '627206', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20596', '2017053045', '45', '33090', '20', '2017-05-30 00:00:00', '262377', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20597', '2017053044', '44', '33089', '20', '2017-05-30 00:00:00', '700759', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20598', '2017053043', '43', '33088', '20', '2017-05-30 00:00:00', '995330', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20599', '2017053042', '42', '33087', '20', '2017-05-30 00:00:00', '295748', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20600', '2017053041', '41', '33086', '20', '2017-05-30 00:00:00', '189758', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20601', '2017053040', '40', '33085', '20', '2017-05-30 00:00:00', '716470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20602', '2017053039', '39', '33084', '20', '2017-05-30 00:00:00', '514019', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20603', '2017053038', '38', '33083', '20', '2017-05-30 00:00:00', '314096', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20604', '2017053037', '37', '33082', '20', '2017-05-30 00:00:00', '445849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20605', '2017053036', '36', '33081', '20', '2017-05-30 00:00:00', '561672', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20606', '2017053035', '35', '33080', '20', '2017-05-30 00:00:00', '347357', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20607', '2017053034', '34', '33079', '20', '2017-05-30 00:00:00', '429122', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20608', '2017053033', '33', '33078', '20', '2017-05-30 00:00:00', '440026', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20609', '2017053032', '32', '33077', '20', '2017-05-30 00:00:00', '658242', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20610', '2017053031', '31', '33076', '20', '2017-05-30 00:00:00', '579718', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20611', '2017053030', '30', '33075', '20', '2017-05-30 00:00:00', '837704', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20612', '2017053029', '29', '33074', '20', '2017-05-30 00:00:00', '931665', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20613', '2017053028', '28', '33073', '20', '2017-05-30 00:00:00', '978054', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20614', '2017053027', '27', '33072', '20', '2017-05-30 00:00:00', '845477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20615', '2017053026', '26', '33071', '20', '2017-05-30 00:00:00', '386715', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20616', '2017053025', '25', '33070', '20', '2017-05-30 00:00:00', '430139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20617', '2017053024', '24', '33069', '20', '2017-05-30 00:00:00', '142984', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20618', '2017053023', '23', '33068', '20', '2017-05-30 00:00:00', '329010', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20619', '2017053022', '22', '33067', '20', '2017-05-30 00:00:00', '173031', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20620', '2017053021', '21', '33066', '20', '2017-05-30 00:00:00', '594824', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20621', '2017053020', '20', '33065', '20', '2017-05-30 00:00:00', '824905', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20622', '2017053019', '19', '33064', '20', '2017-05-30 00:00:00', '464691', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20623', '2017053018', '18', '33063', '20', '2017-05-30 00:00:00', '843527', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20624', '2017053017', '17', '33062', '20', '2017-05-30 00:00:00', '835095', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20625', '2017053016', '16', '33061', '20', '2017-05-30 00:00:00', '745693', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20626', '2017053015', '15', '33060', '20', '2017-05-30 00:00:00', '436895', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20627', '2017053014', '14', '33059', '20', '2017-05-30 00:00:00', '795077', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20628', '2017053013', '13', '33058', '20', '2017-05-30 00:00:00', '110327', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20629', '2017053012', '12', '33057', '20', '2017-05-30 00:00:00', '777224', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20630', '2017053011', '11', '33056', '20', '2017-05-30 00:00:00', '779998', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20631', '2017053010', '10', '33055', '20', '2017-05-30 00:00:00', '674557', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20632', '201705309', '9', '33054', '20', '2017-05-30 00:00:00', '529895', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20633', '201705308', '8', '33053', '20', '2017-05-30 00:00:00', '441372', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20634', '201705307', '7', '33052', '20', '2017-05-30 00:00:00', '678375', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20635', '201705306', '6', '33051', '20', '2017-05-30 00:00:00', '678842', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20636', '201705305', '5', '33050', '20', '2017-05-30 00:00:00', '153173', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20637', '201705304', '4', '33049', '20', '2017-05-30 00:00:00', '610012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20638', '201705303', '3', '33048', '20', '2017-05-30 00:00:00', '666400', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20639', '201705302', '2', '33047', '20', '2017-05-30 00:00:00', '554806', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20640', '201705301', '1', '33046', '20', '2017-05-30 00:00:00', '189538', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20641', '20170531120', '120', '33165', '20', '2017-05-31 00:00:00', '805020', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20642', '20170531119', '119', '33164', '20', '2017-05-31 00:00:00', '828448', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20643', '20170531118', '118', '33163', '20', '2017-05-31 00:00:00', '499325', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20644', '20170531117', '117', '33162', '20', '2017-05-31 00:00:00', '498364', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20645', '20170531116', '116', '33161', '20', '2017-05-31 00:00:00', '998269', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20646', '20170531115', '115', '33160', '20', '2017-05-31 00:00:00', '798895', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20647', '20170531114', '114', '33159', '20', '2017-05-31 00:00:00', '259274', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20648', '20170531113', '113', '33158', '20', '2017-05-31 00:00:00', '489025', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20649', '20170531112', '112', '33157', '20', '2017-05-31 00:00:00', '711636', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20650', '20170531111', '111', '33156', '20', '2017-05-31 00:00:00', '662115', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20651', '20170531110', '110', '33155', '20', '2017-05-31 00:00:00', '931527', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20652', '20170531109', '109', '33154', '20', '2017-05-31 00:00:00', '920898', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20653', '20170531108', '108', '33153', '20', '2017-05-31 00:00:00', '816995', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20654', '20170531107', '107', '33152', '20', '2017-05-31 00:00:00', '952484', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20655', '20170531106', '106', '33151', '20', '2017-05-31 00:00:00', '462960', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20656', '20170531105', '105', '33150', '20', '2017-05-31 00:00:00', '303356', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20657', '20170531104', '104', '33149', '20', '2017-05-31 00:00:00', '836221', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20658', '20170531103', '103', '33148', '20', '2017-05-31 00:00:00', '854376', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20659', '20170531102', '102', '33147', '20', '2017-05-31 00:00:00', '850448', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20660', '20170531101', '101', '33146', '20', '2017-05-31 00:00:00', '295776', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20661', '20170531100', '100', '33145', '20', '2017-05-31 00:00:00', '741189', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20662', '2017053199', '99', '33144', '20', '2017-05-31 00:00:00', '902166', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20663', '2017053198', '98', '33143', '20', '2017-05-31 00:00:00', '940866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20664', '2017053197', '97', '33142', '20', '2017-05-31 00:00:00', '307531', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20665', '2017053196', '96', '33141', '20', '2017-05-31 00:00:00', '953775', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20666', '2017053195', '95', '33140', '20', '2017-05-31 00:00:00', '280230', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20667', '2017053194', '94', '33139', '20', '2017-05-31 00:00:00', '931088', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20668', '2017053193', '93', '33138', '20', '2017-05-31 00:00:00', '197998', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20669', '2017053192', '92', '33137', '20', '2017-05-31 00:00:00', '545852', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20670', '2017053191', '91', '33136', '20', '2017-05-31 00:00:00', '422943', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20671', '2017053190', '90', '33135', '20', '2017-05-31 00:00:00', '567990', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20672', '2017053189', '89', '33134', '20', '2017-05-31 00:00:00', '276550', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20673', '2017053188', '88', '33133', '20', '2017-05-31 00:00:00', '839297', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20674', '2017053187', '87', '33132', '20', '2017-05-31 00:00:00', '514678', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20675', '2017053186', '86', '33131', '20', '2017-05-31 00:00:00', '948446', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20676', '2017053185', '85', '33130', '20', '2017-05-31 00:00:00', '402563', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20677', '2017053184', '84', '33129', '20', '2017-05-31 00:00:00', '905984', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20678', '2017053183', '83', '33128', '20', '2017-05-31 00:00:00', '189813', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20679', '2017053182', '82', '33127', '20', '2017-05-31 00:00:00', '919332', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20680', '2017053181', '81', '33126', '20', '2017-05-31 00:00:00', '885412', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20681', '2017053180', '80', '33125', '20', '2017-05-31 00:00:00', '267788', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20682', '2017053179', '79', '33124', '20', '2017-05-31 00:00:00', '432720', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20683', '2017053178', '78', '33123', '20', '2017-05-31 00:00:00', '677523', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20684', '2017053177', '77', '33122', '20', '2017-05-31 00:00:00', '684472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20685', '2017053176', '76', '33121', '20', '2017-05-31 00:00:00', '696585', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20686', '2017053175', '75', '33120', '20', '2017-05-31 00:00:00', '877777', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20687', '2017053174', '74', '33119', '20', '2017-05-31 00:00:00', '869894', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20688', '2017053173', '73', '33118', '20', '2017-05-31 00:00:00', '109118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20689', '2017053172', '72', '33117', '20', '2017-05-31 00:00:00', '814248', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20690', '2017053171', '71', '33116', '20', '2017-05-31 00:00:00', '709356', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20691', '2017053170', '70', '33115', '20', '2017-05-31 00:00:00', '793319', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20692', '2017053169', '69', '33114', '20', '2017-05-31 00:00:00', '818725', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20693', '2017053168', '68', '33113', '20', '2017-05-31 00:00:00', '592654', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20694', '2017053167', '67', '33112', '20', '2017-05-31 00:00:00', '461834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20695', '2017053166', '66', '33111', '20', '2017-05-31 00:00:00', '194674', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20696', '2017053165', '65', '33110', '20', '2017-05-31 00:00:00', '422668', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20697', '2017053164', '64', '33109', '20', '2017-05-31 00:00:00', '453677', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20698', '2017053163', '63', '33108', '20', '2017-05-31 00:00:00', '219586', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20699', '2017053162', '62', '33107', '20', '2017-05-31 00:00:00', '170834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20700', '2017053161', '61', '33106', '20', '2017-05-31 00:00:00', '580322', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20701', '2017053160', '60', '33105', '20', '2017-05-31 00:00:00', '369192', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20702', '2017053159', '59', '33104', '20', '2017-05-31 00:00:00', '516986', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20703', '2017053158', '58', '33103', '20', '2017-05-31 00:00:00', '468673', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20704', '2017053157', '57', '33102', '20', '2017-05-31 00:00:00', '701062', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20705', '2017053156', '56', '33101', '20', '2017-05-31 00:00:00', '761074', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20706', '2017053155', '55', '33100', '20', '2017-05-31 00:00:00', '538409', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20707', '2017053154', '54', '33099', '20', '2017-05-31 00:00:00', '385067', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20708', '2017053153', '53', '33098', '20', '2017-05-31 00:00:00', '644262', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20709', '2017053152', '52', '33097', '20', '2017-05-31 00:00:00', '701199', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20710', '2017053151', '51', '33096', '20', '2017-05-31 00:00:00', '818231', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20711', '2017053150', '50', '33095', '20', '2017-05-31 00:00:00', '566891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20712', '2017053149', '49', '33094', '20', '2017-05-31 00:00:00', '719299', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20713', '2017053148', '48', '33093', '20', '2017-05-31 00:00:00', '611441', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20714', '2017053147', '47', '33092', '20', '2017-05-31 00:00:00', '540826', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20715', '2017053146', '46', '33091', '20', '2017-05-31 00:00:00', '311019', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20716', '2017053145', '45', '33090', '20', '2017-05-31 00:00:00', '785546', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20717', '2017053144', '44', '33089', '20', '2017-05-31 00:00:00', '463674', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20718', '2017053143', '43', '33088', '20', '2017-05-31 00:00:00', '240570', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20719', '2017053142', '42', '33087', '20', '2017-05-31 00:00:00', '264328', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20720', '2017053141', '41', '33086', '20', '2017-05-31 00:00:00', '252380', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20721', '2017053140', '40', '33085', '20', '2017-05-31 00:00:00', '679776', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20722', '2017053139', '39', '33084', '20', '2017-05-31 00:00:00', '901837', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20723', '2017053138', '38', '33083', '20', '2017-05-31 00:00:00', '623690', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20724', '2017053137', '37', '33082', '20', '2017-05-31 00:00:00', '779174', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20725', '2017053136', '36', '33081', '20', '2017-05-31 00:00:00', '331619', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20726', '2017053135', '35', '33080', '20', '2017-05-31 00:00:00', '359002', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20727', '2017053134', '34', '33079', '20', '2017-05-31 00:00:00', '235983', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20728', '2017053133', '33', '33078', '20', '2017-05-31 00:00:00', '875305', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20729', '2017053132', '32', '33077', '20', '2017-05-31 00:00:00', '741079', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20730', '2017053131', '31', '33076', '20', '2017-05-31 00:00:00', '496441', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20731', '2017053130', '30', '33075', '20', '2017-05-31 00:00:00', '198080', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20732', '2017053129', '29', '33074', '20', '2017-05-31 00:00:00', '400146', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20733', '2017053128', '28', '33073', '20', '2017-05-31 00:00:00', '980032', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20734', '2017053127', '27', '33072', '20', '2017-05-31 00:00:00', '948529', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20735', '2017053126', '26', '33071', '20', '2017-05-31 00:00:00', '256857', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20736', '2017053125', '25', '33070', '20', '2017-05-31 00:00:00', '563073', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20737', '2017053124', '24', '33069', '20', '2017-05-31 00:00:00', '570352', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20738', '2017053123', '23', '33068', '20', '2017-05-31 00:00:00', '899639', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20739', '2017053122', '22', '33067', '20', '2017-05-31 00:00:00', '609188', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20740', '2017053121', '21', '33066', '20', '2017-05-31 00:00:00', '323461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20741', '2017053120', '20', '33065', '20', '2017-05-31 00:00:00', '383914', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20742', '2017053119', '19', '33064', '20', '2017-05-31 00:00:00', '884149', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20743', '2017053118', '18', '33063', '20', '2017-05-31 00:00:00', '101950', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20744', '2017053117', '17', '33062', '20', '2017-05-31 00:00:00', '890686', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20745', '2017053116', '16', '33061', '20', '2017-05-31 00:00:00', '842593', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20746', '2017053115', '15', '33060', '20', '2017-05-31 00:00:00', '986431', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20747', '2017053114', '14', '33059', '20', '2017-05-31 00:00:00', '732015', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20748', '2017053113', '13', '33058', '20', '2017-05-31 00:00:00', '324121', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20749', '2017053112', '12', '33057', '20', '2017-05-31 00:00:00', '118264', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20750', '2017053111', '11', '33056', '20', '2017-05-31 00:00:00', '840863', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20751', '2017053110', '10', '33055', '20', '2017-05-31 00:00:00', '446261', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20752', '201705319', '9', '33054', '20', '2017-05-31 00:00:00', '733142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20753', '201705318', '8', '33053', '20', '2017-05-31 00:00:00', '432803', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20754', '201705317', '7', '33052', '20', '2017-05-31 00:00:00', '531817', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20755', '201705316', '6', '33051', '20', '2017-05-31 00:00:00', '341561', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20756', '201705315', '5', '33050', '20', '2017-05-31 00:00:00', '177124', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20757', '201705314', '4', '33049', '20', '2017-05-31 00:00:00', '858084', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20758', '201705313', '3', '33048', '20', '2017-05-31 00:00:00', '593670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20759', '201705312', '2', '33047', '20', '2017-05-31 00:00:00', '164791', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20760', '201705311', '1', '33046', '20', '2017-05-31 00:00:00', '765441', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20761', '20170601120', '120', '33165', '20', '2017-06-01 00:00:00', '915982', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20762', '20170601119', '119', '33164', '20', '2017-06-01 00:00:00', '210797', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20763', '20170601118', '118', '33163', '20', '2017-06-01 00:00:00', '112826', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20764', '20170601117', '117', '33162', '20', '2017-06-01 00:00:00', '557470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20765', '20170601116', '116', '33161', '20', '2017-06-01 00:00:00', '578372', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20766', '20170601115', '115', '33160', '20', '2017-06-01 00:00:00', '817572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20767', '20170601114', '114', '33159', '20', '2017-06-01 00:00:00', '832540', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20768', '20170601113', '113', '33158', '20', '2017-06-01 00:00:00', '762585', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20769', '20170601112', '112', '33157', '20', '2017-06-01 00:00:00', '267129', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20770', '20170601111', '111', '33156', '20', '2017-06-01 00:00:00', '698370', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20771', '20170601110', '110', '33155', '20', '2017-06-01 00:00:00', '720809', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20772', '20170601109', '109', '33154', '20', '2017-06-01 00:00:00', '340161', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20773', '20170601108', '108', '33153', '20', '2017-06-01 00:00:00', '854129', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20774', '20170601107', '107', '33152', '20', '2017-06-01 00:00:00', '387567', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20775', '20170601106', '106', '33151', '20', '2017-06-01 00:00:00', '424508', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20776', '20170601105', '105', '33150', '20', '2017-06-01 00:00:00', '499572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20777', '20170601104', '104', '33149', '20', '2017-06-01 00:00:00', '961245', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20778', '20170601103', '103', '33148', '20', '2017-06-01 00:00:00', '869537', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20779', '20170601102', '102', '33147', '20', '2017-06-01 00:00:00', '140512', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20780', '20170601101', '101', '33146', '20', '2017-06-01 00:00:00', '200195', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20781', '20170601100', '100', '33145', '20', '2017-06-01 00:00:00', '560354', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20782', '2017060199', '99', '33144', '20', '2017-06-01 00:00:00', '878656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20783', '2017060198', '98', '33143', '20', '2017-06-01 00:00:00', '515695', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20784', '2017060197', '97', '33142', '20', '2017-06-01 00:00:00', '651403', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20785', '2017060196', '96', '33141', '20', '2017-06-01 00:00:00', '973330', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20786', '2017060195', '95', '33140', '20', '2017-06-01 00:00:00', '499298', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20787', '2017060194', '94', '33139', '20', '2017-06-01 00:00:00', '846932', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20788', '2017060193', '93', '33138', '20', '2017-06-01 00:00:00', '812573', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20789', '2017060192', '92', '33137', '20', '2017-06-01 00:00:00', '372048', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20790', '2017060191', '91', '33136', '20', '2017-06-01 00:00:00', '265838', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20791', '2017060190', '90', '33135', '20', '2017-06-01 00:00:00', '881100', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20792', '2017060189', '89', '33134', '20', '2017-06-01 00:00:00', '993078', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20793', '2017060188', '88', '33133', '20', '2017-06-01 00:00:00', '978384', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20794', '2017060187', '87', '33132', '20', '2017-06-01 00:00:00', '262652', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20795', '2017060186', '86', '33131', '20', '2017-06-01 00:00:00', '815072', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20796', '2017060185', '85', '33130', '20', '2017-06-01 00:00:00', '152294', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20797', '2017060184', '84', '33129', '20', '2017-06-01 00:00:00', '964212', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20798', '2017060183', '83', '33128', '20', '2017-06-01 00:00:00', '124114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20799', '2017060182', '82', '33127', '20', '2017-06-01 00:00:00', '395724', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20800', '2017060181', '81', '33126', '20', '2017-06-01 00:00:00', '399597', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20801', '2017060180', '80', '33125', '20', '2017-06-01 00:00:00', '751406', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20802', '2017060179', '79', '33124', '20', '2017-06-01 00:00:00', '834600', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20803', '2017060178', '78', '33123', '20', '2017-06-01 00:00:00', '719931', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20804', '2017060177', '77', '33122', '20', '2017-06-01 00:00:00', '694360', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20805', '2017060176', '76', '33121', '20', '2017-06-01 00:00:00', '311843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20806', '2017060175', '75', '33120', '20', '2017-06-01 00:00:00', '228485', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20807', '2017060174', '74', '33119', '20', '2017-06-01 00:00:00', '634567', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20808', '2017060173', '73', '33118', '20', '2017-06-01 00:00:00', '445959', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20809', '2017060172', '72', '33117', '20', '2017-06-01 00:00:00', '967398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20810', '2017060171', '71', '33116', '20', '2017-06-01 00:00:00', '190142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20811', '2017060170', '70', '33115', '20', '2017-06-01 00:00:00', '336508', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20812', '2017060169', '69', '33114', '20', '2017-06-01 00:00:00', '413769', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20813', '2017060168', '68', '33113', '20', '2017-06-01 00:00:00', '889944', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20814', '2017060167', '67', '33112', '20', '2017-06-01 00:00:00', '353948', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20815', '2017060166', '66', '33111', '20', '2017-06-01 00:00:00', '472628', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20816', '2017060165', '65', '33110', '20', '2017-06-01 00:00:00', '907165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20817', '2017060164', '64', '33109', '20', '2017-06-01 00:00:00', '501358', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20818', '2017060163', '63', '33108', '20', '2017-06-01 00:00:00', '804278', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20819', '2017060162', '62', '33107', '20', '2017-06-01 00:00:00', '339804', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20820', '2017060161', '61', '33106', '20', '2017-06-01 00:00:00', '885522', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20821', '2017060160', '60', '33105', '20', '2017-06-01 00:00:00', '673513', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20822', '2017060159', '59', '33104', '20', '2017-06-01 00:00:00', '275506', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20823', '2017060158', '58', '33103', '20', '2017-06-01 00:00:00', '584909', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20824', '2017060157', '57', '33102', '20', '2017-06-01 00:00:00', '658215', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20825', '2017060156', '56', '33101', '20', '2017-06-01 00:00:00', '928286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20826', '2017060155', '55', '33100', '20', '2017-06-01 00:00:00', '652008', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20827', '2017060154', '54', '33099', '20', '2017-06-01 00:00:00', '504818', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20828', '2017060153', '53', '33098', '20', '2017-06-01 00:00:00', '984619', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20829', '2017060152', '52', '33097', '20', '2017-06-01 00:00:00', '337551', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20830', '2017060151', '51', '33096', '20', '2017-06-01 00:00:00', '668157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20831', '2017060150', '50', '33095', '20', '2017-06-01 00:00:00', '746408', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20832', '2017060149', '49', '33094', '20', '2017-06-01 00:00:00', '374108', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20833', '2017060148', '48', '33093', '20', '2017-06-01 00:00:00', '223184', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20834', '2017060147', '47', '33092', '20', '2017-06-01 00:00:00', '408331', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20835', '2017060146', '46', '33091', '20', '2017-06-01 00:00:00', '606552', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20836', '2017060145', '45', '33090', '20', '2017-06-01 00:00:00', '486059', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20837', '2017060144', '44', '33089', '20', '2017-06-01 00:00:00', '557058', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20838', '2017060143', '43', '33088', '20', '2017-06-01 00:00:00', '406903', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20839', '2017060142', '42', '33087', '20', '2017-06-01 00:00:00', '732125', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20840', '2017060141', '41', '33086', '20', '2017-06-01 00:00:00', '729846', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20841', '2017060140', '40', '33085', '20', '2017-06-01 00:00:00', '861050', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20842', '2017060139', '39', '33084', '20', '2017-06-01 00:00:00', '748248', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20843', '2017060138', '38', '33083', '20', '2017-06-01 00:00:00', '420004', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20844', '2017060137', '37', '33082', '20', '2017-06-01 00:00:00', '964843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20845', '2017060136', '36', '33081', '20', '2017-06-01 00:00:00', '207034', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20846', '2017060135', '35', '33080', '20', '2017-06-01 00:00:00', '166741', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20847', '2017060134', '34', '33079', '20', '2017-06-01 00:00:00', '317062', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20848', '2017060133', '33', '33078', '20', '2017-06-01 00:00:00', '600427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20849', '2017060132', '32', '33077', '20', '2017-06-01 00:00:00', '816885', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20850', '2017060131', '31', '33076', '20', '2017-06-01 00:00:00', '546759', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20851', '2017060130', '30', '33075', '20', '2017-06-01 00:00:00', '620175', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20852', '2017060129', '29', '33074', '20', '2017-06-01 00:00:00', '395971', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20853', '2017060128', '28', '33073', '20', '2017-06-01 00:00:00', '862478', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20854', '2017060127', '27', '33072', '20', '2017-06-01 00:00:00', '622674', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20855', '2017060126', '26', '33071', '20', '2017-06-01 00:00:00', '176217', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20856', '2017060125', '25', '33070', '20', '2017-06-01 00:00:00', '660852', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20857', '2017060124', '24', '33069', '20', '2017-06-01 00:00:00', '765689', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20858', '2017060123', '23', '33068', '20', '2017-06-01 00:00:00', '478863', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20859', '2017060122', '22', '33067', '20', '2017-06-01 00:00:00', '982064', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20860', '2017060121', '21', '33066', '20', '2017-06-01 00:00:00', '354443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20861', '2017060120', '20', '33065', '20', '2017-06-01 00:00:00', '498391', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20862', '2017060119', '19', '33064', '20', '2017-06-01 00:00:00', '649700', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20863', '2017060118', '18', '33063', '20', '2017-06-01 00:00:00', '984591', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20864', '2017060117', '17', '33062', '20', '2017-06-01 00:00:00', '686120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20865', '2017060116', '16', '33061', '20', '2017-06-01 00:00:00', '482461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20866', '2017060115', '15', '33060', '20', '2017-06-01 00:00:00', '319561', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20867', '2017060114', '14', '33059', '20', '2017-06-01 00:00:00', '380673', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20868', '2017060113', '13', '33058', '20', '2017-06-01 00:00:00', '615258', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20869', '2017060112', '12', '33057', '20', '2017-06-01 00:00:00', '689773', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20870', '2017060111', '11', '33056', '20', '2017-06-01 00:00:00', '922821', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20871', '2017060110', '10', '33055', '20', '2017-06-01 00:00:00', '717184', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20872', '201706019', '9', '33054', '20', '2017-06-01 00:00:00', '451232', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20873', '201706018', '8', '33053', '20', '2017-06-01 00:00:00', '642202', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20874', '201706017', '7', '33052', '20', '2017-06-01 00:00:00', '743853', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20875', '201706016', '6', '33051', '20', '2017-06-01 00:00:00', '391000', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20876', '201706015', '5', '33050', '20', '2017-06-01 00:00:00', '953417', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20877', '201706014', '4', '33049', '20', '2017-06-01 00:00:00', '311624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20878', '201706013', '3', '33048', '20', '2017-06-01 00:00:00', '317034', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20879', '201706012', '2', '33047', '20', '2017-06-01 00:00:00', '948995', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20880', '201706011', '1', '33046', '20', '2017-06-01 00:00:00', '631188', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20881', '20170602120', '120', '33165', '20', '2017-06-02 00:00:00', '119912', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20882', '20170602119', '119', '33164', '20', '2017-06-02 00:00:00', '626739', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20883', '20170602118', '118', '33163', '20', '2017-06-02 00:00:00', '788046', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20884', '20170602117', '117', '33162', '20', '2017-06-02 00:00:00', '243920', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20885', '20170602116', '116', '33161', '20', '2017-06-02 00:00:00', '938943', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20886', '20170602115', '115', '33160', '20', '2017-06-02 00:00:00', '407342', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20887', '20170602114', '114', '33159', '20', '2017-06-02 00:00:00', '555026', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20888', '20170602113', '113', '33158', '20', '2017-06-02 00:00:00', '100988', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20889', '20170602112', '112', '33157', '20', '2017-06-02 00:00:00', '490591', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20890', '20170602111', '111', '33156', '20', '2017-06-02 00:00:00', '643218', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20891', '20170602110', '110', '33155', '20', '2017-06-02 00:00:00', '446810', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20892', '20170602109', '109', '33154', '20', '2017-06-02 00:00:00', '961767', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20893', '20170602108', '108', '33153', '20', '2017-06-02 00:00:00', '546731', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20894', '20170602107', '107', '33152', '20', '2017-06-02 00:00:00', '968743', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20895', '20170602106', '106', '33151', '20', '2017-06-02 00:00:00', '210275', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20896', '20170602105', '105', '33150', '20', '2017-06-02 00:00:00', '435632', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20897', '20170602104', '104', '33149', '20', '2017-06-02 00:00:00', '629238', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20898', '20170602103', '103', '33148', '20', '2017-06-02 00:00:00', '568292', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20899', '20170602102', '102', '33147', '20', '2017-06-02 00:00:00', '942294', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20900', '20170602101', '101', '33146', '20', '2017-06-02 00:00:00', '181958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20901', '20170602100', '100', '33145', '20', '2017-06-02 00:00:00', '709988', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20902', '2017060299', '99', '33144', '20', '2017-06-02 00:00:00', '876239', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20903', '2017060298', '98', '33143', '20', '2017-06-02 00:00:00', '589743', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20904', '2017060297', '97', '33142', '20', '2017-06-02 00:00:00', '510119', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20905', '2017060296', '96', '33141', '20', '2017-06-02 00:00:00', '310855', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20906', '2017060295', '95', '33140', '20', '2017-06-02 00:00:00', '176959', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20907', '2017060294', '94', '33139', '20', '2017-06-02 00:00:00', '249496', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20908', '2017060293', '93', '33138', '20', '2017-06-02 00:00:00', '379492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20909', '2017060292', '92', '33137', '20', '2017-06-02 00:00:00', '303713', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20910', '2017060291', '91', '33136', '20', '2017-06-02 00:00:00', '804827', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20911', '2017060290', '90', '33135', '20', '2017-06-02 00:00:00', '568429', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20912', '2017060289', '89', '33134', '20', '2017-06-02 00:00:00', '999450', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20913', '2017060288', '88', '33133', '20', '2017-06-02 00:00:00', '210440', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20914', '2017060287', '87', '33132', '20', '2017-06-02 00:00:00', '144219', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20915', '2017060286', '86', '33131', '20', '2017-06-02 00:00:00', '843417', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20916', '2017060285', '85', '33130', '20', '2017-06-02 00:00:00', '429370', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20917', '2017060284', '84', '33129', '20', '2017-06-02 00:00:00', '902908', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20918', '2017060283', '83', '33128', '20', '2017-06-02 00:00:00', '529510', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20919', '2017060282', '82', '33127', '20', '2017-06-02 00:00:00', '821334', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20920', '2017060281', '81', '33126', '20', '2017-06-02 00:00:00', '778625', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20921', '2017060280', '80', '33125', '20', '2017-06-02 00:00:00', '102993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20922', '2017060279', '79', '33124', '20', '2017-06-02 00:00:00', '245074', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20923', '2017060278', '78', '33123', '20', '2017-06-02 00:00:00', '699057', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20924', '2017060277', '77', '33122', '20', '2017-06-02 00:00:00', '106591', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20925', '2017060276', '76', '33121', '20', '2017-06-02 00:00:00', '482571', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20926', '2017060275', '75', '33120', '20', '2017-06-02 00:00:00', '725286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20927', '2017060274', '74', '33119', '20', '2017-06-02 00:00:00', '223458', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20928', '2017060273', '73', '33118', '20', '2017-06-02 00:00:00', '522644', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20929', '2017060272', '72', '33117', '20', '2017-06-02 00:00:00', '663516', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20930', '2017060271', '71', '33116', '20', '2017-06-02 00:00:00', '254522', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20931', '2017060270', '70', '33115', '20', '2017-06-02 00:00:00', '491415', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20932', '2017060269', '69', '33114', '20', '2017-06-02 00:00:00', '986157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20933', '2017060268', '68', '33113', '20', '2017-06-02 00:00:00', '617703', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20934', '2017060267', '67', '33112', '20', '2017-06-02 00:00:00', '267156', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20935', '2017060266', '66', '33111', '20', '2017-06-02 00:00:00', '349801', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20936', '2017060265', '65', '33110', '20', '2017-06-02 00:00:00', '906506', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20937', '2017060264', '64', '33109', '20', '2017-06-02 00:00:00', '767007', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20938', '2017060263', '63', '33108', '20', '2017-06-02 00:00:00', '847564', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20939', '2017060262', '62', '33107', '20', '2017-06-02 00:00:00', '895492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20940', '2017060261', '61', '33106', '20', '2017-06-02 00:00:00', '143066', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20941', '2017060260', '60', '33105', '20', '2017-06-02 00:00:00', '183303', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20942', '2017060259', '59', '33104', '20', '2017-06-02 00:00:00', '730120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20943', '2017060258', '58', '33103', '20', '2017-06-02 00:00:00', '975363', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20944', '2017060257', '57', '33102', '20', '2017-06-02 00:00:00', '805212', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20945', '2017060256', '56', '33101', '20', '2017-06-02 00:00:00', '188467', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20946', '2017060255', '55', '33100', '20', '2017-06-02 00:00:00', '899200', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20947', '2017060254', '54', '33099', '20', '2017-06-02 00:00:00', '786288', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20948', '2017060253', '53', '33098', '20', '2017-06-02 00:00:00', '952319', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20949', '2017060252', '52', '33097', '20', '2017-06-02 00:00:00', '754373', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20950', '2017060251', '51', '33096', '20', '2017-06-02 00:00:00', '989178', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20951', '2017060250', '50', '33095', '20', '2017-06-02 00:00:00', '975143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20952', '2017060249', '49', '33094', '20', '2017-06-02 00:00:00', '893762', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20953', '2017060248', '48', '33093', '20', '2017-06-02 00:00:00', '502896', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20954', '2017060247', '47', '33092', '20', '2017-06-02 00:00:00', '184429', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20955', '2017060246', '46', '33091', '20', '2017-06-02 00:00:00', '838803', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20956', '2017060245', '45', '33090', '20', '2017-06-02 00:00:00', '488916', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20957', '2017060244', '44', '33089', '20', '2017-06-02 00:00:00', '305911', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20958', '2017060243', '43', '33088', '20', '2017-06-02 00:00:00', '819329', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20959', '2017060242', '42', '33087', '20', '2017-06-02 00:00:00', '124142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20960', '2017060241', '41', '33086', '20', '2017-06-02 00:00:00', '947155', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20961', '2017060240', '40', '33085', '20', '2017-06-02 00:00:00', '585293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20962', '2017060239', '39', '33084', '20', '2017-06-02 00:00:00', '278253', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20963', '2017060238', '38', '33083', '20', '2017-06-02 00:00:00', '828036', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20964', '2017060237', '37', '33082', '20', '2017-06-02 00:00:00', '327856', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20965', '2017060236', '36', '33081', '20', '2017-06-02 00:00:00', '412918', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20966', '2017060235', '35', '33080', '20', '2017-06-02 00:00:00', '895574', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20967', '2017060234', '34', '33079', '20', '2017-06-02 00:00:00', '897360', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20968', '2017060233', '33', '33078', '20', '2017-06-02 00:00:00', '740393', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20969', '2017060232', '32', '33077', '20', '2017-06-02 00:00:00', '210659', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20970', '2017060231', '31', '33076', '20', '2017-06-02 00:00:00', '955670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20971', '2017060230', '30', '33075', '20', '2017-06-02 00:00:00', '528988', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20972', '2017060229', '29', '33074', '20', '2017-06-02 00:00:00', '244140', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20973', '2017060228', '28', '33073', '20', '2017-06-02 00:00:00', '850393', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20974', '2017060227', '27', '33072', '20', '2017-06-02 00:00:00', '992913', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20975', '2017060226', '26', '33071', '20', '2017-06-02 00:00:00', '369796', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20976', '2017060225', '25', '33070', '20', '2017-06-02 00:00:00', '948474', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20977', '2017060224', '24', '33069', '20', '2017-06-02 00:00:00', '953994', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20978', '2017060223', '23', '33068', '20', '2017-06-02 00:00:00', '191680', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20979', '2017060222', '22', '33067', '20', '2017-06-02 00:00:00', '616659', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20980', '2017060221', '21', '33066', '20', '2017-06-02 00:00:00', '912768', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20981', '2017060220', '20', '33065', '20', '2017-06-02 00:00:00', '493338', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20982', '2017060219', '19', '33064', '20', '2017-06-02 00:00:00', '886346', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20983', '2017060218', '18', '33063', '20', '2017-06-02 00:00:00', '116452', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20984', '2017060217', '17', '33062', '20', '2017-06-02 00:00:00', '446398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20985', '2017060216', '16', '33061', '20', '2017-06-02 00:00:00', '790298', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20986', '2017060215', '15', '33060', '20', '2017-06-02 00:00:00', '461285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20987', '2017060214', '14', '33059', '20', '2017-06-02 00:00:00', '866049', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20988', '2017060213', '13', '33058', '20', '2017-06-02 00:00:00', '308740', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20989', '2017060212', '12', '33057', '20', '2017-06-02 00:00:00', '916751', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20990', '2017060211', '11', '33056', '20', '2017-06-02 00:00:00', '350872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20991', '2017060210', '10', '33055', '20', '2017-06-02 00:00:00', '812326', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20992', '201706029', '9', '33054', '20', '2017-06-02 00:00:00', '809167', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20993', '201706028', '8', '33053', '20', '2017-06-02 00:00:00', '394570', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20994', '201706027', '7', '33052', '20', '2017-06-02 00:00:00', '639483', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20995', '201706026', '6', '33051', '20', '2017-06-02 00:00:00', '152157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20996', '201706025', '5', '33050', '20', '2017-06-02 00:00:00', '907055', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20997', '201706024', '4', '33049', '20', '2017-06-02 00:00:00', '995632', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20998', '201706023', '3', '33048', '20', '2017-06-02 00:00:00', '961492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('20999', '201706022', '2', '33047', '20', '2017-06-02 00:00:00', '432418', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21000', '201706021', '1', '33046', '20', '2017-06-02 00:00:00', '911779', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21001', '20170603120', '120', '33165', '20', '2017-06-03 00:00:00', '35035', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21002', '20170603119', '119', '33164', '20', '2017-06-03 00:00:00', '23513', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21003', '20170603118', '118', '33163', '20', '2017-06-03 00:00:00', '88093', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21004', '20170603117', '117', '33162', '20', '2017-06-03 00:00:00', '38449', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21005', '20170603116', '116', '33161', '20', '2017-06-03 00:00:00', '76420', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21006', '20170603115', '115', '33160', '20', '2017-06-03 00:00:00', '40157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21007', '20170603114', '114', '33159', '20', '2017-06-03 00:00:00', '85445', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21008', '20170603113', '113', '33158', '20', '2017-06-03 00:00:00', '70474', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21009', '20170603112', '112', '33157', '20', '2017-06-03 00:00:00', '85286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21010', '20170603111', '111', '33156', '20', '2017-06-03 00:00:00', '22172', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21011', '20170603110', '110', '33155', '20', '2017-06-03 00:00:00', '88247', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21012', '20170603109', '109', '33154', '20', '2017-06-03 00:00:00', '66464', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21013', '20170603108', '108', '33153', '20', '2017-06-03 00:00:00', '36320', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21014', '20170603107', '107', '33152', '20', '2017-06-03 00:00:00', '90496', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21015', '20170603106', '106', '33151', '20', '2017-06-03 00:00:00', '48685', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21016', '20170603105', '105', '33150', '20', '2017-06-03 00:00:00', '34856', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21017', '20170603104', '104', '33149', '20', '2017-06-03 00:00:00', '39209', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21018', '20170603103', '103', '33148', '20', '2017-06-03 00:00:00', '51066', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21019', '20170603102', '102', '33147', '20', '2017-06-03 00:00:00', '53948', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21020', '20170603101', '101', '33146', '20', '2017-06-03 00:00:00', '29088', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21021', '20170603100', '100', '33145', '20', '2017-06-03 00:00:00', '68642', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21022', '2017060399', '99', '33144', '20', '2017-06-03 00:00:00', '24820', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21023', '2017060398', '98', '33143', '20', '2017-06-03 00:00:00', '56222', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21024', '2017060397', '97', '33142', '20', '2017-06-03 00:00:00', '57598', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21025', '2017060396', '96', '33141', '20', '2017-06-03 00:00:00', '54305', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21026', '2017060395', '95', '33140', '20', '2017-06-03 00:00:00', '87695', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21027', '2017060394', '94', '33139', '20', '2017-06-03 00:00:00', '52695', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21028', '2017060393', '93', '33138', '20', '2017-06-03 00:00:00', '83822', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21029', '2017060392', '92', '33137', '20', '2017-06-03 00:00:00', '60885', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21030', '2017060391', '91', '33136', '20', '2017-06-03 00:00:00', '90628', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21031', '2017060390', '90', '33135', '20', '2017-06-03 00:00:00', '85555', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21032', '2017060389', '89', '33134', '20', '2017-06-03 00:00:00', '26199', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21033', '2017060388', '88', '33133', '20', '2017-06-03 00:00:00', '18072', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21034', '2017060387', '87', '33132', '20', '2017-06-03 00:00:00', '19558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21035', '2017060386', '86', '33131', '20', '2017-06-03 00:00:00', '61990', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21036', '2017060385', '85', '33130', '20', '2017-06-03 00:00:00', '28165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21037', '2017060384', '84', '33129', '20', '2017-06-03 00:00:00', '80551', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21038', '2017060383', '83', '33128', '20', '2017-06-03 00:00:00', '85421', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21039', '2017060382', '82', '33127', '20', '2017-06-03 00:00:00', '24186', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21040', '2017060381', '81', '33126', '20', '2017-06-03 00:00:00', '98159', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21041', '2017060380', '80', '33125', '20', '2017-06-03 00:00:00', '88011', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21042', '2017060379', '79', '33124', '20', '2017-06-03 00:00:00', '94155', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21043', '2017060378', '78', '33123', '20', '2017-06-03 00:00:00', '59331', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21044', '2017060377', '77', '33122', '20', '2017-06-03 00:00:00', '19618', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21045', '2017060376', '76', '33121', '20', '2017-06-03 00:00:00', '15138', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21046', '2017060375', '75', '33120', '20', '2017-06-03 00:00:00', '76697', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21047', '2017060374', '74', '33119', '20', '2017-06-03 00:00:00', '29613', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21048', '2017060373', '73', '33118', '20', '2017-06-03 00:00:00', '70979', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21049', '2017060372', '72', '33117', '20', '2017-06-03 00:00:00', '61622', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21050', '2017060371', '71', '33116', '20', '2017-06-03 00:00:00', '18986', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21051', '2017060370', '70', '33115', '20', '2017-06-03 00:00:00', '22219', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21052', '2017060369', '69', '33114', '20', '2017-06-03 00:00:00', '35680', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21053', '2017060368', '68', '33113', '20', '2017-06-03 00:00:00', '22148', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21054', '2017060367', '67', '33112', '20', '2017-06-03 00:00:00', '41959', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21055', '2017060366', '66', '33111', '20', '2017-06-03 00:00:00', '79337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21056', '2017060365', '65', '33110', '20', '2017-06-03 00:00:00', '12158', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21057', '2017060364', '64', '33109', '20', '2017-06-03 00:00:00', '96404', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21058', '2017060363', '63', '33108', '20', '2017-06-03 00:00:00', '41552', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21059', '2017060362', '62', '33107', '20', '2017-06-03 00:00:00', '18154', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21060', '2017060361', '61', '33106', '20', '2017-06-03 00:00:00', '53851', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21061', '2017060360', '60', '33105', '20', '2017-06-03 00:00:00', '79079', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21062', '2017060359', '59', '33104', '20', '2017-06-03 00:00:00', '48704', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21063', '2017060358', '58', '33103', '20', '2017-06-03 00:00:00', '60858', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21064', '2017060357', '57', '33102', '20', '2017-06-03 00:00:00', '79197', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21065', '2017060356', '56', '33101', '20', '2017-06-03 00:00:00', '79859', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21066', '2017060355', '55', '33100', '20', '2017-06-03 00:00:00', '49353', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21067', '2017060354', '54', '33099', '20', '2017-06-03 00:00:00', '24636', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21068', '2017060353', '53', '33098', '20', '2017-06-03 00:00:00', '51632', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21069', '2017060352', '52', '33097', '20', '2017-06-03 00:00:00', '73432', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21070', '2017060351', '51', '33096', '20', '2017-06-03 00:00:00', '74434', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21071', '2017060350', '50', '33095', '20', '2017-06-03 00:00:00', '41676', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21072', '2017060349', '49', '33094', '20', '2017-06-03 00:00:00', '69595', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21073', '2017060348', '48', '33093', '20', '2017-06-03 00:00:00', '79485', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21074', '2017060347', '47', '33092', '20', '2017-06-03 00:00:00', '19887', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21075', '2017060346', '46', '33091', '20', '2017-06-03 00:00:00', '19165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21076', '2017060345', '45', '33090', '20', '2017-06-03 00:00:00', '96522', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21077', '2017060344', '44', '33089', '20', '2017-06-03 00:00:00', '72707', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21078', '2017060343', '43', '33088', '20', '2017-06-03 00:00:00', '96649', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21079', '2017060342', '42', '33087', '20', '2017-06-03 00:00:00', '89291', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21080', '2017060341', '41', '33086', '20', '2017-06-03 00:00:00', '50852', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21081', '2017060340', '40', '33085', '20', '2017-06-03 00:00:00', '72784', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21082', '2017060339', '39', '33084', '20', '2017-06-03 00:00:00', '20656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21083', '2017060338', '38', '33083', '20', '2017-06-03 00:00:00', '69241', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21084', '2017060337', '37', '33082', '20', '2017-06-03 00:00:00', '76022', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21085', '2017060336', '36', '33081', '20', '2017-06-03 00:00:00', '54403', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21086', '2017060335', '35', '33080', '20', '2017-06-03 00:00:00', '92847', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21087', '2017060334', '34', '33079', '20', '2017-06-03 00:00:00', '91202', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21088', '2017060333', '33', '33078', '20', '2017-06-03 00:00:00', '90469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21089', '2017060332', '32', '33077', '20', '2017-06-03 00:00:00', '37254', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21090', '2017060331', '31', '33076', '20', '2017-06-03 00:00:00', '29160', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21091', '2017060330', '30', '33075', '20', '2017-06-03 00:00:00', '62363', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21092', '2017060329', '29', '33074', '20', '2017-06-03 00:00:00', '57631', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21093', '2017060328', '28', '33073', '20', '2017-06-03 00:00:00', '86022', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21094', '2017060327', '27', '33072', '20', '2017-06-03 00:00:00', '40531', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21095', '2017060326', '26', '33071', '20', '2017-06-03 00:00:00', '24911', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21096', '2017060325', '25', '33070', '20', '2017-06-03 00:00:00', '75945', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21097', '2017060324', '24', '33069', '20', '2017-06-03 00:00:00', '40396', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21098', '2017060323', '23', '33068', '20', '2017-06-03 00:00:00', '22897', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21099', '2017060322', '22', '33067', '20', '2017-06-03 00:00:00', '66033', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21100', '2017060321', '21', '33066', '20', '2017-06-03 00:00:00', '18849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21101', '2017060320', '20', '33065', '20', '2017-06-03 00:00:00', '55063', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21102', '2017060319', '19', '33064', '20', '2017-06-03 00:00:00', '97198', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21103', '2017060318', '18', '33063', '20', '2017-06-03 00:00:00', '47916', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21104', '2017060317', '17', '33062', '20', '2017-06-03 00:00:00', '74780', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21105', '2017060316', '16', '33061', '20', '2017-06-03 00:00:00', '59710', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21106', '2017060315', '15', '33060', '20', '2017-06-03 00:00:00', '69370', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21107', '2017060314', '14', '33059', '20', '2017-06-03 00:00:00', '57749', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21108', '2017060313', '13', '33058', '20', '2017-06-03 00:00:00', '27177', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21109', '2017060312', '12', '33057', '20', '2017-06-03 00:00:00', '29025', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21110', '2017060311', '11', '33056', '20', '2017-06-03 00:00:00', '60350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21111', '2017060310', '10', '33055', '20', '2017-06-03 00:00:00', '47718', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21112', '201706039', '9', '33054', '20', '2017-06-03 00:00:00', '64475', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21113', '201706038', '8', '33053', '20', '2017-06-03 00:00:00', '72696', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21114', '201706037', '7', '33052', '20', '2017-06-03 00:00:00', '56076', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21115', '201706036', '6', '33051', '20', '2017-06-03 00:00:00', '15012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21116', '201706035', '5', '33050', '20', '2017-06-03 00:00:00', '60114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21117', '201706034', '4', '33049', '20', '2017-06-03 00:00:00', '75409', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21118', '201706033', '3', '33048', '20', '2017-06-03 00:00:00', '87486', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21119', '201706032', '2', '33047', '20', '2017-06-03 00:00:00', '91817', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('21120', '201706031', '1', '33046', '20', '2017-06-03 00:00:00', '22529', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for autumn_lottery_time
-- ----------------------------
DROP TABLE IF EXISTS `autumn_lottery_time`;
CREATE TABLE `autumn_lottery_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periods` int(11) DEFAULT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `time` varchar(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33166 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_time
-- ----------------------------
INSERT INTO `autumn_lottery_time` VALUES ('33046', '1', '20', '00:05', '300');
INSERT INTO `autumn_lottery_time` VALUES ('33047', '2', '20', '00:10', '600');
INSERT INTO `autumn_lottery_time` VALUES ('33048', '3', '20', '00:15', '900');
INSERT INTO `autumn_lottery_time` VALUES ('33049', '4', '20', '00:20', '1200');
INSERT INTO `autumn_lottery_time` VALUES ('33050', '5', '20', '00:25', '1500');
INSERT INTO `autumn_lottery_time` VALUES ('33051', '6', '20', '00:30', '1800');
INSERT INTO `autumn_lottery_time` VALUES ('33052', '7', '20', '00:35', '2100');
INSERT INTO `autumn_lottery_time` VALUES ('33053', '8', '20', '00:40', '2400');
INSERT INTO `autumn_lottery_time` VALUES ('33054', '9', '20', '00:45', '2700');
INSERT INTO `autumn_lottery_time` VALUES ('33055', '10', '20', '00:50', '3000');
INSERT INTO `autumn_lottery_time` VALUES ('33056', '11', '20', '00:55', '3300');
INSERT INTO `autumn_lottery_time` VALUES ('33057', '12', '20', '01:00', '3600');
INSERT INTO `autumn_lottery_time` VALUES ('33058', '13', '20', '01:05', '3900');
INSERT INTO `autumn_lottery_time` VALUES ('33059', '14', '20', '01:10', '4200');
INSERT INTO `autumn_lottery_time` VALUES ('33060', '15', '20', '01:15', '4500');
INSERT INTO `autumn_lottery_time` VALUES ('33061', '16', '20', '01:20', '4800');
INSERT INTO `autumn_lottery_time` VALUES ('33062', '17', '20', '01:25', '5100');
INSERT INTO `autumn_lottery_time` VALUES ('33063', '18', '20', '01:30', '5400');
INSERT INTO `autumn_lottery_time` VALUES ('33064', '19', '20', '01:35', '5700');
INSERT INTO `autumn_lottery_time` VALUES ('33065', '20', '20', '01:40', '6000');
INSERT INTO `autumn_lottery_time` VALUES ('33066', '21', '20', '01:45', '6300');
INSERT INTO `autumn_lottery_time` VALUES ('33067', '22', '20', '01:50', '6600');
INSERT INTO `autumn_lottery_time` VALUES ('33068', '23', '20', '01:55', '6900');
INSERT INTO `autumn_lottery_time` VALUES ('33069', '24', '20', '02:00', '7200');
INSERT INTO `autumn_lottery_time` VALUES ('33070', '25', '20', '02:05', '7500');
INSERT INTO `autumn_lottery_time` VALUES ('33071', '26', '20', '02:10', '7800');
INSERT INTO `autumn_lottery_time` VALUES ('33072', '27', '20', '02:15', '8100');
INSERT INTO `autumn_lottery_time` VALUES ('33073', '28', '20', '02:20', '8400');
INSERT INTO `autumn_lottery_time` VALUES ('33074', '29', '20', '02:25', '8700');
INSERT INTO `autumn_lottery_time` VALUES ('33075', '30', '20', '02:30', '9000');
INSERT INTO `autumn_lottery_time` VALUES ('33076', '31', '20', '02:35', '9300');
INSERT INTO `autumn_lottery_time` VALUES ('33077', '32', '20', '02:40', '9600');
INSERT INTO `autumn_lottery_time` VALUES ('33078', '33', '20', '02:45', '9900');
INSERT INTO `autumn_lottery_time` VALUES ('33079', '34', '20', '02:50', '10200');
INSERT INTO `autumn_lottery_time` VALUES ('33080', '35', '20', '02:55', '10500');
INSERT INTO `autumn_lottery_time` VALUES ('33081', '36', '20', '03:00', '10800');
INSERT INTO `autumn_lottery_time` VALUES ('33082', '37', '20', '03:05', '11100');
INSERT INTO `autumn_lottery_time` VALUES ('33083', '38', '20', '03:10', '11400');
INSERT INTO `autumn_lottery_time` VALUES ('33084', '39', '20', '03:15', '11700');
INSERT INTO `autumn_lottery_time` VALUES ('33085', '40', '20', '03:20', '12000');
INSERT INTO `autumn_lottery_time` VALUES ('33086', '41', '20', '03:25', '12300');
INSERT INTO `autumn_lottery_time` VALUES ('33087', '42', '20', '03:30', '12600');
INSERT INTO `autumn_lottery_time` VALUES ('33088', '43', '20', '03:35', '12900');
INSERT INTO `autumn_lottery_time` VALUES ('33089', '44', '20', '03:40', '13200');
INSERT INTO `autumn_lottery_time` VALUES ('33090', '45', '20', '03:45', '13500');
INSERT INTO `autumn_lottery_time` VALUES ('33091', '46', '20', '03:50', '13800');
INSERT INTO `autumn_lottery_time` VALUES ('33092', '47', '20', '03:55', '14100');
INSERT INTO `autumn_lottery_time` VALUES ('33093', '48', '20', '04:00', '14400');
INSERT INTO `autumn_lottery_time` VALUES ('33094', '49', '20', '04:05', '14700');
INSERT INTO `autumn_lottery_time` VALUES ('33095', '50', '20', '04:10', '15000');
INSERT INTO `autumn_lottery_time` VALUES ('33096', '51', '20', '04:15', '15300');
INSERT INTO `autumn_lottery_time` VALUES ('33097', '52', '20', '04:20', '15600');
INSERT INTO `autumn_lottery_time` VALUES ('33098', '53', '20', '04:25', '15900');
INSERT INTO `autumn_lottery_time` VALUES ('33099', '54', '20', '04:30', '16200');
INSERT INTO `autumn_lottery_time` VALUES ('33100', '55', '20', '04:35', '16500');
INSERT INTO `autumn_lottery_time` VALUES ('33101', '56', '20', '04:40', '16800');
INSERT INTO `autumn_lottery_time` VALUES ('33102', '57', '20', '04:45', '17100');
INSERT INTO `autumn_lottery_time` VALUES ('33103', '58', '20', '04:50', '17400');
INSERT INTO `autumn_lottery_time` VALUES ('33104', '59', '20', '04:55', '17700');
INSERT INTO `autumn_lottery_time` VALUES ('33105', '60', '20', '05:00', '18000');
INSERT INTO `autumn_lottery_time` VALUES ('33106', '61', '20', '05:05', '18300');
INSERT INTO `autumn_lottery_time` VALUES ('33107', '62', '20', '05:10', '18600');
INSERT INTO `autumn_lottery_time` VALUES ('33108', '63', '20', '05:15', '18900');
INSERT INTO `autumn_lottery_time` VALUES ('33109', '64', '20', '05:20', '19200');
INSERT INTO `autumn_lottery_time` VALUES ('33110', '65', '20', '05:25', '19500');
INSERT INTO `autumn_lottery_time` VALUES ('33111', '66', '20', '05:30', '19800');
INSERT INTO `autumn_lottery_time` VALUES ('33112', '67', '20', '05:35', '20100');
INSERT INTO `autumn_lottery_time` VALUES ('33113', '68', '20', '05:40', '20400');
INSERT INTO `autumn_lottery_time` VALUES ('33114', '69', '20', '05:45', '20700');
INSERT INTO `autumn_lottery_time` VALUES ('33115', '70', '20', '05:50', '21000');
INSERT INTO `autumn_lottery_time` VALUES ('33116', '71', '20', '05:55', '21300');
INSERT INTO `autumn_lottery_time` VALUES ('33117', '72', '20', '06:00', '21600');
INSERT INTO `autumn_lottery_time` VALUES ('33118', '73', '20', '06:05', '21900');
INSERT INTO `autumn_lottery_time` VALUES ('33119', '74', '20', '06:10', '22200');
INSERT INTO `autumn_lottery_time` VALUES ('33120', '75', '20', '06:15', '22500');
INSERT INTO `autumn_lottery_time` VALUES ('33121', '76', '20', '06:20', '22800');
INSERT INTO `autumn_lottery_time` VALUES ('33122', '77', '20', '06:25', '23100');
INSERT INTO `autumn_lottery_time` VALUES ('33123', '78', '20', '06:30', '23400');
INSERT INTO `autumn_lottery_time` VALUES ('33124', '79', '20', '06:35', '23700');
INSERT INTO `autumn_lottery_time` VALUES ('33125', '80', '20', '06:40', '24000');
INSERT INTO `autumn_lottery_time` VALUES ('33126', '81', '20', '06:45', '24300');
INSERT INTO `autumn_lottery_time` VALUES ('33127', '82', '20', '06:50', '24600');
INSERT INTO `autumn_lottery_time` VALUES ('33128', '83', '20', '06:55', '24900');
INSERT INTO `autumn_lottery_time` VALUES ('33129', '84', '20', '07:00', '25200');
INSERT INTO `autumn_lottery_time` VALUES ('33130', '85', '20', '07:05', '25500');
INSERT INTO `autumn_lottery_time` VALUES ('33131', '86', '20', '07:10', '25800');
INSERT INTO `autumn_lottery_time` VALUES ('33132', '87', '20', '07:15', '26100');
INSERT INTO `autumn_lottery_time` VALUES ('33133', '88', '20', '07:20', '26400');
INSERT INTO `autumn_lottery_time` VALUES ('33134', '89', '20', '07:25', '26700');
INSERT INTO `autumn_lottery_time` VALUES ('33135', '90', '20', '07:30', '27000');
INSERT INTO `autumn_lottery_time` VALUES ('33136', '91', '20', '07:35', '27300');
INSERT INTO `autumn_lottery_time` VALUES ('33137', '92', '20', '07:40', '27600');
INSERT INTO `autumn_lottery_time` VALUES ('33138', '93', '20', '07:45', '27900');
INSERT INTO `autumn_lottery_time` VALUES ('33139', '94', '20', '07:50', '28200');
INSERT INTO `autumn_lottery_time` VALUES ('33140', '95', '20', '07:55', '28500');
INSERT INTO `autumn_lottery_time` VALUES ('33141', '96', '20', '08:00', '28800');
INSERT INTO `autumn_lottery_time` VALUES ('33142', '97', '20', '08:05', '29100');
INSERT INTO `autumn_lottery_time` VALUES ('33143', '98', '20', '08:10', '29400');
INSERT INTO `autumn_lottery_time` VALUES ('33144', '99', '20', '08:15', '29700');
INSERT INTO `autumn_lottery_time` VALUES ('33145', '100', '20', '08:20', '30000');
INSERT INTO `autumn_lottery_time` VALUES ('33146', '101', '20', '08:25', '30300');
INSERT INTO `autumn_lottery_time` VALUES ('33147', '102', '20', '08:30', '30600');
INSERT INTO `autumn_lottery_time` VALUES ('33148', '103', '20', '08:35', '30900');
INSERT INTO `autumn_lottery_time` VALUES ('33149', '104', '20', '08:40', '31200');
INSERT INTO `autumn_lottery_time` VALUES ('33150', '105', '20', '08:45', '31500');
INSERT INTO `autumn_lottery_time` VALUES ('33151', '106', '20', '08:50', '31800');
INSERT INTO `autumn_lottery_time` VALUES ('33152', '107', '20', '08:55', '32100');
INSERT INTO `autumn_lottery_time` VALUES ('33153', '108', '20', '09:00', '32400');
INSERT INTO `autumn_lottery_time` VALUES ('33154', '109', '20', '09:05', '32700');
INSERT INTO `autumn_lottery_time` VALUES ('33155', '110', '20', '09:10', '33000');
INSERT INTO `autumn_lottery_time` VALUES ('33156', '111', '20', '09:15', '33300');
INSERT INTO `autumn_lottery_time` VALUES ('33157', '112', '20', '09:20', '33600');
INSERT INTO `autumn_lottery_time` VALUES ('33158', '113', '20', '09:25', '33900');
INSERT INTO `autumn_lottery_time` VALUES ('33159', '114', '20', '09:30', '34200');
INSERT INTO `autumn_lottery_time` VALUES ('33160', '115', '20', '09:35', '34500');
INSERT INTO `autumn_lottery_time` VALUES ('33161', '116', '20', '09:40', '34800');
INSERT INTO `autumn_lottery_time` VALUES ('33162', '117', '20', '09:45', '35100');
INSERT INTO `autumn_lottery_time` VALUES ('33163', '118', '20', '09:50', '35400');
INSERT INTO `autumn_lottery_time` VALUES ('33164', '119', '20', '09:55', '35700');
INSERT INTO `autumn_lottery_time` VALUES ('33165', '120', '20', '10:00', '36000');

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
