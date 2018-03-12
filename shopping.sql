/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-12 16:25:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`,`time`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '2', '2018-01-30 20-05-01', '');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `key_word` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `sales` int(11) DEFAULT '0' COMMENT '卖出数量',
  `counts` int(11) NOT NULL COMMENT '总数量',
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sales` (`sales`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('2', '倚天剑', 'aaa', 'bbb', '199', '0', '195', '5');
INSERT INTO `products` VALUES ('5', '足球', '666', '777', '199', '1', '48', '7');
INSERT INTO `products` VALUES ('6', '羽绒服', '确实ting厚', '很暖和', '799', '1', '570', '1');
INSERT INTO `products` VALUES ('7', '牙刷', '刷刷刷', '刷牙、洗漱用品', '23', '0', '1000', '5');

-- ----------------------------
-- Table structure for shopping_car
-- ----------------------------
DROP TABLE IF EXISTS `shopping_car`;
CREATE TABLE `shopping_car` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shopping_car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_car_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_car
-- ----------------------------
INSERT INTO `shopping_car` VALUES ('2', '2', '199', '1');
INSERT INTO `shopping_car` VALUES ('5', '2', '199', '1');

-- ----------------------------
-- Table structure for shopping_record
-- ----------------------------
DROP TABLE IF EXISTS `shopping_record`;
CREATE TABLE `shopping_record` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`,`time`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shopping_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_record
-- ----------------------------
INSERT INTO `shopping_record` VALUES ('5', '5', '2018-02-22 13-53-28', '0', '199', '1');
INSERT INTO `shopping_record` VALUES ('5', '6', '2018-02-22 13-39-19', '0', '799', '1');

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `post_number` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `register_time` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_main` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES ('1', '5fb37d5bbdbbae16dea2f3104d7f9439', '183', '0', '1994', '256300', 'sds', '2018-01-27 17:01:27');
INSERT INTO `user_detail` VALUES ('2', '981c57a5cfb0f868e064904b8745766f', '163', '0', '1993', '256300', 'sss', '2018-01-27 17:01:27');
INSERT INTO `user_detail` VALUES ('5', '37254660e226ea65ce6f1efd54233424', '789789', '0', '11', '11', '12', '2018-02-22 15:02:03');

-- ----------------------------
-- Table structure for user_main
-- ----------------------------
DROP TABLE IF EXISTS `user_main`;
CREATE TABLE `user_main` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nick_name` varchar(30) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_main
-- ----------------------------
INSERT INTO `user_main` VALUES ('1', 'wyl', '1548178737@qq.com', 'wyl', '0');
INSERT INTO `user_main` VALUES ('2', 'seller', 'xxx', 'seller', '1');
INSERT INTO `user_main` VALUES ('5', 'buyer', '123456', 'buyer', '0');
