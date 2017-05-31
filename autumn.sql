/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3300
Source Database       : autumn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-31 18:36:50
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
INSERT INTO `autumn_admin_user` VALUES ('1', '超级管理员', '', 'admin123456', 'ae2f4f5052e0096ca325861f1c6b510e', '818038', '0', '1496131180', '127.168.0.1', '1496109644', '127.168.0.1', '', '1', '0');

-- ----------------------------
-- Table structure for autumn_betting
-- ----------------------------
DROP TABLE IF EXISTS `autumn_betting`;
CREATE TABLE `autumn_betting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `byid` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `from_lottery` int(11) DEFAULT NULL,
  `from_game_rule` int(11) DEFAULT NULL,
  `from_lottery_time_id` int(11) DEFAULT NULL,
  `multiple` int(11) DEFAULT NULL,
  `notes` int(11) DEFAULT NULL,
  `pattern` int(11) DEFAULT NULL,
  `number` varchar(300) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `winning_money` double DEFAULT NULL,
  `rebate` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pattern_money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_betting
-- ----------------------------
INSERT INTO `autumn_betting` VALUES ('8', '1', 'O20170531623278', '2017053150', '2017-05-31 14:09:08', '22', '81', '33395', '1', '50', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '100', null, null, null, '2');

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
  `index` int(11) DEFAULT '0',
  `highest_bonus` double DEFAULT '0',
  `minimum_bonus` double DEFAULT '0',
  `topbet` int(11) DEFAULT '0',
  `number` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `indexName` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `quick` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `numberRange` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `minimum_money` double(255,0) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_game_rule
-- ----------------------------
INSERT INTO `autumn_game_rule` VALUES ('51', null, '五星', null, null, null, null, '50', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-19 12:09:07');
INSERT INTO `autumn_game_rule` VALUES ('53', null, '三星', null, null, null, null, '50', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-19 12:09:20');
INSERT INTO `autumn_game_rule` VALUES ('55', 'shishicai', '时时彩', '5', null, null, null, null, '0', '0', '0', '0', '0', null, '万,千,百,十,个', null, '0,9', '0', '2017-05-20 03:06:51');
INSERT INTO `autumn_game_rule` VALUES ('56', null, '五星', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-20 03:07:00');
INSERT INTO `autumn_game_rule` VALUES ('57', 'five_stars', '五星复式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '五星复式', '五星复式', '56', '2', '1', '199000', '170000', '75000', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:26:49');
INSERT INTO `autumn_game_rule` VALUES ('58', 'five_star', '五星单式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '五星', '五星', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:27:50');
INSERT INTO `autumn_game_rule` VALUES ('59', null, '四星', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-27 09:28:02');
INSERT INTO `autumn_game_rule` VALUES ('60', 'start_four_stars', '前四复式', null, '1=a&&2=b&&3=c&&4=d', '前四复式', '前四复式', '59', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:28:25');
INSERT INTO `autumn_game_rule` VALUES ('61', 'start_four_star', '前四单式', null, '1=a&&2=b&&3=c&&4=d', 'start_four_star', 'start_four_star', '59', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:28:41');
INSERT INTO `autumn_game_rule` VALUES ('62', 'end_four_stars', '后四复式', null, '2=b&&3=c&&4=d&&5=e', 'end_four_stars', 'end_four_stars', '59', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:28:55');
INSERT INTO `autumn_game_rule` VALUES ('63', 'end_four_star', '后四单式', null, '2=b&&3=c&&4=d&&5=e', 'end_four_star', 'end_four_star', '59', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:29:11');
INSERT INTO `autumn_game_rule` VALUES ('64', null, '三星', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-27 09:29:22');
INSERT INTO `autumn_game_rule` VALUES ('65', 'start_three_stars', '前三复式', null, '1=a&&2=b&&3=c', 'start_three_stars', 'start_three_stars', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:29:53');
INSERT INTO `autumn_game_rule` VALUES ('66', 'start_three_star', '前三单式', null, '1=a&&2=b&&3=c', 'start_three_star', 'start_three_star', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-29 01:51:26');
INSERT INTO `autumn_game_rule` VALUES ('67', 'center_three_stars', '中三复式', null, '2=b&&3=c&&4=d', 'center_three_stars', 'center_three_stars', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:30:24');
INSERT INTO `autumn_game_rule` VALUES ('68', 'center_three_star', '中三单式', null, '2=b&&3=c&&4=d', 'center_three_star', 'center_three_star', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:30:41');
INSERT INTO `autumn_game_rule` VALUES ('69', 'end_three_stars', '后三复式', null, '3=c&&4=d&&5=e', 'end_three_stars', 'end_three_stars', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:30:59');
INSERT INTO `autumn_game_rule` VALUES ('70', 'end_three_star', '后三单式', null, '3=c&&4=d&&5=e', 'end_three_star', 'end_three_star', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:31:18');
INSERT INTO `autumn_game_rule` VALUES ('71', 'end_three_group_three', '后三组三', null, '3=ab', 'end_three_group_three', 'end_three_group_three', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '组三,组三,组三,组三,组三,组三', '全,大,小,奇,偶,清', null, '0', '2017-05-28 09:20:11');
INSERT INTO `autumn_game_rule` VALUES ('72', 'end_three_group_six', '后三组六', null, '3=abc', 'end_three_group_six', 'end_three_group_six', '64', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '组六,组六,组六,组六,组六,组六', '全,大,小,奇,偶,清', null, '0', '2017-05-28 09:20:28');
INSERT INTO `autumn_game_rule` VALUES ('73', null, '二星', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-27 09:31:53');
INSERT INTO `autumn_game_rule` VALUES ('74', 'start_two_stars', '前二复式', null, '1=a&&2=b', 'start_two_stars', 'start_two_stars', '73', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:32:07');
INSERT INTO `autumn_game_rule` VALUES ('75', 'start_two_star', '前二单式', null, '1=a&&2=b', 'start_two_star', 'start_two_star', '73', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:32:21');
INSERT INTO `autumn_game_rule` VALUES ('76', 'end_two_stars', '后二复式', null, '4=d&&5=e', 'end_two_stars', 'end_two_stars', '73', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:32:35');
INSERT INTO `autumn_game_rule` VALUES ('77', 'end_two_star', '后二单式', null, '4=d&&5=e', 'end_two_star', 'end_two_star', '73', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:33:06');
INSERT INTO `autumn_game_rule` VALUES ('78', null, '定位胆', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-27 09:37:54');
INSERT INTO `autumn_game_rule` VALUES ('81', 'five_location', '五星定位胆', null, '1=a||2=b||3=c||4=d||5=e', '五星定位胆', '五星定位胆', '78', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-29 02:18:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery
-- ----------------------------
INSERT INTO `autumn_lottery` VALUES ('22', '重庆时时彩', '55', '120', '0', '0', '60');

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
) ENGINE=InnoDB AUTO_INCREMENT=24841 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_data
-- ----------------------------
INSERT INTO `autumn_lottery_data` VALUES ('24001', '20170529120', '120', '33465', '22', '2017-05-29 00:00:00', '85509', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24002', '20170529119', '119', '33464', '22', '2017-05-29 00:00:00', '78766', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24003', '20170529118', '118', '33463', '22', '2017-05-29 00:00:00', '62388', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24004', '20170529117', '117', '33462', '22', '2017-05-29 00:00:00', '13919', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24005', '20170529116', '116', '33461', '22', '2017-05-29 00:00:00', '73149', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24006', '20170529115', '115', '33460', '22', '2017-05-29 00:00:00', '64692', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24007', '20170529114', '114', '33459', '22', '2017-05-29 00:00:00', '19003', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24008', '20170529113', '113', '33458', '22', '2017-05-29 00:00:00', '83078', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24009', '20170529112', '112', '33457', '22', '2017-05-29 00:00:00', '57098', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24010', '20170529111', '111', '33456', '22', '2017-05-29 00:00:00', '98255', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24011', '20170529110', '110', '33455', '22', '2017-05-29 00:00:00', '38020', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24012', '20170529109', '109', '33454', '22', '2017-05-29 00:00:00', '24092', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24013', '20170529108', '108', '33453', '22', '2017-05-29 00:00:00', '23293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24014', '20170529107', '107', '33452', '22', '2017-05-29 00:00:00', '86643', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24015', '20170529106', '106', '33451', '22', '2017-05-29 00:00:00', '82877', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24016', '20170529105', '105', '33450', '22', '2017-05-29 00:00:00', '81650', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24017', '20170529104', '104', '33449', '22', '2017-05-29 00:00:00', '92672', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24018', '20170529103', '103', '33448', '22', '2017-05-29 00:00:00', '72042', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24019', '20170529102', '102', '33447', '22', '2017-05-29 00:00:00', '72012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24020', '20170529101', '101', '33446', '22', '2017-05-29 00:00:00', '95437', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24021', '20170529100', '100', '33445', '22', '2017-05-29 00:00:00', '71171', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24022', '2017052999', '99', '33444', '22', '2017-05-29 00:00:00', '51640', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24023', '2017052998', '98', '33443', '22', '2017-05-29 00:00:00', '58861', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24024', '2017052997', '97', '33442', '22', '2017-05-29 00:00:00', '40143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24025', '2017052996', '96', '33441', '22', '2017-05-29 00:00:00', '79730', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24026', '2017052995', '95', '33440', '22', '2017-05-29 00:00:00', '67626', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24027', '2017052994', '94', '33439', '22', '2017-05-29 00:00:00', '51863', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24028', '2017052993', '93', '33438', '22', '2017-05-29 00:00:00', '25455', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24029', '2017052992', '92', '33437', '22', '2017-05-29 00:00:00', '14284', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24030', '2017052991', '91', '33436', '22', '2017-05-29 00:00:00', '27185', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24031', '2017052990', '90', '33435', '22', '2017-05-29 00:00:00', '14454', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24032', '2017052989', '89', '33434', '22', '2017-05-29 00:00:00', '26059', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24033', '2017052988', '88', '33433', '22', '2017-05-29 00:00:00', '85772', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24034', '2017052987', '87', '33432', '22', '2017-05-29 00:00:00', '62506', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24035', '2017052986', '86', '33431', '22', '2017-05-29 00:00:00', '45073', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24036', '2017052985', '85', '33430', '22', '2017-05-29 00:00:00', '61643', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24037', '2017052984', '84', '33429', '22', '2017-05-29 00:00:00', '10131', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24038', '2017052983', '83', '33428', '22', '2017-05-29 00:00:00', '80776', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24039', '2017052982', '82', '33427', '22', '2017-05-29 00:00:00', '17157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24040', '2017052981', '81', '33426', '22', '2017-05-29 00:00:00', '16896', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24041', '2017052980', '80', '33425', '22', '2017-05-29 00:00:00', '88299', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24042', '2017052979', '79', '33424', '22', '2017-05-29 00:00:00', '34183', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24043', '2017052978', '78', '33423', '22', '2017-05-29 00:00:00', '29143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24044', '2017052977', '77', '33422', '22', '2017-05-29 00:00:00', '91504', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24045', '2017052976', '76', '33421', '22', '2017-05-29 00:00:00', '36213', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24046', '2017052975', '75', '33420', '22', '2017-05-29 00:00:00', '99914', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24047', '2017052974', '74', '33419', '22', '2017-05-29 00:00:00', '44469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24048', '2017052973', '73', '33418', '22', '2017-05-29 00:00:00', '80155', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24049', '2017052972', '72', '33417', '22', '2017-05-29 00:00:00', '64810', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24050', '2017052971', '71', '33416', '22', '2017-05-29 00:00:00', '50157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24051', '2017052970', '70', '33415', '22', '2017-05-29 00:00:00', '71572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24052', '2017052969', '69', '33414', '22', '2017-05-29 00:00:00', '92537', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24053', '2017052968', '68', '33413', '22', '2017-05-29 00:00:00', '70029', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24054', '2017052967', '67', '33412', '22', '2017-05-29 00:00:00', '62099', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24055', '2017052966', '66', '33411', '22', '2017-05-29 00:00:00', '73890', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24056', '2017052965', '65', '33410', '22', '2017-05-29 00:00:00', '13337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24057', '2017052964', '64', '33409', '22', '2017-05-29 00:00:00', '82806', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24058', '2017052963', '63', '33408', '22', '2017-05-29 00:00:00', '87928', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24059', '2017052962', '62', '33407', '22', '2017-05-29 00:00:00', '59861', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24060', '2017052961', '61', '33406', '22', '2017-05-29 00:00:00', '42242', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24061', '2017052960', '60', '33405', '22', '2017-05-29 00:00:00', '89079', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24062', '2017052959', '59', '33404', '22', '2017-05-29 00:00:00', '34831', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24063', '2017052958', '58', '33403', '22', '2017-05-29 00:00:00', '82921', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24064', '2017052957', '57', '33402', '22', '2017-05-29 00:00:00', '63940', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24065', '2017052956', '56', '33401', '22', '2017-05-29 00:00:00', '29786', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24066', '2017052955', '55', '33400', '22', '2017-05-29 00:00:00', '34996', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24067', '2017052954', '54', '33399', '22', '2017-05-29 00:00:00', '61509', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24068', '2017052953', '53', '33398', '22', '2017-05-29 00:00:00', '98118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24069', '2017052952', '52', '33397', '22', '2017-05-29 00:00:00', '70864', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24070', '2017052951', '51', '33396', '22', '2017-05-29 00:00:00', '85610', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24071', '2017052950', '50', '33395', '22', '2017-05-29 00:00:00', '49061', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24072', '2017052949', '49', '33394', '22', '2017-05-29 00:00:00', '29465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24073', '2017052948', '48', '33393', '22', '2017-05-29 00:00:00', '63250', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24074', '2017052947', '47', '33392', '22', '2017-05-29 00:00:00', '48861', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24075', '2017052946', '46', '33391', '22', '2017-05-29 00:00:00', '54016', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24076', '2017052945', '45', '33390', '22', '2017-05-29 00:00:00', '57666', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24077', '2017052944', '44', '33389', '22', '2017-05-29 00:00:00', '82883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24078', '2017052943', '43', '33388', '22', '2017-05-29 00:00:00', '11936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24079', '2017052942', '42', '33387', '22', '2017-05-29 00:00:00', '39811', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24080', '2017052941', '41', '33386', '22', '2017-05-29 00:00:00', '67411', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24081', '2017052940', '40', '33385', '22', '2017-05-29 00:00:00', '70699', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24082', '2017052939', '39', '33384', '22', '2017-05-29 00:00:00', '17023', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24083', '2017052938', '38', '33383', '22', '2017-05-29 00:00:00', '14883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24084', '2017052937', '37', '33382', '22', '2017-05-29 00:00:00', '78387', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24085', '2017052936', '36', '33381', '22', '2017-05-29 00:00:00', '12636', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24086', '2017052935', '35', '33380', '22', '2017-05-29 00:00:00', '61308', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24087', '2017052934', '34', '33379', '22', '2017-05-29 00:00:00', '32670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24088', '2017052933', '33', '33378', '22', '2017-05-29 00:00:00', '65280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24089', '2017052932', '32', '33377', '22', '2017-05-29 00:00:00', '29632', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24090', '2017052931', '31', '33376', '22', '2017-05-29 00:00:00', '96981', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24091', '2017052930', '30', '33375', '22', '2017-05-29 00:00:00', '11609', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24092', '2017052929', '29', '33374', '22', '2017-05-29 00:00:00', '47779', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24093', '2017052928', '28', '33373', '22', '2017-05-29 00:00:00', '17624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24094', '2017052927', '27', '33372', '22', '2017-05-29 00:00:00', '31228', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24095', '2017052926', '26', '33371', '22', '2017-05-29 00:00:00', '95138', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24096', '2017052925', '25', '33370', '22', '2017-05-29 00:00:00', '90570', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24097', '2017052924', '24', '33369', '22', '2017-05-29 00:00:00', '97550', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24098', '2017052923', '23', '33368', '22', '2017-05-29 00:00:00', '86236', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24099', '2017052922', '22', '33367', '22', '2017-05-29 00:00:00', '21694', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24100', '2017052921', '21', '33366', '22', '2017-05-29 00:00:00', '33343', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24101', '2017052920', '20', '33365', '22', '2017-05-29 00:00:00', '75346', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24102', '2017052919', '19', '33364', '22', '2017-05-29 00:00:00', '79194', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24103', '2017052918', '18', '33363', '22', '2017-05-29 00:00:00', '24716', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24104', '2017052917', '17', '33362', '22', '2017-05-29 00:00:00', '30783', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24105', '2017052916', '16', '33361', '22', '2017-05-29 00:00:00', '71951', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24106', '2017052915', '15', '33360', '22', '2017-05-29 00:00:00', '52289', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24107', '2017052914', '14', '33359', '22', '2017-05-29 00:00:00', '22639', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24108', '2017052913', '13', '33358', '22', '2017-05-29 00:00:00', '12579', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24109', '2017052912', '12', '33357', '22', '2017-05-29 00:00:00', '73303', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24110', '2017052911', '11', '33356', '22', '2017-05-29 00:00:00', '92707', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24111', '2017052910', '10', '33355', '22', '2017-05-29 00:00:00', '68903', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24112', '201705299', '9', '33354', '22', '2017-05-29 00:00:00', '43417', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24113', '201705298', '8', '33353', '22', '2017-05-29 00:00:00', '20338', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24114', '201705297', '7', '33352', '22', '2017-05-29 00:00:00', '62638', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24115', '201705296', '6', '33351', '22', '2017-05-29 00:00:00', '81943', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24116', '201705295', '5', '33350', '22', '2017-05-29 00:00:00', '52986', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24117', '201705294', '4', '33349', '22', '2017-05-29 00:00:00', '78994', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24118', '201705293', '3', '33348', '22', '2017-05-29 00:00:00', '49267', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24119', '201705292', '2', '33347', '22', '2017-05-29 00:00:00', '25199', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24120', '201705291', '1', '33346', '22', '2017-05-29 00:00:00', '15973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24121', '20170530120', '120', '33465', '22', '2017-05-30 00:00:00', '10208', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24122', '20170530119', '119', '33464', '22', '2017-05-30 00:00:00', '94784', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24123', '20170530118', '118', '33463', '22', '2017-05-30 00:00:00', '87107', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24124', '20170530117', '117', '33462', '22', '2017-05-30 00:00:00', '42066', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24125', '20170530116', '116', '33461', '22', '2017-05-30 00:00:00', '69919', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24126', '20170530115', '115', '33460', '22', '2017-05-30 00:00:00', '16374', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24127', '20170530114', '114', '33459', '22', '2017-05-30 00:00:00', '51105', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24128', '20170530113', '113', '33458', '22', '2017-05-30 00:00:00', '15951', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24129', '20170530112', '112', '33457', '22', '2017-05-30 00:00:00', '19063', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24130', '20170530111', '111', '33456', '22', '2017-05-30 00:00:00', '36227', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24131', '20170530110', '110', '33455', '22', '2017-05-30 00:00:00', '15630', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24132', '20170530109', '109', '33454', '22', '2017-05-30 00:00:00', '47317', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24133', '20170530108', '108', '33453', '22', '2017-05-30 00:00:00', '23579', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24134', '20170530107', '107', '33452', '22', '2017-05-30 00:00:00', '61528', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24135', '20170530106', '106', '33451', '22', '2017-05-30 00:00:00', '34120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24136', '20170530105', '105', '33450', '22', '2017-05-30 00:00:00', '20851', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24137', '20170530104', '104', '33449', '22', '2017-05-30 00:00:00', '24403', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24138', '20170530103', '103', '33448', '22', '2017-05-30 00:00:00', '44466', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24139', '20170530102', '102', '33447', '22', '2017-05-30 00:00:00', '25012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24140', '20170530101', '101', '33446', '22', '2017-05-30 00:00:00', '46241', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24141', '20170530100', '100', '33445', '22', '2017-05-30 00:00:00', '97473', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24142', '2017053099', '99', '33444', '22', '2017-05-30 00:00:00', '72229', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24143', '2017053098', '98', '33443', '22', '2017-05-30 00:00:00', '41744', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24144', '2017053097', '97', '33442', '22', '2017-05-30 00:00:00', '98173', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24145', '2017053096', '96', '33441', '22', '2017-05-30 00:00:00', '93726', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24146', '2017053095', '95', '33440', '22', '2017-05-30 00:00:00', '97003', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24147', '2017053094', '94', '33439', '22', '2017-05-30 00:00:00', '92754', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24148', '2017053093', '93', '33438', '22', '2017-05-30 00:00:00', '16336', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24149', '2017053092', '92', '33437', '22', '2017-05-30 00:00:00', '89101', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24150', '2017053091', '91', '33436', '22', '2017-05-30 00:00:00', '25976', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24151', '2017053090', '90', '33435', '22', '2017-05-30 00:00:00', '51478', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24152', '2017053089', '89', '33434', '22', '2017-05-30 00:00:00', '45417', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24153', '2017053088', '88', '33433', '22', '2017-05-30 00:00:00', '24534', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24154', '2017053087', '87', '33432', '22', '2017-05-30 00:00:00', '81336', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24155', '2017053086', '86', '33431', '22', '2017-05-30 00:00:00', '16355', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24156', '2017053085', '85', '33430', '22', '2017-05-30 00:00:00', '25103', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24157', '2017053084', '84', '33429', '22', '2017-05-30 00:00:00', '65964', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24158', '2017053083', '83', '33428', '22', '2017-05-30 00:00:00', '80271', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24159', '2017053082', '82', '33427', '22', '2017-05-30 00:00:00', '40822', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24160', '2017053081', '81', '33426', '22', '2017-05-30 00:00:00', '20082', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24161', '2017053080', '80', '33425', '22', '2017-05-30 00:00:00', '64327', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24162', '2017053079', '79', '33424', '22', '2017-05-30 00:00:00', '64967', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24163', '2017053078', '78', '33423', '22', '2017-05-30 00:00:00', '43316', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24164', '2017053077', '77', '33422', '22', '2017-05-30 00:00:00', '50042', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24165', '2017053076', '76', '33421', '22', '2017-05-30 00:00:00', '95561', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24166', '2017053075', '75', '33420', '22', '2017-05-30 00:00:00', '32612', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24167', '2017053074', '74', '33419', '22', '2017-05-30 00:00:00', '77274', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24168', '2017053073', '73', '33418', '22', '2017-05-30 00:00:00', '89670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24169', '2017053072', '72', '33417', '22', '2017-05-30 00:00:00', '10604', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24170', '2017053071', '71', '33416', '22', '2017-05-30 00:00:00', '25394', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24171', '2017053070', '70', '33415', '22', '2017-05-30 00:00:00', '61135', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24172', '2017053069', '69', '33414', '22', '2017-05-30 00:00:00', '68653', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24173', '2017053068', '68', '33413', '22', '2017-05-30 00:00:00', '65393', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24174', '2017053067', '67', '33412', '22', '2017-05-30 00:00:00', '40500', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24175', '2017053066', '66', '33411', '22', '2017-05-30 00:00:00', '48336', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24176', '2017053065', '65', '33410', '22', '2017-05-30 00:00:00', '51679', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24177', '2017053064', '64', '33409', '22', '2017-05-30 00:00:00', '20865', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24178', '2017053063', '63', '33408', '22', '2017-05-30 00:00:00', '30118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24179', '2017053062', '62', '33407', '22', '2017-05-30 00:00:00', '47315', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24180', '2017053061', '61', '33406', '22', '2017-05-30 00:00:00', '58435', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24181', '2017053060', '60', '33405', '22', '2017-05-30 00:00:00', '42958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24182', '2017053059', '59', '33404', '22', '2017-05-30 00:00:00', '81435', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24183', '2017053058', '58', '33403', '22', '2017-05-30 00:00:00', '21508', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24184', '2017053057', '57', '33402', '22', '2017-05-30 00:00:00', '63610', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24185', '2017053056', '56', '33401', '22', '2017-05-30 00:00:00', '72611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24186', '2017053055', '55', '33400', '22', '2017-05-30 00:00:00', '56639', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24187', '2017053054', '54', '33399', '22', '2017-05-30 00:00:00', '69353', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24188', '2017053053', '53', '33398', '22', '2017-05-30 00:00:00', '86890', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24189', '2017053052', '52', '33397', '22', '2017-05-30 00:00:00', '95759', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24190', '2017053051', '51', '33396', '22', '2017-05-30 00:00:00', '42917', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24191', '2017053050', '50', '33395', '22', '2017-05-30 00:00:00', '64288', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24192', '2017053049', '49', '33394', '22', '2017-05-30 00:00:00', '12963', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24193', '2017053048', '48', '33393', '22', '2017-05-30 00:00:00', '53341', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24194', '2017053047', '47', '33392', '22', '2017-05-30 00:00:00', '82457', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24195', '2017053046', '46', '33391', '22', '2017-05-30 00:00:00', '14751', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24196', '2017053045', '45', '33390', '22', '2017-05-30 00:00:00', '41517', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24197', '2017053044', '44', '33389', '22', '2017-05-30 00:00:00', '21293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24198', '2017053043', '43', '33388', '22', '2017-05-30 00:00:00', '82446', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24199', '2017053042', '42', '33387', '22', '2017-05-30 00:00:00', '64179', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24200', '2017053041', '41', '33386', '22', '2017-05-30 00:00:00', '57238', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24201', '2017053040', '40', '33385', '22', '2017-05-30 00:00:00', '30555', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24202', '2017053039', '39', '33384', '22', '2017-05-30 00:00:00', '85072', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24203', '2017053038', '38', '33383', '22', '2017-05-30 00:00:00', '41008', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24204', '2017053037', '37', '33382', '22', '2017-05-30 00:00:00', '79815', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24205', '2017053036', '36', '33381', '22', '2017-05-30 00:00:00', '67062', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24206', '2017053035', '35', '33380', '22', '2017-05-30 00:00:00', '87522', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24207', '2017053034', '34', '33379', '22', '2017-05-30 00:00:00', '88678', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24208', '2017053033', '33', '33378', '22', '2017-05-30 00:00:00', '83935', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24209', '2017053032', '32', '33377', '22', '2017-05-30 00:00:00', '71754', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24210', '2017053031', '31', '33376', '22', '2017-05-30 00:00:00', '41983', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24211', '2017053030', '30', '33375', '22', '2017-05-30 00:00:00', '35625', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24212', '2017053029', '29', '33374', '22', '2017-05-30 00:00:00', '89285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24213', '2017053028', '28', '33373', '22', '2017-05-30 00:00:00', '30566', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24214', '2017053027', '27', '33372', '22', '2017-05-30 00:00:00', '35644', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24215', '2017053026', '26', '33371', '22', '2017-05-30 00:00:00', '25287', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24216', '2017053025', '25', '33370', '22', '2017-05-30 00:00:00', '70553', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24217', '2017053024', '24', '33369', '22', '2017-05-30 00:00:00', '64437', '2', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24218', '2017053023', '23', '33368', '22', '2017-05-30 00:00:00', '20692', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24219', '2017053022', '22', '33367', '22', '2017-05-30 00:00:00', '66101', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24220', '2017053021', '21', '33366', '22', '2017-05-30 00:00:00', '47427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24221', '2017053020', '20', '33365', '22', '2017-05-30 00:00:00', '69304', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24222', '2017053019', '19', '33364', '22', '2017-05-30 00:00:00', '84314', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24223', '2017053018', '18', '33363', '22', '2017-05-30 00:00:00', '31505', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24224', '2017053017', '17', '33362', '22', '2017-05-30 00:00:00', '84594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24225', '2017053016', '16', '33361', '22', '2017-05-30 00:00:00', '76104', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24226', '2017053015', '15', '33360', '22', '2017-05-30 00:00:00', '88697', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24227', '2017053014', '14', '33359', '22', '2017-05-30 00:00:00', '19937', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24228', '2017053013', '13', '33358', '22', '2017-05-30 00:00:00', '21741', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24229', '2017053012', '12', '33357', '22', '2017-05-30 00:00:00', '70776', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24230', '2017053011', '11', '33356', '22', '2017-05-30 00:00:00', '31030', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24231', '2017053010', '10', '33355', '22', '2017-05-30 00:00:00', '84833', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24232', '201705309', '9', '33354', '22', '2017-05-30 00:00:00', '13556', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24233', '201705308', '8', '33353', '22', '2017-05-30 00:00:00', '84256', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24234', '201705307', '7', '33352', '22', '2017-05-30 00:00:00', '43500', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24235', '201705306', '6', '33351', '22', '2017-05-30 00:00:00', '54631', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24236', '201705305', '5', '33350', '22', '2017-05-30 00:00:00', '79727', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24237', '201705304', '4', '33349', '22', '2017-05-30 00:00:00', '12482', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24238', '201705303', '3', '33348', '22', '2017-05-30 00:00:00', '33293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24239', '201705302', '2', '33347', '22', '2017-05-30 00:00:00', '72770', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24240', '201705301', '1', '33346', '22', '2017-05-30 00:00:00', '14941', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24241', '20170531120', '120', '33465', '22', '2017-05-31 00:00:00', '66392', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24242', '20170531119', '119', '33464', '22', '2017-05-31 00:00:00', '42599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24243', '20170531118', '118', '33463', '22', '2017-05-31 00:00:00', '57686', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24244', '20170531117', '117', '33462', '22', '2017-05-31 00:00:00', '18885', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24245', '20170531116', '116', '33461', '22', '2017-05-31 00:00:00', '51923', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24246', '20170531115', '115', '33460', '22', '2017-05-31 00:00:00', '68603', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24247', '20170531114', '114', '33459', '22', '2017-05-31 00:00:00', '62816', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24248', '20170531113', '113', '33458', '22', '2017-05-31 00:00:00', '66247', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24249', '20170531112', '112', '33457', '22', '2017-05-31 00:00:00', '90013', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24250', '20170531111', '111', '33456', '22', '2017-05-31 00:00:00', '63495', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24251', '20170531110', '110', '33455', '22', '2017-05-31 00:00:00', '96599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24252', '20170531109', '109', '33454', '22', '2017-05-31 00:00:00', '86714', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24253', '20170531108', '108', '33453', '22', '2017-05-31 00:00:00', '76599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24254', '20170531107', '107', '33452', '22', '2017-05-31 00:00:00', '24460', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24255', '20170531106', '106', '33451', '22', '2017-05-31 00:00:00', '32472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24256', '20170531105', '105', '33450', '22', '2017-05-31 00:00:00', '54975', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24257', '20170531104', '104', '33449', '22', '2017-05-31 00:00:00', '42618', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24258', '20170531103', '103', '33448', '22', '2017-05-31 00:00:00', '83688', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24259', '20170531102', '102', '33447', '22', '2017-05-31 00:00:00', '58872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24260', '20170531101', '101', '33446', '22', '2017-05-31 00:00:00', '80716', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24261', '20170531100', '100', '33445', '22', '2017-05-31 00:00:00', '64008', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24262', '2017053199', '99', '33444', '22', '2017-05-31 00:00:00', '58364', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24263', '2017053198', '98', '33443', '22', '2017-05-31 00:00:00', '49237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24264', '2017053197', '97', '33442', '22', '2017-05-31 00:00:00', '48625', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24265', '2017053196', '96', '33441', '22', '2017-05-31 00:00:00', '81707', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24266', '2017053195', '95', '33440', '22', '2017-05-31 00:00:00', '80677', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24267', '2017053194', '94', '33439', '22', '2017-05-31 00:00:00', '12005', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24268', '2017053193', '93', '33438', '22', '2017-05-31 00:00:00', '68389', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24269', '2017053192', '92', '33437', '22', '2017-05-31 00:00:00', '81652', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24270', '2017053191', '91', '33436', '22', '2017-05-31 00:00:00', '57815', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24271', '2017053190', '90', '33435', '22', '2017-05-31 00:00:00', '90612', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24272', '2017053189', '89', '33434', '22', '2017-05-31 00:00:00', '24696', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24273', '2017053188', '88', '33433', '22', '2017-05-31 00:00:00', '94781', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24274', '2017053187', '87', '33432', '22', '2017-05-31 00:00:00', '31964', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24275', '2017053186', '86', '33431', '22', '2017-05-31 00:00:00', '23496', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24276', '2017053185', '85', '33430', '22', '2017-05-31 00:00:00', '27234', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24277', '2017053184', '84', '33429', '22', '2017-05-31 00:00:00', '17031', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24278', '2017053183', '83', '33428', '22', '2017-05-31 00:00:00', '90312', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24279', '2017053182', '82', '33427', '22', '2017-05-31 00:00:00', '44096', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24280', '2017053181', '81', '33426', '22', '2017-05-31 00:00:00', '50690', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24281', '2017053180', '80', '33425', '22', '2017-05-31 00:00:00', '59339', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24282', '2017053179', '79', '33424', '22', '2017-05-31 00:00:00', '95047', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24283', '2017053178', '78', '33423', '22', '2017-05-31 00:00:00', '70847', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24284', '2017053177', '77', '33422', '22', '2017-05-31 00:00:00', '24751', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24285', '2017053176', '76', '33421', '22', '2017-05-31 00:00:00', '27644', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24286', '2017053175', '75', '33420', '22', '2017-05-31 00:00:00', '43357', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24287', '2017053174', '74', '33419', '22', '2017-05-31 00:00:00', '67189', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24288', '2017053173', '73', '33418', '22', '2017-05-31 00:00:00', '14106', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24289', '2017053172', '72', '33417', '22', '2017-05-31 00:00:00', '42882', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24290', '2017053171', '71', '33416', '22', '2017-05-31 00:00:00', '67428', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24291', '2017053170', '70', '33415', '22', '2017-05-31 00:00:00', '41558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24292', '2017053169', '69', '33414', '22', '2017-05-31 00:00:00', '38440', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24293', '2017053168', '68', '33413', '22', '2017-05-31 00:00:00', '90991', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24294', '2017053167', '67', '33412', '22', '2017-05-31 00:00:00', '74448', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24295', '2017053166', '66', '33411', '22', '2017-05-31 00:00:00', '47391', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24296', '2017053165', '65', '33410', '22', '2017-05-31 00:00:00', '72443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24297', '2017053164', '64', '33409', '22', '2017-05-31 00:00:00', '22908', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24298', '2017053163', '63', '33408', '22', '2017-05-31 00:00:00', '16605', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24299', '2017053162', '62', '33407', '22', '2017-05-31 00:00:00', '93128', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24300', '2017053161', '61', '33406', '22', '2017-05-31 00:00:00', '45801', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24301', '2017053160', '60', '33405', '22', '2017-05-31 00:00:00', '94572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24302', '2017053159', '59', '33404', '22', '2017-05-31 00:00:00', '71086', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24303', '2017053158', '58', '33403', '22', '2017-05-31 00:00:00', '52203', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24304', '2017053157', '57', '33402', '22', '2017-05-31 00:00:00', '23202', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24305', '2017053156', '56', '33401', '22', '2017-05-31 00:00:00', '66920', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24306', '2017053155', '55', '33400', '22', '2017-05-31 00:00:00', '10079', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24307', '2017053154', '54', '33399', '22', '2017-05-31 00:00:00', '23057', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24308', '2017053153', '53', '33398', '22', '2017-05-31 00:00:00', '24334', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24309', '2017053152', '52', '33397', '22', '2017-05-31 00:00:00', '15888', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24310', '2017053151', '51', '33396', '22', '2017-05-31 00:00:00', '10771', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24311', '2017053150', '50', '33395', '22', '2017-05-31 00:00:00', '59125', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24312', '2017053149', '49', '33394', '22', '2017-05-31 00:00:00', '23883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24313', '2017053148', '48', '33393', '22', '2017-05-31 00:00:00', '62415', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24314', '2017053147', '47', '33392', '22', '2017-05-31 00:00:00', '25350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24315', '2017053146', '46', '33391', '22', '2017-05-31 00:00:00', '78845', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24316', '2017053145', '45', '33390', '22', '2017-05-31 00:00:00', '41539', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24317', '2017053144', '44', '33389', '22', '2017-05-31 00:00:00', '12438', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24318', '2017053143', '43', '33388', '22', '2017-05-31 00:00:00', '51003', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24319', '2017053142', '42', '33387', '22', '2017-05-31 00:00:00', '45656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24320', '2017053141', '41', '33386', '22', '2017-05-31 00:00:00', '51986', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24321', '2017053140', '40', '33385', '22', '2017-05-31 00:00:00', '76895', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24322', '2017053139', '39', '33384', '22', '2017-05-31 00:00:00', '39918', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24323', '2017053138', '38', '33383', '22', '2017-05-31 00:00:00', '57993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24324', '2017053137', '37', '33382', '22', '2017-05-31 00:00:00', '74915', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24325', '2017053136', '36', '33381', '22', '2017-05-31 00:00:00', '61723', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24326', '2017053135', '35', '33380', '22', '2017-05-31 00:00:00', '79282', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24327', '2017053134', '34', '33379', '22', '2017-05-31 00:00:00', '79296', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24328', '2017053133', '33', '33378', '22', '2017-05-31 00:00:00', '85011', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24329', '2017053132', '32', '33377', '22', '2017-05-31 00:00:00', '87860', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24330', '2017053131', '31', '33376', '22', '2017-05-31 00:00:00', '31283', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24331', '2017053130', '30', '33375', '22', '2017-05-31 00:00:00', '28001', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24332', '2017053129', '29', '33374', '22', '2017-05-31 00:00:00', '11963', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24333', '2017053128', '28', '33373', '22', '2017-05-31 00:00:00', '51242', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24334', '2017053127', '27', '33372', '22', '2017-05-31 00:00:00', '73108', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24335', '2017053126', '26', '33371', '22', '2017-05-31 00:00:00', '47545', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24336', '2017053125', '25', '33370', '22', '2017-05-31 00:00:00', '10458', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24337', '2017053124', '24', '33369', '22', '2017-05-31 00:00:00', '72808', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24338', '2017053123', '23', '33368', '22', '2017-05-31 00:00:00', '66944', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24339', '2017053122', '22', '33367', '22', '2017-05-31 00:00:00', '56367', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24340', '2017053121', '21', '33366', '22', '2017-05-31 00:00:00', '10184', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24341', '2017053120', '20', '33365', '22', '2017-05-31 00:00:00', '48496', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24342', '2017053119', '19', '33364', '22', '2017-05-31 00:00:00', '99980', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24343', '2017053118', '18', '33363', '22', '2017-05-31 00:00:00', '17904', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24344', '2017053117', '17', '33362', '22', '2017-05-31 00:00:00', '75827', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24345', '2017053116', '16', '33361', '22', '2017-05-31 00:00:00', '99241', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24346', '2017053115', '15', '33360', '22', '2017-05-31 00:00:00', '34403', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24347', '2017053114', '14', '33359', '22', '2017-05-31 00:00:00', '30593', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24348', '2017053113', '13', '33358', '22', '2017-05-31 00:00:00', '47076', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24349', '2017053112', '12', '33357', '22', '2017-05-31 00:00:00', '30983', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24350', '2017053111', '11', '33356', '22', '2017-05-31 00:00:00', '47400', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24351', '2017053110', '10', '33355', '22', '2017-05-31 00:00:00', '57872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24352', '201705319', '9', '33354', '22', '2017-05-31 00:00:00', '78617', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24353', '201705318', '8', '33353', '22', '2017-05-31 00:00:00', '54659', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24354', '201705317', '7', '33352', '22', '2017-05-31 00:00:00', '91158', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24355', '201705316', '6', '33351', '22', '2017-05-31 00:00:00', '18179', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24356', '201705315', '5', '33350', '22', '2017-05-31 00:00:00', '10140', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24357', '201705314', '4', '33349', '22', '2017-05-31 00:00:00', '66206', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24358', '201705313', '3', '33348', '22', '2017-05-31 00:00:00', '72866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24359', '201705312', '2', '33347', '22', '2017-05-31 00:00:00', '54950', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24360', '201705311', '1', '33346', '22', '2017-05-31 00:00:00', '86330', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24361', '20170601120', '120', '33465', '22', '2017-06-01 00:00:00', '96561', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24362', '20170601119', '119', '33464', '22', '2017-06-01 00:00:00', '34710', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24363', '20170601118', '118', '33463', '22', '2017-06-01 00:00:00', '86624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24364', '20170601117', '117', '33462', '22', '2017-06-01 00:00:00', '56875', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24365', '20170601116', '116', '33461', '22', '2017-06-01 00:00:00', '41662', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24366', '20170601115', '115', '33460', '22', '2017-06-01 00:00:00', '63879', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24367', '20170601114', '114', '33459', '22', '2017-06-01 00:00:00', '76637', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24368', '20170601113', '113', '33458', '22', '2017-06-01 00:00:00', '76464', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24369', '20170601112', '112', '33457', '22', '2017-06-01 00:00:00', '22447', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24370', '20170601111', '111', '33456', '22', '2017-06-01 00:00:00', '22560', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24371', '20170601110', '110', '33455', '22', '2017-06-01 00:00:00', '33428', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24372', '20170601109', '109', '33454', '22', '2017-06-01 00:00:00', '74783', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24373', '20170601108', '108', '33453', '22', '2017-06-01 00:00:00', '24853', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24374', '20170601107', '107', '33452', '22', '2017-06-01 00:00:00', '87939', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24375', '20170601106', '106', '33451', '22', '2017-06-01 00:00:00', '10433', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24376', '20170601105', '105', '33450', '22', '2017-06-01 00:00:00', '26520', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24377', '20170601104', '104', '33449', '22', '2017-06-01 00:00:00', '79818', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24378', '20170601103', '103', '33448', '22', '2017-06-01 00:00:00', '32206', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24379', '20170601102', '102', '33447', '22', '2017-06-01 00:00:00', '16091', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24380', '20170601101', '101', '33446', '22', '2017-06-01 00:00:00', '41363', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24381', '20170601100', '100', '33445', '22', '2017-06-01 00:00:00', '83278', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24382', '2017060199', '99', '33444', '22', '2017-06-01 00:00:00', '32546', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24383', '2017060198', '98', '33443', '22', '2017-06-01 00:00:00', '13839', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24384', '2017060197', '97', '33442', '22', '2017-06-01 00:00:00', '93998', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24385', '2017060196', '96', '33441', '22', '2017-06-01 00:00:00', '66173', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24386', '2017060195', '95', '33440', '22', '2017-06-01 00:00:00', '41148', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24387', '2017060194', '94', '33439', '22', '2017-06-01 00:00:00', '12114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24388', '2017060193', '93', '33438', '22', '2017-06-01 00:00:00', '24114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24389', '2017060192', '92', '33437', '22', '2017-06-01 00:00:00', '14438', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24390', '2017060191', '91', '33436', '22', '2017-06-01 00:00:00', '55200', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24391', '2017060190', '90', '33435', '22', '2017-06-01 00:00:00', '64354', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24392', '2017060189', '89', '33434', '22', '2017-06-01 00:00:00', '76398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24393', '2017060188', '88', '33433', '22', '2017-06-01 00:00:00', '49012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24394', '2017060187', '87', '33432', '22', '2017-06-01 00:00:00', '26888', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24395', '2017060186', '86', '33431', '22', '2017-06-01 00:00:00', '88997', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24396', '2017060185', '85', '33430', '22', '2017-06-01 00:00:00', '90538', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24397', '2017060184', '84', '33429', '22', '2017-06-01 00:00:00', '65832', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24398', '2017060183', '83', '33428', '22', '2017-06-01 00:00:00', '43401', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24399', '2017060182', '82', '33427', '22', '2017-06-01 00:00:00', '49479', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24400', '2017060181', '81', '33426', '22', '2017-06-01 00:00:00', '41220', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24401', '2017060180', '80', '33425', '22', '2017-06-01 00:00:00', '95836', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24402', '2017060179', '79', '33424', '22', '2017-06-01 00:00:00', '56925', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24403', '2017060178', '78', '33423', '22', '2017-06-01 00:00:00', '44238', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24404', '2017060177', '77', '33422', '22', '2017-06-01 00:00:00', '38133', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24405', '2017060176', '76', '33421', '22', '2017-06-01 00:00:00', '34960', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24406', '2017060175', '75', '33420', '22', '2017-06-01 00:00:00', '64648', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24407', '2017060174', '74', '33419', '22', '2017-06-01 00:00:00', '36713', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24408', '2017060173', '73', '33418', '22', '2017-06-01 00:00:00', '55964', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24409', '2017060172', '72', '33417', '22', '2017-06-01 00:00:00', '94144', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24410', '2017060171', '71', '33416', '22', '2017-06-01 00:00:00', '18758', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24411', '2017060170', '70', '33415', '22', '2017-06-01 00:00:00', '35339', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24412', '2017060169', '69', '33414', '22', '2017-06-01 00:00:00', '24400', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24413', '2017060168', '68', '33413', '22', '2017-06-01 00:00:00', '79323', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24414', '2017060167', '67', '33412', '22', '2017-06-01 00:00:00', '96443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24415', '2017060166', '66', '33411', '22', '2017-06-01 00:00:00', '93556', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24416', '2017060165', '65', '33410', '22', '2017-06-01 00:00:00', '98129', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24417', '2017060164', '64', '33409', '22', '2017-06-01 00:00:00', '21436', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24418', '2017060163', '63', '33408', '22', '2017-06-01 00:00:00', '69889', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24419', '2017060162', '62', '33407', '22', '2017-06-01 00:00:00', '39800', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24420', '2017060161', '61', '33406', '22', '2017-06-01 00:00:00', '26839', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24421', '2017060160', '60', '33405', '22', '2017-06-01 00:00:00', '86420', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24422', '2017060159', '59', '33404', '22', '2017-06-01 00:00:00', '26284', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24423', '2017060158', '58', '33403', '22', '2017-06-01 00:00:00', '17509', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24424', '2017060157', '57', '33402', '22', '2017-06-01 00:00:00', '55216', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24425', '2017060156', '56', '33401', '22', '2017-06-01 00:00:00', '35213', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24426', '2017060155', '55', '33400', '22', '2017-06-01 00:00:00', '97816', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24427', '2017060154', '54', '33399', '22', '2017-06-01 00:00:00', '35120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24428', '2017060153', '53', '33398', '22', '2017-06-01 00:00:00', '22950', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24429', '2017060152', '52', '33397', '22', '2017-06-01 00:00:00', '33752', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24430', '2017060151', '51', '33396', '22', '2017-06-01 00:00:00', '11672', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24431', '2017060150', '50', '33395', '22', '2017-06-01 00:00:00', '56071', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24432', '2017060149', '49', '33394', '22', '2017-06-01 00:00:00', '84726', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24433', '2017060148', '48', '33393', '22', '2017-06-01 00:00:00', '22974', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24434', '2017060147', '47', '33392', '22', '2017-06-01 00:00:00', '80040', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24435', '2017060146', '46', '33391', '22', '2017-06-01 00:00:00', '88799', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24436', '2017060145', '45', '33390', '22', '2017-06-01 00:00:00', '80232', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24437', '2017060144', '44', '33389', '22', '2017-06-01 00:00:00', '78818', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24438', '2017060143', '43', '33388', '22', '2017-06-01 00:00:00', '30107', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24439', '2017060142', '42', '33387', '22', '2017-06-01 00:00:00', '96742', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24440', '2017060141', '41', '33386', '22', '2017-06-01 00:00:00', '74157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24441', '2017060140', '40', '33385', '22', '2017-06-01 00:00:00', '52220', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24442', '2017060139', '39', '33384', '22', '2017-06-01 00:00:00', '84061', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24443', '2017060138', '38', '33383', '22', '2017-06-01 00:00:00', '88338', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24444', '2017060137', '37', '33382', '22', '2017-06-01 00:00:00', '86187', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24445', '2017060136', '36', '33381', '22', '2017-06-01 00:00:00', '19118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24446', '2017060135', '35', '33380', '22', '2017-06-01 00:00:00', '59089', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24447', '2017060134', '34', '33379', '22', '2017-06-01 00:00:00', '27023', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24448', '2017060133', '33', '33378', '22', '2017-06-01 00:00:00', '91010', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24449', '2017060132', '32', '33377', '22', '2017-06-01 00:00:00', '10450', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24450', '2017060131', '31', '33376', '22', '2017-06-01 00:00:00', '87379', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24451', '2017060130', '30', '33375', '22', '2017-06-01 00:00:00', '11235', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24452', '2017060129', '29', '33374', '22', '2017-06-01 00:00:00', '18313', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24453', '2017060128', '28', '33373', '22', '2017-06-01 00:00:00', '12153', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24454', '2017060127', '27', '33372', '22', '2017-06-01 00:00:00', '76118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24455', '2017060126', '26', '33371', '22', '2017-06-01 00:00:00', '94413', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24456', '2017060125', '25', '33370', '22', '2017-06-01 00:00:00', '22785', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24457', '2017060124', '24', '33369', '22', '2017-06-01 00:00:00', '55164', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24458', '2017060123', '23', '33368', '22', '2017-06-01 00:00:00', '67494', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24459', '2017060122', '22', '33367', '22', '2017-06-01 00:00:00', '14993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24460', '2017060121', '21', '33366', '22', '2017-06-01 00:00:00', '34112', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24461', '2017060120', '20', '33365', '22', '2017-06-01 00:00:00', '35422', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24462', '2017060119', '19', '33364', '22', '2017-06-01 00:00:00', '58694', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24463', '2017060118', '18', '33363', '22', '2017-06-01 00:00:00', '96412', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24464', '2017060117', '17', '33362', '22', '2017-06-01 00:00:00', '26982', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24465', '2017060116', '16', '33361', '22', '2017-06-01 00:00:00', '73863', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24466', '2017060115', '15', '33360', '22', '2017-06-01 00:00:00', '91905', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24467', '2017060114', '14', '33359', '22', '2017-06-01 00:00:00', '77109', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24468', '2017060113', '13', '33358', '22', '2017-06-01 00:00:00', '21082', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24469', '2017060112', '12', '33357', '22', '2017-06-01 00:00:00', '66425', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24470', '2017060111', '11', '33356', '22', '2017-06-01 00:00:00', '74316', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24471', '2017060110', '10', '33355', '22', '2017-06-01 00:00:00', '10521', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24472', '201706019', '9', '33354', '22', '2017-06-01 00:00:00', '81100', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24473', '201706018', '8', '33353', '22', '2017-06-01 00:00:00', '44046', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24474', '201706017', '7', '33352', '22', '2017-06-01 00:00:00', '48114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24475', '201706016', '6', '33351', '22', '2017-06-01 00:00:00', '85086', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24476', '201706015', '5', '33350', '22', '2017-06-01 00:00:00', '46724', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24477', '201706014', '4', '33349', '22', '2017-06-01 00:00:00', '82663', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24478', '201706013', '3', '33348', '22', '2017-06-01 00:00:00', '10486', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24479', '201706012', '2', '33347', '22', '2017-06-01 00:00:00', '84240', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24480', '201706011', '1', '33346', '22', '2017-06-01 00:00:00', '72641', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24481', '20170602120', '120', '33465', '22', '2017-06-02 00:00:00', '33214', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24482', '20170602119', '119', '33464', '22', '2017-06-02 00:00:00', '93619', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24483', '20170602118', '118', '33463', '22', '2017-06-02 00:00:00', '16421', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24484', '20170602117', '117', '33462', '22', '2017-06-02 00:00:00', '88538', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24485', '20170602116', '116', '33461', '22', '2017-06-02 00:00:00', '61635', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24486', '20170602115', '115', '33460', '22', '2017-06-02 00:00:00', '24702', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24487', '20170602114', '114', '33459', '22', '2017-06-02 00:00:00', '25067', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24488', '20170602113', '113', '33458', '22', '2017-06-02 00:00:00', '69103', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24489', '20170602112', '112', '33457', '22', '2017-06-02 00:00:00', '18865', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24490', '20170602111', '111', '33456', '22', '2017-06-02 00:00:00', '25921', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24491', '20170602110', '110', '33455', '22', '2017-06-02 00:00:00', '28616', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24492', '20170602109', '109', '33454', '22', '2017-06-02 00:00:00', '34024', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24493', '20170602108', '108', '33453', '22', '2017-06-02 00:00:00', '70842', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24494', '20170602107', '107', '33452', '22', '2017-06-02 00:00:00', '94465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24495', '20170602106', '106', '33451', '22', '2017-06-02 00:00:00', '80504', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24496', '20170602105', '105', '33450', '22', '2017-06-02 00:00:00', '47987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24497', '20170602104', '104', '33449', '22', '2017-06-02 00:00:00', '68502', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24498', '20170602103', '103', '33448', '22', '2017-06-02 00:00:00', '92521', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24499', '20170602102', '102', '33447', '22', '2017-06-02 00:00:00', '99170', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24500', '20170602101', '101', '33446', '22', '2017-06-02 00:00:00', '40682', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24501', '20170602100', '100', '33445', '22', '2017-06-02 00:00:00', '87783', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24502', '2017060299', '99', '33444', '22', '2017-06-02 00:00:00', '17275', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24503', '2017060298', '98', '33443', '22', '2017-06-02 00:00:00', '48051', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24504', '2017060297', '97', '33442', '22', '2017-06-02 00:00:00', '76794', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24505', '2017060296', '96', '33441', '22', '2017-06-02 00:00:00', '69622', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24506', '2017060295', '95', '33440', '22', '2017-06-02 00:00:00', '90917', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24507', '2017060294', '94', '33439', '22', '2017-06-02 00:00:00', '25584', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24508', '2017060293', '93', '33438', '22', '2017-06-02 00:00:00', '86011', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24509', '2017060292', '92', '33437', '22', '2017-06-02 00:00:00', '89958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24510', '2017060291', '91', '33436', '22', '2017-06-02 00:00:00', '40632', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24511', '2017060290', '90', '33435', '22', '2017-06-02 00:00:00', '85206', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24512', '2017060289', '89', '33434', '22', '2017-06-02 00:00:00', '43022', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24513', '2017060288', '88', '33433', '22', '2017-06-02 00:00:00', '89727', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24514', '2017060287', '87', '33432', '22', '2017-06-02 00:00:00', '88609', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24515', '2017060286', '86', '33431', '22', '2017-06-02 00:00:00', '55357', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24516', '2017060285', '85', '33430', '22', '2017-06-02 00:00:00', '57513', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24517', '2017060284', '84', '33429', '22', '2017-06-02 00:00:00', '54868', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24518', '2017060283', '83', '33428', '22', '2017-06-02 00:00:00', '52036', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24519', '2017060282', '82', '33427', '22', '2017-06-02 00:00:00', '79472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24520', '2017060281', '81', '33426', '22', '2017-06-02 00:00:00', '14172', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24521', '2017060280', '80', '33425', '22', '2017-06-02 00:00:00', '16317', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24522', '2017060279', '79', '33424', '22', '2017-06-02 00:00:00', '63099', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24523', '2017060278', '78', '33423', '22', '2017-06-02 00:00:00', '75989', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24524', '2017060277', '77', '33422', '22', '2017-06-02 00:00:00', '22686', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24525', '2017060276', '76', '33421', '22', '2017-06-02 00:00:00', '50012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24526', '2017060275', '75', '33420', '22', '2017-06-02 00:00:00', '28987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24527', '2017060274', '74', '33419', '22', '2017-06-02 00:00:00', '98346', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24528', '2017060273', '73', '33418', '22', '2017-06-02 00:00:00', '57743', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24529', '2017060272', '72', '33417', '22', '2017-06-02 00:00:00', '96890', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24530', '2017060271', '71', '33416', '22', '2017-06-02 00:00:00', '81886', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24531', '2017060270', '70', '33415', '22', '2017-06-02 00:00:00', '64981', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24532', '2017060269', '69', '33414', '22', '2017-06-02 00:00:00', '49031', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24533', '2017060268', '68', '33413', '22', '2017-06-02 00:00:00', '52890', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24534', '2017060267', '67', '33412', '22', '2017-06-02 00:00:00', '38984', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24535', '2017060266', '66', '33411', '22', '2017-06-02 00:00:00', '29330', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24536', '2017060265', '65', '33410', '22', '2017-06-02 00:00:00', '61237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24537', '2017060264', '64', '33409', '22', '2017-06-02 00:00:00', '38948', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24538', '2017060263', '63', '33408', '22', '2017-06-02 00:00:00', '32469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24539', '2017060262', '62', '33407', '22', '2017-06-02 00:00:00', '89832', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24540', '2017060261', '61', '33406', '22', '2017-06-02 00:00:00', '24048', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24541', '2017060260', '60', '33405', '22', '2017-06-02 00:00:00', '41003', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24542', '2017060259', '59', '33404', '22', '2017-06-02 00:00:00', '59529', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24543', '2017060258', '58', '33403', '22', '2017-06-02 00:00:00', '29923', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24544', '2017060257', '57', '33402', '22', '2017-06-02 00:00:00', '92153', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24545', '2017060256', '56', '33401', '22', '2017-06-02 00:00:00', '89991', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24546', '2017060255', '55', '33400', '22', '2017-06-02 00:00:00', '72350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24547', '2017060254', '54', '33399', '22', '2017-06-02 00:00:00', '38042', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24548', '2017060253', '53', '33398', '22', '2017-06-02 00:00:00', '15237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24549', '2017060252', '52', '33397', '22', '2017-06-02 00:00:00', '81850', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24550', '2017060251', '51', '33396', '22', '2017-06-02 00:00:00', '68120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24551', '2017060250', '50', '33395', '22', '2017-06-02 00:00:00', '77626', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24552', '2017060249', '49', '33394', '22', '2017-06-02 00:00:00', '37990', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24553', '2017060248', '48', '33393', '22', '2017-06-02 00:00:00', '47518', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24554', '2017060247', '47', '33392', '22', '2017-06-02 00:00:00', '89027', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24555', '2017060246', '46', '33391', '22', '2017-06-02 00:00:00', '67112', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24556', '2017060245', '45', '33390', '22', '2017-06-02 00:00:00', '90098', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24557', '2017060244', '44', '33389', '22', '2017-06-02 00:00:00', '62932', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24558', '2017060243', '43', '33388', '22', '2017-06-02 00:00:00', '42258', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24559', '2017060242', '42', '33387', '22', '2017-06-02 00:00:00', '59938', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24560', '2017060241', '41', '33386', '22', '2017-06-02 00:00:00', '56249', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24561', '2017060240', '40', '33385', '22', '2017-06-02 00:00:00', '69029', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24562', '2017060239', '39', '33384', '22', '2017-06-02 00:00:00', '60001', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24563', '2017060238', '38', '33383', '22', '2017-06-02 00:00:00', '64541', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24564', '2017060237', '37', '33382', '22', '2017-06-02 00:00:00', '46131', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24565', '2017060236', '36', '33381', '22', '2017-06-02 00:00:00', '51748', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24566', '2017060235', '35', '33380', '22', '2017-06-02 00:00:00', '49443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24567', '2017060234', '34', '33379', '22', '2017-06-02 00:00:00', '44359', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24568', '2017060233', '33', '33378', '22', '2017-06-02 00:00:00', '34430', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24569', '2017060232', '32', '33377', '22', '2017-06-02 00:00:00', '42025', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24570', '2017060231', '31', '33376', '22', '2017-06-02 00:00:00', '52772', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24571', '2017060230', '30', '33375', '22', '2017-06-02 00:00:00', '97830', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24572', '2017060229', '29', '33374', '22', '2017-06-02 00:00:00', '40835', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24573', '2017060228', '28', '33373', '22', '2017-06-02 00:00:00', '25798', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24574', '2017060227', '27', '33372', '22', '2017-06-02 00:00:00', '67175', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24575', '2017060226', '26', '33371', '22', '2017-06-02 00:00:00', '98390', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24576', '2017060225', '25', '33370', '22', '2017-06-02 00:00:00', '40033', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24577', '2017060224', '24', '33369', '22', '2017-06-02 00:00:00', '34005', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24578', '2017060223', '23', '33368', '22', '2017-06-02 00:00:00', '44840', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24579', '2017060222', '22', '33367', '22', '2017-06-02 00:00:00', '54478', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24580', '2017060221', '21', '33366', '22', '2017-06-02 00:00:00', '51712', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24581', '2017060220', '20', '33365', '22', '2017-06-02 00:00:00', '52583', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24582', '2017060219', '19', '33364', '22', '2017-06-02 00:00:00', '72954', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24583', '2017060218', '18', '33363', '22', '2017-06-02 00:00:00', '19530', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24584', '2017060217', '17', '33362', '22', '2017-06-02 00:00:00', '50558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24585', '2017060216', '16', '33361', '22', '2017-06-02 00:00:00', '22469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24586', '2017060215', '15', '33360', '22', '2017-06-02 00:00:00', '13705', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24587', '2017060214', '14', '33359', '22', '2017-06-02 00:00:00', '91985', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24588', '2017060213', '13', '33358', '22', '2017-06-02 00:00:00', '56260', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24589', '2017060212', '12', '33357', '22', '2017-06-02 00:00:00', '19602', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24590', '2017060211', '11', '33356', '22', '2017-06-02 00:00:00', '44280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24591', '2017060210', '10', '33355', '22', '2017-06-02 00:00:00', '55280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24592', '201706029', '9', '33354', '22', '2017-06-02 00:00:00', '43505', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24593', '201706028', '8', '33353', '22', '2017-06-02 00:00:00', '74918', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24594', '201706027', '7', '33352', '22', '2017-06-02 00:00:00', '26866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24595', '201706026', '6', '33351', '22', '2017-06-02 00:00:00', '97852', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24596', '201706025', '5', '33350', '22', '2017-06-02 00:00:00', '31980', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24597', '201706024', '4', '33349', '22', '2017-06-02 00:00:00', '84355', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24598', '201706023', '3', '33348', '22', '2017-06-02 00:00:00', '48652', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24599', '201706022', '2', '33347', '22', '2017-06-02 00:00:00', '93139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24600', '201706021', '1', '33346', '22', '2017-06-02 00:00:00', '86374', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24601', '20170603120', '120', '33465', '22', '2017-06-03 00:00:00', '78851', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24602', '20170603119', '119', '33464', '22', '2017-06-03 00:00:00', '61825', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24603', '20170603118', '118', '33463', '22', '2017-06-03 00:00:00', '49578', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24604', '20170603117', '117', '33462', '22', '2017-06-03 00:00:00', '46372', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24605', '20170603116', '116', '33461', '22', '2017-06-03 00:00:00', '44343', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24606', '20170603115', '115', '33460', '22', '2017-06-03 00:00:00', '63572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24607', '20170603114', '114', '33459', '22', '2017-06-03 00:00:00', '20607', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24608', '20170603113', '113', '33458', '22', '2017-06-03 00:00:00', '66664', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24609', '20170603112', '112', '33457', '22', '2017-06-03 00:00:00', '11768', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24610', '20170603111', '111', '33456', '22', '2017-06-03 00:00:00', '96080', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24611', '20170603110', '110', '33455', '22', '2017-06-03 00:00:00', '14663', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24612', '20170603109', '109', '33454', '22', '2017-06-03 00:00:00', '76936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24613', '20170603108', '108', '33453', '22', '2017-06-03 00:00:00', '57065', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24614', '20170603107', '107', '33452', '22', '2017-06-03 00:00:00', '66538', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24615', '20170603106', '106', '33451', '22', '2017-06-03 00:00:00', '85184', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24616', '20170603105', '105', '33450', '22', '2017-06-03 00:00:00', '51877', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24617', '20170603104', '104', '33449', '22', '2017-06-03 00:00:00', '31170', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24618', '20170603103', '103', '33448', '22', '2017-06-03 00:00:00', '17132', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24619', '20170603102', '102', '33447', '22', '2017-06-03 00:00:00', '60608', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24620', '20170603101', '101', '33446', '22', '2017-06-03 00:00:00', '11172', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24621', '20170603100', '100', '33445', '22', '2017-06-03 00:00:00', '10021', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24622', '2017060399', '99', '33444', '22', '2017-06-03 00:00:00', '35051', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24623', '2017060398', '98', '33443', '22', '2017-06-03 00:00:00', '84371', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24624', '2017060397', '97', '33442', '22', '2017-06-03 00:00:00', '19511', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24625', '2017060396', '96', '33441', '22', '2017-06-03 00:00:00', '24556', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24626', '2017060395', '95', '33440', '22', '2017-06-03 00:00:00', '72481', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24627', '2017060394', '94', '33439', '22', '2017-06-03 00:00:00', '74912', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24628', '2017060393', '93', '33438', '22', '2017-06-03 00:00:00', '96580', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24629', '2017060392', '92', '33437', '22', '2017-06-03 00:00:00', '60712', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24630', '2017060391', '91', '33436', '22', '2017-06-03 00:00:00', '36611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24631', '2017060390', '90', '33435', '22', '2017-06-03 00:00:00', '85668', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24632', '2017060389', '89', '33434', '22', '2017-06-03 00:00:00', '37067', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24633', '2017060388', '88', '33433', '22', '2017-06-03 00:00:00', '59427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24634', '2017060387', '87', '33432', '22', '2017-06-03 00:00:00', '59627', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24635', '2017060386', '86', '33431', '22', '2017-06-03 00:00:00', '35076', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24636', '2017060385', '85', '33430', '22', '2017-06-03 00:00:00', '40660', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24637', '2017060384', '84', '33429', '22', '2017-06-03 00:00:00', '96638', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24638', '2017060383', '83', '33428', '22', '2017-06-03 00:00:00', '48718', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24639', '2017060382', '82', '33427', '22', '2017-06-03 00:00:00', '66574', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24640', '2017060381', '81', '33426', '22', '2017-06-03 00:00:00', '82045', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24641', '2017060380', '80', '33425', '22', '2017-06-03 00:00:00', '23282', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24642', '2017060379', '79', '33424', '22', '2017-06-03 00:00:00', '46070', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24643', '2017060378', '78', '33423', '22', '2017-06-03 00:00:00', '98599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24644', '2017060377', '77', '33422', '22', '2017-06-03 00:00:00', '90911', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24645', '2017060376', '76', '33421', '22', '2017-06-03 00:00:00', '95297', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24646', '2017060375', '75', '33420', '22', '2017-06-03 00:00:00', '48872', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24647', '2017060374', '74', '33419', '22', '2017-06-03 00:00:00', '94589', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24648', '2017060373', '73', '33418', '22', '2017-06-03 00:00:00', '41945', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24649', '2017060372', '72', '33417', '22', '2017-06-03 00:00:00', '73621', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24650', '2017060371', '71', '33416', '22', '2017-06-03 00:00:00', '99310', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24651', '2017060370', '70', '33415', '22', '2017-06-03 00:00:00', '62981', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24652', '2017060369', '69', '33414', '22', '2017-06-03 00:00:00', '44834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24653', '2017060368', '68', '33413', '22', '2017-06-03 00:00:00', '34191', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24654', '2017060367', '67', '33412', '22', '2017-06-03 00:00:00', '14573', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24655', '2017060366', '66', '33411', '22', '2017-06-03 00:00:00', '57213', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24656', '2017060365', '65', '33410', '22', '2017-06-03 00:00:00', '74267', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24657', '2017060364', '64', '33409', '22', '2017-06-03 00:00:00', '97945', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24658', '2017060363', '63', '33408', '22', '2017-06-03 00:00:00', '16847', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24659', '2017060362', '62', '33407', '22', '2017-06-03 00:00:00', '85723', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24660', '2017060361', '61', '33406', '22', '2017-06-03 00:00:00', '59930', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24661', '2017060360', '60', '33405', '22', '2017-06-03 00:00:00', '70820', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24662', '2017060359', '59', '33404', '22', '2017-06-03 00:00:00', '13320', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24663', '2017060358', '58', '33403', '22', '2017-06-03 00:00:00', '21947', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24664', '2017060357', '57', '33402', '22', '2017-06-03 00:00:00', '66510', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24665', '2017060356', '56', '33401', '22', '2017-06-03 00:00:00', '73753', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24666', '2017060355', '55', '33400', '22', '2017-06-03 00:00:00', '46180', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24667', '2017060354', '54', '33399', '22', '2017-06-03 00:00:00', '54324', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24668', '2017060353', '53', '33398', '22', '2017-06-03 00:00:00', '23697', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24669', '2017060352', '52', '33397', '22', '2017-06-03 00:00:00', '92683', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24670', '2017060351', '51', '33396', '22', '2017-06-03 00:00:00', '22615', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24671', '2017060350', '50', '33395', '22', '2017-06-03 00:00:00', '56290', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24672', '2017060349', '49', '33394', '22', '2017-06-03 00:00:00', '86176', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24673', '2017060348', '48', '33393', '22', '2017-06-03 00:00:00', '68546', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24674', '2017060347', '47', '33392', '22', '2017-06-03 00:00:00', '74811', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24675', '2017060346', '46', '33391', '22', '2017-06-03 00:00:00', '36284', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24676', '2017060345', '45', '33390', '22', '2017-06-03 00:00:00', '93636', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24677', '2017060344', '44', '33389', '22', '2017-06-03 00:00:00', '77280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24678', '2017060343', '43', '33388', '22', '2017-06-03 00:00:00', '19956', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24679', '2017060342', '42', '33387', '22', '2017-06-03 00:00:00', '47743', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24680', '2017060341', '41', '33386', '22', '2017-06-03 00:00:00', '20763', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24681', '2017060340', '40', '33385', '22', '2017-06-03 00:00:00', '59822', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24682', '2017060339', '39', '33384', '22', '2017-06-03 00:00:00', '80238', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24683', '2017060338', '38', '33383', '22', '2017-06-03 00:00:00', '99104', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24684', '2017060337', '37', '33382', '22', '2017-06-03 00:00:00', '67247', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24685', '2017060336', '36', '33381', '22', '2017-06-03 00:00:00', '92111', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24686', '2017060335', '35', '33380', '22', '2017-06-03 00:00:00', '72844', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24687', '2017060334', '34', '33379', '22', '2017-06-03 00:00:00', '63805', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24688', '2017060333', '33', '33378', '22', '2017-06-03 00:00:00', '27773', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24689', '2017060332', '32', '33377', '22', '2017-06-03 00:00:00', '25084', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24690', '2017060331', '31', '33376', '22', '2017-06-03 00:00:00', '39962', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24691', '2017060330', '30', '33375', '22', '2017-06-03 00:00:00', '40283', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24692', '2017060329', '29', '33374', '22', '2017-06-03 00:00:00', '12029', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24693', '2017060328', '28', '33373', '22', '2017-06-03 00:00:00', '24677', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24694', '2017060327', '27', '33372', '22', '2017-06-03 00:00:00', '68779', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24695', '2017060326', '26', '33371', '22', '2017-06-03 00:00:00', '81976', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24696', '2017060325', '25', '33370', '22', '2017-06-03 00:00:00', '84704', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24697', '2017060324', '24', '33369', '22', '2017-06-03 00:00:00', '31829', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24698', '2017060323', '23', '33368', '22', '2017-06-03 00:00:00', '21483', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24699', '2017060322', '22', '33367', '22', '2017-06-03 00:00:00', '17322', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24700', '2017060321', '21', '33366', '22', '2017-06-03 00:00:00', '85484', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24701', '2017060320', '20', '33365', '22', '2017-06-03 00:00:00', '32478', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24702', '2017060319', '19', '33364', '22', '2017-06-03 00:00:00', '75261', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24703', '2017060318', '18', '33363', '22', '2017-06-03 00:00:00', '79757', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24704', '2017060317', '17', '33362', '22', '2017-06-03 00:00:00', '79057', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24705', '2017060316', '16', '33361', '22', '2017-06-03 00:00:00', '57559', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24706', '2017060315', '15', '33360', '22', '2017-06-03 00:00:00', '92301', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24707', '2017060314', '14', '33359', '22', '2017-06-03 00:00:00', '97720', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24708', '2017060313', '13', '33358', '22', '2017-06-03 00:00:00', '85110', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24709', '2017060312', '12', '33357', '22', '2017-06-03 00:00:00', '93012', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24710', '2017060311', '11', '33356', '22', '2017-06-03 00:00:00', '69790', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24711', '2017060310', '10', '33355', '22', '2017-06-03 00:00:00', '34647', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24712', '201706039', '9', '33354', '22', '2017-06-03 00:00:00', '78332', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24713', '201706038', '8', '33353', '22', '2017-06-03 00:00:00', '79774', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24714', '201706037', '7', '33352', '22', '2017-06-03 00:00:00', '49916', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24715', '201706036', '6', '33351', '22', '2017-06-03 00:00:00', '78977', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24716', '201706035', '5', '33350', '22', '2017-06-03 00:00:00', '78409', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24717', '201706034', '4', '33349', '22', '2017-06-03 00:00:00', '93781', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24718', '201706033', '3', '33348', '22', '2017-06-03 00:00:00', '29866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24719', '201706032', '2', '33347', '22', '2017-06-03 00:00:00', '14147', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24720', '201706031', '1', '33346', '22', '2017-06-03 00:00:00', '60028', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24721', '20170604120', '120', '33465', '22', '2017-06-04 00:00:00', '75972', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24722', '20170604119', '119', '33464', '22', '2017-06-04 00:00:00', '51827', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24723', '20170604118', '118', '33463', '22', '2017-06-04 00:00:00', '28594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24724', '20170604117', '117', '33462', '22', '2017-06-04 00:00:00', '42879', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24725', '20170604116', '116', '33461', '22', '2017-06-04 00:00:00', '12285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24726', '20170604115', '115', '33460', '22', '2017-06-04 00:00:00', '22988', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24727', '20170604114', '114', '33459', '22', '2017-06-04 00:00:00', '85756', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24728', '20170604113', '113', '33458', '22', '2017-06-04 00:00:00', '91647', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24729', '20170604112', '112', '33457', '22', '2017-06-04 00:00:00', '23656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24730', '20170604111', '111', '33456', '22', '2017-06-04 00:00:00', '75536', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24731', '20170604110', '110', '33455', '22', '2017-06-04 00:00:00', '14070', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24732', '20170604109', '109', '33454', '22', '2017-06-04 00:00:00', '46021', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24733', '20170604108', '108', '33453', '22', '2017-06-04 00:00:00', '96022', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24734', '20170604107', '107', '33452', '22', '2017-06-04 00:00:00', '26658', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24735', '20170604106', '106', '33451', '22', '2017-06-04 00:00:00', '46974', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24736', '20170604105', '105', '33450', '22', '2017-06-04 00:00:00', '60688', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24737', '20170604104', '104', '33449', '22', '2017-06-04 00:00:00', '80323', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24738', '20170604103', '103', '33448', '22', '2017-06-04 00:00:00', '98541', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24739', '20170604102', '102', '33447', '22', '2017-06-04 00:00:00', '12905', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24740', '20170604101', '101', '33446', '22', '2017-06-04 00:00:00', '65335', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24741', '20170604100', '100', '33445', '22', '2017-06-04 00:00:00', '52495', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24742', '2017060499', '99', '33444', '22', '2017-06-04 00:00:00', '18374', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24743', '2017060498', '98', '33443', '22', '2017-06-04 00:00:00', '55302', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24744', '2017060497', '97', '33442', '22', '2017-06-04 00:00:00', '34650', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24745', '2017060496', '96', '33441', '22', '2017-06-04 00:00:00', '43475', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24746', '2017060495', '95', '33440', '22', '2017-06-04 00:00:00', '98343', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24747', '2017060494', '94', '33439', '22', '2017-06-04 00:00:00', '92600', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24748', '2017060493', '93', '33438', '22', '2017-06-04 00:00:00', '78321', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24749', '2017060492', '92', '33437', '22', '2017-06-04 00:00:00', '39201', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24750', '2017060491', '91', '33436', '22', '2017-06-04 00:00:00', '65637', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24751', '2017060490', '90', '33435', '22', '2017-06-04 00:00:00', '88239', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24752', '2017060489', '89', '33434', '22', '2017-06-04 00:00:00', '81034', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24753', '2017060488', '88', '33433', '22', '2017-06-04 00:00:00', '70611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24754', '2017060487', '87', '33432', '22', '2017-06-04 00:00:00', '52442', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24755', '2017060486', '86', '33431', '22', '2017-06-04 00:00:00', '50654', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24756', '2017060485', '85', '33430', '22', '2017-06-04 00:00:00', '62478', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24757', '2017060484', '84', '33429', '22', '2017-06-04 00:00:00', '33642', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24758', '2017060483', '83', '33428', '22', '2017-06-04 00:00:00', '55947', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24759', '2017060482', '82', '33427', '22', '2017-06-04 00:00:00', '33285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24760', '2017060481', '81', '33426', '22', '2017-06-04 00:00:00', '87341', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24761', '2017060480', '80', '33425', '22', '2017-06-04 00:00:00', '49232', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24762', '2017060479', '79', '33424', '22', '2017-06-04 00:00:00', '28338', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24763', '2017060478', '78', '33423', '22', '2017-06-04 00:00:00', '44568', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24764', '2017060477', '77', '33422', '22', '2017-06-04 00:00:00', '85308', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24765', '2017060476', '76', '33421', '22', '2017-06-04 00:00:00', '13317', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24766', '2017060475', '75', '33420', '22', '2017-06-04 00:00:00', '56804', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24767', '2017060474', '74', '33419', '22', '2017-06-04 00:00:00', '47941', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24768', '2017060473', '73', '33418', '22', '2017-06-04 00:00:00', '31069', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24769', '2017060472', '72', '33417', '22', '2017-06-04 00:00:00', '46837', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24770', '2017060471', '71', '33416', '22', '2017-06-04 00:00:00', '93531', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24771', '2017060470', '70', '33415', '22', '2017-06-04 00:00:00', '51841', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24772', '2017060469', '69', '33414', '22', '2017-06-04 00:00:00', '34309', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24773', '2017060468', '68', '33413', '22', '2017-06-04 00:00:00', '45727', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24774', '2017060467', '67', '33412', '22', '2017-06-04 00:00:00', '45708', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24775', '2017060466', '66', '33411', '22', '2017-06-04 00:00:00', '19706', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24776', '2017060465', '65', '33410', '22', '2017-06-04 00:00:00', '69718', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24777', '2017060464', '64', '33409', '22', '2017-06-04 00:00:00', '40926', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24778', '2017060463', '63', '33408', '22', '2017-06-04 00:00:00', '45521', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24779', '2017060462', '62', '33407', '22', '2017-06-04 00:00:00', '49973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24780', '2017060461', '61', '33406', '22', '2017-06-04 00:00:00', '66983', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24781', '2017060460', '60', '33405', '22', '2017-06-04 00:00:00', '18371', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24782', '2017060459', '59', '33404', '22', '2017-06-04 00:00:00', '90158', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24783', '2017060458', '58', '33403', '22', '2017-06-04 00:00:00', '16080', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24784', '2017060457', '57', '33402', '22', '2017-06-04 00:00:00', '90790', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24785', '2017060456', '56', '33401', '22', '2017-06-04 00:00:00', '99000', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24786', '2017060455', '55', '33400', '22', '2017-06-04 00:00:00', '41808', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24787', '2017060454', '54', '33399', '22', '2017-06-04 00:00:00', '16465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24788', '2017060453', '53', '33398', '22', '2017-06-04 00:00:00', '70828', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24789', '2017060452', '52', '33397', '22', '2017-06-04 00:00:00', '88750', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24790', '2017060451', '51', '33396', '22', '2017-06-04 00:00:00', '77656', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24791', '2017060450', '50', '33395', '22', '2017-06-04 00:00:00', '14564', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24792', '2017060449', '49', '33394', '22', '2017-06-04 00:00:00', '71784', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24793', '2017060448', '48', '33393', '22', '2017-06-04 00:00:00', '18558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24794', '2017060447', '47', '33392', '22', '2017-06-04 00:00:00', '59891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24795', '2017060446', '46', '33391', '22', '2017-06-04 00:00:00', '18816', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24796', '2017060445', '45', '33390', '22', '2017-06-04 00:00:00', '23345', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24797', '2017060444', '44', '33389', '22', '2017-06-04 00:00:00', '54362', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24798', '2017060443', '43', '33388', '22', '2017-06-04 00:00:00', '75700', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24799', '2017060442', '42', '33387', '22', '2017-06-04 00:00:00', '82658', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24800', '2017060441', '41', '33386', '22', '2017-06-04 00:00:00', '80199', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24801', '2017060440', '40', '33385', '22', '2017-06-04 00:00:00', '47100', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24802', '2017060439', '39', '33384', '22', '2017-06-04 00:00:00', '77272', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24803', '2017060438', '38', '33383', '22', '2017-06-04 00:00:00', '34526', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24804', '2017060437', '37', '33382', '22', '2017-06-04 00:00:00', '82034', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24805', '2017060436', '36', '33381', '22', '2017-06-04 00:00:00', '72709', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24806', '2017060435', '35', '33380', '22', '2017-06-04 00:00:00', '61792', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24807', '2017060434', '34', '33379', '22', '2017-06-04 00:00:00', '17860', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24808', '2017060433', '33', '33378', '22', '2017-06-04 00:00:00', '93537', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24809', '2017060432', '32', '33377', '22', '2017-06-04 00:00:00', '72127', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24810', '2017060431', '31', '33376', '22', '2017-06-04 00:00:00', '71449', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24811', '2017060430', '30', '33375', '22', '2017-06-04 00:00:00', '41096', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24812', '2017060429', '29', '33374', '22', '2017-06-04 00:00:00', '44395', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24813', '2017060428', '28', '33373', '22', '2017-06-04 00:00:00', '31291', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24814', '2017060427', '27', '33372', '22', '2017-06-04 00:00:00', '13430', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24815', '2017060426', '26', '33371', '22', '2017-06-04 00:00:00', '67672', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24816', '2017060425', '25', '33370', '22', '2017-06-04 00:00:00', '89296', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24817', '2017060424', '24', '33369', '22', '2017-06-04 00:00:00', '71138', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24818', '2017060423', '23', '33368', '22', '2017-06-04 00:00:00', '19923', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24819', '2017060422', '22', '33367', '22', '2017-06-04 00:00:00', '16026', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24820', '2017060421', '21', '33366', '22', '2017-06-04 00:00:00', '67928', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24821', '2017060420', '20', '33365', '22', '2017-06-04 00:00:00', '87607', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24822', '2017060419', '19', '33364', '22', '2017-06-04 00:00:00', '88115', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24823', '2017060418', '18', '33363', '22', '2017-06-04 00:00:00', '29594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24824', '2017060417', '17', '33362', '22', '2017-06-04 00:00:00', '44977', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24825', '2017060416', '16', '33361', '22', '2017-06-04 00:00:00', '21634', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24826', '2017060415', '15', '33360', '22', '2017-06-04 00:00:00', '80194', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24827', '2017060414', '14', '33359', '22', '2017-06-04 00:00:00', '26814', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24828', '2017060413', '13', '33358', '22', '2017-06-04 00:00:00', '40132', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24829', '2017060412', '12', '33357', '22', '2017-06-04 00:00:00', '39157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24830', '2017060411', '11', '33356', '22', '2017-06-04 00:00:00', '83347', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24831', '2017060410', '10', '33355', '22', '2017-06-04 00:00:00', '61124', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24832', '201706049', '9', '33354', '22', '2017-06-04 00:00:00', '28080', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24833', '201706048', '8', '33353', '22', '2017-06-04 00:00:00', '81114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24834', '201706047', '7', '33352', '22', '2017-06-04 00:00:00', '49762', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24835', '201706046', '6', '33351', '22', '2017-06-04 00:00:00', '50962', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24836', '201706045', '5', '33350', '22', '2017-06-04 00:00:00', '28509', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24837', '201706044', '4', '33349', '22', '2017-06-04 00:00:00', '43442', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24838', '201706043', '3', '33348', '22', '2017-06-04 00:00:00', '66626', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24839', '201706042', '2', '33347', '22', '2017-06-04 00:00:00', '49765', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `autumn_lottery_data` VALUES ('24840', '201706041', '1', '33346', '22', '2017-06-04 00:00:00', '16105', '0', null, '0', '0', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=33466 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_time
-- ----------------------------
INSERT INTO `autumn_lottery_time` VALUES ('33346', '1', '22', '00:04', '240');
INSERT INTO `autumn_lottery_time` VALUES ('33347', '2', '22', '00:09', '540');
INSERT INTO `autumn_lottery_time` VALUES ('33348', '3', '22', '00:14', '840');
INSERT INTO `autumn_lottery_time` VALUES ('33349', '4', '22', '00:19', '1140');
INSERT INTO `autumn_lottery_time` VALUES ('33350', '5', '22', '00:24', '1440');
INSERT INTO `autumn_lottery_time` VALUES ('33351', '6', '22', '00:29', '1740');
INSERT INTO `autumn_lottery_time` VALUES ('33352', '7', '22', '00:34', '2040');
INSERT INTO `autumn_lottery_time` VALUES ('33353', '8', '22', '00:39', '2340');
INSERT INTO `autumn_lottery_time` VALUES ('33354', '9', '22', '00:44', '2640');
INSERT INTO `autumn_lottery_time` VALUES ('33355', '10', '22', '00:49', '2940');
INSERT INTO `autumn_lottery_time` VALUES ('33356', '11', '22', '00:54', '3240');
INSERT INTO `autumn_lottery_time` VALUES ('33357', '12', '22', '00:59', '3540');
INSERT INTO `autumn_lottery_time` VALUES ('33358', '13', '22', '01:04', '3840');
INSERT INTO `autumn_lottery_time` VALUES ('33359', '14', '22', '01:09', '4140');
INSERT INTO `autumn_lottery_time` VALUES ('33360', '15', '22', '01:14', '4440');
INSERT INTO `autumn_lottery_time` VALUES ('33361', '16', '22', '01:19', '4740');
INSERT INTO `autumn_lottery_time` VALUES ('33362', '17', '22', '01:24', '5040');
INSERT INTO `autumn_lottery_time` VALUES ('33363', '18', '22', '01:29', '5340');
INSERT INTO `autumn_lottery_time` VALUES ('33364', '19', '22', '01:34', '5640');
INSERT INTO `autumn_lottery_time` VALUES ('33365', '20', '22', '01:39', '5940');
INSERT INTO `autumn_lottery_time` VALUES ('33366', '21', '22', '01:44', '6240');
INSERT INTO `autumn_lottery_time` VALUES ('33367', '22', '22', '01:49', '6540');
INSERT INTO `autumn_lottery_time` VALUES ('33368', '23', '22', '01:54', '6840');
INSERT INTO `autumn_lottery_time` VALUES ('33369', '24', '22', '09:59', '35940');
INSERT INTO `autumn_lottery_time` VALUES ('33370', '25', '22', '10:09', '36540');
INSERT INTO `autumn_lottery_time` VALUES ('33371', '26', '22', '10:19', '37140');
INSERT INTO `autumn_lottery_time` VALUES ('33372', '27', '22', '10:29', '37740');
INSERT INTO `autumn_lottery_time` VALUES ('33373', '28', '22', '10:39', '38340');
INSERT INTO `autumn_lottery_time` VALUES ('33374', '29', '22', '10:49', '38940');
INSERT INTO `autumn_lottery_time` VALUES ('33375', '30', '22', '10:59', '39540');
INSERT INTO `autumn_lottery_time` VALUES ('33376', '31', '22', '11:09', '40140');
INSERT INTO `autumn_lottery_time` VALUES ('33377', '32', '22', '11:19', '40740');
INSERT INTO `autumn_lottery_time` VALUES ('33378', '33', '22', '11:29', '41340');
INSERT INTO `autumn_lottery_time` VALUES ('33379', '34', '22', '11:39', '41940');
INSERT INTO `autumn_lottery_time` VALUES ('33380', '35', '22', '11:49', '42540');
INSERT INTO `autumn_lottery_time` VALUES ('33381', '36', '22', '11:59', '43140');
INSERT INTO `autumn_lottery_time` VALUES ('33382', '37', '22', '12:09', '43740');
INSERT INTO `autumn_lottery_time` VALUES ('33383', '38', '22', '12:19', '44340');
INSERT INTO `autumn_lottery_time` VALUES ('33384', '39', '22', '12:29', '44940');
INSERT INTO `autumn_lottery_time` VALUES ('33385', '40', '22', '12:39', '45540');
INSERT INTO `autumn_lottery_time` VALUES ('33386', '41', '22', '12:49', '46140');
INSERT INTO `autumn_lottery_time` VALUES ('33387', '42', '22', '12:59', '46740');
INSERT INTO `autumn_lottery_time` VALUES ('33388', '43', '22', '13:09', '47340');
INSERT INTO `autumn_lottery_time` VALUES ('33389', '44', '22', '13:19', '47940');
INSERT INTO `autumn_lottery_time` VALUES ('33390', '45', '22', '13:29', '48540');
INSERT INTO `autumn_lottery_time` VALUES ('33391', '46', '22', '13:39', '49140');
INSERT INTO `autumn_lottery_time` VALUES ('33392', '47', '22', '13:49', '49740');
INSERT INTO `autumn_lottery_time` VALUES ('33393', '48', '22', '13:59', '50340');
INSERT INTO `autumn_lottery_time` VALUES ('33394', '49', '22', '14:09', '50940');
INSERT INTO `autumn_lottery_time` VALUES ('33395', '50', '22', '14:19', '51540');
INSERT INTO `autumn_lottery_time` VALUES ('33396', '51', '22', '14:29', '52140');
INSERT INTO `autumn_lottery_time` VALUES ('33397', '52', '22', '14:39', '52740');
INSERT INTO `autumn_lottery_time` VALUES ('33398', '53', '22', '14:49', '53340');
INSERT INTO `autumn_lottery_time` VALUES ('33399', '54', '22', '14:59', '53940');
INSERT INTO `autumn_lottery_time` VALUES ('33400', '55', '22', '15:09', '54540');
INSERT INTO `autumn_lottery_time` VALUES ('33401', '56', '22', '15:19', '55140');
INSERT INTO `autumn_lottery_time` VALUES ('33402', '57', '22', '15:29', '55740');
INSERT INTO `autumn_lottery_time` VALUES ('33403', '58', '22', '15:39', '56340');
INSERT INTO `autumn_lottery_time` VALUES ('33404', '59', '22', '15:49', '56940');
INSERT INTO `autumn_lottery_time` VALUES ('33405', '60', '22', '15:59', '57540');
INSERT INTO `autumn_lottery_time` VALUES ('33406', '61', '22', '16:09', '58140');
INSERT INTO `autumn_lottery_time` VALUES ('33407', '62', '22', '16:19', '58740');
INSERT INTO `autumn_lottery_time` VALUES ('33408', '63', '22', '16:29', '59340');
INSERT INTO `autumn_lottery_time` VALUES ('33409', '64', '22', '16:39', '59940');
INSERT INTO `autumn_lottery_time` VALUES ('33410', '65', '22', '16:49', '60540');
INSERT INTO `autumn_lottery_time` VALUES ('33411', '66', '22', '16:59', '61140');
INSERT INTO `autumn_lottery_time` VALUES ('33412', '67', '22', '17:09', '61740');
INSERT INTO `autumn_lottery_time` VALUES ('33413', '68', '22', '17:19', '62340');
INSERT INTO `autumn_lottery_time` VALUES ('33414', '69', '22', '17:29', '62940');
INSERT INTO `autumn_lottery_time` VALUES ('33415', '70', '22', '17:39', '63540');
INSERT INTO `autumn_lottery_time` VALUES ('33416', '71', '22', '17:49', '64140');
INSERT INTO `autumn_lottery_time` VALUES ('33417', '72', '22', '17:59', '64740');
INSERT INTO `autumn_lottery_time` VALUES ('33418', '73', '22', '18:09', '65340');
INSERT INTO `autumn_lottery_time` VALUES ('33419', '74', '22', '18:19', '65940');
INSERT INTO `autumn_lottery_time` VALUES ('33420', '75', '22', '18:29', '66540');
INSERT INTO `autumn_lottery_time` VALUES ('33421', '76', '22', '18:39', '67140');
INSERT INTO `autumn_lottery_time` VALUES ('33422', '77', '22', '18:49', '67740');
INSERT INTO `autumn_lottery_time` VALUES ('33423', '78', '22', '18:59', '68340');
INSERT INTO `autumn_lottery_time` VALUES ('33424', '79', '22', '19:09', '68940');
INSERT INTO `autumn_lottery_time` VALUES ('33425', '80', '22', '19:19', '69540');
INSERT INTO `autumn_lottery_time` VALUES ('33426', '81', '22', '19:29', '70140');
INSERT INTO `autumn_lottery_time` VALUES ('33427', '82', '22', '19:39', '70740');
INSERT INTO `autumn_lottery_time` VALUES ('33428', '83', '22', '19:49', '71340');
INSERT INTO `autumn_lottery_time` VALUES ('33429', '84', '22', '19:59', '71940');
INSERT INTO `autumn_lottery_time` VALUES ('33430', '85', '22', '20:09', '72540');
INSERT INTO `autumn_lottery_time` VALUES ('33431', '86', '22', '20:19', '73140');
INSERT INTO `autumn_lottery_time` VALUES ('33432', '87', '22', '20:29', '73740');
INSERT INTO `autumn_lottery_time` VALUES ('33433', '88', '22', '20:39', '74340');
INSERT INTO `autumn_lottery_time` VALUES ('33434', '89', '22', '20:49', '74940');
INSERT INTO `autumn_lottery_time` VALUES ('33435', '90', '22', '20:59', '75540');
INSERT INTO `autumn_lottery_time` VALUES ('33436', '91', '22', '21:09', '76140');
INSERT INTO `autumn_lottery_time` VALUES ('33437', '92', '22', '21:19', '76740');
INSERT INTO `autumn_lottery_time` VALUES ('33438', '93', '22', '21:29', '77340');
INSERT INTO `autumn_lottery_time` VALUES ('33439', '94', '22', '21:39', '77940');
INSERT INTO `autumn_lottery_time` VALUES ('33440', '95', '22', '21:49', '78540');
INSERT INTO `autumn_lottery_time` VALUES ('33441', '96', '22', '21:59', '79140');
INSERT INTO `autumn_lottery_time` VALUES ('33442', '97', '22', '22:04', '79440');
INSERT INTO `autumn_lottery_time` VALUES ('33443', '98', '22', '22:09', '79740');
INSERT INTO `autumn_lottery_time` VALUES ('33444', '99', '22', '22:14', '80040');
INSERT INTO `autumn_lottery_time` VALUES ('33445', '100', '22', '22:19', '80340');
INSERT INTO `autumn_lottery_time` VALUES ('33446', '101', '22', '22:24', '80640');
INSERT INTO `autumn_lottery_time` VALUES ('33447', '102', '22', '22:29', '80940');
INSERT INTO `autumn_lottery_time` VALUES ('33448', '103', '22', '22:34', '81240');
INSERT INTO `autumn_lottery_time` VALUES ('33449', '104', '22', '22:39', '81540');
INSERT INTO `autumn_lottery_time` VALUES ('33450', '105', '22', '22:44', '81840');
INSERT INTO `autumn_lottery_time` VALUES ('33451', '106', '22', '22:49', '82140');
INSERT INTO `autumn_lottery_time` VALUES ('33452', '107', '22', '22:54', '82440');
INSERT INTO `autumn_lottery_time` VALUES ('33453', '108', '22', '22:59', '82740');
INSERT INTO `autumn_lottery_time` VALUES ('33454', '109', '22', '23:04', '83040');
INSERT INTO `autumn_lottery_time` VALUES ('33455', '110', '22', '23:09', '83340');
INSERT INTO `autumn_lottery_time` VALUES ('33456', '111', '22', '23:14', '83640');
INSERT INTO `autumn_lottery_time` VALUES ('33457', '112', '22', '23:19', '83940');
INSERT INTO `autumn_lottery_time` VALUES ('33458', '113', '22', '23:24', '84240');
INSERT INTO `autumn_lottery_time` VALUES ('33459', '114', '22', '23:29', '84540');
INSERT INTO `autumn_lottery_time` VALUES ('33460', '115', '22', '23:34', '84840');
INSERT INTO `autumn_lottery_time` VALUES ('33461', '116', '22', '23:39', '85140');
INSERT INTO `autumn_lottery_time` VALUES ('33462', '117', '22', '23:44', '85440');
INSERT INTO `autumn_lottery_time` VALUES ('33463', '118', '22', '23:49', '85740');
INSERT INTO `autumn_lottery_time` VALUES ('33464', '119', '22', '23:54', '86040');
INSERT INTO `autumn_lottery_time` VALUES ('33465', '120', '22', '23:59', '86340');

-- ----------------------------
-- Table structure for autumn_message
-- ----------------------------
DROP TABLE IF EXISTS `autumn_message`;
CREATE TABLE `autumn_message` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_message
-- ----------------------------

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
