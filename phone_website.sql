/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : phone_website

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 02/12/2021 21:01:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin');
INSERT INTO `t_admin` VALUES (2, 'lisi', '123456');

-- ----------------------------
-- Table structure for t_bkinds
-- ----------------------------
DROP TABLE IF EXISTS `t_bkinds`;
CREATE TABLE `t_bkinds`  (
  `bkid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型编码',
  `bk_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型名称',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`bkid`) USING BTREE,
  INDEX `bkid`(`bkid`) USING BTREE,
  INDEX `bkid_2`(`bkid`) USING BTREE,
  INDEX `bkid_3`(`bkid`) USING BTREE,
  INDEX `bkid_4`(`bkid`) USING BTREE,
  INDEX `bkid_5`(`bkid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_bkinds
-- ----------------------------
INSERT INTO `t_bkinds` VALUES ('1001', '专升本培训', '2022年1月1日培训有优惠');
INSERT INTO `t_bkinds` VALUES ('1002', '英语培训', '便宜又实惠');
INSERT INTO `t_bkinds` VALUES ('1003', '驾校培训', '趁年轻，学驾校');

-- ----------------------------
-- Table structure for t_business
-- ----------------------------
DROP TABLE IF EXISTS `t_business`;
CREATE TABLE `t_business`  (
  `bid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务编码',
  `b_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `bkid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `bkid`(`bkid`) USING BTREE,
  CONSTRAINT `bkid` FOREIGN KEY (`bkid`) REFERENCES `t_bkinds` (`bkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_business
-- ----------------------------
INSERT INTO `t_business` VALUES ('20', '博文专升本', '1001', '博文专升本价格贵吗？');
INSERT INTO `t_business` VALUES ('21', '直通专升本', '1001', '现已被市检管查封');
INSERT INTO `t_business` VALUES ('22', '海洋专升本', '1001', '圆你一个大学梦');
INSERT INTO `t_business` VALUES ('23', '好英语培训', '1002', '英语顶呱呱');
INSERT INTO `t_business` VALUES ('24', '雅思英语培训', '1002', '报名有优惠');
INSERT INTO `t_business` VALUES ('25', '校园驾校', '1003', '校企合作');
INSERT INTO `t_business` VALUES ('26', '西南驾校', '1003', '坐标陈家桥轻轨站');

-- ----------------------------
-- Table structure for t_cus
-- ----------------------------
DROP TABLE IF EXISTS `t_cus`;
CREATE TABLE `t_cus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `bkid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `bid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_cus
-- ----------------------------
INSERT INTO `t_cus` VALUES (1, '张三', '0', '13212123344', '重庆市沙坪坝区陈家桥镇', '1002', '24');

SET FOREIGN_KEY_CHECKS = 1;
