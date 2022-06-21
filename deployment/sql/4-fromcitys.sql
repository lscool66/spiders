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

 Date: 21/06/2022 21:29:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fromcitys
-- ----------------------------
DROP TABLE IF EXISTS `fromcitys`;
CREATE TABLE `fromcitys`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '起始地',
  `is_used` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否在用',
  `used_for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng' COMMENT '用于哪个网站',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fromcitys
-- ----------------------------
INSERT INTO `fromcitys` VALUES (41, '宁海', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (42, '芜湖', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (43, '嵊州', 0, 'bababus', NULL);
INSERT INTO `fromcitys` VALUES (44, '临安', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (45, '蚌埠', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (46, '上海', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (47, '金湖', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (48, '盱眙', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (49, '东阳', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (50, '潘集', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (51, '云和', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (52, '亳州', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (53, '义乌', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (54, '天台', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (55, '温岭', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (56, '南京', 0, 'chebaba', NULL);
INSERT INTO `fromcitys` VALUES (57, '慈溪', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (58, '安庆', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (59, '六安', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (60, '淮安', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (61, '三门', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (62, '铜陵', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (63, '蔡家岗', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (64, '连云港', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (65, '凤台', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (66, '路桥', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (67, '永康', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (68, '景宁', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (69, '余姚', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (70, '龙泉', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (71, '扬州', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (72, '仙居', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (73, '淮南', 0, 'bababus', NULL);
INSERT INTO `fromcitys` VALUES (74, '靖江', 0, 'bababus', NULL);
INSERT INTO `fromcitys` VALUES (75, '桐庐', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (76, '杭州', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (77, '松阳', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (78, '嘉兴', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (79, '淮北', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (80, '黎城', 0, 'xiecheng', NULL);
INSERT INTO `fromcitys` VALUES (81, '沈阳', 0, 'xiecheng', '2021-06-21 11:25:19');
INSERT INTO `fromcitys` VALUES (82, '绍兴', 0, 'xiecheng', '2021-07-06 11:12:40');
INSERT INTO `fromcitys` VALUES (83, '安吉', 0, 'xiecheng', '2021-07-23 10:12:31');
INSERT INTO `fromcitys` VALUES (84, '宣城', 0, 'xiecheng', '2021-07-28 14:14:21');
INSERT INTO `fromcitys` VALUES (85, '池州', 0, 'xiecheng', '2021-09-07 10:04:42');
INSERT INTO `fromcitys` VALUES (86, '汕头', 0, 'xiecheng', '2021-09-09 10:32:06');
INSERT INTO `fromcitys` VALUES (87, '汕尾', 0, 'xiecheng', '2021-09-09 10:32:13');
INSERT INTO `fromcitys` VALUES (88, '清远', 0, 'xiecheng', '2021-09-09 10:32:19');
INSERT INTO `fromcitys` VALUES (89, '惠州', 0, 'xiecheng', '2021-09-09 10:32:24');
INSERT INTO `fromcitys` VALUES (90, '广州天河', 0, 'xiecheng', '2021-09-09 10:32:34');
INSERT INTO `fromcitys` VALUES (91, '虎门', 0, 'xiecheng', '2021-09-09 11:18:30');
INSERT INTO `fromcitys` VALUES (92, '阳江', 0, 'xiecheng', '2021-09-09 14:00:14');
INSERT INTO `fromcitys` VALUES (93, '湛江', 0, 'xiecheng', '2021-09-09 14:00:19');

SET FOREIGN_KEY_CHECKS = 1;
