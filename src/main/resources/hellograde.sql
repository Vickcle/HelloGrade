/*
Navicat MySQL Data Transfer

Source Server         : Vickcle
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : hellograde

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-04-23 15:02:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hg_academy
-- ----------------------------
DROP TABLE IF EXISTS `hg_academy`;
CREATE TABLE `hg_academy` (
  `academy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `academy_code` varchar(30) DEFAULT NULL,
  `academy_name` varchar(30) DEFAULT NULL,
  `academy_address` varchar(30) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`academy_id`),
  UNIQUE KEY `academy_code` (`academy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_academy
-- ----------------------------

-- ----------------------------
-- Table structure for hg_admin
-- ----------------------------
DROP TABLE IF EXISTS `hg_admin`;
CREATE TABLE `hg_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_code` varchar(30) DEFAULT NULL,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_pwd` varchar(30) DEFAULT NULL,
  `admin_tel` varchar(30) DEFAULT NULL,
  `admin_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_code` (`admin_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_admin
-- ----------------------------
INSERT INTO `hg_admin` VALUES ('1', '310245', 'admin', 'admin', '15055648008', '456254865@qq.com');

-- ----------------------------
-- Table structure for hg_answer
-- ----------------------------
DROP TABLE IF EXISTS `hg_answer`;
CREATE TABLE `hg_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer_code` varchar(30) DEFAULT NULL,
  `answer_derc` varchar(100) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_answer
-- ----------------------------

-- ----------------------------
-- Table structure for hg_class
-- ----------------------------
DROP TABLE IF EXISTS `hg_class`;
CREATE TABLE `hg_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_class
-- ----------------------------
INSERT INTO `hg_class` VALUES ('1', '162013', '11', '1', '2019-04-17', null, null);
INSERT INTO `hg_class` VALUES ('2', '162011', '11', '1', '2019-04-17', null, null);
INSERT INTO `hg_class` VALUES ('3', '162012', '11', '1', '2019-04-17', null, null);

-- ----------------------------
-- Table structure for hg_company
-- ----------------------------
DROP TABLE IF EXISTS `hg_company`;
CREATE TABLE `hg_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` varchar(30) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `company_type` varchar(30) DEFAULT NULL,
  `company_address` varchar(30) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_company
-- ----------------------------

-- ----------------------------
-- Table structure for hg_course
-- ----------------------------
DROP TABLE IF EXISTS `hg_course`;
CREATE TABLE `hg_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(30) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_type` varchar(30) DEFAULT NULL,
  `course_property` varchar(30) DEFAULT NULL,
  `course_degree` double(6,2) DEFAULT NULL,
  `course_time` int(11) DEFAULT NULL,
  `before_id` int(11) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_course
-- ----------------------------
INSERT INTO `hg_course` VALUES ('1', '512001', '大学英语读写译1', '必修', '通识教育平台课', '4.00', '64', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('2', '512002', '大学英语听说1', '必修', '通识教育平台课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('3', '711001', '高等数学A1', '必修', '学科基础平台课', '6.00', '96', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('4', '10034025', '体质健康标准1', '必修', '体测', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('5', '1011001', '体育1', '必修', '通识教育平台课', '1.00', '36', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('6', '1301003', '思想道德修养与法律基础', '必修', '通识教育平台课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('7', '1302001', '职业生涯规划', '必修', '通识教育平台课', '1.00', '22', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('8', '2001001', '计算机科学导论', '必修', '通识教育平台课', '1.50', '24', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('9', '2001002', '程序设计基础', '必修', '学科基础平台课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('10', '2001037', '程序设计基础实验', '必修', '学科基础平台课', '1.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('11', '2101002', '军训', '必修', '实践教学环节', '2.00', '3', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('12', '12011072', '大学生心理健康教育', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('13', '12011181', '大学语文', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('14', '512003', '大学英语读写译2', '必修', '通识教育平台课', '4.00', '64', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('15', '512004', '大学英语听说2', '必修', '通识教育平台课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('16', '711002', '高等数学A2', '必修', '学科基础平台课', '6.00', '96', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('17', '711008', '线性代数A', '必修', '学科基础平台课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('18', '1011002', '体育2', '必修', '通识教育平台课', '1.00', '36', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('19', '1301001', '形势与政策1', '必修', '通识教育平台课', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('20', '1301004', '马克思主义基本原理', '必修', '通识教育平台课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('21', '2001004', '数字逻辑B', '必修', '学科基础平台课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('22', '2001029', '程序设计基础课程设计', '必修', '实践教学环节', '2.00', '2', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('23', '2101001', '军事理论', '必修', '通识教育平台课', '2.00', '36', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('24', '12011049', '经典电影欣赏与评论', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('25', '5000039', '影视鉴赏', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('26', '711009', '概率论与数理统计', '必修', '学科基础平台课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('27', '811010', '大学物理D', '必修', '学科基础平台课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('28', '10034026', '体质健康标准2', '必修', '体测', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('29', '1011003', '体育3', '必修', '通识教育平台课', '1.00', '36', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('30', '1301005', '毛泽东思想和中国特色社会主义理论体系概论', '必修', '通识教育平台课', '6.00', '96', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('31', '2001003', '离散数学A', '必修', '学科基础平台课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('32', '2001005', '面向对象程序设计A', '必修', '学科基础平台课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('33', '2001007', '计算机组成与结构A', '必修', '专业核心课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('34', '2001038', '面向对象程序设计A实验', '必修', '学科基础平台课', '0.50', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('35', '12011136', '欧美经典史诗电影评鉴', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('36', '12011157', '日本文化赏析', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('37', '1011004', '体育4', '必修', '通识教育平台课', '1.00', '36', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('38', '1301006', '中国近现代史纲要', '必修', '通识教育平台课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('39', '2001006', '数据结构A', '必修', '学科基础平台课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('40', '2001008', '数据库概论', '必修', '专业核心课', '3.50', '56', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('41', '2001009', '操作系统A', '必修', '专业核心课', '4.00', '64', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('42', '2001010', '软件工程导论', '必修', '专业核心课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('43', '2001030', '面向对象课程设计', '必修', '实践教学环节', '2.00', '2', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('44', '2001039', '数据结构A实验', '必修', '学科基础平台课', '0.50', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('45', '12011194', '电影撞新闻——经典记者电影赏析', '选修', '通识教育选修课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('46', '10034027', '体质健康标准3', '必修', '体测', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('47', '1301002', '形势与政策2', '必修', '通识教育平台课', '1.00', '20', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('48', '2001011', '网络及其计算', '必修', '专业核心课', '4.00', '64', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('49', '2001012', '软件质量保证与测试', '必修', '专业核心课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('50', '2001014', 'WEB技术基础', '限选', '专业方向课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('51', '2001023', '移动终端编程技术', '选修', '专业任选课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('52', '2001024', '嵌入式系统', '选修', '专业任选课', '1.50', '24', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('53', '2001031', '专业综合课程设计', '必修', '实践教学环节', '3.00', '3', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('54', '2001040', '移动终端编程技术实验', '选修', '专业任选课', '0.50', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('55', '2001041', '嵌入式系统实验', '选修', '专业任选课', '0.50', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('56', '1302002', '就业指导', '必修', '通识教育平台课', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('57', '2001013', '软件建模技术', '必修', '专业核心课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('58', '2001015', 'WEB高级编程', '限选', '专业方向课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('59', '2001016', '大型数据库系统', '限选', '专业方向课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('60', '2001017', 'JAVA网络编程', '限选', '专业方向课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('61', '2001018', '软件项目管理', '限选', '专业方向课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('62', '2001025', '专业英语', '选修', '专业任选课', '2.00', '32', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('63', '2001026', '算法设计与分析A', '选修', '专业任选课', '2.50', '40', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('64', '2001028', '编译原理', '选修', '专业任选课', '3.00', '48', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('65', '10034028', '体质健康标准4', '必修', '体测', '1.00', '16', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('66', '2001032', '专业实训', '必修', '实践教学环节', '4.00', '6', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('67', '2001033', '专业实践', '必修', '实践教学环节', '4.00', '6', '0', '0', '0', '2019-04-17', null, null);
INSERT INTO `hg_course` VALUES ('68', '2001034', '毕业实习', '必修', '实践教学环节', '4.00', '6', '0', '0', '0', '2019-04-17', null, null);

-- ----------------------------
-- Table structure for hg_creer
-- ----------------------------
DROP TABLE IF EXISTS `hg_creer`;
CREATE TABLE `hg_creer` (
  `creer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creer_type` varchar(30) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`creer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_creer
-- ----------------------------

-- ----------------------------
-- Table structure for hg_grade
-- ----------------------------
DROP TABLE IF EXISTS `hg_grade`;
CREATE TABLE `hg_grade` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `grade_test` double(6,2) DEFAULT NULL,
  `grade_usual` double(6,2) DEFAULT NULL,
  `grade_interim` double(6,2) DEFAULT NULL,
  `grade_terminal` double(6,2) DEFAULT NULL,
  `grade_total` double(6,2) DEFAULT NULL,
  `grade_sign` varchar(30) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_grade
-- ----------------------------
INSERT INTO `hg_grade` VALUES ('1', '1', '1', '0.00', '75.00', '0.00', '68.00', '70.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('2', '1', '19', '0.00', '90.00', '0.00', '88.00', '89.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('3', '1', '2', '0.00', '85.00', '0.00', '87.00', '86.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('4', '1', '20', '0.00', '92.00', '0.00', '91.00', '91.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('5', '1', '3', '0.00', '84.00', '0.00', '81.00', '82.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('6', '1', '21', '0.00', '91.00', '0.00', '88.00', '89.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('7', '1', '4', '0.00', '93.00', '0.00', '95.00', '94.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('8', '1', '22', '0.00', '74.00', '0.00', '60.00', '64.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('9', '1', '5', '0.00', '78.00', '0.00', '73.00', '75.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('10', '1', '23', '0.00', '78.00', '0.00', '70.00', '72.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('11', '1', '6', '0.00', '70.00', '0.00', '63.00', '65.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('12', '1', '24', '0.00', '72.00', '0.00', '65.00', '67.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('13', '1', '7', '0.00', '87.00', '0.00', '84.00', '85.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('14', '1', '25', '0.00', '88.00', '0.00', '84.00', '85.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('15', '1', '8', '0.00', '96.00', '0.00', '96.00', '96.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('16', '1', '26', '0.00', '87.00', '0.00', '85.00', '86.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('17', '1', '9', '0.00', '94.00', '0.00', '92.00', '93.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('18', '1', '27', '0.00', '93.00', '0.00', '91.00', '92.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('19', '1', '10', '0.00', '95.00', '0.00', '94.00', '94.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('20', '1', '28', '0.00', '88.00', '0.00', '85.00', '86.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('21', '1', '11', '0.00', '81.00', '0.00', '64.00', '69.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('22', '1', '29', '0.00', '78.00', '0.00', '76.00', '77.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('23', '1', '12', '0.00', '87.00', '0.00', '84.00', '85.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('24', '1', '30', '0.00', '85.00', '0.00', '83.00', '84.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('25', '1', '13', '0.00', '78.00', '0.00', '75.00', '76.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('26', '1', '31', '0.00', '89.00', '0.00', '86.00', '87.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('27', '1', '14', '0.00', '72.00', '0.00', '63.00', '66.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('28', '1', '32', '0.00', '87.00', '0.00', '83.00', '84.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('29', '1', '15', '0.00', '89.00', '0.00', '88.00', '88.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('30', '1', '33', '0.00', '86.00', '0.00', '82.00', '83.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('31', '1', '16', '0.00', '87.00', '0.00', '85.00', '86.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('32', '1', '34', '0.00', '87.00', '0.00', '84.00', '85.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('33', '1', '17', '0.00', '82.00', '0.00', '80.00', '81.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('34', '1', '35', '0.00', '97.00', '0.00', '99.00', '98.00', null, '0', '2019-04-23', null, null);
INSERT INTO `hg_grade` VALUES ('35', '1', '18', '0.00', '75.00', '0.00', '56.00', '62.00', null, '0', '2019-04-23', null, null);

-- ----------------------------
-- Table structure for hg_lesson
-- ----------------------------
DROP TABLE IF EXISTS `hg_lesson`;
CREATE TABLE `hg_lesson` (
  `lesson_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `lesson_duration` varchar(30) DEFAULT NULL,
  `lesson_address` varchar(60) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_lesson
-- ----------------------------
INSERT INTO `hg_lesson` VALUES ('1', '32', '2', '2017-2018-1', 'D402', null, null, null, null);

-- ----------------------------
-- Table structure for hg_major
-- ----------------------------
DROP TABLE IF EXISTS `hg_major`;
CREATE TABLE `hg_major` (
  `major_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `major_code` varchar(30) DEFAULT NULL,
  `major_name` varchar(30) DEFAULT NULL,
  `major_type` varchar(30) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `major_code` (`major_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_major
-- ----------------------------

-- ----------------------------
-- Table structure for hg_question
-- ----------------------------
DROP TABLE IF EXISTS `hg_question`;
CREATE TABLE `hg_question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_code` varchar(30) DEFAULT NULL,
  `question_derc` varchar(100) DEFAULT NULL,
  `question_type` varchar(30) DEFAULT NULL,
  `naire_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_question
-- ----------------------------

-- ----------------------------
-- Table structure for hg_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `hg_questionnaire`;
CREATE TABLE `hg_questionnaire` (
  `naire_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naire_code` varchar(30) DEFAULT NULL,
  `naire_name` varchar(30) DEFAULT NULL,
  `naire_type` varchar(30) DEFAULT NULL,
  `naire_status` varchar(30) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`naire_id`),
  UNIQUE KEY `naire_code` (`naire_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_questionnaire
-- ----------------------------

-- ----------------------------
-- Table structure for hg_reply
-- ----------------------------
DROP TABLE IF EXISTS `hg_reply`;
CREATE TABLE `hg_reply` (
  `reply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naire_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_reply
-- ----------------------------

-- ----------------------------
-- Table structure for hg_school
-- ----------------------------
DROP TABLE IF EXISTS `hg_school`;
CREATE TABLE `hg_school` (
  `school_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_code` varchar(30) DEFAULT NULL,
  `school_name` varchar(30) DEFAULT NULL,
  `school_address` varchar(60) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `school_code` (`school_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_school
-- ----------------------------

-- ----------------------------
-- Table structure for hg_student
-- ----------------------------
DROP TABLE IF EXISTS `hg_student`;
CREATE TABLE `hg_student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_code` varchar(30) DEFAULT NULL,
  `student_name` varchar(30) DEFAULT NULL,
  `student_pwd` varchar(30) DEFAULT NULL,
  `student_tel` varchar(30) DEFAULT NULL,
  `student_email` varchar(30) DEFAULT NULL,
  `student_address` varchar(30) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_code` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_student
-- ----------------------------
INSERT INTO `hg_student` VALUES ('1', '16201201', '卓越', 'NCHU16201201', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('2', '16201202', '李嘉欣', 'NCHU16201202', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('3', '16201204', '朱福明', 'NCHU16201204', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('4', '16201205', '刘寒青', 'NCHU16201205', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('5', '16201206', '曹瞻远', 'NCHU16201206', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('6', '16201207', '邓家艺', 'NCHU16201207', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('7', '16201208', '樊少祥', 'NCHU16201208', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('8', '16201209', '付高辉', 'NCHU16201209', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('9', '16201210', '郭佛福', 'NCHU16201210', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('10', '16201211', '洪鹏生', 'NCHU16201211', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('11', '16201212', '胡海龙', 'NCHU16201212', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('12', '16201213', '黄文源', 'NCHU16201213', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('13', '16201214', '黄翔', 'NCHU16201214', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('14', '16201215', '李文', 'NCHU16201215', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('15', '16201216', '练良珏', 'NCHU16201216', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('16', '16201217', '刘斌', 'NCHU16201217', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('17', '16201218', '卢浩军', 'NCHU16201218', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('18', '16201219', '陆智伟', 'NCHU16201219', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('19', '16201220', '罗杰', 'NCHU16201220', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('20', '16201221', '陶丽卫', 'NCHU16201221', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('21', '16201222', '王成', 'NCHU16201222', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('22', '16201223', '王慧', 'NCHU16201223', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('23', '16201224', '王申', 'NCHU16201224', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('24', '16201225', '翁俊祥', 'NCHU16201225', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('25', '16201226', '吴超军', 'NCHU16201226', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('26', '16201227', '吴西平', 'NCHU16201227', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('27', '16201228', '杨松', 'NCHU16201228', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('28', '16201229', '余浩然', 'NCHU16201229', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('29', '16201230', '张闻翾', 'NCHU16201230', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('30', '16201231', '赵鸿剑', 'NCHU16201231', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('31', '16201232', '周旭文', 'NCHU16201232', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('32', '16201233', '朱泽洲', 'NCHU16201233', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('33', '16201234', '邹昆', 'NCHU16201234', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('34', '16201235', '陈宜铭', 'NCHU16201235', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('35', '16201236', '陈晋升', 'NCHU16201236', null, null, null, '3', '1', '2019-04-17', null, null);
INSERT INTO `hg_student` VALUES ('36', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hg_student` VALUES ('37', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hg_student` VALUES ('38', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hg_student` VALUES ('39', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hg_student` VALUES ('40', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hg_student` VALUES ('41', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hg_teacher
-- ----------------------------
DROP TABLE IF EXISTS `hg_teacher`;
CREATE TABLE `hg_teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_code` varchar(30) DEFAULT NULL,
  `teacher_name` varchar(30) DEFAULT NULL,
  `teacher_pwd` varchar(30) DEFAULT NULL,
  `teacher_tel` varchar(30) DEFAULT NULL,
  `teacher_email` varchar(30) DEFAULT NULL,
  `teacher_honor` varchar(30) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_code` (`teacher_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hg_teacher
-- ----------------------------
INSERT INTO `hg_teacher` VALUES ('2', '246320', '李白', null, '15265948895', '455611212@qq.com', '副教授', '0', '1', '2019-04-17', null, null);
INSERT INTO `hg_teacher` VALUES ('3', '126393', '李思', null, '15689898989', '4852698756@qq.com', '讲师', '0', '1', '2019-04-17', null, null);
INSERT INTO `hg_teacher` VALUES ('4', '266013', '杜甫', null, '15222365654', '48952648@qq.com', '副教授', '0', '1', '2019-04-17', null, null);

-- ----------------------------
-- View structure for grade_info
-- ----------------------------
DROP VIEW IF EXISTS `grade_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grade_info` AS (select `g`.`grade_id` AS `grade_id`,`s`.`student_code` AS `student_code`,`s`.`student_name` AS `student_name`,`t`.`teacher_code` AS `teacher_code`,`hc`.`class_name` AS `class_name`,`t`.`teacher_name` AS `teacher_name`,`c`.`course_code` AS `course_code`,`c`.`course_name` AS `course_name`,`c`.`course_degree` AS `course_degree`,`c`.`course_type` AS `course_type`,`c`.`course_property` AS `course_property`,`c`.`course_time` AS `course_time`,`l`.`lesson_duration` AS `lesson_duration`,`g`.`grade_test` AS `grade_test`,`g`.`grade_usual` AS `grade_usual`,`g`.`grade_interim` AS `grade_interim`,`g`.`grade_terminal` AS `grade_terminal`,`g`.`grade_total` AS `grade_total`,`g`.`grade_sign` AS `grade_sign` from (((((`hg_grade` `g` join `hg_student` `s`) join `hg_class` `hc`) join `hg_course` `c`) join `hg_teacher` `t`) join `hg_lesson` `l`) where ((`g`.`student_id` = `s`.`student_id`) and (`l`.`teacher_id` = `t`.`teacher_id`) and (`g`.`lesson_id` = `l`.`lesson_id`) and (`l`.`course_id` = `c`.`course_id`) and (`s`.`class_id` = `hc`.`class_id`))) ;
