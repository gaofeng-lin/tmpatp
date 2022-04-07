/*
Navicat MySQL Data Transfer

Source Server         : phenglei-cloud
Source Server Version : 50734
Source Host           : 116.63.141.248:3306
Source Database       : case_test

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2022-04-07 15:34:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for case_tests
-- ----------------------------
DROP TABLE IF EXISTS `case_tests`;
CREATE TABLE `case_tests` (
  `test_id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `solver_name` varchar(20) DEFAULT NULL,
  `solver_version` int(5) DEFAULT NULL,
  `result_over` int(3) DEFAULT '0',
  `test_result` varchar(2000) DEFAULT '0',
  `test_result2` varchar(2000) DEFAULT '0',
  `updatemessage` text,
  `dealresult` varchar(1000) DEFAULT '',
  `unit_case_num` int(3) DEFAULT '0',
  `unit_case_over` int(3) NOT NULL DEFAULT '0',
  `integration_case_num` int(3) DEFAULT '0',
  `integration_case_over` int(3) DEFAULT NULL,
  `integration_case_errornum` int(3) DEFAULT '0',
  `system_case_num` int(3) DEFAULT '0',
  `system_case_over` int(3) DEFAULT '0',
  `system_case_errornum` int(3) DEFAULT NULL,
  `warnningMessage` int(3) NOT NULL DEFAULT '0',
  `taskSort` int(1) DEFAULT '1',
  PRIMARY KEY (`test_id`),
  KEY `solver_version_index` (`solver_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case_tests
-- ----------------------------
INSERT INTO `case_tests` VALUES ('1', 'hexianyao', '2021-07-03 14:51:25', 'PHengLEIv3d0_Active', '19', '32', '03--Error__Nobegin,2--Error__Nobegin,5--Error__Nobegin,6--Error__Nobegin,4--Error__Nobegin,10--Error__Nobegin,15--Error__Nobegin,7--Error__Nobegin,16--Error__Nobegin,22--Error__Nobegin,14--Error__Nobegin,26--Error__Nobegin,25--Error__Nobegin,7--Error__Nobegin,27--Error__Nobegin,29--Error__Nobegin,28--Error__Nobegin,19--Error__Nobegin,3--Error__Nobegin,1--Error__Nobegin,11--Error__Nobegin,23--Error__Nobegin,30--Error__Nobegin,12--Error__Nobegin,8--Error__Nobegin,9--Error__Nobegin,2--Error__Failed,4--Error__Nobegin,10--Error__Nobegin,11--Error__Failed,15--Error__Nobegin,27--Error__Nobegin,29--Error__Nobegin,21--Error__Failed,32--Error__Nobegin,5--Error__Failed,6--Error__Failed,24--Error__Nobegin,24--Error__Failed,11--Error__Failed,21--Error__Failed,29--Error__Nobegin,27--Error__Nobegin,24--Error__Failed,15--Error__Nobegin,10--Error__Nobegin,4--Error__Nobegin,2--Error__Failed,1--Error__NoOri,1--res.dat:aircoef.dat:,1--res.dat:aircoef.dat:,', '03--Error__Nobegin,2--Error__Nobegin,5--Error__Nobegin,6--Error__Nobegin,4--Error__Nobegin,10--Error__Nobegin,15--Error__Nobegin,7--Error__Nobegin,16--Error__Nobegin,22--Error__Nobegin,14--Error__Nobegin,26--Error__Nobegin,25--Error__Nobegin,7--Error__Nobegin,27--Error__Nobegin,29--Error__Nobegin,28--Error__Nobegin,19--Error__Nobegin,3--Error__Nobegin,1--Error__Nobegin,11--Error__Nobegin,23--Error__Nobegin,30--Error__Nobegin,12--Error__Nobegin,8--Error__Nobegin,9--Error__Nobegin,2--Error__Failed,4--Error__Nobegin,10--Error__Nobegin,11--Error__Failed,15--Error__Nobegin,27--Error__Nobegin,29--Error__Nobegin,21--Error__Failed,32--Error__Nobegin,5--Error__Failed,6--Error__Failed,24--Error__Nobegin,24--Error__Failed,11--Error__Failed,21--Error__Failed,29--Error__Nobegin,27--Error__Nobegin,24--Error__Failed,15--Error__Nobegin,10--Error__Nobegin,4--Error__Nobegin,2--Error__Failed,1--Error__NoOri,1--res.dat:aircoef.dat:,1--res.dat:aircoef.dat:,', '', '', '0', '0', '0', null, '0', '32', '32', null, '0', '1');
INSERT INTO `case_tests` VALUES ('2', 'zhangyong', '2021-07-16 14:28:26', 'PHengLEIv3d0_Active', '20', '40', '02--Error__Failed,3--Error__Failed,1--Error__Failed,5--Error__Failed,6--Error__Failed,7--Error__Failed,11--Error__Failed,4--Error__Nobegin,10--Error__Nobegin,15--Error__Nobegin,30--Error__Failed,8--Error__Failed,17--Error__Failed,18--Error__Failed,20--Error__Failed,23--Error__Failed,27--Error__Nobegin,29--Error__Nobegin,32--Error__Nobegin,21--Error__Failed,31--Error__Failed,31--Error__Nobegin,31--Error__Nobegin,35--Error__Failed,40--Error__Failed,41--Error__Failed,34--Error__Failed,34--Error__Failed,36--Error__Failed,24--Error__Nobegin,13--Error__Failed,36--Error__Failed,38--Error__Failed,39--Error__Failed,38--Error__Failed,38--Error__Failed,5--Error__Nobegin,24--Error__Nobegin,2--Error__Failed,5--Error__Failed,6--Error__Failed,31--Error__Failed,5--Error__Nobegin,5--Error__Nobegin,6--Error__Nobegin,18--Error__Failed,5--Error__Failed,6--Error__Failed,', '02--Error__Failed,3--Error__Failed,1--Error__Failed,5--Error__Failed,6--Error__Failed,7--Error__Failed,11--Error__Failed,4--Error__Nobegin,10--Error__Nobegin,15--Error__Nobegin,30--Error__Failed,8--Error__Failed,17--Error__Failed,18--Error__Failed,20--Error__Failed,23--Error__Failed,27--Error__Nobegin,29--Error__Nobegin,32--Error__Nobegin,21--Error__Failed,31--Error__Failed,31--Error__Nobegin,31--Error__Nobegin,35--Error__Failed,40--Error__Failed,41--Error__Failed,34--Error__Failed,34--Error__Failed,36--Error__Failed,24--Error__Nobegin,13--Error__Failed,36--Error__Failed,38--Error__Failed,39--Error__Failed,38--Error__Failed,38--Error__Failed,5--Error__Nobegin,24--Error__Nobegin,2--Error__Failed,5--Error__Failed,6--Error__Failed,31--Error__Failed,5--Error__Nobegin,5--Error__Nobegin,6--Error__Nobegin,18--Error__Failed,5--Error__Failed,6--Error__Failed,', '', '', '0', '0', '0', null, '1', '41', '41', null, '0', '1');
INSERT INTO `case_tests` VALUES ('3', 'hexianyao', '2021-07-18 17:08:40', 'PHengLEIv3d0_Active', '23', '41', '012--Error__Failed,14--Error__Failed,16--Error__Failed,19--Error__Failed,22--Error__Failed,25--Error__Failed,26--Error__Failed,28--Error__Failed,23--Error__Failed,31--Error__Nobegin,30--Error__Failed,24--Error__Nobegin,2--Error__Failed,21--Error__Nobegin,20--Error__Nobegin,18--Error__Nobegin,17--Error__Nobegin,13--Error__Nobegin,11--Error__Nobegin,9--Error__Nobegin,8--Error__Nobegin,7--Error__Nobegin,5--Error__Nobegin,3--Error__Failed,38--Error__Failed,39--Error__Failed,2--Error__Failed,45--Error__Nobegin,46--Error__Failed,5--Error__Failed,23--Error__Nan,34--Error__Failed,36--Error__Failed,6--Error__Nobegin,5--Error__Nobegin,36--Error__Failed,41--Error__Failed,11--Error__Failed,5--Error__Failed,6--Error__Failed,13--Error__Failed,17--Error__Failed,18--Error__Failed,20--Error__Failed,21--Error__Nobegin,24--Error__Nobegin,31--Error__Nobegin,33--Error__Failed,35--Error__Failed,37--Error__Failed,40--Error__Failed,13--Error__Nobegin,18--Error__Nobegin,34--Error__Failed,1--Error__NoOri,1--res.dat:aircoef.dat:,1--res.dat:aircoef.dat:,8--Error__NoOri,', '012--Error__Failed,14--Error__Failed,16--Error__Failed,19--Error__Failed,22--Error__Failed,25--Error__Failed,26--Error__Failed,28--Error__Failed,23--Error__Failed,31--Error__Nobegin,30--Error__Failed,24--Error__Nobegin,2--Error__Failed,21--Error__Nobegin,20--Error__Nobegin,18--Error__Nobegin,17--Error__Nobegin,13--Error__Nobegin,11--Error__Nobegin,9--Error__Nobegin,8--Error__Nobegin,7--Error__Nobegin,5--Error__Nobegin,3--Error__Failed,38--Error__Failed,39--Error__Failed,2--Error__Failed,45--Error__Nobegin,46--Error__Failed,5--Error__Failed,23--Error__Nan,34--Error__Failed,36--Error__Failed,6--Error__Nobegin,5--Error__Nobegin,36--Error__Failed,41--Error__Failed,11--Error__Failed,5--Error__Failed,6--Error__Failed,13--Error__Failed,17--Error__Failed,18--Error__Failed,20--Error__Failed,21--Error__Nobegin,24--Error__Nobegin,31--Error__Nobegin,33--Error__Failed,35--Error__Failed,37--Error__Failed,40--Error__Failed,13--Error__Nobegin,18--Error__Nobegin,34--Error__Failed,1--Error__NoOri,1--res.dat:aircoef.dat:,1--res.dat:aircoef.dat:,8--Error__NoOri,', '', '', '0', '0', '0', null, '3', '41', '41', null, '0', '1');
INSERT INTO `case_tests` VALUES ('4', 'zhangyong', '2022-03-29 18:57:40', 'PHengLEIv3d0_Active', '28', '0', '0', '0', null, 'Error_cmake-o-zhangyong-o-Error_cmake', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('5', 'zhangyong', '2022-03-29 20:30:00', 'PHengLEIv3d0_Active', '31', '0', '0', '0', null, 'Error_make-o-zhangyong-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('6', 'zhangyong', '2022-03-29 20:31:33', 'PHengLEIv3d0_Active', '32', '2', '0', '0', '', 'Error_make-o-zhangyong-o-Error_make', '0', '0', '28', null, '102', '0', '37', null, '0', '1');
INSERT INTO `case_tests` VALUES ('7', 'zhangyong', '2022-04-07 09:21:08', 'PHengLEIv3d0_Active', '34', '0', '0', '0', null, 'Error_cmake-o-zhangyong-o-Error_cmake', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('8', 'zhangyong', '2022-04-07 09:21:44', 'PHengLEIv3d0_Active', '35', '0', '0', '0', null, 'Error_cmake-o-zhangyong-o-Error_cmake', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('9', 'zhangyong', '2022-04-07 09:22:21', 'PHengLEIv3d0_Active', '36', '0', '0', '0', null, 'Error_make-o-zhangyong-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('10', 'zhangyong', '2022-04-07 09:22:52', 'PHengLEIv3d0_Active', '37', '0', '0', '0', null, 'Error_make-o-zhangyong-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('11', 'hechao', '2022-04-07 09:25:53', 'PHengLEIv3d0_Active', '38', '0', '0', '0', null, 'Error_make-o-hechao-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('12', 'hechao', '2022-04-07 10:10:51', 'PHengLEIv3d0_Active', '41', '0', '0', '0', null, 'Error_make-o-hechao-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('13', 'hexianyao', '2022-04-07 10:18:28', 'PHengLEIv3d0_Active', '39', '0', '0', '0', '', '', '0', '0', '15', null, '7', '69', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('14', 'hexianyao', '2022-04-07 10:19:26', 'PHengLEIv3d0_Active', '43', '0', '0', '0', '', '', '0', '0', '15', null, '0', '69', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('15', 'zhangyong', '2022-04-07 10:19:57', 'PHengLEIv3d0_Active', '44', '0', '0', '0', null, 'Error_make-o-zhangyong-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('16', 'p95216308', '2022-04-07 10:20:28', 'PHengLEIv3d0_Active', '45', '0', '0', '0', null, 'Error_make-o-p95216308-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('17', 'hechao', '2022-04-07 10:20:59', 'PHengLEIv3d0_Active', '46', '0', '0', '0', null, 'Error_make-o-hechao-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');
INSERT INTO `case_tests` VALUES ('18', 'hexianyao', '2022-04-07 10:21:51', 'PHengLEIv3d0_Active', '47', '0', '0', '0', null, 'Error_make-o-hexianyao-o-Error_make', '0', '0', '0', null, '0', '0', '0', null, '0', '1');

-- ----------------------------
-- Table structure for cases
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `case_name` varchar(85) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `parameter` varchar(20) DEFAULT NULL,
  `configfile` varchar(50) DEFAULT NULL,
  `reference_mach_number` varchar(20) DEFAULT NULL,
  `attackd` varchar(45) DEFAULT NULL,
  `gridfile` varchar(130) DEFAULT NULL,
  `iviscous` varchar(15) DEFAULT NULL,
  `maxsimustep` int(11) DEFAULT NULL,
  `solver_name` varchar(20) DEFAULT NULL,
  `parameterFile` varchar(150) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  `caption` text,
  `evaluation` varchar(45) DEFAULT NULL,
  `priority` int(1) DEFAULT '2',
  `sort` int(1) DEFAULT '0',
  `tags` varchar(300) DEFAULT '',
  `process_num` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('1', 'PHengLEI', 'IT_BLUSGS_TwoD_30p30n__Unstruct_1CPU', '2022-04-01 23:18:53', null, null, '0.2', '19.0', './grid/30p30n_3part.fts', '3', '100', 'PHengLEIv3d0_Active', 'case_files/1', '2', '', null, '2', '0', ',unstr,2d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '1');
INSERT INTO `cases` VALUES ('2', 'PHengLEI', 'IT_BLUSGS_TwoD_Rae2822_Unstruct_4CPU', '2022-04-01 23:18:53', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '50', 'PHengLEIv3d0_Active', 'case_files/2', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '4');
INSERT INTO `cases` VALUES ('3', 'PHengLEI', 'IT_BLUSGS_TwoD_Supersonic_Circle_R0d1m__Struct_1CPU', '2022-04-01 23:18:54', null, null, '2.00', '0.00', './grid/circle-coarse.fts', '1', '20', 'PHengLEIv3d0_Active', 'case_files/3', '2', '', null, '2', '0', ',str,2d,1mgrid,minmod,super,steger-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases` VALUES ('4', 'PHengLEI', 'IT_FirstOrder_TwoD_Rae2822_Unstruct_4CPU', '2022-04-01 23:18:54', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '100', 'PHengLEIv3d0_Active', 'case_files/4', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,1st,sub,zeroB,roe-scheme,SA,+A,largeA,', '4');
INSERT INTO `cases` VALUES ('5', 'PHengLEI', 'IT_LBM_ThreeD_LidDriven_CavityFlow_4CPU', '2022-04-01 23:18:54', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_files/5', '2', '', null, '2', '0', ',str,2d,1mgrid,vanalbada,sub,roe-scheme,+A,largeA,zeroB,SA,bing,', '4');
INSERT INTO `cases` VALUES ('6', 'PHengLEI', 'IT_LineLUSGS_ThreeD_M6_Unstruct_1CPU', '2022-04-01 23:18:54', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_files/6', '2', '', null, '2', '0', ',unstr,3d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '1');
INSERT INTO `cases` VALUES ('7', 'PHengLEI', 'IT_LineLUSGS_ThreeD_Rae2822_Unstruct_1CPU', '2022-04-01 23:18:54', null, null, '0.73', '2.79', './grid/rae2822_medium_3D.fts', '3', '20', 'PHengLEIv3d0_Active', 'case_files/7', '2', '', null, '2', '0', ',unstr,3d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '1');
INSERT INTO `cases` VALUES ('8', 'PHengLEI', 'IT_LineLUSGS_TwoD_Rae2822_Unstruct_4CPU', '2022-04-01 23:18:54', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20', 'PHengLEIv3d0_Active', 'case_files/8', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '4');
INSERT INTO `cases` VALUES ('9', 'PHengLEI', 'IT_LowSpeedPreconTest_TwoD_30p30n_Unstruct_4CPU', '2022-04-01 23:18:54', null, null, '0.2', '19', './grid/30p30n_hygrid_2d__4.fts', '3', '500', 'PHengLEIv3d0_Active', 'case_files/9', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '4');
INSERT INTO `cases` VALUES ('10', 'PHengLEI', 'IT_LowSpeedPreconTest_TwoD_NACA0012_Struct_1CPU', '2022-04-01 23:18:54', null, null, '0.2', '2', './grid/naca.fts', '0', '500', 'PHengLEIv3d0_Active', 'case_files/10', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,smallA,zeroB,Euler,cuan,', '1');
INSERT INTO `cases` VALUES ('11', 'PHengLEI', 'IT_Multigrid_TwoD_Rae2822_Unstruct_4CPU', '2022-04-01 23:18:55', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '150', 'PHengLEIv3d0_Active', 'case_files/11', '2', '', null, '2', '0', ',unstr,2d,2mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '4');
INSERT INTO `cases` VALUES ('12', 'PHengLEI', 'IT_TotalPressTempBC_TwoD_Plate_Subsonic_Struct_1CPU', '2022-04-01 23:18:55', null, null, '0.2', '0.00', './grid/mesh_flatplate_turb_137x97_str.fts', '3', '500', 'PHengLEIv3d0_Active', 'case_files/12', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,zeroA,zeroB,SA,cuan,', '1');
INSERT INTO `cases` VALUES ('13', 'PHengLEI', 'IT_TotalPressTempBC_TwoD_Plate_Subsonic_Unstruct_1CPU', '2022-04-01 23:18:55', null, null, '0.2', '0.00', './grid/mesh_flatplate_turb_137x97_unstr.fts', '3', '500', 'PHengLEIv3d0_Active', 'case_files/13', '2', '', null, '2', '0', ',unstr,2d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,zeroA,', '1');
INSERT INTO `cases` VALUES ('14', 'PHengLEI', 'IT_UGKS_ThreeD_Cavity_Struct_8CPU', '2022-04-01 23:18:55', null, null, '-0.3', '0.0', './grid/cavity1_60__8.fts', '3', '4', 'PHengLEIv3d0_Active', 'case_files/14', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,sub,roe-scheme,zeroA,zeroB,SA,bing,', '8');

-- ----------------------------
-- Table structure for cases_system
-- ----------------------------
DROP TABLE IF EXISTS `cases_system`;
CREATE TABLE `cases_system` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `case_name` varchar(85) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `parameter` varchar(20) DEFAULT NULL,
  `configfile` varchar(50) DEFAULT NULL,
  `reference_mach_number` varchar(20) DEFAULT NULL,
  `attackd` varchar(45) DEFAULT NULL,
  `gridfile` varchar(130) DEFAULT NULL,
  `iviscous` varchar(15) DEFAULT NULL,
  `maxsimustep` int(11) DEFAULT NULL,
  `solver_name` varchar(20) DEFAULT NULL,
  `parameterFile` varchar(150) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  `caption` text,
  `evaluation` varchar(45) DEFAULT NULL,
  `priority` int(1) DEFAULT '2',
  `sort` int(1) DEFAULT '0',
  `tags` varchar(300) DEFAULT '',
  `process_num` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases_system
-- ----------------------------
INSERT INTO `cases_system` VALUES ('1', 'PHengLEI', 'A08_TwoD_30p30n_SST_Struct_4CPU', '2021-07-03 13:24:36', null, null, '0.2', '19.0', './grid/30p30n_str__4.fts', '4', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/1', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,hugeA,zeroB,SST,bing,', '4');
INSERT INTO `cases_system` VALUES ('2', 'PHengLEI', 'E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU', '2021-07-03 13:24:36', null, null, '0.2', '0.00', './grid/cylinder_270w_split120.fts', '1', '3000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/2', '2', '', null, '2', '0', ',str,3d,1mgrid,vanalbada,sub,roe-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('3', 'PHengLEI', 'B03_TwoD_Rae2822_SA_Unstruct_1CPU', '2021-07-03 13:24:36', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d_fine.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/3', '2', '', null, '2', '0', ',unstr,2d,1mgrid,cuan,nolim,sub,zeroB,roe-scheme,SA,+A,largeA,', '1');
INSERT INTO `cases_system` VALUES ('4', 'PHengLEI', 'B05_ThreeD_x38_Laminar_Unstruct_128CPU', '2021-07-03 13:24:37', null, null, '6.00', '25.00', './grid/X-38_unstr__128.fts', '1', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/4', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,hyper,zeroB,vanleer-scheme,Lamilar,+A,hugeA,', '128');
INSERT INTO `cases_system` VALUES ('5', 'PHengLEI', 'C01_TwoD_Cylinder_Laminar_Mix_4CPU', '2021-07-03 13:24:37', null, null, '8.03', '0.0', './grid/cylinder_mix__4.fts', '1', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/5', '2', '', null, '2', '0', ',str,2d,1mgrid,3rdsmooth,hyper,roe-scheme,zeroA,zeroB,Lamilar,bing,', '4');
INSERT INTO `cases_system` VALUES ('6', 'PHengLEI', 'C02_TwoD_Rae2822_SST_Mix_4CPU', '2021-07-03 13:24:37', null, null, '0.73', '2.79', './grid/rae2822_mix__4.fts', '4', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/6', '2', '', null, '2', '0', ',str,2d,1mgrid,3rdsmooth,sub,roe-scheme,+A,largeA,zeroB,SST,bing,', '4');
INSERT INTO `cases_system` VALUES ('7', 'PHengLEI', 'A07_TwoD_Rae2822_SST_Struct_4CPU', '2021-07-03 13:24:37', null, null, '0.73', '2.79', './grid/rae2822_vis2d__4.fts', '4', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/7', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,largeA,zeroB,SST,bing,', '4');
INSERT INTO `cases_system` VALUES ('8', 'PHengLEI', 'A06_ThreeD_NACA0012_SA_Struct_4CPU', '2021-07-03 13:24:37', null, null, '0.799', '2.26', './grid/NACA0012__4.fts', '3', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/8', '2', '', null, '2', '0', ',str,3d,1mgrid,smooth,sub,roe-scheme,+A,largeA,zeroB,SA,bing,', '4');
INSERT INTO `cases_system` VALUES ('9', 'PHengLEI', 'A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU', '2021-07-03 13:24:37', null, null, '8.15', '0.00', './grid/DoubleEllipse__4.fts', '1', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/9', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,steger-scheme,zeroA,zeroB,Lamilar,bing,', '4');
INSERT INTO `cases_system` VALUES ('10', 'PHengLEI', 'C04_ThreeD_F6-WB_SST_Mix_256CPU', '2021-07-03 13:24:37', null, null, '0.750', '-0.304', './grid/F6_mix__256.fts', '4', '70000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/10', '2', '', null, '2', '0', ',str,3d,1mgrid,3rdsmooth,sub,roe-scheme,-A,smallA,zeroB,SST,bing,', '256');
INSERT INTO `cases_system` VALUES ('11', 'PHengLEI', 'TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct', '2021-07-03 13:24:37', null, null, '8.7569', '0.00', './grid/2D_HEG_CYLINDER_65X88_DY2D-7__4.fts', '1', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/11', '2', '', null, '2', '0', ',str,2d,1mgrid,minmod,hyper,ausmdv-scheme,zeroA,zeroB,Lamilar,bing,', '1');
INSERT INTO `cases_system` VALUES ('12', 'PHengLEI', 'A11_ThreeD_Sphere_Laminar_Ma10_Struct', '2021-07-03 13:24:37', null, null, '10.00', '0.00', './grid/3dball.fts', '1', '25000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/12', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,steger-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('13', 'PHengLEI', 'A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU', '2021-07-03 13:24:37', null, null, '0.128', '0', './grid/2D_BackwardStep__4.fts', '3', '200000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/13', '2', '', null, '2', '0', ',str,2d,1mgrid,nolim,sub,roe-scheme,zeroA,zeroB,SA,bing,', '4');
INSERT INTO `cases_system` VALUES ('14', 'PHengLEI', 'A01_TwoD_Plate_Laminar_Struct_1CPU', '2021-07-03 13:24:37', null, null, '0.1', '0.00', './grid/flat_laminar_73_81.fts', '1', '150000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/14', '2', '', null, '2', '0', ',str,2d,1mgrid,nolim,sub,roe-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('15', 'PHengLEI', 'D02_ThreeD_DoubleEllipse_Laminar_HighOrder_Struct_48CPU', '2021-07-03 13:24:37', null, null, '8.15', '0.00', './grid/dbl_yzg__48.fts', '1', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/15', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,steger-scheme,zeroA,zeroB,Lamilar,bing,', '48');
INSERT INTO `cases_system` VALUES ('16', 'PHengLEI', 'A04_TwoD_Plate_SST_Ma5_Struct_1CPU', '2021-07-03 13:24:37', null, null, '5.00', '0.00', './grid/Mesh4_137_97.fts', '4', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/16', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,hyper,roe-scheme,zeroA,zeroB,SST,cuan,', '1');
INSERT INTO `cases_system` VALUES ('17', 'PHengLEI', 'A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU', '2021-07-03 13:24:37', null, null, '7.11', '0.00', './grid/3D_shock_wave__4.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/17', '2', '', null, '2', '0', ',str,3d,1mgrid,minvan,hyper,roe-scheme,zeroA,zeroB,SA,bing,', '4');
INSERT INTO `cases_system` VALUES ('18', 'PHengLEI', 'A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU', '2021-07-03 13:24:37', null, null, '0.2', '0.00', './grid/mesh0_545x385_plate__4.fts', '3', '100000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/18', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,zeroA,zeroB,SA,bing,', '4');
INSERT INTO `cases_system` VALUES ('19', 'PHengLEI', 'A03_TwoD_plate_SST_LowMach_Struct', '2021-07-03 13:24:37', null, null, '0.2', '0.00', './grid/Mesh4_137_97.fts', '4', '100000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/19', '2', '', null, '2', '0', ',str,2d,1mgrid,nolim,sub,roe-scheme,zeroA,zeroB,SST,cuan,', '1');
INSERT INTO `cases_system` VALUES ('20', 'PHengLEI', 'A09_ThreeD_M6_SST_Struct_MG2_4CPU', '2021-07-03 13:24:37', null, null, '0.8395', '3.06', './grid/m6_str__4.fts', '4', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/20', '2', '', null, '2', '0', ',str,3d,2mgrid,smooth,tran,roe-scheme,+A,largeA,zeroB,SST,bing,', '4');
INSERT INTO `cases_system` VALUES ('21', 'PHengLEI', 'ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct', '2021-07-03 13:24:37', null, null, '12.935', '0.00', './grid/3D_Electre_Half_Model_dy1D-5__6.fts', '1', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/21', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,ausmdv-scheme,zeroA,zeroB,Lamilar,bing,', '1');
INSERT INTO `cases_system` VALUES ('22', 'PHengLEI', 'Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU', '2021-07-03 13:24:37', null, null, '0.2', '0.0', './grid/cylinder_unstr.fts', '1', '4000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/22', '2', '', null, '2', '0', ',unstr,3d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,Lamilar,zeroA,', '1');
INSERT INTO `cases_system` VALUES ('23', 'PHengLEI', 'B02_TwoD_NACA4412_SA_Unstruct_2CPU', '2021-07-03 13:24:37', null, null, '0.09', '13.87', './grid/NACA4412_unstr__2.fts', '3', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/23', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '2');
INSERT INTO `cases_system` VALUES ('24', 'PHengLEI', 'A10_ThreeD_CHNT_SST_Struct_16CPU', '2021-07-03 13:24:37', null, null, '0.785', '2.61', './grid/stm-dkbm-c-all__16.fts', '4', '15000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/24', '2', '', null, '2', '0', ',str,3d,1mgrid,smooth,sub,roe-scheme,+A,largeA,zeroB,SST,bing,', '16');
INSERT INTO `cases_system` VALUES ('25', 'PHengLEI', 'A05_TwoD_Cylinder_Laminar_Ma8d03_Struct', '2021-07-03 13:24:37', null, null, '8.03', '0.00', './grid/input.fts', '1', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/25', '2', '', null, '2', '0', ',str,2d,1mgrid,vanleer,hyper,roe-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('26', 'PHengLEI', 'D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU', '2021-07-03 13:24:37', null, null, '8.03', '0.00', './grid/cylinder_str.fts', '1', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/26', '2', '', null, '2', '0', ',str,2d,1mgrid,minmod,hyper,steger-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('27', 'PHengLEI', 'E02_ThreeD_Cylinder_LES_Re3900_Unstruct_120CPU', '2021-07-03 13:24:38', null, null, '0.2', '0.00', './grid/cylinder_les_unstr__120.fts', '1', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/27', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,nolim,sub,zeroB,roe-scheme,Lamilar,zeroA,', '120');
INSERT INTO `cases_system` VALUES ('28', 'PHengLEI', 'A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU', '2021-07-03 13:24:38', null, null, '5.00', '0.00', './grid/plate_137_97.fts', '1', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/28', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,hyper,roe-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('29', 'PHengLEI', 'C03_ThreeD_M6_SST_Mix_64CPU', '2021-07-03 13:24:38', null, null, '0.8395', '3.06', './grid/M6_mix__64.fts', '4', '40000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/29', '2', '', null, '2', '0', ',str,3d,1mgrid,3rdsmooth,tran,roe-scheme,+A,largeA,zeroB,SST,bing,', '64');
INSERT INTO `cases_system` VALUES ('30', 'PHengLEI', 'B01_TwoD_NACA0012_SA_Unstruct_1CPU', '2021-07-03 13:24:38', null, null, '0.15', '15', './grid/NACA0012_unstr.fts', '3', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/30', '2', '', null, '2', '0', ',unstr,2d,4mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '1');
INSERT INTO `cases_system` VALUES ('31', 'PHengLEI', 'Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU', '2021-07-03 13:24:38', null, null, '0.2', '19', './grid/30p30n_str__4.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/31', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,hugeA,zeroB,SA,bing,', '4');
INSERT INTO `cases_system` VALUES ('32', 'PHengLEI', 'B04_ThreeD_DLR-F6_SA_Unstruct_60CPU', '2021-07-03 13:24:39', null, null, '0.750', '-0.304', './grid/F6WB_unstr__60.fts', '3', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/32', '2', '', null, '2', '0', ',unstr,3d,4mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,-A,smallA,', '60');
INSERT INTO `cases_system` VALUES ('33', 'PHengLEI', 'B07_ThreeD_Sphere_Laminar_Unstruct_4CPU', '2021-07-16 14:20:41', null, null, '10.00', '0.00', './grid/sphere_m10__4.fts', '1', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/33', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,hyper,zeroB,steger-scheme,Lamilar,zeroA,', '4');
INSERT INTO `cases_system` VALUES ('34', 'PHengLEI', 'F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_4CPU', '2021-07-16 14:20:41', null, null, '0.755', '0.016', './grid/background__2.fts', '0', '300', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/34', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,Euler,+A,smallA,', '2');
INSERT INTO `cases_system` VALUES ('35', 'PHengLEI', 'G01_TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct', '2021-07-16 14:20:44', null, null, '8.7569', '0.00', './grid/2D_HEG_CYLINDER_65X88_DY2D-7__4.fts', '1', '10000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/35', '2', '', null, '2', '0', ',str,2d,1mgrid,minmod,hyper,ausmdv-scheme,zeroA,zeroB,Lamilar,bing,', '4');
INSERT INTO `cases_system` VALUES ('36', 'PHengLEI', 'F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_4CPU', '2021-07-16 14:20:45', null, null, '0.73', '2.79', './grid/background__2.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/36', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '2');
INSERT INTO `cases_system` VALUES ('37', 'PHengLEI', 'F05_ThreeD_AEDC_OversetGrid_SST_Unstruct_8CPU', '2021-07-16 14:20:45', null, null, '0.73', '2.79', './grid/Wing__6.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/37', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '6');
INSERT INTO `cases_system` VALUES ('38', 'PHengLEI', 'F01_ThreeD_30p30n_OversetGrid_SA_Struct_4CPU', '2021-07-16 14:20:45', null, null, '0.2', '19.00', './grid/updatedgrid.fts', '3', '1', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/38', '2', '', null, '2', '0', ',str,3d,1mgrid,smooth,sub,roe-scheme,+A,hugeA,zeroB,SA,cuan,', '1');
INSERT INTO `cases_system` VALUES ('39', 'PHengLEI', 'F02_ThreeD_duodan_OversetGrid_SA_Struct_8CPU', '2021-07-16 14:20:47', null, null, '0.95', '2.79', './grid/updatedgrid.fts', '3', '1', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/39', '2', '', null, '2', '0', ',str,3d,1mgrid,smooth,tran,roe-scheme,+A,largeA,zeroB,SA,cuan,', '1');
INSERT INTO `cases_system` VALUES ('40', 'PHengLEI', 'F06_ThreeD_AEDC_OversetGrid_SSTCal_Unstruct_8CPU', '2021-07-16 14:20:49', null, null, '0.95', '0.00', './grid/Wing__6.fts', '4', '50', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/40', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,tran,zeroB,roe-scheme,SST,zeroA,', '6');
INSERT INTO `cases_system` VALUES ('41', 'PHengLEI', 'G02_ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct', '2021-07-16 14:20:49', null, null, '12.935', '0.00', './grid/3D_Electre_Half_Model_dy1D-5__6.fts', '1', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/41', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,ausmdv-scheme,zeroA,zeroB,Lamilar,bing,', '6');
INSERT INTO `cases_system` VALUES ('42', 'PHengLEI', 'B11_ThreeD_DLR-GK01_Ma7_SA_Unstruct_8CPU', '2021-07-18 16:58:41', null, null, '7.00', '0.00', './grid/GK01_unstr__8.fts', '3', '15000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/42', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,hyper,zeroB,roe-scheme,SA,zeroA,', '8');
INSERT INTO `cases_system` VALUES ('43', 'PHengLEI', 'B09_TwoD_plate_SA_Unstruct_1CPU', '2021-07-18 16:58:41', null, null, '0.2', '0.00', './grid/2d_plate_turb_unstr.fts', '3', '50000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/43', '2', '', null, '2', '0', ',unstr,2d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,zeroA,', '1');
INSERT INTO `cases_system` VALUES ('44', 'PHengLEI', 'B12_ThreeD_DoubleEllipse_Laminar_Unstruct_4CPU', '2021-07-18 16:58:41', null, null, '8.15', '0.00', './grid/3d_DoubleEllipse_unstr__4.fts', '1', '30000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/44', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,hyper,zeroB,steger-scheme,Lamilar,zeroA,', '4');
INSERT INTO `cases_system` VALUES ('45', 'PHengLEI', 'B06_ThreeD_Axisymmetric_SA_Unstruct_64CPU', '2021-07-18 16:58:50', null, null, '1.6', '40.0', './grid/10zy__64.fts', '3', '4000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/45', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,super,zeroB,roe-scheme,SA,+A,hugeA,', '64');
INSERT INTO `cases_system` VALUES ('46', 'PHengLEI', 'B10_ThreeD_CompRamp-16_SA_Unstruct_1CPU', '2021-07-18 16:58:51', null, null, '2.85', '0.00', './grid/3d_16ramp_unstr.fts', '3', '20000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/46', '2', '', null, '2', '0', ',unstr,3d,1mgrid,cuan,vencat,super,zeroB,vanleer-scheme,SA,zeroA,', '1');
INSERT INTO `cases_system` VALUES ('47', 'PHengLEI', 'B08_TwoD_Plate_Laminar_Unstruct_1CPU', '2021-07-18 16:58:52', null, null, '0.1', '0.00', './grid/2d_plate_laminar_unstr.fts', '1', '60000', 'PHengLEIv3d0_Active', '/home/helei/ATP/case_system/47', '2', '', null, '2', '0', ',unstr,2d,1mgrid,cuan,vencat,sub,zeroB,roe-scheme,Lamilar,zeroA,', '1');
INSERT INTO `cases_system` VALUES ('48', 'PHengLEI', 'A16-TwoD_NLR7301_SST_Struct_4CPU', '2022-03-30 15:21:07', null, null, '0.185', '6.00', './grid/2D_NLR7301_Str.fts', '4', '80000', 'PHengLEIv3d0_Active', 'case_system/48', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,hugeA,zeroB,SST,cuan,', '1');
INSERT INTO `cases_system` VALUES ('49', 'PHengLEI', 'A17-ThreeD_Compression_Ramp-16_SA_Struct', '2022-03-30 15:21:07', null, null, '2.85', '0.00', './grid/3d_16ramp_str.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/49', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,super,vanleer-scheme,zeroA,zeroB,SA,cuan,', '1');
INSERT INTO `cases_system` VALUES ('50', 'PHengLEI', 'A21-ThreeD_ShockwaveInteractionPlate_Ma2_Laminar_UDB_Struct_1CPU', '2022-03-30 15:21:07', null, null, '2.00', '0.00', './grid/3D_plate_UDB_str.fts', '1', '10000', 'PHengLEIv3d0_Active', 'case_system/50', '2', '', null, '2', '0', ',str,3d,1mgrid,minvan,super,roe-scheme,zeroA,zeroB,Lamilar,cuan,', '1');
INSERT INTO `cases_system` VALUES ('51', 'PHengLEI', 'A22-ThreeD_Jet_Ma3d33_SST_Struct_8CPU', '2022-03-30 15:21:07', null, null, '3.33', '0.00', './grid/3D_jet__8.fts', '4', '50000', 'PHengLEIv3d0_Active', 'case_system/51', '2', '', null, '2', '0', ',str,3d,1mgrid,minvan,super,steger-scheme,zeroA,zeroB,SST,bing,', '8');
INSERT INTO `cases_system` VALUES ('52', 'PHengLEI', 'B13_ThreeD_Chnt_SA_Unstruct_100CPU', '2022-03-30 15:21:25', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/52', '2', '', null, '2', '0', ',unstr,3d,translate,', '1');
INSERT INTO `cases_system` VALUES ('53', 'PHengLEI', 'B14-TwoD_30p30n_SA_Unstruct_4CPU', '2022-03-30 15:21:25', null, null, '0.2', '19.0', './grid/30p30n_hygrid_2d__4.fts', '3', '10000', 'PHengLEIv3d0_Active', 'case_system/53', '2', '', null, '2', '0', ',unstr,2d,2mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '4');
INSERT INTO `cases_system` VALUES ('54', 'PHengLEI', 'B17-TwoD_Plate_S-KSR_SST_Unstruct_4CPU', '2022-03-30 15:21:26', null, null, '0.1467', '0.0', './grid/sk-flat-2D_unstr__4.fts', '4', '20000', 'PHengLEIv3d0_Active', 'case_system/54', '2', '', null, '2', '0', ',unstr,2d,4mgrid,bing,vencat,sub,zeroB,roe-scheme,SST,zeroA,', '4');
INSERT INTO `cases_system` VALUES ('55', 'PHengLEI', 'E03-ThreeD_NACA0012_LES_Struct_400CPU', '2022-03-30 15:21:26', null, null, '0.4', '9.29', './grid/naca0012_str_26m_yup__400.fts', '1', '400', 'PHengLEIv3d0_Active', 'case_system/55', '2', '', null, '2', '0', ',str,3d,1mgrid,3rdsmooth,sub,roe-scheme,+A,hugeA,zeroB,Lamilar,bing,', '400');
INSERT INTO `cases_system` VALUES ('56', 'PHengLEI', 'F08-ThreeD_Finner_Laminar_Ma2d5_Struct_16CPU', '2022-03-30 15:21:32', null, null, '2.50', '0.0', './grid/finner__16.fts', '1', '2000', 'PHengLEIv3d0_Active', 'case_system/56', '2', '', null, '2', '0', ',str,3d,1mgrid,minvan,super,steger-scheme,zeroA,zeroB,Lamilar,bing,', '16');
INSERT INTO `cases_system` VALUES ('57', 'PHengLEI', 'F10-ThreeD_Brid_GridDeformationRBF_Unstruct_1CPU', '2022-03-30 15:21:33', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/57', '2', '', null, '2', '0', ',unstr,3d,translate,', '1');
INSERT INTO `cases_system` VALUES ('58', 'PHengLEI', 'X01_ThreeD_SEEBALR_Euler_Struct_8CPU', '2022-03-30 15:21:34', null, null, '1.600', '0.00', './grid/seeb__8.fts', '0', '20000', 'PHengLEIv3d0_Active', 'case_system/58', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,super,ausmpw-scheme,zeroA,zeroB,Euler,bing,', '8');
INSERT INTO `cases_system` VALUES ('59', 'PHengLEI', 'A19-ThreeD_BluntCone_Ma10d6_Laminar_Struct_64CPU', '2022-03-30 15:21:36', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/59', '2', '', null, '2', '0', ',str,3d,partition,', '1');
INSERT INTO `cases_system` VALUES ('60', 'PHengLEI', 'A20-ThreeD_OV102_Ma20_Laminar_H50_Struct_24CPU', '2022-03-30 15:21:36', null, null, '20.00', '20.00', './grid/OV102__24.fts', '1', '50000', 'PHengLEIv3d0_Active', 'case_system/60', '2', '', null, '2', '0', ',str,2d,1mgrid,minmod,hyper,steger-scheme,+A,hugeA,zeroB,Lamilar,bing,', '24');
INSERT INTO `cases_system` VALUES ('61', 'PHengLEI', 'A23-TwoD_Plate_S-KSR_SST_Struct_4CPU', '2022-03-30 15:21:36', null, null, '0.1467', '0.0', './grid/sk-flat-2D_str__4.fts', '4', '50000', 'PHengLEIv3d0_Active', 'case_system/61', '2', '', null, '2', '0', ',str,2d,4mgrid,minvan,sub,roe-scheme,zeroA,zeroB,SST,bing,', '4');
INSERT INTO `cases_system` VALUES ('62', 'PHengLEI', 'B16-ThreeD_Hollow_Cylinder_Flare_Laminar_Unstruct_16CPU', '2022-03-30 15:21:45', null, null, '9.91', '0.00', './grid/3d_HCFlare_unstr__16.fts', '1', '30000', 'PHengLEIv3d0_Active', 'case_system/62', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,hyper,zeroB,steger-scheme,Lamilar,zeroA,', '16');
INSERT INTO `cases_system` VALUES ('63', 'PHengLEI', 'F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_6CPU', '2022-03-30 15:21:49', null, null, '0.755', '0.016', './grid/background__2.fts', '0', '300', 'PHengLEIv3d0_Active', 'case_system/63', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,Euler,+A,smallA,', '2');
INSERT INTO `cases_system` VALUES ('64', 'PHengLEI', 'F09-ThreeD_Brid_GridDeformationSPRING_Unstruct_1CPU', '2022-03-30 15:21:50', null, null, '0.73', '2.79', './grid/rae2822_hybrid2d__4.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/64', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '4');
INSERT INTO `cases_system` VALUES ('65', 'PHengLEI', 'Y01_ThreeD_Chnt_SA_Unstruct_Branch_TH', '2022-03-30 15:22:01', null, null, '0.73', '-1', './grid/grid_chnt-1_m_2065W__100.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/65', '2', '', null, '2', '0', ',unstr,3d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,-A,smallA,', '100');
INSERT INTO `cases_system` VALUES ('66', 'PHengLEI', 'A18-ThreeD_Hollow_Cylinder_Flare_Laminar_Struct_16CPU', '2022-03-30 15:22:03', null, null, '9.91', '0.00', './grid/3d_HCFlare_str__16.fts', '1', '50000', 'PHengLEIv3d0_Active', 'case_system/66', '2', '', null, '2', '0', ',str,3d,1mgrid,minmod,hyper,steger-scheme,zeroA,zeroB,Lamilar,bing,', '16');
INSERT INTO `cases_system` VALUES ('67', 'PHengLEI', 'B15-TwoD_NLR7301_SA_Unstruct_4CPU', '2022-03-30 15:22:04', null, null, '0.185', '6.00', './grid/2D_NLR7301_Unstr.fts', '3', '10000', 'PHengLEIv3d0_Active', 'case_system/67', '2', '', null, '2', '0', ',unstr,2d,2mgrid,cuan,vencat,sub,zeroB,roe-scheme,SA,+A,hugeA,', '1');
INSERT INTO `cases_system` VALUES ('68', 'PHengLEI', 'F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_6CPU', '2022-03-30 15:22:15', null, null, '0.73', '2.79', './grid/background__2.fts', '3', '20000', 'PHengLEIv3d0_Active', 'case_system/68', '2', '', null, '2', '0', ',unstr,2d,1mgrid,bing,vencat,sub,zeroB,roe-scheme,SA,+A,largeA,', '2');
INSERT INTO `cases_system` VALUES ('69', 'PHengLEI', 'F07-TwoD_NACA0012_PitchingMovement_SA_Struct_4CPU', '2022-03-30 15:22:15', null, null, '0.6', '2.89', './grid/2D_NACA0012_PM_Str__4.fts', '3', '4000', 'PHengLEIv3d0_Active', 'case_system/69', '2', '', null, '2', '0', ',str,2d,1mgrid,smooth,sub,roe-scheme,+A,largeA,zeroB,SA,bing,', '4');

-- ----------------------------
-- Table structure for cases_unittest
-- ----------------------------
DROP TABLE IF EXISTS `cases_unittest`;
CREATE TABLE `cases_unittest` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `case_name` varchar(85) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `solver_name` varchar(20) DEFAULT NULL,
  `visible` int(1) DEFAULT '2',
  `caption` text,
  `evaluation` varchar(45) DEFAULT NULL,
  `priority` int(1) DEFAULT '2',
  `parameterFile` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases_unittest
-- ----------------------------
INSERT INTO `cases_unittest` VALUES ('1', null, 'CGNSConversion', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('2', null, 'GridReader', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('3', null, 'BasisFuncTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('4', null, 'LimiterFuncTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('5', null, 'FieldViewGridConversion', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('6', null, 'PreUnstructGridPartition', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('7', null, 'PreStructGridPartition', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('8', null, 'ExitTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('9', null, 'GeoCellMetrics_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('10', null, 'GeoCellMetrics_str', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('11', null, 'GeoFaceMetrics_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('12', null, 'GeoFaceMetrics_str', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('13', null, 'GeoNodeTopo_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('14', null, 'GeoNodeTopo_str', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('15', null, 'GeoFaceTopo_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('16', null, 'GeoCellTopo_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('17', null, 'GeoLSQWeight_uns', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('18', null, 'TimeSpanTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('19', null, 'GeoMultiGridInfo_str', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('20', null, 'DYutilTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);
INSERT INTO `cases_unittest` VALUES ('21', null, 'TK_ParseTest', '2022-04-01 23:27:18', 'PHengLEIv3d0_Active', '2', null, null, '2', null);

-- ----------------------------
-- Table structure for caseset_info
-- ----------------------------
DROP TABLE IF EXISTS `caseset_info`;
CREATE TABLE `caseset_info` (
  `idcaseset_info` int(11) NOT NULL,
  `case_sort` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `case_id` int(4) DEFAULT NULL,
  `set_user` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`idcaseset_info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of caseset_info
-- ----------------------------

-- ----------------------------
-- Table structure for compile_info
-- ----------------------------
DROP TABLE IF EXISTS `compile_info`;
CREATE TABLE `compile_info` (
  `idcompile_info` int(11) NOT NULL AUTO_INCREMENT,
  `idsolver_info` int(11) DEFAULT NULL,
  `compileNode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isCompileover` int(1) DEFAULT '0',
  `isCompileFine` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compile_begin_time` datetime DEFAULT NULL,
  `compile_finish_time` datetime DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`idcompile_info`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of compile_info
-- ----------------------------
INSERT INTO `compile_info` VALUES ('1', '1', 'huaweiyun', '0', null, '2021-07-02 10:11:36', null, '2');
INSERT INTO `compile_info` VALUES ('2', '2', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('3', '3', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('4', '4', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('5', '5', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('6', '6', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('7', '7', 'huaweiyun', '0', null, '2021-07-02 10:55:33', null, '2');
INSERT INTO `compile_info` VALUES ('8', '8', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('9', '9', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('10', '10', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('11', '11', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('12', '12', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('13', '13', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('14', '14', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('15', '15', 'huaweiyun', '1', 'OK', '2021-07-02 11:01:18', '2021-07-02 11:01:34', '2');
INSERT INTO `compile_info` VALUES ('16', '16', 'huaweiyun', '1', 'OK', '2021-07-02 11:01:44', '2021-07-02 11:02:01', '2');
INSERT INTO `compile_info` VALUES ('17', '17', 'huaweiyun', '1', 'OK', '2021-07-02 11:02:11', '2021-07-02 11:02:27', '2');
INSERT INTO `compile_info` VALUES ('18', '18', 'huaweiyun', '1', 'OK', '2021-07-02 11:02:38', '2021-07-02 11:02:54', '2');
INSERT INTO `compile_info` VALUES ('19', '19', 'huaweiyun', '1', 'OK', '2021-07-02 11:03:05', '2021-07-02 11:03:21', '2');
INSERT INTO `compile_info` VALUES ('20', '20', 'huaweiyun', '1', 'OK', '2021-07-16 14:05:22', '2021-07-16 14:05:38', '2');
INSERT INTO `compile_info` VALUES ('21', '21', 'huaweiyun', '1', 'OK', '2021-07-18 16:51:17', '2021-07-18 16:51:50', '2');
INSERT INTO `compile_info` VALUES ('22', '22', 'huaweiyun', '1', 'OK', '2021-07-18 16:52:01', '2021-07-18 16:52:34', '2');
INSERT INTO `compile_info` VALUES ('23', '23', 'huaweiyun', '1', 'OK', '2021-07-20 16:28:40', '2021-07-20 16:29:27', '2');
INSERT INTO `compile_info` VALUES ('24', '24', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('25', '25', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('26', '26', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('27', '27', 'huaweiyun', '0', null, null, null, '2');
INSERT INTO `compile_info` VALUES ('34', '28', 'huaweiyun', '0', null, '2022-03-29 20:09:05', null, '3');
INSERT INTO `compile_info` VALUES ('35', '29', 'huaweiyun', '0', null, null, null, '3');
INSERT INTO `compile_info` VALUES ('36', '30', 'huaweiyun', '0', null, null, null, '3');
INSERT INTO `compile_info` VALUES ('37', '31', 'huaweiyun', '1', 'makeError', '2022-03-29 20:29:40', '2022-03-29 20:30:00', '3');
INSERT INTO `compile_info` VALUES ('38', '32', 'huaweiyun', '1', 'OK', '2022-03-29 20:31:13', '2022-03-29 20:31:33', '2');
INSERT INTO `compile_info` VALUES ('39', '33', 'huaweiyun', '1', 'OK', '2022-03-30 10:46:24', '2022-03-30 10:46:47', '2');
INSERT INTO `compile_info` VALUES ('44', '34', 'huaweiyun', '1', 'cmakeError', '2022-04-07 09:21:06', '2022-04-07 09:21:08', '3');
INSERT INTO `compile_info` VALUES ('45', '35', 'huaweiyun', '1', 'cmakeError', '2022-04-07 09:21:43', '2022-04-07 09:21:44', '3');
INSERT INTO `compile_info` VALUES ('46', '36', 'huaweiyun', '1', 'makeError', '2022-04-07 09:21:57', '2022-04-07 09:22:21', '3');
INSERT INTO `compile_info` VALUES ('47', '37', 'huaweiyun', '1', 'makeError', '2022-04-07 09:22:32', '2022-04-07 09:22:52', '3');
INSERT INTO `compile_info` VALUES ('48', '38', 'huaweiyun', '1', 'makeError', '2022-04-07 09:25:33', '2022-04-07 09:25:53', '3');
INSERT INTO `compile_info` VALUES ('49', '39', 'huaweiyun', '1', 'OK', '2022-04-07 09:30:46', '2022-04-07 09:31:10', '2');
INSERT INTO `compile_info` VALUES ('50', '40', 'huaweiyun', '1', 'OK', '2022-04-07 10:09:02', '2022-04-07 10:09:27', '2');
INSERT INTO `compile_info` VALUES ('51', '41', 'huaweiyun', '1', 'makeError', '2022-04-07 10:10:49', '2022-04-07 10:10:51', '3');
INSERT INTO `compile_info` VALUES ('52', '42', 'huaweiyun', '1', 'OK', '2022-04-07 10:11:02', '2022-04-07 10:11:26', '2');
INSERT INTO `compile_info` VALUES ('53', '43', 'huaweiyun', '1', 'OK', '2022-04-07 10:19:03', '2022-04-07 10:19:26', '2');
INSERT INTO `compile_info` VALUES ('54', '44', 'huaweiyun', '1', 'makeError', '2022-04-07 10:19:38', '2022-04-07 10:19:57', '3');
INSERT INTO `compile_info` VALUES ('55', '45', 'huaweiyun', '1', 'makeError', '2022-04-07 10:20:08', '2022-04-07 10:20:28', '3');
INSERT INTO `compile_info` VALUES ('56', '46', 'huaweiyun', '1', 'makeError', '2022-04-07 10:20:39', '2022-04-07 10:20:59', '3');
INSERT INTO `compile_info` VALUES ('57', '47', 'huaweiyun', '1', 'makeError', '2022-04-07 10:21:29', '2022-04-07 10:21:51', '3');
INSERT INTO `compile_info` VALUES ('58', '48', 'huaweiyun', '0', null, null, null, '0');

-- ----------------------------
-- Table structure for imgdb
-- ----------------------------
DROP TABLE IF EXISTS `imgdb`;
CREATE TABLE `imgdb` (
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgdb
-- ----------------------------

-- ----------------------------
-- Table structure for merge_info
-- ----------------------------
DROP TABLE IF EXISTS `merge_info`;
CREATE TABLE `merge_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `mergeid` int(100) DEFAULT NULL,
  `assignee_id` int(20) DEFAULT NULL,
  `assignee_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merge_info
-- ----------------------------

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info` (
  `idmessage_info` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `receiver` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'All',
  PRIMARY KEY (`idmessage_info`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_info
-- ----------------------------
INSERT INTO `message_info` VALUES ('1', 'p68217053更新项目PHengLEI:-ono-Initial commit ', 'PHengLEI', '2021-06-30 10:58:49', 'All');
INSERT INTO `message_info` VALUES ('2', 'phenglei更新项目PHengLEI:-ono-init version 7129 ', 'PHengLEI', '2021-06-30 10:59:32', 'All');
INSERT INTO `message_info` VALUES ('3', 'p98607135更新项目PHengLEI:-ono-测试能否进主干 ', 'PHengLEI', '2021-06-30 11:00:24', 'All');
INSERT INTO `message_info` VALUES ('4', 'p68217053更新项目PHengLEI:-ono-新建一个分支 ', 'PHengLEI', '2021-06-30 11:01:17', 'All');
INSERT INTO `message_info` VALUES ('5', 'hexianyao更新项目PHengLEI:-ono-Readme文件重命名。 ', 'PHengLEI', '2021-06-30 11:02:09', 'All');
INSERT INTO `message_info` VALUES ('6', 'hexianyao更新项目PHengLEI:-ono-删除del.txt ', 'PHengLEI', '2021-06-30 11:04:30', 'All');
INSERT INTO `message_info` VALUES ('7', 'hexianyao更新项目PHengLEI:-ono-ActiveBranch更新至7407版本 ', 'PHengLEI', '2021-06-30 11:05:13', 'All');
INSERT INTO `message_info` VALUES ('8', 'hexianyao更新项目PHengLEI:-ono-ActiveBranch更新至7407版本 ', 'PHengLEI', '2021-06-30 11:06:05', 'All');
INSERT INTO `message_info` VALUES ('9', 'hexianyao更新项目PHengLEI:-ono-修改readme文件，增加算例库地址 ', 'PHengLEI', '2021-06-30 11:06:58', 'All');
INSERT INTO `message_info` VALUES ('10', 'hexianyao更新项目PHengLEI:-ono-修改Readme，增加代码获取步骤 ', 'PHengLEI', '2021-06-30 11:07:51', 'All');
INSERT INTO `message_info` VALUES ('11', 'hexianyao更新项目PHengLEI:-ono-ActiveBranch更新至7628版本 ', 'PHengLEI', '2021-06-30 11:08:43', 'All');
INSERT INTO `message_info` VALUES ('12', 'hexianyao更新项目PHengLEI:-ono-ActiveBranch更新至7628版本 ', 'PHengLEI', '2021-06-30 11:09:26', 'All');
INSERT INTO `message_info` VALUES ('13', 'hexianyao更新项目PHengLEI:-ono-更新手册7628 ', 'PHengLEI', '2021-06-30 11:10:18', 'All');
INSERT INTO `message_info` VALUES ('14', 'hexianyao更新项目PHengLEI:-ono-修改手册，增加附录 ', 'PHengLEI', '2021-06-30 11:11:11', 'All');
INSERT INTO `message_info` VALUES ('15', 'p68217053更新项目PHengLEI:-ono-同步更新 changelog 至 v7628 ', 'PHengLEI', '2021-06-30 11:17:04', 'All');
INSERT INTO `message_info` VALUES ('16', 'hexianyao更新项目PHengLEI:-ono-bugfix: 修复后处理输出壁面热流的bug。 ', 'PHengLEI', '2021-06-30 11:17:47', 'All');
INSERT INTO `message_info` VALUES ('17', 'hexianyao更新项目PHengLEI:-ono-更新手册中符号显示的问题，用户在issue中提出的。 ', 'PHengLEI', '2021-06-30 11:18:39', 'All');
INSERT INTO `message_info` VALUES ('18', 'p68217053更新项目PHengLEI:-ono-增加ubuntu库文件 ', 'PHengLEI', '2021-06-30 11:19:32', 'All');
INSERT INTO `message_info` VALUES ('19', 'hexianyao更新项目PHengLEI:-ono-修改readme，增加代码参考文档地址 ', 'PHengLEI', '2021-06-30 11:20:24', 'All');
INSERT INTO `message_info` VALUES ('20', 'zhangyong更新项目PHengLEI-zhangyong:-ono-Add UnstructMesh Reorder Function ', 'PHengLEI', '2021-07-16 13:32:13', 'All');
INSERT INTO `message_info` VALUES ('21', 'hexianyao更新项目PHengLEI:-ono-提交代码2171版本，手册、changelog除外 ', 'PHengLEI', '2021-07-18 16:41:48', 'All');
INSERT INTO `message_info` VALUES ('22', 'hexianyao更新项目PHengLEI:-ono-更新changelog ', 'PHengLEI', '2021-07-18 16:42:33', 'All');
INSERT INTO `message_info` VALUES ('23', 'hexianyao更新项目PHengLEI:-ono-更新手册2171版本 ', 'PHengLEI', '2021-07-18 16:51:11', 'All');
INSERT INTO `message_info` VALUES ('24', 'hexianyao更新项目PHengLEI:-ono-更新应用与开发指南，修改若干小错误，准备印刷 ', 'PHengLEI', '2022-01-12 19:44:47', 'All');
INSERT INTO `message_info` VALUES ('25', 'hexianyao更新项目PHengLEI:-ono-修改Readme版本信息 ', 'PHengLEI', '2022-01-12 19:45:33', 'All');
INSERT INTO `message_info` VALUES ('26', 'hexianyao更新项目PHengLEI:-ono-临时修复一个混合计算的小bug ', 'PHengLEI', '2022-01-12 19:46:28', 'All');
INSERT INTO `message_info` VALUES ('27', 'zhangyong更新项目PHengLEI,PHengLEI-zhangyong:-ono-Merge branch master into ActiveBranch ', 'PHengLEI', '2022-01-12 19:47:24', 'All');
INSERT INTO `message_info` VALUES ('28', 'lxcinner更新项目PHengLEI:-ono-ReadMe V2112 ', 'PHengLEI', '2022-01-12 19:48:19', 'All');
INSERT INTO `message_info` VALUES ('29', 'p52791048更新项目PHengLEI-xinglonghu:-ono-接受9704版本进主干 ', 'PHengLEI', '2022-03-29 16:53:36', 'All');
INSERT INTO `message_info` VALUES ('30', 'p52791048更新项目PHengLEI-xinglonghu:-ono-合并进其他遗漏文件 ', 'PHengLEI', '2022-03-29 16:54:21', 'All');
INSERT INTO `message_info` VALUES ('31', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-添加遗漏文件 ', 'PHengLEI', '2022-03-29 16:55:17', 'All');
INSERT INTO `message_info` VALUES ('32', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-同步内容主干9704版本， 保留2112版本的多余文件 ', 'PHengLEI', '2022-03-29 17:04:04', 'All');
INSERT INTO `message_info` VALUES ('33', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-同步内容主干9704版本， 保留2112版本的多余文件 ', 'PHengLEI', '2022-03-29 17:04:50', 'All');
INSERT INTO `message_info` VALUES ('34', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-同步内容主干9704版本， 保留2112版本的多余文件 ', 'PHengLEI', '2022-03-29 17:12:42', 'All');
INSERT INTO `message_info` VALUES ('35', 'p52791048更新项目PHengLEI-xinglonghu:-ono-接受9704版本进主干 ', 'PHengLEI', '2022-03-29 17:13:28', 'All');
INSERT INTO `message_info` VALUES ('36', 'p52791048更新项目PHengLEI-xinglonghu:-ono-合并进其他遗漏文件 ', 'PHengLEI', '2022-03-29 17:14:26', 'All');
INSERT INTO `message_info` VALUES ('37', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-对比2112版本，增加内部主干9704多出的文件 ', 'PHengLEI', '2022-03-29 17:15:21', 'All');
INSERT INTO `message_info` VALUES ('38', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-添加遗漏文件 ', 'PHengLEI', '2022-03-29 17:16:17', 'All');
INSERT INTO `message_info` VALUES ('39', 'p95216308更新项目PHengLEI-xinglonghu:-ono-接受张勇提交的合并请求 ', 'PHengLEI', '2022-03-30 10:41:18', 'All');
INSERT INTO `message_info` VALUES ('40', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge remote-tracking branch remotes/origin/ActiveBranch into Branch_Comm ', 'PHengLEI', '2022-04-05 16:11:26', 'All');
INSERT INTO `message_info` VALUES ('41', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_Comm ', 'PHengLEI', '2022-04-05 16:12:12', 'All');
INSERT INTO `message_info` VALUES ('42', 'p95216308更新项目PHengLEI-xinglonghu:-ono-接受何超的合并请求 ', 'PHengLEI', '2022-04-05 16:13:07', 'All');
INSERT INTO `message_info` VALUES ('43', 'hexianyao更新项目PHengLEI-xinglonghu:-ono-Readme文件重命名。 ', 'PHengLEI', '2022-04-05 16:26:03', 'All');
INSERT INTO `message_info` VALUES ('44', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_zhangyong ', 'PHengLEI', '2022-04-06 23:16:36', 'All');
INSERT INTO `message_info` VALUES ('45', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-同步内部9704版本，将多余的文件添加至版本管理 ', 'PHengLEI', '2022-04-06 23:18:09', 'All');
INSERT INTO `message_info` VALUES ('46', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge remote-tracking branch remotes/origin/ActiveBranch into Branch_zhangyong ', 'PHengLEI', '2022-04-06 23:25:28', 'All');
INSERT INTO `message_info` VALUES ('47', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge remote-tracking branch remotes/origin/ActiveBranch into Branch_Comm ', 'PHengLEI', '2022-04-06 23:27:01', 'All');
INSERT INTO `message_info` VALUES ('48', 'hechao更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch into Branch_hechao ', 'PHengLEI', '2022-04-06 23:28:45', 'All');
INSERT INTO `message_info` VALUES ('49', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-1、在ComputationalGrid文件中修改nullptr为NULL； 2、在Linux-x86_64文件中替换静态库文件（libtecio未替换），适配华为云； 3、修改PHengLEI文件下的CmakeLists文件，仅在LBM功能开启时使用“-std=c++14”编译选项。 ', 'PHengLEI', '2022-04-06 23:30:29', 'All');
INSERT INTO `message_info` VALUES ('50', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_Comm ', 'PHengLEI', '2022-04-06 23:32:14', 'All');
INSERT INTO `message_info` VALUES ('51', 'hechao更新项目PHengLEI-xinglonghu:-ono-1）修改cfd_para.hypara中tscheme中的注释； 2）增加代表雅各比迭代的常量JACOBIAN_ITERATION（数值6）并在NSSolverStructFD（）中的前扫、后扫过程对相应数值进行替换 3）对RunGridCheckSolver()的结构和非结构数值用宏定义的常量替代 ', 'PHengLEI', '2022-04-06 23:33:57', 'All');
INSERT INTO `message_info` VALUES ('52', 'p95216308更新项目PHengLEI-xinglonghu:-ono-接受何超的合并请求 ', 'PHengLEI', '2022-04-06 23:35:31', 'All');
INSERT INTO `message_info` VALUES ('53', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_Comm ', 'PHengLEI', '2022-04-06 23:37:13', 'All');
INSERT INTO `message_info` VALUES ('54', 'zhangyong更新项目PHengLEI-xinglonghu:-ono-同步9813代码到Branch_Comm ', 'PHengLEI', '2022-04-06 23:38:57', 'All');
INSERT INTO `message_info` VALUES ('55', 'p95216308更新项目PHengLEI-xinglonghu:-ono-接受9813版本进主干 ', 'PHengLEI', '2022-04-06 23:40:41', 'All');
INSERT INTO `message_info` VALUES ('56', 'hechao更新项目PHengLEI-xinglonghu:-ono-Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_hechao ', 'PHengLEI', '2022-04-06 23:42:24', 'All');
INSERT INTO `message_info` VALUES ('57', 'hexianyao更新项目PHengLEI-xinglonghu:-ono-通过比较，增加一个参数文件InnerTrajectory.dat ', 'PHengLEI', '2022-04-06 23:43:57', 'All');
INSERT INTO `message_info` VALUES ('58', 'p95216308更新项目PHengLEI-xinglonghu:-ono-Merge Branch_hexianyao into ActiveBranch ', 'PHengLEI', '2022-04-07 11:44:43', 'All');

-- ----------------------------
-- Table structure for project_info
-- ----------------------------
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE `project_info` (
  `idproject_info` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_group` int(2) DEFAULT NULL,
  `project_path` varchar(45) COLLATE utf8_unicode_ci DEFAULT '""',
  `status` int(2) DEFAULT '0',
  `start_version` int(10) DEFAULT '0',
  `end_version` int(10) DEFAULT '1000000',
  PRIMARY KEY (`idproject_info`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_info
-- ----------------------------
INSERT INTO `project_info` VALUES ('1', 'PHengLEI', 'https://git.osredm.com/p68217053/PHengLEI.git', '1', '.', '0', '0', '1000000');
INSERT INTO `project_info` VALUES ('2', 'PHengLEI-zhangyong', null, '1', '.', '0', '0', '1000000');
INSERT INTO `project_info` VALUES ('3', 'PHengLEI-xinglonghu', 'https://git.osredm.com/p95216308/PHengLEI.git', '1', '.', '2', '0', '1000000');

-- ----------------------------
-- Table structure for resultset_info
-- ----------------------------
DROP TABLE IF EXISTS `resultset_info`;
CREATE TABLE `resultset_info` (
  `idresultset_info` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(4) DEFAULT NULL,
  `test_id` int(8) DEFAULT NULL,
  `set_author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_time` datetime DEFAULT NULL,
  `solver_version` int(8) DEFAULT NULL,
  `solver_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  `case_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`idresultset_info`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resultset_info
-- ----------------------------
INSERT INTO `resultset_info` VALUES ('1', '1', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('2', '3', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('3', '5', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('4', '7', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('5', '8', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('6', '9', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('7', '12', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('8', '14', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('9', '16', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('10', '19', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('11', '22', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('12', '23', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('13', '25', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('14', '26', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('15', '28', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('16', '30', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');
INSERT INTO `resultset_info` VALUES ('17', '36', '3', 'helei', '2021-07-21 16:31:10', '23', 'PHengLEIv3d0_Active', '0', 'PHengLEI_System');

-- ----------------------------
-- Table structure for solver_info
-- ----------------------------
DROP TABLE IF EXISTS `solver_info`;
CREATE TABLE `solver_info` (
  `idsolver_info` int(11) NOT NULL AUTO_INCREMENT,
  `solver_name` varchar(20) DEFAULT NULL,
  `solver_version` int(6) DEFAULT NULL,
  `solver_parameter_list` varchar(95) DEFAULT NULL,
  `isCompileover` int(1) DEFAULT '0',
  `isCompileFine` varchar(45) DEFAULT '',
  `update_author` varchar(20) DEFAULT NULL,
  `compile_begin_time` datetime DEFAULT NULL,
  `compile_finish_time` datetime DEFAULT NULL,
  `svnDate` datetime DEFAULT NULL,
  `gitProject` varchar(200) DEFAULT NULL,
  `branchName` varchar(30) DEFAULT NULL,
  `Main_Hash` varchar(45) DEFAULT NULL,
  `next_Hashs` varchar(1000) DEFAULT NULL,
  `state` int(1) DEFAULT '2',
  `update_Log` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idsolver_info`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of solver_info
-- ----------------------------
INSERT INTO `solver_info` VALUES ('1', 'PHengLEIv3d0_Active', '1', null, '0', '', 'p68217053', null, null, '2021-01-26 09:28:44', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:74a7834e5084527590f0c81b0f5f5de3e1744ab1,', '0', 'Initial commit ');
INSERT INTO `solver_info` VALUES ('2', 'PHengLEIv3d0_Active', '2', null, '0', '', 'phenglei', null, null, '2021-01-26 09:41:38', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:d3684c0148be478b35fc4d9365a66c4eb6050bae,', '0', 'init version 7129 ');
INSERT INTO `solver_info` VALUES ('3', 'PHengLEIv3d0_Active', '3', null, '0', '', 'p98607135', null, null, '2021-01-26 10:07:56', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:7992042bfa337dd04d618cdfdea022c206a22977,', '0', '测试能否进主干 ');
INSERT INTO `solver_info` VALUES ('4', 'PHengLEIv3d0_Active', '4', null, '0', '', 'p68217053', null, null, '2021-01-26 18:26:12', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:cd5d9cd05e747e39d0e09b9c9bba9fec4662da2a,', '0', '新建一个分支 ');
INSERT INTO `solver_info` VALUES ('5', 'PHengLEIv3d0_Active', '5', null, '0', '', 'hexianyao', null, null, '2021-03-03 19:32:11', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:fb06e412b882989b40791ee41ee64ced94875693,', '0', 'Readme文件重命名。 ');
INSERT INTO `solver_info` VALUES ('6', 'PHengLEIv3d0_Active', '6', null, '0', '', 'hexianyao', null, null, '2021-03-03 19:36:38', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:6be3911b8e91527a1193b86b8546032e3bc5bd01,', '0', '删除del.txt ');
INSERT INTO `solver_info` VALUES ('7', 'PHengLEIv3d0_Active', '7', null, '0', '', 'hexianyao', null, null, '2021-03-04 20:29:11', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:fbb15ef07bb1ef61021de0a54032006d7e459d8a,', '0', 'ActiveBranch更新至7407版本 ');
INSERT INTO `solver_info` VALUES ('8', 'PHengLEIv3d0_Active', '8', null, '0', '', 'hexianyao', null, null, '2021-03-04 20:37:35', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:82ef6d0c4c5c81910b27d1ba9adf186bfae9ba24,', '0', 'ActiveBranch更新至7407版本 ');
INSERT INTO `solver_info` VALUES ('9', 'PHengLEIv3d0_Active', '9', null, '0', '', 'hexianyao', null, null, '2021-03-31 23:57:47', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:1ac5f2f6b68b3b02e561fb0dbfadb5b06900b77e,', '0', '修改readme文件，增加算例库地址 ');
INSERT INTO `solver_info` VALUES ('10', 'PHengLEIv3d0_Active', '10', null, '0', '', 'hexianyao', null, null, '2021-04-01 01:03:33', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:dde3fe1f7cc389bedcbb4cee3b605613cc8a45df,', '0', '修改Readme，增加代码获取步骤 ');
INSERT INTO `solver_info` VALUES ('11', 'PHengLEIv3d0_Active', '11', null, '0', '', 'hexianyao', null, null, '2021-04-07 17:16:08', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:5486403adbac6cabe9e73b77273fbe8e0d05e23b,', '0', 'ActiveBranch更新至7628版本 ');
INSERT INTO `solver_info` VALUES ('12', 'PHengLEIv3d0_Active', '12', null, '0', '', 'hexianyao', null, null, '2021-04-07 17:16:36', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:26fa0c4732089ff1c8caf3c50b84869aaaeb3fd4,', '0', 'ActiveBranch更新至7628版本 ');
INSERT INTO `solver_info` VALUES ('13', 'PHengLEIv3d0_Active', '13', null, '0', '', 'hexianyao', null, null, '2021-04-07 18:36:32', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:d03b464cb13bcd012811a53b68031c68b36bd6c3,', '0', '更新手册7628 ');
INSERT INTO `solver_info` VALUES ('14', 'PHengLEIv3d0_Active', '14', null, '0', '', 'hexianyao', null, null, '2021-04-08 19:29:15', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:75f48c4fc38e54240e5e8519638931048e6b403b,', '0', '修改手册，增加附录 ');
INSERT INTO `solver_info` VALUES ('15', 'PHengLEIv3d0_Active', '15', null, '0', '', 'p68217053', null, null, '2021-04-08 19:43:15', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:ed33f5264ab7366e619bb9eeb74eb195f97c77f7,', '0', '同步更新 changelog 至 v7628 ');
INSERT INTO `solver_info` VALUES ('16', 'PHengLEIv3d0_Active', '16', null, '0', '', 'hexianyao', null, null, '2021-04-16 16:49:11', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:c83bd969bf65a05a3b312d78a109d9ad6e55f8b3,', '0', 'bugfix: 修复后处理输出壁面热流的bug。 ');
INSERT INTO `solver_info` VALUES ('17', 'PHengLEIv3d0_Active', '17', null, '0', '', 'hexianyao', null, null, '2021-04-17 15:15:38', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:9bbd6dc6bdff8465580b523532f4cd4bf439c96e,', '0', '更新手册中符号显示的问题，用户在issue中提出的。 ');
INSERT INTO `solver_info` VALUES ('18', 'PHengLEIv3d0_Active', '18', null, '0', '', 'p68217053', null, null, '2021-04-25 21:56:03', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:a1d52c7d494a6dc40cc7264e0e53ae3457d86353,', '0', '增加ubuntu库文件 ');
INSERT INTO `solver_info` VALUES ('19', 'PHengLEIv3d0_Active', '19', null, '0', '', 'hexianyao', null, null, '2021-06-02 16:05:39', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:61ac1135a89e2651fdb6ede353418431c7685902,', '0', '修改readme，增加代码参考文档地址 ');
INSERT INTO `solver_info` VALUES ('20', 'PHengLEIv3d0_Active', '20', null, '0', '', 'zhangyong', null, null, '2021-07-16 10:44:04', 'PHengLEI-zhangyong', 'ActiveBranch', '', 'PHengLEI-zhangyong:857eda2a0470f35e508fc482c14cbf825de30a10,', '0', 'Add UnstructMesh Reorder Function ');
INSERT INTO `solver_info` VALUES ('21', 'PHengLEIv3d0_Active', '21', null, '0', '', 'hexianyao', null, null, '2021-06-30 00:10:19', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:105ac3c923cfb0c428822b083fa7b52fcec46224,', '0', '提交代码2171版本，手册、changelog除外 ');
INSERT INTO `solver_info` VALUES ('22', 'PHengLEIv3d0_Active', '22', null, '0', '', 'hexianyao', null, null, '2021-06-30 08:47:38', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:1bccb1d7c8fbbfa3ccd4c505c301a2f80026e6e7,', '0', '更新changelog ');
INSERT INTO `solver_info` VALUES ('23', 'PHengLEIv3d0_Active', '23', null, '0', '', 'hexianyao', null, null, '2021-06-30 10:32:39', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:9b25dd0b9e01b699c2dac62f217f1760fccde43b,', '0', '更新手册2171版本 ');
INSERT INTO `solver_info` VALUES ('24', 'PHengLEIv3d0_Active', '24', null, '0', '', 'hexianyao', null, null, '2021-07-21 20:39:53', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:339cec213b2ec7f51f9aed024478aac860e511fc,', '0', '更新应用与开发指南，修改若干小错误，准备印刷 ');
INSERT INTO `solver_info` VALUES ('25', 'PHengLEIv3d0_Active', '25', null, '0', '', 'hexianyao', null, null, '2021-07-21 20:51:01', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:0a48340e18f2de61ba84a21b5cced78a408b1b84,', '0', '修改Readme版本信息 ');
INSERT INTO `solver_info` VALUES ('26', 'PHengLEIv3d0_Active', '26', null, '0', '', 'hexianyao', null, null, '2021-07-23 13:09:25', 'PHengLEI', 'ActiveBranch', '', 'PHengLEI:602707b4b84366b0005e652faebfb4b669eb0120,', '0', '临时修复一个混合计算的小bug ');
INSERT INTO `solver_info` VALUES ('27', 'PHengLEIv3d0_Active', '27', null, '0', '', 'zhangyong', null, null, '2022-01-12 19:15:35', 'PHengLEI,PHengLEI-zhangyong', 'ActiveBranch', '', 'PHengLEI:1efe0613a8eead93342a15f2002f0ab11c17bd08,PHengLEI-zhangyong:9868ef9d53d3c635ebc1d6f544b8bc3745eaefa0,', '0', 'Merge branch master into ActiveBranch ');
INSERT INTO `solver_info` VALUES ('28', 'PHengLEIv3d0_Active', '28', null, '0', '', 'zhangyong', null, null, '2022-03-28 11:51:54', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:89e2b8e6c6718b295472929a69db137e847939a3,', '0', '同步内容主干9704版本， 保留2112版本的多余文件 ');
INSERT INTO `solver_info` VALUES ('29', 'PHengLEIv3d0_Active', '29', null, '0', '', 'p52791048', null, null, '2022-03-28 12:56:00', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:d397e146653c22613b3067cce756535c7cf08ba0,', '0', '接受9704版本进主干 ');
INSERT INTO `solver_info` VALUES ('30', 'PHengLEIv3d0_Active', '30', null, '0', '', 'p52791048', null, null, '2022-03-28 17:15:56', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:4b062a8196214d426a9427a56f73e18617216b4d,', '0', '合并进其他遗漏文件 ');
INSERT INTO `solver_info` VALUES ('31', 'PHengLEIv3d0_Active', '31', null, '0', '', 'zhangyong', null, null, '2022-03-28 19:15:06', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:27f3fa28ada5a8738b96e1ccd8046a6000dd7226,', '0', '对比2112版本，增加内部主干9704多出的文件 ');
INSERT INTO `solver_info` VALUES ('32', 'PHengLEIv3d0_Active', '32', null, '0', '', 'zhangyong', null, null, '2022-03-28 19:46:11', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:7e81c85af3c1679b515e04275b861d0e258d9aef,', '0', '添加遗漏文件 ');
INSERT INTO `solver_info` VALUES ('33', 'PHengLEIv3d0_Active', '33', null, '0', '', 'p95216308', null, null, '2022-03-30 09:59:55', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:717f94f925e4c4deff5a9e241a1b0f8d473f9bd2,', '0', '接受张勇提交的合并请求 ');
INSERT INTO `solver_info` VALUES ('34', 'PHengLEIv3d0_Active', '34', null, '0', '', 'zhangyong', null, null, '2022-03-28 12:57:02', 'PHengLEI-xinglonghu', 'Branch_zhangyong', '', 'PHengLEI-xinglonghu:e10f261a33137da6a77b38cc6645cf0f4a3c6ef7,', '0', 'Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_zhangyong ');
INSERT INTO `solver_info` VALUES ('35', 'PHengLEIv3d0_Active', '35', null, '0', '', 'zhangyong', null, null, '2022-03-28 16:54:11', 'PHengLEI-xinglonghu', 'Branch_zhangyong', '', 'PHengLEI-xinglonghu:e7c1646a081a0f94415c1e63562ec15684efeae7,', '0', '同步内部9704版本，将多余的文件添加至版本管理 ');
INSERT INTO `solver_info` VALUES ('36', 'PHengLEIv3d0_Active', '36', null, '0', '', 'zhangyong', null, null, '2022-03-28 19:47:20', 'PHengLEI-xinglonghu', 'Branch_zhangyong', '', 'PHengLEI-xinglonghu:25f8e8d9832ecb48c0356a533b6d2aecb6f10cfd,', '0', 'Merge remote-tracking branch remotes/origin/ActiveBranch into Branch_zhangyong ');
INSERT INTO `solver_info` VALUES ('37', 'PHengLEIv3d0_Active', '37', null, '0', '', 'zhangyong', null, null, '2022-03-28 19:48:05', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:35bb1f83c5994e5366c6e9f56c494dd8f4c03fbe,', '0', 'Merge remote-tracking branch remotes/origin/ActiveBranch into Branch_Comm ');
INSERT INTO `solver_info` VALUES ('38', 'PHengLEIv3d0_Active', '38', null, '0', '', 'hechao', null, null, '2022-03-29 19:19:47', 'PHengLEI-xinglonghu', 'Branch_hechao', '', 'PHengLEI-xinglonghu:21eac596c324fd1c88b78c661db2cc1e7d9c041f,', '0', 'Merge branch ActiveBranch into Branch_hechao ');
INSERT INTO `solver_info` VALUES ('39', 'PHengLEIv3d0_Active', '39', null, '0', '', 'zhangyong', null, null, '2022-03-30 09:48:39', 'PHengLEI-xinglonghu', 'Branch_zhangyong', '', 'PHengLEI-xinglonghu:5d466ec553564c5cba29c7a94cb7c7fde11a8a21,', '0', '1、在ComputationalGrid文件中修改nullptr为NULL； 2、在Linux-x86_64文件中替换静态库文件（libtecio未替换），适配华为云； 3、修改PHengLEI文件下的CmakeLists文件，仅在LBM功能开启时使用“-std=c++14”编译选项。 ');
INSERT INTO `solver_info` VALUES ('40', 'PHengLEIv3d0_Active', '40', null, '0', '', 'zhangyong', null, null, '2022-03-30 10:10:08', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:a47692c17507b391f77578e03aa0d9516d06bd9e,', '0', 'Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_Comm ');
INSERT INTO `solver_info` VALUES ('41', 'PHengLEIv3d0_Active', '41', null, '0', '', 'hechao', null, null, '2022-04-01 15:47:59', 'PHengLEI-xinglonghu', 'Branch_hechao', '', 'PHengLEI-xinglonghu:832fa71749be6582b4c4be003528186d98c413db,', '0', '1）修改cfd_para.hypara中tscheme中的注释； 2）增加代表雅各比迭代的常量JACOBIAN_ITERATION（数值6）并在NSSolverStructFD（）中的前扫、后扫过程对相应数值进行替换 3）对RunGridCheckSolver()的结构和非结构数值用宏定义的常量替代 ');
INSERT INTO `solver_info` VALUES ('42', 'PHengLEIv3d0_Active', '42', null, '0', '', 'p95216308', null, null, '2022-04-01 16:11:19', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:f82eef422a34fcf7108fb4b0b9dd2e491d7fba35,', '0', '接受何超的合并请求 ');
INSERT INTO `solver_info` VALUES ('43', 'PHengLEIv3d0_Active', '43', null, '0', '', 'zhangyong', null, null, '2022-04-02 08:25:58', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:bd8d17cb38d99e7eda2e7adc015b3667fde4ba1d,', '0', 'Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_Comm ');
INSERT INTO `solver_info` VALUES ('44', 'PHengLEIv3d0_Active', '44', null, '0', '', 'zhangyong', null, null, '2022-04-05 11:15:12', 'PHengLEI-xinglonghu', 'Branch_Comm', '', 'PHengLEI-xinglonghu:ae0910c0880acfcb4fd016998c11c461c1a37e78,', '0', '同步9813代码到Branch_Comm ');
INSERT INTO `solver_info` VALUES ('45', 'PHengLEIv3d0_Active', '45', null, '0', '', 'p95216308', null, null, '2022-04-05 11:22:55', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:30de264af65a622db20f9dbb5c80d08ba753f01a,', '0', '接受9813版本进主干 ');
INSERT INTO `solver_info` VALUES ('46', 'PHengLEIv3d0_Active', '46', null, '0', '', 'hechao', null, null, '2022-04-05 11:36:44', 'PHengLEI-xinglonghu', 'Branch_hechao', '', 'PHengLEI-xinglonghu:a8b555b51921c2444ff9d7ef703ea2c472ea0c23,', '0', 'Merge branch ActiveBranch of https://git.osredm.com/p95216308/PHengLEI into Branch_hechao ');
INSERT INTO `solver_info` VALUES ('47', 'PHengLEIv3d0_Active', '47', null, '0', '', 'hexianyao', null, null, '2022-04-05 13:05:57', 'PHengLEI-xinglonghu', 'Branch_hexianyao', '', 'PHengLEI-xinglonghu:38d961faa39132087d4a70d2dfc7d75275a0b9c6,', '0', '通过比较，增加一个参数文件InnerTrajectory.dat ');
INSERT INTO `solver_info` VALUES ('48', 'PHengLEIv3d0_Active', '48', null, '0', '', 'p95216308', null, null, '2022-04-07 11:43:16', 'PHengLEI-xinglonghu', 'ActiveBranch', '', 'PHengLEI-xinglonghu:05c67ea85de0f64b9b824fbe19d291ddc40dea94,', '0', 'Merge Branch_hexianyao into ActiveBranch ');

-- ----------------------------
-- Table structure for system_case_datas
-- ----------------------------
DROP TABLE IF EXISTS `system_case_datas`;
CREATE TABLE `system_case_datas` (
  `idsystem_case_datas` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `case_state` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `data_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `data_sign` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `data_value` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `data_range` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idsystem_case_datas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_case_datas
-- ----------------------------

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `taskid` int(50) DEFAULT NULL,
  `assignee_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `openedDate` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_info
-- ----------------------------

-- ----------------------------
-- Table structure for test_cases
-- ----------------------------
DROP TABLE IF EXISTS `test_cases`;
CREATE TABLE `test_cases` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(1000) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_cases
-- ----------------------------

-- ----------------------------
-- Table structure for testadd_info
-- ----------------------------
DROP TABLE IF EXISTS `testadd_info`;
CREATE TABLE `testadd_info` (
  `idtestadd_info` int(11) NOT NULL AUTO_INCREMENT,
  `solver_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solver_version` int(8) DEFAULT NULL,
  `case_type` int(1) DEFAULT NULL,
  `case_id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `add_state` int(1) DEFAULT '0',
  `para_diff` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`idtestadd_info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of testadd_info
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_Ecosys_My_Branch
-- ----------------------------
DROP TABLE IF EXISTS `testcases_Ecosys_My_Branch`;
CREATE TABLE `testcases_Ecosys_My_Branch` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_Ecosys_My_Branch
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_EcoSystemTesting
-- ----------------------------
DROP TABLE IF EXISTS `testcases_EcoSystemTesting`;
CREATE TABLE `testcases_EcoSystemTesting` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_EcoSystemTesting
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_FantasyCfdEcoSystem
-- ----------------------------
DROP TABLE IF EXISTS `testcases_FantasyCfdEcoSystem`;
CREATE TABLE `testcases_FantasyCfdEcoSystem` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_FantasyCfdEcoSystem
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_HyperFlowV1d0
-- ----------------------------
DROP TABLE IF EXISTS `testcases_HyperFlowV1d0`;
CREATE TABLE `testcases_HyperFlowV1d0` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_HyperFlowV1d0
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_HyperFlowV3d0
-- ----------------------------
DROP TABLE IF EXISTS `testcases_HyperFlowV3d0`;
CREATE TABLE `testcases_HyperFlowV3d0` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_HyperFlowV3d0
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_PHengLEIv2d0_Active
-- ----------------------------
DROP TABLE IF EXISTS `testcases_PHengLEIv2d0_Active`;
CREATE TABLE `testcases_PHengLEIv2d0_Active` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  `warn` varchar(2) DEFAULT 'OK',
  `result_evaluation` varchar(50) DEFAULT '',
  `result_evaluation_pre` varchar(50) DEFAULT '',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_PHengLEIv2d0_Active
-- ----------------------------
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('1', '6', '1', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_BLUSGS_TwoD_30p30n__Unstruct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('2', '6', '2', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_BLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('3', '6', '3', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_BLUSGS_TwoD_Supersonic_Circle_R0d1m__Struct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('4', '6', '4', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_FirstOrder_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('5', '6', '5', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LBM_ThreeD_LidDriven_CavityFlow_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('6', '6', '6', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LineLUSGS_ThreeD_M6_Unstruct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('7', '6', '7', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LineLUSGS_ThreeD_Rae2822_Unstruct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('8', '6', '8', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LineLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('9', '6', '9', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LowSpeedPreconTest_TwoD_30p30n_Unstruct_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('10', '6', '10', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_LowSpeedPreconTest_TwoD_NACA0012_Struct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('11', '6', '11', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_Multigrid_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('12', '6', '12', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Struct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('13', '6', '13', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Unstruct_1CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');
INSERT INTO `testcases_PHengLEIv2d0_Active` VALUES ('14', '6', '14', null, null, null, null, '2', '0', null, '', '', '', '', '/bigdata/phengleitest2/ATP/case_test/IT_UGKS_ThreeD_Cavity_Struct_8CPU/PHengLEI_Integration__32_20220401233505', '1', 'OK', '', '');

-- ----------------------------
-- Table structure for testcases_PHengLEIv2d0_Active_copy
-- ----------------------------
DROP TABLE IF EXISTS `testcases_PHengLEIv2d0_Active_copy`;
CREATE TABLE `testcases_PHengLEIv2d0_Active_copy` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_PHengLEIv2d0_Active_copy
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_PHengLEIv3d0_Active
-- ----------------------------
DROP TABLE IF EXISTS `testcases_PHengLEIv3d0_Active`;
CREATE TABLE `testcases_PHengLEIv3d0_Active` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `node` varchar(200) DEFAULT '0',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  `warn` varchar(2) DEFAULT 'OK',
  `result_evaluation_pre` varchar(50) DEFAULT '',
  `result_evaluation_ori` varchar(50) DEFAULT NULL,
  `value_withpre` varchar(255) DEFAULT NULL,
  `value_withori` varchar(255) DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_PHengLEIv3d0_Active
-- ----------------------------
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('1', '6', '1', null, '0', null, '9', '0', null, '', 'case_test/IT_BLUSGS_TwoD_30p30n__Unstruct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('2', '6', '2', null, '0', null, '9', '0', null, '', 'case_test/IT_BLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'OK', 'OK', 'res.dat:-1_-1,aircoef.dat:-1_-1,', 'res.dat:-1_-1,aircoef.dat:-1_-1,', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('3', '6', '3', null, '0', null, '9', '0', null, '', 'case_test/IT_BLUSGS_TwoD_Supersonic_Circle_R0d1m__Struct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('4', '6', '4', null, '0', null, '9', '0', null, '', 'case_test/IT_FirstOrder_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('5', '6', '5', null, '0', null, '9', '0', null, '', 'case_test/IT_LBM_ThreeD_LidDriven_CavityFlow_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('6', '6', '6', null, '0', null, '9', '0', null, '', 'case_test/IT_LineLUSGS_ThreeD_M6_Unstruct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Nores.dat', 'Error__Nores.dat', 'Error__Nores.dat', 'Error__Nores.dat', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('7', '6', '7', null, '0', null, '9', '0', null, '', 'case_test/IT_LineLUSGS_ThreeD_Rae2822_Unstruct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('8', '6', '8', null, '0', null, '9', '0', null, '', 'case_test/IT_LineLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('9', '6', '9', null, '0', null, '9', '0', null, '', 'case_test/IT_LowSpeedPreconTest_TwoD_30p30n_Unstruct_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('10', '6', '10', null, '0', null, '9', '0', null, '', 'case_test/IT_LowSpeedPreconTest_TwoD_NACA0012_Struct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('11', '6', '11', null, '0', null, '9', '0', null, '', 'case_test/IT_Multigrid_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('12', '6', '12', null, '0', null, '9', '0', null, '', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Struct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('13', '6', '13', null, '0', null, '9', '0', null, '', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Unstruct_1CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('14', '6', '14', null, '0', null, '9', '0', null, '', 'case_test/IT_UGKS_ThreeD_Cavity_Struct_8CPU/PHengLEI_Integration__32_20220401233859', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', 'Error__Nobegin', 'Error__Nobegin', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('15', '13', '1', null, '0', null, '9', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_30p30n__Unstruct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'OK', 'OK', 'res.dat:-1_-1,aircoef.dat:-1_-1,', 'res.dat:-1_-1,aircoef.dat:-1_-1,', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('16', '13', '2', null, '0', null, '9', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'OK', 'OK', 'res.dat:-1_-1,aircoef.dat:-1_-1,', 'res.dat:-1_-1,aircoef.dat:-1_-1,', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('17', '13', '3', null, '0', null, '9', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_Supersonic_Circle_R0d1m__Struct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('18', '13', '4', null, '0', null, '9', '0', null, '0', 'case_test/IT_FirstOrder_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'OK', 'OK', 'res.dat:-1_-1,aircoef.dat:-1_-1,', 'res.dat:-1_-1,aircoef.dat:-1_-1,', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('19', '13', '5', null, '0', null, '9', '0', null, '0', 'case_test/IT_LBM_ThreeD_LidDriven_CavityFlow_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('20', '13', '6', null, '0', null, '9', '0', null, '0', 'case_test/IT_LineLUSGS_ThreeD_M6_Unstruct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('21', '13', '7', null, '0', null, '9', '0', null, '0', 'case_test/IT_LineLUSGS_ThreeD_Rae2822_Unstruct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('22', '13', '8', null, '0', null, '9', '0', null, '0', 'case_test/IT_LineLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'OK', 'OK', 'res.dat:-1_-1,aircoef.dat:-1_-1,', 'res.dat:-1_-1,aircoef.dat:-1_-1,', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('23', '13', '9', null, '0', null, '9', '0', null, '0', 'case_test/IT_LowSpeedPreconTest_TwoD_30p30n_Unstruct_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('24', '13', '10', null, '0', null, '9', '0', null, '0', 'case_test/IT_LowSpeedPreconTest_TwoD_NACA0012_Struct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('25', '13', '11', null, null, null, '6', '0', null, '0', 'case_test/IT_Multigrid_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('26', '13', '12', null, '0', null, '9', '0', null, '0', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Struct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('27', '13', '13', null, null, null, '6', '0', null, '0', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Unstruct_1CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('28', '13', '14', null, null, null, '6', '0', null, '0', 'case_test/IT_UGKS_ThreeD_Cavity_Struct_8CPU/PHengLEI_Integration__39_20220407101828', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('29', '14', '1', null, null, null, '6', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_30p30n__Unstruct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('30', '14', '2', null, null, null, '2', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('31', '14', '3', null, null, null, '2', '0', null, '0', 'case_test/IT_BLUSGS_TwoD_Supersonic_Circle_R0d1m__Struct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('32', '14', '4', null, null, null, '2', '0', null, '0', 'case_test/IT_FirstOrder_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('33', '14', '5', null, null, null, '2', '0', null, '0', 'case_test/IT_LBM_ThreeD_LidDriven_CavityFlow_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('34', '14', '6', null, null, null, '2', '0', null, '0', 'case_test/IT_LineLUSGS_ThreeD_M6_Unstruct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('35', '14', '7', null, null, null, '2', '0', null, '0', 'case_test/IT_LineLUSGS_ThreeD_Rae2822_Unstruct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('36', '14', '8', null, null, null, '2', '0', null, '0', 'case_test/IT_LineLUSGS_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('37', '14', '9', null, null, null, '2', '0', null, '0', 'case_test/IT_LowSpeedPreconTest_TwoD_30p30n_Unstruct_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('38', '14', '10', null, null, null, '2', '0', null, '0', 'case_test/IT_LowSpeedPreconTest_TwoD_NACA0012_Struct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('39', '14', '11', null, null, null, '2', '0', null, '0', 'case_test/IT_Multigrid_TwoD_Rae2822_Unstruct_4CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('40', '14', '12', null, null, null, '2', '0', null, '0', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Struct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('41', '14', '13', null, null, null, '2', '0', null, '0', 'case_test/IT_TotalPressTempBC_TwoD_Plate_Subsonic_Unstruct_1CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');
INSERT INTO `testcases_PHengLEIv3d0_Active` VALUES ('42', '14', '14', null, null, null, '2', '0', null, '0', 'case_test/IT_UGKS_ThreeD_Cavity_Struct_8CPU/PHengLEI_Integration__43_20220407101927', '1', 'OK', '', null, null, null, '0');

-- ----------------------------
-- Table structure for testcases_pmb3dsolver
-- ----------------------------
DROP TABLE IF EXISTS `testcases_pmb3dsolver`;
CREATE TABLE `testcases_pmb3dsolver` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_pmb3dsolver
-- ----------------------------

-- ----------------------------
-- Table structure for testcases_system
-- ----------------------------
DROP TABLE IF EXISTS `testcases_system`;
CREATE TABLE `testcases_system` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `value_withori` varchar(250) DEFAULT NULL,
  `is_worked` int(2) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT '',
  `result_value_withori` varchar(255) DEFAULT NULL,
  `result_value_withpre` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `value_withpre` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  `warn` varchar(2) DEFAULT 'OK',
  `result_evaluation_ori` varchar(25) DEFAULT '',
  `result_evaluation_pre` varchar(25) DEFAULT '',
  `result_evaluation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_system
-- ----------------------------
INSERT INTO `testcases_system` VALUES ('1', '1', '1', null, '54530.512', null, 'res.dat:1.0,aircoef.dat:1.0,', '2', '0', '', null, '', '', 'res.dat:1.0,aircoef.dat:1.0,', '', 'c:/lxc/web/phenglei_atp/server/ATP/test1', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('2', '1', '2', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('3', '1', '3', null, '13470.828', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('4', '1', '4', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/B05_ThreeD_x38_Laminar_Unstruct_128CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('5', '1', '5', null, '0.054', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/C01_TwoD_Cylinder_Laminar_Mix_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('6', '1', '6', null, '3407.079', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/C02_TwoD_Rae2822_SST_Mix_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('7', '1', '7', null, '0', null, '', '2', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A07_TwoD_Rae2822_SST_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('8', '1', '8', null, '0', null, '', '2', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A06_ThreeD_NACA0012_SA_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('9', '1', '9', null, '92797.540', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('10', '1', '10', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/C04_ThreeD_F6-WB_SST_Mix_256CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('11', '1', '11', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('12', '1', '12', null, '67544.147', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('13', '1', '13', null, '336164.503', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('14', '1', '14', null, '15988.967', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('15', '1', '15', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/D02_ThreeD_DoubleEllipse_Laminar_HighOrder_Struct_48CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('16', '1', '16', null, '6952.183', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('17', '1', '17', null, '74715.249', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('18', '1', '18', null, '187092.659', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('19', '1', '19', null, '31104.156', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A03_TwoD_plate_SST_LowMach_Struct/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('20', '1', '20', null, '70453.455', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A09_ThreeD_M6_SST_Struct_MG2_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('21', '1', '21', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('22', '1', '22', null, '8850.775', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('23', '1', '23', null, '16228.297', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B02_TwoD_NACA4412_SA_Unstruct_2CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('24', '1', '24', null, '0', null, 'Error__Failed', '2', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A10_ThreeD_CHNT_SST_Struct_16CPU/PHengLEI_System__19_20210703144007', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('25', '1', '25', null, '4789.070', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A05_TwoD_Cylinder_Laminar_Ma8d03_Struct/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('26', '1', '26', null, '3073.389', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('27', '1', '27', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/E02_ThreeD_Cylinder_LES_Re3900_Unstruct_120CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('28', '1', '28', null, '13747.719', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('29', '1', '29', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/C03_ThreeD_M6_SST_Mix_64CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('30', '1', '30', null, '42707.447', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B01_TwoD_NACA0012_SA_Unstruct_1CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('31', '1', '31', null, '24816.822', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('32', '1', '32', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__60', '', '/home/helei/ATP/case_test/B04_ThreeD_DLR-F6_SA_Unstruct_60CPU/PHengLEI_System__19_20210703144007', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('33', '2', '1', null, '58457.889', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A08_TwoD_30p30n_SST_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('34', '2', '2', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('35', '2', '3', null, '0.665', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('36', '2', '4', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/B05_ThreeD_x38_Laminar_Unstruct_128CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('37', '2', '5', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/C01_TwoD_Cylinder_Laminar_Mix_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('38', '2', '6', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/C02_TwoD_Rae2822_SST_Mix_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('39', '2', '7', null, '6054.566', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A07_TwoD_Rae2822_SST_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('40', '2', '8', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A06_ThreeD_NACA0012_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('41', '2', '9', null, '98654.506', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('42', '2', '10', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/C04_ThreeD_F6-WB_SST_Mix_256CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('43', '2', '11', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('44', '2', '12', null, '72210.009', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('45', '2', '13', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('46', '2', '14', null, '17229.149', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('47', '2', '15', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/D02_ThreeD_DoubleEllipse_Laminar_HighOrder_Struct_48CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('48', '2', '16', null, '7608.881', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('49', '2', '17', null, '72518.933', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('50', '2', '18', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('51', '2', '19', null, '34005.642', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A03_TwoD_plate_SST_LowMach_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('52', '2', '20', null, '71734.820', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A09_ThreeD_M6_SST_Struct_MG2_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('53', '2', '21', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('54', '2', '22', null, '9410.979', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('55', '2', '23', null, '17979.881', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B02_TwoD_NACA4412_SA_Unstruct_2CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('56', '2', '24', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/A10_ThreeD_CHNT_SST_Struct_16CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('57', '2', '25', null, '5215.084', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A05_TwoD_Cylinder_Laminar_Ma8d03_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('58', '2', '26', null, '3475.593', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('59', '2', '27', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/E02_ThreeD_Cylinder_LES_Re3900_Unstruct_120CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('60', '2', '28', null, '14796.563', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('61', '2', '29', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/C03_ThreeD_M6_SST_Mix_64CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('62', '2', '30', null, '44004.498', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B01_TwoD_NACA0012_SA_Unstruct_1CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('63', '2', '31', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('64', '2', '32', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/B04_ThreeD_DLR-F6_SA_Unstruct_60CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('65', '2', '33', null, '15679.160', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B07_ThreeD_Sphere_Laminar_Unstruct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('66', '2', '34', null, '175.040', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('67', '2', '35', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/G01_TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('68', '2', '36', null, '79.875', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('69', '2', '37', null, '17.064', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/F05_ThreeD_AEDC_OversetGrid_SST_Unstruct_8CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('70', '2', '38', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F01_ThreeD_30p30n_OversetGrid_SA_Struct_4CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('71', '2', '39', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F02_ThreeD_duodan_OversetGrid_SA_Struct_8CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('72', '2', '40', null, '16.795', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/F06_ThreeD_AEDC_OversetGrid_SSTCal_Unstruct_8CPU/PHengLEI_System__20_20210716142826', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('73', '2', '41', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/G02_ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__20_20210716142826', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('74', '3', '1', null, '61950.762', null, 'res.dat:1.0,aircoef.dat:1.0,', '9', '0', '', null, '', '', 'res.dat:1.0,aircoef.dat:1.0,', '', '/home/helei/ATP/case_test/A08_TwoD_30p30n_SST_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Terrible;100.0%', 'Terrible;100.0%', null);
INSERT INTO `testcases_system` VALUES ('75', '3', '2', null, '0', null, 'Error__Les', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('76', '3', '3', null, '14330.932', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('77', '3', '5', null, '1253.384', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/C01_TwoD_Cylinder_Laminar_Mix_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('78', '3', '6', null, '0', null, null, '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/C02_TwoD_Rae2822_SST_Mix_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('79', '3', '7', null, '6858.657', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A07_TwoD_Rae2822_SST_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('80', '3', '8', null, '91311.586', null, 'res.dat:1.0,aircoef.dat:1.0,', '9', '0', '', null, '', '', 'res.dat:1.0,aircoef.dat:1.0,', '', '/home/helei/ATP/case_test/A06_ThreeD_NACA0012_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Terrible;100.0%', 'Terrible;100.0%', null);
INSERT INTO `testcases_system` VALUES ('81', '3', '9', null, '94171.670', null, '', '6', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('82', '3', '11', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('83', '3', '12', null, '72997.086', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('84', '3', '13', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('85', '3', '14', null, '17101.538', null, '', '2', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', '');
INSERT INTO `testcases_system` VALUES ('86', '3', '16', null, '7691.645', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('87', '3', '17', null, '0', null, null, '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('88', '3', '18', null, '0', null, 'Error__Nobegin', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('89', '3', '19', null, '33963.617', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A03_TwoD_plate_SST_LowMach_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('90', '3', '20', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/A09_ThreeD_M6_SST_Struct_MG2_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('91', '3', '21', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('92', '3', '22', null, '9572.945', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('93', '3', '23', null, '18396.122', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B02_TwoD_NACA4412_SA_Unstruct_2CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('94', '3', '24', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/A10_ThreeD_CHNT_SST_Struct_16CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('95', '3', '25', null, '5232.892', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A05_TwoD_Cylinder_Laminar_Ma8d03_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('96', '3', '26', null, '3389.363', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('97', '3', '28', null, '14953.817', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('98', '3', '30', null, '46104.051', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B01_TwoD_NACA0012_SA_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('99', '3', '31', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('100', '3', '33', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/B07_ThreeD_Sphere_Laminar_Unstruct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('101', '3', '34', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('102', '3', '35', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/G01_TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('103', '3', '36', null, '3.365', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('104', '3', '37', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F05_ThreeD_AEDC_OversetGrid_SST_Unstruct_8CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('105', '3', '38', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F01_ThreeD_30p30n_OversetGrid_SA_Struct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('106', '3', '39', null, '0', null, 'Error__Failed', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F02_ThreeD_duodan_OversetGrid_SA_Struct_8CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('107', '3', '40', null, '0', null, '', '6', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/F06_ThreeD_AEDC_OversetGrid_SSTCal_Unstruct_8CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('108', '3', '41', null, '0', null, 'Error__Hyflow', '9', '0', '', null, '', '', 'Error__Failed', '', '/home/helei/ATP/case_test/G02_ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Failed', 'Error__Failed', null);
INSERT INTO `testcases_system` VALUES ('109', '3', '42', null, '5198.436', null, '', '6', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B11_ThreeD_DLR-GK01_Ma7_SA_Unstruct_8CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('110', '3', '43', null, '5388.584', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B09_TwoD_plate_SA_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('111', '3', '44', null, '36143.266', null, '', '6', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B12_ThreeD_DoubleEllipse_Laminar_Unstruct_4CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('112', '3', '45', null, '0', null, 'Error__pronum', '9', '0', '', null, '', '', 'Error__Nobegin', '', '/home/helei/ATP/case_test/B06_ThreeD_Axisymmetric_SA_Unstruct_64CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'Error__Nobegin', 'Error__Nobegin', null);
INSERT INTO `testcases_system` VALUES ('113', '3', '46', null, '11113.992', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B10_ThreeD_CompRamp-16_SA_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('114', '3', '47', null, '4140.399', null, '', '9', '0', '', null, '', '', '', '', '/home/helei/ATP/case_test/B08_TwoD_Plate_Laminar_Unstruct_1CPU/PHengLEI_System__23_20210718170840', '1', 'OK', 'OK;0.0%', 'OK;0.0%', null);
INSERT INTO `testcases_system` VALUES ('115', '13', '1', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A08_TwoD_30p30n_SST_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('116', '13', '2', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('117', '13', '3', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('118', '13', '4', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B05_ThreeD_x38_Laminar_Unstruct_128CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('119', '13', '5', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C01_TwoD_Cylinder_Laminar_Mix_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('120', '13', '6', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C02_TwoD_Rae2822_SST_Mix_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('121', '13', '7', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A07_TwoD_Rae2822_SST_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('122', '13', '8', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A06_ThreeD_NACA0012_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('123', '13', '9', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('124', '13', '10', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C04_ThreeD_F6-WB_SST_Mix_256CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('125', '13', '11', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('126', '13', '12', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('127', '13', '13', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('128', '13', '14', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('129', '13', '15', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/D02_ThreeD_DoubleEllipse_Laminar_HighOrder_Struct_48CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('130', '13', '16', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('131', '13', '17', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('132', '13', '18', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('133', '13', '19', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A03_TwoD_plate_SST_LowMach_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('134', '13', '20', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A09_ThreeD_M6_SST_Struct_MG2_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('135', '13', '21', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('136', '13', '22', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('137', '13', '23', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B02_TwoD_NACA4412_SA_Unstruct_2CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('138', '13', '24', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A10_ThreeD_CHNT_SST_Struct_16CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('139', '13', '25', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A05_TwoD_Cylinder_Laminar_Ma8d03_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('140', '13', '26', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('141', '13', '27', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E02_ThreeD_Cylinder_LES_Re3900_Unstruct_120CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('142', '13', '28', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('143', '13', '29', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C03_ThreeD_M6_SST_Mix_64CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('144', '13', '30', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B01_TwoD_NACA0012_SA_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('145', '13', '31', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('146', '13', '32', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B04_ThreeD_DLR-F6_SA_Unstruct_60CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('147', '13', '33', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B07_ThreeD_Sphere_Laminar_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('148', '13', '34', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('149', '13', '35', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/G01_TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('150', '13', '36', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('151', '13', '37', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F05_ThreeD_AEDC_OversetGrid_SST_Unstruct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('152', '13', '38', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F01_ThreeD_30p30n_OversetGrid_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('153', '13', '39', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F02_ThreeD_duodan_OversetGrid_SA_Struct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('154', '13', '40', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F06_ThreeD_AEDC_OversetGrid_SSTCal_Unstruct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('155', '13', '41', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/G02_ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('156', '13', '42', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B11_ThreeD_DLR-GK01_Ma7_SA_Unstruct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('157', '13', '43', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B09_TwoD_plate_SA_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('158', '13', '44', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B12_ThreeD_DoubleEllipse_Laminar_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('159', '13', '45', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B06_ThreeD_Axisymmetric_SA_Unstruct_64CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('160', '13', '46', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B10_ThreeD_CompRamp-16_SA_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('161', '13', '47', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B08_TwoD_Plate_Laminar_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('162', '13', '48', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A16-TwoD_NLR7301_SST_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('163', '13', '49', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A17-ThreeD_Compression_Ramp-16_SA_Struct/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('164', '13', '50', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A21-ThreeD_ShockwaveInteractionPlate_Ma2_Laminar_UDB_Struct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('165', '13', '51', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A22-ThreeD_Jet_Ma3d33_SST_Struct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('166', '13', '52', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B13_ThreeD_Chnt_SA_Unstruct_100CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('167', '13', '53', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B14-TwoD_30p30n_SA_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('168', '13', '54', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B17-TwoD_Plate_S-KSR_SST_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('169', '13', '55', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E03-ThreeD_NACA0012_LES_Struct_400CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('170', '13', '56', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F08-ThreeD_Finner_Laminar_Ma2d5_Struct_16CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('171', '13', '57', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F10-ThreeD_Brid_GridDeformationRBF_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('172', '13', '58', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/X01_ThreeD_SEEBALR_Euler_Struct_8CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('173', '13', '59', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A19-ThreeD_BluntCone_Ma10d6_Laminar_Struct_64CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('174', '13', '60', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A20-ThreeD_OV102_Ma20_Laminar_H50_Struct_24CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('175', '13', '61', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A23-TwoD_Plate_S-KSR_SST_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('176', '13', '62', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B16-ThreeD_Hollow_Cylinder_Flare_Laminar_Unstruct_16CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('177', '13', '63', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_6CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('178', '13', '64', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F09-ThreeD_Brid_GridDeformationSPRING_Unstruct_1CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('179', '13', '65', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Y01_ThreeD_Chnt_SA_Unstruct_Branch_TH/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('180', '13', '66', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A18-ThreeD_Hollow_Cylinder_Flare_Laminar_Struct_16CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('181', '13', '67', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B15-TwoD_NLR7301_SA_Unstruct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('182', '13', '68', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_6CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('183', '13', '69', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F07-TwoD_NACA0012_PitchingMovement_SA_Struct_4CPU/PHengLEI_System__39_20220407101828', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('184', '14', '1', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A08_TwoD_30p30n_SST_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('185', '14', '2', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E01_ThreeD_Cylinder_LES_Re3900_Struct_120CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('186', '14', '3', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('187', '14', '4', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B05_ThreeD_x38_Laminar_Unstruct_128CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('188', '14', '5', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C01_TwoD_Cylinder_Laminar_Mix_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('189', '14', '6', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C02_TwoD_Rae2822_SST_Mix_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('190', '14', '7', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A07_TwoD_Rae2822_SST_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('191', '14', '8', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A06_ThreeD_NACA0012_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('192', '14', '9', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A12_ThreeD_DoubleEllipse_Laminar_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('193', '14', '10', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C04_ThreeD_F6-WB_SST_Mix_256CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('194', '14', '11', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('195', '14', '12', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('196', '14', '13', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A13_TwoD_BackwardStep_PressureOutlet_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('197', '14', '14', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('198', '14', '15', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/D02_ThreeD_DoubleEllipse_Laminar_HighOrder_Struct_48CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('199', '14', '16', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('200', '14', '17', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A15_ThreeD_ShockWave_PeriodicBoundary_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('201', '14', '18', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A14_TwoD_Plate_TotalPressTempBC_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('202', '14', '19', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A03_TwoD_plate_SST_LowMach_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('203', '14', '20', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A09_ThreeD_M6_SST_Struct_MG2_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('204', '14', '21', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('205', '14', '22', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Z02_ThreeD_Cylinder_LinesMonitor_Laminar_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('206', '14', '23', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B02_TwoD_NACA4412_SA_Unstruct_2CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('207', '14', '24', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A10_ThreeD_CHNT_SST_Struct_16CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('208', '14', '25', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A05_TwoD_Cylinder_Laminar_Ma8d03_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('209', '14', '26', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/D01_TwoD_Cylinder_Laminar_HighOrder_Struct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('210', '14', '27', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E02_ThreeD_Cylinder_LES_Re3900_Unstruct_120CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('211', '14', '28', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A02_TwoD_Plate_Laminar_Ma5_Struct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('212', '14', '29', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/C03_ThreeD_M6_SST_Mix_64CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('213', '14', '30', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B01_TwoD_NACA0012_SA_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('214', '14', '31', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Z01_TwoD_30p30n_ProbesMonitor_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('215', '14', '32', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B04_ThreeD_DLR-F6_SA_Unstruct_60CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('216', '14', '33', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B07_ThreeD_Sphere_Laminar_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('217', '14', '34', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('218', '14', '35', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/G01_TwoD_Cylinder_Laminar_OneTemperMode_FCW_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('219', '14', '36', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('220', '14', '37', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F05_ThreeD_AEDC_OversetGrid_SST_Unstruct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('221', '14', '38', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F01_ThreeD_30p30n_OversetGrid_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('222', '14', '39', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F02_ThreeD_duodan_OversetGrid_SA_Struct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('223', '14', '40', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F06_ThreeD_AEDC_OversetGrid_SSTCal_Unstruct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('224', '14', '41', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/G02_ThreeD_Electre_Laminar_OneTemperMode_NCW_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('225', '14', '42', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B11_ThreeD_DLR-GK01_Ma7_SA_Unstruct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('226', '14', '43', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B09_TwoD_plate_SA_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('227', '14', '44', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B12_ThreeD_DoubleEllipse_Laminar_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('228', '14', '45', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B06_ThreeD_Axisymmetric_SA_Unstruct_64CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('229', '14', '46', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B10_ThreeD_CompRamp-16_SA_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('230', '14', '47', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B08_TwoD_Plate_Laminar_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('231', '14', '48', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A16-TwoD_NLR7301_SST_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('232', '14', '49', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A17-ThreeD_Compression_Ramp-16_SA_Struct/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('233', '14', '50', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A21-ThreeD_ShockwaveInteractionPlate_Ma2_Laminar_UDB_Struct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('234', '14', '51', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A22-ThreeD_Jet_Ma3d33_SST_Struct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('235', '14', '52', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B13_ThreeD_Chnt_SA_Unstruct_100CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('236', '14', '53', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B14-TwoD_30p30n_SA_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('237', '14', '54', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B17-TwoD_Plate_S-KSR_SST_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('238', '14', '55', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/E03-ThreeD_NACA0012_LES_Struct_400CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('239', '14', '56', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F08-ThreeD_Finner_Laminar_Ma2d5_Struct_16CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('240', '14', '57', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F10-ThreeD_Brid_GridDeformationRBF_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('241', '14', '58', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/X01_ThreeD_SEEBALR_Euler_Struct_8CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('242', '14', '59', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A19-ThreeD_BluntCone_Ma10d6_Laminar_Struct_64CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('243', '14', '60', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A20-ThreeD_OV102_Ma20_Laminar_H50_Struct_24CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('244', '14', '61', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A23-TwoD_Plate_S-KSR_SST_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('245', '14', '62', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B16-ThreeD_Hollow_Cylinder_Flare_Laminar_Unstruct_16CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('246', '14', '63', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F04_TwoD_Dual0012_OversetGrid_InvisCal_Unstruct_6CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('247', '14', '64', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F09-ThreeD_Brid_GridDeformationSPRING_Unstruct_1CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('248', '14', '65', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/Y01_ThreeD_Chnt_SA_Unstruct_Branch_TH/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('249', '14', '66', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/A18-ThreeD_Hollow_Cylinder_Flare_Laminar_Struct_16CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('250', '14', '67', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/B15-TwoD_NLR7301_SA_Unstruct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('251', '14', '68', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F03_TwoD_Dual0012_OversetGrid_Invis_Unstruct_6CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);
INSERT INTO `testcases_system` VALUES ('252', '14', '69', null, null, null, null, '2', '0', '', null, '', '', '', '', 'case_test/F07-TwoD_NACA0012_PitchingMovement_SA_Struct_4CPU/PHengLEI_System__43_20220407101926', '1', 'OK', '', '', null);

-- ----------------------------
-- Table structure for testcases_system_cdcloud
-- ----------------------------
DROP TABLE IF EXISTS `testcases_system_cdcloud`;
CREATE TABLE `testcases_system_cdcloud` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `result_files` varchar(150) DEFAULT NULL,
  `is_worked` int(2) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  `warn` varchar(2) DEFAULT 'OK',
  `result_evaluation_pre` varchar(25) DEFAULT '',
  `result_evaluation_ori` varchar(25) DEFAULT '',
  `value_withpre` varchar(250) DEFAULT '',
  `value_withori` varchar(250) DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_system_cdcloud
-- ----------------------------
INSERT INTO `testcases_system_cdcloud` VALUES ('115', '6', '1', null, '0', null, '9', '0', '', '', 'case_test/A08_TwoD_30p30n_SST_Struct_4CPU/PHengLEI_System__32_20220330133709', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_system_cdcloud` VALUES ('117', '6', '3', null, '0', null, '9', '0', '', '', 'case_test/B03_TwoD_Rae2822_SA_Unstruct_1CPU/PHengLEI_System__32_20220330133709', '1', 'OK', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', 'Error__NoOri', '0');
INSERT INTO `testcases_system_cdcloud` VALUES ('123', '6', '12', null, '0', null, '9', '0', '', '', 'case_test/A11_ThreeD_Sphere_Laminar_Ma10_Struct/PHengLEI_System__32_20220330133709', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');
INSERT INTO `testcases_system_cdcloud` VALUES ('125', '6', '14', null, '0', null, '9', '0', '', '', 'case_test/A01_TwoD_Plate_Laminar_Struct_1CPU/PHengLEI_System__32_20220330133709', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '2');
INSERT INTO `testcases_system_cdcloud` VALUES ('126', '6', '16', null, '0', null, '9', '0', '', '', 'case_test/A04_TwoD_Plate_SST_Ma5_Struct_1CPU/PHengLEI_System__32_20220330133709', '1', 'OK', 'Error__Failed', 'Error__Failed', 'Error__Failed', 'Error__Failed', '0');

-- ----------------------------
-- Table structure for testcases_unit
-- ----------------------------
DROP TABLE IF EXISTS `testcases_unit`;
CREATE TABLE `testcases_unit` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `case_id` int(5) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` varchar(20) DEFAULT NULL,
  `configs` varchar(500) DEFAULT NULL,
  `result_value` varchar(250) DEFAULT NULL,
  `is_worked` int(1) DEFAULT NULL,
  `currentProgress` varchar(3) DEFAULT '0',
  `para_diff` varchar(45) DEFAULT NULL,
  `result_value2` varchar(150) DEFAULT '',
  `state` varchar(500) DEFAULT '',
  `result_value_toVersion` varchar(250) DEFAULT '',
  `node` varchar(200) DEFAULT '',
  `project_dirpath` varchar(150) DEFAULT NULL,
  `enable` varchar(1) DEFAULT '1',
  `warn` varchar(2) DEFAULT 'OK',
  `result_evaluation` varchar(15) DEFAULT '',
  `result_evaluation_pre` varchar(15) DEFAULT '',
  PRIMARY KEY (`test_case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcases_unit
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `iduser_info` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_pwd` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gitPros` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Token_Sign` int(1) DEFAULT '0',
  `update_Sign` int(3) DEFAULT '0',
  `online_Sign` int(1) DEFAULT '0',
  `gitGroup` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Merge_Sign` int(1) DEFAULT '0',
  `Check_Sign` int(1) NOT NULL DEFAULT '0',
  `online_time` datetime DEFAULT NULL,
  `DataStruct` int(2) DEFAULT '0',
  `ProjectHashs` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iduser_info`,`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'helei', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_helei-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('2', 'hexianyao', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_hexianyao-o-PHengLEI-xinglonghu-o-47-o-38d961faa39132087d4a70d2dfc7d75275a0b9c6');
INSERT INTO `user_info` VALUES ('3', 'hekun', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_hekun-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('4', 'hechao', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_hechao-o-PHengLEI-xinglonghu-o-46-o-a8b555b51921c2444ff9d7ef703ea2c472ea0c23');
INSERT INTO `user_info` VALUES ('5', 'wanyunbo', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_wanyunbo-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('6', 'mengliyuan', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_mengliyuan-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('7', 'xugang', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_xugang-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('8', 'xiaohan', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_xiaohan-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');
INSERT INTO `user_info` VALUES ('9', 'zhangyong', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_zhangyong-o-PHengLEI-xinglonghu-o-39-o-5d466ec553564c5cba29c7a94cb7c7fde11a8a21');
INSERT INTO `user_info` VALUES ('10', 'zhangzipei', null, 'PHengLEI-xinglonghu，', '0', '0', '0', null, '0', '0', null, '0', 'Branch_zhangzipei-o-PHengLEI-xinglonghu-o-0-o-a461ea11a5818f3555673b50d1a2bb85dc05d7a7');

-- ----------------------------
-- Table structure for work_state
-- ----------------------------
DROP TABLE IF EXISTS `work_state`;
CREATE TABLE `work_state` (
  `idwork_state` int(11) NOT NULL,
  `work_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`idwork_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of work_state
-- ----------------------------

-- ----------------------------
-- Table structure for worktime_info
-- ----------------------------
DROP TABLE IF EXISTS `worktime_info`;
CREATE TABLE `worktime_info` (
  `idworktime_info` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `time_lap` float DEFAULT NULL,
  `time_section` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workTime` float DEFAULT NULL,
  PRIMARY KEY (`idworktime_info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of worktime_info
-- ----------------------------
