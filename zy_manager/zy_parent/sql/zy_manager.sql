/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : zy_manager

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-20 18:46:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
