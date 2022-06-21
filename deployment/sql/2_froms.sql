/*
 Navicat Premium Data Transfer

 Source Server         : 212.129.238.23
 Source Server Type    : MySQL
 Source Server Version : 100605
 Source Host           : 212.129.238.23:3306
 Source Schema         : spiders

 Target Server Type    : MySQL
 Target Server Version : 100605
 File Encoding         : 65001

 Date: 21/06/2022 21:29:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _froms
-- ----------------------------
DROP TABLE IF EXISTS `_froms`;
CREATE TABLE `_froms`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `is_used` int UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _froms
-- ----------------------------
INSERT INTO `_froms` VALUES (6, '宁海', NULL, 1);
INSERT INTO `_froms` VALUES (7, '芜湖', NULL, 1);
INSERT INTO `_froms` VALUES (8, '嵊州', NULL, 1);
INSERT INTO `_froms` VALUES (9, '临安', NULL, 1);
INSERT INTO `_froms` VALUES (10, '蚌埠', NULL, 0);
INSERT INTO `_froms` VALUES (11, '上海', NULL, 1);
INSERT INTO `_froms` VALUES (12, '金湖', NULL, 1);
INSERT INTO `_froms` VALUES (13, '盱眙', NULL, 1);
INSERT INTO `_froms` VALUES (14, '东阳', NULL, 1);
INSERT INTO `_froms` VALUES (15, '潘集', NULL, 0);
INSERT INTO `_froms` VALUES (16, '演示', NULL, 0);
INSERT INTO `_froms` VALUES (17, '云和', NULL, 1);
INSERT INTO `_froms` VALUES (18, '亳州', NULL, 1);
INSERT INTO `_froms` VALUES (19, '义乌', NULL, 1);
INSERT INTO `_froms` VALUES (20, '天台', NULL, 0);
INSERT INTO `_froms` VALUES (21, '温岭', NULL, 1);
INSERT INTO `_froms` VALUES (22, '南京', NULL, 1);
INSERT INTO `_froms` VALUES (23, '慈溪', NULL, 1);
INSERT INTO `_froms` VALUES (24, '安庆', NULL, 1);
INSERT INTO `_froms` VALUES (25, '六安', NULL, 1);
INSERT INTO `_froms` VALUES (26, '淮安', NULL, 1);
INSERT INTO `_froms` VALUES (27, '三门', NULL, 0);
INSERT INTO `_froms` VALUES (28, '铜陵', NULL, 0);
INSERT INTO `_froms` VALUES (29, '蔡家岗', NULL, 0);
INSERT INTO `_froms` VALUES (30, '连云港', NULL, 1);
INSERT INTO `_froms` VALUES (31, '凤台', NULL, 0);
INSERT INTO `_froms` VALUES (32, '路桥', NULL, 0);
INSERT INTO `_froms` VALUES (33, '永康', NULL, 1);
INSERT INTO `_froms` VALUES (34, '景宁', NULL, 0);
INSERT INTO `_froms` VALUES (35, '余姚', NULL, 1);
INSERT INTO `_froms` VALUES (36, '龙泉', NULL, 1);
INSERT INTO `_froms` VALUES (37, '扬州', NULL, 1);
INSERT INTO `_froms` VALUES (38, '仙居', NULL, 1);
INSERT INTO `_froms` VALUES (39, '淮南', NULL, 0);
INSERT INTO `_froms` VALUES (40, '靖江', NULL, 1);
INSERT INTO `_froms` VALUES (41, '桐庐', NULL, 1);
INSERT INTO `_froms` VALUES (42, '杭州', NULL, 1);
INSERT INTO `_froms` VALUES (43, '松阳', NULL, 1);
INSERT INTO `_froms` VALUES (44, '嘉兴', NULL, 1);
INSERT INTO `_froms` VALUES (45, '淮北', NULL, 1);
INSERT INTO `_froms` VALUES (46, '黎城', NULL, 1);
INSERT INTO `_froms` VALUES (47, '沈阳', NULL, 0);
INSERT INTO `_froms` VALUES (48, '绍兴', NULL, 0);
INSERT INTO `_froms` VALUES (49, '安吉', NULL, 1);
INSERT INTO `_froms` VALUES (50, '宣城', NULL, 0);
INSERT INTO `_froms` VALUES (51, '济南', NULL, 1);
INSERT INTO `_froms` VALUES (52, '虎门', NULL, 0);
INSERT INTO `_froms` VALUES (53, '东莞', NULL, 0);
INSERT INTO `_froms` VALUES (54, '温州', NULL, 0);
INSERT INTO `_froms` VALUES (55, '池州', NULL, 0);
INSERT INTO `_froms` VALUES (56, '黄山', NULL, 0);
INSERT INTO `_froms` VALUES (57, '湖州', NULL, 0);
INSERT INTO `_froms` VALUES (58, '天台', NULL, 0);
INSERT INTO `_froms` VALUES (59, '茂名', NULL, 0);
INSERT INTO `_froms` VALUES (60, '深圳', NULL, 0);
INSERT INTO `_froms` VALUES (61, '肇庆', NULL, 0);
INSERT INTO `_froms` VALUES (62, '云浮', NULL, 0);
INSERT INTO `_froms` VALUES (63, '中山', NULL, 0);
INSERT INTO `_froms` VALUES (64, '惠州', NULL, 0);
INSERT INTO `_froms` VALUES (65, '汕头', NULL, 0);
INSERT INTO `_froms` VALUES (66, '汕尾', NULL, 0);
INSERT INTO `_froms` VALUES (67, '广州天河', NULL, 0);
INSERT INTO `_froms` VALUES (68, '清远', NULL, 0);
INSERT INTO `_froms` VALUES (69, '阳江', NULL, 0);
INSERT INTO `_froms` VALUES (70, '湛江', NULL, 0);
INSERT INTO `_froms` VALUES (71, '象山', NULL, 0);
INSERT INTO `_froms` VALUES (72, '金华', NULL, 0);
INSERT INTO `_froms` VALUES (73, '定海', NULL, 0);
INSERT INTO `_froms` VALUES (74, '普陀', NULL, 0);
INSERT INTO `_froms` VALUES (75, '常州', NULL, 1);
INSERT INTO `_froms` VALUES (76, '昆山', NULL, 1);
INSERT INTO `_froms` VALUES (77, '南通', NULL, 1);
INSERT INTO `_froms` VALUES (78, '苏州', NULL, 1);
INSERT INTO `_froms` VALUES (79, '宿州', NULL, 0);
INSERT INTO `_froms` VALUES (80, '泰州', NULL, 1);
INSERT INTO `_froms` VALUES (81, '张家港', NULL, 1);
INSERT INTO `_froms` VALUES (82, '镇江', NULL, 1);
INSERT INTO `_froms` VALUES (83, '宿迁', NULL, 1);
INSERT INTO `_froms` VALUES (84, '潍坊', NULL, 1);
INSERT INTO `_froms` VALUES (85, '聊城', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
