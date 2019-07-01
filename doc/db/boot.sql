/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : boot

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/06/2019 10:06:39
*/
USE `boot`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '山东农信', NULL, '2018-01-22 19:00:23', '2018-09-13 01:46:29', '0', 0);
INSERT INTO `sys_dept` VALUES (2, '沙县国际', NULL, '2018-01-22 19:00:38', '2018-09-13 01:46:30', '0', 0);
INSERT INTO `sys_dept` VALUES (3, '潍坊农信', NULL, '2018-01-22 19:00:44', '2018-09-13 01:46:31', '0', 1);
INSERT INTO `sys_dept` VALUES (4, '高新农信', NULL, '2018-01-22 19:00:52', '2018-10-06 10:41:52', '0', 3);
INSERT INTO `sys_dept` VALUES (5, '院校农信', NULL, '2018-01-22 19:00:57', '2018-10-06 10:42:51', '0', 4);
INSERT INTO `sys_dept` VALUES (6, '潍院农信', NULL, '2018-01-22 19:01:06', '2019-01-09 10:58:18', '1', 5);
INSERT INTO `sys_dept` VALUES (7, '山东沙县', NULL, '2018-01-22 19:01:57', '2018-09-13 01:46:42', '0', 2);
INSERT INTO `sys_dept` VALUES (8, '潍坊沙县', NULL, '2018-01-22 19:02:03', '2018-09-13 01:46:43', '0', 7);
INSERT INTO `sys_dept` VALUES (9, '高新沙县', NULL, '2018-01-22 19:02:14', '2018-09-13 01:46:44', '1', 8);
INSERT INTO `sys_dept` VALUES (10, '租户2', NULL, '2018-11-18 13:27:11', '2018-11-18 13:42:19', '0', 0);
INSERT INTO `sys_dept` VALUES (11, '院校沙县', NULL, '2018-12-10 21:19:26', NULL, '0', 8);

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation`  (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`, `descendant`) USING BTREE,
  INDEX `idx1`(`ancestor`) USING BTREE,
  INDEX `idx2`(`descendant`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '部门关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
INSERT INTO `sys_dept_relation` VALUES (1, 1);
INSERT INTO `sys_dept_relation` VALUES (1, 3);
INSERT INTO `sys_dept_relation` VALUES (1, 4);
INSERT INTO `sys_dept_relation` VALUES (1, 5);
INSERT INTO `sys_dept_relation` VALUES (2, 2);
INSERT INTO `sys_dept_relation` VALUES (2, 7);
INSERT INTO `sys_dept_relation` VALUES (2, 8);
INSERT INTO `sys_dept_relation` VALUES (2, 11);
INSERT INTO `sys_dept_relation` VALUES (3, 3);
INSERT INTO `sys_dept_relation` VALUES (3, 4);
INSERT INTO `sys_dept_relation` VALUES (3, 5);
INSERT INTO `sys_dept_relation` VALUES (4, 4);
INSERT INTO `sys_dept_relation` VALUES (4, 5);
INSERT INTO `sys_dept_relation` VALUES (5, 5);
INSERT INTO `sys_dept_relation` VALUES (7, 7);
INSERT INTO `sys_dept_relation` VALUES (7, 8);
INSERT INTO `sys_dept_relation` VALUES (7, 11);
INSERT INTO `sys_dept_relation` VALUES (8, 8);
INSERT INTO `sys_dept_relation` VALUES (8, 11);
INSERT INTO `sys_dept_relation` VALUES (10, 10);
INSERT INTO `sys_dept_relation` VALUES (11, 11);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (13, 'log_type', '2019-07-01 13:31:47', '2019-07-01 13:31:49', '日志类型', '异常、正常', '0');
INSERT INTO `sys_dict` VALUES (14, 'social_type', '2019-07-01 13:36:08', '2019-07-01 13:36:08', '社交登录', '微信、QQ', '0');
INSERT INTO `sys_dict` VALUES (15, 'leave_status', '2019-07-01 13:36:57', '2019-07-01 13:36:57', '请假状态', '未提交、审批中、完成、驳回', '0');
INSERT INTO `sys_dict` VALUES (16, 'message_type', '2019-07-01 13:37:28', '2019-07-01 13:37:28', '消息类型', '系统公告、提醒、私信', '0');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(64) NOT NULL COMMENT '字典主表ID',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_item_value`(`value`) USING BTREE,
  INDEX `sys_dict_item_label`(`label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (13, 13, '0', '正常', 'log_type', 0, '正常', '2019-07-01 16:10:40', '2019-07-01 16:10:40', '0');
INSERT INTO `sys_dict_item` VALUES (14, 13, '9', '异常', 'log_type', 1, '异常', '2019-07-01 16:15:35', '2019-07-01 16:15:35', '0');
INSERT INTO `sys_dict_item` VALUES (15, 14, '3', 'WX', 'social_type', 1, '微信登录', '2019-07-01 16:17:28', '2019-07-01 16:17:28', '0');
INSERT INTO `sys_dict_item` VALUES (16, 14, '4', 'QQ', 'social_type', 2, 'QQ登录', '2019-07-01 16:17:42', '2019-07-01 16:17:42', '0');
INSERT INTO `sys_dict_item` VALUES (17, 15, '0', '未提交', 'leave_status', 1, '未提交', '2019-07-01 16:18:40', '2019-07-01 16:18:40', '0');
INSERT INTO `sys_dict_item` VALUES (18, 15, '1', '审批中', 'leave_status', 2, '审批中', '2019-07-01 16:18:53', '2019-07-01 16:18:53', '0');
INSERT INTO `sys_dict_item` VALUES (19, 15, '2', '完成', 'leave_status', 3, '完成', '2019-07-01 16:19:09', '2019-07-01 16:19:09', '0');
INSERT INTO `sys_dict_item` VALUES (20, 15, '9', '驳回', 'leave_status', 4, '驳回', '2019-07-01 16:19:24', '2019-07-01 16:19:24', '0');
INSERT INTO `sys_dict_item` VALUES (21, 16, '0', '系统公告', 'message_type', 1, '系统公告', '2019-07-01 16:20:56', '2019-07-01 16:20:56', '0');
INSERT INTO `sys_dict_item` VALUES (22, 16, '1', '提醒', 'message_type', 2, '提醒', '2019-07-01 16:21:09', '2019-07-01 16:21:09', '0');
INSERT INTO `sys_dict_item` VALUES (23, 16, '2', '私信', 'message_type', 3, '私信', '2019-07-01 16:21:21', '2019-07-01 16:21:21', '0');


-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (58, '1', '添加菜单', 'pig', 'admin', '2019-06-06 14:26:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '111', '0', NULL);
INSERT INTO `sys_log` VALUES (59, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:26:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '88', '0', NULL);
INSERT INTO `sys_log` VALUES (60, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:27:11', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '77', '0', NULL);
INSERT INTO `sys_log` VALUES (61, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:27:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '479', '0', NULL);
INSERT INTO `sys_log` VALUES (62, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:27:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '61', '0', NULL);
INSERT INTO `sys_log` VALUES (63, '1', '添加菜单', 'pig', 'admin', '2019-06-06 14:36:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '68', '0', NULL);
INSERT INTO `sys_log` VALUES (64, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:36:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '81', '0', NULL);
INSERT INTO `sys_log` VALUES (65, '1', '修改菜单', 'pig', 'admin', '2019-06-06 14:37:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '60', '0', NULL);
INSERT INTO `sys_log` VALUES (66, '1', '更新角色菜单', 'pig', 'admin', '2019-06-06 14:40:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C4500%2C4501%2C9999%2C%5D', '376', '0', NULL);
INSERT INTO `sys_log` VALUES (67, '1', '修改菜单', 'test', 'admin', '2019-06-06 14:43:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '67', '0', NULL);
INSERT INTO `sys_log` VALUES (68, '1', '删除菜单', 'test', 'admin', '2019-06-10 14:40:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/4501', 'DELETE', '', '177', '0', NULL);
INSERT INTO `sys_log` VALUES (69, '1', '删除菜单', 'test', 'admin', '2019-06-10 14:40:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/4500', 'DELETE', '', '80', '0', NULL);
INSERT INTO `sys_log` VALUES (70, '1', '更新角色菜单', 'test', 'admin', '2019-06-10 14:40:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C9999%2C%5D', '252', '0', NULL);
INSERT INTO `sys_log` VALUES (71, '1', '添加菜单', 'test', 'admin', '2019-06-10 14:58:58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '335', '0', NULL);
INSERT INTO `sys_log` VALUES (72, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:17:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '99', '0', NULL);
INSERT INTO `sys_log` VALUES (73, '1', '更新角色菜单', 'test', 'admin', '2019-06-10 15:20:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C5000%2C%5D', '250', '0', NULL);
INSERT INTO `sys_log` VALUES (74, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:20:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '107', '0', NULL);
INSERT INTO `sys_log` VALUES (75, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:21:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '59', '0', NULL);
INSERT INTO `sys_log` VALUES (76, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:21:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '142', '0', NULL);
INSERT INTO `sys_log` VALUES (77, '1', '添加菜单', 'test', 'admin', '2019-06-10 15:24:33', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '43', '0', NULL);
INSERT INTO `sys_log` VALUES (78, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:25:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '74', '0', NULL);
INSERT INTO `sys_log` VALUES (79, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:25:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '57', '0', NULL);
INSERT INTO `sys_log` VALUES (80, '1', '更新角色菜单', 'test', 'admin', '2019-06-10 15:26:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C5000%2C5100%2C%5D', '245', '0', NULL);
INSERT INTO `sys_log` VALUES (81, '1', '删除菜单', 'test', 'admin', '2019-06-10 15:30:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/5100', 'DELETE', '', '68', '0', NULL);
INSERT INTO `sys_log` VALUES (82, '1', '删除菜单', 'test', 'admin', '2019-06-10 15:30:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/5000', 'DELETE', '', '93', '0', NULL);
INSERT INTO `sys_log` VALUES (83, '1', '添加菜单', 'test', 'admin', '2019-06-10 15:31:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '76', '0', NULL);
INSERT INTO `sys_log` VALUES (84, '1', '修改菜单', 'test', 'admin', '2019-06-10 15:32:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '65', '0', NULL);
INSERT INTO `sys_log` VALUES (85, '1', '更新角色菜单', 'test', 'admin', '2019-06-10 15:32:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '160', '0', NULL);
INSERT INTO `sys_log` VALUES (86, '1', '添加字典', 'test', 'admin', '2019-06-11 12:54:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (87, '1', '添加字典', 'test', 'admin', '2019-06-11 12:55:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '66', '0', NULL);
INSERT INTO `sys_log` VALUES (88, '1', '修改字典', 'test', 'admin', '2019-06-11 12:55:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '132', '0', NULL);
INSERT INTO `sys_log` VALUES (89, '1', '修改字典', 'test', 'admin', '2019-06-11 12:55:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '58', '0', NULL);
INSERT INTO `sys_log` VALUES (90, '1', '修改字典', 'test', 'admin', '2019-06-11 12:55:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '50', '0', NULL);
INSERT INTO `sys_log` VALUES (91, '1', '修改字典', 'test', 'admin', '2019-06-11 12:55:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '72', '0', NULL);
INSERT INTO `sys_log` VALUES (92, '1', '修改字典', 'test', 'admin', '2019-06-11 12:56:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '60', '0', NULL);
INSERT INTO `sys_log` VALUES (93, '1', '添加字典', 'test', 'admin', '2019-06-11 12:56:39', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '58', '0', NULL);
INSERT INTO `sys_log` VALUES (94, '1', '修改字典', 'test', 'admin', '2019-06-11 12:56:57', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (95, '1', '修改字典', 'test', 'admin', '2019-06-11 12:57:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '58', '0', NULL);
INSERT INTO `sys_log` VALUES (96, '1', '修改菜单', 'test', 'admin', '2019-06-11 17:28:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '123', '0', NULL);
INSERT INTO `sys_log` VALUES (97, '1', '修改角色', 'test', 'admin', '2019-06-11 17:29:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role', 'PUT', '', '9', '0', NULL);
INSERT INTO `sys_log` VALUES (98, '1', '修改菜单', 'test', 'admin', '2019-06-12 13:12:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '83', '0', NULL);
INSERT INTO `sys_log` VALUES (99, '1', '修改菜单', 'test', 'admin', '2019-06-12 13:14:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '50', '0', NULL);
INSERT INTO `sys_log` VALUES (100, '1', '修改会员个人信息', 'test', 'admin', '2019-06-14 17:47:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '12', '0', NULL);
INSERT INTO `sys_log` VALUES (101, '1', '修改会员个人信息', 'test', 'admin', '2019-06-18 12:58:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '12', '0', NULL);
INSERT INTO `sys_log` VALUES (102, '1', '修改会员个人信息', 'test', 'admin', '2019-06-18 12:59:51', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '15540', '0', NULL);
INSERT INTO `sys_log` VALUES (103, '1', '修改会员个人信息', 'test', 'admin', '2019-06-18 13:02:17', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '86', '0', NULL);
INSERT INTO `sys_log` VALUES (104, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2300', 'DELETE', '', '97', '0', NULL);
INSERT INTO `sys_log` VALUES (105, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:07', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2700', 'DELETE', '', '61', '0', NULL);
INSERT INTO `sys_log` VALUES (106, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:11', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2601', 'DELETE', '', '79', '0', NULL);
INSERT INTO `sys_log` VALUES (107, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2600', 'DELETE', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (108, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:17', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2503', 'DELETE', '', '107', '0', NULL);
INSERT INTO `sys_log` VALUES (109, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2502', 'DELETE', '', '69', '0', NULL);
INSERT INTO `sys_log` VALUES (110, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2501', 'DELETE', '', '560', '0', NULL);
INSERT INTO `sys_log` VALUES (111, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2500', 'DELETE', '', '156', '0', NULL);
INSERT INTO `sys_log` VALUES (112, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2401', 'DELETE', '', '79', '0', NULL);
INSERT INTO `sys_log` VALUES (113, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2403', 'DELETE', '', '89', '0', NULL);
INSERT INTO `sys_log` VALUES (114, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2402', 'DELETE', '', '82', '0', NULL);
INSERT INTO `sys_log` VALUES (115, '1', '删除菜单', 'test', 'admin', '2019-06-18 13:08:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3000', 'DELETE', '', '21', '0', NULL);
INSERT INTO `sys_log` VALUES (116, '1', '添加菜单', 'test', 'admin', '2019-06-18 13:10:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (117, '1', '修改菜单', 'test', 'admin', '2019-06-18 13:10:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '89', '0', NULL);
INSERT INTO `sys_log` VALUES (118, '1', '修改菜单', 'test', 'admin', '2019-06-18 13:12:18', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '51', '0', NULL);
INSERT INTO `sys_log` VALUES (119, '1', '更新角色菜单', 'test', 'admin', '2019-06-18 13:12:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2800%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '206', '0', NULL);
INSERT INTO `sys_log` VALUES (120, '1', '修改菜单', 'test', 'admin', '2019-06-18 13:14:39', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '135', '0', NULL);
INSERT INTO `sys_log` VALUES (121, '1', '修改菜单', 'test', 'admin', '2019-06-18 13:17:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '380', '0', NULL);
INSERT INTO `sys_log` VALUES (122, '1', '修改会员个人信息', 'test', 'admin', '2019-06-18 15:57:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '160', '0', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序值',
  `keep_alive` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '权限管理', NULL, '/upms', -1, 'icon-quanxianguanli', 'Layout', 0, '0', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0');
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, 'user', 1000, 'icon-yonghuguanli', 'views/admin/user/index', 1, '0', '0', '2017-11-02 22:24:37', '2018-09-28 09:00:41', '0');
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys_user_add', NULL, 1100, NULL, NULL, NULL, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0');
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys_user_edit', NULL, 1100, NULL, NULL, NULL, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0');
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys_user_del', NULL, 1100, NULL, NULL, NULL, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0');
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, 'menu', 1000, 'icon-caidanguanli', 'views/admin/menu/index', 2, '0', '0', '2017-11-08 09:57:27', '2018-09-28 09:00:45', '0');
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys_menu_add', NULL, 1200, NULL, NULL, NULL, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0');
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys_menu_edit', NULL, 1200, NULL, NULL, NULL, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0');
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys_menu_del', NULL, 1200, NULL, NULL, NULL, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0');
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, 'role', 1000, 'icon-jiaoseguanli', 'views/admin/role/index', 3, '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0');
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys_role_add', NULL, 1300, NULL, NULL, NULL, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0');
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys_role_edit', NULL, 1300, NULL, NULL, NULL, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0');
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys_role_del', NULL, 1300, NULL, NULL, NULL, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0');
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys_role_perm', NULL, 1300, NULL, NULL, NULL, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0');
INSERT INTO `sys_menu` VALUES (1400, '部门管理', NULL, 'dept', 1000, 'icon-web-icon-', 'views/admin/dept/index', 4, '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0');
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys_dept_add', NULL, 1400, NULL, NULL, NULL, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0');
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys_dept_edit', NULL, 1400, NULL, NULL, NULL, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0');
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys_dept_del', NULL, 1400, NULL, NULL, NULL, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0');
INSERT INTO `sys_menu` VALUES (2000, '系统管理', NULL, '/admin', -1, 'icon-xitongguanli', 'Layout', 1, '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0');
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, 'log', 2000, 'icon-rizhiguanli', 'views/admin/log/index', 5, '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0');
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys_log_del', NULL, 2100, NULL, NULL, NULL, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0');
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, 'dict', 2000, 'icon-navicon-zdgl', 'views/admin/dict/index', 6, '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0');
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys_dict_del', NULL, 2200, NULL, NULL, NULL, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0');
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys_dict_add', NULL, 2200, NULL, NULL, NULL, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0');
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys_dict_edit', NULL, 2200, NULL, NULL, NULL, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0');
INSERT INTO `sys_menu` VALUES (2300, '文件对象存储', NULL, 'oss', 2000, 'icon-icon_workfile_line', 'views/admin/oss/index', 3, '0', '0', '2019-06-18 13:10:36', '2019-06-18 13:12:18', '0');
INSERT INTO `sys_menu` VALUES (2400, '终端管理', '', 'client', 2000, 'icon-shouji', 'views/admin/client/index', 9, '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0');
INSERT INTO `sys_menu` VALUES (2800, '消息管理', NULL, 'message', 2000, 'icon-message', 'views/admin/message/index', 13, '0', '0', '2019-06-10 15:31:38', '2019-06-10 15:32:04', '0');
INSERT INTO `sys_menu` VALUES (3000, '系统监控', NULL, '/daemon', -1, 'icon-msnui-supervise', 'Layout', 2, '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0');
INSERT INTO `sys_menu` VALUES (3100, '服务监控', NULL, 'http://139.224.200.249:15001', 3000, 'icon-server', NULL, 0, '0', '0', '2018-06-26 10:50:32', '2018-12-11 17:17:07', '0');
INSERT INTO `sys_menu` VALUES (3200, '接口文档', NULL, 'http://139.224.200.249:19999/swagger-ui.html', 3000, 'icon-wendang', NULL, 2, '0', '1', '2018-06-26 10:50:32', '2018-09-28 09:05:16', '0');
INSERT INTO `sys_menu` VALUES (3300, '事务监控', NULL, 'tx', 3000, 'icon-gtsquanjushiwufuwuGTS', 'views/tx/index', 5, '0', '0', '2018-08-19 11:02:39', '2018-11-23 14:25:08', '0');
INSERT INTO `sys_menu` VALUES (3400, '在线事务', NULL, 'model', 3000, 'icon-online', 'views/tx/model', 6, '0', '0', '2018-08-19 11:32:04', '2018-11-23 14:25:14', '0');
INSERT INTO `sys_menu` VALUES (3500, '任务监控', NULL, 'http://139.224.200.249:8899', 3000, 'icon-msnui-supervise', NULL, 7, '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:03:33', '0');
INSERT INTO `sys_menu` VALUES (3600, '任务轨迹', '', 'status-trace-log', 3000, 'icon-guiji', 'views/daemon/status-trace-log/index', 8, '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0');
INSERT INTO `sys_menu` VALUES (3601, '删除任务轨迹', 'daemon_status_trace_log_del', NULL, 3600, '1', NULL, 2, '0', '1', '2018-05-15 21:35:18', '2018-11-24 06:37:31', '0');
INSERT INTO `sys_menu` VALUES (3700, '调用拓扑', NULL, 'http://139.224.200.249:8081', 3000, 'icon-line', NULL, 10, '0', '0', '2018-01-25 11:08:52', '2018-09-28 09:04:29', '0');
INSERT INTO `sys_menu` VALUES (3800, '缓存状态', NULL, 'http://139.224.200.249:8585', 3000, 'icon-qingchuhuancun', NULL, 12, '0', '0', '2018-01-23 10:56:11', '2018-09-28 09:13:56', '0');
INSERT INTO `sys_menu` VALUES (3900, '任务日志', '', 'execution-log', 3000, 'icon-guiji', 'views/daemon/execution-log/index', 8, '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0');
INSERT INTO `sys_menu` VALUES (3901, '删除日志', 'daemon_execution_log_del', NULL, 3900, '1', NULL, 2, '0', '1', '2018-05-15 21:35:18', '2018-11-24 06:39:03', '0');
INSERT INTO `sys_menu` VALUES (4000, '协同管理', NULL, '/activti', -1, 'icon-kuaisugongzuoliu_o', 'Layout', 3, '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0');
INSERT INTO `sys_menu` VALUES (4100, '模型管理', NULL, 'activiti', 4000, 'icon-weibiaoti13', 'views/activiti/index', 1, '0', '0', '2018-09-26 01:39:07', '2018-12-09 16:35:16', '0');
INSERT INTO `sys_menu` VALUES (4101, '模型管理', 'act_model_manage', NULL, 4100, '1', NULL, 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4200, '流程管理', NULL, 'process', 4000, 'icon-liucheng', 'views/activiti/process', 2, '0', '0', '2018-09-26 06:41:05', '2018-11-23 14:25:33', '0');
INSERT INTO `sys_menu` VALUES (4201, '流程管理', 'act_process_manage', NULL, 4200, '1', NULL, 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4300, '请假管理', '', 'leavebill', 4000, 'icon-qingjia', 'views/activiti/leave', 3, '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:20', '0');
INSERT INTO `sys_menu` VALUES (4301, '请假新增', 'act_leavebill_add', NULL, 4300, '1', NULL, 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4302, '请假修改', 'act_leavebill_edit', NULL, 4300, '1', NULL, 1, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0');
INSERT INTO `sys_menu` VALUES (4303, '请假删除', 'act_leavebill_del', NULL, 4300, '1', NULL, 2, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0');
INSERT INTO `sys_menu` VALUES (4400, '待办任务', NULL, 'task', 4000, 'icon-renwu', 'views/activiti/task', 4, '0', '0', '2018-09-27 09:52:31', '2018-12-09 16:35:26', '0');
INSERT INTO `sys_menu` VALUES (4401, '流程管理', 'act_task_manage', NULL, 4400, '1', NULL, 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ranger` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '发送范围 0全部 1指定',
  `create_send` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新创建账号推送',
  `del_flag` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人名称',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统推送消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO `sys_message` VALUES (10, '2', '乘坐中国制造的客机是啥体验?这个测评在海外火了', '<p style=\"text-align: center;\">乘坐中国制造的ARJ21是一种怎样的体验？知名职业航空评测博主Sam最近一探究竟~</p><p style=\"text-align: center;\">　　“早上好，现在是成都的清晨5点，我即将乘坐的航班是由中国第一架自主研发的喷气式支线客机——ARJ21执飞。”</p><p style=\"text-align: center;\">　　即便是起了个大早赶飞机，Sam却十分兴奋，非常期待这一次的飞行旅程。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/59/w550h309/20190612/edff-hyeztyt2482106.png\" alt=\" Sam面对镜头介绍ARJ21\">Sam面对镜头介绍ARJ21</div><p style=\"text-align: center;\">　　Sam是一位知名航旅达人，在YouTube上拥有百万粉丝，他也被粉丝们称为“民航界大神”。而这段关于ARJ21的评测视频，发布十多个小时就收获3千多个赞。</p><p style=\"text-align: center;\">　　不少外国网友表示，早就想看中国制造客机的专业测评了。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/631/w550h81/20190612/3ca9-hyeztyt2482197.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　这一次，Sam乘坐的是服役于国内某航空公司的中国商飞ARJ21，它是中国第一次完全自主设计并组装制造的支线飞机。</p><p style=\"text-align: center;\">　　正如此前国内媒体报道所说，造一架能飞上天的客机，中国的成功经验越来越多。但实现一款自主研制、符合国际民航标准的喷气式客机批量化生产，并接受市场的全方位检验，ARJ21是第一个探路者。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/315f-hyeztyt2482225.jpg\" alt=\" ARJ21（中国商飞官网）\">ARJ21（中国商飞官网）</div><p style=\"text-align: center;\">　　Sam介绍说，ARJ21是中国首次按照国际民航规章自行研制、具有自主知识产权的中短程新型涡扇支线客机，第一架客机于2015年交付并投入使用。</p><p style=\"text-align: center;\">　　在机舱内观察了一番后，他注意到，ARJ21客舱共有90个座位，内部设计美观。虽然机型小，但设备齐全，行李架的空间也足够大。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/116/w550h366/20190612/8afb-hyeztyt2482259.jpg\" alt=\" 机舱内部（Sam微博）\">机舱内部（Sam微博）</div><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/58/w550h308/20190612/4a7b-hyeztyt2482307.png\" alt=\"行李架内部空间（视频截图）\">行李架内部空间（视频截图）</div><p style=\"text-align: center;\">　　而最重要的是，整个航行的飞行体验也很棒。</p><p style=\"text-align: center;\">　　Sam评价说，ARJ21的起飞、降落都非常平稳，机上的服务也非常赞。</p><p style=\"text-align: center;\">　　针对飞行体验中的一些细节，Sam还进行了更多细致客观的点评。</p><p style=\"text-align: center;\">　　他发现，由于ARJ21的引擎位于机身后部而非机翼的位置，因此，坐在机舱靠后的乘客感受到的噪音会略大。</p><p style=\"text-align: center;\">　　相比这些“瑕疵”，已试飞成功的国产大型喷气式民用飞机C919更令人期待。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/972e-hyeztyt2482344.jpg\" alt=\" C919（中国商飞官网）\">C919（中国商飞官网）</div><p style=\"text-align: center;\">　　然而，观看了体验视频的外国网友却接连鼓励：自主制造出这样一款商用客机，已经很了不起了。</p><p style=\"text-align: center;\">　　“作为中国在商用飞机上的第一次尝试，ARJ21已经很棒，期待中国人制造出更多不同类型的飞机。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/736/w550h186/20190612/30f0-hyeztyt2482385.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　“很棒的飞机，期待未来看到你乘坐C919。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/637/w550h87/20190612/3dd5-hyeztyt2482447.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　还有外国网友毫无保留地投出信任票，认为ARJ21比一些西方老牌飞机制造商生产的大型飞机更加安全，更期待未来中国多向其他国家出口这些“中国制造”。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/659/w550h109/20190612/95d7-hyeztyt2482508.jpg\" alt=\"\"></div><p style=\"text-align: center;\"><br></p>', '1', '1', '0', '2019-06-13 09:21:31', '2019-06-13 09:21:31', NULL);

-- ----------------------------
-- Table structure for sys_message_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_send`;
CREATE TABLE `sys_message_send`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送用户名',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已读 0未读 1已读',
  `delFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_send
-- ----------------------------
INSERT INTO `sys_message_send` VALUES (17, 10, 1, '乘坐中国制造的客机是啥体验?这个测评在海外火了', '<p style=\"text-align: center;\">乘坐中国制造的ARJ21是一种怎样的体验？知名职业航空评测博主Sam最近一探究竟~</p><p style=\"text-align: center;\">　　“早上好，现在是成都的清晨5点，我即将乘坐的航班是由中国第一架自主研发的喷气式支线客机——ARJ21执飞。”</p><p style=\"text-align: center;\">　　即便是起了个大早赶飞机，Sam却十分兴奋，非常期待这一次的飞行旅程。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/59/w550h309/20190612/edff-hyeztyt2482106.png\" alt=\" Sam面对镜头介绍ARJ21\">Sam面对镜头介绍ARJ21</div><p style=\"text-align: center;\">　　Sam是一位知名航旅达人，在YouTube上拥有百万粉丝，他也被粉丝们称为“民航界大神”。而这段关于ARJ21的评测视频，发布十多个小时就收获3千多个赞。</p><p style=\"text-align: center;\">　　不少外国网友表示，早就想看中国制造客机的专业测评了。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/631/w550h81/20190612/3ca9-hyeztyt2482197.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　这一次，Sam乘坐的是服役于国内某航空公司的中国商飞ARJ21，它是中国第一次完全自主设计并组装制造的支线飞机。</p><p style=\"text-align: center;\">　　正如此前国内媒体报道所说，造一架能飞上天的客机，中国的成功经验越来越多。但实现一款自主研制、符合国际民航标准的喷气式客机批量化生产，并接受市场的全方位检验，ARJ21是第一个探路者。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/315f-hyeztyt2482225.jpg\" alt=\" ARJ21（中国商飞官网）\">ARJ21（中国商飞官网）</div><p style=\"text-align: center;\">　　Sam介绍说，ARJ21是中国首次按照国际民航规章自行研制、具有自主知识产权的中短程新型涡扇支线客机，第一架客机于2015年交付并投入使用。</p><p style=\"text-align: center;\">　　在机舱内观察了一番后，他注意到，ARJ21客舱共有90个座位，内部设计美观。虽然机型小，但设备齐全，行李架的空间也足够大。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/116/w550h366/20190612/8afb-hyeztyt2482259.jpg\" alt=\" 机舱内部（Sam微博）\">机舱内部（Sam微博）</div><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/58/w550h308/20190612/4a7b-hyeztyt2482307.png\" alt=\"行李架内部空间（视频截图）\">行李架内部空间（视频截图）</div><p style=\"text-align: center;\">　　而最重要的是，整个航行的飞行体验也很棒。</p><p style=\"text-align: center;\">　　Sam评价说，ARJ21的起飞、降落都非常平稳，机上的服务也非常赞。</p><p style=\"text-align: center;\">　　针对飞行体验中的一些细节，Sam还进行了更多细致客观的点评。</p><p style=\"text-align: center;\">　　他发现，由于ARJ21的引擎位于机身后部而非机翼的位置，因此，坐在机舱靠后的乘客感受到的噪音会略大。</p><p style=\"text-align: center;\">　　相比这些“瑕疵”，已试飞成功的国产大型喷气式民用飞机C919更令人期待。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/972e-hyeztyt2482344.jpg\" alt=\" C919（中国商飞官网）\">C919（中国商飞官网）</div><p style=\"text-align: center;\">　　然而，观看了体验视频的外国网友却接连鼓励：自主制造出这样一款商用客机，已经很了不起了。</p><p style=\"text-align: center;\">　　“作为中国在商用飞机上的第一次尝试，ARJ21已经很棒，期待中国人制造出更多不同类型的飞机。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/736/w550h186/20190612/30f0-hyeztyt2482385.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　“很棒的飞机，期待未来看到你乘坐C919。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/637/w550h87/20190612/3dd5-hyeztyt2482447.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　还有外国网友毫无保留地投出信任票，认为ARJ21比一些西方老牌飞机制造商生产的大型飞机更加安全，更期待未来中国多向其他国家出口这些“中国制造”。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/659/w550h109/20190612/95d7-hyeztyt2482508.jpg\" alt=\"\"></div><p style=\"text-align: center;\"><br></p>', '2', 'admin', '1', '0', 'admin', '2019-06-13 09:21:31', NULL, '2019-06-13 09:21:31');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(32) CHARACTER SET  utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('pig', NULL, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('test', NULL, 'test', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原文件名称',
  `fkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储文件名',
  `file_size` bigint(20) NOT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `crate_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `delFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (56, '005PKPY2ly8fdwsorhp1fj30e80dojro.jpg', '0303a2fbde0249619cde4d2d652a443f.jpg', 6415, 'image/jpeg', 'admin', '2019-06-18 15:16:32', 'admin', '2019-06-18 15:16:32', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ds_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_idx1_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员', '2', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0');
INSERT INTO `sys_role` VALUES (2, 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '2', NULL, '2018-11-11 19:42:26', '2018-12-26 14:09:07', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1100);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1102);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1200);
INSERT INTO `sys_role_menu` VALUES (1, 1201);
INSERT INTO `sys_role_menu` VALUES (1, 1202);
INSERT INTO `sys_role_menu` VALUES (1, 1203);
INSERT INTO `sys_role_menu` VALUES (1, 1300);
INSERT INTO `sys_role_menu` VALUES (1, 1301);
INSERT INTO `sys_role_menu` VALUES (1, 1302);
INSERT INTO `sys_role_menu` VALUES (1, 1303);
INSERT INTO `sys_role_menu` VALUES (1, 1304);
INSERT INTO `sys_role_menu` VALUES (1, 1400);
INSERT INTO `sys_role_menu` VALUES (1, 1401);
INSERT INTO `sys_role_menu` VALUES (1, 1402);
INSERT INTO `sys_role_menu` VALUES (1, 1403);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2100);
INSERT INTO `sys_role_menu` VALUES (1, 2101);
INSERT INTO `sys_role_menu` VALUES (1, 2200);
INSERT INTO `sys_role_menu` VALUES (1, 2201);
INSERT INTO `sys_role_menu` VALUES (1, 2202);
INSERT INTO `sys_role_menu` VALUES (1, 2203);
INSERT INTO `sys_role_menu` VALUES (1, 2300);
INSERT INTO `sys_role_menu` VALUES (1, 2400);
INSERT INTO `sys_role_menu` VALUES (1, 2800);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3100);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3300);
INSERT INTO `sys_role_menu` VALUES (1, 3400);
INSERT INTO `sys_role_menu` VALUES (1, 3500);
INSERT INTO `sys_role_menu` VALUES (1, 3600);
INSERT INTO `sys_role_menu` VALUES (1, 3601);
INSERT INTO `sys_role_menu` VALUES (1, 3700);
INSERT INTO `sys_role_menu` VALUES (1, 3800);
INSERT INTO `sys_role_menu` VALUES (1, 3900);
INSERT INTO `sys_role_menu` VALUES (1, 3901);
INSERT INTO `sys_role_menu` VALUES (1, 4000);
INSERT INTO `sys_role_menu` VALUES (1, 4100);
INSERT INTO `sys_role_menu` VALUES (1, 4101);
INSERT INTO `sys_role_menu` VALUES (1, 4200);
INSERT INTO `sys_role_menu` VALUES (1, 4201);
INSERT INTO `sys_role_menu` VALUES (1, 4300);
INSERT INTO `sys_role_menu` VALUES (1, 4301);
INSERT INTO `sys_role_menu` VALUES (1, 4302);
INSERT INTO `sys_role_menu` VALUES (1, 4303);
INSERT INTO `sys_role_menu` VALUES (1, 4400);
INSERT INTO `sys_role_menu` VALUES (1, 4401);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2100);
INSERT INTO `sys_role_menu` VALUES (2, 2101);


-- ----------------------------
-- Table structure for sys_social_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统社交登录账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_social_details
-- ----------------------------
INSERT INTO `sys_social_details` VALUES (1, 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2018-12-04 11:50:57', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `lock_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'QQ openid',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_wx_openid`(`wx_openid`) USING BTREE,
  INDEX `user_qq_openid`(`qq_openid`) USING BTREE,
  INDEX `user_idx1_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', NULL, '15077923572', 'f0de6f9d2507424d8d8cb4f87ace2340.jpg', 1, '2018-04-20 07:15:18', '2019-06-18 15:57:34', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', NULL);
INSERT INTO `sys_user` VALUES (5, 'test', '$2a$10$8kRPVwZHyMi5Fq89Vf49aeOEtM.pKf5vHou3A4eVTE3q7xsz0B3Zu', NULL, '', 'http://img5.imgtn.bdimg.com/it/u=235810630,594632317&fm=26&gp=0.jpg', 11, '2019-05-23 17:47:13', '2019-06-06 15:07:45', '0', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);

DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `route_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路由ID',
  `predicates` json NULL COMMENT '断言',
  `filters` json NULL COMMENT '过滤器',
  `uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` int(2) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '路由配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_route_conf
-- ----------------------------
INSERT INTO `sys_route_conf` VALUES (1, '工作流管理模块', 'boot-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-activiti', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:25', '0');
INSERT INTO `sys_route_conf` VALUES (2, '认证中心', 'boot-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://boot-auth', 0, '2019-01-17 16:42:50', '2019-06-28 17:07:40', '0');
INSERT INTO `sys_route_conf` VALUES (4, '定时任务模块', 'pigx-daemon', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-daemon', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:50', '0');
INSERT INTO `sys_route_conf` VALUES (5, '支付模块', 'boot-pay', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-pay', 0, '2019-01-17 16:42:50', '2019-06-28 17:11:22', '0');
INSERT INTO `sys_route_conf` VALUES (6, '通用权限模块', 'boot-upms', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://boot-upms', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:03', '0');


SET FOREIGN_KEY_CHECKS = 1;
