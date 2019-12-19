/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : select_course_system

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 19/12/2019 17:01:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (89);
INSERT INTO `hibernate_sequence` VALUES (89);
INSERT INTO `hibernate_sequence` VALUES (89);
INSERT INTO `hibernate_sequence` VALUES (89);
INSERT INTO `hibernate_sequence` VALUES (89);
INSERT INTO `hibernate_sequence` VALUES (89);

-- ----------------------------
-- Table structure for t_college
-- ----------------------------
DROP TABLE IF EXISTS `t_college`;
CREATE TABLE `t_college`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKigbg7m2cp2v85j7emocxr3utk`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_college
-- ----------------------------
INSERT INTO `t_college` VALUES (17, '2019-12-14 12:55:55', '文学与新闻传播学院');
INSERT INTO `t_college` VALUES (20, '2019-12-14 12:56:46', '政治与法律学院');
INSERT INTO `t_college` VALUES (21, '2019-12-14 12:56:52', '美术与设计学院');
INSERT INTO `t_college` VALUES (22, '2019-12-14 12:56:58', '物理与电子信息工程学院');
INSERT INTO `t_college` VALUES (23, '2019-12-14 12:57:04', '计算机与信息科学学院');
INSERT INTO `t_college` VALUES (24, '2019-12-14 12:57:11', '外国语学院');
INSERT INTO `t_college` VALUES (25, '2019-12-14 12:57:21', '数学与统计学院');
INSERT INTO `t_college` VALUES (26, '2019-12-14 12:57:28', '化学与材料科学学院');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `course_id` bigint(20) NOT NULL,
  `course_credit` double NOT NULL,
  `course_cycle` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `course_grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `course_teacher_id` bigint(20) NULL DEFAULT NULL,
  `courseType_id` bigint(20) NULL DEFAULT NULL,
  `courseTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `FKqkr3qyvkogjysbglmqf0yctr6`(`course_teacher_id`) USING BTREE,
  INDEX `FKlgugg02odmkveoqauo7dfbtup`(`courseType_id`) USING BTREE,
  CONSTRAINT `FKlgugg02odmkveoqauo7dfbtup` FOREIGN KEY (`courseType_id`) REFERENCES `t_course_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqkr3qyvkogjysbglmqf0yctr6` FOREIGN KEY (`course_teacher_id`) REFERENCES `t_student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES (64, 2, '30', '2016', 'JSP应用程序与设计', '2019-12-16 20:23:23', 'JSP应用程序与设计', 50, 56, 56);
INSERT INTO `t_course` VALUES (67, 2, '30', '2016', 'Java设计程序', '2019-12-18 11:09:25', '', 50, 56, 56);
INSERT INTO `t_course` VALUES (80, 4, '40', '2019', '计算机网络', '2019-12-18 16:19:37', '计算机网络', 50, 56, 56);
INSERT INTO `t_course` VALUES (85, 1, '20', '2019', '汉语言文学教育', '2019-12-19 10:44:28', '', 84, 55, 55);

-- ----------------------------
-- Table structure for t_course_type
-- ----------------------------
DROP TABLE IF EXISTS `t_course_type`;
CREATE TABLE `t_course_type`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_course_type
-- ----------------------------
INSERT INTO `t_course_type` VALUES (52, '2019-12-16 17:24:40', '哲学');
INSERT INTO `t_course_type` VALUES (53, '2019-12-16 20:15:43', '经济学');
INSERT INTO `t_course_type` VALUES (54, '2019-12-16 20:15:48', '法学');
INSERT INTO `t_course_type` VALUES (55, '2019-12-16 20:16:48', '教育学');
INSERT INTO `t_course_type` VALUES (56, '2019-12-16 20:16:59', '理学');
INSERT INTO `t_course_type` VALUES (57, '2019-12-16 20:17:04', '文学');
INSERT INTO `t_course_type` VALUES (58, '2019-12-16 20:17:09', '历史学');
INSERT INTO `t_course_type` VALUES (59, '2019-12-16 20:17:22', '工学');
INSERT INTO `t_course_type` VALUES (60, '2019-12-16 20:17:28', '艺术学');
INSERT INTO `t_course_type` VALUES (61, '2019-12-16 20:17:40', '管理学');
INSERT INTO `t_course_type` VALUES (62, '2019-12-16 20:17:44', '医学');
INSERT INTO `t_course_type` VALUES (63, '2019-12-16 20:17:48', '农学');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade`  (
  `id` bigint(20) NOT NULL,
  `class_grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `college_id` bigint(20) NULL DEFAULT NULL,
  `major_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKj5j3vx53hxvm0kvdq9c507eqw`(`name`) USING BTREE,
  INDEX `FK60y3e4grkh94rsp2twwwkmgg0`(`college_id`) USING BTREE,
  INDEX `FKf3mkidrhhrfoo4ie052ixt62v`(`major_id`) USING BTREE,
  CONSTRAINT `FK60y3e4grkh94rsp2twwwkmgg0` FOREIGN KEY (`college_id`) REFERENCES `t_college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKf3mkidrhhrfoo4ie052ixt62v` FOREIGN KEY (`major_id`) REFERENCES `t_major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES (45, '2019', '2019-12-14 16:10:21', '0193217522', 23, 27);
INSERT INTO `t_grade` VALUES (46, '2018', '2019-12-14 19:40:15', '0183217533', 23, 27);
INSERT INTO `t_grade` VALUES (47, '2016', '2019-12-14 17:11:15', '0162416233', 17, 37);

-- ----------------------------
-- Table structure for t_major
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `college_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKr8pbbe2s28eyhmkp24sbbykhg`(`name`) USING BTREE,
  INDEX `FKnmt4gmsmmd44r4sc62xuwqges`(`college_id`) USING BTREE,
  CONSTRAINT `FKnmt4gmsmmd44r4sc62xuwqges` FOREIGN KEY (`college_id`) REFERENCES `t_college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES (27, '2019-12-14 12:57:43', '软件工程', 23);
INSERT INTO `t_major` VALUES (28, '2019-12-14 12:58:16', '计算机科学与技术', 23);
INSERT INTO `t_major` VALUES (29, '2019-12-14 12:58:50', '物联网工程', 23);
INSERT INTO `t_major` VALUES (30, '2019-12-14 13:57:59', ' 数据科学与大数据技术', 25);
INSERT INTO `t_major` VALUES (31, '2019-12-14 14:18:41', ' 经济统计学', 25);
INSERT INTO `t_major` VALUES (32, '2019-12-14 14:19:15', ' 统计学', 25);
INSERT INTO `t_major` VALUES (33, '2019-12-14 14:19:27', '数学与应用数学', 25);
INSERT INTO `t_major` VALUES (34, '2019-12-14 14:19:39', ' 应用统计学', 25);
INSERT INTO `t_major` VALUES (35, '2019-12-14 14:20:13', '自动化', 23);
INSERT INTO `t_major` VALUES (36, '2019-12-14 14:20:26', '轨道交通信号与控制', 23);
INSERT INTO `t_major` VALUES (37, '2019-12-14 14:20:42', '汉语言文学', 17);
INSERT INTO `t_major` VALUES (38, '2019-12-14 14:20:54', '汉语国际教育', 17);
INSERT INTO `t_major` VALUES (39, '2019-12-14 14:21:05', '广告学', 17);
INSERT INTO `t_major` VALUES (40, '2019-12-14 14:21:11', '网络与新媒体', 17);
INSERT INTO `t_major` VALUES (41, '2019-12-14 14:21:17', '播音与主持艺术', 17);
INSERT INTO `t_major` VALUES (42, '2019-12-14 14:21:23', '数字媒体艺术', 17);
INSERT INTO `t_major` VALUES (43, '2019-12-14 14:21:57', '思想政治教育', 20);
INSERT INTO `t_major` VALUES (44, '2019-12-14 14:22:08', '法学', 20);

-- ----------------------------
-- Table structure for t_sc
-- ----------------------------
DROP TABLE IF EXISTS `t_sc`;
CREATE TABLE `t_sc`  (
  `sc_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `score` double NOT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sc
-- ----------------------------
INSERT INTO `t_sc` VALUES (81, 80, '2019-12-18 16:20:03', 80, 49);
INSERT INTO `t_sc` VALUES (86, 67, '2019-12-19 10:45:02', 0, 83);
INSERT INTO `t_sc` VALUES (87, 64, '2019-12-19 10:45:13', 0, 83);
INSERT INTO `t_sc` VALUES (88, 80, '2019-12-19 10:46:26', 0, 82);

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `stu_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `role` int(11) NOT NULL,
  `stu_birthday` datetime(0) NULL DEFAULT NULL,
  `stu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stu_sex` int(11) NOT NULL,
  `stu_type` int(11) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `college_id` bigint(20) NULL DEFAULT NULL,
  `grade_id` bigint(20) NULL DEFAULT NULL,
  `major_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE,
  UNIQUE INDEX `UK_lv9hl4j01dmpvl8j4qsyqo4gy`(`stu_code`) USING BTREE,
  INDEX `FKftyn3n4g81ijgj6pfbu4xlvgk`(`college_id`) USING BTREE,
  INDEX `FKkdu5ea5x79eggopv6jknfi8o4`(`grade_id`) USING BTREE,
  INDEX `FKmoa6ad1noaabptrr3ii8vrllb`(`major_id`) USING BTREE,
  CONSTRAINT `FKftyn3n4g81ijgj6pfbu4xlvgk` FOREIGN KEY (`college_id`) REFERENCES `t_college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkdu5ea5x79eggopv6jknfi8o4` FOREIGN KEY (`grade_id`) REFERENCES `t_grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmoa6ad1noaabptrr3ii8vrllb` FOREIGN KEY (`major_id`) REFERENCES `t_major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES (49, '2019-12-15 18:10:23', NULL, 1, '1997-11-12 00:00:00', '019321752223', '23445@qq.com', '/upload/images/8fccfeb846004521b256e7838ef95d62.jpg', '019321752223', 'e0deff7283720736a1ab8b04502d05c0', '18577772221', 0, 1, NULL, 23, 45, 27);
INSERT INTO `t_student` VALUES (50, '2019-12-15 18:13:03', NULL, 2, '2019-12-15 00:00:00', '019321752200', 'aaa@qq.com', '/static/images/user.jpg', '杨老师', '675692cefe8ab553fca178ecd4859bf2', '18511116666', 0, 2, NULL, 23, 45, 27);
INSERT INTO `t_student` VALUES (51, '2019-12-16 16:46:45', NULL, 0, '2019-12-16 16:46:50', '1001', 'admin@qq.com', '/static/images/user.jpg', '管理员', '21232f297a57a5a743894a0e4a801fc3', '1234567', 0, 0, NULL, 17, 45, 27);
INSERT INTO `t_student` VALUES (82, '2019-12-19 10:36:57', NULL, 1, '2019-12-19 00:00:00', '019321752224', '019321752224@qq.com', '/static/images/user.jpg', '019321752224', '10a666e0ca5fcc2188c7d0e653d79650', '18511112222', 0, 1, NULL, 23, 45, 27);
INSERT INTO `t_student` VALUES (83, '2019-12-19 10:37:36', NULL, 1, '2019-12-19 00:00:00', '016241623301', '016241623301@11.com', '/static/images/user.jpg', '016241623301', '365790b963c30e871eeb0726673fbecd', '15911112222', 0, 1, NULL, 17, 47, 37);
INSERT INTO `t_student` VALUES (84, '2019-12-19 10:38:09', NULL, 2, '2019-12-18 00:00:00', '016241623300', '016241623300@qq.com', '/static/images/user.jpg', '016241623300', 'a4f2893ebfae01d011aa8d2e54a8e628', '15822221111', 1, 2, NULL, 17, 47, 37);

SET FOREIGN_KEY_CHECKS = 1;
