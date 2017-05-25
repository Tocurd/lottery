/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : autumn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-19 18:11:08
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
INSERT INTO `autumn_admin_user` VALUES ('1', '超级管理员', '', 'admin123456', 'ae2f4f5052e0096ca325861f1c6b510e', '818038', '0', '1495155171', '127.168.0.1', '1495176065', '127.168.0.1', '', '1', '0');

-- ----------------------------
-- Table structure for autumn_game_rule
-- ----------------------------
DROP TABLE IF EXISTS `autumn_game_rule`;
CREATE TABLE `autumn_game_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of autumn_game_rule
-- ----------------------------
INSERT INTO `autumn_game_rule` VALUES ('51', '五星', null, null, null, null, '50', '1', null, '0', '0', '0', '0', '0', '2017-05-19 12:09:07');
INSERT INTO `autumn_game_rule` VALUES ('53', '三星', null, null, null, null, '50', '1', null, '0', '0', '0', '0', '0', '2017-05-19 12:09:20');

-- ----------------------------
-- Table structure for autumn_order
-- ----------------------------
DROP TABLE IF EXISTS `autumn_order`;
CREATE TABLE `autumn_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `fans_type` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_order
-- ----------------------------
INSERT INTO `autumn_order` VALUES ('1', '1', '0', '10', '1', '色粉', '2017-05-11 12:19:32', '0');

-- ----------------------------
-- Table structure for autumn_user
-- ----------------------------
DROP TABLE IF EXISTS `autumn_user`;
CREATE TABLE `autumn_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` int(11) NOT NULL,
  `reg_time` datetime NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `money` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of autumn_user
-- ----------------------------
