/*
 Navicat Premium Data Transfer

 Source Server         : 12
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 192.168.1.181:3306
 Source Schema         : boot

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/07/2019 17:43:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chunk
-- ----------------------------
DROP TABLE IF EXISTS `chunk`;
CREATE TABLE `chunk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chunk_number` bigint(64) NOT NULL COMMENT '当前文件块，从1开始',
  `chunk_size` bigint(64) NOT NULL COMMENT '分块大小',
  `current_chunk_size` bigint(64) NOT NULL COMMENT '当前分块大小',
  `total_size` bigint(64) NOT NULL COMMENT '总大小',
  `identifier` varchar(255) NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `relative_path` varchar(255) NOT NULL COMMENT '相对路径',
  `total_chunks` bigint(64) NOT NULL COMMENT '总块数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8 COMMENT='文件分块上传表';

-- ----------------------------
-- Records of chunk
-- ----------------------------
BEGIN;
INSERT INTO `chunk` VALUES (971, 1, 51200000, 868827, 868827, 'afa9b6f3da3dd154aa46235d9db2ae21', 'Apache_Shiro参考手册中文版-converted.docx', 'Apache_Shiro参考手册中文版-converted.docx', 1);
INSERT INTO `chunk` VALUES (972, 1, 51200000, 319638, 319638, '065037c8bec62bd0d836a0a416b1ef45', '1294929-20181205144240125-1096993697.gif', '1294929-20181205144240125-1096993697.gif', 1);
INSERT INTO `chunk` VALUES (973, 1, 51200000, 720039, 720039, '7cf93301a3fcbab75f27704df13775cc', 'Netty 入门与实战：仿写微信 IM 即时通讯系统.docx', 'Netty 入门与实战：仿写微信 IM 即时通讯系统.docx', 1);
COMMIT;

-- ----------------------------
-- Table structure for job_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `job_execution_log`;
CREATE TABLE `job_execution_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) NOT NULL,
  `failure_cause` varchar(4000) DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `complete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='任务日志表';

-- ----------------------------
-- Records of job_execution_log
-- ----------------------------
BEGIN;
INSERT INTO `job_execution_log` VALUES ('0027ef92-ca47-47a2-996b-78020d49595e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:37', '2019-06-28 13:50:37');
INSERT INTO `job_execution_log` VALUES ('0042921b-f8b3-4d9f-a5d4-7d926229fb22', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('010974de-fe32-49b0-8075-cf717ec10fb8', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:03', '2019-07-02 17:00:03');
INSERT INTO `job_execution_log` VALUES ('015d7111-6b5e-4dc8-b014-423c00d7d224', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:55', '2019-06-28 13:50:55');
INSERT INTO `job_execution_log` VALUES ('01a03c29-986e-475c-bd71-d9101c19fbfb', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('02132c7c-8039-4721-b23e-21872d3b26d9', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('051f57ce-8099-48ee-8306-3581e4ccd0f2', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('059815d2-02ae-4ee8-a047-0379c1cad46c', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('083512ac-ef86-400e-bb73-aa6f779796ba', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:16', '2019-06-28 13:50:16');
INSERT INTO `job_execution_log` VALUES ('087bd22d-9e4f-4843-a779-cfc1be3dc3c8', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:15', '2019-06-28 13:50:15');
INSERT INTO `job_execution_log` VALUES ('09114d8d-5ad0-46a1-9e64-dd41f001a0f3', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:21', '2019-06-28 13:50:21');
INSERT INTO `job_execution_log` VALUES ('0984014c-f215-4f5e-af16-032bdf2f4d71', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('0a3c7a27-4ae7-4d98-b4b7-9d2dd2b75be2', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:32', '2019-06-28 13:51:32');
INSERT INTO `job_execution_log` VALUES ('0a761f07-2347-4dd1-9b89-248f9d0f80bc', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:02', '2019-07-02 16:00:02');
INSERT INTO `job_execution_log` VALUES ('0ae224fa-c139-4b5e-a45c-57768150a507', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:21', '2019-06-28 13:50:21');
INSERT INTO `job_execution_log` VALUES ('0e28c823-24d3-4a92-881f-4eae97ddfdbf', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('0ea61a00-4f09-45b5-8d46-0dd83575c256', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:56', '2019-06-28 13:50:56');
INSERT INTO `job_execution_log` VALUES ('104ee702-1ff6-4728-8145-b7fb4aa8b618', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:32', '2019-06-28 13:51:32');
INSERT INTO `job_execution_log` VALUES ('11c11fb6-960c-40d2-b048-f1d73f42aa12', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:27', '2019-06-28 13:50:27');
INSERT INTO `job_execution_log` VALUES ('11e4b27a-7dc3-4a11-aac9-08a68042a1fa', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:37', '2019-06-28 13:50:37');
INSERT INTO `job_execution_log` VALUES ('13ec09dc-1143-4fc6-96e2-44cc1cbc8da2', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:26', '2019-06-28 13:50:26');
INSERT INTO `job_execution_log` VALUES ('143075f7-cf42-4428-b8f0-205f5abe62bb', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('161c2d54-f067-40f4-99a9-4ade213608c9', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:03', '2019-07-04 18:00:03');
INSERT INTO `job_execution_log` VALUES ('16da0c18-0ce2-42c6-b07d-b83367b55911', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('1b0dc26c-24e7-4287-9f4d-07b99dddb931', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:03', '2019-06-28 14:00:03');
INSERT INTO `job_execution_log` VALUES ('1b94466f-4c80-4cbc-b803-29da6861449c', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:04', '2019-07-04 17:00:04');
INSERT INTO `job_execution_log` VALUES ('1c3293c6-83c5-4c65-933f-1be26300d607', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
INSERT INTO `job_execution_log` VALUES ('1e23fe39-5f00-41dd-ad56-9373bea0a036', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('1ed1e23b-21cc-4566-8620-4ff52c136775', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('21158912-5b06-400c-b6e2-2ca8ab964eb1', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:27', '2019-06-28 13:51:27');
INSERT INTO `job_execution_log` VALUES ('2163d6d0-174e-4730-a0a5-00ac2d4306f7', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:04', '2019-07-04 17:00:04');
INSERT INTO `job_execution_log` VALUES ('22c54264-88d4-423c-98f5-69acfbab553b', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('22df0a3e-5d09-464b-a89c-4e78638c153f', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:15', '2019-06-28 13:51:15');
INSERT INTO `job_execution_log` VALUES ('22e0fcd7-6f0b-4d86-bd91-cfd81008b448', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('24971ac4-a3e6-4366-93bf-b44a704d71d1', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:03', '2019-06-28 14:00:03');
INSERT INTO `job_execution_log` VALUES ('262f3200-ab99-4478-b394-fe466335b7c4', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:32', '2019-06-28 13:51:32');
INSERT INTO `job_execution_log` VALUES ('278590ca-84e3-40ed-8651-38dd36ae842e', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('279ce020-179b-4176-91e4-b015d8e13698', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:36', '2019-06-28 13:50:36');
INSERT INTO `job_execution_log` VALUES ('27bc6522-b655-4a4a-9e40-1e299d5f5578', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:35', '2019-06-28 13:50:35');
INSERT INTO `job_execution_log` VALUES ('2841b841-9d77-42a0-9cc5-ffe28a9b5004', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('28d6dcb5-1530-417f-9a1b-039465e7da63', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('29ae840f-c040-4ffd-a125-b23bfb84f727', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:03', '2019-07-02 15:00:03');
INSERT INTO `job_execution_log` VALUES ('2b699876-0be4-485a-81cb-e2b4b17be1f1', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('2ba16eae-635a-486d-aa05-8177e88b5a6f', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('2cf026d3-8808-467b-928c-508613be24f9', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:20', '2019-06-28 13:50:20');
INSERT INTO `job_execution_log` VALUES ('2e9dcf9e-19d7-4099-8cb4-3c2153d2f031', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:02', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('2ee001ff-b740-4344-ae36-c050a1c901c6', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('2f1fd368-680b-4a4c-9e8c-13e5979c6363', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('2f3ad80f-eed5-46b2-9fc0-9c67b1517250', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('300a8de3-b724-4bd8-af65-1217f70dc1e5', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:32', '2019-06-28 13:50:32');
INSERT INTO `job_execution_log` VALUES ('3058a001-128a-4d9a-8d07-75ccbeec5ac6', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:07', '2019-06-28 13:51:07');
INSERT INTO `job_execution_log` VALUES ('30dedf11-221c-4a84-9974-04d610540e77', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('311d0bb4-a236-41c5-9a96-a3e47e340690', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:03', '2019-07-02 10:00:03');
INSERT INTO `job_execution_log` VALUES ('319444e1-668e-41a9-afa4-d14ed48bb496', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:15', '2019-06-28 13:50:15');
INSERT INTO `job_execution_log` VALUES ('31ba46db-8edf-4ccc-97d0-28045bb48083', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:20', '2019-06-28 13:50:20');
INSERT INTO `job_execution_log` VALUES ('31c28539-e13c-47e3-a77f-331b78288b4a', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:10', '2019-06-28 13:51:10');
INSERT INTO `job_execution_log` VALUES ('32105802-9257-4ca4-a61f-f7dc77a5e2db', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('3210c558-a0c6-476f-8e01-7d7d9a5bce26', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:27', '2019-06-28 13:51:27');
INSERT INTO `job_execution_log` VALUES ('32759509-993f-4c28-9375-8eb338b5964a', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('351bc31c-61f0-47b3-aca6-be37fbd43966', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('36ec8a02-deee-4050-b02e-a1bdbf07da50', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:07', '2019-06-28 13:50:07');
INSERT INTO `job_execution_log` VALUES ('37117925-7b6f-4da5-8a25-1b96c9a21afc', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('381fc756-cf37-40e7-b25c-5a6638dfff76', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('38acd16d-5784-4a64-8906-20b1cb537cfc', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('3c56f2e8-7ec8-4293-bacb-cadafe447f26', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('3cffb566-6311-4562-b4fe-1c4d6b4c9f60', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('3dba89a4-3f2d-4538-be78-93024f5f258f', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:02', '2019-06-28 13:51:02');
INSERT INTO `job_execution_log` VALUES ('3ecec764-2bcb-472e-a002-a2c590b8c4fb', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:36', '2019-06-28 13:50:36');
INSERT INTO `job_execution_log` VALUES ('3f2e8779-bdcf-4a33-aa76-781b41a85caf', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:55', '2019-06-28 13:50:55');
INSERT INTO `job_execution_log` VALUES ('40304b74-0737-43d7-9c2c-ad65c4b34479', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('4261276f-b72a-4db0-b7bc-b7fad2d04f1b', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('441d039e-6efc-4201-96d1-4cc62de9adc8', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('45208b98-f905-4f47-9c2c-369e2084aa32', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:02', '2019-07-02 16:00:02');
INSERT INTO `job_execution_log` VALUES ('4546ce11-a378-43aa-98c0-c49da8dd0255', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('46f397bb-8d4c-40af-9b7e-29334cb68fed', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:07', '2019-06-28 13:51:07');
INSERT INTO `job_execution_log` VALUES ('477d0afa-496b-493c-ae45-440eff1261a0', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('4917057f-5c74-47bc-8c51-537565b5c5c5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:11', '2019-06-28 13:51:11');
INSERT INTO `job_execution_log` VALUES ('4d77e5ae-26d2-4b7a-967d-4ea61c7d171e', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:56', '2019-06-28 13:50:56');
INSERT INTO `job_execution_log` VALUES ('4e150509-d070-4d56-9f11-3928bf7b50ae', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('4ff228b5-765e-469a-92a1-ada8afc75cbf', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('502389f7-e4d6-4f31-8125-2da3a9ff888d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('50f4a21f-d4b6-4410-ab3d-7e2f94cc2718', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('5236e2a5-5a37-44e1-8513-5dae1e3c495d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:25', '2019-06-28 13:50:25');
INSERT INTO `job_execution_log` VALUES ('527c8f00-1b96-48c4-9da4-fb97b2fd7ece', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('528dba0b-79c4-4c77-92c6-d5a71741660e', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:45', '2019-06-28 13:50:45');
INSERT INTO `job_execution_log` VALUES ('5511cf38-9d9b-4162-852d-8de03911b948', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:03', '2019-07-02 17:00:03');
INSERT INTO `job_execution_log` VALUES ('55486e29-4b3c-4108-837c-d60f204a6b9d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('575cad24-5279-4d8b-8342-c673c03de6a8', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('57ab01c5-90bd-446d-8808-fb95cde47414', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:37', '2019-06-28 13:50:37');
INSERT INTO `job_execution_log` VALUES ('57f3921f-2d53-4d57-ad45-2c01a487ee2d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:56', '2019-06-28 13:50:56');
INSERT INTO `job_execution_log` VALUES ('5812e10c-5880-406b-93d7-ada831bb4dba', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('5b0b1507-7ee5-4759-8b39-626d626964a4', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:12', '2019-06-28 13:51:12');
INSERT INTO `job_execution_log` VALUES ('5e1a9d54-2186-4980-ba8c-5f4190d2476d', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('5e4daae6-19b4-46f0-bb6c-d54998208f15', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('5efed53e-5f84-4b85-8b25-7cb28a1e3cc7', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:46', '2019-06-28 13:50:46');
INSERT INTO `job_execution_log` VALUES ('61af52e7-f34f-4854-90ce-0a6090a27213', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('62cc9c79-6f7f-4a77-a624-3ea6dd427b73', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:10', '2019-06-28 13:51:10');
INSERT INTO `job_execution_log` VALUES ('638dcbac-6945-4b18-81b5-d12d7835c4bf', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('642ac896-4cb3-46ac-8603-dc00ba62cd10', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('646bc806-66da-4883-8ea2-0b652a1c6b8e', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('654d8239-c1f3-4427-865c-88354880d636', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('6560d2d7-61f8-4102-b15d-1d0c4d5a44ba', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('657eafce-5207-4c21-9616-a85603b1a457', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:32', '2019-06-28 13:50:32');
INSERT INTO `job_execution_log` VALUES ('65830508-f21e-491a-8e80-6659458cb0b5', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:02', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('67381a6b-dda6-4863-9744-ecc15eac019c', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:12', '2019-06-28 13:51:12');
INSERT INTO `job_execution_log` VALUES ('6926888e-e6cb-4acd-8128-6758bab4ce1e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:57', '2019-06-28 13:50:57');
INSERT INTO `job_execution_log` VALUES ('69bb4d16-3756-4f8b-a169-9e2ddd8d20ea', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('69e65558-73ce-42c5-a33b-735d94dcf195', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('6ac3c012-59f2-4956-a20d-45c4b4947bf7', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
INSERT INTO `job_execution_log` VALUES ('6bc09381-1696-4c49-8e50-5e0515387139', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('6c09272f-4d26-46dd-967d-c5dc2813a0a7', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('6d37f903-5f68-42f4-97da-0eeec84ea044', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:12', '2019-06-28 13:51:12');
INSERT INTO `job_execution_log` VALUES ('6d59c425-4027-4476-986f-74c17d6736ca', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('6d62b8cd-24d5-4e89-89da-c40229db5fba', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:25', '2019-06-28 13:50:25');
INSERT INTO `job_execution_log` VALUES ('6e10736a-be3d-4ff9-8df7-d7afc9ea0a26', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('6f786ec8-c38b-4700-ac55-5713b3d49519', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('70d94a90-25b8-4e1b-b5d1-9ef1fd81b545', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('70fec6e9-1463-4057-8d22-e6acb4691091', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('713448fe-5daa-44eb-b5b0-806f3f31f3d5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:16', '2019-06-28 13:51:16');
INSERT INTO `job_execution_log` VALUES ('7148b00b-4e23-40cc-9aa0-98d7d2960fca', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:02', '2019-07-02 16:00:02');
INSERT INTO `job_execution_log` VALUES ('719f2c42-1729-4590-874b-04af0af936b4', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('730037fd-b1b0-42aa-886e-8680630ad908', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('73acbbda-8989-449b-a5be-8aa415bdd79a', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('74dc2c9e-525a-4e7b-9b6f-ff55f006144e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:02', '2019-06-28 16:00:02');
INSERT INTO `job_execution_log` VALUES ('75cd7803-25b7-4aaa-bcb5-0218c31e0226', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:10', '2019-06-28 13:51:10');
INSERT INTO `job_execution_log` VALUES ('75ec0fb1-ceaa-4fbe-92aa-19a0dda41293', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:12', '2019-06-28 13:50:12');
INSERT INTO `job_execution_log` VALUES ('763524b7-16f0-43f0-bef7-9b23a43d8129', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:11', '2019-06-28 13:51:11');
INSERT INTO `job_execution_log` VALUES ('76d2c511-cf68-4a0e-9f79-65f04c4a6b2e', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:35', '2019-06-28 13:50:35');
INSERT INTO `job_execution_log` VALUES ('77e9819a-e17a-4535-bdfb-059cf4dd6019', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:52', '2019-06-28 13:50:52');
INSERT INTO `job_execution_log` VALUES ('780c16fe-211c-44ab-b763-d5f6c14f601f', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:17', '2019-06-28 13:50:17');
INSERT INTO `job_execution_log` VALUES ('785d4070-d19d-4dc3-a21e-4e8c61a5e5f4', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:17', '2019-06-28 13:50:17');
INSERT INTO `job_execution_log` VALUES ('78cd512a-71d0-435b-9985-61169081c4a9', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('7a31aa5a-49b9-4d29-b584-5bed745dfd73', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('7cc5a9c2-363f-439a-84ea-ed2688393fb8', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:18', '2019-06-28 13:51:18');
INSERT INTO `job_execution_log` VALUES ('7cf06333-3a19-4fdc-9ef2-ece852b1ca2a', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('7da99cb9-4c57-498a-ad70-eac72c8f2e73', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:03', '2019-07-04 18:00:03');
INSERT INTO `job_execution_log` VALUES ('7deb75ec-1658-47a1-9304-0e9e60408e40', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:04', '2019-07-04 17:00:04');
INSERT INTO `job_execution_log` VALUES ('7ee0ff12-1f98-458d-8cf4-028052a431f7', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:02', '2019-06-28 13:51:02');
INSERT INTO `job_execution_log` VALUES ('7f670179-6a70-41f6-98fb-be234d018494', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:27', '2019-06-28 13:51:27');
INSERT INTO `job_execution_log` VALUES ('81b0e8db-10f4-4f60-a968-2b472c6859ea', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:02', '2019-06-28 16:00:02');
INSERT INTO `job_execution_log` VALUES ('827f72e8-8021-4db8-84bd-159e1cb73cb4', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('83db0894-8129-4e5d-8ab8-aaa7991dd748', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:52', '2019-06-28 13:50:52');
INSERT INTO `job_execution_log` VALUES ('840e6eb6-b144-4712-b408-cca71723d9bb', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:18', '2019-06-28 13:51:18');
INSERT INTO `job_execution_log` VALUES ('84b436c1-eca2-46a9-8190-fc01c88088fc', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('852eb7cc-e976-4eda-8f35-5462f5bebc4d', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('85805bd7-3008-46e2-878c-e8bcb9ce7151', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('858db753-a334-48c0-a035-1b6a9052ad14', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:26', '2019-06-28 13:50:26');
INSERT INTO `job_execution_log` VALUES ('867aa46e-833e-4b83-96ee-9cdb45c312a6', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:22', '2019-06-28 13:51:22');
INSERT INTO `job_execution_log` VALUES ('86b21014-5277-4075-8697-998c5218bed2', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:16', '2019-06-28 13:50:16');
INSERT INTO `job_execution_log` VALUES ('86ceab34-85f9-4b6c-89fd-bce0338d5ca2', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:55', '2019-06-28 13:50:55');
INSERT INTO `job_execution_log` VALUES ('86e926f3-08ec-4381-a09e-0c4f172c6565', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('86fb2dfe-54f5-4c4c-a3bf-17278adf5424', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:32', '2019-06-28 13:50:32');
INSERT INTO `job_execution_log` VALUES ('87e9cee8-8046-4385-a7d4-fdf569df1d0e', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
INSERT INTO `job_execution_log` VALUES ('8adbaf67-95bd-48db-9e99-1fc05fa7ff25', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:27', '2019-06-28 13:50:27');
INSERT INTO `job_execution_log` VALUES ('8b80028f-9c8c-4651-b03c-30d58013da3a', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:04', '2019-07-05 17:00:04');
INSERT INTO `job_execution_log` VALUES ('8c1e42dc-3ea5-471f-8ac7-dc046b52d2f1', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('8d0d2427-50a9-438b-8990-2ffa253e0aff', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:02', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('8d820c42-0913-4d69-9a4c-91ff67867ca5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('8efdbdde-1f23-4414-a9f2-ed6ac8c5e960', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('9048c0b2-3da8-4300-a605-6a965a357df5', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:59', '2019-06-28 13:49:59');
INSERT INTO `job_execution_log` VALUES ('92503731-199f-442c-b49a-68b8e71973a7', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:47', '2019-06-28 13:50:47');
INSERT INTO `job_execution_log` VALUES ('9359e73e-c657-4cf0-9a6d-876d294f19e5', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('940090f1-3ee3-4cb8-abc0-4d15e5867e8f', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:52', '2019-06-28 13:50:52');
INSERT INTO `job_execution_log` VALUES ('943ed6d9-9dab-4e57-9063-704b5fb89ff4', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('9474f442-bc66-4ff3-82bb-8a0e8f83e239', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:21', '2019-06-28 13:50:21');
INSERT INTO `job_execution_log` VALUES ('9519f784-99bf-4b5c-bce9-c918ae87e485', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('9702ccfd-7d97-4611-9b29-61878c132713', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:03', '2019-07-03 10:00:03');
INSERT INTO `job_execution_log` VALUES ('9735c028-b603-4414-b3f4-b9dd6e1834c9', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:22', '2019-06-28 13:51:22');
INSERT INTO `job_execution_log` VALUES ('9798f2f0-e34d-4fdd-a3a1-cdd3106b1759', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('9a9d22ae-46c2-4fbe-805a-7d6b33c2c9c2', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:42', '2019-06-28 13:50:42');
INSERT INTO `job_execution_log` VALUES ('9aab906d-1fe3-4f3e-a7ad-fe5daadc0cff', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('9b135de3-80f3-42ff-ae0c-d10dcbb5790b', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:57', '2019-06-28 13:50:57');
INSERT INTO `job_execution_log` VALUES ('9eaae97b-d487-4f21-9f27-fa64d443355d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:46', '2019-06-28 13:50:46');
INSERT INTO `job_execution_log` VALUES ('a0b8c7b5-0611-4a4f-bc30-f06818fa178e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:03', '2019-07-02 10:00:03');
INSERT INTO `job_execution_log` VALUES ('a219cb21-f1a4-49a3-8df9-9a15b558323d', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:42', '2019-06-28 13:50:42');
INSERT INTO `job_execution_log` VALUES ('a2287288-797f-4a84-ae3a-5ac6e135aae0', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('a4f8fd93-b234-48cc-aa31-0eed0e732ac6', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:35', '2019-06-28 13:50:35');
INSERT INTO `job_execution_log` VALUES ('a547c6ba-14b9-49a0-a45f-736dba940489', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:27', '2019-06-28 13:50:27');
INSERT INTO `job_execution_log` VALUES ('a611baa5-fb08-48cb-9489-4044f5e61d87', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:16', '2019-06-28 13:50:16');
INSERT INTO `job_execution_log` VALUES ('a612ab22-35ff-4f6c-9b93-4157a5814685', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:15', '2019-06-28 13:51:15');
INSERT INTO `job_execution_log` VALUES ('a6ba58c9-f056-450a-a76f-84fef22a4a99', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('a7321fde-a21a-42ab-8437-bdb6406ee8b5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('a737a34b-3e3c-4b11-ad24-96f2c53e3ba3', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:22', '2019-06-28 13:50:22');
INSERT INTO `job_execution_log` VALUES ('a773fe1a-10ad-4bcb-9900-cd8b2687eeb9', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:03', '2019-07-03 10:00:03');
INSERT INTO `job_execution_log` VALUES ('a8fd6c43-18d6-479d-91e7-3afdaa0b84ec', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('aa58bc1b-69b7-4254-85ac-344e6e4dbd11', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:16', '2019-06-28 13:51:16');
INSERT INTO `job_execution_log` VALUES ('aa662c69-80d4-45cf-86fe-97e989c978ab', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:02', '2019-06-28 15:00:02');
INSERT INTO `job_execution_log` VALUES ('ab237455-18e1-438a-a191-c150da6ef0f5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:30', '2019-06-28 13:50:30');
INSERT INTO `job_execution_log` VALUES ('abc6e14a-a354-4155-9401-e882f457131c', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:03', '2019-07-02 10:00:03');
INSERT INTO `job_execution_log` VALUES ('ac1b7b55-9b99-401f-9d33-4582654cc337', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('ada9924f-f761-4aaa-84ce-189296e5971b', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:02', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('ae6803fd-f222-41c8-a367-910c9abc54ab', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:02', '2019-06-28 16:00:02');
INSERT INTO `job_execution_log` VALUES ('ae7b8f45-772d-4f94-b9bf-82a53590890f', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('aee01d19-2233-40af-ad47-80bc1fc3795d', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:18', '2019-06-28 13:51:18');
INSERT INTO `job_execution_log` VALUES ('af985f39-3dfc-491f-83f1-432b09d0235a', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('b03c3299-9d49-41f9-8304-437962765949', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('b05992b4-cbd8-430b-80e7-1c12e75f00a1', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:02', '2019-06-28 13:51:02');
INSERT INTO `job_execution_log` VALUES ('b0f04404-e552-4064-b70a-0aa76735b8ff', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('b27601c5-f9f4-4872-b8ab-3f2ace6a9e41', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('b3d8b1e5-a647-455a-96de-a4017014eea5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('b665bfc7-945b-4393-aa6d-9fe68dec9f38', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:02', '2019-07-02 15:00:02');
INSERT INTO `job_execution_log` VALUES ('b665d08b-a5b0-4728-9c4d-888c1b338db5', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('b676b271-003f-4a9a-9e76-0e7aaf44070f', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('b99070ff-64f1-4177-93b2-7c5b7c2ae0dd', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:12', '2019-06-28 13:50:12');
INSERT INTO `job_execution_log` VALUES ('bac14f8d-0adb-425f-a1db-4835964683f3', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:01', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('bad4040f-a151-4f56-aa3b-5941b692640b', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:26', '2019-06-28 13:50:26');
INSERT INTO `job_execution_log` VALUES ('bb86a8a0-3a3f-4724-9b03-1f830cdde773', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:15', '2019-06-28 13:50:15');
INSERT INTO `job_execution_log` VALUES ('bbf07b40-1680-4157-b595-1c0e8d5f4d6a', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:02', '2019-06-28 15:00:02');
INSERT INTO `job_execution_log` VALUES ('bc909a9f-c9ad-4b36-a0ea-98bb726303bd', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('be8751d3-2d4c-4d05-b89f-a5b735f4f9b5', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:01', '2019-06-28 13:50:01');
INSERT INTO `job_execution_log` VALUES ('bf1f2ebb-a132-4d9c-b4a6-83af1dc706a8', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:47', '2019-06-28 13:50:47');
INSERT INTO `job_execution_log` VALUES ('bf6654df-8cf9-4558-ac59-5df6ea5b80ce', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('c0a87a0d-b0ac-4150-bc25-f5def3ddd3ed', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:57', '2019-06-28 13:50:57');
INSERT INTO `job_execution_log` VALUES ('c187f2a5-ff34-401e-abb8-d761ce2a57b6', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:42', '2019-06-28 13:50:42');
INSERT INTO `job_execution_log` VALUES ('c2f38b1b-d848-413a-948e-2500096eb924', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:15', '2019-06-28 13:51:15');
INSERT INTO `job_execution_log` VALUES ('c42fcbbe-a094-4103-9249-b6a96a5ff8b2', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:02', '2019-06-28 13:50:02');
INSERT INTO `job_execution_log` VALUES ('c57bd1f2-b204-4ddc-b5f1-a829ef4f33ce', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:02', '2019-07-03 10:00:02');
INSERT INTO `job_execution_log` VALUES ('c594895d-6862-46c3-bc33-badfaa88643d', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('c6059a38-184f-463c-a400-dc5a6ca0361e', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('ca1d1867-6ddb-478f-8d8e-f36791205b8d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
INSERT INTO `job_execution_log` VALUES ('caa16569-462f-49c1-a890-9cc774bfccb4', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:07', '2019-06-28 13:50:07');
INSERT INTO `job_execution_log` VALUES ('cb471e4a-bd13-47c0-b189-fbeb12fe50ed', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:22', '2019-06-28 13:50:22');
INSERT INTO `job_execution_log` VALUES ('cb6a69b6-51a8-4878-890f-9a979b4a7faf', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('cb9be640-77b7-4a7b-955b-fb2bc36b320e', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('cd589579-01c2-40e2-8c41-77bf49cc614f', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:03', '2019-07-04 18:00:03');
INSERT INTO `job_execution_log` VALUES ('cdd0d16b-0f5e-43ad-9bed-da56ded74e06', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('ce6a8611-29ce-4df0-a0b3-e8840d33990a', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:12', '2019-06-28 13:50:12');
INSERT INTO `job_execution_log` VALUES ('cfaf76f8-2d3b-4dda-9490-a364414047d0', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('d0d7d4dd-3330-4328-bd4c-9f16b4be6299', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:25', '2019-06-28 13:50:25');
INSERT INTO `job_execution_log` VALUES ('d3612e2e-fafe-4036-925d-46ae161a5221', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('d3891a6c-8894-468c-a036-bea3cc42360a', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:16', '2019-06-28 13:51:16');
INSERT INTO `job_execution_log` VALUES ('d3f3a9b7-4804-4cf5-84e5-974d6fc30f9e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:07', '2019-06-28 13:51:07');
INSERT INTO `job_execution_log` VALUES ('d46dc560-4697-49cf-a440-f4bb1bfe3e46', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('d500672f-efbd-471d-8489-1e43f285b7cf', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:03', '2019-07-02 17:00:03');
INSERT INTO `job_execution_log` VALUES ('d5661d16-c883-41f6-ad05-4b408d83c1da', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:02', '2019-06-28 15:00:02');
INSERT INTO `job_execution_log` VALUES ('d65102cb-183b-4b54-b5ba-eb45b1bac0a4', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('d9d2e300-c0fd-42f4-81c5-875d85d7d57e', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('daacd189-5098-4dcc-9e5c-68014a45078b', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:46', '2019-06-28 13:50:46');
INSERT INTO `job_execution_log` VALUES ('dacdc80a-4f32-4c01-8823-02a156e6cbda', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:36', '2019-06-28 13:50:36');
INSERT INTO `job_execution_log` VALUES ('db8acce6-a524-4fde-94c5-90a9374ed5e9', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 17:00:01', '2019-07-02 17:00:01');
INSERT INTO `job_execution_log` VALUES ('dbd4f395-8e33-4d54-a318-abd6e6508424', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:59', '2019-06-28 13:49:59');
INSERT INTO `job_execution_log` VALUES ('dc55c438-d998-437c-be47-5140acd9dba9', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:59', '2019-06-28 13:49:59');
INSERT INTO `job_execution_log` VALUES ('dcce0ba6-f6db-4b69-ab80-e03d55276e57', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:02', '2019-07-05 17:00:02');
INSERT INTO `job_execution_log` VALUES ('dee97dba-15e8-49ee-8b74-073af5e19d5c', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:11', '2019-06-28 13:51:11');
INSERT INTO `job_execution_log` VALUES ('df1deaf6-3a79-471e-af6f-1def161ba35b', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
INSERT INTO `job_execution_log` VALUES ('df6a5d48-3db4-4f69-80e6-0fe1ec584d60', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('e0e08576-0d21-48f4-8861-bffb422c408f', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:20', '2019-06-28 13:50:20');
INSERT INTO `job_execution_log` VALUES ('e1940c87-0ee3-4efe-8bcd-38c43259adb9', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('e276ba72-e85c-4afe-9b52-d5e9ade3ef51', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:02', '2019-06-28 13:50:02');
INSERT INTO `job_execution_log` VALUES ('e4217cd0-f4b7-4317-bc01-969b4ba5cb07', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:10', '2019-06-28 13:50:10');
INSERT INTO `job_execution_log` VALUES ('e47726c0-9a99-4584-99e8-8ee463bbb0f6', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:31', '2019-06-28 13:51:31');
INSERT INTO `job_execution_log` VALUES ('e57f3330-7ba5-47e2-8027-2e11408557c7', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:07', '2019-06-28 13:50:07');
INSERT INTO `job_execution_log` VALUES ('e5833f3b-577d-4bcb-81e0-fd4b1e96fe28', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('e5c14f62-a951-46ed-b6e1-e496de36095d', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 17:00:02', '2019-07-04 17:00:02');
INSERT INTO `job_execution_log` VALUES ('e69fbb47-6158-45c8-b373-478e0e652e4a', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:45', '2019-06-28 13:50:45');
INSERT INTO `job_execution_log` VALUES ('e83dc599-eada-4b94-82a7-2492ae2967ca', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:04', '2019-07-05 17:00:04');
INSERT INTO `job_execution_log` VALUES ('ea02a595-39ed-44ca-8e87-336e410768d5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('eb2397fb-3496-4806-afc6-b69682ad7c8d', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:47', '2019-06-28 13:50:47');
INSERT INTO `job_execution_log` VALUES ('ee09a428-36d2-48bd-84f5-e265a2737c38', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 10:00:02', '2019-07-02 10:00:02');
INSERT INTO `job_execution_log` VALUES ('ee1a4628-4b10-43e3-9db6-b8c5f089ed11', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:20', '2019-06-28 13:51:20');
INSERT INTO `job_execution_log` VALUES ('efff9848-f4fb-4d42-a1d0-e752fb8b83a4', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:26', '2019-06-28 13:51:26');
INSERT INTO `job_execution_log` VALUES ('f1210626-4ab4-4f07-91ae-220037387cb2', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('f21c2acb-f2a9-47cb-8cc4-8b001cebd9c4', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 16:00:01', '2019-06-28 16:00:01');
INSERT INTO `job_execution_log` VALUES ('f2d7bf78-d663-4dff-8ff2-69b5aff6c775', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 16:00:01', '2019-07-02 16:00:01');
INSERT INTO `job_execution_log` VALUES ('f348e73a-fb89-4deb-aa79-cec55026cc20', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-03 10:00:03', '2019-07-03 10:00:03');
INSERT INTO `job_execution_log` VALUES ('f3abef8b-e350-43a4-9a9e-757f2993fef5', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:03', '2019-06-28 14:00:03');
INSERT INTO `job_execution_log` VALUES ('f3bf3976-0b18-4815-b0f4-94573c4a4554', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:22', '2019-06-28 13:51:22');
INSERT INTO `job_execution_log` VALUES ('f3c3aecb-25ab-4e52-890f-77cdf86962a9', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-04 18:00:01', '2019-07-04 18:00:01');
INSERT INTO `job_execution_log` VALUES ('f3d6f914-81ea-4284-8983-cfb6df185b31', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:03', '2019-07-02 15:00:03');
INSERT INTO `job_execution_log` VALUES ('f4321dbd-f1be-4e55-93da-53080e5edc9e', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-05 17:00:04', '2019-07-05 17:00:04');
INSERT INTO `job_execution_log` VALUES ('f601739b-8c91-4941-97ed-b910f344dbcc', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:22', '2019-06-28 13:50:22');
INSERT INTO `job_execution_log` VALUES ('f663e7cb-d1b9-496d-9766-b98e6affed20', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('f69b2b34-46ae-47b2-a404-e107341be559', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:06', '2019-06-28 13:51:06');
INSERT INTO `job_execution_log` VALUES ('f6d0a8e9-8748-42d8-a079-dfba0c041bd5', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 15:00:01', '2019-06-28 15:00:01');
INSERT INTO `job_execution_log` VALUES ('f7432c7e-0448-4e5e-a718-150379eee2c5', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:17', '2019-06-28 13:50:17');
INSERT INTO `job_execution_log` VALUES ('f7faed0e-c64f-4b35-8d34-176290d102c0', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 14:00:02', '2019-06-28 14:00:02');
INSERT INTO `job_execution_log` VALUES ('f8142b5d-e9b4-4bd2-b1db-9e1a6a6c2325', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:01', '2019-06-28 13:51:01');
INSERT INTO `job_execution_log` VALUES ('f8178ef4-e485-4d4e-922b-7c4316c6c437', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-07-02 15:00:03', '2019-07-02 15:00:03');
INSERT INTO `job_execution_log` VALUES ('f82c1aaa-030f-4446-95fe-e7097972be5c', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:45', '2019-06-28 13:50:45');
INSERT INTO `job_execution_log` VALUES ('fa6377ea-0584-49ad-835c-e5e691b95640', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 0, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:49:57', '2019-06-28 13:49:57');
INSERT INTO `job_execution_log` VALUES ('fa6dda1d-3c0d-4102-a012-c2c8d4da1e19', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:41', '2019-06-28 13:50:41');
INSERT INTO `job_execution_log` VALUES ('fab6328d-6a9d-4779-b459-d6e82a4ee11a', 'spring-dataflow-job', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:02', '2019-06-28 13:50:02');
INSERT INTO `job_execution_log` VALUES ('fb4089d7-4bdb-48d7-8fa5-b6d1675cb4b2', 'spring-simple-job2', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:05', '2019-06-28 13:50:05');
INSERT INTO `job_execution_log` VALUES ('fc632bf8-07f1-4966-a7b1-681dc4cf43ec', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 2, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:51:36', '2019-06-28 13:51:36');
INSERT INTO `job_execution_log` VALUES ('fddf218e-87ad-47db-8c8f-c57561c190f6', 'spring-simple-job', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', 'AGOBW-901310945', '172.27.112.1', 1, 'NORMAL_TRIGGER', NULL, 1, '2019-06-28 13:50:50', '2019-06-28 13:50:50');
COMMIT;

-- ----------------------------
-- Table structure for job_status_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `job_status_trace_log`;
CREATE TABLE `job_status_trace_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `original_task_id` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `slave_id` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `execution_type` varchar(20) NOT NULL,
  `sharding_item` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `TASK_ID_STATE_INDEX` (`task_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='任务轨迹表';

-- ----------------------------
-- Records of job_status_trace_log
-- ----------------------------
BEGIN;
INSERT INTO `job_status_trace_log` VALUES ('013c747f-6274-44e2-97ba-8dfa6cc9e923', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:31');
INSERT INTO `job_status_trace_log` VALUES ('01bd74e9-c466-4718-b280-aeb7f8abceac', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-04 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('0234a7b1-b8fa-4766-ac0a-a7f8adb63ebe', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:45');
INSERT INTO `job_status_trace_log` VALUES ('02c211a8-48df-46d7-aa2e-e53aa842eaa8', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:35');
INSERT INTO `job_status_trace_log` VALUES ('043704ce-bf12-4e6f-83c4-42e4b074a1e6', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('05785dfb-9501-455a-8a4a-17b7eeddd873', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:10');
INSERT INTO `job_status_trace_log` VALUES ('05cc5a10-67c9-43e6-a2f4-874c3b0c9aa5', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:57');
INSERT INTO `job_status_trace_log` VALUES ('0631b6de-0cab-45d8-a9b3-20d0655961b4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('07513103-3776-40af-8fe9-0dc9ad04f7e0', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:11');
INSERT INTO `job_status_trace_log` VALUES ('0bb21476-b9f6-4ee7-b7b0-72a122162d39', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:36');
INSERT INTO `job_status_trace_log` VALUES ('0f15a559-e998-45b7-ad35-738f2cdd2ad8', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:40');
INSERT INTO `job_status_trace_log` VALUES ('108e34c6-e021-4870-a1f8-65eb1feb3a44', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('109917fb-19bf-40f1-bc72-6b95a30d24da', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('11b5b18b-bf10-45ae-97c2-b2d03e474c89', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('11f9017d-b3f4-4a62-a591-0f768d3f46d5', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-04 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('128a68c5-f0ba-4370-8406-b139c8bb034e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:57');
INSERT INTO `job_status_trace_log` VALUES ('14c5b110-41f3-4e77-95d9-e1b3707abc01', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:50');
INSERT INTO `job_status_trace_log` VALUES ('14d21c67-f810-40a7-ae2a-9cd4b6b91225', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-03 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('15d4d4ec-3240-4cd9-8168-b9b03c437f7a', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 17:00:01');
INSERT INTO `job_status_trace_log` VALUES ('16d1d4cb-4206-4f86-a73b-4f0c470af4be', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:23');
INSERT INTO `job_status_trace_log` VALUES ('16fff0d3-8ce6-4157-b4d9-e56f43a1d603', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:10');
INSERT INTO `job_status_trace_log` VALUES ('173ac722-daad-4d84-b27c-30032f149691', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:28');
INSERT INTO `job_status_trace_log` VALUES ('184498f3-e258-459e-9fce-93769aec4074', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:46');
INSERT INTO `job_status_trace_log` VALUES ('18b1d7ad-bb6b-4de6-9fe9-07ef3cac295d', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:47');
INSERT INTO `job_status_trace_log` VALUES ('1b18b3cc-248e-4852-96b4-4b29c2e94d14', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-02 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('1b845a7c-86ce-4b34-bd31-5888e904d1f5', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:35');
INSERT INTO `job_status_trace_log` VALUES ('1bd7a01d-3c74-4e1d-a9c2-fa6fee06fb39', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:10');
INSERT INTO `job_status_trace_log` VALUES ('1c460afb-0dcf-42a9-a6dc-135a49a90588', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:45');
INSERT INTO `job_status_trace_log` VALUES ('1c570278-2842-4749-8d38-ab4b9a58da4e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:32');
INSERT INTO `job_status_trace_log` VALUES ('1cc9bcbb-ea9b-43f9-8be7-3bb4c108b090', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:16');
INSERT INTO `job_status_trace_log` VALUES ('1cccdf0e-0aec-425c-a83b-8ef4c4491fae', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:10');
INSERT INTO `job_status_trace_log` VALUES ('1d84ae42-e107-4019-8adf-9355a7168b73', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 14:00:02');
INSERT INTO `job_status_trace_log` VALUES ('1e71410a-222c-4f01-969c-1997fff6860e', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:01');
INSERT INTO `job_status_trace_log` VALUES ('20045f54-4220-48fa-921b-cc9b8d27c48a', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('20205067-2dd1-46ba-825f-ec99e70f881d', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('20353b55-b178-4407-9a61-274d85becc34', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-05 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('220d34d9-d3a4-4320-a088-cb2715433cf8', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:41');
INSERT INTO `job_status_trace_log` VALUES ('222619bd-9e6b-42a6-b33f-2db1017f93f4', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 15:00:00');
INSERT INTO `job_status_trace_log` VALUES ('22d6f091-bb7a-4644-9431-e7da7783fbc2', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:36');
INSERT INTO `job_status_trace_log` VALUES ('23bbd505-8d2b-4ca3-b020-4b199a5ee114', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:02');
INSERT INTO `job_status_trace_log` VALUES ('249736c5-40cd-4e0e-9c9b-c5c884925f74', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 14:00:03');
INSERT INTO `job_status_trace_log` VALUES ('24b22436-6582-4ddf-992f-255a3aa9ec92', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:25');
INSERT INTO `job_status_trace_log` VALUES ('25a98d5f-f51a-4320-bc3a-5b14125165ec', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:42');
INSERT INTO `job_status_trace_log` VALUES ('279bf1c4-4910-44ca-a3d7-dd06f192ed5f', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 15:00:00');
INSERT INTO `job_status_trace_log` VALUES ('27b72759-54e0-4ded-910a-4a49134d870c', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:49:59');
INSERT INTO `job_status_trace_log` VALUES ('28efca68-2c0b-4077-b9f4-d7f8d21ea58c', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:12');
INSERT INTO `job_status_trace_log` VALUES ('2908f037-3a83-4f86-9714-174320fe8798', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-03 10:00:04');
INSERT INTO `job_status_trace_log` VALUES ('29cfcf32-5512-441f-8fc8-66c90efc5a9e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:40');
INSERT INTO `job_status_trace_log` VALUES ('2a0d9c43-4e64-4f6c-bb79-5ec40b1752eb', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 16:00:02');
INSERT INTO `job_status_trace_log` VALUES ('2a2a7e1e-1ccf-4b19-8c64-e2ad86dc7fbf', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('2adf368c-6bf6-4e84-8e56-c3c9222510e8', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:28');
INSERT INTO `job_status_trace_log` VALUES ('2b8359e5-e2a9-4140-be0d-0c53200edded', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:07');
INSERT INTO `job_status_trace_log` VALUES ('2ca9e346-819d-4008-9bb3-fcd6c7eac2e2', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:50');
INSERT INTO `job_status_trace_log` VALUES ('2d941f42-4b16-4a86-ae7d-409e12b4be3e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 16:00:02');
INSERT INTO `job_status_trace_log` VALUES ('2e050164-c7ab-46e8-b049-ce6759ca46bc', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:05');
INSERT INTO `job_status_trace_log` VALUES ('2e6408fd-9f23-4dac-bf42-d2eaa4d7351e', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-03 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('2f8ce323-1e29-4876-a68c-51b9d47d8502', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:20');
INSERT INTO `job_status_trace_log` VALUES ('2fb5c3dc-952f-478e-bddc-fc456161d19e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:07');
INSERT INTO `job_status_trace_log` VALUES ('300c81be-9428-4258-b929-94674a9ec059', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:02');
INSERT INTO `job_status_trace_log` VALUES ('3019c795-26ee-47bc-9780-e271bb3aadc0', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:01');
INSERT INTO `job_status_trace_log` VALUES ('301aabce-6f82-4f58-91b5-a18ee4270924', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:47');
INSERT INTO `job_status_trace_log` VALUES ('30e677bf-4f0f-4f4f-b06b-92b5a9804256', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 18:00:03');
INSERT INTO `job_status_trace_log` VALUES ('32909e70-c474-4a80-ad51-e3092541aa40', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-03 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('338e6d56-8a87-4ba7-81d8-29a8a7d9d904', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:30');
INSERT INTO `job_status_trace_log` VALUES ('33e00e55-7b42-454e-a049-1fcfeb56ae05', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-02 17:00:01');
INSERT INTO `job_status_trace_log` VALUES ('3436de4a-840c-43c4-a8c0-732cd10cba51', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:46');
INSERT INTO `job_status_trace_log` VALUES ('36d9f62e-af4e-4d3a-b0b3-7284c3ab1b3f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('39e9e558-c535-457f-b09f-2bb17ed9b48c', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:30');
INSERT INTO `job_status_trace_log` VALUES ('3add9bf0-ceaf-4290-acf9-2f568f73b75c', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:00');
INSERT INTO `job_status_trace_log` VALUES ('3baf9f76-096e-429a-a0e0-29f02b4fcb7f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:11');
INSERT INTO `job_status_trace_log` VALUES ('3df72228-0d6f-444b-bf71-93615fae5d50', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:56');
INSERT INTO `job_status_trace_log` VALUES ('402fce99-79a3-46fb-abb8-8c1d9c2605a7', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:49:58');
INSERT INTO `job_status_trace_log` VALUES ('43bf919d-a662-481d-80f1-bf42baf1ef13', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:20');
INSERT INTO `job_status_trace_log` VALUES ('43f87f3a-f447-4ff1-8179-7f8f9d9656a4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:15');
INSERT INTO `job_status_trace_log` VALUES ('44d64a90-bb2e-48cb-a30d-ab5b8d822476', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 10:00:04');
INSERT INTO `job_status_trace_log` VALUES ('453f586b-bab5-4b03-a19e-7604a10fe16a', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('4649d01d-d219-4888-a56f-f4b187c192e8', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:15');
INSERT INTO `job_status_trace_log` VALUES ('46e1b0c6-3db7-4cc4-9885-d5821104864a', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:05');
INSERT INTO `job_status_trace_log` VALUES ('47a27bc6-39f4-454f-b03f-018775289729', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('49162e1c-d01b-458d-9234-73ce5d046952', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:20');
INSERT INTO `job_status_trace_log` VALUES ('493e8335-0005-4dc2-ad35-4c75444f5768', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:00');
INSERT INTO `job_status_trace_log` VALUES ('4a4b70ba-5bb4-49de-b417-0817d832ee48', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('4a526ca9-209b-4d27-a6b1-dda23096e68b', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 17:00:04');
INSERT INTO `job_status_trace_log` VALUES ('4d6b5a35-6d92-41dd-aeb0-950a5b1d95ec', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:06');
INSERT INTO `job_status_trace_log` VALUES ('4e19d3d9-f387-4362-92d7-eb097f26afa6', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('4e3b8be1-8945-48db-98f6-54002128f6ec', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:56');
INSERT INTO `job_status_trace_log` VALUES ('4e9ab859-21c4-486a-b5bf-f694c93e5b1f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:42');
INSERT INTO `job_status_trace_log` VALUES ('500be28e-dfaa-4dce-ac0a-6aed8d1f006c', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:20');
INSERT INTO `job_status_trace_log` VALUES ('5110cb4c-b51d-4703-b33f-1d3b59d669fc', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('5116d6cc-687a-47f3-90e5-edd951cbb4a9', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('535d066a-b6fc-4e7a-bc88-7997d0ae64a1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:37');
INSERT INTO `job_status_trace_log` VALUES ('54804b3e-de7d-4a7e-a56a-4ea714856fb5', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:10');
INSERT INTO `job_status_trace_log` VALUES ('54fc8610-5817-44e6-b6bb-16c5c5b569ff', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:30');
INSERT INTO `job_status_trace_log` VALUES ('5501695f-bc60-47c0-bcde-40c90af35948', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:21');
INSERT INTO `job_status_trace_log` VALUES ('56188955-191a-42f8-82d7-a458e36b82c0', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-02 17:00:01');
INSERT INTO `job_status_trace_log` VALUES ('58098173-c9c2-41db-a8fd-1aa8cf8bb3e5', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:00');
INSERT INTO `job_status_trace_log` VALUES ('59f264c0-2d9a-4636-a0fa-901e40e5ba18', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:01');
INSERT INTO `job_status_trace_log` VALUES ('5b93f09f-eadf-4f11-b22d-39b4339e115b', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:15');
INSERT INTO `job_status_trace_log` VALUES ('5c61705c-5be6-4670-b31d-ce8791407e4c', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:30');
INSERT INTO `job_status_trace_log` VALUES ('5d2fec33-3f38-4179-92a4-3b2294e29df1', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-03 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('5dd3ffc8-68d8-4680-8e0a-4701da56bfa2', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:31');
INSERT INTO `job_status_trace_log` VALUES ('5e243a8d-d54b-4f18-b345-c5a559bc9810', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:31');
INSERT INTO `job_status_trace_log` VALUES ('5fe3c1e9-c3cf-41bd-a723-5f145c1e136f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:01');
INSERT INTO `job_status_trace_log` VALUES ('602a71bd-9907-4cee-ac32-7fefdba46ae1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:55');
INSERT INTO `job_status_trace_log` VALUES ('606912b5-f867-4140-b784-a3ff86fd4526', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-05 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('60efec06-3e45-4af1-a4d3-42871481de4f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:31');
INSERT INTO `job_status_trace_log` VALUES ('624c395d-3dba-4316-a205-fa466a9d6e8b', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 15:00:00');
INSERT INTO `job_status_trace_log` VALUES ('6376ff9d-dc4c-46e6-baab-8c78e41fec29', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:23');
INSERT INTO `job_status_trace_log` VALUES ('639fb248-0db8-47a3-87b8-62ace820a9c2', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:10');
INSERT INTO `job_status_trace_log` VALUES ('63e0b382-0288-4cec-a93a-dbde53025a45', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:05');
INSERT INTO `job_status_trace_log` VALUES ('641c2914-fb48-4125-a5c5-75cca3153dd0', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:41');
INSERT INTO `job_status_trace_log` VALUES ('64f4df49-a697-4f43-95ee-d1c9454d93eb', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('65657999-9df6-4848-b344-5819497e315b', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:21');
INSERT INTO `job_status_trace_log` VALUES ('66f653f0-6587-46e9-b7a2-074091c078a7', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:20');
INSERT INTO `job_status_trace_log` VALUES ('6732142a-bb4b-4e6a-912d-bb025ec1df1c', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('68e9a949-dee5-46a4-b4d5-a7b7d6e52dfb', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:21');
INSERT INTO `job_status_trace_log` VALUES ('69256d32-3b34-4470-9e9f-a6a4f82a3a1b', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:41');
INSERT INTO `job_status_trace_log` VALUES ('692ac750-b976-4588-9c91-cb145961ab9b', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:15');
INSERT INTO `job_status_trace_log` VALUES ('69f886e8-e851-499c-83f8-45d5f8f76304', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:11');
INSERT INTO `job_status_trace_log` VALUES ('6accccc5-0b02-4910-8bce-d102fed62f7f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:27');
INSERT INTO `job_status_trace_log` VALUES ('6ba3cfbc-cde3-432a-a4c7-cf149af284ef', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:25');
INSERT INTO `job_status_trace_log` VALUES ('6c084a42-2af2-4e5a-84b8-71b2047b1f55', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:30');
INSERT INTO `job_status_trace_log` VALUES ('6c8a3745-8cb9-4553-9ce8-6d6768bb254e', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('6cba5d07-d9ad-4495-a79a-c7ac3e69c9d5', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 14:00:03');
INSERT INTO `job_status_trace_log` VALUES ('6d7816fe-9fa6-436d-b427-8eaff1076a9c', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:07');
INSERT INTO `job_status_trace_log` VALUES ('6dd52ad3-8d97-4034-b702-0566b9f17b42', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-05 17:00:04');
INSERT INTO `job_status_trace_log` VALUES ('6eec5521-f5a3-40cf-ae6a-bbc58de5efb4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:51');
INSERT INTO `job_status_trace_log` VALUES ('6f419683-cd98-4117-9be4-9e81238ab02a', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:51');
INSERT INTO `job_status_trace_log` VALUES ('6fc927b7-b22c-4511-9d05-10f139e371fa', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:00');
INSERT INTO `job_status_trace_log` VALUES ('70e4c7a8-39a1-497e-a32c-36236d042921', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:36');
INSERT INTO `job_status_trace_log` VALUES ('7156925d-67fa-4bb1-b68a-46aea883de03', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-02 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('722516be-4dfd-4338-8340-b0eba9de895d', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:10');
INSERT INTO `job_status_trace_log` VALUES ('72a76a4e-3813-4048-adcf-75e87fa933e0', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:13');
INSERT INTO `job_status_trace_log` VALUES ('731a90a8-cbe4-4d99-a7f7-cb6ad8912bd6', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:26');
INSERT INTO `job_status_trace_log` VALUES ('73406d50-2b02-4e17-b5e2-4583f33efcd4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:35');
INSERT INTO `job_status_trace_log` VALUES ('776c1492-2ac6-4a0e-8bc1-83f9976bf311', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('79636bc0-1a2b-41d6-b016-5f7f8a38b4ab', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:26');
INSERT INTO `job_status_trace_log` VALUES ('7b5292cb-42fd-4863-9250-ce7c198a4d97', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:55');
INSERT INTO `job_status_trace_log` VALUES ('7d259e46-2a21-4d7d-8672-b42d57bbbcbc', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:55');
INSERT INTO `job_status_trace_log` VALUES ('7e212472-1e59-47c8-b62f-af11bfc75624', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:25');
INSERT INTO `job_status_trace_log` VALUES ('7ebac475-d519-4709-afdd-1229ccdddfde', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-02 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('7f96b168-9c27-4543-ae6d-9f651eb84921', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('8096f378-6c53-45a0-837b-2abddf00c644', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:32');
INSERT INTO `job_status_trace_log` VALUES ('84f2cfad-0ddb-457c-96d6-fb58d9bf210f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:33');
INSERT INTO `job_status_trace_log` VALUES ('8670bcd0-284b-46c9-a50f-493a9b8aa5d3', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('86c222c6-246c-40f4-8045-d504b87d96ed', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:50');
INSERT INTO `job_status_trace_log` VALUES ('872a73b7-8754-486e-b181-81f84fdb513f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:18');
INSERT INTO `job_status_trace_log` VALUES ('8ae70d80-d317-4e17-9874-e68d4d004cf1', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:16');
INSERT INTO `job_status_trace_log` VALUES ('8d385af7-aca5-46a5-a1a2-19bede3004de', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('8da9654d-b13a-4b9b-9c03-d0f429bb7615', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:50');
INSERT INTO `job_status_trace_log` VALUES ('9073e669-1a53-4fe3-a7eb-bbd75b63ac7b', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:15');
INSERT INTO `job_status_trace_log` VALUES ('931a121e-5b2e-4c7e-a459-bf2359959a7f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:00');
INSERT INTO `job_status_trace_log` VALUES ('95dabcda-45fa-4903-804c-0ca3013fc064', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-04 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('95ebc064-eb3c-4a34-ae8f-8f409f039544', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-05 17:00:04');
INSERT INTO `job_status_trace_log` VALUES ('96f0909b-92cc-4e56-aec6-fc9b22fd2b09', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('99a1965d-3d00-4256-90ff-d8e9c75fed2e', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('9a0dcbf6-146d-4b2b-8557-f6010fbabf3f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:40');
INSERT INTO `job_status_trace_log` VALUES ('9a480307-e00d-45fb-b3cb-748ec83fce19', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 18:00:01');
INSERT INTO `job_status_trace_log` VALUES ('9b16f209-b4a4-4aa8-b5f4-d2f45540b4a2', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:27');
INSERT INTO `job_status_trace_log` VALUES ('9ba3d815-0ebe-45ec-b57d-dfd2300cc624', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('9cc0975d-467e-4c1a-a9d6-8f1d2b0f8849', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 16:00:02');
INSERT INTO `job_status_trace_log` VALUES ('9d40f3be-3db2-4704-b5c5-c3047d476b5b', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-04 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('9d89748c-f13d-497a-8d12-7089d3ae9d6a', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:50:50');
INSERT INTO `job_status_trace_log` VALUES ('9efb39e8-71ae-479a-9121-124c1bf40c4a', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:05');
INSERT INTO `job_status_trace_log` VALUES ('a00e274a-9150-4bda-a318-f178d4844fb1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:22');
INSERT INTO `job_status_trace_log` VALUES ('a10e2824-043e-4159-a28f-25c36462a6bf', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 14:00:01');
INSERT INTO `job_status_trace_log` VALUES ('a156e102-5ee8-462c-bb30-cc875e7148a5', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:10');
INSERT INTO `job_status_trace_log` VALUES ('a205d9f2-7ea8-418c-9d40-5cbc6504c2d4', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:35');
INSERT INTO `job_status_trace_log` VALUES ('a2a13ad5-5477-4248-94f5-11230177a887', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-02 17:00:01');
INSERT INTO `job_status_trace_log` VALUES ('a2e380c4-89b9-4db8-87c0-1c646b0c3b1a', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 10:00:03');
INSERT INTO `job_status_trace_log` VALUES ('a2fcef8c-1569-4011-9461-f12fa4461cd2', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 15:00:03');
INSERT INTO `job_status_trace_log` VALUES ('a308ee9b-5a4d-4847-a166-28c7978d3c2d', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:16');
INSERT INTO `job_status_trace_log` VALUES ('a32343c5-039b-4893-ba86-112fa39b3bf2', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:15');
INSERT INTO `job_status_trace_log` VALUES ('a3b46701-22dc-4c81-9a84-dd343f665752', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:20');
INSERT INTO `job_status_trace_log` VALUES ('a425d662-10b9-44ba-8031-ec2e4773f6ef', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:41');
INSERT INTO `job_status_trace_log` VALUES ('a4597cac-1158-4f90-83b8-4be0cb035d4b', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:52');
INSERT INTO `job_status_trace_log` VALUES ('a464ef4e-e8ff-4186-b79f-bbab2bdbb480', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 15:00:02');
INSERT INTO `job_status_trace_log` VALUES ('a4737be3-56ef-4fb4-a454-894c26967ab7', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:35');
INSERT INTO `job_status_trace_log` VALUES ('a47f78f3-ff99-436d-abe6-75226f65ab71', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:06');
INSERT INTO `job_status_trace_log` VALUES ('a4c970ad-5c71-4b5a-b1bb-d3f4e82654ef', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-02 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('a539c47e-3303-4e40-bf1b-2d77768ea1a4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:11');
INSERT INTO `job_status_trace_log` VALUES ('a7219fe2-ae83-4701-b948-c67126625643', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 15:00:02');
INSERT INTO `job_status_trace_log` VALUES ('a730513a-4977-4a93-b88c-147cad5543db', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:05');
INSERT INTO `job_status_trace_log` VALUES ('a8019371-8845-46eb-8cf0-dd7a8ebe9e4f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:25');
INSERT INTO `job_status_trace_log` VALUES ('a82e7b12-d708-4f0d-ab79-937f024d176e', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 14:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ab14103f-256d-49c1-bbde-fdd840774589', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:26');
INSERT INTO `job_status_trace_log` VALUES ('ab6694c1-02cc-4976-ad5d-38f8ac60b3da', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:56');
INSERT INTO `job_status_trace_log` VALUES ('acaa7f9f-749f-4fbc-8b1d-8e6dea53eaf7', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:01');
INSERT INTO `job_status_trace_log` VALUES ('acabb76b-83ac-43e9-a0f4-82d0500dec4e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-04 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('acf4b10c-0894-432b-9c34-83dfcf5db616', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-03 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ad37c660-80f0-4a6c-bb12-b78851a90bbf', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:01');
INSERT INTO `job_status_trace_log` VALUES ('aea0097b-b58a-483a-8c86-5a2f2f450ed1', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:30');
INSERT INTO `job_status_trace_log` VALUES ('aeae153c-591e-4e91-9371-c3e65a072386', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:30');
INSERT INTO `job_status_trace_log` VALUES ('af31108e-55fa-4e8f-8b46-2f2ae4c4cb18', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('b05bc5b8-f489-4504-bbe5-3a3416863ed6', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('b06b07c4-6eb9-478d-a218-ad9848a04ae6', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:31');
INSERT INTO `job_status_trace_log` VALUES ('b329ebda-000c-45dd-aa91-02ce520caed7', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:35');
INSERT INTO `job_status_trace_log` VALUES ('b34ea653-cd60-4bb9-869b-0f9159ef89f1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:30');
INSERT INTO `job_status_trace_log` VALUES ('b3c89aeb-8063-47e8-b2e6-0ab7319f2e27', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:17');
INSERT INTO `job_status_trace_log` VALUES ('b44e75d8-ba6b-483f-8fcc-24a4eef07c91', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-05 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('b479ddaa-98cc-4380-80dc-92ffa339e90e', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:20');
INSERT INTO `job_status_trace_log` VALUES ('b49a5fbc-f4b6-4c36-a63c-62b47d1ed515', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:12');
INSERT INTO `job_status_trace_log` VALUES ('b5b52c9b-ba3e-4ff9-be4e-a253bb6eb666', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:26');
INSERT INTO `job_status_trace_log` VALUES ('b5f97205-6a92-424c-8953-a8ceba319f1d', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:11');
INSERT INTO `job_status_trace_log` VALUES ('ba279288-a0e5-4185-908c-289963958452', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ba6ca212-e179-46a5-9f63-f6f61f2f450c', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('ba8a84a6-b0bf-4c88-875f-a80bcabcfb0e', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:16');
INSERT INTO `job_status_trace_log` VALUES ('ba8e0ab8-2e42-43cb-b846-386b45c4fea7', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 15:00:03');
INSERT INTO `job_status_trace_log` VALUES ('be9be0cf-0907-46e0-8da8-799e8293b305', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:55');
INSERT INTO `job_status_trace_log` VALUES ('bedc36ea-0f98-49c3-9c94-18ba1b4674fa', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:16');
INSERT INTO `job_status_trace_log` VALUES ('bee252e5-c573-400d-b5ed-1b7cc8e094ec', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 14:00:01');
INSERT INTO `job_status_trace_log` VALUES ('c084e4ba-5a37-4bfc-a32c-53a8b7639378', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:21');
INSERT INTO `job_status_trace_log` VALUES ('c0bf6a1a-bf50-4df0-a064-affbc92383c1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 15:00:03');
INSERT INTO `job_status_trace_log` VALUES ('c3ad282b-6bb4-46f2-a41a-60cc48dbac4b', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-05 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('c3fb1084-1f14-461a-ada7-a6843eb8ad04', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:10');
INSERT INTO `job_status_trace_log` VALUES ('c4abdfd6-d360-44dd-8a55-0881d84863e0', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('c4fd55ca-0109-468a-bb8d-30b1ddc22f2c', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:06');
INSERT INTO `job_status_trace_log` VALUES ('c571fdc8-75ae-4314-9351-46840c3b3e1a', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-07-02 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('c604f1ec-bd5d-47f6-b235-21fcaba3435f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:51:25');
INSERT INTO `job_status_trace_log` VALUES ('c7b10607-60fc-443e-9eb8-f5660baf177b', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:20');
INSERT INTO `job_status_trace_log` VALUES ('c865c281-373c-47bd-9334-b2bf2046a5b7', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 18:00:03');
INSERT INTO `job_status_trace_log` VALUES ('ca0c6efc-b5bd-41fb-a256-deb3c1118f3c', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:01');
INSERT INTO `job_status_trace_log` VALUES ('ca6be30a-6c15-4179-85a4-db574d2f86d9', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 15:00:02');
INSERT INTO `job_status_trace_log` VALUES ('cad7d036-ec86-44ea-ae05-15dcf94883fc', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:06');
INSERT INTO `job_status_trace_log` VALUES ('cc861f31-4df8-4101-b7da-5df220cf0a8d', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-04 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('cce5e7ff-dc2d-4b79-9197-72a7050996fb', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:45');
INSERT INTO `job_status_trace_log` VALUES ('cd81fbde-a199-441b-90f0-337c05d3d7b5', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@10664', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-02 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ce0bca06-d3cd-4d64-bae2-e0937bedcd2c', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:53');
INSERT INTO `job_status_trace_log` VALUES ('d0c27a57-7a3e-4f9a-b5fe-f33ea35ae40e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-03 10:00:03');
INSERT INTO `job_status_trace_log` VALUES ('d2692a83-0954-431a-9a09-c8d76775c303', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 14:00:01');
INSERT INTO `job_status_trace_log` VALUES ('d4202242-9190-48bb-b2c7-6567c6caa246', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('d4385cd5-2822-4278-b553-197582482f31', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:26');
INSERT INTO `job_status_trace_log` VALUES ('d49b8085-e7eb-4d54-9ab8-79d7968d23b7', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:15');
INSERT INTO `job_status_trace_log` VALUES ('d5de0ddf-5928-448f-9a8d-5362b4ba7bf0', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:06');
INSERT INTO `job_status_trace_log` VALUES ('d6d6bb9d-1221-4eda-9100-70ff24f9f54f', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:21');
INSERT INTO `job_status_trace_log` VALUES ('d78762d9-7f37-4194-bd72-05b6d3640445', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6596', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 17:00:01');
INSERT INTO `job_status_trace_log` VALUES ('d8305d9c-84b6-4caf-8e92-eff03770a5b1', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:00');
INSERT INTO `job_status_trace_log` VALUES ('d8e9cbad-2040-402a-b556-02f62faf4ec5', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:50:05');
INSERT INTO `job_status_trace_log` VALUES ('d9a945d0-6d48-45ca-b15c-ed39db66117d', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:06');
INSERT INTO `job_status_trace_log` VALUES ('d9e43c81-7720-46ea-b33b-56db2b081516', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:46');
INSERT INTO `job_status_trace_log` VALUES ('da558b1d-b6e7-44c1-902b-3000934aac94', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:01');
INSERT INTO `job_status_trace_log` VALUES ('da87e890-a5da-46ec-8a92-623cfb8c29da', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:31');
INSERT INTO `job_status_trace_log` VALUES ('daa99194-00b1-4fbd-a0c7-2caf591e258f', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:15');
INSERT INTO `job_status_trace_log` VALUES ('dbbf9d24-6cd7-4293-b8d3-d50812eac053', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 17:00:04');
INSERT INTO `job_status_trace_log` VALUES ('dcdaf8a9-3f9d-4551-9537-19dd0c2eb4e5', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 14:00:02');
INSERT INTO `job_status_trace_log` VALUES ('dd3a57b7-921d-47e9-a3df-3e366d6acb0e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:22');
INSERT INTO `job_status_trace_log` VALUES ('de0bd934-ba29-4c2f-906c-5cd9a2f95cc7', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-02 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('dfdc2f2d-bd04-4005-8e16-67124d675db2', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:05');
INSERT INTO `job_status_trace_log` VALUES ('dfed09d0-32ea-4261-8ab3-c79389a0ad4e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:35');
INSERT INTO `job_status_trace_log` VALUES ('e343ca51-97ad-46bf-bfd9-938cffc21c18', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 15:00:02');
INSERT INTO `job_status_trace_log` VALUES ('e5b23a60-6c13-414a-8aca-315428802513', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-06-28 13:51:20');
INSERT INTO `job_status_trace_log` VALUES ('e5c7fd4c-6afd-4b6c-984b-856e2e9a8189', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:16');
INSERT INTO `job_status_trace_log` VALUES ('e6236658-670c-4516-a064-79e16ff9a999', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:03');
INSERT INTO `job_status_trace_log` VALUES ('e6f3c144-a764-4872-a296-caafe8807b01', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:12');
INSERT INTO `job_status_trace_log` VALUES ('e70857ff-b31f-424d-b978-3e7ece630ecb', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-05 17:00:03');
INSERT INTO `job_status_trace_log` VALUES ('e80d935a-daea-4f8e-9185-0c6bed20dc49', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:25');
INSERT INTO `job_status_trace_log` VALUES ('e969a794-e50c-4701-ab71-5687b160be60', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:26');
INSERT INTO `job_status_trace_log` VALUES ('ea0a34b3-a1b6-445a-baa9-5df9c31e1bcc', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:49:59');
INSERT INTO `job_status_trace_log` VALUES ('ea83370c-21d1-4dac-910d-e05bb74c060c', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-06-28 13:50:45');
INSERT INTO `job_status_trace_log` VALUES ('ea877d2c-9120-4171-8f14-192f2b1ac217', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 18:00:01');
INSERT INTO `job_status_trace_log` VALUES ('eb55d21d-e3de-4738-870b-60af75a05f88', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:03');
INSERT INTO `job_status_trace_log` VALUES ('ec5f8199-8169-478d-85da-c85c42a9380e', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:07');
INSERT INTO `job_status_trace_log` VALUES ('ecf78d19-ef4f-40d8-9bb0-53f6e896d888', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-03 10:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ecfe3f05-789c-437b-a0ec-c04e1022f3cb', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-05 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('ed7b4c8f-5a84-4595-841f-db9a02176fa7', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:33');
INSERT INTO `job_status_trace_log` VALUES ('ed7d5fc7-e355-4dd0-9194-4119cb08bf00', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job2\' execute begin.', '2019-07-02 15:00:01');
INSERT INTO `job_status_trace_log` VALUES ('ee7d470e-83a2-4f52-9cb8-174837c7f4a4', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:36');
INSERT INTO `job_status_trace_log` VALUES ('eee63b4c-e2ef-417a-8b53-b950b6eca040', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:18');
INSERT INTO `job_status_trace_log` VALUES ('ef51a216-b868-468f-a35a-015a325da735', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:17');
INSERT INTO `job_status_trace_log` VALUES ('f18587fe-d873-4f20-94ef-595ef033b96e', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 14:00:02');
INSERT INTO `job_status_trace_log` VALUES ('f1aca58f-f44a-408d-9b0a-84091e60ae63', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:50:37');
INSERT INTO `job_status_trace_log` VALUES ('f1e45129-b75a-4729-a0ad-deb752d197bc', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@12072', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-05 17:00:02');
INSERT INTO `job_status_trace_log` VALUES ('f277b7e7-d3b9-4787-8a8d-544f70f4534c', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:50:05');
INSERT INTO `job_status_trace_log` VALUES ('f355ba51-7391-4e79-b80a-4c19e7779e41', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-dataflow-job\' execute begin.', '2019-07-02 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('f382c48e-a7be-457e-a36b-42b145bef6e2', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-04 18:00:01');
INSERT INTO `job_status_trace_log` VALUES ('f3af9d7d-032e-4ae2-a78a-4c219ea9b32b', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@14416', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-03 10:00:02');
INSERT INTO `job_status_trace_log` VALUES ('f3fad284-7585-442c-a128-93a31973d4c6', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:51:26');
INSERT INTO `job_status_trace_log` VALUES ('f464696b-be3c-4df0-bff4-90cd1d525ad1', 'spring-dataflow-job', '', 'spring-dataflow-job@-@0,1,2@-@READY@-@172.27.112.1@-@17364', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 16:00:03');
INSERT INTO `job_status_trace_log` VALUES ('f4a0db20-4ff5-445f-ad96-30494a21e03f', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-06-28 13:49:57');
INSERT INTO `job_status_trace_log` VALUES ('f505691e-4326-480a-9177-60991b139bd0', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@5676', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-04 18:00:01');
INSERT INTO `job_status_trace_log` VALUES ('f622a8e0-0d16-4a0e-bdf0-e518b7e6624f', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2019-07-02 16:00:01');
INSERT INTO `job_status_trace_log` VALUES ('fe96609c-fac5-435e-bbe1-9ab9714aa757', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'spring-simple-job\' execute begin.', '2019-06-28 13:51:25');
INSERT INTO `job_status_trace_log` VALUES ('fed1dbec-5da8-4fad-a858-52955463d97c', 'spring-simple-job2', '', 'spring-simple-job2@-@0,1,2@-@READY@-@172.27.112.1@-@6688', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-07-02 15:00:02');
INSERT INTO `job_status_trace_log` VALUES ('ffdd29ae-0e70-47b3-9ca4-2e301c1685e9', 'spring-simple-job', '', 'spring-simple-job@-@0,1,2@-@READY@-@172.27.112.1@-@17420', '172.27.112.1', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2019-06-28 13:51:36');
COMMIT;

-- ----------------------------
-- Table structure for pay_info
-- ----------------------------
DROP TABLE IF EXISTS `pay_info`;
CREATE TABLE `pay_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `money` decimal(65,2) DEFAULT NULL COMMENT '金额',
  `product_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品描述',
  `status` char(8) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `pay_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='支付信息表';

-- ----------------------------
-- Records of pay_info
-- ----------------------------
BEGIN;
INSERT INTO `pay_info` VALUES (1, '测试商品', 123.00, '1147078990360612864', '测试商品，请勿购买', '0', '2019-07-08 10:14:14', '2019-07-08 10:14:17', '');
INSERT INTO `pay_info` VALUES (2, 'ces', 123.00, '1148055969033490432', '332', '1', '2019-07-08 10:27:28', '2019-07-08 11:05:32', '2019070822001428451000018579');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `idx1` (`ancestor`),
  KEY `idx2` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (13, 'log_type', '2019-07-01 13:31:47', '2019-07-01 13:31:49', '日志类型', '异常、正常', '0');
INSERT INTO `sys_dict` VALUES (14, 'social_type', '2019-07-01 13:36:08', '2019-07-01 13:36:08', '社交登录', '微信、QQ', '0');
INSERT INTO `sys_dict` VALUES (15, 'leave_status', '2019-07-01 13:36:57', '2019-07-01 13:36:57', '请假状态', '未提交、审批中、完成、驳回', '0');
INSERT INTO `sys_dict` VALUES (16, 'message_type', '2019-07-01 13:37:28', '2019-07-01 13:37:28', '消息类型', '系统公告、提醒、私信', '0');
INSERT INTO `sys_dict` VALUES (18, 'pay_status', '2019-07-08 10:05:23', '2019-07-08 10:05:23', '支付状态', '未支付、支付完成、支付失败', '0');
INSERT INTO `sys_dict` VALUES (19, 'resource_type', '2019-07-11 09:11:00', '2019-07-11 09:11:00', '资源类型', '资源类型', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(64) NOT NULL COMMENT '字典主表ID',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_item_value` (`value`) USING BTREE,
  KEY `sys_dict_item_label` (`label`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项表';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_dict_item` VALUES (24, 16, '2', '私信', 'message_type', 3, '私信', '2019-07-02 17:50:40', '2019-07-02 17:50:40', '0');
INSERT INTO `sys_dict_item` VALUES (25, 18, '0', '未支付', 'pay_status', 1, '未支付', '2019-07-08 10:05:41', '2019-07-08 10:05:41', '0');
INSERT INTO `sys_dict_item` VALUES (26, 18, '1', '支付完成', 'pay_status', 2, '支付完成', '2019-07-08 10:05:53', '2019-07-08 10:05:53', '0');
INSERT INTO `sys_dict_item` VALUES (27, 18, '2', '支付失败', 'pay_status', 3, '支付失败', '2019-07-08 10:06:07', '2019-07-08 10:06:07', '0');
INSERT INTO `sys_dict_item` VALUES (28, 19, '0', '图片', 'resource_type', 1, '图片', '2019-07-11 09:11:19', '2019-07-11 09:11:19', '0');
INSERT INTO `sys_dict_item` VALUES (29, 19, '1', '文档', 'resource_type', 2, '文档', '2019-07-11 09:11:52', '2019-07-11 09:11:52', '0');
INSERT INTO `sys_dict_item` VALUES (30, 19, '2', '视频', 'resource_type', 3, '视频', '2019-07-11 09:12:14', '2019-07-11 09:12:14', '0');
INSERT INTO `sys_dict_item` VALUES (31, 19, '3', '音乐', 'resource_type', 4, '音乐', '2019-07-11 09:12:30', '2019-07-11 09:12:30', '0');
INSERT INTO `sys_dict_item` VALUES (32, 19, '4', '其他', 'resource_type', 5, '其他', '2019-07-11 09:12:43', '2019-07-11 09:12:43', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `file_id` varchar(255) NOT NULL COMMENT '主键ID',
  `file_size` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `md5` varchar(255) NOT NULL COMMENT 'MD5',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `trans_path` varchar(255) DEFAULT NULL COMMENT '转码后路径',
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `MD5_UNIQUE` (`md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES ('274980ee-f958-4263-bef6-61e29b42a8e5', 720039, '7cf93301a3fcbab75f27704df13775cc.docx', '7cf93301a3fcbab75f27704df13775cc', '2019-07-19 17:41:48', '0', '7cf93301a3fcbab75f27704df13775cc.pdf');
INSERT INTO `sys_file` VALUES ('3b5ce218-8dc3-4f0a-ab52-c98e0795e806', 319638, '065037c8bec62bd0d836a0a416b1ef45.gif', '065037c8bec62bd0d836a0a416b1ef45', '2019-07-19 17:39:12', '0', NULL);
INSERT INTO `sys_file` VALUES ('b84bfce4-5851-466f-bf99-de4ac0289f64', 868827, 'afa9b6f3da3dd154aa46235d9db2ae21.docx', 'afa9b6f3da3dd154aa46235d9db2ae21', '2019-07-19 14:08:35', '0', 'afa9b6f3da3dd154aa46235d9db2ae21..pdf');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_log` VALUES (123, '1', '修改会员个人信息', 'test', 'admin', '2019-06-24 09:58:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/user/edit', 'PUT', '', '124', '0', NULL);
INSERT INTO `sys_log` VALUES (124, '1', '更新角色菜单', 'test', 'admin', '2019-06-24 10:22:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2800%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C1000%2C1300%5D', '255', '0', NULL);
INSERT INTO `sys_log` VALUES (125, '1', '添加角色', 'test', 'admin', '2019-06-24 10:23:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role', 'POST', '', '52', '0', NULL);
INSERT INTO `sys_log` VALUES (126, '1', '添加角色', 'test', 'admin', '2019-06-24 10:24:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role', 'POST', '', '105', '0', NULL);
INSERT INTO `sys_log` VALUES (127, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:52:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '65', '0', NULL);
INSERT INTO `sys_log` VALUES (128, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:52:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '47', '0', NULL);
INSERT INTO `sys_log` VALUES (129, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:52:18', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '56', '0', NULL);
INSERT INTO `sys_log` VALUES (130, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:52:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '124', '0', NULL);
INSERT INTO `sys_log` VALUES (131, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:52:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '77', '0', NULL);
INSERT INTO `sys_log` VALUES (132, '1', '添加菜单', 'test', 'admin', '2019-06-24 10:54:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '63', '0', NULL);
INSERT INTO `sys_log` VALUES (133, '1', '添加菜单', 'test', 'admin', '2019-06-24 10:54:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '101', '0', NULL);
INSERT INTO `sys_log` VALUES (134, '1', '添加菜单', 'test', 'admin', '2019-06-24 10:54:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '59', '0', NULL);
INSERT INTO `sys_log` VALUES (135, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:54:51', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '59', '0', NULL);
INSERT INTO `sys_log` VALUES (136, '1', '修改菜单', 'test', 'admin', '2019-06-24 10:54:58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '50', '0', NULL);
INSERT INTO `sys_log` VALUES (137, '1', '添加菜单', 'test', 'admin', '2019-06-25 13:42:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '123', '0', NULL);
INSERT INTO `sys_log` VALUES (138, '1', '修改菜单', 'test', 'admin', '2019-06-25 13:42:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '172', '0', NULL);
INSERT INTO `sys_log` VALUES (139, '1', '修改菜单', 'test', 'admin', '2019-06-25 13:45:44', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '559', '0', NULL);
INSERT INTO `sys_log` VALUES (140, '1', '更新角色菜单', 'test', 'admin', '2019-06-25 13:46:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '263', '0', NULL);
INSERT INTO `sys_log` VALUES (141, '1', '添加菜单', 'test', 'admin', '2019-06-28 13:10:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '141', '0', NULL);
INSERT INTO `sys_log` VALUES (142, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:11:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '91', '0', NULL);
INSERT INTO `sys_log` VALUES (143, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:11:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '121', '0', NULL);
INSERT INTO `sys_log` VALUES (144, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:11:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (145, '1', '添加菜单', 'test', 'admin', '2019-06-28 13:12:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '49', '0', NULL);
INSERT INTO `sys_log` VALUES (146, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:12:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '55', '0', NULL);
INSERT INTO `sys_log` VALUES (147, '1', '更新角色菜单', 'test', 'admin', '2019-06-28 13:12:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2008%2C2009%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '231', '0', NULL);
INSERT INTO `sys_log` VALUES (148, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:16:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '232', '0', NULL);
INSERT INTO `sys_log` VALUES (149, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:16:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '256', '0', NULL);
INSERT INTO `sys_log` VALUES (150, '1', '删除菜单', 'test', 'admin', '2019-06-28 13:57:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2009', 'DELETE', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (151, '1', '删除菜单', 'test', 'admin', '2019-06-28 13:57:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/2008', 'DELETE', '', '123', '0', NULL);
INSERT INTO `sys_log` VALUES (152, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:57:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '74', '0', NULL);
INSERT INTO `sys_log` VALUES (153, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:58:03', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '6', '0', NULL);
INSERT INTO `sys_log` VALUES (154, '1', '修改菜单', 'test', 'admin', '2019-06-28 13:58:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '36', '0', NULL);
INSERT INTO `sys_log` VALUES (155, '1', '添加字典', 'test', 'admin', '2019-07-01 13:32:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '376', '0', NULL);
INSERT INTO `sys_log` VALUES (156, '1', '修改字典', 'test', 'admin', '2019-07-01 13:33:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '150', '0', NULL);
INSERT INTO `sys_log` VALUES (157, '1', '修改字典', 'test', 'admin', '2019-07-01 13:34:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '7', '0', NULL);
INSERT INTO `sys_log` VALUES (158, '1', '修改字典', 'test', 'admin', '2019-07-01 13:34:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '15', '0', NULL);
INSERT INTO `sys_log` VALUES (159, '1', '修改字典', 'test', 'admin', '2019-07-01 13:35:07', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '7', '0', NULL);
INSERT INTO `sys_log` VALUES (160, '1', '添加字典', 'test', 'admin', '2019-07-01 13:36:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '86', '0', NULL);
INSERT INTO `sys_log` VALUES (161, '1', '修改字典', 'test', 'admin', '2019-07-01 13:36:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'PUT', '', '19', '0', NULL);
INSERT INTO `sys_log` VALUES (162, '1', '添加字典', 'test', 'admin', '2019-07-01 13:36:57', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '60', '0', NULL);
INSERT INTO `sys_log` VALUES (163, '1', '添加字典', 'test', 'admin', '2019-07-01 13:37:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '101', '0', NULL);
INSERT INTO `sys_log` VALUES (164, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3100', 'DELETE', '', '98', '0', NULL);
INSERT INTO `sys_log` VALUES (165, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3300', 'DELETE', '', '75', '0', NULL);
INSERT INTO `sys_log` VALUES (166, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:17', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3400', 'DELETE', '', '74', '0', NULL);
INSERT INTO `sys_log` VALUES (167, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3500', 'DELETE', '', '95', '0', NULL);
INSERT INTO `sys_log` VALUES (168, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:33', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3700', 'DELETE', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (169, '1', '删除菜单', 'test', 'admin', '2019-07-01 16:42:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/3800', 'DELETE', '', '70', '0', NULL);
INSERT INTO `sys_log` VALUES (170, '1', '修改菜单', 'test', 'admin', '2019-07-01 16:44:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '66', '0', NULL);
INSERT INTO `sys_log` VALUES (171, '1', '修改菜单', 'test', 'admin', '2019-07-01 16:44:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '49', '0', NULL);
INSERT INTO `sys_log` VALUES (172, '1', '修改菜单', 'test', 'admin', '2019-07-01 17:21:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '70', '0', NULL);
INSERT INTO `sys_log` VALUES (173, '1', '添加字典', 'test', 'admin', '2019-07-03 14:59:02', NULL, '192.168.1.108', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15', '/dict', 'POST', '', '77', '0', NULL);
INSERT INTO `sys_log` VALUES (174, '1', '删除字典', 'test', 'admin', '2019-07-03 15:01:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict/17', 'DELETE', '', '93', '0', NULL);
INSERT INTO `sys_log` VALUES (175, '1', '添加菜单', 'test', 'admin', '2019-07-03 16:03:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '114', '0', NULL);
INSERT INTO `sys_log` VALUES (176, '1', '修改菜单', 'test', 'admin', '2019-07-03 16:04:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '85', '0', NULL);
INSERT INTO `sys_log` VALUES (177, '1', '修改菜单', 'test', 'admin', '2019-07-03 16:04:43', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '58', '0', NULL);
INSERT INTO `sys_log` VALUES (178, '1', '更新角色菜单', 'test', 'admin', '2019-07-03 16:05:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2500%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3200%2C3600%2C3601%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '368', '0', NULL);
INSERT INTO `sys_log` VALUES (179, '1', '添加菜单', 'test', 'admin', '2019-07-03 17:36:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '100', '0', NULL);
INSERT INTO `sys_log` VALUES (180, '1', '更新角色菜单', 'test', 'admin', '2019-07-03 17:36:48', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2500%2C2501%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3200%2C3600%2C3601%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '270', '0', NULL);
INSERT INTO `sys_log` VALUES (181, '1', '修改菜单', 'test', 'admin', '2019-07-03 17:41:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '65', '0', NULL);
INSERT INTO `sys_log` VALUES (182, '1', '删除用户token', 'test', 'admin', '2019-07-03 17:57:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/token/04ecb451-4c78-4084-9ec5-80574fead75b', 'DELETE', '', '42', '0', NULL);
INSERT INTO `sys_log` VALUES (183, '1', '删除用户token', 'test', 'admin', '2019-07-04 17:30:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/token/608597f7-51d5-4f88-ba3a-5b0875e97751', 'DELETE', '', '49', '0', NULL);
INSERT INTO `sys_log` VALUES (184, '1', '添加菜单', 'test', 'admin', '2019-07-05 13:59:33', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '80', '0', NULL);
INSERT INTO `sys_log` VALUES (185, '1', '修改菜单', 'test', 'admin', '2019-07-05 13:59:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '89', '0', NULL);
INSERT INTO `sys_log` VALUES (186, '1', '修改菜单', 'test', 'admin', '2019-07-05 14:00:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '58', '0', NULL);
INSERT INTO `sys_log` VALUES (187, '1', '修改菜单', 'test', 'admin', '2019-07-05 14:00:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '55', '0', NULL);
INSERT INTO `sys_log` VALUES (188, '1', '更新角色菜单', 'test', 'admin', '2019-07-05 14:00:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2500%2C2501%2C2600%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3200%2C3600%2C3601%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C%5D', '256', '0', NULL);
INSERT INTO `sys_log` VALUES (189, '1', '添加字典', 'test', 'admin', '2019-07-08 10:05:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '54', '0', NULL);
INSERT INTO `sys_log` VALUES (190, '1', '添加菜单', 'test', 'admin', '2019-07-10 09:14:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '264', '0', NULL);
INSERT INTO `sys_log` VALUES (191, '1', '修改菜单', 'test', 'admin', '2019-07-10 09:14:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '90', '0', NULL);
INSERT INTO `sys_log` VALUES (192, '1', '修改菜单', 'test', 'admin', '2019-07-10 09:19:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '59', '0', NULL);
INSERT INTO `sys_log` VALUES (193, '1', '添加菜单', 'test', 'admin', '2019-07-10 09:23:51', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'POST', '', '66', '0', NULL);
INSERT INTO `sys_log` VALUES (194, '1', '删除菜单', 'test', 'admin', '2019-07-10 09:25:55', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu/5100', 'DELETE', '', '108', '0', NULL);
INSERT INTO `sys_log` VALUES (195, '1', '修改菜单', 'test', 'admin', '2019-07-10 09:26:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '121', '0', NULL);
INSERT INTO `sys_log` VALUES (196, '1', '更新角色菜单', 'test', 'admin', '2019-07-10 09:27:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2500%2C2501%2C2600%2C2800%2C2801%2C2802%2C2803%2C2900%2C3000%2C3200%2C3600%2C3601%2C3900%2C3901%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C5000%2C%5D', '158', '0', NULL);
INSERT INTO `sys_log` VALUES (197, '1', '修改菜单', 'test', 'admin', '2019-07-10 09:35:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '54', '0', NULL);
INSERT INTO `sys_log` VALUES (198, '1', '修改菜单', 'test', 'admin', '2019-07-10 09:39:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '156', '0', NULL);
INSERT INTO `sys_log` VALUES (199, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:18:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (200, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:19:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '52', '0', NULL);
INSERT INTO `sys_log` VALUES (201, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:20:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '59', '0', NULL);
INSERT INTO `sys_log` VALUES (202, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:21:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '71', '0', NULL);
INSERT INTO `sys_log` VALUES (203, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:22:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '68', '0', NULL);
INSERT INTO `sys_log` VALUES (204, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:32:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '54', '0', NULL);
INSERT INTO `sys_log` VALUES (205, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:47:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '68', '0', NULL);
INSERT INTO `sys_log` VALUES (206, '1', '修改菜单', 'test', 'admin', '2019-07-10 10:53:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/menu', 'PUT', '', '66', '0', NULL);
INSERT INTO `sys_log` VALUES (207, '1', '新增虚拟地址表', 'test', 'admin', '2019-07-10 17:05:23', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '215', '0', NULL);
INSERT INTO `sys_log` VALUES (208, '1', '新增虚拟地址表', 'test', 'admin', '2019-07-10 17:13:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '115', '0', NULL);
INSERT INTO `sys_log` VALUES (209, '1', '添加字典', 'test', 'admin', '2019-07-11 09:11:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/dict', 'POST', '', '109', '0', NULL);
INSERT INTO `sys_log` VALUES (210, '1', '创建文件夹', 'test', 'admin', '2019-07-11 14:41:43', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '129', '0', NULL);
INSERT INTO `sys_log` VALUES (211, '1', '创建文件夹', 'test', 'admin', '2019-07-11 14:44:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '5', '0', NULL);
INSERT INTO `sys_log` VALUES (212, '1', '创建文件夹', 'test', 'admin', '2019-07-11 14:44:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '8797', '0', NULL);
INSERT INTO `sys_log` VALUES (213, '1', '创建文件夹', 'test', 'admin', '2019-07-11 14:50:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '6540', '0', NULL);
INSERT INTO `sys_log` VALUES (214, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:44:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '200', '0', NULL);
INSERT INTO `sys_log` VALUES (215, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:47:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '81', '0', NULL);
INSERT INTO `sys_log` VALUES (216, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:47:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '54', '0', NULL);
INSERT INTO `sys_log` VALUES (217, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:48:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '56', '0', NULL);
INSERT INTO `sys_log` VALUES (218, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:48:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (219, '1', '创建文件夹', 'test', 'admin', '2019-07-11 16:49:55', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (220, '1', '创建文件夹', 'test', 'admin', '2019-07-12 12:57:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '125', '0', NULL);
INSERT INTO `sys_log` VALUES (221, '1', '创建文件夹', 'test', 'admin', '2019-07-12 12:57:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '61', '0', NULL);
INSERT INTO `sys_log` VALUES (222, '1', '创建文件夹', 'test', 'admin', '2019-07-12 12:57:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '85', '0', NULL);
INSERT INTO `sys_log` VALUES (223, '1', '创建文件夹', 'test', 'admin', '2019-07-12 12:57:48', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '70', '0', NULL);
INSERT INTO `sys_log` VALUES (224, '1', '创建文件夹', 'test', 'admin', '2019-07-12 12:57:55', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '83', '0', NULL);
INSERT INTO `sys_log` VALUES (225, '1', '创建文件夹', 'test', 'admin', '2019-07-12 13:54:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '29', '0', NULL);
INSERT INTO `sys_log` VALUES (226, '1', '重命名', 'test', 'admin', '2019-07-12 14:24:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/26', 'PUT', 'fileName=%5B%E5%8E%8B%E7%BC%A9%E5%8C%852%5D', '80', '0', NULL);
INSERT INTO `sys_log` VALUES (227, '1', '重命名', 'test', 'admin', '2019-07-12 14:25:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/26', 'PUT', 'fileName=%5B%E5%8E%8B%E7%BC%A9%E5%8C%85%5D', '146', '0', NULL);
INSERT INTO `sys_log` VALUES (228, '1', '重命名', 'test', 'admin', '2019-07-12 14:25:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/26', 'PUT', 'fileName=%5B%E5%8E%8B%E7%BC%A9%E5%8C%85222%5D', '82', '0', NULL);
INSERT INTO `sys_log` VALUES (229, '1', '重命名', 'test', 'admin', '2019-07-12 14:26:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/26', 'PUT', 'fileName=%5B%E5%8E%8B%E7%BC%A9%E5%8C%85%5D', '63', '0', NULL);
INSERT INTO `sys_log` VALUES (230, '1', '创建文件夹', 'test', 'admin', '2019-07-12 14:43:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '126', '0', NULL);
INSERT INTO `sys_log` VALUES (231, '1', '重命名', 'test', 'admin', '2019-07-12 14:43:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/40', 'PUT', 'fileName=%5Bces23%5D', '116', '0', NULL);
INSERT INTO `sys_log` VALUES (232, '1', '删除文件', 'test', 'admin', '2019-07-12 14:43:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/40', 'DELETE', '', '52', '0', NULL);
INSERT INTO `sys_log` VALUES (233, '1', '创建文件夹', 'test', 'admin', '2019-07-12 16:03:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress', 'POST', '', '264', '0', NULL);
INSERT INTO `sys_log` VALUES (234, '1', '删除文件', 'test', 'admin', '2019-07-12 16:09:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/42', 'DELETE', '', '55', '0', NULL);
INSERT INTO `sys_log` VALUES (235, '1', '删除文件', 'test', 'admin', '2019-07-12 16:09:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '/virtualaddress/41', 'DELETE', '', '62', '0', NULL);
INSERT INTO `sys_log` VALUES (236, '1', '修改会员个人信息', 'test', 'admin', '2019-07-15 16:25:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/user/edit', 'PUT', '', '75', '0', NULL);
INSERT INTO `sys_log` VALUES (237, '1', '修改会员个人信息', 'test', 'admin', '2019-07-16 12:52:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/user/edit', 'PUT', '', '78', '0', NULL);
INSERT INTO `sys_log` VALUES (238, '1', '修改会员个人信息', 'test', 'admin', '2019-07-16 12:56:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/user/edit', 'PUT', '', '60', '0', NULL);
INSERT INTO `sys_log` VALUES (239, '1', '重命名', 'test', 'admin', '2019-07-18 09:26:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/virtualaddress/49', 'PUT', 'fileName=%5B1%5B2%5D.jpg%5D', '126', '0', NULL);
INSERT INTO `sys_log` VALUES (240, '1', '重命名', 'test', 'admin', '2019-07-18 10:34:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/virtualaddress/46', 'PUT', 'fileName=%5BideaIU.dmg%5D', '112', '0', NULL);
INSERT INTO `sys_log` VALUES (241, '1', '删除文件', 'test', 'admin', '2019-07-19 14:05:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/virtualaddress/56', 'DELETE', '', '77', '0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, 'log', 2000, 'icon-rizhiguanli', 'views/admin/log/index', 1, '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0');
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys_log_del', NULL, 2100, NULL, NULL, NULL, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0');
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, 'dict', 2000, 'icon-navicon-zdgl', 'views/admin/dict/index', 2, '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0');
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys_dict_del', NULL, 2200, NULL, NULL, NULL, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0');
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys_dict_add', NULL, 2200, NULL, NULL, NULL, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0');
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys_dict_edit', NULL, 2200, NULL, NULL, NULL, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0');
INSERT INTO `sys_menu` VALUES (2300, '文件对象存储', NULL, 'oss', 2000, 'icon-icon_workfile_line', 'views/admin/oss/index', 8, '0', '0', '2019-06-18 13:10:36', '2019-06-18 13:12:18', '0');
INSERT INTO `sys_menu` VALUES (2400, '终端管理', '', 'client', 2000, 'icon-shouji', 'views/admin/client/index', 3, '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0');
INSERT INTO `sys_menu` VALUES (2500, '令牌管理', NULL, 'token', 2000, 'icon-denglvlingpai', 'views/admin/token/index', 5, '0', '0', '2019-07-03 16:03:28', '2019-07-03 16:04:02', '0');
INSERT INTO `sys_menu` VALUES (2501, '令牌删除', 'sys_token_del', NULL, 2500, NULL, NULL, 1, '0', '1', '2019-07-03 17:36:20', '2019-07-03 17:41:56', '0');
INSERT INTO `sys_menu` VALUES (2600, '代码生成', '', 'gen', 2000, 'icon-weibiaoti46', 'views/gen/index', 7, '0', '0', '2019-07-05 13:59:32', '2019-07-05 13:59:54', '0');
INSERT INTO `sys_menu` VALUES (2800, '消息管理', NULL, 'message', 2000, 'icon-message', 'views/admin/message/index', 4, '0', '0', '2019-06-10 15:31:38', '2019-06-10 15:32:04', '0');
INSERT INTO `sys_menu` VALUES (2801, '消息新增', 'sys_message_add', NULL, 2800, NULL, NULL, 1, '0', '1', '2019-06-24 10:54:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (2802, '消息删除', 'sys_message_del', NULL, 2800, NULL, NULL, 1, '0', '1', '2019-06-24 10:54:21', '2019-06-24 10:54:51', '0');
INSERT INTO `sys_menu` VALUES (2803, '消息修改', 'sys_message_edit', NULL, 2800, NULL, NULL, 1, '0', '1', '2019-06-24 10:54:34', '2019-06-24 10:54:58', '0');
INSERT INTO `sys_menu` VALUES (2900, '支付管理', NULL, 'pay', 2000, 'icon-zhifu', 'views/admin/pay/index', 6, '0', '0', '2019-06-25 13:42:28', '2019-06-25 13:42:47', '0');
INSERT INTO `sys_menu` VALUES (3000, '系统监控', NULL, '/daemon', -1, 'icon-msnui-supervise', 'Layout', 2, '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0');
INSERT INTO `sys_menu` VALUES (3200, '接口文档', NULL, 'http://localhost:8081/doc.html', 3000, 'icon-wendang', NULL, 2, '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:05:16', '0');
INSERT INTO `sys_menu` VALUES (3600, '任务轨迹', '', 'status-trace-log', 3000, 'icon-guiji', 'views/daemon/status-trace-log/index', 8, '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0');
INSERT INTO `sys_menu` VALUES (3601, '删除任务轨迹', 'daemon_status_trace_log_del', NULL, 3600, '1', NULL, 2, '0', '1', '2018-05-15 21:35:18', '2018-11-24 06:37:31', '0');
INSERT INTO `sys_menu` VALUES (3900, '任务日志', '', 'execution-log', 3000, 'icon-rizhi', 'views/daemon/execution-log/index', 8, '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0');
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
INSERT INTO `sys_menu` VALUES (5000, '网盘管理', NULL, '/pan', -1, 'icon-wangpan', 'views/pan/index', 5, '0', '0', '2019-07-10 09:14:30', '2019-07-10 09:14:42', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `title` varchar(500) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `ranger` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '发送范围 0全部 1指定',
  `create_send` char(1) NOT NULL COMMENT '新创建账号推送',
  `del_flag` char(50) DEFAULT '0' COMMENT '删除标识',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人名称',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='系统推送消息表';

-- ----------------------------
-- Records of sys_message
-- ----------------------------
BEGIN;
INSERT INTO `sys_message` VALUES (10, '2', '乘坐中国制造的客机是啥体验?这个测评在海外火了', '<p style=\"text-align: center;\">乘坐中国制造的ARJ21是一种怎样的体验？知名职业航空评测博主Sam最近一探究竟~</p><p style=\"text-align: center;\">　　“早上好，现在是成都的清晨5点，我即将乘坐的航班是由中国第一架自主研发的喷气式支线客机——ARJ21执飞。”</p><p style=\"text-align: center;\">　　即便是起了个大早赶飞机，Sam却十分兴奋，非常期待这一次的飞行旅程。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/59/w550h309/20190612/edff-hyeztyt2482106.png\" alt=\" Sam面对镜头介绍ARJ21\">Sam面对镜头介绍ARJ21</div><p style=\"text-align: center;\">　　Sam是一位知名航旅达人，在YouTube上拥有百万粉丝，他也被粉丝们称为“民航界大神”。而这段关于ARJ21的评测视频，发布十多个小时就收获3千多个赞。</p><p style=\"text-align: center;\">　　不少外国网友表示，早就想看中国制造客机的专业测评了。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/631/w550h81/20190612/3ca9-hyeztyt2482197.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　这一次，Sam乘坐的是服役于国内某航空公司的中国商飞ARJ21，它是中国第一次完全自主设计并组装制造的支线飞机。</p><p style=\"text-align: center;\">　　正如此前国内媒体报道所说，造一架能飞上天的客机，中国的成功经验越来越多。但实现一款自主研制、符合国际民航标准的喷气式客机批量化生产，并接受市场的全方位检验，ARJ21是第一个探路者。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/315f-hyeztyt2482225.jpg\" alt=\" ARJ21（中国商飞官网）\">ARJ21（中国商飞官网）</div><p style=\"text-align: center;\">　　Sam介绍说，ARJ21是中国首次按照国际民航规章自行研制、具有自主知识产权的中短程新型涡扇支线客机，第一架客机于2015年交付并投入使用。</p><p style=\"text-align: center;\">　　在机舱内观察了一番后，他注意到，ARJ21客舱共有90个座位，内部设计美观。虽然机型小，但设备齐全，行李架的空间也足够大。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/116/w550h366/20190612/8afb-hyeztyt2482259.jpg\" alt=\" 机舱内部（Sam微博）\">机舱内部（Sam微博）</div><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/58/w550h308/20190612/4a7b-hyeztyt2482307.png\" alt=\"行李架内部空间（视频截图）\">行李架内部空间（视频截图）</div><p style=\"text-align: center;\">　　而最重要的是，整个航行的飞行体验也很棒。</p><p style=\"text-align: center;\">　　Sam评价说，ARJ21的起飞、降落都非常平稳，机上的服务也非常赞。</p><p style=\"text-align: center;\">　　针对飞行体验中的一些细节，Sam还进行了更多细致客观的点评。</p><p style=\"text-align: center;\">　　他发现，由于ARJ21的引擎位于机身后部而非机翼的位置，因此，坐在机舱靠后的乘客感受到的噪音会略大。</p><p style=\"text-align: center;\">　　相比这些“瑕疵”，已试飞成功的国产大型喷气式民用飞机C919更令人期待。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/972e-hyeztyt2482344.jpg\" alt=\" C919（中国商飞官网）\">C919（中国商飞官网）</div><p style=\"text-align: center;\">　　然而，观看了体验视频的外国网友却接连鼓励：自主制造出这样一款商用客机，已经很了不起了。</p><p style=\"text-align: center;\">　　“作为中国在商用飞机上的第一次尝试，ARJ21已经很棒，期待中国人制造出更多不同类型的飞机。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/736/w550h186/20190612/30f0-hyeztyt2482385.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　“很棒的飞机，期待未来看到你乘坐C919。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/637/w550h87/20190612/3dd5-hyeztyt2482447.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　还有外国网友毫无保留地投出信任票，认为ARJ21比一些西方老牌飞机制造商生产的大型飞机更加安全，更期待未来中国多向其他国家出口这些“中国制造”。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/659/w550h109/20190612/95d7-hyeztyt2482508.jpg\" alt=\"\"></div><p style=\"text-align: center;\"><br></p>', '1', '1', '0', '2019-06-13 09:21:31', '2019-06-13 09:21:31', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_message_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_send`;
CREATE TABLE `sys_message_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `type` char(1) NOT NULL COMMENT '类型',
  `user_name` varchar(255) DEFAULT NULL COMMENT '发送用户名',
  `status` char(1) DEFAULT '0' COMMENT '是否已读 0未读 1已读',
  `delFlag` char(1) DEFAULT '0' COMMENT '删除标识',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(0) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='消息发送表';

-- ----------------------------
-- Records of sys_message_send
-- ----------------------------
BEGIN;
INSERT INTO `sys_message_send` VALUES (17, 10, 1, '乘坐中国制造的客机是啥体验?这个测评在海外火了', '<p style=\"text-align: center;\">乘坐中国制造的ARJ21是一种怎样的体验？知名职业航空评测博主Sam最近一探究竟~</p><p style=\"text-align: center;\">　　“早上好，现在是成都的清晨5点，我即将乘坐的航班是由中国第一架自主研发的喷气式支线客机——ARJ21执飞。”</p><p style=\"text-align: center;\">　　即便是起了个大早赶飞机，Sam却十分兴奋，非常期待这一次的飞行旅程。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/59/w550h309/20190612/edff-hyeztyt2482106.png\" alt=\" Sam面对镜头介绍ARJ21\">Sam面对镜头介绍ARJ21</div><p style=\"text-align: center;\">　　Sam是一位知名航旅达人，在YouTube上拥有百万粉丝，他也被粉丝们称为“民航界大神”。而这段关于ARJ21的评测视频，发布十多个小时就收获3千多个赞。</p><p style=\"text-align: center;\">　　不少外国网友表示，早就想看中国制造客机的专业测评了。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/631/w550h81/20190612/3ca9-hyeztyt2482197.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　这一次，Sam乘坐的是服役于国内某航空公司的中国商飞ARJ21，它是中国第一次完全自主设计并组装制造的支线飞机。</p><p style=\"text-align: center;\">　　正如此前国内媒体报道所说，造一架能飞上天的客机，中国的成功经验越来越多。但实现一款自主研制、符合国际民航标准的喷气式客机批量化生产，并接受市场的全方位检验，ARJ21是第一个探路者。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/315f-hyeztyt2482225.jpg\" alt=\" ARJ21（中国商飞官网）\">ARJ21（中国商飞官网）</div><p style=\"text-align: center;\">　　Sam介绍说，ARJ21是中国首次按照国际民航规章自行研制、具有自主知识产权的中短程新型涡扇支线客机，第一架客机于2015年交付并投入使用。</p><p style=\"text-align: center;\">　　在机舱内观察了一番后，他注意到，ARJ21客舱共有90个座位，内部设计美观。虽然机型小，但设备齐全，行李架的空间也足够大。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/116/w550h366/20190612/8afb-hyeztyt2482259.jpg\" alt=\" 机舱内部（Sam微博）\">机舱内部（Sam微博）</div><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/58/w550h308/20190612/4a7b-hyeztyt2482307.png\" alt=\"行李架内部空间（视频截图）\">行李架内部空间（视频截图）</div><p style=\"text-align: center;\">　　而最重要的是，整个航行的飞行体验也很棒。</p><p style=\"text-align: center;\">　　Sam评价说，ARJ21的起飞、降落都非常平稳，机上的服务也非常赞。</p><p style=\"text-align: center;\">　　针对飞行体验中的一些细节，Sam还进行了更多细致客观的点评。</p><p style=\"text-align: center;\">　　他发现，由于ARJ21的引擎位于机身后部而非机翼的位置，因此，坐在机舱靠后的乘客感受到的噪音会略大。</p><p style=\"text-align: center;\">　　相比这些“瑕疵”，已试飞成功的国产大型喷气式民用飞机C919更令人期待。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/790/w550h240/20190612/972e-hyeztyt2482344.jpg\" alt=\" C919（中国商飞官网）\">C919（中国商飞官网）</div><p style=\"text-align: center;\">　　然而，观看了体验视频的外国网友却接连鼓励：自主制造出这样一款商用客机，已经很了不起了。</p><p style=\"text-align: center;\">　　“作为中国在商用飞机上的第一次尝试，ARJ21已经很棒，期待中国人制造出更多不同类型的飞机。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/736/w550h186/20190612/30f0-hyeztyt2482385.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　“很棒的飞机，期待未来看到你乘坐C919。”</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/637/w550h87/20190612/3dd5-hyeztyt2482447.jpg\" alt=\"\"></div><p style=\"text-align: center;\">　　还有外国网友毫无保留地投出信任票，认为ARJ21比一些西方老牌飞机制造商生产的大型飞机更加安全，更期待未来中国多向其他国家出口这些“中国制造”。</p><div style=\"text-align: center;\"><img src=\"https://n.sinaimg.cn/news/crawl/659/w550h109/20190612/95d7-hyeztyt2482508.jpg\" alt=\"\"></div><p style=\"text-align: center;\"><br></p>', '2', 'admin', '1', '0', 'admin', '2019-06-13 09:21:31', NULL, '2019-06-13 09:21:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('pig', NULL, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_details` VALUES ('test', NULL, 'test', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原文件名称',
  `fkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储文件名',
  `file_size` bigint(20) NOT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `crate_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='对象存储表';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
INSERT INTO `sys_oss` VALUES (56, '005PKPY2ly8fdwsorhp1fj30e80dojro.jpg', '0303a2fbde0249619cde4d2d652a443f.jpg', 6415, 'image/jpeg', 'admin', '2019-06-18 15:16:32', 'admin', '2019-06-18 15:16:32', '0');
INSERT INTO `sys_oss` VALUES (57, '005PKPY2ly8fdwsorhp1fj30e80dojro.jpg', 'd66ed1c182ff46c1af7baf7da9741ffa.jpg', 6415, 'image/jpeg', 'admin', '2019-06-24 09:58:44', 'admin', '2019-06-24 09:58:44', '0');
INSERT INTO `sys_oss` VALUES (58, 'VcZY-htwhfzs0023252.jpg', '28c09cc123e44d278c62b9e4454fe1eb.jpg', 37099, 'image/jpeg', 'admin', '2019-07-04 17:28:04', 'admin', '2019-07-04 17:28:04', '0');
INSERT INTO `sys_oss` VALUES (71, 'r1EQ-hryfqhm0167597.jpg', '78917049593a4ab3bde515a8ee4a67b5.jpg', 18816, 'image/jpeg', 'admin', '2019-07-12 11:16:13', 'admin', '2019-07-12 11:16:13', '0');
INSERT INTO `sys_oss` VALUES (72, 'u=1077600724,1890977723&fm=173&app=49&f=JPEG.jpg', '8b7399be1c0f4faea32bf0b7e2da44ae.jpg', 37542, 'image/jpeg', 'admin', '2019-07-12 11:16:13', 'admin', '2019-07-12 11:16:13', '0');
INSERT INTO `sys_oss` VALUES (73, '1.jpg', '2205705e5367482cbffd25a624d8ddf4.jpg', 37866, 'image/jpeg', 'admin', '2019-07-15 16:25:51', 'admin', '2019-07-15 16:25:51', '0');
INSERT INTO `sys_oss` VALUES (74, '2.jpg', 'fa212c0e17654f65a5b098a2afbcca78.jpg', 283323, 'image/jpeg', 'admin', '2019-07-16 12:52:51', 'admin', '2019-07-16 12:52:51', '0');
INSERT INTO `sys_oss` VALUES (75, '1.jpg', '108bb2cc58464125a7fead9a31c88407.jpg', 37866, 'image/jpeg', 'admin', '2019-07-16 12:56:47', 'admin', '2019-07-16 12:56:47', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ds_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员', '2', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0');
INSERT INTO `sys_role` VALUES (2, 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '2', NULL, '2018-11-11 19:42:26', '2018-12-26 14:09:07', '0');
INSERT INTO `sys_role` VALUES (5, 'gdfg', 'ffffff', 'g', '0', '', '2019-06-24 10:23:23', NULL, '0');
INSERT INTO `sys_role` VALUES (6, '333', '33333', '3', '0', '', '2019-06-24 10:24:19', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_role_menu` VALUES (1, 2500);
INSERT INTO `sys_role_menu` VALUES (1, 2501);
INSERT INTO `sys_role_menu` VALUES (1, 2600);
INSERT INTO `sys_role_menu` VALUES (1, 2800);
INSERT INTO `sys_role_menu` VALUES (1, 2801);
INSERT INTO `sys_role_menu` VALUES (1, 2802);
INSERT INTO `sys_role_menu` VALUES (1, 2803);
INSERT INTO `sys_role_menu` VALUES (1, 2900);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3600);
INSERT INTO `sys_role_menu` VALUES (1, 3601);
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
INSERT INTO `sys_role_menu` VALUES (1, 5000);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2100);
INSERT INTO `sys_role_menu` VALUES (2, 2101);
COMMIT;

-- ----------------------------
-- Table structure for sys_route_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) DEFAULT NULL COMMENT '路由名称',
  `route_id` varchar(30) NOT NULL DEFAULT '' COMMENT '路由ID',
  `predicates` json DEFAULT NULL COMMENT '断言',
  `filters` json DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(50) DEFAULT NULL,
  `order` int(2) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='路由配置表';

-- ----------------------------
-- Records of sys_route_conf
-- ----------------------------
BEGIN;
INSERT INTO `sys_route_conf` VALUES (1, '工作流管理模块', 'boot-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-activiti', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:25', '0');
INSERT INTO `sys_route_conf` VALUES (2, '认证中心', 'boot-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://boot-auth', 0, '2019-01-17 16:42:50', '2019-06-28 17:07:40', '0');
INSERT INTO `sys_route_conf` VALUES (4, '定时任务模块', 'pigx-daemon', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-daemon', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:50', '0');
INSERT INTO `sys_route_conf` VALUES (5, '支付模块', 'boot-pay', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-pay', 0, '2019-01-17 16:42:50', '2019-06-28 17:11:22', '0');
INSERT INTO `sys_route_conf` VALUES (6, '通用权限模块', 'boot-upms', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://boot-upms', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:03', '0');
INSERT INTO `sys_route_conf` VALUES (7, '代码生成', 'boot-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-codegen', 0, '2019-01-17 16:42:50', '2019-06-28 17:10:03', '0');
INSERT INTO `sys_route_conf` VALUES (9, '网盘管理', 'boot-pan', '[{\"args\": {\"_genkey_0\": \"/pan/**\"}, \"name\": \"Path\"}]', '[]', 'lb://boot-pan', 0, '2019-07-10 16:34:21', '2019-07-10 16:34:41', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_social_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) NOT NULL COMMENT '类型',
  `remark` varchar(64) DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(50) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统社交登录账号表';

-- ----------------------------
-- Records of sys_social_details
-- ----------------------------
BEGIN;
INSERT INTO `sys_social_details` VALUES (1, 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2018-12-04 11:50:57', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_wx_openid` (`wx_openid`) USING BTREE,
  KEY `user_qq_openid` (`qq_openid`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', NULL, '15077923572', '108bb2cc58464125a7fead9a31c88407.jpg', 1, '2018-04-20 07:15:18', '2019-07-16 12:56:51', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', NULL);
INSERT INTO `sys_user` VALUES (5, 'test', '$2a$10$8kRPVwZHyMi5Fq89Vf49aeOEtM.pKf5vHou3A4eVTE3q7xsz0B3Zu', NULL, '', 'http://img5.imgtn.bdimg.com/it/u=235810630,594632317&fm=26&gp=0.jpg', 11, '2019-05-23 17:47:13', '2019-06-06 15:07:45', '0', '0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);
COMMIT;

-- ----------------------------
-- Table structure for virtual_address
-- ----------------------------
DROP TABLE IF EXISTS `virtual_address`;
CREATE TABLE `virtual_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_id` varchar(255) DEFAULT NULL COMMENT '文件ID',
  `file_name` varchar(255) NOT NULL COMMENT '上传文件名',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5',
  `parent_id` bigint(255) NOT NULL DEFAULT '0' COMMENT '父路径',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文件类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='虚拟地址表';

-- ----------------------------
-- Records of virtual_address
-- ----------------------------
BEGIN;
INSERT INTO `virtual_address` VALUES (26, NULL, '压缩包', NULL, 0, 'folder', '2019-07-12 12:57:29', '2019-07-12 12:57:29', '0');
INSERT INTO `virtual_address` VALUES (27, NULL, '视频', NULL, 0, 'folder', '2019-07-12 12:57:34', '2019-07-12 12:57:34', '0');
INSERT INTO `virtual_address` VALUES (28, NULL, '音乐', NULL, 0, 'folder', '2019-07-12 12:57:40', '2019-07-12 12:57:40', '0');
INSERT INTO `virtual_address` VALUES (29, NULL, '图片', NULL, 0, 'folder', '2019-07-12 12:57:48', '2019-07-12 12:57:48', '0');
INSERT INTO `virtual_address` VALUES (30, NULL, '文档', NULL, 0, 'folder', '2019-07-12 12:57:55', '2019-07-12 12:57:55', '0');
INSERT INTO `virtual_address` VALUES (57, 'b84bfce4-5851-466f-bf99-de4ac0289f64', 'Apache_Shiro参考手册中文版-converted.docx', 'afa9b6f3da3dd154aa46235d9db2ae21', 0, 'doc', '2019-07-19 14:08:35', '2019-07-19 14:08:35', '0');
INSERT INTO `virtual_address` VALUES (58, '3b5ce218-8dc3-4f0a-ab52-c98e0795e806', '1294929-20181205144240125-1096993697.gif', '065037c8bec62bd0d836a0a416b1ef45', 0, 'picture', '2019-07-19 17:39:12', '2019-07-19 17:39:12', '0');
INSERT INTO `virtual_address` VALUES (59, '274980ee-f958-4263-bef6-61e29b42a8e5', 'Netty 入门与实战：仿写微信 IM 即时通讯系统.docx', '7cf93301a3fcbab75f27704df13775cc', 0, 'doc', '2019-07-19 17:41:48', '2019-07-19 17:41:48', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
