/*
Navicat MySQL Data Transfer

Source Server         : localhost_3300
Source Server Version : 50505
Source Host           : localhost:3300
Source Database       : autumn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-16 01:09:06
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
INSERT INTO `autumn_admin_user` VALUES ('1', '超级管理员', '', 'admin123456', 'ae2f4f5052e0096ca325861f1c6b510e', '818038', '0', '1497456449', '127.168.0.1', '1497544910', '127.168.0.1', '', '1', '0');

-- ----------------------------
-- Table structure for autumn_betting
-- ----------------------------
DROP TABLE IF EXISTS `autumn_betting`;
CREATE TABLE `autumn_betting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `day` date NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `byid` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `from_lottery` int(11) NOT NULL,
  `from_game_rule` int(11) DEFAULT NULL,
  `from_lottery_time_id` int(11) DEFAULT NULL,
  `multiple` int(11) DEFAULT NULL,
  `notes` int(11) DEFAULT NULL,
  `pattern` int(11) DEFAULT NULL,
  `number` varchar(300) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `winning_money` double DEFAULT NULL,
  `rebate_money` double DEFAULT NULL,
  `state` int(11) NOT NULL,
  `revoke` int(11) DEFAULT '0',
  `pattern_money` double DEFAULT NULL,
  `winning_state` int(11) NOT NULL,
  `sendprize_state` int(11) NOT NULL,
  PRIMARY KEY (`id`,`uid`,`day`,`byid`,`state`,`winning_state`,`sendprize_state`,`from_lottery`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_betting
-- ----------------------------
INSERT INTO `autumn_betting` VALUES ('8', '1', '0000-00-00', 'O20170531623278', '2017053150', '2017-05-31 14:09:08', '22', '81', '33395', '1', '50', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '100', null, null, '0', '1', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('9', '4', '2017-06-13', 'O20170612678210', '201706127', '2017-06-12 00:31:11', '22', '95', '33352', '1', '1', '0', '[[\"9\"],[\"8\"],[\"1\"]]', '2', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('10', '4', '0000-00-00', 'O20170612970254', '201706127', '2017-06-12 00:31:11', '22', '95', '33352', '1', '1', '0', '[[\"6\"],[\"7\"],[\"6\"]]', '2', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('11', '4', '0000-00-00', 'O20170612838995', '201706127', '2017-06-12 00:31:11', '22', '95', '33352', '1', '1', '0', '[[\"7\"],[\"6\"],[\"8\"]]', '2', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('12', '4', '0000-00-00', 'O20170612748934', '201706127', '2017-06-12 00:31:11', '22', '95', '33352', '1', '1', '0', '[[\"4\"],[\"7\"],[\"5\"]]', '2', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('13', '4', '0000-00-00', 'O20170612705786', '201706127', '2017-06-12 00:31:11', '22', '95', '33352', '1', '1', '0', '[[\"8\"],[\"1\"],[\"8\"]]', '2', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('14', '4', '0000-00-00', 'O20170612852728', '201706128', '2017-06-12 00:38:56', '22', '95', '33353', '1', '3', '0', '[[\"4\"],[\"4\"],[\"4\"]]', '0.006', null, null, '0', '1', '0.002', '0', '0');
INSERT INTO `autumn_betting` VALUES ('15', '4', '0000-00-00', 'O20170612164572', '201706128', '2017-06-12 00:38:56', '22', '95', '33353', '3', '15', '0', '[[\"1\",\"3\",\"5\",\"7\",\"9\"],[\"0\",\"2\",\"4\",\"6\",\"8\"],[\"1\",\"3\",\"5\",\"7\",\"9\"]]', '90', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('16', '4', '0000-00-00', 'O20170613635528', '2017061330', '2017-06-13 10:56:26', '22', '95', '33375', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '60', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('17', '4', '0000-00-00', 'O20170613971600', '2017061332', '2017-06-13 11:12:23', '22', '95', '33377', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '60', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('18', '4', '2017-06-13', 'O20170613448953', '2017061351', '2017-06-13 14:24:43', '22', '95', '33396', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '60', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('19', '4', '2017-06-13', 'O20170613954901', '2017061353', '2017-06-13 14:39:03', '22', '95', '33398', '1', '15', '0', '[[\"0\",\"2\",\"4\",\"6\",\"8\"],[\"0\",\"2\",\"4\",\"6\",\"8\"],[\"5\",\"6\",\"7\",\"8\",\"9\"]]', '30', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('20', '4', '2017-06-13', 'O20170613388912', '2017061353', '2017-06-13 14:39:03', '22', '95', '33398', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '60', null, null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('21', '4', '2017-06-13', 'O20170613444641', '2017061364', '2017-06-13 16:29:59', '22', '95', '33409', '1', '3', '0', '[[\"0\"],[\"2\"],[\"2\"]]', '6', '0', null, '0', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('22', '4', '2017-06-13', 'O20170613928231', '2017061364', '2017-06-13 16:30:38', '22', '95', '33409', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '60', '297', null, '0', '0', '2', '1', '0');
INSERT INTO `autumn_betting` VALUES ('23', '4', '2017-06-13', 'O20170613598696', '2017061364', '2017-06-13 16:30:58', '22', '95', '33409', '1', '10', '0', '[[\"4\",\"5\",\"6\",\"7\"],[\"5\",\"6\",\"7\"],[\"5\",\"6\",\"7\"]]', '20', '297', null, '0', '0', '2', '1', '0');
INSERT INTO `autumn_betting` VALUES ('24', '4', '2017-06-13', 'O20170613276715', '2017061364', '2017-06-13 16:30:58', '22', '95', '33409', '1', '10', '0', '[[\"2\",\"3\"],[\"2\",\"3\"],[\"3\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '20', '99', null, '0', '0', '2', '1', '0');
INSERT INTO `autumn_betting` VALUES ('25', '4', '2017-06-14', 'O20170614985470', '2017061424', '2017-06-14 09:47:07', '22', '95', '33369', '1', '3', '0', '[[\"0\"],[\"0\"],[\"0\"]]', '6', '0', null, '2', '0', '2', '0', '0');
INSERT INTO `autumn_betting` VALUES ('26', '4', '2017-06-14', 'O20170614765496', '2017061428', '2017-06-14 10:34:19', '22', '95', '33373', '1', '30', '0', '[[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]]', '0.06', '0.297', null, '1', '0', '0.002', '1', '0');

-- ----------------------------
-- Table structure for autumn_card
-- ----------------------------
DROP TABLE IF EXISTS `autumn_card`;
CREATE TABLE `autumn_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bankname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `account` varchar(200) NOT NULL,
  `branch` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ownerName` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_card
-- ----------------------------
INSERT INTO `autumn_card` VALUES ('2', '4', '312321', '321', '312', '321', '', null, '0');

-- ----------------------------
-- Table structure for autumn_collection
-- ----------------------------
DROP TABLE IF EXISTS `autumn_collection`;
CREATE TABLE `autumn_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_pay_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `pay_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `money` varchar(18) COLLATE utf8_bin NOT NULL,
  `qrocde_file_url` varchar(200) COLLATE utf8_bin NOT NULL,
  `branch` int(11) DEFAULT NULL,
  `card_opening` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `card_name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `card_from` varchar(125) COLLATE utf8_bin DEFAULT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_collection
-- ----------------------------
INSERT INTO `autumn_collection` VALUES ('2', '123', 'alipay', '1000.01', '4a0d207794372c228e6067624354a061.jpg', null, null, null, null, '1493051352');
INSERT INTO `autumn_collection` VALUES ('3', '321321', 'alipay', '1000.02', '7842e0940ed01c20ef7174e08924894b.jpg', null, null, null, null, '1497149243');
INSERT INTO `autumn_collection` VALUES ('5', '测试', 'wxpay', '1000.01', 'bcee0344ee26e645c83d23ae7c9b3d38.jpg', '0', null, null, null, '1497149820');

-- ----------------------------
-- Table structure for autumn_config
-- ----------------------------
DROP TABLE IF EXISTS `autumn_config`;
CREATE TABLE `autumn_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_config
-- ----------------------------
INSERT INTO `autumn_config` VALUES ('1', 'withdrawalUpMoney', '20000');
INSERT INTO `autumn_config` VALUES ('2', 'withdrawalLostMoney', '100');
INSERT INTO `autumn_config` VALUES ('3', 'withdrawalStartTime', '00:00');
INSERT INTO `autumn_config` VALUES ('4', 'withdrawalEndTime', '24:00');
INSERT INTO `autumn_config` VALUES ('5', 'withdrawalMaxCount', '10');
INSERT INTO `autumn_config` VALUES ('6', 'out_time', '10');
INSERT INTO `autumn_config` VALUES ('8', 'wxpay', '0');
INSERT INTO `autumn_config` VALUES ('9', 'alipay', '0');
INSERT INTO `autumn_config` VALUES ('19', 'recharge', '30,50,100,200,500,1000');
INSERT INTO `autumn_config` VALUES ('22', 'customerServiceLink', 'http://www.baidu.com/');
INSERT INTO `autumn_config` VALUES ('23', 'initializeRebate', '5');
INSERT INTO `autumn_config` VALUES ('24', 'oddsSetting', '99');

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
INSERT INTO `autumn_detail` VALUES ('1', '1', 'L2017052345156', '20', '57', '100', '1', '-100', '100', '0', '2017-05-23 00:36:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_game_rule
-- ----------------------------
INSERT INTO `autumn_game_rule` VALUES ('51', null, '五星', null, null, null, null, '50', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-19 12:09:07');
INSERT INTO `autumn_game_rule` VALUES ('53', null, '三星', null, null, null, null, '50', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-19 12:09:20');
INSERT INTO `autumn_game_rule` VALUES ('55', 'shishicai', '时时彩', '5', null, null, null, null, '0', '0', '0', '0', '0', null, '万,千,百,十,个', null, '0,9', '0', '2017-05-20 03:06:51');
INSERT INTO `autumn_game_rule` VALUES ('56', null, '五星', null, null, null, null, '55', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-05-20 03:07:00');
INSERT INTO `autumn_game_rule` VALUES ('57', 'five_stars', '直选复式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '直选复式', '直选复式', '56', '2', '1', '199000', '170000', '75000', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-06-04 02:31:31');
INSERT INTO `autumn_game_rule` VALUES ('58', 'five_star', '直选单式', null, '1=a&&2=b&&3=c&&4=d&&5=e', '五星', '五星', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-05-27 09:27:50');
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
INSERT INTO `autumn_game_rule` VALUES ('82', '五星_五星组合', '五星组合', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '从万位、千位、百位、十位、个位中至少各选一个号码组成1-5星的组合，共五注，所选号码的个位与开奖号码全部相同，则中1个5等奖；所选号码的个位、十位与开奖号码相同，则中1个5等奖以及1个4等奖，依此类推，最高可中5个奖。', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', null, '0', '2017-06-04 02:50:41');
INSERT INTO `autumn_game_rule` VALUES ('83', '组选120', '组选120', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('84', '组选60', '组选60', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('85', '组选30', '组选30', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('86', '组选20', '组选20', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('87', '组选10', '组选10', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('88', '组选5', '组选5', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('89', '一帆风顺', '一帆风顺', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('90', '好事成双', '好事成双', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('91', '三星报喜', '三星报喜', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('92', '四季发财', '四季发财', null, '1=a&&2=b&&3=c&&4=d&&5=e', '从万位、千位、百位、十位、个位各选一个号码组成五注。', '五星组合', '56', '2', '0', '0', '0', '0', '0,1,2,3,4,5,6,7,8,9', '万位,千位,百位,十位,个位', '全,大,小,奇,偶,清', '', '0', '2017-06-04 02:42:24');
INSERT INTO `autumn_game_rule` VALUES ('93', 'shishicai', '澳门3D', '3', null, null, null, null, '0', '0', '0', '0', '0', null, null, null, '0,1,2,3,4,5,6,7,8,9', '0', '2017-06-11 11:15:01');
INSERT INTO `autumn_game_rule` VALUES ('94', null, '定位胆', null, null, null, null, '93', '1', '0', '0', '0', '0', null, null, null, null, '0', '2017-06-11 08:06:00');
INSERT INTO `autumn_game_rule` VALUES ('95', 'five_location', '五星定位胆', null, '1=a||2=b||3=c', '五星定位胆', 'five_location', '94', '2', '0', '99', '0', '0', '0,1,2,3,4,5,6,7,8,9', '第一球,第二球,第三球', '全,单,双,大,小,清', null, '0', '2017-06-12 12:33:13');

-- ----------------------------
-- Table structure for autumn_letter
-- ----------------------------
DROP TABLE IF EXISTS `autumn_letter`;
CREATE TABLE `autumn_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_letter
-- ----------------------------
INSERT INTO `autumn_letter` VALUES ('1', '312321', '21321321', '2017-06-12 01:26:35', '-1', null, null);
INSERT INTO `autumn_letter` VALUES ('2', '312', '123', '2017-06-12 14:57:35', '-1', null, null);
INSERT INTO `autumn_letter` VALUES ('4', '测试', '测试', '2017-06-12 15:01:38', '-1', null, '0');
INSERT INTO `autumn_letter` VALUES ('5', '您已成功消费60元购置彩票', null, '2017-06-13 11:12:23', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('6', '您已成功消费60元购置彩票', null, '2017-06-13 14:24:43', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('7', '您已成功消费90元购置彩票', null, '2017-06-13 14:39:03', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('8', '您已成功消费6元购置彩票', null, '2017-06-13 16:29:59', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('9', '您已成功消费60元购置彩票', null, '2017-06-13 16:30:38', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('10', '您已成功消费40元购置彩票', null, '2017-06-13 16:30:58', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('11', '您已成功消费6元购置彩票', null, '2017-06-14 09:47:07', '4', '1', '0');
INSERT INTO `autumn_letter` VALUES ('12', '您已成功消费0.06元购置彩票', null, '2017-06-14 10:34:19', '4', '1', '0');

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
  `inter_day_periods` varchar(2048) DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery
-- ----------------------------
INSERT INTO `autumn_lottery` VALUES ('22', '澳门3D', '93', '120', '3', '0', '120', '[]');

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
  `manual_lottery` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`from_time_id`,`from_lottery`)
) ENGINE=InnoDB AUTO_INCREMENT=31561 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_lottery_data
-- ----------------------------
INSERT INTO `autumn_lottery_data` VALUES ('30721', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '586', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `autumn_lottery_data` VALUES ('30722', '20170615119', '119', '33464', '22', '2017-06-15 00:00:00', '603', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30723', '20170615118', '118', '33463', '22', '2017-06-15 00:00:00', '940', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30724', '20170615117', '117', '33462', '22', '2017-06-15 00:00:00', '516', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30725', '20170615116', '116', '33461', '22', '2017-06-15 00:00:00', '968', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30726', '20170615115', '115', '33460', '22', '2017-06-15 00:00:00', '501', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30727', '20170615114', '114', '33459', '22', '2017-06-15 00:00:00', '221', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30728', '20170615113', '113', '33458', '22', '2017-06-15 00:00:00', '768', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30729', '20170615112', '112', '33457', '22', '2017-06-15 00:00:00', '607', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30730', '20170615111', '111', '33456', '22', '2017-06-15 00:00:00', '594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30731', '20170615110', '110', '33455', '22', '2017-06-15 00:00:00', '970', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30732', '20170615109', '109', '33454', '22', '2017-06-15 00:00:00', '807', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30733', '20170615108', '108', '33453', '22', '2017-06-15 00:00:00', '462', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30734', '20170615107', '107', '33452', '22', '2017-06-15 00:00:00', '854', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30735', '20170615106', '106', '33451', '22', '2017-06-15 00:00:00', '121', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30736', '20170615105', '105', '33450', '22', '2017-06-15 00:00:00', '381', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30737', '20170615104', '104', '33449', '22', '2017-06-15 00:00:00', '843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30738', '20170615103', '103', '33448', '22', '2017-06-15 00:00:00', '803', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30739', '20170615102', '102', '33447', '22', '2017-06-15 00:00:00', '459', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30740', '20170615101', '101', '33446', '22', '2017-06-15 00:00:00', '585', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30741', '20170615100', '100', '33445', '22', '2017-06-15 00:00:00', '709', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30742', '2017061599', '99', '33444', '22', '2017-06-15 00:00:00', '413', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30743', '2017061598', '98', '33443', '22', '2017-06-15 00:00:00', '718', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30744', '2017061597', '97', '33442', '22', '2017-06-15 00:00:00', '268', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30745', '2017061596', '96', '33441', '22', '2017-06-15 00:00:00', '369', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30746', '2017061595', '95', '33440', '22', '2017-06-15 00:00:00', '105', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30747', '2017061594', '94', '33439', '22', '2017-06-15 00:00:00', '982', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30748', '2017061593', '93', '33438', '22', '2017-06-15 00:00:00', '525', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30749', '2017061592', '92', '33437', '22', '2017-06-15 00:00:00', '583', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30750', '2017061591', '91', '33436', '22', '2017-06-15 00:00:00', '752', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30751', '2017061590', '90', '33435', '22', '2017-06-15 00:00:00', '886', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30752', '2017061589', '89', '33434', '22', '2017-06-15 00:00:00', '205', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30753', '2017061588', '88', '33433', '22', '2017-06-15 00:00:00', '760', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30754', '2017061587', '87', '33432', '22', '2017-06-15 00:00:00', '975', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30755', '2017061586', '86', '33431', '22', '2017-06-15 00:00:00', '513', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30756', '2017061585', '85', '33430', '22', '2017-06-15 00:00:00', '402', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30757', '2017061584', '84', '33429', '22', '2017-06-15 00:00:00', '760', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30758', '2017061583', '83', '33428', '22', '2017-06-15 00:00:00', '746', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30759', '2017061582', '82', '33427', '22', '2017-06-15 00:00:00', '399', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30760', '2017061581', '81', '33426', '22', '2017-06-15 00:00:00', '865', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30761', '2017061580', '80', '33425', '22', '2017-06-15 00:00:00', '891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30762', '2017061579', '79', '33424', '22', '2017-06-15 00:00:00', '488', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30763', '2017061578', '78', '33423', '22', '2017-06-15 00:00:00', '628', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30764', '2017061577', '77', '33422', '22', '2017-06-15 00:00:00', '891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30765', '2017061576', '76', '33421', '22', '2017-06-15 00:00:00', '114', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30766', '2017061575', '75', '33420', '22', '2017-06-15 00:00:00', '171', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30767', '2017061574', '74', '33419', '22', '2017-06-15 00:00:00', '834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30768', '2017061573', '73', '33418', '22', '2017-06-15 00:00:00', '225', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30769', '2017061572', '72', '33417', '22', '2017-06-15 00:00:00', '537', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30770', '2017061571', '71', '33416', '22', '2017-06-15 00:00:00', '219', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30771', '2017061570', '70', '33415', '22', '2017-06-15 00:00:00', '202', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30772', '2017061569', '69', '33414', '22', '2017-06-15 00:00:00', '866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30773', '2017061568', '68', '33413', '22', '2017-06-15 00:00:00', '220', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30774', '2017061567', '67', '33412', '22', '2017-06-15 00:00:00', '602', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30775', '2017061566', '66', '33411', '22', '2017-06-15 00:00:00', '165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30776', '2017061565', '65', '33410', '22', '2017-06-15 00:00:00', '759', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30777', '2017061564', '64', '33409', '22', '2017-06-15 00:00:00', '372', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30778', '2017061563', '63', '33408', '22', '2017-06-15 00:00:00', '843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30779', '2017061562', '62', '33407', '22', '2017-06-15 00:00:00', '809', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30780', '2017061561', '61', '33406', '22', '2017-06-15 00:00:00', '103', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30781', '2017061560', '60', '33405', '22', '2017-06-15 00:00:00', '853', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30782', '2017061559', '59', '33404', '22', '2017-06-15 00:00:00', '913', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30783', '2017061558', '58', '33403', '22', '2017-06-15 00:00:00', '867', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30784', '2017061557', '57', '33402', '22', '2017-06-15 00:00:00', '443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30785', '2017061556', '56', '33401', '22', '2017-06-15 00:00:00', '172', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30786', '2017061555', '55', '33400', '22', '2017-06-15 00:00:00', '334', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30787', '2017061554', '54', '33399', '22', '2017-06-15 00:00:00', '425', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30788', '2017061553', '53', '33398', '22', '2017-06-15 00:00:00', '176', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30789', '2017061552', '52', '33397', '22', '2017-06-15 00:00:00', '889', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30790', '2017061551', '51', '33396', '22', '2017-06-15 00:00:00', '879', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30791', '2017061550', '50', '33395', '22', '2017-06-15 00:00:00', '915', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30792', '2017061549', '49', '33394', '22', '2017-06-15 00:00:00', '850', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30793', '2017061548', '48', '33393', '22', '2017-06-15 00:00:00', '612', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30794', '2017061547', '47', '33392', '22', '2017-06-15 00:00:00', '269', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30795', '2017061546', '46', '33391', '22', '2017-06-15 00:00:00', '624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30796', '2017061545', '45', '33390', '22', '2017-06-15 00:00:00', '862', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30797', '2017061544', '44', '33389', '22', '2017-06-15 00:00:00', '102', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30798', '2017061543', '43', '33388', '22', '2017-06-15 00:00:00', '276', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30799', '2017061542', '42', '33387', '22', '2017-06-15 00:00:00', '985', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30800', '2017061541', '41', '33386', '22', '2017-06-15 00:00:00', '857', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30801', '2017061540', '40', '33385', '22', '2017-06-15 00:00:00', '567', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30802', '2017061539', '39', '33384', '22', '2017-06-15 00:00:00', '422', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30803', '2017061538', '38', '33383', '22', '2017-06-15 00:00:00', '282', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30804', '2017061537', '37', '33382', '22', '2017-06-15 00:00:00', '134', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30805', '2017061536', '36', '33381', '22', '2017-06-15 00:00:00', '968', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30806', '2017061535', '35', '33380', '22', '2017-06-15 00:00:00', '678', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30807', '2017061534', '34', '33379', '22', '2017-06-15 00:00:00', '850', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30808', '2017061533', '33', '33378', '22', '2017-06-15 00:00:00', '238', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30809', '2017061532', '32', '33377', '22', '2017-06-15 00:00:00', '712', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30810', '2017061531', '31', '33376', '22', '2017-06-15 00:00:00', '567', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30811', '2017061530', '30', '33375', '22', '2017-06-15 00:00:00', '973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30812', '2017061529', '29', '33374', '22', '2017-06-15 00:00:00', '467', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30813', '2017061528', '28', '33373', '22', '2017-06-15 00:00:00', '560', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30814', '2017061527', '27', '33372', '22', '2017-06-15 00:00:00', '961', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30815', '2017061526', '26', '33371', '22', '2017-06-15 00:00:00', '286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30816', '2017061525', '25', '33370', '22', '2017-06-15 00:00:00', '568', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30817', '2017061524', '24', '33369', '22', '2017-06-15 00:00:00', '822', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30818', '2017061523', '23', '33368', '22', '2017-06-15 00:00:00', '481', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30819', '2017061522', '22', '33367', '22', '2017-06-15 00:00:00', '673', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30820', '2017061521', '21', '33366', '22', '2017-06-15 00:00:00', '738', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30821', '2017061520', '20', '33365', '22', '2017-06-15 00:00:00', '456', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30822', '2017061519', '19', '33364', '22', '2017-06-15 00:00:00', '899', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30823', '2017061518', '18', '33363', '22', '2017-06-15 00:00:00', '869', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30824', '2017061517', '17', '33362', '22', '2017-06-15 00:00:00', '723', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30825', '2017061516', '16', '33361', '22', '2017-06-15 00:00:00', '671', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30826', '2017061515', '15', '33360', '22', '2017-06-15 00:00:00', '838', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30827', '2017061514', '14', '33359', '22', '2017-06-15 00:00:00', '957', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30828', '2017061513', '13', '33358', '22', '2017-06-15 00:00:00', '720', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30829', '2017061512', '12', '33357', '22', '2017-06-15 00:00:00', '428', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30830', '2017061511', '11', '33356', '22', '2017-06-15 00:00:00', '268', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30831', '2017061510', '10', '33355', '22', '2017-06-15 00:00:00', '572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30832', '201706159', '9', '33354', '22', '2017-06-15 00:00:00', '477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30833', '201706158', '8', '33353', '22', '2017-06-15 00:00:00', '936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30834', '201706157', '7', '33352', '22', '2017-06-15 00:00:00', '512', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30835', '201706156', '6', '33351', '22', '2017-06-15 00:00:00', '699', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30836', '201706155', '5', '33350', '22', '2017-06-15 00:00:00', '189', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30837', '201706154', '4', '33349', '22', '2017-06-15 00:00:00', '253', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30838', '201706153', '3', '33348', '22', '2017-06-15 00:00:00', '642', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30839', '201706152', '2', '33347', '22', '2017-06-15 00:00:00', '972', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30840', '201706151', '1', '33346', '22', '2017-06-15 00:00:00', '504', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30841', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '490', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30842', '20170616119', '119', '33464', '22', '2017-06-16 00:00:00', '180', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30843', '20170616118', '118', '33463', '22', '2017-06-16 00:00:00', '575', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30844', '20170616117', '117', '33462', '22', '2017-06-16 00:00:00', '720', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30845', '20170616116', '116', '33461', '22', '2017-06-16 00:00:00', '605', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30846', '20170616115', '115', '33460', '22', '2017-06-16 00:00:00', '897', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30847', '20170616114', '114', '33459', '22', '2017-06-16 00:00:00', '943', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30848', '20170616113', '113', '33458', '22', '2017-06-16 00:00:00', '582', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30849', '20170616112', '112', '33457', '22', '2017-06-16 00:00:00', '909', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30850', '20170616111', '111', '33456', '22', '2017-06-16 00:00:00', '515', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30851', '20170616110', '110', '33455', '22', '2017-06-16 00:00:00', '359', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30852', '20170616109', '109', '33454', '22', '2017-06-16 00:00:00', '287', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30853', '20170616108', '108', '33453', '22', '2017-06-16 00:00:00', '360', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30854', '20170616107', '107', '33452', '22', '2017-06-16 00:00:00', '807', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30855', '20170616106', '106', '33451', '22', '2017-06-16 00:00:00', '260', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30856', '20170616105', '105', '33450', '22', '2017-06-16 00:00:00', '483', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30857', '20170616104', '104', '33449', '22', '2017-06-16 00:00:00', '168', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30858', '20170616103', '103', '33448', '22', '2017-06-16 00:00:00', '394', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30859', '20170616102', '102', '33447', '22', '2017-06-16 00:00:00', '728', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30860', '20170616101', '101', '33446', '22', '2017-06-16 00:00:00', '466', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30861', '20170616100', '100', '33445', '22', '2017-06-16 00:00:00', '192', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30862', '2017061699', '99', '33444', '22', '2017-06-16 00:00:00', '148', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30863', '2017061698', '98', '33443', '22', '2017-06-16 00:00:00', '498', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30864', '2017061697', '97', '33442', '22', '2017-06-16 00:00:00', '883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30865', '2017061696', '96', '33441', '22', '2017-06-16 00:00:00', '741', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30866', '2017061695', '95', '33440', '22', '2017-06-16 00:00:00', '490', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30867', '2017061694', '94', '33439', '22', '2017-06-16 00:00:00', '554', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30868', '2017061693', '93', '33438', '22', '2017-06-16 00:00:00', '132', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30869', '2017061692', '92', '33437', '22', '2017-06-16 00:00:00', '776', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30870', '2017061691', '91', '33436', '22', '2017-06-16 00:00:00', '494', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30871', '2017061690', '90', '33435', '22', '2017-06-16 00:00:00', '532', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30872', '2017061689', '89', '33434', '22', '2017-06-16 00:00:00', '658', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30873', '2017061688', '88', '33433', '22', '2017-06-16 00:00:00', '605', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30874', '2017061687', '87', '33432', '22', '2017-06-16 00:00:00', '580', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30875', '2017061686', '86', '33431', '22', '2017-06-16 00:00:00', '514', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30876', '2017061685', '85', '33430', '22', '2017-06-16 00:00:00', '859', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30877', '2017061684', '84', '33429', '22', '2017-06-16 00:00:00', '988', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30878', '2017061683', '83', '33428', '22', '2017-06-16 00:00:00', '720', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30879', '2017061682', '82', '33427', '22', '2017-06-16 00:00:00', '137', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30880', '2017061681', '81', '33426', '22', '2017-06-16 00:00:00', '482', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30881', '2017061680', '80', '33425', '22', '2017-06-16 00:00:00', '433', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30882', '2017061679', '79', '33424', '22', '2017-06-16 00:00:00', '437', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30883', '2017061678', '78', '33423', '22', '2017-06-16 00:00:00', '383', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30884', '2017061677', '77', '33422', '22', '2017-06-16 00:00:00', '624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30885', '2017061676', '76', '33421', '22', '2017-06-16 00:00:00', '602', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30886', '2017061675', '75', '33420', '22', '2017-06-16 00:00:00', '602', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30887', '2017061674', '74', '33419', '22', '2017-06-16 00:00:00', '888', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30888', '2017061673', '73', '33418', '22', '2017-06-16 00:00:00', '130', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30889', '2017061672', '72', '33417', '22', '2017-06-16 00:00:00', '902', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30890', '2017061671', '71', '33416', '22', '2017-06-16 00:00:00', '738', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30891', '2017061670', '70', '33415', '22', '2017-06-16 00:00:00', '836', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30892', '2017061669', '69', '33414', '22', '2017-06-16 00:00:00', '100', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30893', '2017061668', '68', '33413', '22', '2017-06-16 00:00:00', '293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30894', '2017061667', '67', '33412', '22', '2017-06-16 00:00:00', '815', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30895', '2017061666', '66', '33411', '22', '2017-06-16 00:00:00', '760', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30896', '2017061665', '65', '33410', '22', '2017-06-16 00:00:00', '278', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30897', '2017061664', '64', '33409', '22', '2017-06-16 00:00:00', '885', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30898', '2017061663', '63', '33408', '22', '2017-06-16 00:00:00', '356', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30899', '2017061662', '62', '33407', '22', '2017-06-16 00:00:00', '747', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30900', '2017061661', '61', '33406', '22', '2017-06-16 00:00:00', '862', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30901', '2017061660', '60', '33405', '22', '2017-06-16 00:00:00', '736', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30902', '2017061659', '59', '33404', '22', '2017-06-16 00:00:00', '233', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30903', '2017061658', '58', '33403', '22', '2017-06-16 00:00:00', '429', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30904', '2017061657', '57', '33402', '22', '2017-06-16 00:00:00', '700', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30905', '2017061656', '56', '33401', '22', '2017-06-16 00:00:00', '158', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30906', '2017061655', '55', '33400', '22', '2017-06-16 00:00:00', '867', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30907', '2017061654', '54', '33399', '22', '2017-06-16 00:00:00', '791', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30908', '2017061653', '53', '33398', '22', '2017-06-16 00:00:00', '887', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30909', '2017061652', '52', '33397', '22', '2017-06-16 00:00:00', '807', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30910', '2017061651', '51', '33396', '22', '2017-06-16 00:00:00', '431', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30911', '2017061650', '50', '33395', '22', '2017-06-16 00:00:00', '568', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30912', '2017061649', '49', '33394', '22', '2017-06-16 00:00:00', '270', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30913', '2017061648', '48', '33393', '22', '2017-06-16 00:00:00', '295', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30914', '2017061647', '47', '33392', '22', '2017-06-16 00:00:00', '246', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30915', '2017061646', '46', '33391', '22', '2017-06-16 00:00:00', '744', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30916', '2017061645', '45', '33390', '22', '2017-06-16 00:00:00', '848', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30917', '2017061644', '44', '33389', '22', '2017-06-16 00:00:00', '281', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30918', '2017061643', '43', '33388', '22', '2017-06-16 00:00:00', '285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30919', '2017061642', '42', '33387', '22', '2017-06-16 00:00:00', '954', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30920', '2017061641', '41', '33386', '22', '2017-06-16 00:00:00', '566', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30921', '2017061640', '40', '33385', '22', '2017-06-16 00:00:00', '173', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30922', '2017061639', '39', '33384', '22', '2017-06-16 00:00:00', '969', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30923', '2017061638', '38', '33383', '22', '2017-06-16 00:00:00', '381', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30924', '2017061637', '37', '33382', '22', '2017-06-16 00:00:00', '521', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30925', '2017061636', '36', '33381', '22', '2017-06-16 00:00:00', '731', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30926', '2017061635', '35', '33380', '22', '2017-06-16 00:00:00', '469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30927', '2017061634', '34', '33379', '22', '2017-06-16 00:00:00', '461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30928', '2017061633', '33', '33378', '22', '2017-06-16 00:00:00', '460', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30929', '2017061632', '32', '33377', '22', '2017-06-16 00:00:00', '465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30930', '2017061631', '31', '33376', '22', '2017-06-16 00:00:00', '109', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30931', '2017061630', '30', '33375', '22', '2017-06-16 00:00:00', '377', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30932', '2017061629', '29', '33374', '22', '2017-06-16 00:00:00', '580', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30933', '2017061628', '28', '33373', '22', '2017-06-16 00:00:00', '134', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30934', '2017061627', '27', '33372', '22', '2017-06-16 00:00:00', '759', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30935', '2017061626', '26', '33371', '22', '2017-06-16 00:00:00', '663', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30936', '2017061625', '25', '33370', '22', '2017-06-16 00:00:00', '628', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30937', '2017061624', '24', '33369', '22', '2017-06-16 00:00:00', '948', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30938', '2017061623', '23', '33368', '22', '2017-06-16 00:00:00', '142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30939', '2017061622', '22', '33367', '22', '2017-06-16 00:00:00', '506', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30940', '2017061621', '21', '33366', '22', '2017-06-16 00:00:00', '801', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30941', '2017061620', '20', '33365', '22', '2017-06-16 00:00:00', '965', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30942', '2017061619', '19', '33364', '22', '2017-06-16 00:00:00', '929', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30943', '2017061618', '18', '33363', '22', '2017-06-16 00:00:00', '437', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30944', '2017061617', '17', '33362', '22', '2017-06-16 00:00:00', '846', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30945', '2017061616', '16', '33361', '22', '2017-06-16 00:00:00', '495', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30946', '2017061615', '15', '33360', '22', '2017-06-16 00:00:00', '843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30947', '2017061614', '14', '33359', '22', '2017-06-16 00:00:00', '543', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30948', '2017061613', '13', '33358', '22', '2017-06-16 00:00:00', '959', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30949', '2017061612', '12', '33357', '22', '2017-06-16 00:00:00', '297', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30950', '2017061611', '11', '33356', '22', '2017-06-16 00:00:00', '755', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30951', '2017061610', '10', '33355', '22', '2017-06-16 00:00:00', '457', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30952', '201706169', '9', '33354', '22', '2017-06-16 00:00:00', '888', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30953', '201706168', '8', '33353', '22', '2017-06-16 00:00:00', '682', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30954', '201706167', '7', '33352', '22', '2017-06-16 00:00:00', '187', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30955', '201706166', '6', '33351', '22', '2017-06-16 00:00:00', '264', '1', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30956', '201706165', '5', '33350', '22', '2017-06-16 00:00:00', '829', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30957', '201706164', '4', '33349', '22', '2017-06-16 00:00:00', '608', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30958', '201706163', '3', '33348', '22', '2017-06-16 00:00:00', '911', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30959', '201706162', '2', '33347', '22', '2017-06-16 00:00:00', '498', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30960', '201706161', '1', '33346', '22', '2017-06-16 00:00:00', '529', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30961', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '384', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30962', '20170617119', '119', '33464', '22', '2017-06-17 00:00:00', '649', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30963', '20170617118', '118', '33463', '22', '2017-06-17 00:00:00', '344', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30964', '20170617117', '117', '33462', '22', '2017-06-17 00:00:00', '185', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30965', '20170617116', '116', '33461', '22', '2017-06-17 00:00:00', '770', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30966', '20170617115', '115', '33460', '22', '2017-06-17 00:00:00', '273', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30967', '20170617114', '114', '33459', '22', '2017-06-17 00:00:00', '336', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30968', '20170617113', '113', '33458', '22', '2017-06-17 00:00:00', '445', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30969', '20170617112', '112', '33457', '22', '2017-06-17 00:00:00', '275', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30970', '20170617111', '111', '33456', '22', '2017-06-17 00:00:00', '204', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30971', '20170617110', '110', '33455', '22', '2017-06-17 00:00:00', '557', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30972', '20170617109', '109', '33454', '22', '2017-06-17 00:00:00', '604', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30973', '20170617108', '108', '33453', '22', '2017-06-17 00:00:00', '560', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30974', '20170617107', '107', '33452', '22', '2017-06-17 00:00:00', '415', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30975', '20170617106', '106', '33451', '22', '2017-06-17 00:00:00', '644', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30976', '20170617105', '105', '33450', '22', '2017-06-17 00:00:00', '409', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30977', '20170617104', '104', '33449', '22', '2017-06-17 00:00:00', '132', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30978', '20170617103', '103', '33448', '22', '2017-06-17 00:00:00', '427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30979', '20170617102', '102', '33447', '22', '2017-06-17 00:00:00', '679', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30980', '20170617101', '101', '33446', '22', '2017-06-17 00:00:00', '958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30981', '20170617100', '100', '33445', '22', '2017-06-17 00:00:00', '652', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30982', '2017061799', '99', '33444', '22', '2017-06-17 00:00:00', '213', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30983', '2017061798', '98', '33443', '22', '2017-06-17 00:00:00', '298', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30984', '2017061797', '97', '33442', '22', '2017-06-17 00:00:00', '198', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30985', '2017061796', '96', '33441', '22', '2017-06-17 00:00:00', '628', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30986', '2017061795', '95', '33440', '22', '2017-06-17 00:00:00', '193', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30987', '2017061794', '94', '33439', '22', '2017-06-17 00:00:00', '485', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30988', '2017061793', '93', '33438', '22', '2017-06-17 00:00:00', '125', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30989', '2017061792', '92', '33437', '22', '2017-06-17 00:00:00', '821', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30990', '2017061791', '91', '33436', '22', '2017-06-17 00:00:00', '341', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30991', '2017061790', '90', '33435', '22', '2017-06-17 00:00:00', '874', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30992', '2017061789', '89', '33434', '22', '2017-06-17 00:00:00', '486', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30993', '2017061788', '88', '33433', '22', '2017-06-17 00:00:00', '639', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30994', '2017061787', '87', '33432', '22', '2017-06-17 00:00:00', '177', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30995', '2017061786', '86', '33431', '22', '2017-06-17 00:00:00', '649', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30996', '2017061785', '85', '33430', '22', '2017-06-17 00:00:00', '578', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30997', '2017061784', '84', '33429', '22', '2017-06-17 00:00:00', '843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30998', '2017061783', '83', '33428', '22', '2017-06-17 00:00:00', '575', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('30999', '2017061782', '82', '33427', '22', '2017-06-17 00:00:00', '345', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31000', '2017061781', '81', '33426', '22', '2017-06-17 00:00:00', '148', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31001', '2017061780', '80', '33425', '22', '2017-06-17 00:00:00', '841', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31002', '2017061779', '79', '33424', '22', '2017-06-17 00:00:00', '154', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31003', '2017061778', '78', '33423', '22', '2017-06-17 00:00:00', '947', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31004', '2017061777', '77', '33422', '22', '2017-06-17 00:00:00', '293', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31005', '2017061776', '76', '33421', '22', '2017-06-17 00:00:00', '492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31006', '2017061775', '75', '33420', '22', '2017-06-17 00:00:00', '689', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31007', '2017061774', '74', '33419', '22', '2017-06-17 00:00:00', '288', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31008', '2017061773', '73', '33418', '22', '2017-06-17 00:00:00', '760', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31009', '2017061772', '72', '33417', '22', '2017-06-17 00:00:00', '106', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31010', '2017061771', '71', '33416', '22', '2017-06-17 00:00:00', '799', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31011', '2017061770', '70', '33415', '22', '2017-06-17 00:00:00', '253', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31012', '2017061769', '69', '33414', '22', '2017-06-17 00:00:00', '845', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31013', '2017061768', '68', '33413', '22', '2017-06-17 00:00:00', '443', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31014', '2017061767', '67', '33412', '22', '2017-06-17 00:00:00', '458', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31015', '2017061766', '66', '33411', '22', '2017-06-17 00:00:00', '477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31016', '2017061765', '65', '33410', '22', '2017-06-17 00:00:00', '296', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31017', '2017061764', '64', '33409', '22', '2017-06-17 00:00:00', '912', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31018', '2017061763', '63', '33408', '22', '2017-06-17 00:00:00', '987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31019', '2017061762', '62', '33407', '22', '2017-06-17 00:00:00', '143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31020', '2017061761', '61', '33406', '22', '2017-06-17 00:00:00', '209', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31021', '2017061760', '60', '33405', '22', '2017-06-17 00:00:00', '472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31022', '2017061759', '59', '33404', '22', '2017-06-17 00:00:00', '558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31023', '2017061758', '58', '33403', '22', '2017-06-17 00:00:00', '687', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31024', '2017061757', '57', '33402', '22', '2017-06-17 00:00:00', '331', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31025', '2017061756', '56', '33401', '22', '2017-06-17 00:00:00', '333', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31026', '2017061755', '55', '33400', '22', '2017-06-17 00:00:00', '493', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31027', '2017061754', '54', '33399', '22', '2017-06-17 00:00:00', '392', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31028', '2017061753', '53', '33398', '22', '2017-06-17 00:00:00', '859', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31029', '2017061752', '52', '33397', '22', '2017-06-17 00:00:00', '353', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31030', '2017061751', '51', '33396', '22', '2017-06-17 00:00:00', '764', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31031', '2017061750', '50', '33395', '22', '2017-06-17 00:00:00', '692', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31032', '2017061749', '49', '33394', '22', '2017-06-17 00:00:00', '640', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31033', '2017061748', '48', '33393', '22', '2017-06-17 00:00:00', '843', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31034', '2017061747', '47', '33392', '22', '2017-06-17 00:00:00', '892', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31035', '2017061746', '46', '33391', '22', '2017-06-17 00:00:00', '774', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31036', '2017061745', '45', '33390', '22', '2017-06-17 00:00:00', '771', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31037', '2017061744', '44', '33389', '22', '2017-06-17 00:00:00', '762', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31038', '2017061743', '43', '33388', '22', '2017-06-17 00:00:00', '849', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31039', '2017061742', '42', '33387', '22', '2017-06-17 00:00:00', '270', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31040', '2017061741', '41', '33386', '22', '2017-06-17 00:00:00', '998', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31041', '2017061740', '40', '33385', '22', '2017-06-17 00:00:00', '418', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31042', '2017061739', '39', '33384', '22', '2017-06-17 00:00:00', '159', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31043', '2017061738', '38', '33383', '22', '2017-06-17 00:00:00', '164', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31044', '2017061737', '37', '33382', '22', '2017-06-17 00:00:00', '619', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31045', '2017061736', '36', '33381', '22', '2017-06-17 00:00:00', '573', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31046', '2017061735', '35', '33380', '22', '2017-06-17 00:00:00', '591', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31047', '2017061734', '34', '33379', '22', '2017-06-17 00:00:00', '993', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31048', '2017061733', '33', '33378', '22', '2017-06-17 00:00:00', '281', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31049', '2017061732', '32', '33377', '22', '2017-06-17 00:00:00', '634', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31050', '2017061731', '31', '33376', '22', '2017-06-17 00:00:00', '768', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31051', '2017061730', '30', '33375', '22', '2017-06-17 00:00:00', '139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31052', '2017061729', '29', '33374', '22', '2017-06-17 00:00:00', '180', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31053', '2017061728', '28', '33373', '22', '2017-06-17 00:00:00', '461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31054', '2017061727', '27', '33372', '22', '2017-06-17 00:00:00', '663', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31055', '2017061726', '26', '33371', '22', '2017-06-17 00:00:00', '837', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31056', '2017061725', '25', '33370', '22', '2017-06-17 00:00:00', '963', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31057', '2017061724', '24', '33369', '22', '2017-06-17 00:00:00', '364', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31058', '2017061723', '23', '33368', '22', '2017-06-17 00:00:00', '696', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31059', '2017061722', '22', '33367', '22', '2017-06-17 00:00:00', '472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31060', '2017061721', '21', '33366', '22', '2017-06-17 00:00:00', '127', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31061', '2017061720', '20', '33365', '22', '2017-06-17 00:00:00', '201', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31062', '2017061719', '19', '33364', '22', '2017-06-17 00:00:00', '840', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31063', '2017061718', '18', '33363', '22', '2017-06-17 00:00:00', '477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31064', '2017061717', '17', '33362', '22', '2017-06-17 00:00:00', '119', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31065', '2017061716', '16', '33361', '22', '2017-06-17 00:00:00', '283', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31066', '2017061715', '15', '33360', '22', '2017-06-17 00:00:00', '617', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31067', '2017061714', '14', '33359', '22', '2017-06-17 00:00:00', '938', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31068', '2017061713', '13', '33358', '22', '2017-06-17 00:00:00', '235', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31069', '2017061712', '12', '33357', '22', '2017-06-17 00:00:00', '469', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31070', '2017061711', '11', '33356', '22', '2017-06-17 00:00:00', '898', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31071', '2017061710', '10', '33355', '22', '2017-06-17 00:00:00', '589', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31072', '201706179', '9', '33354', '22', '2017-06-17 00:00:00', '224', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31073', '201706178', '8', '33353', '22', '2017-06-17 00:00:00', '168', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31074', '201706177', '7', '33352', '22', '2017-06-17 00:00:00', '305', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31075', '201706176', '6', '33351', '22', '2017-06-17 00:00:00', '413', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31076', '201706175', '5', '33350', '22', '2017-06-17 00:00:00', '281', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31077', '201706174', '4', '33349', '22', '2017-06-17 00:00:00', '139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31078', '201706173', '3', '33348', '22', '2017-06-17 00:00:00', '611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31079', '201706172', '2', '33347', '22', '2017-06-17 00:00:00', '946', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31080', '201706171', '1', '33346', '22', '2017-06-17 00:00:00', '153', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31081', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '692', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31082', '20170618119', '119', '33464', '22', '2017-06-18 00:00:00', '437', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31083', '20170618118', '118', '33463', '22', '2017-06-18 00:00:00', '472', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31084', '20170618117', '117', '33462', '22', '2017-06-18 00:00:00', '938', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31085', '20170618116', '116', '33461', '22', '2017-06-18 00:00:00', '787', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31086', '20170618115', '115', '33460', '22', '2017-06-18 00:00:00', '655', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31087', '20170618114', '114', '33459', '22', '2017-06-18 00:00:00', '425', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31088', '20170618113', '113', '33458', '22', '2017-06-18 00:00:00', '582', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31089', '20170618112', '112', '33457', '22', '2017-06-18 00:00:00', '732', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31090', '20170618111', '111', '33456', '22', '2017-06-18 00:00:00', '787', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31091', '20170618110', '110', '33455', '22', '2017-06-18 00:00:00', '889', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31092', '20170618109', '109', '33454', '22', '2017-06-18 00:00:00', '182', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31093', '20170618108', '108', '33453', '22', '2017-06-18 00:00:00', '387', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31094', '20170618107', '107', '33452', '22', '2017-06-18 00:00:00', '804', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31095', '20170618106', '106', '33451', '22', '2017-06-18 00:00:00', '599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31096', '20170618105', '105', '33450', '22', '2017-06-18 00:00:00', '385', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31097', '20170618104', '104', '33449', '22', '2017-06-18 00:00:00', '961', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31098', '20170618103', '103', '33448', '22', '2017-06-18 00:00:00', '229', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31099', '20170618102', '102', '33447', '22', '2017-06-18 00:00:00', '540', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31100', '20170618101', '101', '33446', '22', '2017-06-18 00:00:00', '488', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31101', '20170618100', '100', '33445', '22', '2017-06-18 00:00:00', '514', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31102', '2017061899', '99', '33444', '22', '2017-06-18 00:00:00', '834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31103', '2017061898', '98', '33443', '22', '2017-06-18 00:00:00', '345', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31104', '2017061897', '97', '33442', '22', '2017-06-18 00:00:00', '237', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31105', '2017061896', '96', '33441', '22', '2017-06-18 00:00:00', '255', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31106', '2017061895', '95', '33440', '22', '2017-06-18 00:00:00', '340', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31107', '2017061894', '94', '33439', '22', '2017-06-18 00:00:00', '999', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31108', '2017061893', '93', '33438', '22', '2017-06-18 00:00:00', '730', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31109', '2017061892', '92', '33437', '22', '2017-06-18 00:00:00', '943', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31110', '2017061891', '91', '33436', '22', '2017-06-18 00:00:00', '519', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31111', '2017061890', '90', '33435', '22', '2017-06-18 00:00:00', '337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31112', '2017061889', '89', '33434', '22', '2017-06-18 00:00:00', '813', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31113', '2017061888', '88', '33433', '22', '2017-06-18 00:00:00', '189', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31114', '2017061887', '87', '33432', '22', '2017-06-18 00:00:00', '893', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31115', '2017061886', '86', '33431', '22', '2017-06-18 00:00:00', '242', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31116', '2017061885', '85', '33430', '22', '2017-06-18 00:00:00', '684', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31117', '2017061884', '84', '33429', '22', '2017-06-18 00:00:00', '550', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31118', '2017061883', '83', '33428', '22', '2017-06-18 00:00:00', '534', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31119', '2017061882', '82', '33427', '22', '2017-06-18 00:00:00', '350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31120', '2017061881', '81', '33426', '22', '2017-06-18 00:00:00', '989', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31121', '2017061880', '80', '33425', '22', '2017-06-18 00:00:00', '538', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31122', '2017061879', '79', '33424', '22', '2017-06-18 00:00:00', '765', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31123', '2017061878', '78', '33423', '22', '2017-06-18 00:00:00', '744', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31124', '2017061877', '77', '33422', '22', '2017-06-18 00:00:00', '125', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31125', '2017061876', '76', '33421', '22', '2017-06-18 00:00:00', '910', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31126', '2017061875', '75', '33420', '22', '2017-06-18 00:00:00', '655', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31127', '2017061874', '74', '33419', '22', '2017-06-18 00:00:00', '159', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31128', '2017061873', '73', '33418', '22', '2017-06-18 00:00:00', '539', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31129', '2017061872', '72', '33417', '22', '2017-06-18 00:00:00', '176', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31130', '2017061871', '71', '33416', '22', '2017-06-18 00:00:00', '629', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31131', '2017061870', '70', '33415', '22', '2017-06-18 00:00:00', '479', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31132', '2017061869', '69', '33414', '22', '2017-06-18 00:00:00', '627', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31133', '2017061868', '68', '33413', '22', '2017-06-18 00:00:00', '896', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31134', '2017061867', '67', '33412', '22', '2017-06-18 00:00:00', '657', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31135', '2017061866', '66', '33411', '22', '2017-06-18 00:00:00', '439', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31136', '2017061865', '65', '33410', '22', '2017-06-18 00:00:00', '138', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31137', '2017061864', '64', '33409', '22', '2017-06-18 00:00:00', '679', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31138', '2017061863', '63', '33408', '22', '2017-06-18 00:00:00', '261', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31139', '2017061862', '62', '33407', '22', '2017-06-18 00:00:00', '123', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31140', '2017061861', '61', '33406', '22', '2017-06-18 00:00:00', '167', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31141', '2017061860', '60', '33405', '22', '2017-06-18 00:00:00', '285', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31142', '2017061859', '59', '33404', '22', '2017-06-18 00:00:00', '314', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31143', '2017061858', '58', '33403', '22', '2017-06-18 00:00:00', '965', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31144', '2017061857', '57', '33402', '22', '2017-06-18 00:00:00', '461', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31145', '2017061856', '56', '33401', '22', '2017-06-18 00:00:00', '923', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31146', '2017061855', '55', '33400', '22', '2017-06-18 00:00:00', '337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31147', '2017061854', '54', '33399', '22', '2017-06-18 00:00:00', '350', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31148', '2017061853', '53', '33398', '22', '2017-06-18 00:00:00', '318', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31149', '2017061852', '52', '33397', '22', '2017-06-18 00:00:00', '651', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31150', '2017061851', '51', '33396', '22', '2017-06-18 00:00:00', '301', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31151', '2017061850', '50', '33395', '22', '2017-06-18 00:00:00', '613', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31152', '2017061849', '49', '33394', '22', '2017-06-18 00:00:00', '383', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31153', '2017061848', '48', '33393', '22', '2017-06-18 00:00:00', '681', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31154', '2017061847', '47', '33392', '22', '2017-06-18 00:00:00', '630', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31155', '2017061846', '46', '33391', '22', '2017-06-18 00:00:00', '936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31156', '2017061845', '45', '33390', '22', '2017-06-18 00:00:00', '855', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31157', '2017061844', '44', '33389', '22', '2017-06-18 00:00:00', '870', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31158', '2017061843', '43', '33388', '22', '2017-06-18 00:00:00', '394', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31159', '2017061842', '42', '33387', '22', '2017-06-18 00:00:00', '956', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31160', '2017061841', '41', '33386', '22', '2017-06-18 00:00:00', '580', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31161', '2017061840', '40', '33385', '22', '2017-06-18 00:00:00', '629', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31162', '2017061839', '39', '33384', '22', '2017-06-18 00:00:00', '916', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31163', '2017061838', '38', '33383', '22', '2017-06-18 00:00:00', '756', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31164', '2017061837', '37', '33382', '22', '2017-06-18 00:00:00', '655', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31165', '2017061836', '36', '33381', '22', '2017-06-18 00:00:00', '716', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31166', '2017061835', '35', '33380', '22', '2017-06-18 00:00:00', '368', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31167', '2017061834', '34', '33379', '22', '2017-06-18 00:00:00', '871', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31168', '2017061833', '33', '33378', '22', '2017-06-18 00:00:00', '826', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31169', '2017061832', '32', '33377', '22', '2017-06-18 00:00:00', '541', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31170', '2017061831', '31', '33376', '22', '2017-06-18 00:00:00', '971', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31171', '2017061830', '30', '33375', '22', '2017-06-18 00:00:00', '484', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31172', '2017061829', '29', '33374', '22', '2017-06-18 00:00:00', '391', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31173', '2017061828', '28', '33373', '22', '2017-06-18 00:00:00', '864', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31174', '2017061827', '27', '33372', '22', '2017-06-18 00:00:00', '897', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31175', '2017061826', '26', '33371', '22', '2017-06-18 00:00:00', '131', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31176', '2017061825', '25', '33370', '22', '2017-06-18 00:00:00', '896', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31177', '2017061824', '24', '33369', '22', '2017-06-18 00:00:00', '194', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31178', '2017061823', '23', '33368', '22', '2017-06-18 00:00:00', '568', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31179', '2017061822', '22', '33367', '22', '2017-06-18 00:00:00', '796', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31180', '2017061821', '21', '33366', '22', '2017-06-18 00:00:00', '739', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31181', '2017061820', '20', '33365', '22', '2017-06-18 00:00:00', '190', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31182', '2017061819', '19', '33364', '22', '2017-06-18 00:00:00', '856', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31183', '2017061818', '18', '33363', '22', '2017-06-18 00:00:00', '313', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31184', '2017061817', '17', '33362', '22', '2017-06-18 00:00:00', '565', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31185', '2017061816', '16', '33361', '22', '2017-06-18 00:00:00', '262', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31186', '2017061815', '15', '33360', '22', '2017-06-18 00:00:00', '383', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31187', '2017061814', '14', '33359', '22', '2017-06-18 00:00:00', '566', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31188', '2017061813', '13', '33358', '22', '2017-06-18 00:00:00', '573', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31189', '2017061812', '12', '33357', '22', '2017-06-18 00:00:00', '268', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31190', '2017061811', '11', '33356', '22', '2017-06-18 00:00:00', '921', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31191', '2017061810', '10', '33355', '22', '2017-06-18 00:00:00', '291', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31192', '201706189', '9', '33354', '22', '2017-06-18 00:00:00', '509', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31193', '201706188', '8', '33353', '22', '2017-06-18 00:00:00', '519', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31194', '201706187', '7', '33352', '22', '2017-06-18 00:00:00', '191', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31195', '201706186', '6', '33351', '22', '2017-06-18 00:00:00', '470', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31196', '201706185', '5', '33350', '22', '2017-06-18 00:00:00', '569', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31197', '201706184', '4', '33349', '22', '2017-06-18 00:00:00', '873', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31198', '201706183', '3', '33348', '22', '2017-06-18 00:00:00', '866', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31199', '201706182', '2', '33347', '22', '2017-06-18 00:00:00', '740', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31200', '201706181', '1', '33346', '22', '2017-06-18 00:00:00', '502', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31201', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '741', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31202', '20170619119', '119', '33464', '22', '2017-06-19 00:00:00', '667', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31203', '20170619118', '118', '33463', '22', '2017-06-19 00:00:00', '283', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31204', '20170619117', '117', '33462', '22', '2017-06-19 00:00:00', '502', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31205', '20170619116', '116', '33461', '22', '2017-06-19 00:00:00', '881', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31206', '20170619115', '115', '33460', '22', '2017-06-19 00:00:00', '467', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31207', '20170619114', '114', '33459', '22', '2017-06-19 00:00:00', '535', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31208', '20170619113', '113', '33458', '22', '2017-06-19 00:00:00', '319', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31209', '20170619112', '112', '33457', '22', '2017-06-19 00:00:00', '703', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31210', '20170619111', '111', '33456', '22', '2017-06-19 00:00:00', '687', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31211', '20170619110', '110', '33455', '22', '2017-06-19 00:00:00', '679', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31212', '20170619109', '109', '33454', '22', '2017-06-19 00:00:00', '147', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31213', '20170619108', '108', '33453', '22', '2017-06-19 00:00:00', '966', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31214', '20170619107', '107', '33452', '22', '2017-06-19 00:00:00', '398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31215', '20170619106', '106', '33451', '22', '2017-06-19 00:00:00', '351', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31216', '20170619105', '105', '33450', '22', '2017-06-19 00:00:00', '635', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31217', '20170619104', '104', '33449', '22', '2017-06-19 00:00:00', '180', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31218', '20170619103', '103', '33448', '22', '2017-06-19 00:00:00', '924', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31219', '20170619102', '102', '33447', '22', '2017-06-19 00:00:00', '534', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31220', '20170619101', '101', '33446', '22', '2017-06-19 00:00:00', '178', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31221', '20170619100', '100', '33445', '22', '2017-06-19 00:00:00', '903', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31222', '2017061999', '99', '33444', '22', '2017-06-19 00:00:00', '435', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31223', '2017061998', '98', '33443', '22', '2017-06-19 00:00:00', '863', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31224', '2017061997', '97', '33442', '22', '2017-06-19 00:00:00', '325', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31225', '2017061996', '96', '33441', '22', '2017-06-19 00:00:00', '746', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31226', '2017061995', '95', '33440', '22', '2017-06-19 00:00:00', '254', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31227', '2017061994', '94', '33439', '22', '2017-06-19 00:00:00', '522', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31228', '2017061993', '93', '33438', '22', '2017-06-19 00:00:00', '372', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31229', '2017061992', '92', '33437', '22', '2017-06-19 00:00:00', '468', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31230', '2017061991', '91', '33436', '22', '2017-06-19 00:00:00', '352', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31231', '2017061990', '90', '33435', '22', '2017-06-19 00:00:00', '946', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31232', '2017061989', '89', '33434', '22', '2017-06-19 00:00:00', '965', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31233', '2017061988', '88', '33433', '22', '2017-06-19 00:00:00', '378', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31234', '2017061987', '87', '33432', '22', '2017-06-19 00:00:00', '252', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31235', '2017061986', '86', '33431', '22', '2017-06-19 00:00:00', '419', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31236', '2017061985', '85', '33430', '22', '2017-06-19 00:00:00', '501', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31237', '2017061984', '84', '33429', '22', '2017-06-19 00:00:00', '335', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31238', '2017061983', '83', '33428', '22', '2017-06-19 00:00:00', '825', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31239', '2017061982', '82', '33427', '22', '2017-06-19 00:00:00', '376', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31240', '2017061981', '81', '33426', '22', '2017-06-19 00:00:00', '529', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31241', '2017061980', '80', '33425', '22', '2017-06-19 00:00:00', '649', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31242', '2017061979', '79', '33424', '22', '2017-06-19 00:00:00', '693', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31243', '2017061978', '78', '33423', '22', '2017-06-19 00:00:00', '900', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31244', '2017061977', '77', '33422', '22', '2017-06-19 00:00:00', '343', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31245', '2017061976', '76', '33421', '22', '2017-06-19 00:00:00', '280', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31246', '2017061975', '75', '33420', '22', '2017-06-19 00:00:00', '728', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31247', '2017061974', '74', '33419', '22', '2017-06-19 00:00:00', '726', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31248', '2017061973', '73', '33418', '22', '2017-06-19 00:00:00', '592', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31249', '2017061972', '72', '33417', '22', '2017-06-19 00:00:00', '436', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31250', '2017061971', '71', '33416', '22', '2017-06-19 00:00:00', '452', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31251', '2017061970', '70', '33415', '22', '2017-06-19 00:00:00', '839', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31252', '2017061969', '69', '33414', '22', '2017-06-19 00:00:00', '571', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31253', '2017061968', '68', '33413', '22', '2017-06-19 00:00:00', '976', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31254', '2017061967', '67', '33412', '22', '2017-06-19 00:00:00', '736', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31255', '2017061966', '66', '33411', '22', '2017-06-19 00:00:00', '873', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31256', '2017061965', '65', '33410', '22', '2017-06-19 00:00:00', '929', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31257', '2017061964', '64', '33409', '22', '2017-06-19 00:00:00', '412', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31258', '2017061963', '63', '33408', '22', '2017-06-19 00:00:00', '204', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31259', '2017061962', '62', '33407', '22', '2017-06-19 00:00:00', '912', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31260', '2017061961', '61', '33406', '22', '2017-06-19 00:00:00', '961', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31261', '2017061960', '60', '33405', '22', '2017-06-19 00:00:00', '401', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31262', '2017061959', '59', '33404', '22', '2017-06-19 00:00:00', '625', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31263', '2017061958', '58', '33403', '22', '2017-06-19 00:00:00', '590', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31264', '2017061957', '57', '33402', '22', '2017-06-19 00:00:00', '415', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31265', '2017061956', '56', '33401', '22', '2017-06-19 00:00:00', '353', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31266', '2017061955', '55', '33400', '22', '2017-06-19 00:00:00', '623', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31267', '2017061954', '54', '33399', '22', '2017-06-19 00:00:00', '893', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31268', '2017061953', '53', '33398', '22', '2017-06-19 00:00:00', '388', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31269', '2017061952', '52', '33397', '22', '2017-06-19 00:00:00', '127', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31270', '2017061951', '51', '33396', '22', '2017-06-19 00:00:00', '170', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31271', '2017061950', '50', '33395', '22', '2017-06-19 00:00:00', '554', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31272', '2017061949', '49', '33394', '22', '2017-06-19 00:00:00', '626', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31273', '2017061948', '48', '33393', '22', '2017-06-19 00:00:00', '933', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31274', '2017061947', '47', '33392', '22', '2017-06-19 00:00:00', '586', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31275', '2017061946', '46', '33391', '22', '2017-06-19 00:00:00', '558', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31276', '2017061945', '45', '33390', '22', '2017-06-19 00:00:00', '427', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31277', '2017061944', '44', '33389', '22', '2017-06-19 00:00:00', '831', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31278', '2017061943', '43', '33388', '22', '2017-06-19 00:00:00', '945', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31279', '2017061942', '42', '33387', '22', '2017-06-19 00:00:00', '539', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31280', '2017061941', '41', '33386', '22', '2017-06-19 00:00:00', '436', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31281', '2017061940', '40', '33385', '22', '2017-06-19 00:00:00', '129', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31282', '2017061939', '39', '33384', '22', '2017-06-19 00:00:00', '767', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31283', '2017061938', '38', '33383', '22', '2017-06-19 00:00:00', '581', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31284', '2017061937', '37', '33382', '22', '2017-06-19 00:00:00', '852', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31285', '2017061936', '36', '33381', '22', '2017-06-19 00:00:00', '487', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31286', '2017061935', '35', '33380', '22', '2017-06-19 00:00:00', '925', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31287', '2017061934', '34', '33379', '22', '2017-06-19 00:00:00', '320', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31288', '2017061933', '33', '33378', '22', '2017-06-19 00:00:00', '520', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31289', '2017061932', '32', '33377', '22', '2017-06-19 00:00:00', '414', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31290', '2017061931', '31', '33376', '22', '2017-06-19 00:00:00', '941', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31291', '2017061930', '30', '33375', '22', '2017-06-19 00:00:00', '739', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31292', '2017061929', '29', '33374', '22', '2017-06-19 00:00:00', '539', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31293', '2017061928', '28', '33373', '22', '2017-06-19 00:00:00', '670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31294', '2017061927', '27', '33372', '22', '2017-06-19 00:00:00', '786', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31295', '2017061926', '26', '33371', '22', '2017-06-19 00:00:00', '572', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31296', '2017061925', '25', '33370', '22', '2017-06-19 00:00:00', '654', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31297', '2017061924', '24', '33369', '22', '2017-06-19 00:00:00', '665', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31298', '2017061923', '23', '33368', '22', '2017-06-19 00:00:00', '883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31299', '2017061922', '22', '33367', '22', '2017-06-19 00:00:00', '804', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31300', '2017061921', '21', '33366', '22', '2017-06-19 00:00:00', '162', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31301', '2017061920', '20', '33365', '22', '2017-06-19 00:00:00', '256', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31302', '2017061919', '19', '33364', '22', '2017-06-19 00:00:00', '303', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31303', '2017061918', '18', '33363', '22', '2017-06-19 00:00:00', '170', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31304', '2017061917', '17', '33362', '22', '2017-06-19 00:00:00', '611', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31305', '2017061916', '16', '33361', '22', '2017-06-19 00:00:00', '655', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31306', '2017061915', '15', '33360', '22', '2017-06-19 00:00:00', '367', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31307', '2017061914', '14', '33359', '22', '2017-06-19 00:00:00', '554', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31308', '2017061913', '13', '33358', '22', '2017-06-19 00:00:00', '398', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31309', '2017061912', '12', '33357', '22', '2017-06-19 00:00:00', '819', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31310', '2017061911', '11', '33356', '22', '2017-06-19 00:00:00', '149', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31311', '2017061910', '10', '33355', '22', '2017-06-19 00:00:00', '689', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31312', '201706199', '9', '33354', '22', '2017-06-19 00:00:00', '168', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31313', '201706198', '8', '33353', '22', '2017-06-19 00:00:00', '160', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31314', '201706197', '7', '33352', '22', '2017-06-19 00:00:00', '970', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31315', '201706196', '6', '33351', '22', '2017-06-19 00:00:00', '661', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31316', '201706195', '5', '33350', '22', '2017-06-19 00:00:00', '120', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31317', '201706194', '4', '33349', '22', '2017-06-19 00:00:00', '335', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31318', '201706193', '3', '33348', '22', '2017-06-19 00:00:00', '102', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31319', '201706192', '2', '33347', '22', '2017-06-19 00:00:00', '104', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31320', '201706191', '1', '33346', '22', '2017-06-19 00:00:00', '899', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31321', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '754', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31322', '20170620119', '119', '33464', '22', '2017-06-20 00:00:00', '666', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31323', '20170620118', '118', '33463', '22', '2017-06-20 00:00:00', '903', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31324', '20170620117', '117', '33462', '22', '2017-06-20 00:00:00', '903', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31325', '20170620116', '116', '33461', '22', '2017-06-20 00:00:00', '378', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31326', '20170620115', '115', '33460', '22', '2017-06-20 00:00:00', '835', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31327', '20170620114', '114', '33459', '22', '2017-06-20 00:00:00', '891', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31328', '20170620113', '113', '33458', '22', '2017-06-20 00:00:00', '779', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31329', '20170620112', '112', '33457', '22', '2017-06-20 00:00:00', '414', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31330', '20170620111', '111', '33456', '22', '2017-06-20 00:00:00', '130', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31331', '20170620110', '110', '33455', '22', '2017-06-20 00:00:00', '153', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31332', '20170620109', '109', '33454', '22', '2017-06-20 00:00:00', '724', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31333', '20170620108', '108', '33453', '22', '2017-06-20 00:00:00', '723', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31334', '20170620107', '107', '33452', '22', '2017-06-20 00:00:00', '323', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31335', '20170620106', '106', '33451', '22', '2017-06-20 00:00:00', '123', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31336', '20170620105', '105', '33450', '22', '2017-06-20 00:00:00', '484', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31337', '20170620104', '104', '33449', '22', '2017-06-20 00:00:00', '714', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31338', '20170620103', '103', '33448', '22', '2017-06-20 00:00:00', '936', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31339', '20170620102', '102', '33447', '22', '2017-06-20 00:00:00', '887', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31340', '20170620101', '101', '33446', '22', '2017-06-20 00:00:00', '256', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31341', '20170620100', '100', '33445', '22', '2017-06-20 00:00:00', '245', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31342', '2017062099', '99', '33444', '22', '2017-06-20 00:00:00', '141', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31343', '2017062098', '98', '33443', '22', '2017-06-20 00:00:00', '277', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31344', '2017062097', '97', '33442', '22', '2017-06-20 00:00:00', '687', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31345', '2017062096', '96', '33441', '22', '2017-06-20 00:00:00', '528', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31346', '2017062095', '95', '33440', '22', '2017-06-20 00:00:00', '161', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31347', '2017062094', '94', '33439', '22', '2017-06-20 00:00:00', '179', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31348', '2017062093', '93', '33438', '22', '2017-06-20 00:00:00', '175', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31349', '2017062092', '92', '33437', '22', '2017-06-20 00:00:00', '520', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31350', '2017062091', '91', '33436', '22', '2017-06-20 00:00:00', '966', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31351', '2017062090', '90', '33435', '22', '2017-06-20 00:00:00', '227', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31352', '2017062089', '89', '33434', '22', '2017-06-20 00:00:00', '265', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31353', '2017062088', '88', '33433', '22', '2017-06-20 00:00:00', '532', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31354', '2017062087', '87', '33432', '22', '2017-06-20 00:00:00', '278', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31355', '2017062086', '86', '33431', '22', '2017-06-20 00:00:00', '505', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31356', '2017062085', '85', '33430', '22', '2017-06-20 00:00:00', '256', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31357', '2017062084', '84', '33429', '22', '2017-06-20 00:00:00', '422', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31358', '2017062083', '83', '33428', '22', '2017-06-20 00:00:00', '770', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31359', '2017062082', '82', '33427', '22', '2017-06-20 00:00:00', '647', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31360', '2017062081', '81', '33426', '22', '2017-06-20 00:00:00', '792', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31361', '2017062080', '80', '33425', '22', '2017-06-20 00:00:00', '501', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31362', '2017062079', '79', '33424', '22', '2017-06-20 00:00:00', '164', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31363', '2017062078', '78', '33423', '22', '2017-06-20 00:00:00', '739', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31364', '2017062077', '77', '33422', '22', '2017-06-20 00:00:00', '273', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31365', '2017062076', '76', '33421', '22', '2017-06-20 00:00:00', '627', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31366', '2017062075', '75', '33420', '22', '2017-06-20 00:00:00', '230', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31367', '2017062074', '74', '33419', '22', '2017-06-20 00:00:00', '414', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31368', '2017062073', '73', '33418', '22', '2017-06-20 00:00:00', '244', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31369', '2017062072', '72', '33417', '22', '2017-06-20 00:00:00', '210', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31370', '2017062071', '71', '33416', '22', '2017-06-20 00:00:00', '492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31371', '2017062070', '70', '33415', '22', '2017-06-20 00:00:00', '657', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31372', '2017062069', '69', '33414', '22', '2017-06-20 00:00:00', '902', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31373', '2017062068', '68', '33413', '22', '2017-06-20 00:00:00', '909', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31374', '2017062067', '67', '33412', '22', '2017-06-20 00:00:00', '921', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31375', '2017062066', '66', '33411', '22', '2017-06-20 00:00:00', '202', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31376', '2017062065', '65', '33410', '22', '2017-06-20 00:00:00', '194', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31377', '2017062064', '64', '33409', '22', '2017-06-20 00:00:00', '334', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31378', '2017062063', '63', '33408', '22', '2017-06-20 00:00:00', '139', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31379', '2017062062', '62', '33407', '22', '2017-06-20 00:00:00', '934', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31380', '2017062061', '61', '33406', '22', '2017-06-20 00:00:00', '118', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31381', '2017062060', '60', '33405', '22', '2017-06-20 00:00:00', '143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31382', '2017062059', '59', '33404', '22', '2017-06-20 00:00:00', '817', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31383', '2017062058', '58', '33403', '22', '2017-06-20 00:00:00', '686', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31384', '2017062057', '57', '33402', '22', '2017-06-20 00:00:00', '419', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31385', '2017062056', '56', '33401', '22', '2017-06-20 00:00:00', '647', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31386', '2017062055', '55', '33400', '22', '2017-06-20 00:00:00', '678', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31387', '2017062054', '54', '33399', '22', '2017-06-20 00:00:00', '444', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31388', '2017062053', '53', '33398', '22', '2017-06-20 00:00:00', '395', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31389', '2017062052', '52', '33397', '22', '2017-06-20 00:00:00', '805', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31390', '2017062051', '51', '33396', '22', '2017-06-20 00:00:00', '594', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31391', '2017062050', '50', '33395', '22', '2017-06-20 00:00:00', '741', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31392', '2017062049', '49', '33394', '22', '2017-06-20 00:00:00', '693', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31393', '2017062048', '48', '33393', '22', '2017-06-20 00:00:00', '926', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31394', '2017062047', '47', '33392', '22', '2017-06-20 00:00:00', '986', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31395', '2017062046', '46', '33391', '22', '2017-06-20 00:00:00', '763', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31396', '2017062045', '45', '33390', '22', '2017-06-20 00:00:00', '610', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31397', '2017062044', '44', '33389', '22', '2017-06-20 00:00:00', '869', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31398', '2017062043', '43', '33388', '22', '2017-06-20 00:00:00', '926', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31399', '2017062042', '42', '33387', '22', '2017-06-20 00:00:00', '143', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31400', '2017062041', '41', '33386', '22', '2017-06-20 00:00:00', '791', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31401', '2017062040', '40', '33385', '22', '2017-06-20 00:00:00', '944', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31402', '2017062039', '39', '33384', '22', '2017-06-20 00:00:00', '836', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31403', '2017062038', '38', '33383', '22', '2017-06-20 00:00:00', '765', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31404', '2017062037', '37', '33382', '22', '2017-06-20 00:00:00', '536', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31405', '2017062036', '36', '33381', '22', '2017-06-20 00:00:00', '110', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31406', '2017062035', '35', '33380', '22', '2017-06-20 00:00:00', '688', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31407', '2017062034', '34', '33379', '22', '2017-06-20 00:00:00', '465', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31408', '2017062033', '33', '33378', '22', '2017-06-20 00:00:00', '489', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31409', '2017062032', '32', '33377', '22', '2017-06-20 00:00:00', '477', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31410', '2017062031', '31', '33376', '22', '2017-06-20 00:00:00', '904', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31411', '2017062030', '30', '33375', '22', '2017-06-20 00:00:00', '226', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31412', '2017062029', '29', '33374', '22', '2017-06-20 00:00:00', '848', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31413', '2017062028', '28', '33373', '22', '2017-06-20 00:00:00', '104', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31414', '2017062027', '27', '33372', '22', '2017-06-20 00:00:00', '556', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31415', '2017062026', '26', '33371', '22', '2017-06-20 00:00:00', '584', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31416', '2017062025', '25', '33370', '22', '2017-06-20 00:00:00', '460', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31417', '2017062024', '24', '33369', '22', '2017-06-20 00:00:00', '200', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31418', '2017062023', '23', '33368', '22', '2017-06-20 00:00:00', '966', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31419', '2017062022', '22', '33367', '22', '2017-06-20 00:00:00', '721', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31420', '2017062021', '21', '33366', '22', '2017-06-20 00:00:00', '423', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31421', '2017062020', '20', '33365', '22', '2017-06-20 00:00:00', '625', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31422', '2017062019', '19', '33364', '22', '2017-06-20 00:00:00', '305', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31423', '2017062018', '18', '33363', '22', '2017-06-20 00:00:00', '273', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31424', '2017062017', '17', '33362', '22', '2017-06-20 00:00:00', '481', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31425', '2017062016', '16', '33361', '22', '2017-06-20 00:00:00', '788', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31426', '2017062015', '15', '33360', '22', '2017-06-20 00:00:00', '795', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31427', '2017062014', '14', '33359', '22', '2017-06-20 00:00:00', '224', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31428', '2017062013', '13', '33358', '22', '2017-06-20 00:00:00', '834', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31429', '2017062012', '12', '33357', '22', '2017-06-20 00:00:00', '548', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31430', '2017062011', '11', '33356', '22', '2017-06-20 00:00:00', '608', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31431', '2017062010', '10', '33355', '22', '2017-06-20 00:00:00', '209', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31432', '201706209', '9', '33354', '22', '2017-06-20 00:00:00', '326', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31433', '201706208', '8', '33353', '22', '2017-06-20 00:00:00', '215', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31434', '201706207', '7', '33352', '22', '2017-06-20 00:00:00', '167', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31435', '201706206', '6', '33351', '22', '2017-06-20 00:00:00', '311', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31436', '201706205', '5', '33350', '22', '2017-06-20 00:00:00', '957', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31437', '201706204', '4', '33349', '22', '2017-06-20 00:00:00', '549', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31438', '201706203', '3', '33348', '22', '2017-06-20 00:00:00', '343', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31439', '201706202', '2', '33347', '22', '2017-06-20 00:00:00', '165', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31440', '201706201', '1', '33346', '22', '2017-06-20 00:00:00', '671', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31441', '20170615120', '120', '33465', '22', '2017-06-15 00:00:00', '958', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31442', '20170621119', '119', '33464', '22', '2017-06-21 00:00:00', '657', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31443', '20170621118', '118', '33463', '22', '2017-06-21 00:00:00', '756', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31444', '20170621117', '117', '33462', '22', '2017-06-21 00:00:00', '566', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31445', '20170621116', '116', '33461', '22', '2017-06-21 00:00:00', '402', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31446', '20170621115', '115', '33460', '22', '2017-06-21 00:00:00', '183', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31447', '20170621114', '114', '33459', '22', '2017-06-21 00:00:00', '818', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31448', '20170621113', '113', '33458', '22', '2017-06-21 00:00:00', '389', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31449', '20170621112', '112', '33457', '22', '2017-06-21 00:00:00', '990', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31450', '20170621111', '111', '33456', '22', '2017-06-21 00:00:00', '240', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31451', '20170621110', '110', '33455', '22', '2017-06-21 00:00:00', '435', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31452', '20170621109', '109', '33454', '22', '2017-06-21 00:00:00', '337', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31453', '20170621108', '108', '33453', '22', '2017-06-21 00:00:00', '782', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31454', '20170621107', '107', '33452', '22', '2017-06-21 00:00:00', '803', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31455', '20170621106', '106', '33451', '22', '2017-06-21 00:00:00', '142', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31456', '20170621105', '105', '33450', '22', '2017-06-21 00:00:00', '157', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31457', '20170621104', '104', '33449', '22', '2017-06-21 00:00:00', '987', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31458', '20170621103', '103', '33448', '22', '2017-06-21 00:00:00', '492', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31459', '20170621102', '102', '33447', '22', '2017-06-21 00:00:00', '923', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31460', '20170621101', '101', '33446', '22', '2017-06-21 00:00:00', '945', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31461', '20170621100', '100', '33445', '22', '2017-06-21 00:00:00', '565', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31462', '2017062199', '99', '33444', '22', '2017-06-21 00:00:00', '179', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31463', '2017062198', '98', '33443', '22', '2017-06-21 00:00:00', '612', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31464', '2017062197', '97', '33442', '22', '2017-06-21 00:00:00', '649', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31465', '2017062196', '96', '33441', '22', '2017-06-21 00:00:00', '724', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31466', '2017062195', '95', '33440', '22', '2017-06-21 00:00:00', '286', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31467', '2017062194', '94', '33439', '22', '2017-06-21 00:00:00', '194', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31468', '2017062193', '93', '33438', '22', '2017-06-21 00:00:00', '365', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31469', '2017062192', '92', '33437', '22', '2017-06-21 00:00:00', '425', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31470', '2017062191', '91', '33436', '22', '2017-06-21 00:00:00', '785', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31471', '2017062190', '90', '33435', '22', '2017-06-21 00:00:00', '203', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31472', '2017062189', '89', '33434', '22', '2017-06-21 00:00:00', '740', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31473', '2017062188', '88', '33433', '22', '2017-06-21 00:00:00', '876', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31474', '2017062187', '87', '33432', '22', '2017-06-21 00:00:00', '298', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31475', '2017062186', '86', '33431', '22', '2017-06-21 00:00:00', '724', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31476', '2017062185', '85', '33430', '22', '2017-06-21 00:00:00', '171', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31477', '2017062184', '84', '33429', '22', '2017-06-21 00:00:00', '137', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31478', '2017062183', '83', '33428', '22', '2017-06-21 00:00:00', '597', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31479', '2017062182', '82', '33427', '22', '2017-06-21 00:00:00', '490', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31480', '2017062181', '81', '33426', '22', '2017-06-21 00:00:00', '206', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31481', '2017062180', '80', '33425', '22', '2017-06-21 00:00:00', '318', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31482', '2017062179', '79', '33424', '22', '2017-06-21 00:00:00', '303', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31483', '2017062178', '78', '33423', '22', '2017-06-21 00:00:00', '487', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31484', '2017062177', '77', '33422', '22', '2017-06-21 00:00:00', '140', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31485', '2017062176', '76', '33421', '22', '2017-06-21 00:00:00', '377', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31486', '2017062175', '75', '33420', '22', '2017-06-21 00:00:00', '289', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31487', '2017062174', '74', '33419', '22', '2017-06-21 00:00:00', '349', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31488', '2017062173', '73', '33418', '22', '2017-06-21 00:00:00', '620', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31489', '2017062172', '72', '33417', '22', '2017-06-21 00:00:00', '624', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31490', '2017062171', '71', '33416', '22', '2017-06-21 00:00:00', '976', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31491', '2017062170', '70', '33415', '22', '2017-06-21 00:00:00', '159', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31492', '2017062169', '69', '33414', '22', '2017-06-21 00:00:00', '944', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31493', '2017062168', '68', '33413', '22', '2017-06-21 00:00:00', '919', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31494', '2017062167', '67', '33412', '22', '2017-06-21 00:00:00', '536', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31495', '2017062166', '66', '33411', '22', '2017-06-21 00:00:00', '453', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31496', '2017062165', '65', '33410', '22', '2017-06-21 00:00:00', '859', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31497', '2017062164', '64', '33409', '22', '2017-06-21 00:00:00', '670', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31498', '2017062163', '63', '33408', '22', '2017-06-21 00:00:00', '292', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31499', '2017062162', '62', '33407', '22', '2017-06-21 00:00:00', '415', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31500', '2017062161', '61', '33406', '22', '2017-06-21 00:00:00', '561', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31501', '2017062160', '60', '33405', '22', '2017-06-21 00:00:00', '638', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31502', '2017062159', '59', '33404', '22', '2017-06-21 00:00:00', '214', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31503', '2017062158', '58', '33403', '22', '2017-06-21 00:00:00', '578', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31504', '2017062157', '57', '33402', '22', '2017-06-21 00:00:00', '697', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31505', '2017062156', '56', '33401', '22', '2017-06-21 00:00:00', '232', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31506', '2017062155', '55', '33400', '22', '2017-06-21 00:00:00', '726', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31507', '2017062154', '54', '33399', '22', '2017-06-21 00:00:00', '129', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31508', '2017062153', '53', '33398', '22', '2017-06-21 00:00:00', '564', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31509', '2017062152', '52', '33397', '22', '2017-06-21 00:00:00', '210', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31510', '2017062151', '51', '33396', '22', '2017-06-21 00:00:00', '898', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31511', '2017062150', '50', '33395', '22', '2017-06-21 00:00:00', '500', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31512', '2017062149', '49', '33394', '22', '2017-06-21 00:00:00', '809', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31513', '2017062148', '48', '33393', '22', '2017-06-21 00:00:00', '883', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31514', '2017062147', '47', '33392', '22', '2017-06-21 00:00:00', '253', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31515', '2017062146', '46', '33391', '22', '2017-06-21 00:00:00', '877', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31516', '2017062145', '45', '33390', '22', '2017-06-21 00:00:00', '729', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31517', '2017062144', '44', '33389', '22', '2017-06-21 00:00:00', '309', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31518', '2017062143', '43', '33388', '22', '2017-06-21 00:00:00', '562', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31519', '2017062142', '42', '33387', '22', '2017-06-21 00:00:00', '893', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31520', '2017062141', '41', '33386', '22', '2017-06-21 00:00:00', '971', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31521', '2017062140', '40', '33385', '22', '2017-06-21 00:00:00', '599', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31522', '2017062139', '39', '33384', '22', '2017-06-21 00:00:00', '448', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31523', '2017062138', '38', '33383', '22', '2017-06-21 00:00:00', '633', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31524', '2017062137', '37', '33382', '22', '2017-06-21 00:00:00', '831', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31525', '2017062136', '36', '33381', '22', '2017-06-21 00:00:00', '711', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31526', '2017062135', '35', '33380', '22', '2017-06-21 00:00:00', '782', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31527', '2017062134', '34', '33379', '22', '2017-06-21 00:00:00', '631', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31528', '2017062133', '33', '33378', '22', '2017-06-21 00:00:00', '957', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31529', '2017062132', '32', '33377', '22', '2017-06-21 00:00:00', '954', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31530', '2017062131', '31', '33376', '22', '2017-06-21 00:00:00', '186', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31531', '2017062130', '30', '33375', '22', '2017-06-21 00:00:00', '973', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31532', '2017062129', '29', '33374', '22', '2017-06-21 00:00:00', '645', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31533', '2017062128', '28', '33373', '22', '2017-06-21 00:00:00', '289', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31534', '2017062127', '27', '33372', '22', '2017-06-21 00:00:00', '432', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31535', '2017062126', '26', '33371', '22', '2017-06-21 00:00:00', '391', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31536', '2017062125', '25', '33370', '22', '2017-06-21 00:00:00', '542', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31537', '2017062124', '24', '33369', '22', '2017-06-21 00:00:00', '825', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31538', '2017062123', '23', '33368', '22', '2017-06-21 00:00:00', '141', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31539', '2017062122', '22', '33367', '22', '2017-06-21 00:00:00', '771', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31540', '2017062121', '21', '33366', '22', '2017-06-21 00:00:00', '845', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31541', '2017062120', '20', '33365', '22', '2017-06-21 00:00:00', '620', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31542', '2017062119', '19', '33364', '22', '2017-06-21 00:00:00', '187', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31543', '2017062118', '18', '33363', '22', '2017-06-21 00:00:00', '847', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31544', '2017062117', '17', '33362', '22', '2017-06-21 00:00:00', '401', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31545', '2017062116', '16', '33361', '22', '2017-06-21 00:00:00', '885', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31546', '2017062115', '15', '33360', '22', '2017-06-21 00:00:00', '990', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31547', '2017062114', '14', '33359', '22', '2017-06-21 00:00:00', '703', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31548', '2017062113', '13', '33358', '22', '2017-06-21 00:00:00', '307', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31549', '2017062112', '12', '33357', '22', '2017-06-21 00:00:00', '579', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31550', '2017062111', '11', '33356', '22', '2017-06-21 00:00:00', '723', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31551', '2017062110', '10', '33355', '22', '2017-06-21 00:00:00', '874', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31552', '201706219', '9', '33354', '22', '2017-06-21 00:00:00', '309', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31553', '201706218', '8', '33353', '22', '2017-06-21 00:00:00', '911', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31554', '201706217', '7', '33352', '22', '2017-06-21 00:00:00', '707', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31555', '201706216', '6', '33351', '22', '2017-06-21 00:00:00', '544', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31556', '201706215', '5', '33350', '22', '2017-06-21 00:00:00', '605', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31557', '201706214', '4', '33349', '22', '2017-06-21 00:00:00', '840', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31558', '201706213', '3', '33348', '22', '2017-06-21 00:00:00', '914', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31559', '201706212', '2', '33347', '22', '2017-06-21 00:00:00', '247', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `autumn_lottery_data` VALUES ('31560', '201706211', '1', '33346', '22', '2017-06-21 00:00:00', '942', '0', null, '0', '0', '0', '0', '0', '0', '0', '0', null);

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
INSERT INTO `autumn_lottery_time` VALUES ('33346', '1', '22', '00:08', '480');
INSERT INTO `autumn_lottery_time` VALUES ('33347', '2', '22', '00:10', '600');
INSERT INTO `autumn_lottery_time` VALUES ('33348', '3', '22', '00:15', '900');
INSERT INTO `autumn_lottery_time` VALUES ('33349', '4', '22', '00:20', '1200');
INSERT INTO `autumn_lottery_time` VALUES ('33350', '5', '22', '00:25', '1500');
INSERT INTO `autumn_lottery_time` VALUES ('33351', '6', '22', '00:30', '1800');
INSERT INTO `autumn_lottery_time` VALUES ('33352', '7', '22', '00:35', '2100');
INSERT INTO `autumn_lottery_time` VALUES ('33353', '8', '22', '00:40', '2400');
INSERT INTO `autumn_lottery_time` VALUES ('33354', '9', '22', '00:45', '2700');
INSERT INTO `autumn_lottery_time` VALUES ('33355', '10', '22', '00:50', '3000');
INSERT INTO `autumn_lottery_time` VALUES ('33356', '11', '22', '00:55', '3300');
INSERT INTO `autumn_lottery_time` VALUES ('33357', '12', '22', '01:00', '3600');
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
INSERT INTO `autumn_lottery_time` VALUES ('33465', '120', '22', '00:05', '300');

-- ----------------------------
-- Table structure for autumn_message
-- ----------------------------
DROP TABLE IF EXISTS `autumn_message`;
CREATE TABLE `autumn_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_message
-- ----------------------------
INSERT INTO `autumn_message` VALUES ('1', '4', '??????10?????', '2017-06-12 00:31:11', '1', '0', null);
INSERT INTO `autumn_message` VALUES ('2', '4', '您已成功消费90.006元购置彩票', '2017-06-12 00:38:56', '1', '0', null);
INSERT INTO `autumn_message` VALUES ('3', '4', '您已成功消费60元购置彩票', '2017-06-13 10:56:26', '1', '0', null);

-- ----------------------------
-- Table structure for autumn_recharge
-- ----------------------------
DROP TABLE IF EXISTS `autumn_recharge`;
CREATE TABLE `autumn_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `finishtime` datetime DEFAULT NULL,
  `money` double DEFAULT NULL,
  `out_time` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_recharge
-- ----------------------------
INSERT INTO `autumn_recharge` VALUES ('1', '1', 'C2017052201561', '2017-06-10 22:57:11', '1', null, '100', '0', '1', '0');

-- ----------------------------
-- Table structure for autumn_user
-- ----------------------------
DROP TABLE IF EXISTS `autumn_user`;
CREATE TABLE `autumn_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `salt` int(11) NOT NULL,
  `integral` int(11) DEFAULT '0',
  `cumulative_integral` int(11) DEFAULT '0',
  `exchange_integral` int(11) DEFAULT '0',
  `source` int(11) DEFAULT '0',
  `reg_time` datetime NOT NULL,
  `lost_login_time` datetime DEFAULT NULL,
  `reg_ip` varchar(15) NOT NULL DEFAULT '127.168.0.1',
  `money` double NOT NULL,
  `frozen_money` double DEFAULT '0',
  `rebate` double DEFAULT NULL,
  `betting` double DEFAULT '0',
  `profit_loss` double DEFAULT '0',
  `state` int(1) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_user
-- ----------------------------
INSERT INTO `autumn_user` VALUES ('3', '0', '321321321', '321321321', '8571e36e4e622295ecda8a624bcc57c7', '583453', '4', '0', '0', '0', '2017-06-11 09:46:54', null, 'localhost', '0', '0', '8', '0', '0', '0', '0');
INSERT INTO `autumn_user` VALUES ('4', '0', 'xiaodao', 'xiaodao', 'e326fa926e3a4c6675c9e5a6b4bf6f9d', '232357', '7', '0', '0', '0', '2017-06-11 11:48:51', null, 'localhost', '5.006', '2', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for autumn_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `autumn_withdrawals`;
CREATE TABLE `autumn_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `finishtime` datetime DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_withdrawals
-- ----------------------------
