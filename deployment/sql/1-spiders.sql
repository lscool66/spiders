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

 Date: 21/06/2022 21:28:33
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
-- Table structure for _tos
-- ----------------------------
DROP TABLE IF EXISTS `_tos`;
CREATE TABLE `_tos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `state` int UNSIGNED NULL DEFAULT 1,
  `is_used` int UNSIGNED NULL DEFAULT 1,
  `url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11510 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bababus_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `bababus_batch_record`;
CREATE TABLE `bababus_batch_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bababus_data
-- ----------------------------
DROP TABLE IF EXISTS `bababus_data`;
CREATE TABLE `bababus_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `activityPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `allowTickets` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `beginStationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `beginStationName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `busCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `busId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `busStatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `busStatusValue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `busType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `circleRun` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dedicatedLine` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `destinationAreaAlias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `endLeaveTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `endStationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `endStationName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fullPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `halfPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isShowOverPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isWayStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `lastStationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `lastStationName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `leaveDate` date NULL DEFAULT NULL,
  `leaveTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mileTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mileage` int NULL DEFAULT NULL,
  `notAllowTicketsAlert` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `notAllowTicketsAlertTitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `notAllowTicketsMsg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remainChildSeat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remainSeat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `routeId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `routeName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sbId` int NULL DEFAULT NULL,
  `showLeaveTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `showMsg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stId` int NULL DEFAULT NULL,
  `startAreaId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `startAreaName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ticketFee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `vehicleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `vehicleMode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `vehicleType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `wayStationList` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75073 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bababus_depot_data
-- ----------------------------
DROP TABLE IF EXISTS `bababus_depot_data`;
CREATE TABLE `bababus_depot_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `accountId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `agentRateBuy` int NULL DEFAULT NULL,
  `allowHalfticket` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `allowHaschild` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `allowInsurance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `appDetailPicUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `appIndexPicUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `appPicUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `belongPlatformCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bookTimeLimit` int NULL DEFAULT NULL,
  `busInfo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `canCancelTicket` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `canReturnChangeAfter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `canSalePoll` int NULL DEFAULT NULL,
  `cancelScope` int NULL DEFAULT NULL,
  `cancelTimeLimit` int NULL DEFAULT NULL,
  `checkIdOnFlag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `companyId` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotContact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotLevel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `depotPhone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fetchTicketMode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fetchTicketServiceTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fetchTicketSpot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `hasChildDescription` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isActive` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isBarCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isDbarcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isDefaultInsurance` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isInvoice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isSaleTimeLimit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isServiceAmount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `keyWords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `netStatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nextdayLimittime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `orderChangeDescription` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `orderChangeRate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `orderChangeTime` int NULL DEFAULT NULL,
  `orderChangeTimeLimit` int NULL DEFAULT NULL,
  `otherParameter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pcDetailPicUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pcPicUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pinYinAll` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pinYinFirst` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `platformCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `presaleDays` int NULL DEFAULT NULL,
  `presaleEndDate` int NULL DEFAULT NULL,
  `presaleMode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `provinceStationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `refundRate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `serviceAmount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `servicePeriod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `speed` int NULL DEFAULT NULL,
  `startAreaId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `startAreaName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `startLandId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stationComm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stationConfig` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stationType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `times` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `workDate` int NULL DEFAULT NULL,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1418 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bus_ly_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `bus_ly_batch_record`;
CREATE TABLE `bus_ly_batch_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bus_ly_data
-- ----------------------------
DROP TABLE IF EXISTS `bus_ly_data`;
CREATE TABLE `bus_ly_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `scheduleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `scheduleNo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `coachType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `coachNo` int NULL DEFAULT NULL,
  `depId` int NULL DEFAULT NULL,
  `desId` int NULL DEFAULT NULL,
  `departure` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dptStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `arrStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dptDateTime` int NULL DEFAULT NULL,
  `dptDate` date NULL DEFAULT NULL,
  `dptTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `runningStartTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `runningEndTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ticketPrice` int NULL DEFAULT NULL,
  `studentPrice` int NULL DEFAULT NULL,
  `militaryPrice` int NULL DEFAULT NULL,
  `disabledMilitaryPrice` int NULL DEFAULT NULL,
  `elderPrice` int NULL DEFAULT NULL,
  `childPrice` int NULL DEFAULT NULL,
  `doubleTripPrice` int NULL DEFAULT NULL,
  `travelPrice` int NULL DEFAULT NULL,
  `canNotBookingType` int NULL DEFAULT NULL,
  `bookingDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `canBooking` int NULL DEFAULT NULL,
  `bookingType` int NULL DEFAULT NULL,
  `timePeriodType` int NULL DEFAULT NULL,
  `runTime` double NULL DEFAULT NULL,
  `runTimeDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `runTimeScope` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `distance` double NULL DEFAULT NULL,
  `runningSchFlag` int NULL DEFAULT NULL,
  `isPassingStation` int NULL DEFAULT NULL,
  `transferSchFlag` int NULL DEFAULT NULL,
  `fuZiSchFlag` int NULL DEFAULT NULL,
  `currDateTime` datetime NULL DEFAULT NULL,
  `dptStationInfo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ticketLeft` int NULL DEFAULT NULL,
  `scheduleTicketType` int NULL DEFAULT NULL,
  `scheduleTicketTypeDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount` int NULL DEFAULT NULL,
  `childDiscount` int NULL DEFAULT NULL,
  `studentDiscount` int NULL DEFAULT NULL,
  `elderDiscount` int NULL DEFAULT NULL,
  `scheduleName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fareType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `scheduleTipsDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `tagTips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `runThroughStationsInfo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mixProjectTag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `chartered` int NULL DEFAULT NULL,
  `suggestOrder` int NULL DEFAULT NULL,
  `ExtraSchFlag` int NULL DEFAULT NULL,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11448 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bus_spider_tasks
-- ----------------------------
DROP TABLE IF EXISTS `bus_spider_tasks`;
CREATE TABLE `bus_spider_tasks`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT 0,
  `used_for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 338794 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chebaba_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `chebaba_batch_record`;
CREATE TABLE `chebaba_batch_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chebaba_data
-- ----------------------------
DROP TABLE IF EXISTS `chebaba_data`;
CREATE TABLE `chebaba_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `coachType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'chebaba',
  `unitId` double NULL DEFAULT NULL COMMENT 'id',
  `coachNo` int NULL DEFAULT NULL,
  `coachId` int NULL DEFAULT NULL,
  `departure` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dptStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `arrStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isPassingStation` int NULL DEFAULT NULL,
  `dptDateTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dptDate` date NULL DEFAULT NULL,
  `dptTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ticketPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `childPrice` int NULL DEFAULT NULL,
  `ticketFee` double NULL DEFAULT NULL,
  `ticketLeft` int NULL DEFAULT NULL,
  `noBookType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `freeChildCount` int NULL DEFAULT NULL,
  `isSupportFreeChild` int NULL DEFAULT NULL,
  `canBooking` int NULL DEFAULT NULL,
  `dptStationCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `startStationCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `destStationCode` int NULL DEFAULT NULL,
  `runTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `distance` double NULL DEFAULT NULL,
  `runThrough` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `rebateRate` int NULL DEFAULT NULL,
  `isCustom` int NULL DEFAULT NULL,
  `dptStationAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isScrollCoach` int NULL DEFAULT NULL,
  `endOperationTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `passingStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isLocalSchedule` int NULL DEFAULT NULL,
  `lineName` int NULL DEFAULT NULL,
  `isRefundTicket` int NULL DEFAULT NULL,
  `refundTicketTime` int NULL DEFAULT NULL,
  `lineType` int NULL DEFAULT NULL,
  `isMultCertType` int NULL DEFAULT NULL,
  `isCheckCode` int NULL DEFAULT NULL,
  `supplierKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `supplierAliasKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `serviceFee` int NULL DEFAULT NULL,
  `isRealName` int NULL DEFAULT NULL,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170962 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_params
-- ----------------------------
DROP TABLE IF EXISTS `data_params`;
CREATE TABLE `data_params`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `symbol` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `busNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromDate` date NULL DEFAULT NULL,
  `fromTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fullPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `utmSource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `hashkey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `return_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_count` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_stop_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_start_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_end_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `data_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `begin_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `end_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `shift_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `serviceFee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  `is_used` int UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16628130 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for insert_businfo_configure
-- ----------------------------
DROP TABLE IF EXISTS `insert_businfo_configure`;
CREATE TABLE `insert_businfo_configure`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `symbol` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `busNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromDate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fullPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `utmSource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `hashkey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `return_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_count` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_stop_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_start_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_end_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `data_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `begin_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `end_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `shift_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `serviceFee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `is_used` int UNSIGNED NOT NULL DEFAULT 1,
  `used_for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48040 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for spider_xiecheng_bus_list
-- ----------------------------
DROP TABLE IF EXISTS `spider_xiecheng_bus_list`;
CREATE TABLE `spider_xiecheng_bus_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `_date` date NULL DEFAULT NULL,
  `_from` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `_to` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `page` int NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `data_params` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `gtime` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8037946 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tocitys
-- ----------------------------
DROP TABLE IF EXISTS `tocitys`;
CREATE TABLE `tocitys`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_used` int UNSIGNED NOT NULL DEFAULT 1,
  `used_for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng',
  `gtime` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16580 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiecheng_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `xiecheng_batch_record`;
CREATE TABLE `xiecheng_batch_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiecheng_batch_record_1
-- ----------------------------
DROP TABLE IF EXISTS `xiecheng_batch_record_1`;
CREATE TABLE `xiecheng_batch_record_1`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiecheng_batch_record_2
-- ----------------------------
DROP TABLE IF EXISTS `xiecheng_batch_record_2`;
CREATE TABLE `xiecheng_batch_record_2`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `batch_date` date NULL DEFAULT NULL COMMENT '批次时间',
  `total_count` int NULL DEFAULT NULL COMMENT '任务总数',
  `done_count` int NULL DEFAULT NULL COMMENT '完成数 (1,-1)',
  `fail_count` int NULL DEFAULT NULL COMMENT '失败任务数 (-1)',
  `interval` float NULL DEFAULT NULL COMMENT '批次间隔',
  `interval_unit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '批次间隔单位 day, hour',
  `create_time` datetime NULL DEFAULT current_timestamp COMMENT '批次开始时间',
  `update_time` datetime NULL DEFAULT current_timestamp COMMENT '本条记录更新时间',
  `is_done` int NULL DEFAULT 0 COMMENT '批次是否完成 0 未完成  1 完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiecheng_data
-- ----------------------------
DROP TABLE IF EXISTS `xiecheng_data`;
CREATE TABLE `xiecheng_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id 自动递增',
  `symbol` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toCity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `toStation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `busNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fromDate` date NULL DEFAULT NULL,
  `fromTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fullPrice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `utmSource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `hashkey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `return_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_count` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `discount_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_stop_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_start_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active_end_dttm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor_activity_flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vendor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `data_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `begin_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `end_service_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `shift_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `serviceFee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `gtime` datetime NULL DEFAULT current_timestamp COMMENT '抓取时间',
  `is_used` int UNSIGNED NULL DEFAULT 1,
  `data_from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'xiecheng',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1229977 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xiecheng_data_record
-- ----------------------------
DROP TABLE IF EXISTS `xiecheng_data_record`;
CREATE TABLE `xiecheng_data_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `_date` date NULL DEFAULT NULL,
  `_from` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `_to` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `page` int NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `railway_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `start` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `end` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bus_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dis_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `base_full_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data_params` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gtime` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1779805 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
