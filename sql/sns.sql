/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : sns

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/10/2019 21:28:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sns_chat
-- ----------------------------
DROP TABLE IF EXISTS `sns_chat`;
CREATE TABLE `sns_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `direction` bit(1) NOT NULL,
  `downloaded` bit(1) NOT NULL,
  `picture_height` double DEFAULT NULL,
  `picture_width` double DEFAULT NULL,
  `seq` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `chat_room_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo7ix3tps2e7htoh1f0n4uvjva` (`chat_room_id`),
  CONSTRAINT `FKo7ix3tps2e7htoh1f0n4uvjva` FOREIGN KEY (`chat_room_id`) REFERENCES `sns_chat_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_chat_room
-- ----------------------------
DROP TABLE IF EXISTS `sns_chat_room`;
CREATE TABLE `sns_chat_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chats` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_message` varchar(255) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `receiver_user_id` bigint(20) NOT NULL,
  `sender_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkhspg8uny7saykkefohhrumr5` (`receiver_user_id`),
  KEY `FKla72gway5gqxjnlogo3wef0aq` (`sender_user_id`),
  CONSTRAINT `FKkhspg8uny7saykkefohhrumr5` FOREIGN KEY (`receiver_user_id`) REFERENCES `sns_user` (`id`),
  CONSTRAINT `FKla72gway5gqxjnlogo3wef0aq` FOREIGN KEY (`sender_user_id`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_comment
-- ----------------------------
DROP TABLE IF EXISTS `sns_comment`;
CREATE TABLE `sns_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `commenter_user_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3k6h0ky6svid0hrauiucfv8vk` (`commenter_user_id`),
  KEY `FK221pw9l4wk5ctws4a2grcfrcd` (`user_id`),
  CONSTRAINT `FK221pw9l4wk5ctws4a2grcfrcd` FOREIGN KEY (`user_id`) REFERENCES `sns_post` (`id`),
  CONSTRAINT `FK3k6h0ky6svid0hrauiucfv8vk` FOREIGN KEY (`commenter_user_id`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_device
-- ----------------------------
DROP TABLE IF EXISTS `sns_device`;
CREATE TABLE `sns_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `os` tinyint(4) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `version` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmisqt55a57k82e29mxhvoi1ss` (`user_id`),
  CONSTRAINT `FKmisqt55a57k82e29mxhvoi1ss` FOREIGN KEY (`user_id`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_email
-- ----------------------------
DROP TABLE IF EXISTS `sns_email`;
CREATE TABLE `sns_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_facebook
-- ----------------------------
DROP TABLE IF EXISTS `sns_facebook`;
CREATE TABLE `sns_facebook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sns_favorite`;
CREATE TABLE `sns_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `mid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5gauyb87c5hs8964yk35i2hk` (`mid`),
  KEY `FKpn3r93jc58awhnvdjbtlchja2` (`uid`),
  CONSTRAINT `FKf5gauyb87c5hs8964yk35i2hk` FOREIGN KEY (`mid`) REFERENCES `sns_post` (`id`),
  CONSTRAINT `FKpn3r93jc58awhnvdjbtlchja2` FOREIGN KEY (`uid`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_friendship
-- ----------------------------
DROP TABLE IF EXISTS `sns_friendship`;
CREATE TABLE `sns_friendship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` bigint(20) NOT NULL,
  `user1_id` bigint(20) NOT NULL,
  `user2_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK51mlu2toksnd8a3nce61eywxk` (`user1_id`),
  KEY `FKaw8xg5r5yrvu1bkivvd0sb8t5` (`user2_id`),
  CONSTRAINT `FK51mlu2toksnd8a3nce61eywxk` FOREIGN KEY (`user1_id`) REFERENCES `sns_user` (`id`),
  CONSTRAINT `FKaw8xg5r5yrvu1bkivvd0sb8t5` FOREIGN KEY (`user2_id`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_post
-- ----------------------------
DROP TABLE IF EXISTS `sns_post`;
CREATE TABLE `sns_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `poster_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKilaxp838nsjrl3q3h2jkfk1rv` (`poster_user_id`),
  CONSTRAINT `FKilaxp838nsjrl3q3h2jkfk1rv` FOREIGN KEY (`poster_user_id`) REFERENCES `sns_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sns_user
-- ----------------------------
DROP TABLE IF EXISTS `sns_user`;
CREATE TABLE `sns_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` bigint(20) NOT NULL,
  `email_id` bigint(20) DEFAULT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4usval51wdoyj3duk2vdy3fae` (`email_id`),
  KEY `FKi61nau4ujmqgg6w33df8wovgl` (`facebook_id`),
  CONSTRAINT `FK4usval51wdoyj3duk2vdy3fae` FOREIGN KEY (`email_id`) REFERENCES `sns_email` (`id`),
  CONSTRAINT `FKi61nau4ujmqgg6w33df8wovgl` FOREIGN KEY (`facebook_id`) REFERENCES `sns_facebook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
