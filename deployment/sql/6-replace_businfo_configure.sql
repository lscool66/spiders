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

 Date: 21/06/2022 21:29:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for replace_businfo_configure
-- ----------------------------
DROP TABLE IF EXISTS `replace_businfo_configure`;
CREATE TABLE `replace_businfo_configure`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `original_fromStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `original_toStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `original_fromTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `new_fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `new_fromStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `new_toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `new_toStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_used` int UNSIGNED NULL DEFAULT 1,
  `state` int UNSIGNED NULL DEFAULT 1 COMMENT '1 替换 0 删除',
  `used_for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of replace_businfo_configure
-- ----------------------------
INSERT INTO `replace_businfo_configure` VALUES (1, '淮安北站', '连云港', '10:00', NULL, NULL, NULL, '连云港苏欣快客汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (2, '淮安北站', '连云港', '14:00', NULL, NULL, NULL, '连云港新浦汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (3, '淮安汽车东站', '连云港', '08:30', NULL, NULL, NULL, '连云港苏欣快客汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (4, '嵊州客运中心', '宁波', '07:40', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (5, '嵊州客运中心', '宁波', '14:00', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (6, '嵊州客运中心', '宁波', '08:45', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (7, '嵊州客运中心', '绍兴', '11:45', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (8, '嵊州客运中心', '绍兴', '05:55', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (9, '嵊州客运中心', '绍兴', '08:10', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (10, '嵊州客运中心', '柯桥', '11:45', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (11, '嵊州客运中心', '柯桥', '05:55', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (12, '嵊州客运中心', '柯桥', '08:10', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (13, '嵊州客运中心', '杭州', '05:50', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (14, '嵊州客运中心', '杭州', '07:45', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (15, '嵊州客运中心', '杭州', '08:35', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (113, '新浦汽车总站', '楚州', '14:00', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (114, '苏欣快客汽车站', '楚州', '14:30', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (115, '宣城客运总站（龙川路）', '上海', '07:20', NULL, NULL, NULL, '上海沪太路汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (116, '宣城客运总站（龙川路）', '上海', '08:00', NULL, NULL, NULL, '川沙汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (117, '宣城客运总站（龙川路）', '上海', '10:00', NULL, NULL, NULL, '上海沪太路汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (118, '宣城客运总站（龙川路）', '上海', '12:40', NULL, NULL, NULL, '上海沪太路汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (119, '宣城客运总站（龙川路）', '上海', '13:10', NULL, NULL, NULL, '上海沪太路汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (120, '宣城客运总站（龙川路）', '上海', '14:50', NULL, NULL, NULL, '南汇汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (121, '宣城客运总站（龙川路）', '上海', '17:10', NULL, NULL, NULL, '川沙汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (123, '宣城客运总站（龙川路）', '苏州', '09:20', NULL, NULL, NULL, '苏州北广场汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (124, '宣城客运总站（龙川路）', '苏州', '14:00', NULL, NULL, NULL, '苏州汽车南站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (125, '天台中心站', '上海', '07:10', NULL, NULL, NULL, '长途客运南站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (126, '天台中心站', '上海', '10:00', NULL, NULL, NULL, '长途客运南站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (127, '天台中心站', '上海', '15:30', NULL, NULL, NULL, '沪太路客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (128, '天河汽车客运站', '兴宁', '09:10', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (129, '天河汽车客运站', '兴宁', '10:20', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (130, '天河汽车客运站', '兴宁', '11:50', NULL, NULL, NULL, '兴宁汽车总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (131, '天河汽车客运站', '兴宁', '13:00', NULL, NULL, NULL, '兴宁汽车总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (132, '天河汽车客运站', '兴宁', '13:50', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (133, '天河汽车客运站', '兴宁', '14:05', NULL, NULL, NULL, '兴宁汽车总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (134, '天河汽车客运站', '兴宁', '16:10', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (135, '天河汽车客运站', '兴宁', '17:20', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (136, '天河汽车客运站', '兴宁', '18:30', NULL, NULL, NULL, '兴宁东岳宫客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (137, '天河汽车客运站', '兴宁', '18:50', NULL, NULL, NULL, '兴宁汽车总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (138, '天河汽车客运站', '兴宁', '20:25', NULL, NULL, NULL, '兴宁汽车总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (139, '天河汽车客运站', '高州', '08:10', NULL, NULL, NULL, '高州市汽车客运总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (140, '天河汽车客运站', '高州', '09:30', NULL, NULL, NULL, '高州汽车客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (141, '天河汽车客运站', '高州', '11:10', NULL, NULL, NULL, '高州市汽车客运总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (142, '天河汽车客运站', '高州', '14:00', NULL, NULL, NULL, '高州市汽车客运总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (143, '天河汽车客运站', '高州', '17:00', NULL, NULL, NULL, '高州市汽车客运总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (144, '天河汽车客运站', '高州', '19:00', NULL, NULL, NULL, '高州汽车客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (145, '天河汽车客运站', '高州', '20:30', NULL, NULL, NULL, '高州市汽车客运总站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (147, '惠州汽车客运站', '东莞', '07:20', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (148, '惠州汽车客运站', '东莞', '07:20', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (149, '惠州汽车客运站', '东莞', '09:00', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (150, '惠州汽车客运站', '东莞', '09:00', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (151, '惠州汽车客运站', '东莞', '10:30', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (152, '惠州汽车客运站', '东莞', '10:30', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (153, '惠州汽车客运站', '东莞', '12:10', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (154, '惠州汽车客运站', '东莞', '12:10', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (155, '惠州汽车客运站', '东莞', '13:40', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (156, '惠州汽车客运站', '东莞', '13:40', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (157, '惠州汽车客运站', '东莞', '15:20', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (158, '惠州汽车客运站', '东莞', '15:20', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (159, '惠州汽车客运站', '东莞', '16:50', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (160, '惠州汽车客运站', '东莞', '16:50', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (161, '惠州汽车客运站', '东莞', '18:30', NULL, NULL, NULL, '东莞南城汽车站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (162, '惠州汽车客运站', '东莞', '18:30', NULL, NULL, NULL, '东莞东', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (163, '湛江南站客运站', '中山', '09:20', NULL, NULL, NULL, '中山市汽车客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (164, '湛江南站客运站', '中山', '10:50', NULL, NULL, NULL, '中山城南客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (165, '湛江南站客运站', '中山', '14:00', NULL, NULL, NULL, '中山城南客运站', 1, 1, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (166, '嵊州客运中心', '杭州', '12:45', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (167, '嵊州客运中心', '杭州', '13:35', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (168, '嵊州客运中心', '杭州', '14:55', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');
INSERT INTO `replace_businfo_configure` VALUES (169, '嵊州客运中心', '杭州', '17:50', NULL, NULL, NULL, NULL, 1, 0, 'xiecheng');

SET FOREIGN_KEY_CHECKS = 1;
