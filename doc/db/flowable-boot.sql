/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 127.0.0.1:3306
 Source Schema         : flowable-boot

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/06/2019 10:06:29
*/
USE `flowable-boot`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
DROP TABLE IF EXISTS `act_app_appdef`;
CREATE TABLE `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangelog`;
CREATE TABLE `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-05-28 13:35:01', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '3.6.3', NULL, NULL, '9021697478');
INSERT INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-05-28 13:35:03', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '3.6.3', NULL, NULL, '9021697478');
INSERT INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-05-28 13:35:03', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '3.6.3', NULL, NULL, '9021697478');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
CREATE TABLE `act_app_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment`;
CREATE TABLE `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment_resource`;
CREATE TABLE `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_casedef`;
CREATE TABLE `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
CREATE TABLE `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:29', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:30', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:32', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:33', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:54', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:54', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '3.6.3', NULL, NULL, '9021651999');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-05-28 13:34:55', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '3.6.3', NULL, NULL, '9021651999');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
CREATE TABLE `act_cmmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment`;
CREATE TABLE `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
CREATE TABLE `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
CREATE TABLE `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
CREATE TABLE `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
CREATE TABLE `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
CREATE TABLE `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
CREATE TABLE `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
CREATE TABLE `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
CREATE TABLE `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
DROP TABLE IF EXISTS `act_co_content_item`;
CREATE TABLE `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_`) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_`) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangelog`;
CREATE TABLE `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-05-28 13:34:10', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.3', NULL, NULL, '9021649049');
INSERT INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-05-28 13:34:10', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.3', NULL, NULL, '9021649049');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
CREATE TABLE `act_co_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:33:57', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '9021636590');
INSERT INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:33:58', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '9021636590');
INSERT INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:33:58', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '9021636590');
INSERT INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:33:59', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '9021636590');
INSERT INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:34:01', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '9021636590');
INSERT INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-05-28 13:34:02', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '9021636590');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision_table
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision_table`;
CREATE TABLE `act_dmn_decision_table`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DEC_TBL_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
CREATE TABLE `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-05-28 13:34:04', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '9021643229');
INSERT INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-05-28 13:34:05', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '9021643229');
INSERT INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-05-28 13:34:05', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.3', NULL, NULL, '9021643229');
INSERT INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-05-28 13:34:07', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '9021643229');
INSERT INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-05-28 13:34:07', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.3', NULL, NULL, '9021643229');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_instance`;
CREATE TABLE `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('0e890b09-8b44-11e9-9420-54a050572538', 1, '请假流程.bpmn20.xml', '0e890b08-8b44-11e9-9420-54a050572538', 0x3C3F786D6C2076657273696F6E3D27312E302720656E636F64696E673D275554462D38273F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D224C6561766542696C6C22206E616D653D22E8AFB7E58187E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C646F63756D656E746174696F6E3EE8AFB7E58187E6B581E7A88B3C2F646F63756D656E746174696F6E3E0A202020203C73746172744576656E742069643D227369642D39314431323431372D304238362D343041392D413944382D373038463730363039453437222F3E0A202020203C757365725461736B2069643D227369642D41344235413035432D344433352D343736372D413035352D42413842464336393436423722206E616D653D22E68F90E4BAA4E794B3E8AFB7223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222F3E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D227369642D46323637384443372D304131362D343039302D413744322D33303438443241414638393322206E616D653D22E983A8E997A8E9A286E5AFBCE5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222F3E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C757365725461736B2069643D227369642D37323239344534382D393637352D343937302D413536422D43413434323936433442433822206E616D653D22E680BBE7BB8FE79086E5AEA1E689B9223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A7461736B4C697374656E6572206576656E743D226372656174652220636C6173733D22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222F3E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C656E644576656E742069643D227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836222F3E0A202020203C6578636C7573697665476174657761792069643D227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536222F3E0A202020203C73657175656E6365466C6F772069643D227369642D30323543414446342D433431332D343141442D383836412D36383346334331374530363122206E616D653D22E9A9B3E59B9E2220736F757263655265663D227369642D37323239344534382D393637352D343937302D413536422D43413434323936433442433822207461726765745265663D227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B726573756C742E657175616C732822E9A9B3E59B9E22297D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D32383643453846382D334644302D343244412D394336362D32413138334542464243394322206E616D653D22E5AEA1E689B92220736F757263655265663D227369642D37323239344534382D393637352D343937302D413536422D43413434323936433442433822207461726765745265663D227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B726573756C742E657175616C732822E5AEA1E689B922297D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D43433844323544412D424441392D344444332D393731372D35313344343439363538413222206E616D653D22E5B08FE4BA8EE7AD89E4BA8E33E5A4A92220736F757263655265663D227369642D46323743433232332D364145452D344643382D383432302D46353432304136374143353622207461726765745265663D227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B646179733C3D337D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D44443832413745392D454542302D344536362D384533392D34334131363532313136414622206E616D653D22E5AEA1E689B92220736F757263655265663D227369642D46323637384443372D304131362D343039302D413744322D33303438443241414638393322207461726765745265663D227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B726573756C742E657175616C732822E5AEA1E689B922297D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D31453833423543302D464334302D343544382D413632312D38313945434332303635334122206E616D653D22E5A4A7E4BA8E33E5A4A92220736F757263655265663D227369642D46323743433232332D364145452D344643382D383432302D46353432304136374143353622207461726765745265663D227369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B646179733E337D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D44444533354245322D413742352D343041412D383434422D35304339304634323545434222206E616D653D22E9A9B3E59B9E2220736F757263655265663D227369642D46323637384443372D304131362D343039302D413744322D33303438443241414638393322207461726765745265663D227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B726573756C742E657175616C732822E9A9B3E59B9E22297D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D43413837334545372D354544352D343530412D394132352D42413130464243334535364622206E616D653D22E5AEA1E689B92220736F757263655265663D227369642D41344235413035432D344433352D343736372D413035352D42413842464336393436423722207461726765745265663D227369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933222F3E0A202020203C73657175656E6365466C6F772069643D227369642D30343944433738412D373741422D343644422D413536372D43324146353032423335453422206E616D653D22E5BC80E5A78BE6B581E7A88B2220736F757263655265663D227369642D39314431323431372D304238362D343041392D413944382D37303846373036303945343722207461726765745265663D227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237222F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F4C6561766542696C6C223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D224C6561766542696C6C222069643D2242504D4E506C616E655F4C6561766542696C6C223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D39314431323431372D304238362D343041392D413944382D373038463730363039453437222069643D2242504D4E53686170655F7369642D39314431323431372D304238362D343041392D413944382D373038463730363039453437223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D2239302E302220793D223133362E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237222069643D2242504D4E53686170655F7369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223137382E37352220793D223130392E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933222069643D2242504D4E53686170655F7369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223338382E37352220793D223131312E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338222069643D2242504D4E53686170655F7369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223733332E37352220793D223131312E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836222069643D2242504D4E53686170655F7369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223931352E302220793D223133332E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536222069643D2242504D4E53686170655F7369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223537382E302220793D223133312E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D44443832413745392D454542302D344536362D384533392D343341313635323131364146222069643D2242504D4E456467655F7369642D44443832413745392D454542302D344536362D384533392D343341313635323131364146223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223438382E36393939393939393939373639372220793D223135312E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537382E302220793D223135312E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D44444533354245322D413742352D343041412D383434422D353043393046343235454342222069643D2242504D4E456467655F7369642D44444533354245322D413742352D343041412D383434422D353043393046343235454342223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433382E37352220793D223139302E3935222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223433382E37352220793D223236342E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223232382E37352220793D223236342E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223232382E37352220793D223138382E3935222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30343944433738412D373741422D343644422D413536372D433241463530324233354534222069643D2242504D4E456467655F7369642D30343944433738412D373741422D343644422D413536372D433241463530324233354534223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223131392E39343830383735313932383330392220793D223135302E37353736303637363937323833222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223137382E37352220793D223134392E3830373237323732373237323733222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D32383643453846382D334644302D343244412D394336362D324131383345424642433943222069643D2242504D4E456467655F7369642D32383643453846382D334644302D343244412D394336362D324131383345424642433943223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223833332E363939393939393939393536362220793D223135312E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223931352E302220793D223135312E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31453833423543302D464334302D343544382D413632312D383139454343323036353341222069643D2242504D4E456467655F7369642D31453833423543302D464334302D343544382D413632312D383139454343323036353341223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223631372E3439363133313939383931382220793D223135312E3434383537393136313032383432222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733332E37352220793D223135312E3133343831373831333736353135222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D43413837334545372D354544352D343530412D394132352D424131304642433345353646222069643D2242504D4E456467655F7369642D43413837334545372D354544352D343530412D394132352D424131304642433345353646223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223237382E363939393939393939393936342220793D223134392E3437353731343238353731343238222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223338382E37352220793D223135302E3532333830393532333830393535222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30323543414446342D433431332D343141442D383836412D363833463343313745303631222069643D2242504D4E456467655F7369642D30323543414446342D433431332D343141442D383836412D363833463343313745303631223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738332E37352220793D223131312E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738332E37352220793D2233302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223232382E37352220793D2233302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223232382E37352220793D223130392E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D43433844323544412D424441392D344444332D393731372D353133443434393635384132222069643D2242504D4E456467655F7369642D43433844323544412D424441392D344444332D393731372D353133443434393635384132223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539382E352220793D223137302E3434313335343932373030373332222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539382E352220793D223236312E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223932392E302220793D223236312E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223932392E302220793D223136302E3934393933323338373531303637222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, 0);
INSERT INTO `act_ge_bytearray` VALUES ('0f114dda-8b44-11e9-9420-54a050572538', 1, '请假流程.LeaveBill.png', '0e890b08-8b44-11e9-9420-54a050572538', 0x89504E470D0A1A0A0000000D49484452000003B900000112080600000038E312C4000028EC4944415478DAEDDD0B945D559920E06A1FAD2EDBA5F68CA38E3A6AB7DA8CED52C7C1A58E8F669866A4075A400895AA0A491930410898F018918710209D6080F0D0054878A3E115133A6222E44948822430908E220904C80392202421A19290C79DFDD7BAA7FAE4A69EA954D5BDB7BE6FADBDEADEAA5B8F9CECFFDFFB3F7B9F736B6A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0DF1838706041D3344DD334AD9C9B191B005D2A721D0500A08CE72ABB2FBAE8A2B7381200287201806A98ABEC183060C05F3A1200287201806A98AB34A522F75D8E04008A5C00A01AE62A5B5291FB578E04008A5C00A01AE62A9B5291FB5E470200452E00500D7395575391FBD78E04008A5C00A01AE62A1B5291FB01470200452E00500D739597060D1AF461470200452E00500D7395D50D0D0D1F75240050E40200D5305779A1BEBEFEE38E04008A5C00A01AE62ACFA522F76F1C090014B9004035CC5596A722F7D38E04008A5C00A01AE62A4FD7D5D51DE44800A0C80500AA61AEB2ACB6B6F6738E04008A5C00A01AE62A4FA622F70B8E04008A5C00A01AE62A8FA722F74B8E04008A5C00A01AE62A8FA522F7CB8E04008A5C00A01AE62A8B5291FB55470200452E00500D7395478E3FFEF8AF3B1200287201808A575757372F15B9DF72240050E40200D5305799950ADD431D090014B9004035CC551E4C45EE618E04008A5C00A01AE62AD353917BB8230180221700A886B9CA6F523BC2910040910B0054C35CE5FED4BEE34800A0C80500AA61AEF2EBD48E71240050E4020015AFAEAEEE9EDADADA018E04008A5C00A01A8ADC49A9C81DE84800A0C80500AAA1C8BD3315B90D8E04008A5C00A01A8ADCDB52913BD8910040910B005443917B732A72BFE74800A0C805002A5E2A706F4C85EE498E04008A5C00A01AE62AD7A576B2230180221700A886B9CACF523BD5910040910B0054C35CE5EAD44E77240050E40200D53057B932B5518E04008A5C00A01AE62AE3533BCB910040910B0054C35C655C6A3F72240050E40200D5305719535B5B7B9E230180221700A878757575A35391FB13470200452E0050F1A2C08D42D7910040910B005443917B5E2A722F75240050E40200D550E49E938ADCB18E04008A5C00A01A8ADCB35391FB53470200452E00500D45EE19A9C8BDC2910040910B0054C35CE5F4D4AE76240050E40200D530573935B59F391200287201806A98AB9C9CDA758E04008A5C00A01AE62ADF4FED178E04008A5C00A01AE62A4353BBC9910040910B0054BCBABABA2169BE72AB230180221700A878B5B5B50DA9D0BDD3910040910B005443913B3015B9931C090014B900403514B90352917B8F230180221700A88622F7BB69BE32D9910040910B005443917B549AAF4C75240050E40200D550E41E99E62BD31C090014B90040C5ABABAB3B3CCD57A63B1200287201806A28720F4BF395071D090014B900403514B987A6F9CA2C470200452E00500D45EE3FA4F9CA5C470200452E00500D45EE37D27C65BE230180221700A88622F76B69BEB2D0910040910B005443911B379E7ACC910040910B0054B4C6C6C6F7DD77DF7D8551A346FDC9D10040910B0054B48B2FBEF8BEDDBB77EF79EAA9A7761D72C8216F73440050E4020015296E38F5ECB3CF6E2E144D9E3CF93E470500452E00507162D5F6965B6E5953C879FDF5D7778E1F3FFE084707807C413B2D8ADA0EDA62470A00E84B23468CB8B4A9A9696BA1C4E2C58BB7C475BA8E100059917B706A3BDB2B726B6B6B8F74A40080BE3260C0804FCD9B376F53A10DD75D77DD2C4709807CA13BBD9D2277919B3A00007D69ECD8B18BF6ECD9B3ABAD22F7B5D75EDB76DA69A7353A52006445EEC16D15B9757575473B4200405FF9DEF7BE3764C3860D9B0B1D983A756AA1B1B1F19D8E180059A1DBDAB5B98BADE202007D3C47891B4C2DEBA8C8FDFDEF7FBFD2D102203F80EC736DAE6B710180BE16F391F3CE3B2F8ADC9D6D15B89B376FDE7DFEF9E79BB700B0CF2032C52A2E00506ED2BC64FCA2458B96B455E4DE78E38DCF394A00B456E47E35772DEEE18E0800500EE2C4FB9021437EDFD4D4B4A6B4C05DBE7C79539AB70C7294006855766DAE555C00A09C3434347C74F4E8D12FE5EFB21C8FCF39E79C75E62D00B457E436DF69D9910000CA4D5C9FFBC8238F6CC88ADC993367BE983E778E2303D04352AE7DDBCA952BEF7DF4D14777CF9A35ABF0D0430F55648B22B752FFF634D8151E7EF8E13FA766DB120054A1534F3DF59AA6A6A6375E79E5953D279E78E2D6C6C6C6F7392A003D240ADCF9F3E717366CD850D8B16387D6472D0D7A8579F3E66D4E05EF717A25005497D89A7CE38D37AE183B766C9C98BFCE1101E841B182ABC02D9B4277C7430F3DF4B45E5979AA65474425373B22408E2DF73675EAD4E69D6793274F9663017A520C160ACCF2696920D9A957561E3B22EC8800E4D8CEB455AB56C9B1003D2DCECE991C975591EB065A15C88E083B220039568E05A8B02277EBA6970B2B17DF52F8C3CC8B9B5B3C8ECF49F88A5CEC88B023029063E558808A2A72B76C5C5B58F6BB0B0A4F3D70F65E2D3E175F93F015B9E2C88E087104C8B1722C40C50C1CABFFF0AFFB14B8595BF3876912BE81431CD911218E0039568E05A89C81E3E93997B559E4C6D7247C038738B223421C0172AC1C0B503103C7B2872E6AB3C88DAF49F8060E716447843802E45839164091AB1938FA511CD911218E0039568E0528938123AE6B696BE088AF49F8060E71E464913802E4583916A062068E150B7ED6E6C0115F93F00D1CE2C8044C1C0172AC1C0B503103C7AB6B9716963D78E1BE8346FA5C7C4DC2377088233B22C41120C7CAB100153370447B7EC9EDFB0C1AF139C9DEC0811D11E2089063E55880CA2A72B76F2FAC5878DDBE8346FA5C7C4DC2377088233B22C41120C7CAB100153170C47BCB2D5F706D9B6747E36BDE7FCEC0218EEC881047801C2BC70294F7C0B17D7BE1E515B30BFF36E3DC360BDCACC56BE2B556750D1CE2C88E087104C8B1722C40D90D1C1DADDE5AD53570D0B509981D11E2089063E558803E1C383AB37ADBDEAAAE01C0C0218EEC881047801C2BC70294CDC0B1BF056ED60C00060E716447843802E4583916A0BCCE8E6A060EBA154776448823BAEC7D0E0172AC1C0BA0C8357050A67164478438A24B0E4FAD50FC0872AC1C0BA0C83570208E347154B1FE31B58DA94D287E3CD221418E9563A9A9696868F8686D6DED88810307DE9BDA8AD4B6A456486D5B6ACFA7AF4D491FCF8AD7395A60E03070208EC411E555E066856DACE4BEA2D0458E9563FBB3BABABAA3537B28B51DC5A2B6336D4E7AFD20470F0C1C060EC49138A27C0ADC8E3E8F1CABC9B1552D15AA9F4885EA8C2E14B6ADB5F903060CF894A3898143C23670208EC411BDEBF00E0AD9ECEBAED1458E9563FB85DADADA81F5F5F5AFE50BD6868686C2D8B1630BB367CF2EAC5AB5AAF0FAEBAF17C21B6FBC5158BB766D61C1820585091326144E38E184D242778B55DD2A90FEAFDFB974E9D2E1B7DD76DBBC71E3C66D3EFDF4D37736363636FF270F1A3468CF0F7EF0831DE79D77DECACB2EBBECCED4FECE11337018381047E2883E2F703B2A60ADE822C7CAB1FDA5C03D3215A5BBF2C5ED9D77DE59D8B06143A133366EDCD8FCFAF8BE7CB19B7EE6498E6E8516B793274FBEFD924B2ED93972E4C8C20D37DC5078F4D1479BCF6C6CDBB6ADF93F3D3E460779FCF1C70BA9082EFCF0873FDC336AD4A817860D1BE63FDDC061E0401C89237AD73FD6746D85B6ABAF478ED5E4D84A2B7007E60BDC33CE38A379D5767FC4F79D7DF6D9A585AE15DD4A928AD9A1975E7AE9F6F88F8C0276D7AE5D9DEE004F3EF964E19C73CED9357CF8F0A7FBFB9E750387810371248EE8E502F7C8FDF8BE2D0A5D39569363AB4D5C839BDFA27CE18517B66C49DE5FB19579CC9831A55B970F72B4CB5CFABF7BDBFDF7DF3FFBE4934F2E4C9B36AD4BC56DA919336614860E1DDAD49F57750D1C060EC49138A28C0BDC03F5FDC8B19A1C5B7652813B33BF82DBDD02375FE896ACE8CE77B4CBBCC09D3B77EE63A79D765A61F9F2E507A413BCF0C20B855430379D74D249A71A38340307E2481C71C0757493A9DEFE39C8B19A1CDBE7E26D82F2D7E0EEEF16E5F6B62EE7AFD1B56DB98CC50A6E14B89DBD08BBB3E2E70D1B36AC5FDE85CCC061E0401C89237AA1C03D505B8DADE8CAB19A1C5B2D45EE4359011A378DEA0993264DB29A5BEEE21ADCD8A27CA056705B5BD11D3C78F0C6FEB667DDC061E0401C89237A48E94DA3FE22B521C58F5D51FA7D6E4625C76A726CB916AEFFB1338B660D0D0D1FCD6E3615ABADAFBEFA6A8FD43771D7E592B717FA84FFA532127751BEF8E28B77C435B83DE981071E684A1D6D9181433370208EC41107A4C03D3257A8DE14437AF163670BDDB6BE4FA12BC76A659A630F39E490B7F5D7BE1AC56BB1985C515B5B3BA2B1B1F19DADBD2EBE96159E3FFDE94F7BB4BE89F7D1CD15B967C9286564CA9429BF8C8BA7DF7CF3CD424F3BE59453D6F5A76DCB060E9373DAD799C15A1C8923DA2D70C39062A15AE842A19B2F70B33638F775D7E89AAB68659663531175DCF7BFFFFDC290214386F5D76237FFF63DA9BD92DA45B1C25BF29A7BB3D7CC9D3BB7476B9B050B16E4FF9E69324A998855DC781FDC789BA0DEF0D4534FEDA886D5DC3893545B5B7B637C3470989CD3ADC1EAE98E4E7C89A3CA8BA3FEBCD2D0C3DA2A3C5B2B58DB2B745B7BFDC4565EEF1A5D45AE562639365609EFB8E38ECD3B77EE7C63EDDAB51BAFBAEAAA65A79E7AEADFF7F322376B3BD35C62529A9B7FAEF89A15D9D70EF40DA74AA5FF8BFCDFB15A4629134B972E1D1E379BEACE5B0575D5D0A143D755FA9EF5F8FBB3A04AEDBAB6FE3D060E452E9D1EAC62EBD1C0D68A23715439719452FC87D6AC59B328CE6C9F7FFEF9672A76F715374349ED1BDD28700FEF42E1DA5AA1DBD902B7B4D0B575B94AFB9B1C5BDE3936F2E8C891236F5BB264C9E6D239F5B265CBDEB8E28A2B7ED1D6B6DD2A9D37EC6CA3D0CDDAF4D49AB2E707EA6D83DA7B3BA1DCEFDE26EB9489DB6EBB6DDEC489130BBD69C284094F56FA9EF54826A5679052BBA5BEBEFE8B060E452EFB7F463615BAFF2FB523C551E5C5D1AA55AB2ED8B66DDBCE2CD76FDFBEFDCDBBEEBA6B457F5C69E84C9F8FE223F5F5AF76F2DB3A5B687654E876B5C0CDFFFE576AACE856657F9363CB37C70E1830E0AF6EBEF9E627F3B9B5D49E3D7B76CF9933E7B5CB2FBFBCAE02BAE45FA47FD3BB060F1EFC1F8ABB223F93DA1752FFFC5A6A87C6F89FDA80F47848EAB727A7C767A4765E7A3C26B52BD3E3EBD3C72D1D14B97B15C1BD21FFFB649D32316EDCB8CD8F3EFA68AF16B90B172E7CA11AF6ACB7155CF9B3A6060E452EFB1747A92D4E7174B8382AFF38DABA75EB17D6AF5FFF425B39FFF9E79FDF96C69AEBFBD34A4317FBFCF40E56DABABA65B8AD42F72DFB59E0665CA35BA5FD4D8E2DCF1C7BD555577D7EE9D2A59B3B3BBFDEBE7DFBEED9B3673F3571E2C48FF776E199BE765BF13AD8DFA4362BB545A9C5A2D6F2D8C29BDAABC5D5D5DDC58F7F2E7EFE99E2EB1616BF6F5AFA59F7147F5EEC94BC323DBEB4F8FB46C5EF2F5E875B68E524F9CBE9B53F3EE69863FE53BE10B692DB4F9D7EFAE93B5F7EF9E55E2D72D7AD5BB7A11AF6AC777016A97920317094DFC051FCBFD95D3CD3B7A3986CB7A6C4F87A4A901B8B893812686CAB7F29B535A9AD4AEDF9D49E8B6DB5E9B57F4A1FFF98DAB2D49E8AD5C7F4F1F1D41E4BEDD162B29E9F5E372F7D9C93DACCD41E4CAF9B91DA0391C453BB3FB55FA7E7F71513FAA4F4FC97A9DD91DAADE9F9CDE9E3C4D46E88449F5EF7F3D4AE499FBF2A927E6AE3D3F3CBD2F3B13100A4E717C7CD1752BB20068348F4A9FDDFD835511C907E989E9F969E9F5A1C2486A5E727A58F438B03D709E9350DB165383D3F3E6E6E91DA31E9F951E9F93FD7D7D7FF9F283AD3F3FF9D3EFFBF8E3FFEF8FF999EFF434C96D2F3FF112B04A97D39BDEEBFA7E7FF2D7DFEF3716D4C1A383F9BDADFA5CF7F3A3DFFDBD8DA9F9EFF971848070D1AF4E14EC4D11271549E13B0B8A7C3EAD5ABEFD8BD7BF79E8EF27EAC34CC9831E3CFA3468DFA674547C72748BB51E0B657E83ED38D02B7BB7F0F4EC86B5DC8B14B962CB960F3E6CDBBF7679E5D9CEBDCD19B85677A3C380AE1F4F88862611C73822FC4D81FE37D1AF7FF3A0AE9FDC839ADF5E9E74BFA7314B4E31B1B1BDF977B8D6B72FBBBD4210ADBB66DEBD522377E5F9CE9886B0CE2CCFE77BEF39DF7A420787FEAFC1F489FFFCF31014ECFFF2626C62950FE3EB600A7CF1F1C01933E7EB338B93E2C26DDE9F977D2E7BF9B3ED6C6043D26EBC589FBC9C5DB878F4A1FCF8E097FFAF8936221F02FC5026142FA786D71EB431413B7168B8CBB539B9C3EFFAFE9E36FA33829162AF38B09624931F83B9A9CEFEEED8123262EA3478F6E7E3C6BD6AC423A46CDEDFEFBEF6FFE5A9C6D6AEDFBE2FF24BE7EE1851776FA774D9932A5F0B18F7DACCDAFFFF18F7F2CFCE94F7F6AF56FBCF5D65BFB74727ED14517BD25FA5FEA637F1949F784134E7877F4C3489091888BEFC3F6C128C2D2F38F449F8CE2ACD82F3F157D33F58FFF1AFD338AB9E8A3E9F997A2C84BAFFB4AF1ECE737525FFD567A7E481485C53EFBEDE8B7715634FA6E1491E9F3C7C6C010C565521F37618A7E9C9E7F2F3D3F318AD1E8CFE973A744911AC56A7150392B8AD8F4FC9CE24073416A17461F2F16BDFF124570F4F5F4FC8A288EA3484ECF7F561CA46E889BA7158BE9E8FBB7A7C777168BEDBB8B03E3AF539B1AB1502CCEE33A97DF45D19E5E373B7D9C5B8C8B05C5D878AC181F4F44F19FDABFA5D7FDA178522006D5678B83D38BC581F4A54EC4D11E13B0F29B80AD5FBFFED84D9B366DEE6AFEDFB871E3F6EBAEBB6E56E99D30151D7B9F202D6E2BEDEECA696B856E770ADCD242D735BA55D2DF7EF9CB5FCA6D65D4A64E9D5A183B766CA1AB8B504D4D4DBB6EBAE9A60D69EE31A6B70BCF5EEED34F67DB92631E93FE0D1F6AE535EEAE2CF90D2CF485DC9EF96DB182963EBE965AACF0AE2D4E809F2B4E8C97150BCAC5C549F4FCE2E4FAC1E2A43B56C326A776574CD063B21E1DBE3889BFB678B6E9A731E14F1F47472110056FB14018198570FA383C8A89E26A561419C747E11CAB57E9E33F457112854A142D912062A52A92443B03464CF08F8BEB28FAA2C88DE2331EBFFFFDEF2F7CED6B5F6B2E70B322F7C9279F6CFE5ABC29F6B7BEF5ADE63678F0E0E6AFC7FB88C56B468C18D1FCFC17BFF845F3F3C71E7BACE5E7BFFBDDEF2E7CFBDBDF6EFEFA05175CD0FC3BCE3BEFBC969FBF68D1A27DFE9EF8FEACE0CE5E77F3CD3717264F9EDCFC78CD9A35B62B9B80B5D6E2C4D2215619CAAF458EB9E69A6BA2602DEC4791DBFCBD9D9878F7EBF6DDEF7E372B46277433C4DED2CA0AEE33C5CF77C704FF4FD5D7E4B7F2399178ECB1C77EBAB1B1F1F63457DAF96627DEE373F9F2E55BCF3EFBECCBFBC3CDFE8AF38339A5F7C1C9F33EB9D40C1932644F6FAFE4363535ADAB863DEBE9DFF072C900112B538DF904D35B93F3975E7AA9A580FCF9CF7F5EB8FDF6DB9B57599F7FFEF9BD0ACE7BEFBDB7E5F9962D5B5A565CF39F9F3F7F7E9B8567FC8C5FFDEA57CD8FE3F77DFCE31FDFEB6B77DF7DF75EAF8FB35BF1F195575E29A4E3B257911B1FA3F8754DAE22B737AE178BFE16035DBE2F64275EDEF39EF7C41D2AF78AA7787D7C6EC58A1585238E38A2B9C56B23AEE20450FE67C78E85787D7C5F9CE839FEF8E39B5B760229BE96FF9E38F173CC31C7B4BCA6ADD7B5F5EFB8FCF2CB3B7CCD59679DD5FC386232727CF6F93BEFBCF380C451AC020C1B36EC370B172E7C79CF9E3D9DBA3DFFA64D9B7E357CF8F03969F231A5D2EFB0DF43277616C72E8FDC18D2D1DD94BBB392DB99F7D1B592DB4FFA5B4FCF559E7BEEB942FE77441F1C33664CABAF7DF0C1075B769E3DF0C0032DF9317270EC3E3CD00B037D9D4F3B71E3A94FA5DF7FCFF4E9D377C6651FAD5D0A326DDAB457CE3CF3CC7FEA477DBAC3F123C6A8EC0654E971F3E24E4F8813B783060DDA938BAB4FC83A65E2B4D34EDBD1DBD7E4A689E03355724D6E764DC0CB71C628566E4B5FD39B2B50D996E3180CDA5AC97DE28927F6FA9E175F7CB1F9F3575F7DF55E3F275669E3F3AD25FB2F7DE94B6DAEE4CE9933A7A570CE3EB77AF5EAE6C7C71E7B6CCBE7F28FB3EF51E4F6FB09586C2D3AB8B5D774278EE6CD9BD7DCD72EB9E49296133171C2255A14A5A593952858A34F7EE52B5F69EEA731D1CA2635F9DD0CF9DFF1F6B7BFBDF0DEF7BE37EE37D0F2DA989CD5B47189C0073EF081C2A1871EDA6A7C954E9AB2BF3F9BE87DF8C31F2E7CF39BDF6C89EBD811F1C94F7E729F9F1377CDCF1EC749AFB64E4475378EEAEAEA8E1E3D7AF4EA34D06F68E77ADC6537DC70C38DC5EBD98FD6E73B2C6E4B0BCA2D353D734DEEFE14BAAEC9ADC2FED61B73959AE26EAF280AE2717612BCB5D75D79E595FBE4DEF8FC8F7FFCE396E7916F238F461E8CBC19F39DF8F7E5F365E4BE77BDEB5D659D4F3B3B578962F7B2CB2E9BB672E5CA964277FDFAF55BC68D1BF7DBFE7CF9477BE2BAF3ACDF471FE90993264DCAC7D67C47BD8CA44265456FDF5DF977BFFBDD6FABE4EECAB1757A647B770CED8BEDCA91A8E3CCE45BDFFAD6C219679CD192BC7FF4A31FEDB56579C99225CDCF63C089C7F99F914DD0870E1DBACFCFCF927A7B2BB9D9C43E3EB774E9D2E6E71FF9C8470A871D7658CBDF13034F14C05672FBFD04ECDEECCDDB7B228E62C7427E32357DFAF496BE19ABB4F1B5EC73F955DC584D68EDE79516B9F1F3E3F57162273EC62429264451F49E72CA29AD5E0F1F93A4384114F159BA921B3F27BF93A2742215CFA360CF17D8D9C42F766E643F272E4588DF138FB36BE3B3782C3DB1D5DD388A137C0D0D0D57A77FFB86DDBB7737E56FC1F0ECB3CF5E9FBEB62CEE8190BF2988A2A3B92D8AA2BF13DB0BBBBA72DAD6DB04B57677E5AE14BAEEAE5CA5FDAD27E72AB12326F2629CDC8BFCF48E77BCA3F9F9673FFBD9E662B6F45288EC6F89FE19F396EC71EC7E29FDD99157B3394BF6BA6CA758E4D5286CF2F70E29C77CDAD5B94A14BBF7DC73CFFC28AE4E3FFDF493F4F0768BDCA3B3FE1FABB907FA0654F1F3EAEBEBF7E46EE636C8512F23E3C78F9FD8DBEF937BE185173E500D7BD63B73DD436F15B931591F376E5CCB4A50B6AA9B4DD8B3EB744BB70FE5137D4CACE3E7C4E338DBD95611DD9922B7B52DD2F13856C7F213FAD81AADC8A5A7E3289BF0C4A4251E673B18B2FE9E3FD912AB03F1B9B67E6769911BAF4D138DE69F153F77F8F0E1CD9FDBBC7973CBAE8AD2188CB8894953E9CF8E823B5BE5C80ADD28A2635B7F7E47469C7C8AC731E98B7F576BFFDEFCCAC3073FF8C1962D80B14AD1567C77378E62257ED4A8514B57AE5CB9B6A9A969DEB9E79E7B77F15E0A07EBC57B1DA7F6566E3B2A743B2A303B7A1FDC8EDE47B72DF17FE87D72ABB4BFF5E45C254E2246F158FAF9381178D45147B53CCF0AC6EC7E1D59B1198FE367C4FCA2A695DD5F35B91D6C35C5CB4C6A8A97566573A02CC797633EDDDFB98AB764EB74FF9F9315A17162F940BD9D509C6039F3CC3377E55771FBC3F5D015E5FCF3CFFFDB112346ECDEB56B576FD5B8DBEAEBEB9FEB2F7BD67BF39ADCD88A9C25F36CA29CAD2EC5DD8C638088D5A3D6BE3F26FFD98DA6DABB4EB6A693DB95F3AF8F812B2B2EF283414DC935C28A5C0E741C65D7AA7FEE739F2B5C7BEDB5CD056A4CA0A2C83CE8A0839ABF1EFD3D8AD3EC7BE2BA9D9A4EAEE4C619FDECC66CD90A42E919FED839515AE4C6EF8CCFC5F6BAD8DD70FDF5D737C7557C8C1D0EF1B8BD9345D9842E267E31516C2D4EA388CE766B6437848BC7711C7A328E62908F1D2EC5B3DA230DFA0754472BA91D15B835FB59E8665BA68FF65F20C7F654911BF396C89B91AF220746B11AAFC9DFD0323B4119F9343B919815A191DBB25C59D3C64A6E39E65373951E2F723F917F5FDD781791EE16BA51E08E1933267F1DEE9634DE1DE46897A133CE38E3D9C71F7FBCB7B62ADFD99FF6ACF7C576E51818B282355B956A6BC25EFABD35AD5C875BFA9AAC082E5DC9CDCE7496BE3EBB56311EC775905672E9CD388AA2350ADAECAEE031D92ADD929CAD1474B5C8CD7651C4CFFDE217BFD85CB066456D3619CB8ADD9894C5C018856DFE5AF97C3CC496B76CA2965F5D8EE75FFFFAD7F7597988EBC94A5742E2062935B91B58954EE80EF435B9ED15BB7A6E8F686B45B7B3056E570BDDECF72970E5D8FD2E72A37F9D7CF2C9FB5C9E3172E4C87DB636C7D7A2808DA23276B764B932DBEA9C9F6B64978BE4737996DF632537BE1E39BA745E524EF9D45CA5E715DFA271677E45777FB72EC7F795ACE0DAA65CCE4E3CF1C401E93F6C672FACE66EACAFAF7FA23F7586DE2C72B3649F4DAA23B147F28EC7F96B6E4B5B9C95AC29AE38E5CF80C61D91DBFB7DA5456E5B4571F6B60435C56D485672E9CD388AC952E924288B91EC264FF9C75D2D72F33747C962AD26B7652E7FAD6EE9F5EAF9FE5FD3CE755D9D9D94C5C9A4B80CA1A664FB5E7E5296FDDBBBF3D65DE2A8CFC58A6EE9D6E121355D7F1FDCD60ADDC125BFC735B8726CB75AE4C068590E1A3D7A74CB09C2D23C94F5C338011E79359F2FDB2A28F3F92EF276962723A747AE2EDD825C6EF9548EED1DF1EE27F94237AED18D3ED2D9B7C28BD7C575D0F96B70A3A502FA1C47B7CC0D1F3E7CE9B469D37AB4C28DEB7FFBDB9EF5DE2C728B49B1F916FB31B1CF26D431A064D70946128F641CC93BB616C7CA6ABCE55069B11CDB9B2378DB9BECC776A2B82B617B7F53BE50AE29DEB0217E7F760387F83B14B9F4641C65277FF2939A6CFB7C14A4D90DD9B24958578BDCE8E3913B63B5227BCBAED81EF7F9CF7FBE6532D4DACFCA567CB39B62B557E4E66F8C959F70453C657F777BD790C5442C2BBEE36F8CBF2B7FD7527154B1856EFE6654F982B533056E4D07DFE76D82E4D86EB7D89112F92FE60B71EF82ECA463CC03A2808C9D35279D74D23EDF17392B7F07FAF68ADCB86C2A7E7E5C0E95CD7D6A726F7758EEF9548EED3DB1A29BDAC67C911AC56EBCBDE0DCB9739B5769B3ADCC317F5EBB766DF3181DEFED3E64C890DD257729DF1285B3A35A1967383E3174E8D0A6E5CB97F748819B92C2FDF1563BFD6DCF7A6F6F57D60C1CE268EF965D9F9E6DB3AFC9DD702ACEE246515B7A1D6F4D2BD7A6C7F6E3EC4452DC3539FFB5B82E373FA9CA566F638217D7D96693A1D2BF2DAEBF8D9D14D94D4CF23B1D3ABA837A5B057D56D4C789AAFCCA487633BAB81EA9A6E4AD38C451C52ADDBA1C05EAE09AAEBF2D50E9F775F7FD79315769396118454214A283060DDAEBEBF9B7E2C95F6F1B775D8E7C997F8FDC9A92B71E8C82365B65FDCC673ED39CB7A328CEDE52A8A6B8232D7BDC566E2D877C2AC7F67EBD937F6BA1FD6CF35D835B6152026A183E7CF81B1B366C38A005EE9A356B1EA9AFAF7FB13FEE5957E42A7229CF38AAC9BDED44BEC5D9FCF85AFEEEE359CBCEDE6737982A7DAFDC58E18DC95769811C2BBD5FFEF297DB7C7FEBEC1AFAD2F7B1EEEAA42C5A7667D2FCCD51F2376E1147555FE876576B5BA19163BBD5E29E04598118D7E666BBCB6255B4ADEFE9CCEA6814A15D797D39E65339B6CF8ADDE38AC5EECEAE14B7B17AEB9E1315AAA1A161E8B061C3B61CA815DD58C18D02B7BFEE5957E42A721147E2880A29740F74C18C1CABC9B1E55EF77CB4F88E00F7A6F67C7A9C6D4BDE96DAEAD4A6C5DB9EF6977785A97AB1677DD0A0419BA74E9DBAB51B37A3DA78C51557DC125B94FBF39E750387810371248EE805DDDD626C8BB21CABC9B1FDBDFEF96AB6B29B8A5DB9B05AC5198BFAFAFA59C3870F5FF7C4134F3475E57D701F7CF0C149A9485E6CCFBA81C3C081381247F47AA1DBD5955837999263E5363956915B5B3B25B73579B12352FDC5EE7151EC3636366E18376EDC1F1E79E49117D7AE5DFB725CFB109A9A9AD6BDF4D24BCFCC9C39F337175D74D1F486868695F6AC1B380C1C882371449FE8EA96635B949163E558F5CEC08107975E9F9B8A5E79B13F28DDB35EDCAB6ECFBA81C3C0813812475466A17B706A5B523BDA219363E53639B69F17B9D35AB9D1D4620B7660E03070208EC411E5E3F062017B783B5F7F45818B1C2BC72A70F75DC5CD5A5D5D9D1C09060E0307E2481C5146DA5AD1B5451939568EE5DF8BDCE9EDBC6DD02247080C1C060EC49138A2BC0B5D052E72AC1CCBBF17B80777F45EB9AECD050387810371248E28DF427782021739568E65AF22775A7B05AE3B2D8381C3C08138124794AFC363B256E36D829063E5583A2A7C1D7F307018381047E2081337E4584D8E952BC1C0A119381047E2081337E4584D8E952BC1C0A11938C491268E3071438E9563912BC1C0A11938C491268E4CDC408E9563912BC1C061E0401C69E2C8C40D39569363E54AC0C061E0401C89234CDC9063353956AE04038766E0401C89234CDC9063E558E44A307068060E71A489234CDC9063E558E44A3070183810479A383271438ED5E458E44A307018381047E2081337E4584D8E952BC1C0A119381047E2081337E4584D8E952BC1C0A11938C491268E3071438E9563912BC1C0A11938C491268E4CDC1C05E4583916B9120C1C060EC491268E4CDC9063353956AE0432B366CD92B0CBA76D4B03C74EBDD2044C330133710339568E45AE84FDF4F0C30FBFBC61C30649BB0CDADAB56BEF4A03C7D37AA50998660266E20672AC1C8B5C09FB69F6ECD947CD9D3B77D3FAF5EB9B24EEBE5BC18D0277E6CC992FA6769C5E5979EC88B023021337E4583916B912CA482AAC8E4C096B7124AD383B57696DD2A4498508F84AFCDB8B2D8EFBD30ADCCA6547841D1198B821C7CAB1C895C0810CF66911F0871C72C8DB1C0DFA42B5EC884893173B223071438ED5E458B912E84BB5B5B55F4DC1BE3302BEAEAEEE704784BE52E93B221E7BECB1C235D75C539832658A1D1198B821C76A72AC5C09F461913B2582BDD8163B22D0758542E19DAFBDF6DAC6A4306CD8B0DF382298B801C89540DF04F9C1D92A6ED652D17BA423035DB37AF5EA3B0A450B172E5C5B575777B4A382891B805C09F47E904FCB17B8D96AAE6B73A1F3B66EDDFA85DDBB77EF29E48C193366756363E3FB1C1D4CDC00E44AA0F7027C9F55DCAC598582CE5BB76EDDCA42894D9B36AD6B6868B8DAD1C1C40D40AE047A2FC0A7B756E016DB2247083AB66AD5AA0B0A6D983265CABA3899E42861E2062057023D1FDC6DAEE2BA36173A27D5B11FDABE7DFB9B6D15B97BF6ECD9316AD4A8A5B6FF63E2062057023D1FDCD3DA2B70DD69193AB666CD9A45850EAC5CB972755D5DDD48470B133700B91210F050D6162C58D0518D5BD8B66DDBDC88ADC6C6C6773A62C8E300722520E0A16CFDE4273F39B5BDEDCA51E39E7BEEB9775BC9451E07902B01010F15E1AEBBEE7AA6AD0AF7D9679FBD3E6EE2E69A5CE47100B91210F05011060C18F0A954CC6E6BE5A653CB1A1A1A96B9BB32F238805C090878A828E3C78FBF3615B5BBF345EEC489136FAAADAD9DE0E8208F03C8958080878A12DB9167CC98B1212B70376DDAF4AB144F2B1A1B1BDFE7E8208F03C8958080878A3362C48843376EDCB83DB5C2B061C366D6D5D51DEDA8208F03C8958080878A75C30D374CBFE69A6B0AB5B5B5531C0DE47100B91210F050D1627B72C451DC8CCAD1401E07902B01010FE208F43F00B91210F0208E40FF03902B01010FE208FD0F40AE04043C208ED0FF00E44A40C0833802FD0F40AE04043C8823D0FF00E44A40C0833842FF0340AE04010F8823F43F00B91210F0208E40FF03902B01010FE208F43F00B91210F0208E40FF03902B01010FE208FD0F40AE04043C208ED0FF00E44A40C0833802FD0F40AE04043C8823D0FF00E44A40C0833842FF0340AE04010F8823F43F00B91210F0208EC411FA1F805C0908781047A0FF01C8958080077104FA1F805C0908781047E87F00722520E0017184FE07205702021EC411E87F00722520E0411C81FE07205702021EC411FA1F0072250878401CA1FF01C895808007C411FA1F805C0908781047A0FF01C8958080077104FA1F805C0908781047E87F00722520E0017184FE07205702021EC411E87F00722520E0411C81FE07205702021EC411FA1F0072250878401CA1FF01C895808007C411FA1F805C0908781047A0FF01C8958080077104FA1F805C0908781047E87F00722520E0017184FE07205702021EC411E87F00722520E0411C81FE07205702021EC411FA1F0072250878010FE208FD0F40AE04043C208ED0FF00E44A40C0833802FD0F40AE04043C8823D0FF00E44A40C0833842FF03902B01010F8823F43F00B91210F0208E40FF03902B01010FE208F43F00B91210F0208ED0FF00902B01010FE208FD0F40AE04043C208E289FFEA7699AA675DC8C1860720E8823000030390771040000F4D9E45CD3345BA00000000000000000000000000000000000000000000000000000000000000000000000BAE5FF038AEFC49945EEA7A80000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('11a19af0-8739-11e9-94e4-54a050572538', 1, 'source-extra', NULL, '', NULL);
INSERT INTO `act_ge_bytearray` VALUES ('d9fa3d6a-8736-11e9-8100-54a050572538', 11, 'source', NULL, 0x7B227265736F757263654964223A2264396533636633392D383733362D313165392D383130302D353461303530353732353338222C2270726F70657274696573223A7B2270726F636573735F6964223A224C6561766542696C6C222C226E616D65223A22E8AFB7E58187E6B581E7A88B222C22646F63756D656E746174696F6E223A22E8AFB7E58187E6B581E7A88B222C2270726F636573735F617574686F72223A226D61646520627920626F6F74222C2270726F636573735F76657273696F6E223A22222C2270726F636573735F6E616D657370616365223A22687474703A2F2F7777772E61637469766974692E6F72672F70726F63657373646566222C22657865637574696F6E6C697374656E657273223A22222C226576656E746C697374656E657273223A22222C227369676E616C646566696E6974696F6E73223A22222C226D657373616765646566696E6974696F6E73223A22227D2C227374656E63696C223A7B226964223A2242504D4E4469616772616D227D2C226368696C64536861706573223A5B7B227265736F757263654964223A227369642D39314431323431372D304238362D343041392D413944382D373038463730363039453437222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22222C22696E69746961746F72223A22222C22666F726D6B6579646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22227D2C227374656E63696C223A7B226964223A2253746172744E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D30343944433738412D373741422D343644422D413536372D433241463530324233354534227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3132302C2279223A3136367D2C2275707065724C656674223A7B2278223A39302C2279223A3133367D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E68F90E4BAA4E794B3E8AFB7222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C22657865637574696F6E6C697374656E657273223A22222C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B7B226576656E74223A22637265617465222C22696D706C656D656E746174696F6E223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C22636C6173734E616D65223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C2265787072657373696F6E223A22222C2264656C656761746545787072657373696F6E223A22227D5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D43413837334545372D354544352D343530412D394132352D424131304642433345353646227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3237382E37352C2279223A3138397D2C2275707065724C656674223A7B2278223A3137382E37352C2279223A3130397D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E983A8E997A8E9A286E5AFBCE5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C22657865637574696F6E6C697374656E657273223A22222C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B7B226576656E74223A22637265617465222C22696D706C656D656E746174696F6E223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C22636C6173734E616D65223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C2265787072657373696F6E223A22222C2264656C656761746545787072657373696F6E223A22227D5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D44443832413745392D454542302D344536362D384533392D343341313635323131364146227D2C7B227265736F757263654964223A227369642D44444533354245322D413742352D343041412D383434422D353043393046343235454342227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3438382E37352C2279223A3139317D2C2275707065724C656674223A7B2278223A3338382E37352C2279223A3131317D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E680BBE7BB8FE79086E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C22657865637574696F6E6C697374656E657273223A22222C226D756C7469696E7374616E63655F74797065223A224E6F6E65222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365222C22757365727461736B61737369676E6D656E74223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A7B227461736B4C697374656E657273223A5B7B226576656E74223A22637265617465222C22696D706C656D656E746174696F6E223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C22636C6173734E616D65223A22636F6D2E73747564792E626F6F742E6163742E6C697374656E65722E4C6561766550726F636573735461736B4C697374656E6572222C2265787072657373696F6E223A22222C2264656C656761746545787072657373696F6E223A22227D5D7D7D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D32383643453846382D334644302D343244412D394336362D324131383345424642433943227D2C7B227265736F757263654964223A227369642D30323543414446342D433431332D343141442D383836412D363833463343313745303631227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3833332E37352C2279223A3139317D2C2275707065724C656674223A7B2278223A3733332E37352C2279223A3131317D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A22456E644E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3934332C2279223A3136317D2C2275707065724C656674223A7B2278223A3931352C2279223A3133337D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A2266616C7365222C226578636C7573697665646566696E6974696F6E223A2266616C7365222C2273657175656E6365666C6F776F72646572223A22227D2C227374656E63696C223A7B226964223A224578636C757369766547617465776179227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D31453833423543302D464334302D343544382D413632312D383139454343323036353341227D2C7B227265736F757263654964223A227369642D43433844323544412D424441392D344444332D393731372D353133443434393635384132227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3631382C2279223A3137317D2C2275707065724C656674223A7B2278223A3537382C2279223A3133317D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D30323543414446342D433431332D343141442D383836412D363833463343313745303631222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E9A9B3E59B9E222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B726573756C742E657175616C73285C22E9A9B3E59B9E5C22297D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3738332E37352C2279223A3131302E3239363837357D2C2275707065724C656674223A7B2278223A3232382E37352C2279223A33307D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A3738332E37352C2279223A33307D2C7B2278223A3232382E37352C2279223A33307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D7D2C7B227265736F757263654964223A227369642D32383643453846382D334644302D343244412D394336362D324131383345424642433943222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B726573756C742E657175616C73285C22E5AEA1E689B95C22297D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365222C2273686F776469616D6F6E646D61726B6572223A66616C73657D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3931352E352C2279223A3135317D2C2275707065724C656674223A7B2278223A3833342E35333132352C2279223A3135317D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A312E352C2279223A31387D5D2C22746172676574223A7B227265736F757263654964223A227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836227D7D2C7B227265736F757263654964223A227369642D43433844323544412D424441392D344444332D393731372D353133443434393635384132222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5B08FE4BA8EE7AD89E4BA8E33E5A4A9222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B646179733C3D337D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3932392C2279223A3236317D2C2275707065724C656674223A7B2278223A3539382E352C2279223A3136312E3335393337357D7D2C22646F636B657273223A5B7B2278223A32302E352C2279223A32302E357D2C7B2278223A3539382E352C2279223A3236317D2C7B2278223A3932392C2279223A3236317D2C7B2278223A31342C2279223A31347D5D2C22746172676574223A7B227265736F757263654964223A227369642D37414134333841422D343936342D343334322D423843432D393031323544433732333836227D7D2C7B227265736F757263654964223A227369642D44443832413745392D454542302D344536362D384533392D343341313635323131364146222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B726573756C742E657175616C73285C22E5AEA1E689B95C22297D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3537382E3333373839303632352C2279223A3135317D2C2275707065724C656674223A7B2278223A3438392E3531353632352C2279223A3135317D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A32302C2279223A32307D5D2C22746172676574223A7B227265736F757263654964223A227369642D46323743433232332D364145452D344643382D383432302D463534323041363741433536227D7D2C7B227265736F757263654964223A227369642D31453833423543302D464334302D343544382D413632312D383139454343323036353341222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5A4A7E4BA8E33E5A4A9222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B646179733E337D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3733332E35343239373233393234332C2279223A3135312E34343635313937303435303034377D2C2275707065724C656674223A7B2278223A3631382E33313434343934383235372C2279223A3135312E31333535313135343534393935337D7D2C22646F636B657273223A5B7B2278223A32302E352C2279223A32302E357D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D37323239344534382D393637352D343937302D413536422D434134343239364334424338227D7D2C7B227265736F757263654964223A227369642D44444533354245322D413742352D343041412D383434422D353043393046343235454342222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E9A9B3E59B9E222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22247B726573756C742E657175616C73285C22E9A9B3E59B9E5C22297D222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3433382E37352C2279223A3236347D2C2275707065724C656674223A7B2278223A3232382E37352C2279223A3138392E35333132357D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A3433382E37352C2279223A3236347D2C7B2278223A3232382E37352C2279223A3236347D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D7D2C7B227265736F757263654964223A227369642D43413837334545372D354544352D343530412D394132352D424131304642433345353646222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5AEA1E689B9222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3338382E3533313239353334383338392C2279223A3135302E353231373236363232333635367D2C2275707065724C656674223A7B2278223A3237382E3936383730343635313631312C2279223A3134392E343738323733333737363334347D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D46323637384443372D304131362D343039302D413744322D333034384432414146383933227D7D2C7B227265736F757263654964223A227369642D30343944433738412D373741422D343644422D413536372D433241463530324233354534222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22E5BC80E5A78BE6B581E7A88B222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C22657865637574696F6E6C697374656E657273223A22222C2264656661756C74666C6F77223A2266616C7365227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3137382E34343334383939343833333939332C2279223A3135302E373439343635343934313134367D2C2275707065724C656674223A7B2278223A3132302E35303138323235353136363030372C2279223A3134392E383133303334353035383835347D7D2C22646F636B657273223A5B7B2278223A31352C2279223A31357D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D41344235413035432D344433352D343736372D413035352D424138424643363934364237227D7D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313230302C2279223A313035307D2C2275707065724C656674223A7B2278223A302C2279223A307D7D2C227374656E63696C736574223A7B2275726C223A227374656E63696C736574732F62706D6E322E302F62706D6E322E302E6A736F6E222C226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D2C227373657874656E73696F6E73223A5B5D7D, NULL);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.4.1.3)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.4.1.3', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.4.1.3', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('153c6fae-8b44-11e9-9420-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-91D12417-0B86-40A9-A9D8-708F70609E47', NULL, NULL, NULL, 'startEvent', NULL, '2019-06-10 13:53:34.184', '2019-06-10 13:53:34.187', 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('153d5a0f-8b44-11e9-9420-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-049DC78A-77AB-46DB-A567-C2AF502B35E4', NULL, NULL, '开始流程', 'sequenceFlow', NULL, '2019-06-10 13:53:34.189', '2019-06-10 13:53:34.189', 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('153d5a10-8b44-11e9-9420-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', '15406751-8b44-11e9-9420-54a050572538', NULL, '提交申请', 'userTask', NULL, '2019-06-10 13:53:34.189', '2019-06-10 14:48:01.105', 3266916, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('1d1be897-8da1-11e9-9f99-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-CA873EE7-5ED5-450A-9A25-BA10FBC3E56F', NULL, NULL, '审批', 'sequenceFlow', NULL, '2019-06-13 14:04:32.914', '2019-06-13 14:04:32.914', 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('1d1cd2f8-8da1-11e9-9f99-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', '1d202e59-8da1-11e9-9f99-54a050572538', NULL, '部门领导审批', 'userTask', NULL, '2019-06-13 14:04:32.919', NULL, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('b079f029-8b4b-11e9-b6bb-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-CA873EE7-5ED5-450A-9A25-BA10FBC3E56F', NULL, NULL, '审批', 'sequenceFlow', NULL, '2019-06-10 14:48:01.111', '2019-06-10 14:48:01.111', 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('b07a3e4a-8b4b-11e9-b6bb-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', 'b07cfd6b-8b4b-11e9-b6bb-54a050572538', NULL, '部门领导审批', 'userTask', NULL, '2019-06-10 14:48:01.112', '2019-06-10 14:55:58.091', 476979, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ccd187e9-8b4c-11e9-a912-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-DDE35BE2-A7B5-40AA-844B-50C90F425ECB', NULL, NULL, '驳回', 'sequenceFlow', NULL, '2019-06-10 14:55:58.157', '2019-06-10 14:55:58.157', 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ccd1aefa-8b4c-11e9-a912-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', 'ccd1fd1b-8b4c-11e9-a912-54a050572538', NULL, '提交申请', 'userTask', NULL, '2019-06-10 14:55:58.158', '2019-06-13 14:04:32.904', 256114746, NULL, '');

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------
INSERT INTO `act_hi_comment` VALUES ('1cf43c55-8da1-11e9-9f99-54a050572538', 'comment', '2019-06-13 14:04:32.653', 'admin', 'ccd1fd1b-8b4c-11e9-a912-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', 'AddComment', 'ttt', 0x747474);
INSERT INTO `act_hi_comment` VALUES ('b0581045-8b4b-11e9-b6bb-54a050572538', 'comment', '2019-06-10 14:48:00.887', 'admin', '15406751-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', 'AddComment', '333333333333', 0x333333333333333333333333);
INSERT INTO `act_hi_comment` VALUES ('cc97da47-8b4c-11e9-a912-54a050572538', 'comment', '2019-06-10 14:55:57.779', 'admin', 'b07cfd6b-8b4b-11e9-b6bb-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', 'AddComment', '666665', 0x363636363635);

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('15d68cd2-8b44-11e9-9420-54a050572538', NULL, 'candidate', 'admin', '15406751-8b44-11e9-9420-54a050572538', '2019-06-10 13:53:35.194', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('15d6daf3-8b44-11e9-9420-54a050572538', NULL, 'participant', 'admin', NULL, '2019-06-10 13:53:35.195', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('1d157ff6-8da1-11e9-9f99-54a050572538', NULL, 'participant', 'admin', NULL, '2019-06-13 14:04:32.873', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('1dcbd7aa-8da1-11e9-9f99-54a050572538', NULL, 'candidate', 'admin', '1d202e59-8da1-11e9-9f99-54a050572538', '2019-06-13 14:04:34.066', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('b0718bb8-8b4b-11e9-b6bb-54a050572538', NULL, 'participant', 'admin', NULL, '2019-06-10 14:48:01.055', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('b103928c-8b4b-11e9-b6bb-54a050572538', NULL, 'candidate', 'admin', 'b07cfd6b-8b4b-11e9-b6bb-54a050572538', '2019-06-10 14:48:02.013', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('ccc15b48-8b4c-11e9-a912-54a050572538', NULL, 'participant', 'admin', NULL, '2019-06-10 14:55:58.053', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('cd6367ac-8b4c-11e9-a912-54a050572538', NULL, 'candidate', 'admin', 'ccd1fd1b-8b4c-11e9-a912-54a050572538', '2019-06-10 14:55:59.113', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('153c489c-8b44-11e9-9420-54a050572538', 1, '153c489c-8b44-11e9-9420-54a050572538', 'LeaveBill_14', 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '2019-06-10 13:53:34.182', NULL, NULL, NULL, 'sid-91D12417-0B86-40A9-A9D8-708F70609E47', NULL, NULL, NULL, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('15406751-8b44-11e9-9420-54a050572538', 3, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, '提交申请', NULL, NULL, NULL, NULL, '2019-06-10 13:53:34.189', NULL, '2019-06-10 14:48:01.062', 3266873, '审批', 50, NULL, NULL, NULL, '', '2019-06-10 14:48:01.062');
INSERT INTO `act_hi_taskinst` VALUES ('1d202e59-8da1-11e9-9f99-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, '部门领导审批', NULL, NULL, NULL, NULL, '2019-06-13 14:04:32.919', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2019-06-13 14:04:32.942');
INSERT INTO `act_hi_taskinst` VALUES ('b07cfd6b-8b4b-11e9-b6bb-54a050572538', 3, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, '部门领导审批', NULL, NULL, NULL, NULL, '2019-06-10 14:48:01.112', NULL, '2019-06-10 14:55:58.074', 476962, '驳回', 50, NULL, NULL, NULL, '', '2019-06-10 14:55:58.074');
INSERT INTO `act_hi_taskinst` VALUES ('ccd1fd1b-8b4c-11e9-a912-54a050572538', 3, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, '提交申请', NULL, NULL, NULL, NULL, '2019-06-10 14:55:58.159', NULL, '2019-06-13 14:04:32.896', 256114737, '审批', 50, NULL, NULL, NULL, '', '2019-06-13 14:04:32.896');

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('b070ef76-8b4b-11e9-b6bb-54a050572538', 2, '153c489c-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', NULL, 'result', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, '2019-06-10 14:48:01.053', '2019-06-13 14:04:32.869');
INSERT INTO `act_hi_varinst` VALUES ('b07164a7-8b4b-11e9-b6bb-54a050572538', 2, '153c489c-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', NULL, 'days', 'integer', NULL, NULL, NULL, NULL, NULL, 2, '2', NULL, '2019-06-10 14:48:01.054', '2019-06-13 14:04:32.870');

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.4.1.3', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('0e890b08-8b44-11e9-9420-54a050572538', '请假流程', NULL, NULL, '', '2019-06-10 13:53:22.941', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------
INSERT INTO `act_re_model` VALUES ('d9e3cf39-8736-11e9-8100-54a050572538', 13, '请假流程', 'LeaveBill', '请假流程', '2019-06-05 10:08:46.508', '2019-06-06 13:35:30.565', 1, '{\"name\":\"请假流程\",\"description\":\"\",\"revision\":1}', NULL, 'd9fa3d6a-8736-11e9-8100-54a050572538', '11a19af0-8739-11e9-94e4-54a050572538', '');

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', 2, '请假流程', '请假流程', 'LeaveBill', 1, '0e890b08-8b44-11e9-9420-54a050572538', '请假流程.bpmn20.xml', '请假流程.LeaveBill.png', '请假流程', 0, 1, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------
INSERT INTO `act_ru_actinst` VALUES ('153c6fae-8b44-11e9-9420-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-91D12417-0B86-40A9-A9D8-708F70609E47', NULL, NULL, NULL, 'startEvent', NULL, '2019-06-10 13:53:34.184', '2019-06-10 13:53:34.187', 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('153d5a0f-8b44-11e9-9420-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-049DC78A-77AB-46DB-A567-C2AF502B35E4', NULL, NULL, '开始流程', 'sequenceFlow', NULL, '2019-06-10 13:53:34.189', '2019-06-10 13:53:34.189', 0, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('153d5a10-8b44-11e9-9420-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', '15406751-8b44-11e9-9420-54a050572538', NULL, '提交申请', 'userTask', NULL, '2019-06-10 13:53:34.189', '2019-06-10 14:48:01.105', 3266916, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('1d1be897-8da1-11e9-9f99-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-CA873EE7-5ED5-450A-9A25-BA10FBC3E56F', NULL, NULL, '审批', 'sequenceFlow', NULL, '2019-06-13 14:04:32.914', '2019-06-13 14:04:32.914', 0, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('1d1cd2f8-8da1-11e9-9f99-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', '1d202e59-8da1-11e9-9f99-54a050572538', NULL, '部门领导审批', 'userTask', NULL, '2019-06-13 14:04:32.919', NULL, NULL, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('b079f029-8b4b-11e9-b6bb-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-CA873EE7-5ED5-450A-9A25-BA10FBC3E56F', NULL, NULL, '审批', 'sequenceFlow', NULL, '2019-06-10 14:48:01.111', '2019-06-10 14:48:01.111', 0, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('b07a3e4a-8b4b-11e9-b6bb-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', 'b07cfd6b-8b4b-11e9-b6bb-54a050572538', NULL, '部门领导审批', 'userTask', NULL, '2019-06-10 14:48:01.112', '2019-06-10 14:55:58.091', 476979, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ccd187e9-8b4c-11e9-a912-54a050572538', 1, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-DDE35BE2-A7B5-40AA-844B-50C90F425ECB', NULL, NULL, '驳回', 'sequenceFlow', NULL, '2019-06-10 14:55:58.157', '2019-06-10 14:55:58.157', 0, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ccd1aefa-8b4c-11e9-a912-54a050572538', 2, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', '153c6fad-8b44-11e9-9420-54a050572538', 'sid-A4B5A05C-4D35-4767-A055-BA8BFC6946B7', 'ccd1fd1b-8b4c-11e9-a912-54a050572538', NULL, '提交申请', 'userTask', NULL, '2019-06-10 14:55:58.158', '2019-06-13 14:04:32.904', 256114746, NULL, '');

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('153c489c-8b44-11e9-9420-54a050572538', 1, '153c489c-8b44-11e9-9420-54a050572538', 'LeaveBill_14', NULL, 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, '153c489c-8b44-11e9-9420-54a050572538', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'sid-91D12417-0B86-40A9-A9D8-708F70609E47', '2019-06-10 13:53:34.182', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('153c6fad-8b44-11e9-9420-54a050572538', 4, '153c489c-8b44-11e9-9420-54a050572538', NULL, '153c489c-8b44-11e9-9420-54a050572538', 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, '153c489c-8b44-11e9-9420-54a050572538', 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2019-06-10 13:53:34.183', NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('15d6daf3-8b44-11e9-9420-54a050572538', 1, NULL, 'participant', 'admin', NULL, '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('1d157ff6-8da1-11e9-9f99-54a050572538', 1, NULL, 'participant', 'admin', NULL, '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('1dcbd7aa-8da1-11e9-9f99-54a050572538', 1, NULL, 'candidate', 'admin', '1d202e59-8da1-11e9-9f99-54a050572538', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('b0718bb8-8b4b-11e9-b6bb-54a050572538', 1, NULL, 'participant', 'admin', NULL, '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('ccc15b48-8b4c-11e9-a912-54a050572538', 1, NULL, 'participant', 'admin', NULL, '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
INSERT INTO `act_ru_task` VALUES ('1d202e59-8da1-11e9-9f99-54a050572538', 1, '153c6fad-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, NULL, '部门领导审批', NULL, NULL, 'sid-F2678DC7-0A16-4090-A7D2-3048D2AAF893', NULL, NULL, NULL, 50, '2019-06-13 14:04:32.919', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('b070ef76-8b4b-11e9-b6bb-54a050572538', 3, 'string', 'result', '153c489c-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL);
INSERT INTO `act_ru_variable` VALUES ('b07164a7-8b4b-11e9-b6bb-54a050572538', 1, 'integer', 'days', '153c489c-8b44-11e9-9420-54a050572538', '153c489c-8b44-11e9-9420-54a050572538', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2', NULL);

-- ----------------------------
-- Table structure for oa_leave_bill
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave_bill`;
CREATE TABLE `oa_leave_bill`  (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `days` int(4) NULL DEFAULT NULL COMMENT '请假天数',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态',
  `leave_start_time` datetime(0) NULL DEFAULT NULL COMMENT '请假时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标识',
  `leave_end_time` datetime(0) NULL DEFAULT NULL COMMENT '请假结束时间',
  `pro_instance_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程实例ID',
  `pro_definition_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程定义ID',
  PRIMARY KEY (`leave_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_leave_bill
-- ----------------------------
INSERT INTO `oa_leave_bill` VALUES (14, 'admin', 2, '3333333', '1', '2019-06-10 12:00:00', '2019-06-10 13:45:42', '2019-06-10 13:51:39', '0', '2019-06-12 12:00:00', '153c489c-8b44-11e9-9420-54a050572538', 'LeaveBill:1:0f1174eb-8b44-11e9-9420-54a050572538');

SET FOREIGN_KEY_CHECKS = 1;
