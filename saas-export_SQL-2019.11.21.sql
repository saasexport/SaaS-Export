/*
 Navicat Premium Data Transfer

 Source Server         : 本地库GC
 Source Server Type    : MySQL
 Source Server Version : 50549
 Source Host           : localhost:3306
 Source Schema         : saas-export

 Target Server Type    : MySQL
 Target Server Version : 50549
 File Encoding         : 65001

 Date: 21/11/2019 20:10:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for co_contract
-- ----------------------------
DROP TABLE IF EXISTS `co_contract`;
CREATE TABLE `co_contract`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `offeror` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signing_date` datetime NULL DEFAULT NULL,
  `input_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inspector` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `crequest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_time` datetime NOT NULL,
  `import_num` decimal(11, 0) NULL DEFAULT NULL COMMENT '打印时标识几个星,对应说明中的内容\\r\\n            不能存储特殊字符星星，jstl判断失效',
  `delivery_period` datetime NOT NULL,
  `old_state` int(11) NULL DEFAULT NULL COMMENT '归档前状态, 方便回退',
  `out_state` int(11) NULL DEFAULT NULL COMMENT '0未走货 1部分 2全部\\r\\n            \\r\\n            归档后, 其他选择合同的地方均去除.\\r\\n            表示合同已完成, 不论是否合同的货物是否全部真的走完, 因为有赔付等其他情况',
  `trade_terms` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `print_style` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宽2:一页两个货物  窄1:一页一个货物',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state` int(11) NULL DEFAULT NULL COMMENT '0草稿 1已上报待报运\\r\\n            \\r\\n            归档后, 其他选择合同的地方均去除.\\r\\n            表示合同已完成, 不论是否合同的货物是否全部真的走完, 因为有赔付等其他情况',
  `pro_num` int(11) NULL DEFAULT 0 COMMENT '货物数量',
  `ext_num` int(11) NULL DEFAULT 0 COMMENT '附件数量',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_dept` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_contract
-- ----------------------------
INSERT INTO `co_contract` VALUES ('23d1d889-15a2-435a-893a-6c39edb63dcd', '111111111111111111111', '1111111111111111111111111', '2019-10-29 00:00:00', '1', '2222', '1', 367.00, '2222', '1', '2019-10-30 00:00:00', 3, '2019-11-08 00:00:00', NULL, NULL, '2', '2', '2', 0, 2, 67, NULL, NULL, '2019-11-11 13:55:14', NULL, '2019-11-11 13:55:14', '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract` VALUES ('2c90c5004ad63735014ad6d204060005', 'it黑马', '合同号：B', '2018-01-02 00:00:00', 'lw', 'lw', 'lw', 2032.00, 'lw', '客户名称B', '2015-01-11 00:00:00', 3, '2015-01-11 00:00:00', NULL, NULL, 'FOB', '2', 'lwlwlw', 2, 48, 3, 'e041f064-b115-4e19-b76e-b515d1fc1fa9', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2015-01-11 10:28:15', '002108e2-9a10-4510-9683-8d8fd1d374ef', '2019-03-23 22:08:58', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a3357462e0133591b86ec0002', '陕西杰信商务发展有限公司', 'C/3817/11', '2011-10-31 00:00:00', '杨丽', NULL, '吕晓波', 5932.80, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'BEAKIE LEE', '2015-01-10 19:55:08', 1, '2015-10-21 11:07:25', NULL, NULL, NULL, '2', NULL, 2, 0, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a3357462e01336cc0877b0010', '陕西杰信商务发展有限公司', '11JK1080', '2011-11-04 00:00:00', '杨丽', NULL, '吕晓波', 2318.40, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', NULL, '2015-01-10 19:55:08', 3, '2011-12-10 00:00:00', NULL, NULL, NULL, '1', '待样品确认后方可安排生产', 2, 0, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a3357462e01336d3a0be10014', '陕西杰信商务发展有限公司', '11JK1078', '2011-11-04 00:00:00', '杨丽', NULL, '李春光', 54060.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', NULL, '2015-01-10 19:55:08', 3, '2011-11-15 00:00:00', NULL, NULL, NULL, '2', NULL, 1, 0, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a3357462e01336d523195001a', '陕西杰信商务发展有限公司', 'C/3847/11', '2011-12-02 00:00:00', '杨丽', NULL, '李春光', 39240.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'HOME', '2015-01-10 19:55:08', 3, '2015-10-21 11:07:25', NULL, NULL, NULL, '2', NULL, 2, 9, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33812ffd0133813f25940001', '陕西杰信商务发展有限公司', 'C/3861/11', '2011-11-08 00:00:00', '杨丽', NULL, '吕晓波', 176238.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'HOME', '2015-01-10 19:55:08', 3, '2012-01-10 00:00:00', NULL, NULL, NULL, '2', NULL, 2, 31, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33812ffd013382048ff80024', '陕西杰信商务发展有限公司', '11JK1082', '2011-11-08 00:00:00', '杨丽', NULL, '李春光', 13656.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'MSA', '2015-01-10 19:55:08', 3, '2011-12-30 00:00:00', NULL, NULL, NULL, '2', NULL, 2, 1, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33812ffd0133821a8eb5002b', '陕西杰信商务发展有限公司', '11JK1084', '2011-11-08 00:00:00', '杨丽', NULL, '李春光', 10936.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'ONE WORLD', '2015-01-10 19:55:08', 3, '2011-12-20 00:00:00', NULL, NULL, NULL, '2', NULL, 2, 4, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33d4f8b40133d9878e88000d', '陕西杰信商务发展有限公司', '11JK1070', '2011-12-20 00:00:00', '杨丽', NULL, NULL, 39248.20, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', NULL, '2015-01-10 19:55:08', 3, '2011-11-05 00:00:00', NULL, NULL, NULL, '2', NULL, 2, 10, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33d4f8b40133d991a50d0019', '陕西杰信商务发展有限公司', '11JK1066', '2011-11-25 00:00:00', '杨丽', NULL, '李春光', 146184.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', NULL, '2015-01-10 19:55:08', 3, '2011-12-05 00:00:00', NULL, NULL, NULL, '2', '待样品确认后方可安排生产', 0, 13, 0, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33d4f8b40133d9bea39b002f', '陕西杰信商务发展有限公司', '11JK1060', '2011-11-25 00:00:00', '杨丽', NULL, NULL, 165572.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'COACH HOUSE', '2015-01-10 19:55:08', 3, '2015-10-21 11:07:25', NULL, NULL, NULL, '2', NULL, 0, 12, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33fc4e280133fd81e7d7001d', '陕西杰信商务发展有限公司', '11JK1068', '2011-10-14 00:00:00', '杨丽', NULL, NULL, 103577.30, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'ELAD', '2015-01-10 19:55:08', 3, '2015-10-21 11:07:25', NULL, NULL, NULL, '2', NULL, 0, 11, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a33fc4e280133fd9f8b4e002f', '陕西杰信商务发展有限公司', '11JK1072', '2011-12-20 00:00:00', '杨丽', NULL, NULL, 100799.60, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'BRISSI', '2015-01-10 19:55:08', 3, '2015-10-21 11:07:25', NULL, NULL, NULL, '2', NULL, 2, 13, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a3420e78a013421a693730001', '陕西杰信商务发展有限公司', 'C/4040/11', '2011-12-09 00:00:00', '杨丽', NULL, '李春光', 123400.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'HOME', '2015-01-10 19:55:08', 1, '2012-02-15 00:00:00', NULL, NULL, NULL, '2', NULL, 2, 29, 1, NULL, NULL, '2015-09-02 00:00:00', NULL, '2015-09-02 00:00:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028817a353b8d8e01353d15008d0046', '陕西杰信商务发展有限公司', 'C/4104/11', '2015-01-10 19:55:08', '杨丽', NULL, NULL, 39753.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ', 'HOME', '2015-01-10 19:55:08', 3, '2015-01-10 19:55:08', NULL, NULL, 'T/T', '2', NULL, 2, 22, 1, NULL, NULL, '2015-01-10 19:55:08', NULL, '2015-01-10 19:55:08', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028828660b1cd900160b1cebb440000', 'ZBZ_59', 'ZBZ_59', '2017-11-26 00:00:00', 'ZBZ_59', 'ZBZ_59', 'ZBZ_59', 20.00, 'ZBZ_59', 'ZBZ_59', '2017-09-19 00:00:00', 3, '2017-09-12 00:00:00', NULL, NULL, 'FOB', '2', 'ZBZ_59', 2, 1, 0, NULL, NULL, '2018-01-01 21:00:03', NULL, '2018-01-01 21:00:03', '1', NULL);
INSERT INTO `co_contract` VALUES ('40288287616082eb0161608728560000', 'xiaoxiao001', 'xiaoxiao001', '2018-02-15 00:00:00', 'xiaoxiao001', 'xiaoxiao001', 'xiaoxiao001', 10.00, 'xiaoxiao001', 'xiaoxiao001', '2018-02-26 00:00:00', 3, '2018-02-21 00:00:00', NULL, NULL, 'FOB', '2', 'xiaoxiao001', 0, 1, 0, NULL, NULL, '2018-02-04 19:15:25', NULL, '2018-02-04 19:15:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('40288287616082eb0161608805650001', 'xiaosan002', 'xiaosan002', '2018-02-05 00:00:00', 'xiaosan002', 'xiaosan002', 'xiaosan002', 30.00, 'xiaosan002', 'xiaosan002', '2018-02-06 00:00:00', 3, '2018-02-06 00:00:00', NULL, NULL, 'xiaosan002', '2', 'xiaosan002', 0, 2, 0, NULL, NULL, '2018-02-04 19:16:22', NULL, '2018-02-04 19:16:22', '1', NULL);
INSERT INTO `co_contract` VALUES ('40288287616a411e01616ab546270006', 'cy001', 'cy001', '2018-02-05 00:00:00', 'cy001', 'cy001', 'cy001', 251.00, 'cy001', 'cy001', '2018-02-19 00:00:00', 3, '2018-02-19 00:00:00', NULL, NULL, 'FOB', '2', 'cy001', 2, 2, 1, '7a02a732-f5b5-4a9e-8e40-2e04d0fc66e5', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2018-02-06 18:42:00', NULL, '2018-02-06 18:42:00', '1', NULL);
INSERT INTO `co_contract` VALUES ('40288287616a411e01616ab60a0e0007', 'cy002', 'cy002', '2018-02-05 00:00:00', 'cy002', 'cy002', 'cy002', 0.00, 'cy002', 'cy002', '2018-02-05 00:00:00', 3, '2018-02-12 00:00:00', NULL, NULL, 'FOB', '2', 'cy002', 1, 0, 0, '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2018-02-06 18:42:50', NULL, '2018-02-06 18:42:50', '1', NULL);
INSERT INTO `co_contract` VALUES ('402895c2515129200151514376b80002', 'F', 'F', '2015-01-10 19:55:08', 'F', 'F', 'F', 121.00, 'F', 'F', '2015-01-10 19:55:08', 3, '2015-01-10 19:55:08', NULL, NULL, 'F', '2', 'F', 0, 1, 0, NULL, NULL, '2015-01-10 19:55:08', NULL, '2015-01-10 19:55:08', '1', NULL);
INSERT INTO `co_contract` VALUES ('402899d65088203101508831e1e60000', '中华烟草集团', 'xx-01-xxx-02', '2015-01-10 19:55:08', '郭中华', '郭中华', '郭尔获', 0.00, NULL, 'xx', '2015-10-20 00:00:00', 3, '2015-10-20 00:00:00', NULL, NULL, NULL, '2', NULL, NULL, 0, 0, NULL, NULL, '2015-10-21 10:19:41', NULL, '2015-10-21 10:19:41', '1', NULL);
INSERT INTO `co_contract` VALUES ('402899d650885c420150885d95cb0000', 'J2302', 'J2302', '2015-10-21 10:19:41', 'J2302', 'J2302', 'J2302', 1000.00, 'J2302', 'J2302', '2015-10-21 10:19:41', 3, '2015-10-21 10:19:41', NULL, NULL, 'FOB', '2', 'J2302', 0, 1, 0, '71a5a695-0ba5-4f0d-a0b5-0a304efde944', '4028827c4fb6202a014fb6209c730000', '2015-10-21 11:07:25', NULL, '2015-10-21 11:07:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('402899d650885c420150885e918e0001', 'J24', 'J24', '2015-10-21 11:07:25', 'J24', 'J24', 'J24', 0.00, 'J24', 'J24', '2015-10-21 11:07:25', 3, '2015-10-21 11:07:25', NULL, NULL, 'T/T', '2', 'J24', 0, 0, 0, '424b2d01-d812-4f30-be40-dcda14110118', '4028827c4fb6202a014fb6209c730000', '2015-10-21 11:07:25', NULL, '2015-10-21 11:07:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028a9bd515b2e8201515b3339860000', 'C1', 'C1', '2015-10-21 11:07:25', 'C1', 'C1', 'C1', 100.00, 'C1', 'C1', '2015-10-21 11:07:25', 3, '2015-10-21 11:07:25', NULL, NULL, 'T/T', '2', 'C1', 0, 1, 0, '5758571d-93c6-48f0-9e67-20a442779531', '4028827c4fb645b0014fb64668550000', '2015-12-01 09:41:02', NULL, '2015-10-21 11:07:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028a9bd515b3be301515b3d676f0000', 'D1', 'D1', '2015-10-21 11:07:25', 'D1', 'D1', 'D1', 0.00, 'D1', 'D1', '2015-10-21 11:07:25', 3, '2015-10-21 11:07:25', NULL, NULL, 'L/C', '2', 'D1', 1, 0, 0, '6f9f16c8-827b-4cc8-9e20-210aa82d1fcf', '4028827c4fb645b0014fb64668550000', '2015-10-21 11:07:25', NULL, '2015-10-21 11:07:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('4028d3cf567275410156734fb6480000', 'CS', 'CS', '2016-08-01 00:00:00', 'CS', 'CS', 'CS', 0.00, '测试', 'CS', '2016-08-29 00:00:00', 3, '2016-08-22 00:00:00', NULL, NULL, 'FOB', '2', '测试', 0, 0, 0, 'e0de22fe-2c50-4216-ad75-ed0494d2dc92', '4028827c4fb6202a014fb6209c730000', '2016-08-10 15:16:59', NULL, '2016-08-10 15:16:59', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e81015acf673a015acf6dc97e0000', 'AOP05', 'AOP05', '2017-03-13 00:00:00', 'AOP05', 'AOP05', 'AOP05', 0.00, 'AOP05', 'AOP05', '2017-02-28 00:00:00', 3, '2017-03-20 00:00:00', NULL, NULL, 'FOB', '2', 'AOP05', 2, 0, 0, '6764e5a1-45e5-4229-a72a-7c5d72209b15', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2017-03-15 08:46:03', NULL, '2017-03-15 08:46:03', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e81ec5ac06f0d015ac06fbb850000', 'sz059', 'sz052', '2017-02-27 00:00:00', 'sz053', 'sz058', 'sz054', 1200.00, 'sz056', 'sz051', '2017-02-28 00:00:00', 3, '2017-03-21 00:00:00', NULL, NULL, 'FOB5', '2', 'sz057', 0, 5, 0, NULL, NULL, '2017-03-12 10:53:52', NULL, '2017-03-12 10:53:52', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e840159aa01770159aa3625310001', 'OOP41', 'OOP41', '2017-01-09 00:00:00', 'OOP41', 'OOP41', 'OOP41', 0.00, 'OOP41', 'OOP41', '2017-01-17 00:00:00', 3, '2017-01-24 00:00:00', NULL, NULL, 'FOB', '2', 'OOP41', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2017-01-17 10:16:32', NULL, '2017-01-17 10:16:32', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e840159aa01770159aa3a8ff70002', 'OOP4102', 'OOP4102', '2017-01-18 00:00:00', 'OOP4102', 'OOP4102', 'OOP4102', 0.00, 'OOP4102', 'OOP4102', '2017-01-16 00:00:00', 3, '2017-01-23 00:00:00', NULL, NULL, 'FOB', '2', 'OOP4102', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2017-01-17 10:21:21', NULL, '2017-01-17 10:21:21', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e840159aa01770159aa3b43170003', 'AOP41', 'AOP41', '2017-01-04 00:00:00', 'AOP41', 'AOP41', 'AOP41', 0.00, 'AOP41', 'AOP41', '2017-01-04 00:00:00', 3, '2017-01-24 00:00:00', NULL, NULL, 'FOB', '2', 'AOP41', 0, 0, 0, '6764e5a1-45e5-4229-a72a-7c5d72209b15', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2017-01-17 10:22:07', NULL, '2017-01-17 10:22:07', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e84105823102a01582310fcd70000', 'FFFFB', 'FFFFB', '2016-11-01 00:00:00', 'FFFFB', 'FFFFB', 'FFFFB', 85.00, 'FFFFB', 'FFFFB', '2016-11-03 00:00:00', 3, '2016-11-02 00:00:00', NULL, NULL, 'FOB', '2', 'FFFFB', 0, 1, 8, NULL, NULL, '2016-11-02 11:24:25', NULL, '2016-11-02 11:24:25', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e84175884728c0158848d37230000', 'OOP001', 'OOP001', '2016-11-08 00:00:00', 'OOP001', 'OOP001', 'OOP001', 0.00, 'OOP001', 'OOP001', '2016-11-08 00:00:00', 3, '2016-11-28 00:00:00', NULL, NULL, 'FOB', '2', 'OOP001', 0, 0, 0, NULL, NULL, '2016-11-21 09:43:17', NULL, '2016-11-21 09:43:17', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e84175884728c0158848fffa50001', 'OOP002', 'OOP002', '2016-11-08 00:00:00', 'OOP002', 'OOP002', 'OOP002', 0.00, 'OOP002', 'OOP002', '2016-11-01 00:00:00', 3, '2016-11-29 00:00:00', NULL, NULL, 'FOB', '2', 'OOP002', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-11-21 09:46:19', NULL, '2016-11-21 09:46:19', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e8419593ddcf901593e0b20ed0000', 'OOP232', 'OOP232', '2016-12-12 00:00:00', 'OOP232', 'OOP232', 'OOP232', 0.00, 'OOP232', 'OOP232', '2016-12-12 00:00:00', 3, '2016-12-27 00:00:00', NULL, NULL, 'FOB', '2', 'OOP232', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-12-27 10:10:33', NULL, '2016-12-27 10:10:33', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e8419593e0df101593e0f81780000', 'OOP23201', 'OOP23201', '2016-12-13 00:00:00', 'OOP23201', 'OOP23201', 'OOP23201', 0.00, 'OOP23201', 'OOP23201', '2016-12-14 00:00:00', 3, '2016-12-21 00:00:00', NULL, NULL, 'FOB', '2', 'OOP23201', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-12-27 10:15:20', NULL, '2016-12-27 10:15:20', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e8419593e0df101593e10341b0001', 'AOP232', 'AOP232', '2016-12-13 00:00:00', 'AOP232', 'AOP232', 'AOP232', 0.00, 'AOP232', 'AOP232', '2016-12-06 00:00:00', 3, '2016-12-19 00:00:00', NULL, NULL, 'FOB', '2', 'AOP232', 0, 0, 0, '6764e5a1-45e5-4229-a72a-7c5d72209b15', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-12-27 10:16:06', NULL, '2016-12-27 10:16:06', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e84215827fe1b015828058c360001', 'AOP', 'AOP', '2016-11-22 00:00:00', 'AOP', 'AOPAOP', 'AOP', 30.00, 'AOP', 'AOP', '2016-11-08 00:00:00', 3, '2016-11-29 00:00:00', NULL, NULL, 'L/C', '2', 'AOP', 1, 2, 0, '6764e5a1-45e5-4229-a72a-7c5d72209b15', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-11-03 10:30:02', NULL, '2016-11-03 10:30:02', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e845158dc48ec0158dc49ce140000', 'WWWW', 'C34543543', '2016-12-20 00:00:00', 'YYYYY02', 'QQQQ', 'ZZZZ03', 900.00, 'SSSS05', 'XXXX01', '2016-12-13 00:00:00', 3, '2016-12-28 00:00:00', NULL, NULL, 'FOB04', '2', 'AAAAA', 2, 1, 0, NULL, NULL, '2016-12-08 10:36:14', NULL, '2016-12-08 10:36:14', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e845a58e13c3a0158e156b9210000', 'OOP003', 'OOP003', '2016-12-05 00:00:00', 'OOP003', 'OOP003', 'OOP003', 0.00, 'OOP003', 'OOP003', '2016-12-05 00:00:00', 3, '2016-12-21 00:00:00', NULL, NULL, 'FOB', '2', 'OOP003', 0, 0, 0, '6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '2016-12-09 10:08:26', NULL, '2016-12-09 10:08:26', '1', NULL);
INSERT INTO `co_contract` VALUES ('8a7e84fc587a6c8501587a6d3ed70000', 'JK359', 'JK352', '2016-11-15 00:00:00', 'JK353', 'JK358', 'JK354', 600.00, 'JK356', 'JK351', '2016-11-15 00:00:00', 3, '2016-11-22 00:00:00', NULL, NULL, 'FOB5', '2', 'JK357', 1, 0, 0, NULL, NULL, '2016-11-19 10:32:09', NULL, '2016-11-19 10:32:09', '1', NULL);
INSERT INTO `co_contract` VALUES ('ab73300a-c47e-47dc-8e91-71050d7227ae', '收购方2', '22', '2019-11-02 00:00:00', '2', '222', '2', NULL, '22', '2', '2019-11-27 00:00:00', 3, '2019-11-13 00:00:00', NULL, NULL, 'FOB', '1', '222', NULL, 0, 0, '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-11-14 10:29:29', NULL, '2019-11-14 10:29:29', '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract` VALUES ('C2C011E96CC3451DAD181AF3372CB80D', 'context', 'context', '2017-11-26 00:00:00', 'context', 'context', 'context', 1.00, 'context', 'context', '2017-12-26 00:00:00', 3, '2018-01-23 00:00:00', NULL, NULL, 'FOB', '2', 'context', 0, 1, 0, '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-03-24 15:30:46', NULL, '2019-03-24 15:30:46', '1', NULL);
INSERT INTO `co_contract` VALUES ('D6E89C7A141B44219F16B6CA6791B64E', 'WWWW1', 'C345435431', '2017-11-26 00:00:00', 'xiaosan001', 'xiaosan001', 'xiaosan001', 0.00, 'aaaa', 'xiaosan001', '2017-12-19 00:00:00', 2, '2018-01-22 00:00:00', NULL, NULL, 'FOB', '2', 'aaa', 0, 0, 0, '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-03-23 22:04:44', NULL, '2019-03-23 22:04:44', '1', NULL);
INSERT INTO `co_contract` VALUES ('da3bee51-2dc5-440a-b1f8-98d36d49dc16', '小明', 'abc111', '2019-11-01 00:00:00', '小红', '小高', '小李', 121.00, '1', '金三胖', '2019-10-31 00:00:00', 3, '2019-11-06 00:00:00', NULL, NULL, 'FOB', '1', '1', NULL, 11, 0, NULL, NULL, '2019-11-11 23:23:20', NULL, '2019-11-11 23:23:20', '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract` VALUES ('FC8A89AD11CD426BA7045A20F3E2E95A', '12', '2', '2017-12-04 00:00:00', '3', '4', '5', 0.00, 'aaaa6', '7', '2018-01-22 00:00:00', NULL, '2018-01-22 00:00:00', NULL, NULL, 'FOB', '1', '', 0, 0, 0, '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-03-23 22:07:56', '002108e2-9a10-4510-9683-8d8fd1d374ef', '2019-03-23 22:08:13', '1', NULL);
INSERT INTO `co_contract` VALUES ('ff8080816077bbb3016077bd30b10000', 'WWWW17', 'C34543543122', '2017-11-26 00:00:00', 'YYYYY02123', 'QQQQ18', 'ZZZZ03124', 65.00, 'asas6', 'XXXX01111', '2017-12-19 00:00:00', 3, '2017-12-27 00:00:00', NULL, NULL, 'FOB0415', '1', 'asas9', 2, 3, 1, NULL, NULL, '2017-12-21 14:22:55', NULL, '2017-12-21 14:22:55', '1', NULL);
INSERT INTO `co_contract` VALUES ('ff80808160bab4fa0160bb1b7a4a0007', 'bj002', 'bj002', '2018-01-01 00:00:00', 'bj002', 'bj002', 'bj002', 0.00, 'bj002', 'bj002', '2018-01-29 00:00:00', 3, '2018-01-30 00:00:00', NULL, NULL, 'FOB', '2', 'bj002', 0, 0, 0, 'faa59d6e-2e04-4972-bd4f-fd946ba38b99', '100101', '2018-01-03 16:20:28', NULL, '2018-01-03 16:20:28', '1', NULL);
INSERT INTO `co_contract` VALUES ('ff80808160bab4fa0160bb1d6e760008', 'bj001', 'bj001', '2018-01-10 00:00:00', 'bj001', 'bj001', 'bj001', 10.00, 'bj001', 'bj001', '2018-01-22 00:00:00', 3, '2018-01-23 00:00:00', NULL, NULL, 'FOB', '2', 'bj001', 0, 1, 0, '6bbf3016-54ab-4ab2-b0d3-2d6622ac17eb', '100101', '2018-01-03 16:22:36', NULL, '2018-01-03 16:22:36', '1', NULL);
INSERT INTO `co_contract` VALUES ('ff80808160bab4fa0160bb1e01c50009', 'sy001', 'sy001', '2018-01-02 00:00:00', 'sy001', 'sy001', 'sy001', 891.00, 'sy001', 'sy001', '2018-01-29 00:00:00', 3, '2018-01-29 00:00:00', NULL, NULL, 'sy001', '2', 'sy001', 0, 9, 0, '84b4a1c0-fb52-4fd5-b410-5db1c933d146', '100101101', '2018-01-03 16:23:14', NULL, '2018-01-03 16:23:14', '1', NULL);

-- ----------------------------
-- Table structure for co_contract_product
-- ----------------------------
DROP TABLE IF EXISTS `co_contract_product`;
CREATE TABLE `co_contract_product`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contract_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factory_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factory_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '冗余',
  `product_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loading_rate` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报运：x/y',
  `box_num` decimal(11, 0) NULL DEFAULT NULL COMMENT '报运',
  `packing_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PCS/SETS',
  `cnumber` decimal(11, 0) NULL DEFAULT NULL,
  `out_number` decimal(11, 0) NULL DEFAULT NULL COMMENT '报运',
  `finished` decimal(11, 0) NULL DEFAULT NULL COMMENT '报运',
  `product_request` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动计算: 数量x单价',
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SYS_C005432`(`contract_id`) USING BTREE,
  INDEX `SYS_C005433`(`factory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同货物表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_contract_product
-- ----------------------------
INSERT INTO `co_contract_product` VALUES ('064a0de9-f890-4390-ac8b-42259bf7e45c', '23d1d889-15a2-435a-893a-6c39edb63dcd', NULL, '升华', 'xx002', NULL, '真的', '10.0', 2, 'PCS', 1, NULL, NULL, '很不错', 5.00, 5.00, NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('297ef1745ac32223015ac322f1f50000', '8a7e81ec5ac06f0d015ac06fbb850000', '10', '晶晨', '1111', '01.png', 'qq', '1/2', 5, 'SETS', 10, NULL, NULL, 'qq', 20.00, 200.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('297ef1745ac32846015ac329327f0000', '8a7e81ec5ac06f0d015ac06fbb850000', '19', '综艺花纸', '111', '03.png', '11', '1', 30, 'SETS', 30, NULL, NULL, '11', 10.00, 300.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('297ef1745ac32ef0015ac331ba510000', '8a7e81ec5ac06f0d015ac06fbb850000', '12', '平遥远江', '111', '05.png', '111', '1', 10, 'SETS', 10, NULL, NULL, '111', 10.00, 100.00, 111, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('3dc7d88c-a219-4541-b5dd-54a7a29ee40c', '2c90c5004ad63735014ad6d204060005', '13', '平遥鸿艺', '1', 'http://${qiniu.rtValue}', '1', '1', 1, 'PCS', 1, NULL, NULL, '1', 1.00, 1.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e0133592355750005', '4028817a3357462e0133591b86ec0002', '2', '光华', '2977', '06.png', 'b5480a29-da8c-41e1-b91c-54a9fdb15834.png', '全明料圆肚糖缸带盖子\\r\\n尺寸：16X36CM高    底径：', 1, 'PCS', 144, 144, 0, NULL, 17.00, 2448.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e0133592355750006', '4028817a3357462e0133591b86ec0002', '2', '光华', '2976', '07.png', 'af417c8a-e44f-406e-b226-194d8a61df75.png', '全明料糖缸带盖子\\r\\n尺寸\n\n：17.5X41CM高   底径：1', 1, 'PCS', 144, 144, 0, NULL, 17.00, 2448.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336cc0879b0011', '4028817a3357462e01336cc0877b0010', '3', '会龙', 'JK1700011', NULL, '05702b8f-6bda-4bca-9c4d-f15c18f279eb.png', '全明料方形黄油缸\\r\\n尺寸：罩子：7.3X8CM高   盘：6', 24, 'PCS', 504, 504, 0, NULL, 4.60, 2318.40, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d3a0be10015', '4028817a3357462e01336d3a0be10014', '7', '天顺', 'JK1014003', '04.png', '699176d9-c242-42d2-8661-9ce712bba97a.png', '全明料盘子，烤鱼白花纸\\r\\n盘子直径：27CM\\r\\n2只/五层内', 2, 'PCS', 1200, 1200, 0, NULL, 7.50, 9000.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d3a0be10016', '4028817a3357462e01336d3a0be10014', '1', '宏艺', 'JK1014001', '01.png', 'a2ffd39f-18d5-4a6b-89a2-bc91df4926f5.png', '全明料大碗，烤鱼白花纸\\r\\n尺寸：23X11CM高\\r\\n1只/五', 1, 'PCS', 1000, 1000, 0, NULL, 16.50, 16500.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d3a0be10018', '4028817a3357462e01336d3a0be10014', '1', '宏艺', 'JK1014005', '09.png', '9ed4ab1e-d425-4b8d-beb3-1fa6dc63d1df.png', '全明料低口杯，烤鱼白花纸\\r\\n尺寸：7.3X10.5CM高\\r\\n', 4, 'PCS', 1800, 1800, 0, NULL, 5.30, 9540.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d3a0be10019', '4028817a3357462e01336d3a0be10014', '1', '宏艺', 'JK1080766-3', '03.png', '21b5e24a-a58a-4a58-a705-1595faeec581.png', '全明料低口杯，烤3种不同的白花纸\\r\\n尺寸：7.3X10.5C', 3, 'PCS', 1800, 1800, 0, NULL, 5.30, 9540.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d523195001b', '4028817a3357462e01336d523195001a', '7', '天顺', '8708/6203', NULL, '1bab511c-4f4c-4de7-8b65-4ccdcd00a569.png', '怪虫小碗，喷紫色，喷漆，喷珠光\\r\\n直径：18CM\\r\\n4只/内', 4, 'PCS', 600, 600, 0, NULL, 6.50, 3900.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a59001c', '4028817a3357462e01336d523195001a', '7', '天顺', '9749/6525', NULL, '143a4aa8-894d-4226-a461-eac712567360.png', '怪虫碗，喷绿色，喷漆，喷珠光\\r\\n直径：18CM\\r\\n4只/内盒', 4, 'PCS', 600, 600, 0, NULL, 6.50, 3900.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a59001d', '4028817a3357462e01336d523195001a', '7', '天顺', '9226/6116', NULL, 'fcf3f5a9-a405-4f33-abb9-f317c60f1453.png', '海星盘，喷绿色，喷漆，喷珠光\\r\\n直径：31CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.00, 4488.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a59001e', '4028817a3357462e01336d523195001a', '7', '天顺', '9748/6115', NULL, '657ac46a-bd23-4a2d-9abe-c552a8fc3727.png', '海星盘，喷蓝色，喷漆，喷珠光\\r\\n直径：31CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.00, 4488.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a59001f', '4028817a3357462e01336d523195001a', '7', '天顺', '9956/6308', NULL, '1ca7fc1c-aad2-4f1e-8c3b-9a1009e22c04.png', '竹节碗，喷蓝色，喷漆，喷珠光\\r\\n直径：31CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.50, 4692.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a590020', '4028817a3357462e01336d523195001a', '7', '天顺', '9954/6309', NULL, '1e15e517-af2a-45c9-8c1e-1f1b592f5f79.png', '竹节碗，喷绿色，喷漆，喷珠光\\r\\n直径：31CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.50, 4692.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a590021', '4028817a3357462e01336d523195001a', '7', '天顺', '8709/6204', NULL, '1a6770a7-033c-4b98-9e2a-60cd2a5081c3.png', '怪虫小碗，喷蓝色，喷漆，喷珠光\\r\\n直径：18CM\\r\\n4只/内', 4, 'PCS', 600, 600, 0, NULL, 6.50, 3900.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a590022', '4028817a3357462e01336d523195001a', '7', '天顺', '9955/6105', NULL, '15c6d6ad-3608-4d73-83f3-23f605123b90.png', '竹节碗，喷紫色，喷漆，喷珠光\\r\\n直径：31CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.50, 4692.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3357462e01336d5e8a590023', '4028817a3357462e01336d523195001a', '7', '天顺', '9227/6092', NULL, '0ffed7a5-6fd6-4b36-9387-7108bb408fdf.png', '海星盘，喷紫色，喷漆，喷珠光\\r\\n直径：30CM\\r\\n4只/内盒', 4, 'PCS', 408, 408, 0, NULL, 11.00, 4488.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133813f25a30002', '4028817a33812ffd0133813f25940001', '4', '精艺', '4993', '22.png', '3feb6071-7835-48b6-beca-e54202221c3b.png', '全明料死模风灯，电镀花银喷绿色 \\r\\n明料挺底\\r\\n尺寸：11.', 1, 'PCS', 300, 300, 0, NULL, 8.50, 2550.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133813f25a30003', '4028817a33812ffd0133813f25940001', '4', '精艺', '4994', '23.png', '56ada31d-acfc-4261-b28d-8be65ba2a21e.png', '全明料死模风灯，电镀花银喷蓝色\\r\\n明料挺底\\r\\n尺寸：11.5', 1, 'PCS', 300, 300, 0, NULL, 8.50, 2550.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133813f25a30004', '4028817a33812ffd0133813f25940001', '4', '精艺', '4995', '24.png', '9eb0c66c-d682-4f19-b89a-1a4808da5456.png', '全明料死模风灯，电镀花银喷紫色\\r\\n明料挺底\\r\\n尺寸：11.5', 1, 'PCS', 300, 300, 0, NULL, 8.50, 2550.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc40005', '4028817a33812ffd0133813f25940001', '2', '光华', '9868', '01.png', 'ba10c6b0-34b7-4911-a45c-cc282cf8072d.png', '全明料喇叭底糖缸配盖子\\r\\n尺寸：16X40CM高\\r\\n1只/上', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 27, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc40006', '4028817a33812ffd0133813f25940001', '7', '天顺', '5099', '14.png', 'd38c8874-e641-4c59-9f6d-eb07df231d44.png', '全明料钻石蛋糕盘粘底座\\r\\n喷蓝色，喷漆\\r\\n尺寸：23X11.', 1, 'PCS', 300, 300, 0, NULL, 11.00, 3300.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc40007', '4028817a33812ffd0133813f25940001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5094', '20.png', '662d9320-a8b7-4957-8d73-\n\ne4560e12e0e7.png', '全明料冰花风灯，粘电镀底座  \\r\\n尺寸：15.8X32CM高', 1, 'PCS', 300, 300, 0, NULL, 14.50, 4350.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc40008', '4028817a33812ffd0133813f25940001', '2', '光华', '5189', '02.png', 'a2a503a3-f0cd-49b4-b05c-8ea55ecbe2bf.png', '全明料竖棱风灯，粘电镀底座\\r\\n底座由我司提供\\r\\n尺寸：20X', 1, 'PCS', 300, 300, 0, NULL, 14.00, 4200.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc40009', '4028817a33812ffd0133813f25940001', '4', '精艺', '5331', '25.png', '1b211d97-1def-49c6-90a8-8097bbd07f68.png', '全明料死模风灯，电镀花银喷绿色\\r\\n\\r\\n尺寸：17X23CM高', 1, 'PCS', 300, 300, 0, NULL, 11.50, 3450.00, 13, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacc4000a', '4028817a33812ffd0133813f25940001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5095', '21.png', '7b5d7395-40b4-45ad-9c42-\n\nc7050e232448.png', '全明料冰花风灯，粘明料底座 \\r\\n尺寸：15.8X32CM高\\r', 1, 'PCS', 300, 300, 0, NULL, 14.00, 4200.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4000b', '4028817a33812ffd0133813f25940001', '2', '光华', '843MA', '03.png', 'c0229e90-0a5b-438d-8b07-4acd238b142b.png', '全明料喇叭底糖缸，带盖子\\r\\n盖子：10CMX10.3CM高', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 21, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4000c', '4028817a33812ffd0133813f25940001', '4', '精艺', '4997', '27.png', '0fdad1e1-452c-4ae4-a354-49688bd41778.png', '全明料死模风灯，电镀花银喷蓝色  \\r\\n明料挺底  \\r\\n尺寸：11', 1, 'PCS', 300, 300, 0, NULL, 10.50, 3150.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4000d', '4028817a33812ffd0133813f25940001', '4', '精艺', '4996', '26.png', '7ae6c20e-0f57-4fab-9e40-22d1a486e943.png', '全明料死模风灯，电镀花银喷绿色\\r\\n明料挺底\\r\\n尺寸：11.5', 1, 'PCS', 300, 300, 0, NULL, 10.50, 3150.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4000e', '4028817a33812ffd0133813f25940001', '2', '光华', '600MA', '05.png', '958fe4fb-db40-4977-bf2e-2c2db29d65f3.png', '全明料蛋糕盘+罩子,磨口抛光\\r\\n蛋糕罩子尺寸：17.5X15', 1, 'PCS', 600, 600, 0, NULL, 18.00, 10800.00, 17, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4000f', '4028817a33812ffd0133813f25940001', '2', '光华', '602MA', '06.png', '624ab3d2-12f3-4dd8-b438-c03a3018b170.png', '全明平光蛋糕盘+罩子,磨口抛光\\r\\n蛋糕罩子尺寸：17.5X1', 1, 'PCS', 600, 600, 0, NULL, 19.00, 11400.00, 18, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40010', '4028817a33812ffd0133813f25940001', '2', '光华', '8759', '07.png', 'f92f57f8-65de-42be-9814-bad100059d23.png', '全明料竖棱糖缸配盖子\\r\\n尺寸：16.5X40CM高\\r\\n1只/', 1, 'PCS', 600, 600, 0, NULL, 15.00, 9000.00, 25, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40011', '4028817a33812ffd0133813f25940001', '2', '光华', '6998', '04.png', '3be8121c-867d-4745-bebf-3844e6a05589.png', '全明料蛋糕盘+蛋糕罩 \\r\\n盘子沿电镀，罩子上珠描白金。\\r\\n尺', 1, 'PCS', 300, 300, 0, NULL, 19.00, 5700.00, 20, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40012', '4028817a33812ffd0133813f25940001', '2', '光华', '5118', '08.png', '635cdf31-8e48-45f3\n\n-886c-5fffd532175b.png', '全明料蛋糕盘+罩子\\r\\n罩子上烤白金字母花纸（SWEETS)\\r', 1, 'PCS', 300, 300, 0, NULL, 16.00, 4800.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40013', '4028817a33812ffd0133813f25940001', '7', '天顺', '8708', '15.png', '39b3ac6f-fb30-4b37-8fff-a07fb88aef15.png', '怪虫小碗，喷紫色，喷漆，喷珠光\\r\\n尺寸：18CX9CM高\\r\\n', 1, 'PCS', 600, 600, 0, NULL, 6.50, 3900.00, 23, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40014', '4028817a33812ffd0133813f25940001', '4', '精艺', '5336', '29.png', '466ba3d1-94b5-44ca-92c9-98631bf3b92b.png', '全明料死模风灯，电镀花银喷绿色  \\r\\n   \\r\\n尺寸：14.5X', 1, 'PCS', 300, 300, 0, NULL, 8.00, 2400.00, 14, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40015', '4028817a33812ffd0133813f25940001', '4', '精艺', '5337', '28.png', '78ff069b-327e-488e-a629-b76bed0efb98.png', '全明料死模风灯，电镀花银喷蓝色\\r\\n\\r\\n尺寸：14.5X20C', 1, 'PCS', 300, 300, 0, NULL, 8.00, 2400.00, 15, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40016', '4028817a33812ffd0133813f25940001', '2', '光华', '603MA', '09.png', 'ea12f8ba-afc1-4651-bc10-432c85fcb091.png', '全明平光蛋糕盘+罩子,磨口抛光\\r\\n蛋糕罩子尺寸：17.5X1', 1, 'PCS', 600, 600, 0, NULL, 20.00, 12000.00, 19, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40017', '4028817a33812ffd0133813f25940001', '2', '光华', '5117', '10.png', '4f7fdc19-c276-47da-aced-5cec4e02be08.png', '全明料蛋糕盘+罩子\\r\\n罩上烤白金字母花纸（SWEETS)\\r\\n', 1, 'PCS', 300, 300, 0, NULL, 17.00, 5100.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40018', '4028817a33812ffd0133813f25940001', '4', '精艺', '5400', '31.png', '3b810117-19c6-446e-886f-d3b2fd5ba411.png', '全明料死模风灯，电镀花银喷蓝色\\r\\n \\r\\n尺寸：17X23CM', 1, 'PCS', 300, 300, 0, NULL, 11.50, 3450.00, 16, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd40019', '4028817a33812ffd0133813f25940001', '4', '精艺', '4998', '30.png', '0c400655-fb24-4781-aae1-eaa30e31ad4c.png', '全明料死模风灯，电镀花银喷紫色\\r\\n明料挺底\\r\\n尺寸：11.5', 1, 'PCS', 300, 300, 0, NULL, 10.50, 3150.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4001a', '4028817a33812ffd0133813f25940001', '2', '光华', '8760', '11.png', '2aaba753-e5d2-4c42-badf-cc16acf81d2b.png', '全明料竖棱糖缸配盖子\\r\\n尺寸：16.5X51CM高\\r\\n\\r\\n1', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 26, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4001b', '4028817a33812ffd0133813f25940001', '2', '光华', '844MA', '12.png', '6f6f097f-ae83-4ecb-80c6-ec1e93353985.png', '全明料糖缸带盖子\\r\\n盖子：9.3X13.3CM高 壁厚3MM', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 22, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4001c', '4028817a33812ffd0133813f25940001', '2', '光华', '9869', '13.png', 'be81bc6b-610b-45fa-bb8b-5156d8de9d52.png', '全明料喇叭底糖缸配盖子\\r\\n尺寸：19X40CM高\\r\\n1只/上', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 28, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133816aacd4001d', '4028817a33812ffd0133813f25940001', '7', '天顺', '8709', '16.png', 'd33ee976-4d35-4990-ae41-eebee8989f5a.png', '怪虫小碗，喷蓝色，喷漆，喷珠光\\r\\n尺寸：18CMX9CM高\\r', 1, 'PCS', 600, 600, 0, NULL, 6.50, 3900.00, 24, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd013382048ff80026', '4028817a33812ffd013382048ff80024', '1', '宏艺', '20-37-265/JK1050163', NULL, 'e96667ee-d5e9-43d1-bac0-758593c56629.png', '全明料蛋糕盘+罩子\\r\\n罩子烤蒙砂白花纸，花纸我司供\\r\\n尺寸：', 1, 'PCS', 1200, 1200, 0, NULL, 11.00, 13200.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133821a8eb5002c', '4028817a33812ffd0133821a8eb5002b', '1', '宏艺', 'JK110102', NULL, 'e4df38d5-f0d9-4f91-99c6-240addaa36a3.png', '全明料平光蛋糕罩配钻石盘子\\r\\n罩子上粘小鸟，小鸟和钻石盘我司', 1, 'PCS', 150, 150, 0, NULL, 32.00, 4800.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33812ffd0133821a8eb5002d', '4028817a33812ffd0133821a8eb5002b', '1', '宏艺', 'JK110101', NULL, 'bfd61df4-61b5-492c-b11c-7d19b63f5cf1.png', '全明料平光蛋糕罩配钻石盘子\\r\\n罩子上粘小鸟，小鸟和钻石盘我司', 1, 'PCS', 152, 152, 0, NULL, 22.00, 3344.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e88000e', '4028817a33d4f8b40133d9878e88000d', '13', '平遥鸿艺', 'JK1060019/11990', NULL, NULL, '全明料密直棱低口杯\\r\\n尺寸：9X10.5CM高\\r\\n4只/五层', 4, 'PCS', 696, 696, 0, NULL, 5.00, 3480.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e88000f', '4028817a33d4f8b40133d9878e88000d', '13', '平遥鸿艺', 'JK103134/11989', NULL, NULL, '全明料密直棱香槟杯\\r\\n尺寸：9X21CM高\\r\\n4只/五层内盒', 4, 'PCS', 832, 832, 0, NULL, 6.00, 4992.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880010', '4028817a33d4f8b40133d9878e88000d', '1', '宏艺', 'JK1050152/11306', NULL, NULL, '全明料酒杯，口部描1CM白金边\\r\\n尺寸：7X26CM高\\r\\n4', 4, 'PCS', 608, 608, 0, NULL, 8.50, 5168.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880011', '4028817a33d4f8b40133d9878e88000d', '2', '光华', 'JK103233/11301', NULL, NULL, '全明料糖缸配盖子，糖缸刻钻石描亮油\\r\\n尺寸：11X30.5C', 1, 'PCS', 12, 12, 0, NULL, 18.00, 216.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880012', '4028817a33d4f8b40133d9878e88000d', '1', '宏艺', 'JK1050068/11314', NULL, NULL, '全明料马丁尼，口部描1CM白金边\\r\\n尺寸：12X19CM高\\r', 4, 'PCS', 608, 608, 0, NULL, 11.20, 6809.60, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880013', '4028817a33d4f8b40133d9878e88000d', '2', '光华', 'JK1050317/12006', NULL, NULL, '全明料糖缸配盖子，糖缸刻交叉麦穗花\\r\\n尺寸：10.5X14C', 1, 'PCS', 168, 168, 0, NULL, 9.50, 1596.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880015', '4028817a33d4f8b40133d9878e88000d', '2', '光华', 'JK1050316/12005', NULL, 'undefined', '全明料糖缸配盖子，糖缸刻交叉麦穗花\\r\\n尺寸：15X15CM高', 1, 'PCS', 162, 162, 0, NULL, 12.50, 2025.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880016', '4028817a33d4f8b40133d9878e88000d', '2', '光华', 'JK1050201/12078', NULL, 'undefined', '全明料蛋糕罩配盘子，罩子上烤花纸\\r\\n罩子尺寸：15X11.5', 1, 'PCS', 204, 204, 0, NULL, 18.00, 3672.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880017', '4028817a33d4f8b40133d9878e88000d', '1', '宏艺', 'JK1050154/11308', NULL, 'undefined', '全明料香槟杯，口部描1CM白金边\\r\\n尺寸：5X29CM高\\r\\n', 4, 'PCS', 704, 704, 0, NULL, 7.50, 5280.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9878e880018', '4028817a33d4f8b40133d9878e88000d', '13', '平遥鸿艺', 'JK103136/11988', NULL, 'undefined', '全明料密直棱酒杯，底厚要求5MM\\r\\n尺寸：9X17.5CM高', 4, 'PCS', 928, 928, 0, NULL, 6.30, 5846.40, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001a', '4028817a33d4f8b40133d991a50d0019', 'ff808081301885760130189e47ca0013', '文水志远', 'JK1040446/JK446', NULL, 'undefined', '全明料糖缸配盖子，普通底\\r\\n尺寸：16.5X50CM高\\r\\n1', 1, 'PCS', 600, 600, 0, NULL, 25.00, 15000.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001b', '4028817a33d4f8b40133d991a50d0019', '2', '光华', 'JK1040364/JK364', NULL, 'undefined', '全明料糖缸配盖子\\r\\n尺寸：19X39CM高\\r\\n1只/上下保丽', 1, 'PCS', 600, 600, 0, NULL, 25.00, 15000.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001c', '4028817a33d4f8b40133d991a50d0019', '2', '光华', 'JK1050316/JK316', NULL, 'undefined', '全明料糖缸，刻麦穗花不描亮油。\\r\\n盖子电镀，电镀我司安排。\\r', 1, 'PCS', 600, 600, 0, NULL, 12.00, 7200.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001d', '4028817a33d4f8b40133d991a50d0019', '1', '宏艺', 'JK1050166/JK166', NULL, 'undefined', '全明料糖缸，刻花不描亮油。\\r\\n尺寸：12.5X26.5CM高', 1, 'PCS', 600, 600, 0, NULL, 16.00, 9600.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001e', '4028817a33d4f8b40133d991a50d0019', '4', '精艺', 'JK103694/JK694', NULL, 'undefined', '套6全明料死模低口杯\\r\\n尺寸：8X12.5CM高\\r\\n1套/白', 1, 'PCS', 480, 480, 0, NULL, 24.00, 11520.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d001f', '4028817a33d4f8b40133d991a50d0019', 'ff808081301885760130189e47ca0013', '文水志远', 'JK103956/JK956', NULL, 'undefined', '全明料蛋糕罩配盘子\\r\\n盘子我司安排\\r\\n罩子尺寸：33X14X', 1, 'PCS', 480, 480, 0, NULL, 27.00, 12960.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d991a50d0020', '4028817a33d4f8b40133d991a50d0019', '4', '精艺', 'JK103693/JK693', NULL, 'undefined', '套6全明料死模低口杯\\r\\n尺寸：7.3X10.5CM高\\r\\n1套', 1, 'PCS', 184, 184, 0, NULL, 21.00, 3864.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b0029', '4028817a33d4f8b40133d991a50d0019', '9', '华艺', 'J859101549/JK549', NULL, NULL, '全明料蛋糕盘\\r\\n尺寸：直径33.5CM\\r\\n2只/五层内盒  ', 2, 'PCS', 1200, 1200, 0, NULL, 10.00, 12000.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b002a', '4028817a33d4f8b40133d991a50d0019', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'JK1060338/JK338', NULL, NULL, '全明料机压直棱糖缸\\r\\n尺寸：15.5X15.5CM 高\\r\\n1', 1, 'PCS', 2400, 2400, 0, NULL, 7.15, 17160.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b002b', '4028817a33d4f8b40133d991a50d0019', '9', '华艺', 'JK103209/JK209', NULL, NULL, '全明料2层钻石蛋糕盘，配喷塑铁架\\r\\n铁架我司供\\r\\n大盘尺寸：', 1, 'PCS', 1200, 1200, 0, NULL, 13.00, 15600.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b002c', '4028817a33d4f8b40133d991a50d0019', '9', '华艺', 'JK1031007-LP/JK007/1', NULL, NULL, '全明料钻石蛋糕盘，粘底座\\r\\n尺寸：30X11.5CM高\\r\\n1', 1, 'PCS', 600, 600, 0, NULL, 10.50, 6300.00, 13, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b002d', '4028817a33d4f8b40133d991a50d0019', '1', '宏艺', 'JK1050128/JK0128', NULL, NULL, '全明料三层糖缸，刻麦穗花\\r\\n尺寸：12X22.5CM\\r\\n1套', 1, 'PCS', 600, 600, 0, NULL, 18.50, 11100.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9be557b002e', '4028817a33d4f8b40133d991a50d0019', '2', '光华', 'JK103176/JK176', NULL, NULL, '全明料糖缸，刻花，不带盖子\\r\\n尺寸：20X14.5CM高\\r\\n', 1, 'PCS', 480, 480, 0, NULL, 18.50, 8880.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0030', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK1050806/JK032', NULL, 'undefined', '套6全明料香槟杯，电镀渐变色\\r\\n尺寸：5.7X25CM高\\r\\n', 1, 'PCS', 320, 320, 0, NULL, 31.80, 10176.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0031', '4028817a33d4f8b40133d9bea39b002f', '4', '精艺', 'JK045/JK1060426', NULL, 'undefined', '套6紫色碗明挺底香槟杯\\r\\n尺寸：8X17CM高\\r\\n1套/五层', 1, 'PCS', 240, 240, 0, NULL, 33.60, 8064.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0032', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK1050807/JK033', NULL, 'undefined', '套6全明料酒杯，电镀渐变色\\r\\n尺寸：8X24CM高\\r\\n1套/', 1, 'PCS', 300, 300, 0, NULL, 34.80, 10440.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0033', '4028817a33d4f8b40133d9bea39b002f', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'JK040/JK1060338', NULL, 'undefined', '全明料机压竖棱糖缸\\r\\n尺寸：15.5X15.5CM\\r\\n1只/', 1, 'PCS', 3000, 3000, 0, NULL, 8.04, 24120.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0034', '4028817a33d4f8b40133d9bea39b002f', '4', '精艺', 'JK044/JK1060425', NULL, 'undefined', '套6紫色碗明挺底红酒杯\\r\\n尺寸：8X20CM高\\r\\n1套/五层', 1, 'PCS', 240, 240, 0, NULL, 34.80, 8352.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0035', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK019/J859100824', NULL, 'undefined', '套4全明料酒杯，口部描2.5CM宽白金边\\r\\n尺寸：8.4X2', 1, 'PCS', 320, 320, 0, NULL, 58.00, 18560.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0036', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK018/J859100826', NULL, 'undefined', '套4全明料香槟杯，口部描2.5CM宽白金边\\r\\n尺寸：4.7X', 1, 'PCS', 300, 300, 0, NULL, 40.00, 12000.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0037', '4028817a33d4f8b40133d9bea39b002f', '3', '会龙', 'JK041/JK1060339', NULL, 'undefined', '全明料蒙古包糖缸\\r\\n尺寸：9X11CM高\\r\\n1只/五层内盒 ', 1, 'PCS', 3000, 3000, 0, NULL, 4.00, 12000.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33d4f8b40133d9bea39b0038', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK020/J859100825', NULL, 'undefined', '套4全明料马丁尼，口部描2.5CM白金边\\r\\n尺寸：11.8X', 1, 'PCS', 300, 300, 0, NULL, 70.00, 21000.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33f7960d0133f8d912ba0005', '4028817a33812ffd0133821a8eb5002b', '9', '华艺', 'JK110102', NULL, NULL, '全明料钻石盘子\\r\\n盘子尺寸：29.5X11.5CM\\r\\n安全包', 1, 'PCS', 150, 150, 0, NULL, 10.00, 1500.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33f7960d0133f8d912ba0006', '4028817a33812ffd0133821a8eb5002b', '9', '华艺', 'JK110101', NULL, NULL, '全明料钻石盘子\\r\\n盘子尺寸：23X11.5CM\\r\\n安全包装送', 1, 'PCS', 152, 152, 0, NULL, 8.50, 1292.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fcdb13f4000e', '4028817a33d4f8b40133d9bea39b002f', '1', '宏艺', 'JK052/JK1070691', NULL, NULL, '套4全明料马丁尼\\r\\n尺寸：12.5X19.5CM高\\r\\n1套/', 1, 'PCS', 300, 300, 0, NULL, 30.00, 9000.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fcdb13f4000f', '4028817a33d4f8b40133d9bea39b002f', '5', '汇越', 'JK050/JK1070690', NULL, NULL, '套4全明料白酒杯，钻石挺\\r\\n尺寸：8.6X23CM高\\r\\n1套', 1, 'PCS', 300, 300, 0, NULL, 23.20, 6960.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fcdb13f40010', '4028817a33d4f8b40133d9bea39b002f', '2', '光华', 'JK046/JK1050201', NULL, NULL, '全明料蛋糕盘+罩子\\r\\n罩子上烤蒙砂白花纸\\r\\n距口部1CM处，', 1, 'PCS', 600, 600, 0, NULL, 19.00, 11400.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d7001e', '4028817a33fc4e280133fd81e7d7001d', '2', '光华', '169280', NULL, NULL, '全明料蛋糕盘+罩子  \\r\\n距离罩子口部3CM烤字母花纸  \\r\\n', 1, 'PCS', 100, 100, 0, NULL, 32.00, 3200.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d7001f', '4028817a33fc4e280133fd81e7d7001d', '1', '宏艺', 'J859102682/113860', NULL, NULL, '全明料糖缸，烤字母白花纸\\r\\nSTORAGE ONLY\\r\\n尺寸', 1, 'PCS', 300, 300, 0, NULL, 16.00, 4800.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70020', '4028817a33fc4e280133fd81e7d7001d', '4', '精艺', 'JK1080435', NULL, NULL, '全明料球形瓶子，刻花，描亮油\\r\\n\\r\\n尺寸:9.5X10.5C', 1, 'PCS', 1008, 1008, 0, NULL, 9.00, 9072.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70021', '4028817a33fc4e280133fd81e7d7001d', '2', '光华', '123540', NULL, NULL, '全明料蛋糕盘子+罩子\\r\\n罩子上烤字母（HIGH TEA）花纸', 1, 'PCS', 100, 100, 0, NULL, 22.00, 2200.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70022', '4028817a33fc4e280133fd81e7d7001d', '3', '会龙', 'JK1052446/158080', NULL, NULL, '全明料酒壶，杯身烤白色字母花纸\\r\\n \\r\\n尺寸：7.8X22.', 1, 'PCS', 702, 702, 0, NULL, 16.50, 11583.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70023', '4028817a33fc4e280133fd81e7d7001d', 'ff808081301885760130189e47ca0013', '文水志远', '62145', NULL, NULL, '全明料蛋糕罩子\\r\\n\\r\\n尺寸：30.3X11.5X15CM\\r\\n', 1, 'PCS', 504, 504, 0, NULL, 27.00, 13608.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70024', '4028817a33fc4e280133fd81e7d7001d', 'ff808081301885760130189e47ca0013', '文水志远', '62146/F-57', NULL, NULL, '全明料蛋糕罩子，刻麦穗花\\r\\n\\r\\n尺寸：30.3X11.5X1', 1, 'PCS', 504, 504, 0, NULL, 28.50, 14364.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70025', '4028817a33fc4e280133fd81e7d7001d', 'ff808081301885760130189e47ca0013', '文水志远', 'JKF081342/62180', NULL, NULL, '全明料蛋糕罩子+盘子\\r\\n盘子我司安排\\r\\n尺寸：30.3X11', 1, 'PCS', 652, 652, 0, NULL, 27.00, 17604.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70026', '4028817a33fc4e280133fd81e7d7001d', '1', '宏艺', 'JK10501218/160380', NULL, NULL, '全明料糖缸带盖子，糖缸身上烤\\r\\n白色字母花纸\\r\\n尺寸：12.', 1, 'PCS', 600, 600, 0, NULL, 15.00, 9000.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd81e7d70027', '4028817a33fc4e280133fd81e7d7001d', '1', '宏艺', 'JK1040009/141760', NULL, NULL, '全明料三层糖缸，烤字母花纸\\r\\n花纸我司安排\\r\\n尺寸：16.5', 1, 'PCS', 300, 300, 0, NULL, 35.00, 10500.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd89fcc00028', '4028817a33fc4e280133fd81e7d7001d', '7', '天顺', 'JKF081342/62180', NULL, NULL, '全明料蛋糕盘配罩子\\r\\n罩子由文水志远厂提供\\r\\n尺寸：33X1', 1, 'PCS', 652, 652, 0, NULL, 10.40, 6780.80, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd9f8b4e0030', '4028817a33fc4e280133fd9f8b4e002f', '15', '南皮开发', 'JK1040158/12068', NULL, NULL, '明料灯宫细转棱蜡台\\r\\n\\r\\n尺寸：6X26CM高\\r\\n4只/三层', 4, 'PCS', 400, 400, 0, NULL, 9.70, 3880.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd9f8b4e0031', '4028817a33fc4e280133fd9f8b4e002f', '2', '光华', 'JK1050317/12006', NULL, NULL, '明料糖缸配明料盖子\\r\\n缸身刻交叉麦穗花\\r\\n尺寸：10.5X1', 1, 'PCS', 504, 504, 0, NULL, 9.50, 4788.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd9f8b4e0032', '4028817a33fc4e280133fd9f8b4e002f', '2', '光华', 'JK1050316/12005', NULL, NULL, '明料糖缸配明料盖子\\r\\n缸身刻交叉麦穗花\\r\\n尺寸：15X15C', 1, 'PCS', 348, 348, 0, NULL, 12.50, 4350.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fd9f8b4e0033', '4028817a33fc4e280133fd9f8b4e002f', '2', '光华', 'JK103233/11301', NULL, NULL, '全明料糖缸刻钻石，描亮油\\r\\n尺寸：11X30.5CM高\\r\\n1', 1, 'PCS', 408, 408, 0, NULL, 18.00, 7344.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fdb370c00034', '4028817a33812ffd0133813f25940001', '7', '天顺', '9749', '17.png', '怪虫小碗喷绿色，喷漆', '怪虫小碗喷绿色，喷漆，喷珠光\\r\\n尺寸：18X9CM高\\r\\n4只', 4, 'PCS', 304, 304, 0, NULL, 6.50, 1976.00, 29, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fdb370cf0035', '4028817a33812ffd0133813f25940001', '7', '天顺', '9749', '18.png', NULL, '怪虫小碗喷绿色，喷漆，喷珠光\\r\\n尺寸：18X9CM高\\r\\n4只', 4, 'PCS', 304, 304, 0, NULL, 6.50, 1976.00, 30, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fdb370df0036', '4028817a33812ffd0133813f25940001', '7', '天顺', '9749', '19.png', NULL, '怪虫小碗喷绿色，喷漆，喷珠光\\r\\n尺寸：18X9CM高\\r\\n4只', 4, 'PCS', 304, 304, 0, NULL, 6.50, 1976.00, 31, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f0037', '4028817a33fc4e280133fd9f8b4e002f', '2', '光华', 'JK1050201/12078', NULL, NULL, '全明料蛋糕罩配盘子,罩子上烤蒙砂白花纸\\r\\n盘子尺寸：16X1', 1, 'PCS', 402, 402, 0, NULL, 18.00, 7236.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f0038', '4028817a33fc4e280133fd9f8b4e002f', '13', '平遥鸿艺', 'JK1050198/12860', NULL, NULL, '全明料酒杯，\\r\\n距口部1.5CM烤蒙砂白花纸\\r\\n尺寸：11X', 4, 'PCS', 400, 400, 0, NULL, 6.50, 2600.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f0039', '4028817a33fc4e280133fd9f8b4e002f', '2', '光华', 'JK169340/13076', NULL, NULL, '全明料蛋糕罩配盘子，罩子上烤蒙砂白花纸    \\r\\n尺寸：25X2', 1, 'PCS', 200, 200, 0, NULL, 36.00, 7200.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003a', '4028817a33fc4e280133fd9f8b4e002f', 'ff808081301885760130189e47ca0013', '文水志远', 'JK1400002/13077', NULL, NULL, '全明料竖棱酒壶，磨口抛光\\r\\n不可有碰口，棱要明显\\r\\n尺寸：1', 1, 'PCS', 1200, 1200, 0, NULL, 13.00, 15600.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003b', '4028817a33fc4e280133fd9f8b4e002f', '15', '南皮开发', 'JK5100005-F/13079', NULL, NULL, '全明料竖棱香槟杯\\r\\n尺寸：5.5X24.5CM高\\r\\n4只/三', 4, 'PCS', 1200, 1200, 0, NULL, 10.00, 12000.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003c', '4028817a33fc4e280133fd9f8b4e002f', '13', '平遥鸿艺', 'JK1050195/12859', NULL, NULL, '全明料香槟杯\\r\\n距口部1.5CM烤蒙砂白花纸\\r\\n尺寸：8X2', 4, 'PCS', 400, 400, 0, NULL, 6.00, 2400.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003d', '4028817a33fc4e280133fd9f8b4e002f', '15', '南皮开发', 'JK5100004/13078', NULL, NULL, '全明料直棱酒杯\\r\\n尺寸：9.5X18.5CM高\\r\\n4只/三层', 4, 'PCS', 1200, 1200, 0, NULL, 8.80, 10560.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003e', '4028817a33fc4e280133fd9f8b4e002f', '15', '南皮开发', 'JK5300006/13080', NULL, NULL, '全明料竖棱糖缸，盖子上带圆头\\r\\n尺寸：9X8CM高\\r\\n1只/', 1, 'PCS', 1200, 1200, 0, NULL, 8.50, 10200.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a33fc4e280133fde6504f003f', '4028817a33fc4e280133fd9f8b4e002f', '15', '南皮开发', 'JK5300007/13081', NULL, NULL, '全明料竖棱糖缸，盖子上带圆头\\r\\n尺寸：9X12CM高\\r\\n1只', 1, 'PCS', 1200, 1200, 0, NULL, 9.80, 11760.00, 13, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820002', '4028817a3420e78a013421a693730001', '4', '精艺', '4995', NULL, 'c7801815-993e-43f0-8ac5-d5d788f34e74.png', '全明料死模风灯，电镀花银喷紫色\\r\\n明料挺底，电镀喷色我司安排', 1, 'PCS', 300, 300, 1, NULL, 8.50, 2550.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820003', '4028817a3420e78a013421a693730001', '4', '精艺', '4994', NULL, 'ae3e208e-8037-41dc-89d3-6727d1403c4c.png', '全明料死模风灯，电镀花银喷浅海蓝\\r\\n明料挺底,电镀喷色我司安', 1, 'PCS', 300, 300, 1, NULL, 8.50, 2550.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820004', '4028817a3420e78a013421a693730001', '4', '精艺', '4996', NULL, '09b2983e-67b1-4f42-b6ec-0efa99b90cae.png', '全明料死模风灯，电镀花银喷浅绿色\\r\\n明料挺底，电镀喷色我司安', 1, 'PCS', 300, 300, 1, NULL, 10.50, 3150.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820005', '4028817a3420e78a013421a693730001', '2', '光华', '5118', NULL, 'd2f2ab57-ca50-43ff-87fd-9b6b38d14adc.png', '全明料蛋糕盘+罩子  \\r\\n罩子上烤白金字母花纸（SWEETS)', 1, 'PCS', 300, 300, 1, NULL, 16.00, 4800.00, 14, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820006', '4028817a3420e78a013421a693730001', '4', '精艺', '4993', NULL, '49a9221c-aa5d-42a6-997c-9671c69ebb96.png', '全明料死模风灯，电镀花银喷浅绿色   \\r\\n明料挺底，电镀喷色我', 1, 'PCS', 300, 300, 1, NULL, 8.50, 2550.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820007', '4028817a3420e78a013421a693730001', '2', '光华', '5117', NULL, '94744a94-9215-425c-8d7c-e6c27b74d47a.png', '全明料蛋糕盘+罩子  \\r\\n罩上烤白金字母花纸（SWEETS)  ', 1, 'PCS', 300, 300, 1, NULL, 17.00, 5100.00, 13, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820008', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5086', NULL, 'f9c8b767-01c1-47a1-816c-4203c229f765.png', '全明料冰花风灯，电镀花银喷绿色\\r\\n尺寸：12.5X20CM高', 1, 'PCS', 300, 300, 1, NULL, 13.00, 3900.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820009', '4028817a3420e78a013421a693730001', '1', '宏艺', '5190', NULL, 'b0d362a3-2044-4bb8-ad61-0d6228e94110.png', '全明料平光蛋糕罩配钻石盘子\\r\\n罩子上粘小鸟，小鸟和钻石盘我司', 1, 'PCS', 100, 100, 1, NULL, 22.00, 2200.00, 16, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000a', '4028817a3420e78a013421a693730001', '9', '华艺', '5190', NULL, 'de8f61ab-0ce5-4e66-862f-acc66140d77f.png', '全明料钻石蛋糕盘粘底座\\r\\n \\r\\n尺寸：23X11.5CM高\\r', 1, 'PCS', 100, 100, 1, NULL, 8.50, 850.00, 17, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000b', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5084', NULL, '4afac9ad-6f75-4186-95e2-0f3c992fd0a8.png', '全明料冰花风灯，电镀花银喷蓝色\\r\\n尺寸：10X17.5CM高', 1, 'PCS', 300, 300, 1, NULL, 11.50, 3450.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000c', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5085', NULL, '11799ce4-7d8a-451b-8838-6b01f804b8ff.png', '全明料冰花风灯，电镀花银喷紫色\\r\\n尺寸：10X17.5CM高', 1, 'PCS', 300, 300, 1, NULL, 11.50, 3450.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000d', '4028817a3420e78a013421a693730001', '7', '天顺', '5144', NULL, '978f44fd-492c-4209-8b4a-6dd58539a14f.png', '全明料钻石蛋糕盘粘底座\\r\\n喷绿色，喷漆，喷珠光\\r\\n尺寸：23', 1, 'PCS', 100, 100, 1, NULL, 11.00, 1100.00, 15, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000e', '4028817a3420e78a013421a693730001', '4', '精艺', '4998', NULL, '4c8991c6-227e-4c31-bcf7-539fd002cd12.png', '全明料死模风灯，电镀花银喷紫色\\r\\n明料挺底,电镀喷色我司安排', 1, 'PCS', 300, 300, 1, NULL, 10.50, 3150.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a69382000f', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5088', NULL, '9926bf89-1345-4082-aeeb-a3f94d0dcc40.png', '全明料冰花风灯，电镀花银喷蓝色\\r\\n尺寸：12.5X20CM高', 1, 'PCS', 300, 300, 1, NULL, 13.00, 3900.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693820010', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5089', NULL, '22a26221-2c14-4ea4-b972-ebe9df1a27ab.png', '全明料冰花风灯，电镀花银喷紫色\\r\\n尺寸：12.5X20CM高', 1, 'PCS', 300, 300, 1, NULL, 13.00, 3900.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693920011', '4028817a3420e78a013421a693730001', '4', '精艺', '4997', NULL, 'f62db940-2432-4a7d-946c-22e2ba184d37.png', '全明料死模风灯，电镀花银喷浅海蓝\\r\\n明料挺底，电镀喷色我司安', 1, 'PCS', 300, 300, 1, NULL, 10.50, 3150.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421a693920012', '4028817a3420e78a013421a693730001', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5083', NULL, '65fe2446-a833-483a-ad34-dc5da6a7e28a.png', '全明料冰花风灯，电镀花银喷绿色\\r\\n尺寸：10X17.5CM高', 1, 'PCS', 300, 300, 1, NULL, 11.50, 3450.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421d2e3fe0013', '4028817a3420e78a013421a693730001', '4', '精艺', '5336', NULL, '422bfb7c-ad4e-4098-8953-beca57d6259c.png', '全明料死模风灯，电镀花银喷绿色  \\r\\n   \\r\\n尺寸：14.5X', 1, 'PCS', 300, 300, 1, NULL, 8.00, 2400.00, 20, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421d2e3fe0014', '4028817a3420e78a013421a693730001', '4', '精艺', '5331', NULL, 'c09ea297-bb5f-47a0-b8a0-0b4419f6e138.png', '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：17X23CM高\\r\\n', 1, 'PCS', 300, 300, 1, NULL, 11.50, 3450.00, 19, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421d2e3fe0015', '4028817a3420e78a013421a693730001', '9', '华艺', '5190', NULL, 'aa3e7517-3227-41ff-b239-a5a6d5c00939.png', '机压小鸟,表面要光滑\\r\\n\\r\\n安全包装送祁县宏艺厂\\r\\n请提供一', 1, 'PCS', 100, 100, 1, NULL, 2.40, 240.00, 18, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c10016', '4028817a3420e78a013421a693730001', '4', '精艺', '5400', NULL, 'f475d46e-733a-4220-8243-98ba76f09ddc.png', '全明料死模风灯，电镀花银喷蓝色\\r\\n \\r\\n尺寸：17X23CM', 1, 'PCS', 300, 300, 1, NULL, 11.50, 3450.00, 22, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c10017', '4028817a3420e78a013421a693730001', '7', '天顺', '9749', NULL, '3d52357d-71bf-4ac1-b7f0-38b640a2d349.png', '怪虫小碗，喷绿色，喷漆，喷珠光\\r\\n\\r\\n尺寸:18X9CM高\\r', 4, 'PCS', 600, 600, 1, NULL, 6.50, 3900.00, 28, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c10018', '4028817a3420e78a013421a693730001', '2', '光华', '8759', NULL, 'c5f0d6c6-275f-4fb4-b468-a9be38f85f02.png', '全明料糖缸带盖子\\r\\n尺寸：16.5X40CM高\\r\\n1只/上下', 1, 'PCS', 600, 600, 1, NULL, 15.00, 9000.00, 27, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c10019', '4028817a3420e78a013421a693730001', '7', '天顺', '8709', NULL, '2720f819-b111-4aeb-b5e8-abc262dc5a7b.png', '怪虫小碗，喷蓝色，喷漆，喷珠光\\r\\n \\r\\n尺寸：18X9CM高', 4, 'PCS', 600, 600, 1, NULL, 6.50, 3900.00, 26, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c1001a', '4028817a3420e78a013421a693730001', '4', '精艺', '5337', NULL, 'c2ff4999-1ea3-479d-8859-3302bb0e9d77.png', '全明料死模风灯，电镀花银喷蓝色  \\r\\n  \\r\\n尺寸：14.5X2', 1, 'PCS', 300, 300, 1, NULL, 8.00, 2400.00, 21, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c1001b', '4028817a3420e78a013421a693730001', '7', '天顺', '8708', NULL, 'cd89d279-e040-4647-a89f-59bfee1d6db9.png', '怪虫小碗，喷紫色，喷漆，喷珠光\\r\\n \\r\\n尺寸：18X9CM高', 4, 'PCS', 600, 600, 1, NULL, 6.50, 3900.00, 25, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c1001c', '4028817a3420e78a013421a693730001', '2', '光华', '843MA', NULL, '6b4da997-ad8c-4101-90cb-1c554c356bb1.png', '全明料喇叭底糖缸，带盖子  \\r\\n盖子：10CMX10.3CM高', 1, 'PCS', 600, 600, 1, NULL, 16.00, 9600.00, 23, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e2e3c1001d', '4028817a3420e78a013421a693730001', '2', '光华', '844MA', NULL, '19dd24a2-4eb2-4273-a46a-229d28aeee85.png', '全明料糖缸带盖子\\r\\n盖子：9.3X13.3CM高 壁厚3MM', 1, 'PCS', 600, 600, 1, NULL, 16.00, 9600.00, 24, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a3420e78a013421e53b8c001e', '4028817a3420e78a013421a693730001', '2', '光华', '9868', NULL, '6bf2fdf5-6d7e-4147-b40c-6eddf95abcd8.png', '全明料喇叭底糖缸配盖子\\r\\n尺寸：5-1/4\\\"X17\\\"H\\r\\n1', 1, 'PCS', 600, 600, 1, NULL, 16.00, 9600.00, 29, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d0047', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5089', NULL, '2c991b9e-a14b-4f37-a2ca-5e7d01cba021.jpg', '全明料冰花风灯，电镀花银喷紫色。\\r\\n尺寸:12.5*20 C', 1, 'PCS', 204, 204, 1, NULL, 13.00, 2652.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d0048', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5094', NULL, '7ae1ccaa-426b-4476-bc6a-28258d735fbd.jpg', '全明料冰花风灯，粘电镀底座    \\r\\n尺寸：15.8X32CM', 1, 'PCS', 150, 150, 1, NULL, 14.50, 2175.00, 7, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d0049', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5093', NULL, '796ec9af-d6bb-4511-a6c6-6d75bcc1f2e3.jpg', '全明料冰花风灯粘电镀底座，   \\r\\n喷紫色，全喷，内电镀花银  ', 1, 'PCS', 102, 102, 1, NULL, 16.00, 1632.00, 6, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004a', '4028817a353b8d8e01353d15008d0046', '7', '天顺', '5099', NULL, '9586c248-7796-4f99-b648-f913e65250f3.jpg', '全明料钻石蛋糕盘粘底座  \\r\\n喷蓝色，喷漆,喷珠光    \\r\\n尺寸', 1, 'PCS', 152, 152, 1, NULL, 11.00, 1672.00, 10, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004b', '4028817a353b8d8e01353d15008d0046', '7', '天顺', '5098', NULL, 'bb0e509f-ccb0-44f4-8320-df18ff6ac880.jpg', '全明料钻石蛋糕盘粘底座  \\r\\n喷紫色，喷漆,喷珠光    \\r\\n尺寸', 1, 'PCS', 152, 152, 1, NULL, 11.00, 1672.00, 9, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004c', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5090', NULL, '2ec05114-5c74-4211-b254-4d979218c05e.jpg', '全明料冰花风灯粘电镀底座，   \\r\\n喷蓝色，全喷，内电镀花银  ', 1, 'PCS', 102, 102, 1, NULL, 16.00, 1632.00, 4, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004d', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5088', NULL, '9488192b-fb0f-4aa5-9e29-86de71d05675.jpg', '全明料冰花风灯，电镀花银喷蓝色。\\r\\n尺寸:12.5*20 C', 1, 'PCS', 204, 204, 1, NULL, 13.00, 2652.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004e', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5092', NULL, '289d254d-0f0d-4671-9376-d04cc36540d2.jpg', '全明料冰花风灯粘电镀底座，   \\r\\n喷绿色，全喷，内电镀花银  ', 1, 'PCS', 102, 102, 1, NULL, 16.00, 1632.00, 5, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d004f', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5095', NULL, '01349ede-bef9-4168-a346-e109e3111773.jpg', '全明料冰花风灯，粘明料底座   \\r\\n尺寸：15.8X32CM高', 1, 'PCS', 150, 150, 1, NULL, 14.00, 2100.00, 8, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d15008d0050', '4028817a353b8d8e01353d15008d0046', '4028817a33d4f8b40133d9989f5e0024', '民鑫', '5086', NULL, '3c77a543-f2f2-4cf3-b173-8ef1d1a1f8be.jpg', '全明料冰花风灯，电镀花银喷绿色。\\r\\n尺寸:12.5*20 C', 1, 'PCS', 204, 204, 1, NULL, 13.00, 2652.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0051', '4028817a353b8d8e01353d15008d0046', '2', '光华', '5117', NULL, 'aec0cd7f-795e-4c5f-b8c5-532b6479c4be.jpg', '全明料蛋糕盘+罩子 \\r\\n罩上烤白金字母花纸（SWEETS)', 1, 'PCS', 100, 100, 1, NULL, 17.00, 1700.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0052', '4028817a353b8d8e01353d15008d0046', '9', '华艺', '5191', NULL, '5a77aec3-1299-4b75-8ff4-5c7232d0a8c6.jpg', '机压小鸟,表面要光滑    \\r\\n安全包装送祁县宏艺厂    \\r\\n请提', 1, 'PCS', 100, 100, 1, NULL, 2.40, 240.00, 19, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0053', '4028817a353b8d8e01353d15008d0046', '7', '天顺', '5144', NULL, '91d36961-2e9e-44cc-94ed-44ab4d6a24e4.jpg', '全明料钻石蛋糕盘粘底座  \\r\\n喷绿色，喷漆，喷珠光    \\r\\n尺寸', 1, 'PCS', 152, 152, 1, NULL, 11.00, 1672.00, 13, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0054', '4028817a353b8d8e01353d15008d0046', '9', '华艺', '5191', NULL, '06191cc8-a932-4f7a-a951-eabbd4336f13.jpg', '全明料钻石蛋糕盘粘底座  \\r\\n尺寸：29.5X11.5CM高  ', 1, 'PCS', 100, 100, 1, NULL, 10.00, 1000.00, 18, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0055', '4028817a353b8d8e01353d15008d0046', '2', '光华', '5118', NULL, 'b76467e5-21b5-4102-8085-f0d14189e257.jpg', '全明料蛋糕盘+罩子    \\r\\n罩子上烤白金字母花纸（SWEETS', 1, 'PCS', 152, 152, 1, NULL, 16.00, 2432.00, 12, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0056', '4028817a353b8d8e01353d15008d0046', '9', '华艺', '5190', NULL, '9a6203d7-01b0-4ebe-bc08-d390b5ecd46a.jpg', '机压小鸟,表面要光滑    \\r\\n安全包装送祁县宏艺厂    \\r\\n请提', 1, 'PCS', 100, 100, 1, NULL, 2.40, 240.00, 16, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0057', '4028817a353b8d8e01353d15008d0046', '4', '精艺', '5337', NULL, 'ecc411bc-b3ce-4175-9e96-17014661c601.jpg', '全明料死模风灯，电镀花银喷蓝色  \\r\\n尺寸：14.5X20CM', 1, 'PCS', 156, 156, 1, NULL, 8.00, 1248.00, 22, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0058', '4028817a353b8d8e01353d15008d0046', '9', '华艺', '5190', NULL, '9196fdca-db89-42a3-99d8-6a168479344c.jpg', '全明料钻石蛋糕盘粘底座  \\r\\n尺寸：23X11.5CM高  \\r', 1, 'PCS', 100, 100, 1, NULL, 8.50, 850.00, 15, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d0059', '4028817a353b8d8e01353d15008d0046', '1', '宏艺', '5190', NULL, 'a3c28393-5d85-4ab5-8f9b-c10d8becf945.jpg', '全明料平光蛋糕罩配钻石盘子  \\r\\n罩子上粘小鸟，小鸟和钻石盘我', 1, 'PCS', 100, 100, 1, NULL, 22.00, 2200.00, 14, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d005a', '4028817a353b8d8e01353d15008d0046', '4', '精艺', '5330', NULL, '75849bf7-f9a2-4f74-853e-baefef078d93.jpg', '全明料死模风灯，电镀花银喷紫色  \\r\\n尺寸：14.5X20CM', 1, 'PCS', 156, 156, 1, NULL, 8.00, 1248.00, 20, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32350d005b', '4028817a353b8d8e01353d15008d0046', '4', '精艺', '5336', NULL, '5fe32315-0fb6-4a84-bb82-61b27ef3a8e3.jpg', '全明料死模风灯，电镀花银喷绿色  \\r\\n尺寸：14.5X20CM', 1, 'PCS', 156, 156, 1, NULL, 8.00, 1248.00, 21, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028817a353b8d8e01353d32353c005c', '4028817a353b8d8e01353d15008d0046', '1', '宏艺', '5191', NULL, '135fbc3e-1c1d-4188-91e0-6a54cb0e2901.jpg', '全明料平光蛋糕罩配钻石盘子  \\r\\n罩子上粘小鸟，小鸟和钻石盘我', 1, 'PCS', 100, 100, 1, NULL, 32.00, 3200.00, 17, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('40288286607ea08c01607ea3d9500001', 'ff8080816077bbb3016077bd30b10000', '1', '升华', '002', '001.jpg', '别睡啦', '12', 11, 'PCS', 10, NULL, NULL, '快醒醒', 5.00, 50.00, 16, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('40288286607ea08c01607ea5567b0002', 'ff8080816077bbb3016077bd30b10000', '10', '晶晨', '003', 'adssad', NULL, '1', 1, 'PCS', 1, NULL, NULL, NULL, 1.00, 1.00, 3, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('40288286607ea08c01607ea6c1300003', 'ff8080816077bbb3016077bd30b10000', '19', '综艺花纸', '005', '002.jpg', 'hello ', '1', 111, 'PCS', 2, NULL, NULL, 'word', 2.00, 4.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028828660b1cd900160b1cf41190001', '4028828660b1cd900160b1cebb440000', '10', '晶晨', 'fj001', 'fj002,jpg', 'xxxx', '11', 11, 'PCS', 2, NULL, NULL, 'qqqq', 10.00, 20.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('40288287616082eb01616092a3320002', '40288287616082eb0161608728560000', NULL, '晶晨', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 10.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028828761609a96016160a204c80000', '40288287616082eb0161608805650001', '10', '晶晨', '1', 'fj002,jpg', '阿斯顿', '11', 1, 'PCS', 1, NULL, NULL, '阿斯顿', 10.00, 10.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028828761609a96016160a2da5e0001', '40288287616082eb0161608805650001', '15', '南皮开发', NULL, 'fj002,jpg', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 10.00, 20.00, NULL, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('402882876170403101617079e0540000', '40288287616a411e01616ab546270006', '12', '平遥远江', '001', 'fj002,jpg', NULL, '11', 11, 'PCS', 1, NULL, NULL, NULL, 10.00, 10.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('40288287617040310161707a154e0001', '40288287616a411e01616ab546270006', '12', '平遥远江', 'fj001', 'fj002,jpg', NULL, '11', 11, 'SETS', 2, NULL, NULL, NULL, 5.00, 10.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('402895c25152201a015152215a930000', '402895c2515129200151514376b80002', '12', '平遥远江', 'rrttrrttyyrree', '11', '柘城要柘城', '11', 11, NULL, 11, NULL, NULL, '11', 11.00, 121.00, 11, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('402899d650894b860150894cef8f0000', '402899d650885c420150885d95cb0000', '10', '晶晨', 'rwtewr32432', '02.png', '货描', '1/2', 5, 'PCS', 10, NULL, NULL, '要求', 100.00, 1000.00, 2, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4028a9bd515b54c901515b5be9e40000', '4028a9bd515b2e8201515b3339860000', '1', '升华', 'fdgfdgfd', '01.png', '货物描述', '1/2', 5, 'PCS', 10, NULL, NULL, '要求', 10.00, 100.00, 20, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('42b8eaa7-c7d2-40e0-8727-e90cb209abae', '2c90c5004ad63735014ad6d204060005', '1', '升华', 'xx001', NULL, '真的', '10.0', 2, 'PCS', 1, NULL, NULL, '很不错', 5.00, 5.00, NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('4740cccc-8c67-4810-94f5-97d58bb92073', 'C2C011E96CC3451DAD181AF3372CB80D', '10', '晶晨', 'fj001', 'http://pohq61v14.bkt.clouddn.com/96E8AE517C6643CABC1E4DA5DF35AD2E_logo.jpg', '1', '1', 1, 'PCS', 1, NULL, NULL, '1', 1.00, 1.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('4a99e580-cf52-4b57-9b75-c50a491175a9', '2c90c5004ad63735014ad6d204060005', '15', '南皮开发', '货号002', 'http://${qiniu.rtValue}', 'xxx1', '13', 14, 'PCS', 10, NULL, NULL, 'xxx2', 5.00, 50.00, 25, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('6f9cfd22-9e81-490a-9098-c94967f83394', 'ff80808160bab4fa0160bb1e01c50009', '4', '精艺', '99999', NULL, '1', '9', 1, 'PCS', 9, NULL, NULL, '1', 99.00, 891.00, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('7a1c48d5-18bf-42d6-bc8f-db17c9c53b22', '23d1d889-15a2-435a-893a-6c39edb63dcd', NULL, '升华', 'xx001', NULL, '真的', '10.0', 2, 'PCS', 1, NULL, NULL, '很不错', 5.00, 5.00, NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('7c0cb28d-2f69-4cae-bfae-23578d04f3a5', '2c90c5004ad63735014ad6d204060005', '18', '翰林', '444444', NULL, '44', '444', 4, 'PCS', 44, NULL, NULL, '44', 44.00, 1936.00, 4, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('8a7e81675ac532ff015ac53571c90001', '8a7e81ec5ac06f0d015ac06fbb850000', '3', '会龙', 'CP1009', '06.png', 'www', '1/3', 10, 'SETS', 30, NULL, NULL, 'www', 10.00, 300.00, 345, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('8a7e81675ac532ff015ac53d26d60003', '8a7e81ec5ac06f0d015ac06fbb850000', '4', '精艺', 'CP1008', '06.png', 'dsfdsf', '1/3', 10, 'SETS', 30, NULL, NULL, 'dfds', 10.00, 300.00, 345, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('8a7e81f06163e3d30161642eb7470001', 'ff80808160bab4fa0160bb1d6e760008', '10', '晶晨', '001', 'adssad', 'xxx', '11', 11, 'PCS', 1, NULL, NULL, 'xxxx', 10.00, 10.00, 111, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('8a7e827260b51f700160b520f7bf0000', '8a7e84215827fe1b015828058c360001', '16', '康达', '001', 'fj002,jpg', 'fj002,jpgfj002,jpgfj002,jpg', '11', 11, 'PCS', 2, NULL, NULL, 'fj002,jpgfj002,jpgfj002,jpg', 10.00, 20.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('8a7e827260b51f700160b523631e0001', '8a7e84215827fe1b015828058c360001', '10', '晶晨', '002', 'fj002,jpg', 'contractProductAction_tocreate', '1', 11, 'PCS', 1, NULL, NULL, 'contractProductAction_tocreate', 10.00, 10.00, 1, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('8a7e845158dc9da90158dc9f46be0000', '8a7e845158dc48ec0158dc49ce140000', '12', '平遥远江', 'CP45454', '01.png', 'erewr', '1/2', 10, 'SETS', 30, NULL, NULL, '  要求 ', 30.00, 900.00, 546, '1', NULL);
INSERT INTO `co_contract_product` VALUES ('af834d1c-bd62-4851-8908-c1096f5cd116', '9535e0c3-d054-47ea-be4e-2fd5b938ac4f', '18', '翰林', '88888', NULL, '1', '8', 1, 'PCS', 8, NULL, NULL, '8', 88.00, 704.00, 11, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('b8319753-abef-4fb9-b72d-ca5b2a913461', '2c90c5004ad63735014ad6d204060005', '1', '升华', 'xx002', NULL, '真的', '10.0', 2, 'PCS', 1, NULL, NULL, '很不错', 5.00, 5.00, NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('be4028b3-ed7c-46d3-94ba-fe26eac6809b', 'da3bee51-2dc5-440a-b1f8-98d36d49dc16', '1', '升华', '1111', NULL, '1', '1', 1, 'PCS', 11, NULL, NULL, '1', 11.00, 121.00, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('f510e878-8a40-4017-9808-112a1711ca64', '9535e0c3-d054-47ea-be4e-2fd5b938ac4f', '16', '康达', '99999', NULL, '1', '1', 1, 'PCS', 9, NULL, NULL, '1', 99.00, 891.00, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `co_contract_product` VALUES ('ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '13', '平遥鸿艺', '001', 'fj002,jpg', 'cproductcproductcproduct', NULL, 11, 'PCS', 1, NULL, NULL, 'cproductcproductcproduct', 10.00, 10.00, 1, '1', NULL);

-- ----------------------------
-- Table structure for co_export
-- ----------------------------
DROP TABLE IF EXISTS `co_export`;
CREATE TABLE `co_export`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `input_date` datetime NULL DEFAULT NULL,
  `contract_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ID集合串\\n            \\n            x,y,z',
  `customer_contract` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户的合同号,可选择多个合同',
  `lcno` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'L/C T/T',
  `consignee` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `marks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipment_port` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destination_port` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SEA/AIR',
  `price_condition` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FBO/CIF',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `box_nums` decimal(11, 0) NULL DEFAULT NULL COMMENT '冗余，为委托服务，一个报运的总箱数',
  `gross_weights` decimal(10, 2) NULL DEFAULT NULL COMMENT '冗余，为委托服务，一个报运的总毛重',
  `measurements` decimal(10, 2) NULL DEFAULT NULL,
  `state` decimal(11, 0) NULL DEFAULT NULL COMMENT '0-草稿 1-已上报 2-装箱 3-委托 4-发票 5-财务',
  `pro_num` int(11) NULL DEFAULT NULL,
  `ext_num` int(11) NULL DEFAULT NULL,
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_dept` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报运单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_export
-- ----------------------------
INSERT INTO `co_export` VALUES ('4028d3cf567275410156735276210001', '2016-08-11 00:00:00', '4028817a33812ffd013382048ff80024,4028817a33812ffd0133821a8eb5002b,4028817a33d4f8b40133d9878e88000d', '11JK1082 11JK1084 11JK1070 ', 'JK2811', 'JK2888', 'JK2844', 'JK2822', 'JK2877', 'SEA33', 'JK2866', '报运成功', 12, 12.00, 12.00, 2, 18, 5, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('4a638468-1fba-497e-adad-1a75ed263d28', NULL, '40288287616a411e01616ab546270006', NULL, '299', '299', '299', '299', '299', '299', '299', '299', 299, 299.00, 299.00, 0, 3, 21, NULL, NULL, NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_export` VALUES ('8a7e81015ad03e38015ad0408dbc0000', '2017-03-01 00:00:00', '4028817a3357462e01336d523195001a,4028817a33812ffd013382048ff80024', 'C/3847/11 11JK1082 ', 'ABCD0511', 'ABCD0588', 'ABCD0544', 'ABCD0522', 'ABCD0527', 'SEA33', 'FOB66', '报运成功', 12, 1.00, 1.00, 2, 10, 1, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('8a7e82766172fbf5016173ae10780000', '2018-02-08 12:30:42', '40288287616a411e01616ab546270006', 'cy001 ', '299', '299', '299', '299', '299', '299', '299', '299', 299, 299.00, 299.00, 0, 2, 1, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('8a7e841959483bac0159483d2bc00000', '2016-12-30 00:00:00', '8a7e845158dc48ec0158dc49ce140000,4028817a3357462e0133591b86ec0002', 'C34543543 C/3817/11 ', 'EXPORT2321', 'EXPORT2328', 'EXPORT2324', 'EXPORT2322', 'EXPORT2327', 'SEA3', 'FOB6', '申报成功', 12, 12.00, 12.00, 2, 4, 3, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('8a7e843358372ad30158372f66aa0000', '2016-11-06 00:00:00', '4028817a3357462e0133591b86ec0002,4028817a3357462e01336cc0877b0010', 'C/3817/11 11JK1080 ', 'ABCE1', '118', 'ABC14', '112', 'ABC17', '113', 'FOB16', '申报成功', 1, 1.00, 1.00, 2, 5, 4, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('8a7e843759b44c920159b4516bdb0000', '2017-01-19 00:00:00', '4028817a3357462e01336d3a0be10014, 4028817a33812ffd0133813f25940001, 2c90c5004ad63735014ad6d204060005', NULL, 'JK41', 'JK41', 'JK41', 'JK41', 'JK41', 'SEA', 'FOB', 'JK41', 1, 1.00, 1.00, 0, 35, 17, NULL, NULL, NULL, '1', NULL);
INSERT INTO `co_export` VALUES ('8a7e84635711a251015711da96e8003e', '2016-09-12 00:00:00', '8a7e878256fd4bd00156fdb0a8080004,4028817a33812ffd013382048ff80024', 'ABC 11JK1082 ', 'AJ0041', 'AJ0046', 'AJ0043', 'AJ0042', 'AJ0045', 'AIR', 'L/C', '报运成功', 12, 12.00, 12.00, 2, 3, 3, NULL, NULL, NULL, '1', NULL);

-- ----------------------------
-- Table structure for co_export_product
-- ----------------------------
DROP TABLE IF EXISTS `co_export_product`;
CREATE TABLE `co_export_product`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `export_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factory_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packing_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PCS/SETS',
  `cnumber` decimal(11, 0) NULL DEFAULT NULL,
  `box_num` decimal(11, 0) NULL DEFAULT NULL,
  `gross_weight` decimal(10, 2) NULL DEFAULT NULL,
  `net_weight` decimal(10, 2) NULL DEFAULT NULL,
  `size_length` decimal(10, 2) NULL DEFAULT NULL,
  `size_width` decimal(10, 2) NULL DEFAULT NULL,
  `size_height` decimal(10, 2) NULL DEFAULT NULL,
  `ex_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'sales confirmation 中的价格（手填）',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '收购单价=合同单价',
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SYS_C005441`(`export_id`) USING BTREE,
  INDEX `SYS_C005442`(`factory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报运单货物表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_export_product
-- ----------------------------
INSERT INTO `co_export_product` VALUES ('0007c9c2-726a-4070-9015-ab0a234081c7', '4a638468-1fba-497e-adad-1a75ed263d28', '12', 'fj001', 'SETS', 2, 11, NULL, NULL, NULL, NULL, NULL, NULL, 5.00, NULL, 1, '1', NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276210002', '4028d3cf567275410156735276210001', '9', 'JK110102', 'PCS', 1, 1, 7.00, NULL, NULL, NULL, NULL, NULL, 10.00, 10.40, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276210003', '4028d3cf567275410156735276210001', '2', 'JK169340/13076', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 36.00, 10.80, 8, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276220005', '4028d3cf567275410156735276210001', '1', 'JK1050068/11314', 'PCS', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 11.20, 11.20, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276220006', '4028d3cf567275410156735276210001', '13', 'JK103134/11989', 'PCS', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 6.00, 11.60, 7, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276220007', '4028d3cf567275410156735276210001', '1', 'JK1050154/11308', 'PCS', 4, 4, NULL, NULL, 5.00, NULL, 55.00, NULL, 7.50, 12.00, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276220008', '4028d3cf567275410156735276210001', '2', 'JK1050317/12006', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 9.50, 12.40, 9, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276230009', '4028d3cf567275410156735276210001', '1', 'JK1050152/11306', 'PCS', 4, 4, NULL, 2.00, NULL, NULL, NULL, 2.00, 8.50, 12.80, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527623000a', '4028d3cf567275410156735276210001', '2', 'JK103233/11301', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 18.00, 13.20, 11, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527623000b', '4028d3cf567275410156735276210001', '9', 'JK110101', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.50, 13.60, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527623000c', '4028d3cf567275410156735276210001', '13', 'JK103136/11988', 'PCS', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 6.30, 14.00, 5, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527624000d', '4028d3cf567275410156735276210001', '1', 'JK110101', 'PCS', 1, 1, NULL, NULL, 3.00, NULL, 3.00, NULL, 22.00, 14.40, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527624000e', '4028d3cf567275410156735276210001', '2', 'JK1050316/12005', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 12.50, 14.80, 10, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf56727541015673527624000f', '4028d3cf567275410156735276210001', '1', 'JK110102', 'PCS', 1, 1, NULL, 6.00, NULL, NULL, NULL, 6.00, 32.00, 15.20, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276240010', '4028d3cf567275410156735276210001', '1', '20-37-266/JK1050164', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 13.00, 15.60, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276250012', '4028d3cf567275410156735276210001', '1', '20-37-264/JK1051087', 'PCS', 1, 1, 1.00, NULL, NULL, NULL, NULL, NULL, 9.50, 16.00, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276250014', '4028d3cf567275410156735276210001', '2', 'JK1050201/12078', 'PCS', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 18.00, 16.40, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276280016', '4028d3cf567275410156735276210001', '1', '20-37-265/JK1050163', 'PCS', 1, 1, NULL, NULL, NULL, 4.00, NULL, NULL, 11.00, 16.80, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('4028d3cf567275410156735276280018', '4028d3cf567275410156735276210001', '13', 'JK1060019/11990', 'PCS', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 5.00, 17.20, 6, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd10001', '8a7e81015ad03e38015ad0408dbc0000', '7', '9748/6115', 'PCS', 1, 4, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 11.00, 10.40, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd10002', '8a7e81015ad03e38015ad0408dbc0000', '7', '9226/6116', 'PCS', 1, 4, 1.00, 2.00, 3.00, NULL, NULL, NULL, 11.00, 10.80, 8, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd20003', '8a7e81015ad03e38015ad0408dbc0000', '7', '9749/6525', 'PCS', 1, 4, 1.00, NULL, 3.00, NULL, NULL, NULL, 6.50, 11.20, 5, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd20004', '8a7e81015ad03e38015ad0408dbc0000', '7', '9227/6092', 'PCS', 1, 4, NULL, NULL, 3.00, NULL, 5.00, 6.00, 11.00, 11.60, 6, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd20005', '8a7e81015ad03e38015ad0408dbc0000', '7', '8708/6203', 'PCS', 1, 4, 1.00, 2.00, 3.00, NULL, 5.00, NULL, 6.50, 12.00, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd20006', '8a7e81015ad03e38015ad0408dbc0000', '7', '9954/6309', 'PCS', 1, 4, NULL, NULL, 3.00, NULL, NULL, NULL, 11.50, 12.40, 9, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd30007', '8a7e81015ad03e38015ad0408dbc0000', '7', '9956/6308', 'PCS', 600, 4, 1.00, 2.00, NULL, NULL, NULL, 6.00, 11.50, 12.80, 10, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd30008', '8a7e81015ad03e38015ad0408dbc0000', '7', '8709/6204', 'PCS', 1, 4, NULL, NULL, 3.00, NULL, NULL, NULL, 6.50, 13.20, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd30009', '8a7e81015ad03e38015ad0408dbc0000', '7', '9955/6105', 'PCS', 1, 4, NULL, NULL, NULL, NULL, 5.00, NULL, 11.50, 13.60, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e81015ad03e38015ad0408dd4000a', '8a7e81015ad03e38015ad0408dbc0000', '1', '20-37-265/JK1050163', 'PCS', 1, 1, NULL, 2.00, 3.00, NULL, NULL, NULL, 11.00, 14.00, 7, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e82766172fbf5016173ae108c0001', '8a7e82766172fbf5016173ae10780000', '12', '001', 'PCS', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, NULL, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e82766172fbf5016173ae108d0003', '8a7e82766172fbf5016173ae10780000', '12', 'fj001', 'SETS', 2, 11, NULL, NULL, NULL, NULL, NULL, NULL, 5.00, NULL, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e841959483bac0159483d2bd10001', '8a7e841959483bac0159483d2bc00000', '2', '2964', 'PCS', 144, 1, 1.00, NULL, NULL, NULL, NULL, NULL, 24.00, 10.80, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e841959483bac0159483d2bd20003', '8a7e841959483bac0159483d2bc00000', '2', '2976', 'PCS', 144, 1, NULL, 2.00, NULL, NULL, NULL, 6.00, 17.00, 11.20, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e841959483bac0159483d2bd20006', '8a7e841959483bac0159483d2bc00000', '2', '2977', 'PCS', 144, 1, NULL, NULL, 3.00, NULL, 5.00, NULL, 17.00, 10.40, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e841959483bac0159483d2bd20007', '8a7e841959483bac0159483d2bc00000', '12', 'CP45454', 'SETS', 30, 10, NULL, NULL, NULL, 4.00, NULL, NULL, 30.00, 11.60, 546, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843358372ad30158372f66b40001', '8a7e843358372ad30158372f66aa0000', '2', '2976', 'PCS', 144, 1, NULL, NULL, NULL, 4.00, 9.00, NULL, 17.00, 11.60, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843358372ad30158372f66b50004', '8a7e843358372ad30158372f66aa0000', '2', '2977', 'PCS', 144, 1, NULL, NULL, NULL, NULL, 5.00, 10.00, 17.00, 10.40, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843358372ad30158372f66b50005', '8a7e843358372ad30158372f66aa0000', '2', '2964', 'PCS', 144, 1, 1.00, 6.00, NULL, NULL, NULL, NULL, 24.00, 11.20, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843358372ad30158372f66b60007', '8a7e843358372ad30158372f66aa0000', '3', 'JK1700011', 'PCS', 504, 24, NULL, 2.00, 7.00, NULL, NULL, NULL, 4.60, 12.00, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843358372ad30158372f66b60008', '8a7e843358372ad30158372f66aa0000', '2', '2965', 'PCS', 144, 1, NULL, NULL, 3.00, 8.00, NULL, NULL, 17.00, 10.80, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516be90001', '8a7e843759b44c920159b4516bdb0000', '7', '8709', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6.50, NULL, 24, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bea0002', '8a7e843759b44c920159b4516bdb0000', '2', '8760', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 26, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bea0003', '8a7e843759b44c920159b4516bdb0000', '2', '9868', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 27, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bea0004', '8a7e843759b44c920159b4516bdb0000', '4', '5337', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.00, NULL, 15, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bea0006', '8a7e843759b44c920159b4516bdb0000', '2', '5189', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 14.00, NULL, 12, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516beb0007', '8a7e843759b44c920159b4516bdb0000', '4', '4997', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 10.50, NULL, 5, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516beb0009', '8a7e843759b44c920159b4516bdb0000', '4', '4994', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.50, NULL, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516beb000b', '8a7e843759b44c920159b4516bdb0000', '4', '4995', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.50, NULL, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bec000d', '8a7e843759b44c920159b4516bdb0000', '2', '600MA', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 18.00, NULL, 17, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bec000e', '8a7e843759b44c920159b4516bdb0000', '7', '9749', 'PCS', 304, 4, NULL, NULL, NULL, NULL, NULL, NULL, 6.50, NULL, 29, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bec000f', '8a7e843759b44c920159b4516bdb0000', '2', '602MA', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 19.00, NULL, 18, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bec0010', '8a7e843759b44c920159b4516bdb0000', '2', '5117', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 17.00, NULL, 10, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bed0012', '8a7e843759b44c920159b4516bdb0000', '7', 'JK1014003', 'PCS', 1200, 2, NULL, NULL, NULL, NULL, NULL, NULL, 7.50, NULL, 3, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bed0014', '8a7e843759b44c920159b4516bdb0000', '4028817a33d4f8b40133d9989f5e0024', '5095', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 14.00, NULL, 8, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bed0015', '8a7e843759b44c920159b4516bdb0000', '2', '9869', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 28, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bed0016', '8a7e843759b44c920159b4516bdb0000', '4', '5400', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 11.50, NULL, 16, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf10018', '8a7e843759b44c920159b4516bdb0000', '4', '5336', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.00, NULL, 14, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf2001a', '8a7e843759b44c920159b4516bdb0000', '2', '843MA', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 21, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf2001b', '8a7e843759b44c920159b4516bdb0000', '4', '4993', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8.50, NULL, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf2001d', '8a7e843759b44c920159b4516bdb0000', '4', '4996', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 10.50, NULL, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf3001f', '8a7e843759b44c920159b4516bdb0000', '2', '844MA', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 22, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf30020', '8a7e843759b44c920159b4516bdb0000', '4', '5331', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 11.50, NULL, 13, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf30022', '8a7e843759b44c920159b4516bdb0000', '2', '603MA', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 20.00, NULL, 19, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf30023', '8a7e843759b44c920159b4516bdb0000', '7', '9749', 'PCS', 304, 4, NULL, NULL, NULL, NULL, NULL, NULL, 6.50, NULL, 30, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf30024', '8a7e843759b44c920159b4516bdb0000', '2', '5118', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.00, NULL, 11, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf40026', '8a7e843759b44c920159b4516bdb0000', '4', '4998', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 10.50, NULL, 6, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf40028', '8a7e843759b44c920159b4516bdb0000', '2', '8759', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 15.00, NULL, 25, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf40029', '8a7e843759b44c920159b4516bdb0000', '1', 'JK1014005', 'PCS', 1800, 4, NULL, NULL, NULL, NULL, NULL, NULL, 5.30, NULL, 4, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf4002b', '8a7e843759b44c920159b4516bdb0000', '4028817a33d4f8b40133d9989f5e0024', '5094', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 14.50, NULL, 7, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf5002c', '8a7e843759b44c920159b4516bdb0000', '1', 'JK1014001', 'PCS', 1000, 1, NULL, NULL, NULL, NULL, NULL, NULL, 16.50, NULL, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf5002e', '8a7e843759b44c920159b4516bdb0000', '7', '9749', 'PCS', 304, 4, NULL, NULL, NULL, NULL, NULL, NULL, 6.50, NULL, 31, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf5002f', '8a7e843759b44c920159b4516bdb0000', '1', 'JK1080766-3', 'PCS', 1800, 3, NULL, NULL, NULL, NULL, NULL, NULL, 5.30, NULL, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf70031', '8a7e843759b44c920159b4516bdb0000', '7', '5099', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 11.00, NULL, 9, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf70032', '8a7e843759b44c920159b4516bdb0000', '2', '6998', 'PCS', 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, 19.00, NULL, 20, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e843759b44c920159b4516bf70034', '8a7e843759b44c920159b4516bdb0000', '7', '8708', 'PCS', 600, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6.50, NULL, 23, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e84635711a251015711da96e8003f', '8a7e84635711a251015711da96e8003e', '1', '20-37-264/JK1051087', 'PCS', 1200, 1, 1.00, 2.00, NULL, NULL, 5.00, 9.00, 9.50, 10.40, 1, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e84635711a251015711da96e90041', '8a7e84635711a251015711da96e8003e', '12', 'CP1002', 'SETS', 10, 5, NULL, NULL, 3.00, 7.00, NULL, NULL, 30.00, 10.80, 546, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('8a7e84635711a251015711da96ea0043', '8a7e84635711a251015711da96e8003e', '1', '20-37-265/JK1050163', 'PCS', 1200, 1, NULL, 2.00, NULL, 4.00, 8.00, NULL, 11.00, 11.20, 2, NULL, NULL);
INSERT INTO `co_export_product` VALUES ('af2cc365-aa7c-48ce-8f80-1e11ff2e3244', '4a638468-1fba-497e-adad-1a75ed263d28', '12', '001', 'PCS', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, NULL, 1, '1', NULL);

-- ----------------------------
-- Table structure for co_ext_cproduct
-- ----------------------------
DROP TABLE IF EXISTS `co_ext_cproduct`;
CREATE TABLE `co_ext_cproduct`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contract_product_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购销合同id',
  `factory_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factory_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packing_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PCS/SETS',
  `cnumber` decimal(11, 0) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动计算: 数量x单价',
  `product_request` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SYS_C005445`(`contract_product_id`) USING BTREE,
  INDEX `SYS_C005446`(`factory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_ext_cproduct
-- ----------------------------
INSERT INTO `co_ext_cproduct` VALUES ('1e707c09-8fee-4e55-b834-fef445e7371d', 'be4028b3-ed7c-46d3-94ba-fe26eac6809b', 'da3bee51-2dc5-440a-b1f8-98d36d49dc16', '', '平遥远江', '2', NULL, '2', '2', 2, 2.00, 4.00, '2', 2, '1', '传智播客教育股份有限公司');
INSERT INTO `co_ext_cproduct` VALUES ('238e78fd-4bdb-4381-bb63-8c1e425c0160', '42b8eaa7-c7d2-40e0-8727-e90cb209abae', '2c90c5004ad63735014ad6d204060005', '4028817a33de41d80133e982a18a001c', '太谷PVC', '002', 'http://${qiniu.rtValue}', '2', '2', 2, 12.00, 24.00, '2', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('33b947c7-8652-47c0-a52f-dd78277452a0', '42b8eaa7-c7d2-40e0-8727-e90cb209abae', '2c90c5004ad63735014ad6d204060005', '4028817a389cc7b701389d1efd940001', '宇虹包装厂', '001', 'http://${qiniu.rtValue}', '1', '1', 2, 1.00, 2.00, 'xxxxx', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a3357462e013359291f640009', '4028817a3357462e0133592355750006', '4028817a3357462e0133591b86ec0002', '16', '康达', '2976', 'undefined', '彩盒，新菲林\\r\\n配明料糖缸带盖子\\r\\n彩盒尺寸：25.7X25.7X35.7CM', 'PCS', 144, 3.90, 561.60, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a3357462e013359291f64000a', '4028817a3357462e0133592355750006', '4028817a3357462e0133591b86ec0002', '16', '康达', '2976', 'undefined', '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：21.5X21.5X41CM', 'PCS', 144, 3.30, 475.20, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33812ffd0133820c0a460029', '4028817a33812ffd013382048ff80026', '4028817a33812ffd013382048ff80024', '19', '综艺花纸', '20-37-265/JK1050163', '1af851ab-98ff-4227-ba39-1175dca33c6f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 'PCS', 1200, 0.38, 456.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33d4f8b40133d994c45e0022', '4028817a33d4f8b40133d9878e880016', '4028817a33d4f8b40133d9878e88000d', '19', '综艺花纸', 'JK1050201/12078', NULL, '蒙砂白花纸\\r\\n烤在蛋糕罩上\\r\\n送祁县光华厂', 'PCS', 204, 0.80, 163.20, '1.产品的颜色、造型、尺寸、务必同我司提供的样稿一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交\n\n期:2011年11月20日送指定工厂。', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33ecdbf70133edfc84d40001', '4028817a3357462e01336d3a0be10018', '4028817a3357462e01336d3a0be10014', '19', '综艺花纸', 'JK1014005', '94d2d773-24b6-412e-b0e3-0fc9dddf0955.png', '低温鱼花纸\\r\\n明料低口杯\\r\\n祁县宏艺厂', 'PCS', 1800, 1.20, 2160.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33ecdbf70133edfc84e40002', '4028817a3357462e01336d3a0be10019', '4028817a3357462e01336d3a0be10014', '19', '综艺花纸', 'JK1080766-3', '29bb909d-d527-475d-bfbe-e5e05a02349c.png', '套3白花纸\\r\\n\\r\\n送祁县宏艺厂', 'SETS', 600, 0.60, 360.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33ecdbf70133edfc84e40004', '4028817a3357462e01336d3a0be10016', '4028817a3357462e01336d3a0be10014', '19', '综艺花纸', 'JK1014001', '7a3d341f-f473-44ce-9bd4-c7f2b87343ca.png', '低温鱼花纸\\r\\n明料大碗\\r\\n送祁县宏艺厂', 'PCS', 1000, 2.40, 2400.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33ecdbf70133edfc84e40005', '4028817a3357462e01336d3a0be10015', '4028817a3357462e01336d3a0be10014', '19', '综艺花纸', 'JK1014003', '73980c53-44f6-4232-8c04-9d08a66eeccb.png', '低温鱼花纸\\r\\n明料盘子\\r\\n\\r\\n送祁县天顺厂', 'PCS', 1200, 3.80, 4560.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fcdff5490011', '4028817a33fc4e280133fcdb13f40010', '4028817a33d4f8b40133d9bea39b002f', '19', '综艺花纸', 'JK046/JK1050201', 'undefined', '蒙砂白花纸\\r\\n烤在蛋糕罩子上\\r\\n送祁县光华厂', 'PCS', 600, 0.80, 480.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月15日；', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fcdff5490012', '4028817a33d4f8b40133d9bea39b0032', '4028817a33d4f8b40133d9bea39b002f', '20', '喜福来', 'JK1050807/JK033', NULL, '套6全明料酒杯\\r\\n杯碗电镀渐变色，挺底电镀\\r\\n尺寸：8X24CM高', 'SETS', 300, 21.00, 6300.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2011年12月15日/工厂。                          没有经过我司同意无故\n\n延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fcdff5490013', '4028817a33d4f8b40133d9bea39b0030', '4028817a33d4f8b40133d9bea39b002f', '20', '喜福来', 'JK1050806/JK032', NULL, '套6全明料香槟杯\\r\\n杯碗电镀渐变色，挺底电镀\\r\\n尺寸：5.7X25CM高', 'SETS', 320, 21.00, 6720.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2011年12月15日/工厂。                          没有经过我司同意无故\n\n延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d0029', '4028817a33fc4e280133fd81e7d70027', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', 'JK1040009/141760', NULL, '白色字母花纸 \\r\\n送祁县宏艺厂', 'PCS', 300, 0.90, 270.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d002a', '4028817a33fc4e280133fd81e7d7001f', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', 'J859102682/113860', NULL, '白色字母花纸\\r\\nSTORAGE ONLY\\r\\n祁县宏艺厂', 'PCS', 300, 0.40, 120.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d002b', '4028817a33fc4e280133fd81e7d70026', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', 'JK10501218/160380', NULL, '白\n\n色字母花纸 \\r\\n送祁县宏艺厂', 'PCS', 600, 0.40, 240.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d002c', '4028817a33fc4e280133fd81e7d70021', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', '123540', NULL, '白色字母花纸(HIGH TEA)\\r\\n字体：ENGLISH SCRIPT\\r\\n尺寸：18X5.5CM\\r\\n祁县光华厂', 'PCS', 100, 0.30, 30.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 5, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d002d', '4028817a33fc4e280133fd81e7d70022', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', 'JK1052446/158080', NULL, '白色字母花纸\\r\\n\\r\\n \\r\\n祁县会龙厂', 'PCS', 702, 0.25, 175.50, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fd906b0d002e', '4028817a33fc4e280133fd81e7d7001e', '4028817a33fc4e280133fd81e7d7001d', '19', '综艺花纸', '169280', 'undefined', '白色字母花纸(HIGH TEA)\\r\\n字体：ENGLISH SCRIPT\\r\\n尺寸：18X5.5CM\\r\\n祁县光华厂', 'PCS', 100, 0.30, 30.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月25日；', 6, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fded2e6d0040', '4028817a33fc4e280133fde6504f0039', '4028817a33fc4e280133fd9f8b4e002f', '19', '综艺花纸', 'JK169340/13076', 'undefined', '蒙砂白花纸\\r\\n\\\"烤在蛋糕罩子上(25X26CM)\\r\\n\\\"\\r\\n祁县光华厂', 'PCS', 200, 1.02, 204.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月20日', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fded2e6d0041', '4028817a33fc4e280133fde6504f0038', '4028817a33fc4e280133fd9f8b4e002f', '19', '综艺花纸', 'JK1050198/12860', 'undefined', '蒙砂白花纸\\r\\n烤在红酒杯（11X19CM)上\\r\\n送平遥鸿艺', 'PCS', 400, 0.49, 196.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月20日', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fded2e6d0042', '4028817a33fc4e280133fde6504f003c', '4028817a33fc4e280133fd9f8b4e002f', '19', '综艺花纸', 'JK1050195/12859', 'undefined', '蒙砂白花纸\\r\\n烤在香槟杯(8X21CM)上\\r\\n送平遥鸿艺', 'PCS', 400, 0.40, 160.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月20日', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a33fc4e280133fded2e6d0043', '4028817a33fc4e280133fde6504f0037', '4028817a33fc4e280133fd9f8b4e002f', '19', '综艺花纸', 'JK1050201/12078', NULL, '蒙砂白花纸\\r\\n烤在蛋糕罩子上\\r\\n祁县光华厂', 'PCS', 402, 0.80, 321.60, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月20日；', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd3200001', '4028817a33812ffd0133816aacd40019', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4998', 'undefined', '全明料死模风灯 ，电镀花银喷紫色\\r\\n尺寸：11.5X30.5CM', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 6, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0002', '4028817a33812ffd0133816aacd40017', '4028817a33812ffd0133813f25940001', '19', '综艺花纸', '5117', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 'PCS', 300, 3.00, 900.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月30日；', 12, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0003', '4028817a33812ffd0133813f25a30002', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4993', NULL, '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：11.5X20.3CM\\r\\n毛坯1月25日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0004', '4028817a33812ffd0133816aacd40018', '4028817a33812ffd0133813f25940001', '22', '瑞成', '5400', 'undefined', '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：17X23CM高', 'PCS', 300, 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 10, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0005', '4028817a33812ffd0133816aacd4000d', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4996', 'undefined', '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：11.5X30.5CM高', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0006', '4028817a33812ffd0133816aacd40014', '4028817a33812ffd0133813f25940001', '22', '瑞成', '5336', NULL, '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：14.5X20CM高', 'PCS', 300, 2.00, 600.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致，\\r\\n       并将验货照片传回\n\n公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重后\n\n果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 8, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0007', '4028817a33812ffd0133813f25a30003', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4994', 'undefined', '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：11.5X20.3CM高', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0008', '4028817a33812ffd0133816aacd40011', '4028817a33812ffd0133813f25940001', '20', '喜福来', '6998', NULL, '全明料蛋糕盘，盘沿电镀\\r\\n尺寸：6-1/2\\\"X12-1/2\\\"高', 'PCS', 300, 6.00, 1800.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 11, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f0009', '4028817a33812ffd0133816aacd4000c', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4997', NULL, '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：11.5X30.5CM高', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 5, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f000a', '4028817a33812ffd0133816aacd40012', '4028817a33812ffd0133813f25940001', '19', '综艺花纸', '5118', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 'PCS', 600, 3.00, 1800.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月30日；', 13, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f000b', '4028817a33812ffd0133816aacd40015', '4028817a33812ffd0133813f25940001', '22', '瑞成', '5337', NULL, '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：14.5X20CM高', 'PCS', 300, 2.00, 600.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 9, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f000c', '4028817a33812ffd0133816aacc40009', '4028817a33812ffd0133813f25940001', '22', '瑞成', '5331', 'undefined', '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：17X23CM高', 'PCS', 300, 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 7, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a343a5c9101343a6fd35f000d', '4028817a33812ffd0133813f25a30004', '4028817a33812ffd0133813f25940001', '22', '瑞成', '4995', 'undefined', '全明料死模风灯，电镀花银喷紫色\\r\\n尺寸：11.5X20.3CM', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b730023', '4028817a3420e78a013421a693820007', '4028817a3420e78a013421a693730001', '19', '综艺花纸', '5117', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 'PCS', 300, 3.00, 900.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2012\n\n年1月15日。', 11, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b730024', '4028817a3420e78a013421e2e3c1001a', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5337', 'e877a4e2-2e48-4b06-91a8-3fb64f150a0f.jpg', '全明料死模风灯，电镀花银喷蓝色      \\r\\n尺寸：14.5X20CM高      \\r\\n1只/五层内盒      12只/大箱      \\r\\n毛坯1月30日送', 'PCS', 300, 3.00, 900.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 9, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b730027', '4028817a3420e78a013421a693820002', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4995', 'b232e729-a02f-48b2-987b-2c6311827816.jpg', '全明料死模风灯，电镀花银喷浅紫色\\r\\n明料挺底      \\r\\n尺寸：11.5X20.3CM    \\r\\n1只/五层内盒     12只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 \\r\\n       没有经过\n\n我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b730029', '4028817a3420e78a013421a693820004', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4996', '987692c0-6e47-4117-b6c8-3dbbeaca1b0c.jpg', '全明料死模风灯，电镀花银喷浅绿色\\r\\n明料挺底      \\r\\n尺寸：11.5X30.5CM高    \\r\\n1只/五层内盒      6只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 \\r\\n       没有经过\n\n我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b73002a', '4028817a3420e78a013421a693820006', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4993', 'a803fa9e-dda1-476a-a822-a51b226aca39.jpg', '全明料死模风灯，电镀花银喷浅绿色 \\r\\n明料挺底      \\r\\n尺寸：11.5X20.3CM    \\r\\n1只/五层内盒      12只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意,无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b73002b', '4028817a3420e78a013421d2e3fe0014', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5331', '51902cb9-1650-480b-8373-2da4c3f2338b.jpg', '全明料死模风灯，电镀花银喷绿色      \\r\\n尺寸：17X23CM高      \\r\\n1只/五层内盒      6只/大箱      \\r\\n毛坯1月30日送', 'PCS', 300, 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 7, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cad7b73002d', '4028817a3420e78a013421a693820003', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4994', '05b37ddc-8904-4df3-8167-b98129c600de.jpg', '全明料死模风灯，电镀花银喷浅蓝色\\r\\n明料挺底      \\r\\n尺寸：11.5X20.3CM    \\r\\n1只/五层内盒     12只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 \\r\\n       没有经过\n\n我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cadeab80031', '4028817a3420e78a013421a693920011', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4997', '7dbc495e-a12c-4eec-9975-c93c1b3f4297.jpg', '全明料死模风灯，电镀花银喷浅蓝色\\r\\n明料挺底      \\r\\n尺寸：11.5X30.5CM高    \\r\\n1只/五层内盒      6只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 5, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cadeab80037', '4028817a3420e78a013421a693820005', '4028817a3420e78a013421a693730001', '19', '综艺花纸', '5118', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 'PCS', 300, 3.00, 900.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2012\n\n年1月15日。', 12, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cadec6d003a', '4028817a3420e78a013421d2e3fe0013', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5336', 'c8350cd2-47ae-4054-ad81-70004fe4eb44.jpg', '全明料死模风灯，电镀花银喷绿色      \\r\\n 尺寸：14.5X20CM高      \\r\\n1只/五层内盒      12只/大箱      \\r\\n毛坯1月30日送', 'PCS', 300, 3.00, 900.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 8, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cadec6d0042', '4028817a3420e78a013421a69382000e', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '4998', '44fc2f77-af8a-42d3-8d9b-fa2bafa8f47a.jpg', '全明料死模风灯，电镀花银喷浅紫色\\r\\n明料挺底      \\r\\n尺寸：11.5X30.5CM高    \\r\\n1只/五层内盒      6只/大箱  \\r\\n毛坯1月30日送', 'PCS', 300, 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 \\r\\n       没有经过\n\n我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 6, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353cadec6d0044', '4028817a3420e78a013421e2e3c10016', '4028817a3420e78a013421a693730001', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5400', '601585a1-ba16-42bb-9ffb-\n\nd187b521be1f.jpg', '全明料死模风灯，电镀花银喷蓝色      \\r\\n尺寸：17X23CM高      \\r\\n1只/五层内盒      6只/大箱      \\r\\n毛坯1月30日送', 'PCS', 300, 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 10, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353d39f06c005d', '4028817a353b8d8e01353d32350d0051', '4028817a353b8d8e01353d15008d0046', '19', '综艺花纸', '5117', 'aec0cd7f-795e-4c5f-b8c5-532b6479c4be.jpg', '白金字母花纸\\r\\nSWEETS\\r\\n安全包装送祁县光华厂', 'PCS', 100, 3.00, 300.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2012\n\n年2月5日。', 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353d39f06c005e', '4028817a353b8d8e01353d32350d005b', '4028817a353b8d8e01353d15008d0046', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5336', '4436f9d7-b0e2-4926-9cd4-f6c66333c290.jpg', '全明料死模风灯，电镀花银喷绿色      \\r\\n       \\r\\n尺寸：14.5X20CM高 \\r\\n1只/五层内盒      12只/大箱      \\r\\n毛坯1月30日送', 'PCS', 156, 3.00, 468.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 4, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353d39f06c005f', '4028817a353b8d8e01353d32350d005a', '4028817a353b8d8e01353d15008d0046', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5330', 'be775015-234a-4504-ad52-af6af53d2a9c.jpg', '全明料死模风灯，电镀花银喷紫色      \\r\\n      \\r\\n尺寸：14.5X20CM高\\r\\n1只/五层内盒      12只/大箱      \\r\\n毛坯1月30日送', 'PCS', 156, 3.00, 468.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353d39f06c0060', '4028817a353b8d8e01353d32350d0055', '4028817a353b8d8e01353d15008d0046', '19', '综艺花纸', '5118', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n安全包装送祁县光华厂', 'PCS', 100, 3.00, 300.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2012\n\n年2月5日。', 2, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('4028817a353b8d8e01353d39f06c0061', '4028817a353b8d8e01353d32350d0057', '4028817a353b8d8e01353d15008d0046', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', '5337', '673a4e11-3706-4beb-b958-\n\nee1d7c564b3b.jpg', '全明料死模风灯，电镀花银喷蓝色      \\r\\n       \\r\\n尺寸：14.5X20CM高      \\r\\n1只/五层内盒      12只/大箱\n\n    \\r\\n毛坯1月30日送', 'PCS', 156, 3.00, 468.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年2月15日/工厂。       没有经过我司同意无故延期交货造成严重后果\n\n的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 5, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('40288286607ea08c01607ecc5e8b0006', '40288286607ea08c01607ea3d9500001', 'ff8080816077bbb3016077bd30b10000', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', 'fj001', 'fj002,jpg', 'sd', 'PCS', 1, 10.00, 10.00, 'dsad', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('40288287617040310161707a8a1d0002', '402882876170403101617079e0540000', '40288287616a411e01616ab546270006', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', 'FJ1234', 'lv.png', NULL, 'PCS', 21, 11.00, 231.00, NULL, 1, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('93f91ed9-518f-49b1-bd5a-da971397153a', '42b8eaa7-c7d2-40e0-8727-e90cb209abae', '2c90c5004ad63735014ad6d204060005', '4028817a3632e86601363344d16d0001', '淄博花纸厂', '003', 'http://${qiniu.rtValue}', '3', '3', 3, 3.00, 9.00, 'abcdef', 3, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b3460160b5b5ea520001', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', NULL, 'fj002,jpg', NULL, NULL, 1, 10.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b3460160b5b6f3e80002', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a33d4f8b40133d9989f5e0024', '民鑫', NULL, 'fj002,jpg', NULL, NULL, 1, 10.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5ba180b0000', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a353b8d8e0135415bf0a90070', '宇津水龙头厂', NULL, 'fj002,jpg', NULL, NULL, 1, 10.00, 10.00, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5bb86f10001', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a35e0895e0135ec7a4dbe0087', '西安方圆工贸', NULL, 'adssad', NULL, NULL, 1, 5.00, 5.00, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5bdcd370003', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', NULL, NULL, NULL, 'fj002,jpg', NULL, NULL, 2, 15.00, 30.00, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5bedc3e0004', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', NULL, 'fj002,jpg', NULL, NULL, 1, 10.00, 10.00, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5bf2a660005', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', NULL, NULL, NULL, NULL, 1, 10.00, 10.00, NULL, NULL, NULL, NULL);
INSERT INTO `co_ext_cproduct` VALUES ('ff80808160b5b99e0160b5c0471b0006', 'ff80808160b5b3460160b5b4d5500000', '8a7e84105823102a01582310fcd70000', '4028817a33de41d80133e982a18a001c', '太谷PVC', NULL, 'fj002,jpg', NULL, NULL, 1, 10.00, 10.00, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for co_ext_eproduct
-- ----------------------------
DROP TABLE IF EXISTS `co_ext_eproduct`;
CREATE TABLE `co_ext_eproduct`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `export_product_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `export_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属报运单id',
  `factory_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cnumber` decimal(11, 0) NULL DEFAULT NULL,
  `packing_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PCS/SETS',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动计算: 数量x单价',
  `product_request` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SYS_C005449`(`factory_id`) USING BTREE,
  INDEX `SYS_C005450`(`export_product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报运附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_ext_eproduct
-- ----------------------------
INSERT INTO `co_ext_eproduct` VALUES ('4028d3cf567275410156735276210004', '4028d3cf567275410156735276210003', '4028d3cf567275410156735276210001', '19', 'JK169340/13076', 'undefined', '蒙砂白花纸\\r\\n烤在蛋糕罩上\\r\\n送祁县光华厂', 464, 'PCS', 1.02, 473.28, '1.产品的颜色、造型、尺寸、务必同我司提供样稿一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月20日。', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('4028d3cf567275410156735276250011', '4028d3cf567275410156735276240010', '4028d3cf567275410156735276210001', '19', '20-37-266/JK1050164', '73be2c8a-b961-4ae9-899a-2d259ecd152b.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.40, 480.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 3, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('4028d3cf567275410156735276250013', '4028d3cf567275410156735276250012', '4028d3cf567275410156735276210001', '19', '20-37-264/JK1051087', 'bdf6ff59-ab4c-4218-a554-361ec409a04f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.35, 420.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('4028d3cf567275410156735276270015', '4028d3cf567275410156735276250014', '4028d3cf567275410156735276210001', '19', 'JK1050201/12078', NULL, '蒙砂白花纸\\r\\n烤在蛋糕罩上\\r\\n送祁县光华厂', 204, 'PCS', 0.80, 163.20, '1.产品的颜色、造型、尺寸、务必同我司提供的样稿一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交\n\n期:2011年11月20日送指定工厂。', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('4028d3cf567275410156735276280017', '4028d3cf567275410156735276280016', '4028d3cf567275410156735276210001', '19', '20-37-265/JK1050163', '1af851ab-98ff-4227-ba39-1175dca33c6f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.38, 456.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e81015ad03e38015ad0408dd4000b', '8a7e81015ad03e38015ad0408dd4000a', '8a7e81015ad03e38015ad0408dbc0000', '19', '20-37-265/JK1050163', '1af851ab-98ff-4227-ba39-1175dca33c6f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.38, 456.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e82766172fbf5016173ae108c0002', '8a7e82766172fbf5016173ae108c0001', '8a7e82766172fbf5016173ae10780000', '4028817a33ecdbf70133ee202e49000b', 'FJ1234', 'lv.png', NULL, 21, 'PCS', 11.00, 231.00, NULL, 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e841959483bac0159483d2bd10002', '8a7e841959483bac0159483d2bd10001', '8a7e841959483bac0159483d2bc00000', '16', '2964', NULL, '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：22.5X22.5X48.5CM', 144, 'PCS', 4.00, 576.00, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e841959483bac0159483d2bd20004', '8a7e841959483bac0159483d2bd20003', '8a7e841959483bac0159483d2bc00000', '16', '2976', 'undefined', '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：21.5X21.5X41CM', 144, 'PCS', 3.30, 475.20, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 3, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e841959483bac0159483d2bd20005', '8a7e841959483bac0159483d2bd20003', '8a7e841959483bac0159483d2bc00000', '16', '2976', 'undefined', '彩盒，新菲林\\r\\n配明料糖缸带盖子\\r\\n彩盒尺寸：25.7X25.7X35.7CM', 144, 'PCS', 3.90, 561.60, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 4, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843358372ad30158372f66b50002', '8a7e843358372ad30158372f66b40001', '8a7e843358372ad30158372f66aa0000', '16', '2976', 'undefined', '彩盒，新菲林\\r\\n配明料糖缸带盖子\\r\\n彩盒尺寸：25.7X25.7X35.7CM', 144, 'PCS', 3.90, 561.60, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 4, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843358372ad30158372f66b50003', '8a7e843358372ad30158372f66b40001', '8a7e843358372ad30158372f66aa0000', '16', '2976', 'undefined', '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：21.5X21.5X41CM', 144, 'PCS', 3.30, 475.20, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 3, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843358372ad30158372f66b50006', '8a7e843358372ad30158372f66b50005', '8a7e843358372ad30158372f66aa0000', '16', '2964', NULL, '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：22.5X22.5X48.5CM', 144, 'PCS', 4.00, 576.00, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843358372ad30158372f66b60009', '8a7e843358372ad30158372f66b60008', '8a7e843358372ad30158372f66aa0000', '16', '2965', 'undefined', '彩盒，新菲林\\r\\n配全明料糖缸带盖子\\r\\n彩盒尺寸：20X20X41CM', 144, 'PCS', 3.20, 460.80, '1.彩盒要求350克面纸；\\r\\n2.工厂待用安全包装，待我司运至工厂；\\r\\n3.工厂免费提供1%余量，以防划伤，破损；\\r\\n4.交期:2011年11月05日。', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bea0005', '8a7e843759b44c920159b4516bea0004', '8a7e843759b44c920159b4516bdb0000', '22', '5337', NULL, '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：14.5X20CM高', 300, 'PCS', 2.00, 600.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 9, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516beb0008', '8a7e843759b44c920159b4516beb0007', '8a7e843759b44c920159b4516bdb0000', '22', '4997', NULL, '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：11.5X30.5CM高', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 5, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516beb000a', '8a7e843759b44c920159b4516beb0009', '8a7e843759b44c920159b4516bdb0000', '22', '4994', 'undefined', '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：11.5X20.3CM高', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bec000c', '8a7e843759b44c920159b4516beb000b', '8a7e843759b44c920159b4516bdb0000', '22', '4995', 'undefined', '全明料死模风灯，电镀花银喷紫色\\r\\n尺寸：11.5X20.3CM', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 3, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bec0011', '8a7e843759b44c920159b4516bec0010', '8a7e843759b44c920159b4516bdb0000', '19', '5117', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 300, 'PCS', 3.00, 900.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月30日；', 12, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bed0013', '8a7e843759b44c920159b4516bed0012', '8a7e843759b44c920159b4516bdb0000', '19', 'JK1014003', '73980c53-44f6-4232-8c04-9d08a66eeccb.png', '低温鱼花纸\\r\\n明料盘子\\r\\n\\r\\n送祁县天顺厂', 1200, 'PCS', 3.80, 4560.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 3, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf10017', '8a7e843759b44c920159b4516bed0016', '8a7e843759b44c920159b4516bdb0000', '22', '5400', 'undefined', '全明料死模风灯，电镀花银喷蓝色\\r\\n尺寸：17X23CM高', 300, 'PCS', 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 10, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf20019', '8a7e843759b44c920159b4516bf10018', '8a7e843759b44c920159b4516bdb0000', '22', '5336', NULL, '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：14.5X20CM高', 300, 'PCS', 2.00, 600.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致，\\r\\n       并将验货照片传回\n\n公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重后\n\n果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 8, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf2001c', '8a7e843759b44c920159b4516bf2001b', '8a7e843759b44c920159b4516bdb0000', '22', '4993', NULL, '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：11.5X20.3CM\\r\\n毛坯1月25日送', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf3001e', '8a7e843759b44c920159b4516bf2001d', '8a7e843759b44c920159b4516bdb0000', '22', '4996', 'undefined', '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：11.5X30.5CM高', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 4, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf30021', '8a7e843759b44c920159b4516bf30020', '8a7e843759b44c920159b4516bdb0000', '22', '5331', 'undefined', '全明料死模风灯，电镀花银喷绿色\\r\\n尺寸：17X23CM高', 300, 'PCS', 3.50, 1050.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 7, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf40025', '8a7e843759b44c920159b4516bf30024', '8a7e843759b44c920159b4516bdb0000', '19', '5118', 'undefined', '白金字母花纸\\r\\nSWEETS\\r\\n送祁县光华厂', 600, 'PCS', 3.00, 1800.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年11月30日；', 13, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf40027', '8a7e843759b44c920159b4516bf40026', '8a7e843759b44c920159b4516bdb0000', '22', '4998', 'undefined', '全明料死模风灯 ，电镀花银喷紫色\\r\\n尺寸：11.5X30.5CM', 300, 'PCS', 1.70, 510.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 6, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf4002a', '8a7e843759b44c920159b4516bf40029', '8a7e843759b44c920159b4516bdb0000', '19', 'JK1014005', '94d2d773-24b6-412e-b0e3-0fc9dddf0955.png', '低温鱼花纸\\r\\n明料低口杯\\r\\n祁县宏艺厂', 1800, 'PCS', 1.20, 2160.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 4, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf5002d', '8a7e843759b44c920159b4516bf5002c', '8a7e843759b44c920159b4516bdb0000', '19', 'JK1014001', '7a3d341f-f473-44ce-9bd4-c7f2b87343ca.png', '低温鱼花纸\\r\\n明料大碗\\r\\n送祁县宏艺厂', 1000, 'PCS', 2.40, 2400.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf50030', '8a7e843759b44c920159b4516bf5002f', '8a7e843759b44c920159b4516bdb0000', '19', 'JK1080766-3', '29bb909d-d527-475d-bfbe-e5e05a02349c.png', '套3白花纸\\r\\n\\r\\n送祁县宏艺厂', 600, 'SETS', 0.60, 360.00, '1.产品的颜色、造型、尺寸、务必同提供的样品一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011年\n\n12月10；', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e843759b44c920159b4516bf70033', '8a7e843759b44c920159b4516bf70032', '8a7e843759b44c920159b4516bdb0000', '20', '6998', NULL, '全明料蛋糕盘，盘沿电镀\\r\\n尺寸：6-1/2\\\"X12-1/2\\\"高', 300, 'PCS', 6.00, 1800.00, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 \\r\\n ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， \\r\\n       并将验货照片传\n\n回公司。 \\r\\n★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 \\r\\n 交期：2012年1月10日/工厂。\\r\\n       没有经过我司同意无故延期交货造成严重\n\n后果的，按照客人的相关要求处理。 \\r\\n 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 11, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e84635711a251015711da96e90040', '8a7e84635711a251015711da96e8003f', '8a7e84635711a251015711da96e8003e', '19', '20-37-264/JK1051087', 'bdf6ff59-ab4c-4218-a554-361ec409a04f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.35, 420.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 1, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e84635711a251015711da96e90042', '8a7e84635711a251015711da96e90041', '8a7e84635711a251015711da96e8003e', '4028817a33de41d80133e982a18a001c', '5645654', '02.png', 'fdsfss', 30, 'SETS', 30.00, 900.00, 'dsfds', 565, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('8a7e84635711a251015711da96ea0044', '8a7e84635711a251015711da96ea0043', '8a7e84635711a251015711da96e8003e', '19', '20-37-265/JK1050163', '1af851ab-98ff-4227-ba39-1175dca33c6f.png', '蒙砂白花纸\\r\\n配全明料蛋糕罩\\r\\n\\r\\n送祁县宏艺厂', 1200, 'PCS', 0.38, 456.00, '1.产品的颜色、造型、尺寸、重量务必同我司封样一致；\\r\\n2.工厂免费提供2% 余量，以防损耗，代用包装送至指定工厂；请在外包装上注明相对应的合同号及货号；\\r\\n3.交期:2011\n\n年12月05日；', 2, NULL, NULL);
INSERT INTO `co_ext_eproduct` VALUES ('9d9a4cd4-d900-488f-a9fc-026f6ce331c4', 'af2cc365-aa7c-48ce-8f80-1e11ff2e3244', '4a638468-1fba-497e-adad-1a75ed263d28', '4028817a33ecdbf70133ee202e49000b', 'FJ1234', 'lv.png', NULL, 21, 'PCS', 11.00, 231.00, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for co_factory
-- ----------------------------
DROP TABLE IF EXISTS `co_factory`;
CREATE TABLE `co_factory`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物/附件',
  `full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inspector` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1正常0停用',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_dept` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产厂家表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_factory
-- ----------------------------
INSERT INTO `co_factory` VALUES ('1', '货物', '祁县海洋厂', '升华', '刘生', '0354-5299987', NULL, NULL, '厦门', '吕波', NULL, NULL, '0', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('10', '货物', '祁县晶晨厂', '晶晨', '续贵', '0354-5271999', NULL, NULL, '东莞', '吕波', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('12', '货物', '平遥远江厂', '平遥远江', '宏远', NULL, '13935499967', NULL, '连云港', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('13', '货物', '平遥鸿艺厂', '平遥鸿艺', '雄飞', '0354-5940888', NULL, NULL, '东莞', '吕波', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('15', '货物', '南皮开发玻璃制品厂', '南皮开发', '舒东', '0317-8863999', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('16', '货物', '陕西康达彩印厂', '康达', '袁喜', '029-84528015', NULL, NULL, '拉萨', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('17', '货物', '陕西众鑫印务包装有限公司', '众鑫', '赵毅', '029-84341858', NULL, NULL, '连云港', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('18', '货物', '翰林彩印厂', '翰林', '孙财', '029-88917456', NULL, NULL, '长沙', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('19', '货物', '祁县综艺玻璃花纸厂', '综艺花纸', '王棕', '0354-5278918', NULL, NULL, '长沙', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('2', '货物', '祁县光华厂', '光华', '薛成', '0354-5298981', NULL, NULL, '长沙', '吕波', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('20', '货物', '祁县喜福来玻璃加工厂', '喜福来', '王卫', '0354-5328850', NULL, NULL, '长沙', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('21', '货物', '祁县美晶泡沫厂', '美晶', '范长', '0354-5071387', NULL, NULL, '长沙', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('22', '货物', '祁县瑞成玻璃镀膜厂', '瑞成', '温明', NULL, '13834809374', NULL, '长沙', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('3', '货物', '祁县会龙厂', '会龙', '李伟', '0354-5248696', NULL, NULL, '长沙', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4', '货物', '祁县精艺厂', '精艺', '闫强', '0354-5047289', NULL, NULL, '厦门', '高琴', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a33d4f8b40133d9989f5e0024', '附件', '闻喜民鑫厂', '民鑫', '李民', '0359-7472727', NULL, NULL, '包头', '吕波', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a33de41d80133e982a18a001c', '附件', '太谷四通PVC厂', '太谷PVC', '张海', '0354-6226591', NULL, NULL, '沈阳', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a33ecdbf70133ee202e49000b', '附件', '祁县瑞成电镀厂', '瑞成电镀厂', '温民', '13835926900', NULL, NULL, '沈阳', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a34f93be50134f9df84470001', '附件', '神舟玻璃制品有限公司', '神舟厂', '申定', '0356-3961959', '13935672348', '0356-3991304', '福州', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a353b8d8e0135415bf0a90070', '附件', '陕西宇津进出口有限公司', '宇津水龙头厂', '任宁', '029-62990818', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a35e0895e0135ec7a4dbe0087', '附件', '西安方圆工贸有限公司', '西安方圆工贸', '许涛', '029-86539568', NULL, '029-86590565', '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a3632e86601363344d16d0001', '附件', '淄博雷波陶瓷花纸厂', '淄博花纸厂', '吴璇', '0533-5176946', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a371a8d7f01372a74451f0068', '附件', '山西大德成工贸有限公司', '铁架厂', '高辉', '0354-5288919', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a37583d45013758d152450038', '附件', '祁县顺驰厂', '顺驰', '王明', '0354-5109398', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a38024a04013803e3a8a2004b', '附件', '祁县欣欣泡沫有限公司', '祁县欣欣泡沫厂', '许杰', '0354-3939793', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a382b4fd401382b9aad2a0008', '附件', '祁县仲玉玻璃厂', '仲玉', '吕军', '0354-5018888', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a38736298013874c51a800036', '附件', '汇融玻璃有限公司', '展鹏厂', '厂长', '0354-5326986', '13834893800', '0354-5826197', '西安', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a389cc7b701389d1efd940001', '附件', '宇虹包装彩印厂', '宇虹包装厂', '翟帅', '0358-3099923', '19033470988', '0358-3098183', '西安', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a39b2b37f0139b46268c40025', '附件', '祁县馨艺玻璃厂', '馨艺', '袁长', '0354-5041938', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a3aa9f950013ab0b6c98d0050', '附件', '祁县一先厂', '一先厂', '李刚', '0654-9018444', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a3aa9f950013ab97f64110053', '附件', '温县致远玻璃制品有限公司', '温县致远厂', '红升', '18936896666', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a3abe8f15013ac019a61f0031', '附件', '祁县喜福来电镀厂', '喜福来电镀厂', '王卫', '0154-5282888', NULL, NULL, '东莞', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('4028817a3ae2ac42013ae3550357000d', '附件', '临潼华清蜡厂', '临潼华清蜡厂', '吴波', '13791903888', NULL, NULL, '东莞', NULL, NULL, NULL, '0', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('5', '货物', '祁县汇越厂', '汇越', '建忠', '0354-5019656', NULL, NULL, '西安', '吕波', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('6', '货物', '祁县泰宇厂', '泰宇', '立东', '0354-5299160', NULL, NULL, '西安', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('7', '货物', '祁县天顺厂', '天顺', '渠海', '0354-5299499', NULL, NULL, '连云港', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('8', '货物', '祁县天诚厂', '天诚', '庞正', '0354-5299539', NULL, NULL, '东莞', NULL, NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('9', '货物', '祁县华艺厂', '华艺', '史国', '0354-5041927', NULL, NULL, '东莞', '高琴', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:34:53', NULL, '2015-01-10 19:32:46');
INSERT INTO `co_factory` VALUES ('ff808081301885760130189e47ca0013', '附件', '文水志远厂', '文水志远', '志远', '0358-3934083', NULL, NULL, '连云港', '李光', NULL, NULL, '1', NULL, NULL, '2015-01-10 19:35:06', NULL, '2015-01-10 19:32:46');

-- ----------------------------
-- Table structure for co_finance
-- ----------------------------
DROP TABLE IF EXISTS `co_finance`;
CREATE TABLE `co_finance`  (
  `FINANCE_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INPUT_DATE` datetime NULL DEFAULT NULL,
  `INPUT_BY` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE` int(11) NULL DEFAULT NULL COMMENT '0草稿 1已上报',
  `CREATE_BY` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DEPT` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`FINANCE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)(finance金融)和装箱单一对一' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for co_invoice
-- ----------------------------
DROP TABLE IF EXISTS `co_invoice`;
CREATE TABLE `co_invoice`  (
  `INVOICE_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'PACKING_LIST_ID值',
  `SC_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'packing.getExportNos S/C就是报运的合同号',
  `BL_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TRADE_TERMS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE` int(11) NULL DEFAULT NULL COMMENT '0草稿 1已上报',
  `CREATE_BY` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DEPT` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)(invoice发票)和装箱单一对一' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for co_packing_list
-- ----------------------------
DROP TABLE IF EXISTS `co_packing_list`;
CREATE TABLE `co_packing_list`  (
  `packing_list_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seller` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择',
  `invoice_date` datetime NULL DEFAULT NULL,
  `marks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descriptions` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `export_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报运ID集合',
  `export_nos` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报运NO集合x,y|z,h',
  `state` decimal(11, 0) NULL DEFAULT NULL COMMENT '0草稿 1已上报',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_dept` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`packing_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装箱单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_packing_list
-- ----------------------------
INSERT INTO `co_packing_list` VALUES ('8a7e8412584c739201584c7433c50000', '美国ABC', 'ABC', 'ABC', '2016-11-09 00:00:00', 'ABC', 'ABC', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `co_packing_list` VALUES ('8a7e842b57bc33760157bc340dad0000', 'AJ1', '小陈', 'PK10022', '2016-10-06 00:00:00', 'marks唛头', 'descript描述', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for co_product
-- ----------------------------
DROP TABLE IF EXISTS `co_product`;
CREATE TABLE `co_product`  (
  `ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PRODUCT_NO` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FACTORY_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FACTORY_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRICE` decimal(10, 3) NULL DEFAULT NULL,
  `SIZE_LENGHT` decimal(10, 3) NULL DEFAULT NULL,
  `SIZE_WIDTH` decimal(10, 3) NULL DEFAULT NULL,
  `SIZE_HEIGHT` decimal(10, 3) NULL DEFAULT NULL,
  `COLOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会写很多内容',
  `PACKING` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PACKING_UNIT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PCS/SETS',
  `TYPE20` decimal(10, 3) NULL DEFAULT NULL,
  `TYPE40` decimal(10, 3) NULL DEFAULT NULL,
  `TYPE40HC` decimal(10, 3) NULL DEFAULT NULL,
  `QTY` int(11) NULL DEFAULT NULL,
  `CBM` decimal(10, 3) NULL DEFAULT NULL,
  `MPSIZE_LENGHT` decimal(10, 3) NULL DEFAULT NULL,
  `MPSIZE_WIDTH` decimal(10, 3) NULL DEFAULT NULL,
  `MPSIZE_HEIGHT` decimal(10, 3) NULL DEFAULT NULL,
  `REMARK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'NOTE',
  `INPUT_TIME` datetime NULL DEFAULT NULL COMMENT 'CREATEDATE',
  `CREATE_BY` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DEPT` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  `company_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Reference_7`(`FACTORY_ID`) USING BTREE,
  CONSTRAINT `co_product_ibfk_1` FOREIGN KEY (`FACTORY_ID`) REFERENCES `co_factory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)海关报单信息或商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_product
-- ----------------------------
INSERT INTO `co_product` VALUES ('1', '1', ',1', '1', '1', '1', 1.000, 1.000, 1.000, 1.000, '1', '1', '1', 1.000, 1.000, 1.000, 11111, 1.000, 1.000, 1.000, 1.000, '1', NULL, '1', '1', NULL, '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('104ac259-7fae-44cc-85b9-39504676af00', '4444444', '', '', '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 111.000, NULL, 444.000, NULL, ',', '', '', NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, '', '2019-07-30 09:32:34', '老王1', '总裁办', '2019-07-30 09:32:34', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('31dde537-7b68-40a6-9096-5d7bbcc74b30', '4', '', '4', '15', NULL, 4.000, 4.000, 4.000, 4.000, '4,4', '4', '4', 4.000, 4.000, 4.000, 4, 4.000, 4.000, 4.000, 4.000, '4', '2019-07-28 17:55:31', '老王1', '总裁办', '2019-07-28 17:55:31', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('4a01b52c-6a52-4ea2-8722-cd13c639d834', '2014', '', '', '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 2015.000, NULL, NULL, NULL, ',', '', '', NULL, NULL, NULL, 2014, NULL, NULL, NULL, NULL, '', '2019-07-30 09:50:01', '老王1', '总裁办', '2019-07-30 09:50:01', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('7f307c26-8095-467e-aece-ef847113bcb2', '3', NULL, NULL, '13', NULL, 3.000, 3.000, 3.000, 3.000, '3,3,3,3,,3', NULL, '3', 3.000, 3.000, 3.000, 3, 3.000, 3.000, 3.000, 3.000, '3', '2019-07-28 17:36:42', '老王1', '总裁办', '2019-07-28 17:36:42', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('9fc43c4b-36e5-484c-a2e1-0da3460ff805', '1', NULL, NULL, '13', NULL, 1.000, 1.000, 1.000, 1.000, '1,1', NULL, '1', 1.000, 1.000, 1.000, 1, 1.000, 1.000, 1.000, 1.000, '1', '2019-07-28 17:30:46', '老王1', '总裁办', '2019-07-28 17:30:46', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('bfc04873-8019-4e6a-a020-14a6e96ec103', '0005', '', NULL, '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 50.000, NULL, NULL, NULL, ',', NULL, '', NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, '', '2019-07-30 09:07:01', '老王1', '总裁办', '2019-07-30 09:07:01', '1', NULL);
INSERT INTO `co_product` VALUES ('de3c85e7-3af2-4c6f-903b-42998f8d314f', '0006', '', NULL, '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 60.000, NULL, NULL, NULL, ',', NULL, '', NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, '', '2019-07-30 09:07:27', '老王1', '总裁办', '2019-07-30 09:07:27', '1', NULL);
INSERT INTO `co_product` VALUES ('ee250d17-5240-4aef-8a5a-a733326799ea', '5', '', NULL, '13', NULL, 5.000, 5.000, 5.000, 5.000, '5,5', NULL, '5', 5.000, 5.000, 5.000, 5, 5.000, 5.000, 5.000, 5.000, '5', '2019-07-28 18:16:08', '老王1', '总裁办', '2019-07-28 18:16:08', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('efe5c2af-888f-4d81-be08-2c4b26dadfca', '2', NULL, NULL, '12', NULL, 2.000, 2.000, 2.000, 2.000, '2,2,', NULL, '2', 2.000, 2.000, 2.000, 2, 2.000, 2.000, 2.000, 2.000, '2', '2019-07-28 17:34:45', '老王1', '总裁办', '2019-07-28 17:34:45', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('f131f03a-8dd6-4f41-be0e-4e3719b3b4c4', '6', '', NULL, '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 5.000, NULL, NULL, NULL, ',', NULL, '', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, '', '2019-07-30 09:25:19', '老王1', '总裁办', '2019-07-30 09:25:19', '1', '传智播客教育股份有限公司');
INSERT INTO `co_product` VALUES ('f799e827-a766-48f0-a16f-d0abac81ac86', '77', '', NULL, '021949d5-6891-45c1-8417-c7ffaefec2eb', NULL, 10000.000, NULL, NULL, NULL, ',', NULL, '', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, '', '2019-07-30 09:17:32', '老王1', '总裁办', '2019-07-30 09:17:32', NULL, NULL);

-- ----------------------------
-- Table structure for co_shipping_order
-- ----------------------------
DROP TABLE IF EXISTS `co_shipping_order`;
CREATE TABLE `co_shipping_order`  (
  `shipping_order_id` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipper` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notify_party` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lc_no` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port_of_loading` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port_of_trans` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port_of_discharge` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loading_date` datetime NULL DEFAULT NULL,
  `limit_date` datetime NULL DEFAULT NULL,
  `is_batch` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_trans` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copy_num` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `special_condition` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `freight` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_by` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `create_by` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_dept` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `company_id` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)船运订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_shipping_order
-- ----------------------------
INSERT INTO `co_shipping_order` VALUES ('9d844a79-6b82-4289-bc77-7c34aef168e3', 'SEA', '特朗普', '企鹅村', '是', '123', '青岛港', '西雅图', '西雅图', '2019-07-03 00:00:00', '2019-07-03 00:00:00', '1', '1', '1', '', '', '', '老王1', 1, '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-30 16:08:52', '1', '传智播客教育股份有限公司');

-- ----------------------------
-- Table structure for pe_chat
-- ----------------------------
DROP TABLE IF EXISTS `pe_chat`;
CREATE TABLE `pe_chat`  (
  `chat_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_time` datetime NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive_dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(10) NULL DEFAULT NULL COMMENT '0:未读,1已读',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)聊天功能表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_chat
-- ----------------------------
INSERT INTO `pe_chat` VALUES ('64e68ab3-bd9d-47db-83ad-616666592ee7', '002108e2-9a10-4510-9683-8d8fd1d374ef', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '2323333333', '2019-07-30 00:00:00', '1', '传智播客教育股份有限公司', 'hello', '老王1', 'cy002', '总裁办', NULL, 1);
INSERT INTO `pe_chat` VALUES ('71ff5424-4480-4c0f-a797-db573d3e0d4c', '002108e2-9a10-4510-9683-8d8fd1d374ef', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '你是', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '问题', '老王1', 'cy002', '总裁办', NULL, 1);
INSERT INTO `pe_chat` VALUES ('7f541f5b-862b-41f9-8111-c6313a47f62e', '002108e2-9a10-4510-9683-8d8fd1d374ef', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '你是谁', '2019-07-28 00:00:00', '1', '传智播客教育股份有限公司', '你好呀', '老王1', 'cy002', '总裁办', NULL, 1);
INSERT INTO `pe_chat` VALUES ('88e9cd81-9ced-447b-b8d1-c7b3d752a50e', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '002108e2-9a10-4510-9683-8d8fd1d374ef', '111111', '2019-07-30 00:00:00', '1', '传智播客教育股份有限公司', '111111', 'cy002', '老王1', '船运部', NULL, 1);
INSERT INTO `pe_chat` VALUES ('9e8bd67d-23e9-4e10-b22b-e7095317a3b3', '002108e2-9a10-4510-9683-8d8fd1d374ef', '0f1f71fe-fe7c-4a44-a952-4f08bf5aa990', '给我10万', '2019-07-28 00:00:00', '1', '传智播客教育股份有限公司', '你好呀', '老王1', '小二', '总裁办', NULL, 0);
INSERT INTO `pe_chat` VALUES ('af1818b2-3f70-444b-a54a-b2963a86522d', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '002108e2-9a10-4510-9683-8d8fd1d374ef', '还我钱', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '你个', 'cy002', '老王1', '船运部', NULL, 1);
INSERT INTO `pe_chat` VALUES ('c1965e44-6050-4c69-a86a-5e17de5d0c51', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '002108e2-9a10-4510-9683-8d8fd1d374ef', '你还我钱', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '你好呀', 'cy002', '老王1', '船运部', NULL, 1);
INSERT INTO `pe_chat` VALUES ('c33cb77c-e371-4ae0-9cf3-e5d62c7691f6', '002108e2-9a10-4510-9683-8d8fd1d374ef', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '渣渣渣', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '叽叽叽叽', '老王1', '', '总裁办', NULL, 1);
INSERT INTO `pe_chat` VALUES ('cd00a677-5222-4b62-bc29-7820411b3b47', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '你那会刷新邮件数吗?', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '问题', 'cy002', 'cy002', '船运部', NULL, 0);
INSERT INTO `pe_chat` VALUES ('e870ac71-00ab-4dc8-a5e5-4d5f493d0d79', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '002108e2-9a10-4510-9683-8d8fd1d374ef', '3333333', '2019-07-30 00:00:00', '1', '传智播客教育股份有限公司', 'nihao', 'cy002', '', '船运部', NULL, 0);
INSERT INTO `pe_chat` VALUES ('f18b53ff-8276-45d6-967d-07a10e24a47b', '002108e2-9a10-4510-9683-8d8fd1d374ef', '10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '就是你偷了我的瓜', '2019-07-29 00:00:00', '1', '传智播客教育股份有限公司', '你好呀', '老王1', 'cy002', '总裁办', NULL, 0);

-- ----------------------------
-- Table structure for pe_dept
-- ----------------------------
DROP TABLE IF EXISTS `pe_dept`;
CREATE TABLE `pe_dept`  (
  `dept_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` decimal(6, 0) NULL DEFAULT NULL COMMENT '1代表启用，0代表停用，默认为1',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `SYS_C005596`(`parent_id`) USING BTREE,
  CONSTRAINT `SYS_C005596` FOREIGN KEY (`parent_id`) REFERENCES `pe_dept` (`dept_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_dept
-- ----------------------------
INSERT INTO `pe_dept` VALUES ('075e5b1e-d902-4613-b3ca-5527b57306c9', '黑马程序员1', '100101', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('100', '商贸集团', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('100101', '北京事业部', '100', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('100101101', '顺义事业部', '100101', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('3d00290a-1af0-4c28-853e-29fbf96a2722', '市场部', '100', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('4028827c4fb6202a014fb6209c730000', '总裁办', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('4028827c4fb633bd014fb64467470000', '财务部', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('717c7185-2eb5-4109-9cea-ed45819ec730', '父部门添加测试', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('73f3fa2f-66a2-4d16-8306-78d89003031b', '网络部', '100', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('8a7e82be61400c000161400c05810000', '黑马299，非常NB', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('8a7e862458b9ed5b0158b9edc0e80000', '调研组', '3d00290a-1af0-4c28-853e-29fbf96a2722', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('97f88a8c-90fc-4d52-aed7-2046f62fb498', '总经办', '100', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', '船运部', '100', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('dc2d37f1-f87f-4fcb-81d7-9bdeba4827aa', '父部门添加测试', NULL, 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('df83b321-140d-44ae-b316-1dde5816de6f', '黑马测试部', '100101', 1, '1', '传智播客教育股份有限公司');
INSERT INTO `pe_dept` VALUES ('ff808081613b858301613b8586c60000', '黑马程序员1', '100101', 1, '1', '传智播客教育股份有限公司');

-- ----------------------------
-- Table structure for pe_feedback
-- ----------------------------
DROP TABLE IF EXISTS `pe_feedback`;
CREATE TABLE `pe_feedback`  (
  `FEEDBACK_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INPUT_BY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INPUT_TIME` datetime NULL DEFAULT NULL,
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CLASS_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1管理2安全3建议4其他',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ANSWER_BY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ANSWER_TIME` datetime NULL DEFAULT NULL,
  `SOLVE_METHOD` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理方法',
  `RESOLUTION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1已修改2无需修改3重复问题4描述不完整5无法再现6其他',
  `DIFFICULTY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1极难2比较难3有难度4一般',
  `IS_SHARE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0不公开1公开',
  `STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0未处理1已处理2待处理',
  `CREATE_BY` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DEPT` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  `COMPANY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMPANY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FEEDBACK_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)反馈信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_feedback
-- ----------------------------
INSERT INTO `pe_feedback` VALUES ('0ff35e51-c482-4e56-85e4-f5b4c68bc8e9', '大山', '2019-07-23 00:00:00', '登录不好使', '1', '2', '110', NULL, NULL, NULL, NULL, '1', '1', '0', '9fe270f8-f682-4126-92aa-604d945c95f1', '4028827c4fb6202a014fb6209c730000', '2019-07-30 10:15:49', '', 'SAAS企业');
INSERT INTO `pe_feedback` VALUES ('2b110359-fe5e-4aa0-9bf6-0c783dfbe4ef', 'qq', '2019-07-30 00:00:00', '日志管理不好用', '', '1', '110', '11', NULL, '1', '1', '1', '0', '1', '9fe270f8-f682-4126-92aa-604d945c95f1', '4028827c4fb6202a014fb6209c730000', '2019-07-28 15:34:27', '', 'SAAS企业');
INSERT INTO `pe_feedback` VALUES ('3303a673-afd9-43d7-a93b-4c77dab3c7a0', 'qq', '2019-07-30 00:00:00', '1111111', '11111111', '1', '110', NULL, NULL, NULL, NULL, '3', '1', '0', '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-30 10:03:27', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_feedback` VALUES ('662ce02b-6f13-46be-9871-b4eb778aab1a', '133088888', '2019-07-23 00:00:00', '登录不好使', '快处理', '4', '110', NULL, NULL, NULL, NULL, '4', '0', '0', '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-30 09:59:36', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_feedback` VALUES ('9bbb1848-809e-41e3-a82e-d23fbf7708bb', '66', '2019-07-30 00:00:00', '退出不好使', '发的发的是', '3', '110', '11', NULL, '', '1', '3', '1', '1', '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-28 15:18:13', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_feedback` VALUES ('be4af69f-a9ce-4b78-8774-9636d1e831b1', '111', '2019-07-09 00:00:00', '测试测试', '测试测试', '1', '145567343324', '管理员', '2019-07-17 00:00:00', '测试测试', '3', '1', '1', '1', '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-31 20:59:38', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_feedback` VALUES ('ca64089c-9661-4a4b-b3ab-7c0f21a3a0bf', 'qq', '2019-07-30 00:00:00', '日志管理不好用', '11', '1', '110', '11', '2019-07-23 00:00:00', '', '1', '1', '0', '1', '002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', '2019-07-28 10:59:38', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_feedback` VALUES ('ef10ddb3-5f02-4131-893e-9c5943a41802', 'qq', '2019-08-05 00:00:00', '登录不好使', '111', '1', '110', '11', '2019-07-30 00:00:00', 'sfsdf', '1', '2', '1', '0', '9fe270f8-f682-4126-92aa-604d945c95f1', '4028827c4fb6202a014fb6209c730000', '2019-07-28 10:17:58', '1', 'SAAS企业');

-- ----------------------------
-- Table structure for pe_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_role`;
CREATE TABLE `pe_role`  (
  `role_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` decimal(11, 0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'x',
  `create_dept` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'x',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_role
-- ----------------------------
INSERT INTO `pe_role` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '船运专员', '船运专员', 9, NULL, NULL, '2015-09-11 16:59:44', NULL, '2015-07-25 09:55:21', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '船运经理', '船运经理', 10, NULL, NULL, '2015-09-11 16:59:47', NULL, '2015-07-25 09:55:37', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '装箱专员', '装箱专员', 11, NULL, NULL, '2015-09-11 16:59:49', NULL, '2015-07-31 14:49:21', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '总经理', 'sysadmin', 1, NULL, NULL, '2015-09-11 16:58:57', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '销售经理', 'salemanager', 2, NULL, NULL, '2015-09-11 16:58:04', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0003', '合同专责', 'contract', 3, NULL, NULL, '2015-09-11 16:58:00', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '销售专责', 'sale', 4, NULL, NULL, '2015-09-11 16:57:47', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '报运经理', 'transportation', 5, NULL, NULL, '2015-09-11 16:57:42', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0006', '报运专责', 'trans', 6, NULL, NULL, '2015-09-11 16:57:37', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '财务经理', 'financial', 7, NULL, NULL, '2015-09-11 16:57:32', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '财务专责', 'fin', 8, NULL, NULL, '2015-09-11 16:57:25', NULL, '2015-07-20 00:00:00', '1', '传智播客教育股份有限公司');
INSERT INTO `pe_role` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '测试权限管理', '权管备注', NULL, NULL, NULL, NULL, NULL, NULL, '1', '传智播客教育股份有限公司');

-- ----------------------------
-- Table structure for pe_role_module
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_module`;
CREATE TABLE `pe_role_module`  (
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_role_module
-- ----------------------------
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '302');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '303');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '3');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ec38cc0002', '301');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '204');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '50102');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '208');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '207');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '5');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '501');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '205');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '1');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '2');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '101');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '504');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '201');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '50103');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '50104');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '102');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '203');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '206');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '503');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '202');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '502');
INSERT INTO `pe_role_module` VALUES ('402882866092f8ba016092fc8b8b0000', '50101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '208');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '3');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '301');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '302');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '303');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '4');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '401');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '402');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '5');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '501');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '502');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '503');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '504');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '6');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '601');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0001', '602');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '208');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '4');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '401');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '5');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '501');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '502');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0002', '503');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0004', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '208');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '3');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '301');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '302');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '303');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '4');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '401');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '402');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '5');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '501');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '502');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '503');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0008', '504');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '6');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '602');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '604');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '1');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '208');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '603');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0000', '601');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '208');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '3');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '301');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '302');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '303');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '4');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '401');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '402');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '5');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '182104f0-7690-4a84-a90c-16d24e491a3a');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '501');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '50101');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '50102');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '50103');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '50104');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '502');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0007', '503');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '3');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '301');
INSERT INTO `pe_role_module` VALUES ('4028a1c34ec2e5c8014ec2ebf8430001', '302');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '2');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '201');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '202');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '203');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '204');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '205');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '206');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '207');
INSERT INTO `pe_role_module` VALUES ('4028a1cd4ee2d9d6014ee2df4c6a0005', '208');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '2');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '201');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '202');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '203');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '204');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '205');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '206');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '207');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '208');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '3');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '301');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '302');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '303');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '4');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '401');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '402');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '5');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '182104f0-7690-4a84-a90c-16d24e491a3a');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '501');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '50101');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '50102');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '50103');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '50104');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '502');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '503');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', 'ad3be6e7-551f-45b6-b816-b2b751e204ed');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '8842b580-49c0-4871-b234-5cf9c721a507');
INSERT INTO `pe_role_module` VALUES ('a7801231-90c3-465e-a4e5-eeb614c41fd9', '9c5eb9b0-54a4-48bb-aab4-0d1d46cdfbbd');

-- ----------------------------
-- Table structure for pe_role_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_user`;
CREATE TABLE `pe_role_user`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `SYS_C005471`(`user_id`) USING BTREE,
  CONSTRAINT `SYS_C005471` FOREIGN KEY (`user_id`) REFERENCES `pe_user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_role_user
-- ----------------------------
INSERT INTO `pe_role_user` VALUES ('002108e2-9a10-4510-9683-8d8fd1d374ef', 'a7801231-90c3-465e-a4e5-eeb614c41fd9');
INSERT INTO `pe_role_user` VALUES ('0f1f71fe-fe7c-4a44-a952-4f08bf5aa990', '4028a1c34ec2e5c8014ec2ec38cc0002');
INSERT INTO `pe_role_user` VALUES ('10d29bc9-78c1-4831-a21a-4fcfea7d87ce', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('18077bdb-8dd3-4aae-95a2-078c963f8416', '4028a1cd4ee2d9d6014ee2df4c6a0000');
INSERT INTO `pe_role_user` VALUES ('40a58e0c-e6ee-47e9-bdb6-0b90a8b41a68', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('424b2d01-d812-4f30-be40-dcda14110118', '4028a1cd4ee2d9d6014ee2df4c6a0007');
INSERT INTO `pe_role_user` VALUES ('5f6ba59b-f185-4c8a-9caa-99cba5963cdb', '4028a1c34ec2e5c8014ec2ec38cc0002');
INSERT INTO `pe_role_user` VALUES ('6424df15-963c-4218-8371-6ad000ef5a5a', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('6764e5a1-45e5-4229-a72a-7c5d72209b15', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('6bbf3016-54ab-4ab2-b0d3-2d6622ac17eb', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('71a5a695-0ba5-4f0d-a0b5-0a304efde944', '4028a1cd4ee2d9d6014ee2df4c6a0007');
INSERT INTO `pe_role_user` VALUES ('7a02a732-f5b5-4a9e-8e40-2e04d0fc66e5', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('84b4a1c0-fb52-4fd5-b410-5db1c933d146', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('8fe436ac-87e9-4d35-a3a4-0eb33cae6c86', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('9fe270f8-f682-4126-92aa-604d945c95f1', '4028a1cd4ee2d9d6014ee2df4c6a0000');
INSERT INTO `pe_role_user` VALUES ('b11c3da4-4760-4f4f-9913-78f7749ffcf9', '4028a1cd4ee2d9d6014ee2df4c6a0007');
INSERT INTO `pe_role_user` VALUES ('b891b14b-1316-4a79-8b88-695be1e3f42f', '4028a1cd4ee2d9d6014ee2df4c6a0007');
INSERT INTO `pe_role_user` VALUES ('c9a4973e-8daa-4380-a9ec-599410d6fd6b', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('ca592c7c-860a-464c-8f56-ea51b42a046f', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('cf0015d3-bcdd-433b-889d-808b53b72640', '4028a1c34ec2e5c8014ec2ec38cc0002');
INSERT INTO `pe_role_user` VALUES ('e0de22fe-2c50-4216-ad75-ed0494d2dc92', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('e0de22fe-2c50-4216-ad75-ed0494d2dc92', '4028a1cd4ee2d9d6014ee2df4c6a0007');
INSERT INTO `pe_role_user` VALUES ('e2fc5d41-2733-4c8a-88a6-6dbad214d47e', '4028a1c34ec2e5c8014ec2ebf8430001');
INSERT INTO `pe_role_user` VALUES ('e2fc5d41-2733-4c8a-88a6-6dbad214d47e', '4028a1c34ec2e5c8014ec2ec38cc0002');
INSERT INTO `pe_role_user` VALUES ('faa59d6e-2e04-4972-bd4f-fd946ba38b99', '4028a1c34ec2e5c8014ec2ebf8430001');

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user`  (
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `dept_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不能重复,可为中文',
  `station` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro MD5密码32位',
  `state` decimal(11, 0) NULL DEFAULT NULL COMMENT '1启用0停用',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `dept_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门名称',
  `manager_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级id',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `degree` int(2) NULL DEFAULT NULL COMMENT '级别',
  `salary` decimal(10, 0) NULL DEFAULT NULL COMMENT '薪资',
  `join_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入日期',
  `order_no` int(3) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录人编号',
  `create_dempt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录人所属部门编号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人员',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `opendid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(2019.11.21新增)微信用户的唯一openid',
  `wechat_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(2019.11.21新增)用户是否绑定微信登录状态',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `SYS_C005467`(`dept_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `SYS_C005467` FOREIGN KEY (`dept_id`) REFERENCES `pe_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_user
-- ----------------------------
INSERT INTO `pe_user` VALUES ('002108e2-9a10-4510-9683-8d8fd1d374ef', '4028827c4fb6202a014fb6209c730000', 'lw@export.com', '老王', '总裁', '72a7dc98f2ce9f5312a7267d88c965d1', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '0', '12345678', '1989-01-06', 1, 2000, '2019-02-26', 1, NULL, NULL, '2015-10-18 17:00:53', NULL, '2015-10-18 17:00:53', '貌美如花', NULL, NULL);
INSERT INTO `pe_user` VALUES ('0f1f71fe-fe7c-4a44-a952-4f08bf5aa990', '100101101', 'xiaoer@export.com', '小二', '员工', '359c4cd72b2c243b64371da49ef82d75', 1, '1', '传智播客教育股份有限公司', '顺义事业部', NULL, '1', '13800138001', '1992-03-16', 4, 2000, '2010-05-06', 1, NULL, NULL, '2018-01-02 16:02:41', NULL, '1970-01-01 08:00:00', '1', NULL, NULL);
INSERT INTO `pe_user` VALUES ('10d29bc9-78c1-4831-a21a-4fcfea7d87ce', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'cy002@export.com', 'cy002', '员工', '36e167b32297d5e0d40339640624ba3e', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '0', '13800138002', '1990-05-19', 4, 5000, '2010-05-06', 2, NULL, NULL, '2018-02-06 18:37:22', NULL, '1970-01-01 08:00:00', '2', NULL, NULL);
INSERT INTO `pe_user` VALUES ('18077bdb-8dd3-4aae-95a2-078c963f8416', '4028827c4fb6202a014fb6209c730000', 'lisi@export.com', '李四', '经理', '5e582f08ffaef00f984bbe611e121a19', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '0', '13800138003', '1984-02-26', 4, 5000, '', NULL, NULL, NULL, '2015-09-24 00:41:12', NULL, '2015-09-24 00:14:23', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('1d47b054-003f-41e0-8ba3-5600f38653f8', '3d00290a-1af0-4c28-853e-29fbf96a2722', 'huamulan@export.com', '花木兰', '市场经理', '59fe271f9d6719000a8f2af97af38b6c', 1, '1', '传智播客教育股份有限公司', '市场部', NULL, '0', '13800138004', '1988-12-30', 4, 5000, '', NULL, NULL, NULL, '2017-12-31 11:08:19', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('40a58e0c-e6ee-47e9-bdb6-0b90a8b41a68', '100101', 'laoda@export.com', '老大', '员工', '943035c4ef1691542dce6db6b3f68a27', 1, '1', '传智播客教育股份有限公司', '北京事业部', NULL, '1', '13800138005', '1987-11-21', 4, 5000, '', NULL, NULL, NULL, '2018-01-02 16:03:48', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('424b2d01-d812-4f30-be40-dcda14110118', '4028827c4fb6202a014fb6209c730000', 'J0724@export.com', 'J0724', '助理', '655fa85f01e03692a11da5ff8575d447', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '1', '13800138006', '1986-09-09', 4, 3500, '', NULL, NULL, NULL, '2015-10-21 10:47:24', NULL, '2015-10-21 10:47:24', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('5f6ba59b-f185-4c8a-9caa-99cba5963cdb', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'cyboos@export.com', 'cyboos', '副总经理', '2e124d1f66b49df7b76ffab38c30b380', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '1', '13800138007', '1989-01-06', 4, 4000, '', NULL, NULL, NULL, '2018-02-06 18:38:32', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('6424df15-963c-4218-8371-6ad000ef5a5a', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'OOP@export.com', 'OOP', '员工', '029b2816925dd87a0b8cc8904613d2d4', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '1', '13800138008', '1989-01-06', 4, 12000, '', NULL, NULL, NULL, '2016-11-03 10:26:33', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('6764e5a1-45e5-4229-a72a-7c5d72209b15', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'AOP@export.com', 'AOP', '员工', '47f9644ed1a661c40a3eaeaba8fa83de', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '1', '13800138009', '1989-01-06', 4, 10000, '', NULL, NULL, NULL, '2016-11-03 10:27:16', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('677f58a8-d8c8-4ff5-b9b9-d3df141f7329', '97f88a8c-90fc-4d52-aed7-2046f62fb498', 'mxl@export.com', 'mxl', '总经理', 'b69165df0f85d41156983b7e43b2b45b', 1, '1', '传智播客教育股份有限公司', '总经办', NULL, '1', '13800138010', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2016-12-06 10:37:57', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('6bbf3016-54ab-4ab2-b0d3-2d6622ac17eb', '100101', 'bj001@export.com', 'bj001', '', 'a2675d56cf78781f4f836b67172d6345', 1, '1', '传智播客教育股份有限公司', '北京事业部', NULL, '1', '13800138011', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2018-01-03 16:16:10', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('71a5a695-0ba5-4f0d-a0b5-0a304efde944', '4028827c4fb6202a014fb6209c730000', 'J0723@export.com', 'J0723', '员工', '396cae50b3da868baf37f71ee95c921c', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '1', '13800138012', '1989-01-06', 4, 15000, '', NULL, NULL, NULL, '2015-10-21 10:46:29', NULL, '2015-10-21 10:46:29', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('735730bf-3ac0-4690-882d-100178d58ff9', '100', 'zbz@export.com', 'zbz', '秘书', '5f4849b40ccc3d8e39c61cd7b589a0cb', 1, '1', '传智播客教育股份有限公司', '商贸集团', NULL, '1', '13800138013', '1989-01-06', 4, 3000, '', NULL, NULL, NULL, '2017-03-11 11:51:18', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('7a02a732-f5b5-4a9e-8e40-2e04d0fc66e5', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'cy001@export.com', 'cy001', '', '353ba070f5bf66c9f4dae3799c889f16', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '0', '13800138014', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2018-02-06 18:36:43', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('84b4a1c0-fb52-4fd5-b410-5db1c933d146', '100101101', 'sy001@export.com', 'sy001', '员工', 'd943722276ef1cd9a01ae156e5590a2f', 1, '1', '传智播客教育股份有限公司', '顺义事业部', NULL, '0', '13800138015', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2018-01-03 16:17:39', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('8fe436ac-87e9-4d35-a3a4-0eb33cae6c86', '3d00290a-1af0-4c28-853e-29fbf96a2722', 'liufx@export.com', 'liufx', '员工', 'd9b4219aafb664e1a47053b1d9c053ca', 1, '1', '传智播客教育股份有限公司', '市场部', NULL, '0', '13800138016', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2016-10-31 11:36:24', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('9fe270f8-f682-4126-92aa-604d945c95f1', '4028827c4fb6202a014fb6209c730000', 'zhangsan@export.com', 'zhangsan', '', 'b309e4296ed2f6003e8fc8f5d6b390ef', 1, '', 'SAAS企业', '', NULL, '0', '13800138017', '1989-01-06', 0, 5000, '', 0, NULL, NULL, '2015-09-24 00:41:00', NULL, '2015-09-24 00:13:40', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('b11c3da4-4760-4f4f-9913-78f7749ffcf9', '4028827c4fb6202a014fb6209c730000', 'J0725@export.com', 'J0725', '员工', 'ee029a30db22bfef15ec6404abf24df1', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '1', '13800138018', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2015-10-21 10:48:11', NULL, '2015-10-21 10:48:11', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('b891b14b-1316-4a79-8b88-695be1e3f42f', '4028827c4fb6202a014fb6209c730000', 'aj@export.com', 'aj', '', '204bf04d928f4fc8743f326f04046ccf', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '1', '13800138019', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2015-09-24 11:37:10', NULL, '2015-09-24 11:37:10', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('c9a4973e-8daa-4380-a9ec-599410d6fd6b', '100101101', 'xiaosan@export.com', 'xiaosan', '员工', 'c16b2ba0003f0b7867489a646c880f34', 1, '1', '传智播客教育股份有限公司', '顺义事业部', NULL, '1', '13800138020', '1989-01-06', 4, 5000, '', NULL, NULL, NULL, '2018-01-02 16:03:21', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('ca592c7c-860a-464c-8f56-ea51b42a046f', '3d00290a-1af0-4c28-853e-29fbf96a2722', 'baitu@export.com', 'baitu', '', '3dde9a0d159ede0f0ac5aa1f9156f7e6', 1, '1', '传智播客教育股份有限公司', '市场部', NULL, '1', '13800138021', '1977-11-09', 4, 5000, '', NULL, NULL, NULL, '2018-02-03 12:28:35', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('cf0015d3-bcdd-433b-889d-808b53b72640', '100', 'mz@export.com', '马总', '总经理', 'c5afde1623b313b8dea3aa3033f319bc', 1, '1', '传智播客教育股份有限公司', '商贸集团', NULL, '1', '13800138022', '1984-08-13', 4, 5000, '', NULL, NULL, NULL, '2016-12-06 11:35:25', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('e0de22fe-2c50-4216-ad75-ed0494d2dc92', '4028827c4fb6202a014fb6209c730000', 'cgx@export.com', 'cgx', '', 'd244cf08243d25b2855665d8f833916f', 1, '1', '传智播客教育股份有限公司', '总裁办', NULL, '1', '13800138023', '1979-11-16', 4, 5000, '', NULL, NULL, NULL, '2015-09-24 11:43:02', NULL, '2015-09-24 11:39:47', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('e2fc5d41-2733-4c8a-88a6-6dbad214d47e', 'aeb1c7d3-9a54-4f73-b0ec-0325b83aef45', 'SOA@export.com', 'SOA', '员工', '26ca5931261f9335a27a46c7fc9fb1e5', 1, '1', '传智播客教育股份有限公司', '船运部', NULL, '1', '13800138024', '1990-11-06', 4, 5000, '', NULL, NULL, NULL, '2016-11-03 10:28:01', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('ef1f631d-76c8-4837-9ad9-f5f6209e4463', '100', 'ylj@export.com', 'ylj', '员工', 'd69e7d950529fbf6f846da41a9d3dd88', 1, '1', '传智播客教育股份有限公司', '商贸集团', NULL, '1', '13800138025', '1988-07-26', 4, 5000, '', NULL, NULL, NULL, '2016-11-18 11:12:53', NULL, '1970-01-01 08:00:00', '', NULL, NULL);
INSERT INTO `pe_user` VALUES ('faa59d6e-2e04-4972-bd4f-fd946ba38b99', '100101', 'bj002@export.com', 'bj002', '', '0b02be90bd07b3c0551b02b4f5ad2c30', 1, '1', '传智播客教育股份有限公司', '北京事业部', NULL, '1', '13800138026', '1984-02-16', 4, 5000, '', NULL, NULL, NULL, '2018-01-03 16:16:55', NULL, '1970-01-01 08:00:00', '', NULL, NULL);

-- ----------------------------
-- Table structure for ss_company
-- ----------------------------
DROP TABLE IF EXISTS `ss_company`;
CREATE TABLE `ss_company`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `expiration_date` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `license_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照-图片',
  `representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `company_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司规模',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state` int(2) NULL DEFAULT 1 COMMENT '状态',
  `balance` double NULL DEFAULT NULL COMMENT '当前余额',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_company
-- ----------------------------
INSERT INTO `ss_company` VALUES ('053f83d7-6a7e-4a26-b973-f7b95ac90c9a', 'T5', NULL, '5', '5', '5', '5', '5', '5', '5', 0, 5, '5');
INSERT INTO `ss_company` VALUES ('1', '传智播客教育股份有限公司', NULL, '江苏沐阳', 'xxx001', '张三', '110', '100人以上', '教育', '教育机构', 1, 5, '北京');
INSERT INTO `ss_company` VALUES ('2', 'it黑马', NULL, '北京', 'xxx002', '李四', '123', '100人以上', '教育', '教育机构', 1, NULL, NULL);
INSERT INTO `ss_company` VALUES ('22ae604e-6a80-4a78-978a-ce5c95dcc18c', 'T4', NULL, '4', '4', '4', '4', '4', '4', '4', 0, 4, '4');
INSERT INTO `ss_company` VALUES ('2b8283cc-c47a-4bd4-849c-966dda39aef8', 'T1', NULL, '1', '1', '1', '1', '1', '1', '1', 0, 1, '1');
INSERT INTO `ss_company` VALUES ('3c26ba62-1ac2-4188-a116-440a8443aa7e', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('4a91c2a5-65e6-4be6-b9d1-cfbb24598c6f', 'T3', NULL, '3', '3', '3', '3', '3', '3', '3', 0, 3, '3');
INSERT INTO `ss_company` VALUES ('8e5f554e-e156-4178-b01c-84a30326b01d', 'ddd', NULL, 'ddd', NULL, 'ddd', '123', '123', 'ddd', NULL, 1, NULL, NULL);
INSERT INTO `ss_company` VALUES ('929a4f8e-7b04-496c-bce1-8ec797a23ee7', '测试', NULL, '1', '1', '1', '1', '1', '1', '哈哈', 0, 1, '1');
INSERT INTO `ss_company` VALUES ('a4d08f44-8ec3-4210-bead-84cd5337d0ea', 'T2', NULL, '2', '2', '2', '2', '2', '2', '2', 0, 2, '2');
INSERT INTO `ss_company` VALUES ('ab41c677-df04-4c9e-bc46-df063d98f3e8', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('d5c8daef-0cca-4df9-8bb6-d19025e5dbd5', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('e2188d60-7ace-447d-8d88-5f70fe1226d4', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('f1bccd67-3823-4fc3-a386-89306275f7d1', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('f7fc7d31-2501-402a-a163-47007d8336f5', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 0, NULL, NULL);
INSERT INTO `ss_company` VALUES ('fa824209-d214-4b1a-8e3f-6923796b2f5d', 'arl', NULL, 'arl', NULL, 'arl', '123456', '500', 'arl', NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for ss_module
-- ----------------------------
DROP TABLE IF EXISTS `ss_module`;
CREATE TABLE `ss_module`  (
  `module_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `layer_num` decimal(11, 0) NULL DEFAULT NULL,
  `is_leaf` decimal(11, 0) NULL DEFAULT NULL,
  `ico` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpermission` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `curl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctype` decimal(11, 0) NULL DEFAULT NULL COMMENT '0 主菜单/1 左侧菜单/2按钮/3 链接/4 状态',
  `state` decimal(11, 0) NULL DEFAULT NULL COMMENT '1启用0停用',
  `belong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮时，可以标识其归属，\\n            查询某页面按钮时就用此属性查询',
  `cwhich` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quote_num` decimal(11, 0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` decimal(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_module
-- ----------------------------
INSERT INTO `ss_module` VALUES ('182104f0-7690-4a84-a90c-16d24e491a3a', '5', '系统管理', '日志管理', NULL, NULL, NULL, '日志管理', 'system/log/list.do', 1, 1, '1', NULL, NULL, '', NULL);
INSERT INTO `ss_module` VALUES ('2', NULL, NULL, '货运管理', 1, 0, NULL, '货运管理', 'cargo', 0, 1, '1', NULL, NULL, 'cargo', 2);
INSERT INTO `ss_module` VALUES ('201', '2', '货运管理', '购销合同', NULL, NULL, NULL, '购销合同', 'cargo/contract/list.do', 1, 1, '1', NULL, NULL, 'cargo', 9);
INSERT INTO `ss_module` VALUES ('202', '2', '货运管理', '出货表', NULL, NULL, NULL, '出货表', 'cargo/contract/print.do', 1, 1, '1', NULL, NULL, 'cargo', 10);
INSERT INTO `ss_module` VALUES ('203', '2', '货运管理', '合同管理', 2, 0, NULL, '合同管理', 'cargo/export/contractList.do', 1, 1, '1', NULL, NULL, 'cargo', 11);
INSERT INTO `ss_module` VALUES ('204', '2', '货运管理', '出口报运', NULL, NULL, NULL, '出口报运', 'cargo/export/list.do', 1, 1, '1', NULL, NULL, 'cargo', 12);
INSERT INTO `ss_module` VALUES ('205', '2', '货运管理', '装箱管理', NULL, NULL, NULL, '装箱管理', 'cargo/packing/list.do', 1, 1, '1', NULL, NULL, 'cargo', 22);
INSERT INTO `ss_module` VALUES ('206', '2', '货运管理', '委托管理', NULL, NULL, NULL, '委托管理', 'cargo/shipping/list.do', 1, 1, '1', NULL, NULL, 'cargo', 23);
INSERT INTO `ss_module` VALUES ('207', '2', '货运管理', '发票管理', NULL, NULL, NULL, '发票管理', 'cargo/invoice/list.do', 1, 1, '1', NULL, NULL, 'cargo', 24);
INSERT INTO `ss_module` VALUES ('208', '2', '货运管理', '财务管理', NULL, NULL, NULL, '财务管理', 'cargo/finance/list.do', 1, 1, '1', NULL, NULL, 'cargo', 25);
INSERT INTO `ss_module` VALUES ('3', NULL, NULL, '统计分析', 1, 0, NULL, '统计分析', 'stat', 0, 1, '1', NULL, NULL, 'stat', 3);
INSERT INTO `ss_module` VALUES ('301', '3', '统计分析', '生产厂家销售情况', NULL, NULL, NULL, '生产厂家销售情况', 'stat/toCharts.do?chartsType=factory', 1, 1, '1', NULL, NULL, 'stat', 13);
INSERT INTO `ss_module` VALUES ('302', '3', '统计分析', '产品销售排行', NULL, NULL, NULL, '产品销售排行', 'stat/toCharts.do?chartsType=sell', 1, 1, '1', NULL, NULL, 'stat', 14);
INSERT INTO `ss_module` VALUES ('303', '3', '统计分析', '系统访问压力图', NULL, NULL, NULL, '系统访问压力图', 'stat/toCharts.do?chartsType=online', 1, 1, '1', NULL, NULL, 'stat', 15);
INSERT INTO `ss_module` VALUES ('4', NULL, NULL, '基础信息', 1, 0, NULL, '基础信息', 'baseinfo', 0, 1, '1', NULL, NULL, 'baseinfo', 4);
INSERT INTO `ss_module` VALUES ('401', '4', '基础信息', '系统代码', 2, 0, NULL, '系统代码', NULL, 1, 1, '1', NULL, NULL, 'baseinfo', 16);
INSERT INTO `ss_module` VALUES ('402', '4', '基础信息', '厂家信息', 2, 0, NULL, '厂家信息', NULL, 1, 1, '1', NULL, NULL, 'baseinfo', 17);
INSERT INTO `ss_module` VALUES ('5', NULL, NULL, '系统管理', 1, 0, NULL, '系统管理', 'sysadmin', 0, 1, '1', NULL, NULL, 'sysadmin', 5);
INSERT INTO `ss_module` VALUES ('501', '5', '系统管理', '部门管理', 2, 0, NULL, '部门管理', 'system/dept/list.do', 1, 1, '1', NULL, NULL, 'sysadmin', 18);
INSERT INTO `ss_module` VALUES ('50101', '501', '部门管理', '查看部门', 3, 1, NULL, '查看部门', 'sysadmin/deptAction_toview', 2, 1, '1', NULL, NULL, 'sysadmin', 1801);
INSERT INTO `ss_module` VALUES ('50102', '501', '部门管理', '新增部门', 3, 1, NULL, '新增部门', 'sysadmin/deptAction_tocreate', 2, 1, '1', NULL, NULL, 'sysadmin', 1802);
INSERT INTO `ss_module` VALUES ('50103', '501', '部门管理', '修改部门', 3, 1, NULL, '修改部门', 'sysadmin/deptAction_toupdate', 2, 1, '1', NULL, NULL, 'sysadmin', 1803);
INSERT INTO `ss_module` VALUES ('50104', '501', '部门管理', '删除部门', 3, 1, NULL, '删除部门', 'sysadmin/deptAction_delete', 2, 1, '1', NULL, NULL, 'sysadmin', 1804);
INSERT INTO `ss_module` VALUES ('502', '5', '系统管理', '用户管理', 2, 0, NULL, '用户管理', 'system/user/list.do', 1, 1, '1', NULL, NULL, 'sysadmin', 19);
INSERT INTO `ss_module` VALUES ('503', '5', '系统管理', '角色管理', 2, 0, NULL, '角色管理', 'system/role/list.do', 1, 1, '1', NULL, NULL, 'sysadmin', 20);
INSERT INTO `ss_module` VALUES ('66a764f6-dc83-4f8d-82bc-0eabb7f7efc1', '9c5eb9b0-54a4-48bb-aab4-0d1d46cdfbbd', '企业管理', '审核', NULL, NULL, NULL, '审核按钮', '', 2, 1, '0', NULL, NULL, '审核按钮', NULL);
INSERT INTO `ss_module` VALUES ('8842b580-49c0-4871-b234-5cf9c721a507', 'ad3be6e7-551f-45b6-b816-b2b751e204ed', 'SaaS管理', '模块管理', NULL, NULL, NULL, '模块管理', 'system/module/list.do', 1, 1, '0', NULL, NULL, '', NULL);
INSERT INTO `ss_module` VALUES ('9c5eb9b0-54a4-48bb-aab4-0d1d46cdfbbd', 'ad3be6e7-551f-45b6-b816-b2b751e204ed', 'SaaS管理', '企业管理', NULL, NULL, NULL, '企业管理', 'company/list.do', 1, 1, '0', NULL, NULL, '', NULL);
INSERT INTO `ss_module` VALUES ('ad3be6e7-551f-45b6-b816-b2b751e204ed', '', '', 'SaaS管理', NULL, NULL, NULL, 'SaaS管理', '', 0, 1, '0', NULL, NULL, '', NULL);

-- ----------------------------
-- Table structure for st_online_info
-- ----------------------------
DROP TABLE IF EXISTS `st_online_info`;
CREATE TABLE `st_online_info`  (
  `A1` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of st_online_info
-- ----------------------------
INSERT INTO `st_online_info` VALUES ('00');
INSERT INTO `st_online_info` VALUES ('01');
INSERT INTO `st_online_info` VALUES ('02');
INSERT INTO `st_online_info` VALUES ('03');
INSERT INTO `st_online_info` VALUES ('04');
INSERT INTO `st_online_info` VALUES ('05');
INSERT INTO `st_online_info` VALUES ('06');
INSERT INTO `st_online_info` VALUES ('07');
INSERT INTO `st_online_info` VALUES ('08');
INSERT INTO `st_online_info` VALUES ('09');
INSERT INTO `st_online_info` VALUES ('10');
INSERT INTO `st_online_info` VALUES ('11');
INSERT INTO `st_online_info` VALUES ('12');
INSERT INTO `st_online_info` VALUES ('13');
INSERT INTO `st_online_info` VALUES ('14');
INSERT INTO `st_online_info` VALUES ('15');
INSERT INTO `st_online_info` VALUES ('16');
INSERT INTO `st_online_info` VALUES ('17');
INSERT INTO `st_online_info` VALUES ('18');
INSERT INTO `st_online_info` VALUES ('19');
INSERT INTO `st_online_info` VALUES ('20');
INSERT INTO `st_online_info` VALUES ('21');
INSERT INTO `st_online_info` VALUES ('22');
INSERT INTO `st_online_info` VALUES ('23');

-- ----------------------------
-- Table structure for st_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `st_sys_log`;
CREATE TABLE `st_sys_log`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `method` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of st_sys_log
-- ----------------------------
INSERT INTO `st_sys_log` VALUES ('002108e2-9a10-4510-9683-8d8fd1d374ef', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:28:53', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('00330EC5-4F2C-48BB-AFC1-ADC5CBAEB7AC', '001|调试', '192.168.1.110', '2012-01-17 14:04:46', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('007e19e5-3bf0-4a36-aa4a-2f029cf7ea5d', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:37', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('009275C9-7459-4862-B339-C7CD13C244D6', '001|调试', '192.168.1.110', '2012-01-17 11:57:33', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('00D0157A-AD60-4856-802E-A3461F6939E0', '001|调试', '127.0.0.1', '2011-10-07 12:37:29', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('00DA73C6-8DB4-402A-BEE0-95BDD79D0CDB', '001|调试', '192.168.1.103', '2012-09-11 10:56:23', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('011BD53F-99AF-4B45-B23B-4E02723BE7D7', '001|调试', '192.168.1.106', '2012-10-29 14:23:51', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('015CC22A-5C53-4597-B4AC-B51694D75C86', '001|调试', '192.168.1.103', '2012-01-20 16:03:49', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('01711206-e44f-4b6e-b456-fc02d17c7ac1', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:58', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0172bd68-ecff-421c-a926-20fe84f849c7', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:21:18', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('01970044-E8A0-41DD-A7CB-EF0E012FE798', '001|调试', '192.168.1.103', '2012-01-18 11:40:17', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('01C6DB18-D8AC-48CE-B3F2-09BCDFD8D9A3', '001|调试', '127.0.0.1', '2011-08-21 22:34:13', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('01d7adca-a809-48ba-b695-2e612b9d8c69', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:13:27', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('01d8ba3e-6a8d-4bc8-a1d0-06b1deb3b215', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:57:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('01F90304-E542-4B5E-9B3B-E49C17B6E891', '001|调试', '192.168.1.106', '2011-10-18 11:15:42', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('0226d0df-24d4-48a1-a106-4f6e7c0e7fd8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:41', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('026cb3cd-fbeb-4335-8799-cdd362cc5869', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:08', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('0280fa0f-9d20-41c7-b254-7cc2a2f7ed3a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:59:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('02AF06BD-65E4-4E02-8128-9E43B2AE06B6', 'anonymous|', '192.168.1.109', '2012-08-14 09:54:00', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('02B4B900-9D3F-4306-8F54-6395FDB5234A', '001|调试', '192.168.1.106', '2012-10-29 14:38:24', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('02d59800-dfde-4b6b-8153-79e0c3e74a4e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:05', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('02E0CA26-C6E2-4C90-B94C-4CB7C63A7971', '001|调试', '127.0.0.1', '2011-09-26 19:48:13', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('0304af2d-6ec7-4f1e-a63c-e8fe322c7530', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:44', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0311b103-c6c0-43de-9081-61f5c4234ee7', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:31:16', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('033e9818-e1e0-4ba2-92e7-2f208c6007dd', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:30:58', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('037a6814-7b5d-4592-934f-5ade79e25e63', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:52:59', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('03C5ACAB-C6C4-456F-9B3D-64A80BBECADA', '001|调试', '127.0.0.1', '2011-09-18 22:49:41', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('03ED9524-0BBA-4082-8FA6-2F6BA905A627', '001|调试', '127.0.0.1', '2011-09-21 19:32:38', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('042027CF-496F-4C79-BDD8-F3BFC05EDBCC', 'anonymous|', '192.168.1.114', '2012-01-20 12:15:28', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('044c0eeb-314e-47a7-a5d8-2cb52102eebc', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:31', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0451DE27-3C35-4054-B27B-80EC5F5303E9', '001|调试', '127.0.0.1', '2011-08-20 00:14:17', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('0464165A-6013-4AF8-8ED3-9350369780ED', '001|调试', '127.0.0.1', '2011-10-01 21:39:43', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('04894396-721a-48be-a0e6-a9f332f94b3e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:21', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('04afada7-885b-4e15-9d6b-813a391c5ff7', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:49', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('04c1671f-0bdb-4728-bc48-3a74700138ed', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:28:48', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('04e0ba26-70f0-4b6d-bbdf-1bc647be495d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:48', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('04ED9BC3-FB5F-4F89-9DF6-5F34FE0ACB26', '001|调试', '127.0.0.1', '2011-08-26 20:19:15', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('0537cab3-cfc8-4a6d-b188-255147e4f8cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:13', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('05586466-481A-4426-A237-D06BB78FA27A', '001|调试', '192.168.1.110', '2012-02-09 10:33:01', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('05817b84-f07d-41db-9e93-3e2eca385a57', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:37:28', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('058d17ac-c00d-4cc9-a72c-6f0a23ce61a5', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:50:06', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('05f03d8b-eac9-4a61-933c-20f5bcf55d01', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:08:06', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('06193ae6-3e43-490d-9b86-d4774cb104b0', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:30', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('061cb8e9-002a-4c6d-abb8-ff8be948ccde', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:45', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('062cff91-687c-4f34-b802-ff5ff57d1ef3', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:32:16', 'check', '/check--根据id审核企业信息', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('06376BC7-200F-442A-85F4-27578A9BAA54', 'anonymous|', '192.168.1.114', '2012-01-20 11:53:21', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('065ddb3e-68ef-4edb-bc7b-5eb04a5a5246', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:35', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('06604f32-d6f1-4097-acc8-2866c0c1323f', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:28', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('06767A52-69EC-430D-B15C-9BDB0952CF53', 'anonymous|', '192.168.1.105', '2012-04-16 16:00:36', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('06dbe3da-9238-4bc8-a974-9120ffbd7159', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:20:39', 'toUpdate', '/toUpdate--编辑角色信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('070788cd-f857-4900-8201-4b8f8abf6bed', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('071d9891-973e-45cd-9c4d-db5250b860a2', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:26', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0756843c-7c1a-42c8-aa9e-61987b9df879', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:48', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('07C0244F-BFAC-45D4-945A-91B1E7B060F4', 'anonymous|', '192.168.1.111', '2012-09-06 09:19:19', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('081ce009-d8bb-4f0e-b7a9-4c3d28311f88', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:14', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0871677f-e818-453e-8357-50ed915e1a86', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:54', 'toUpdate', '/toUpdate--编辑角色信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('08af1840-f9c6-485d-a89e-52bd2f840acb', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:22:31', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('08bd2e0f-4247-4ef8-8164-4b648edea83a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:41', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0907a9a2-7c81-4094-b911-2bd7c3c39579', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:32:59', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('096d3a48-ba21-425d-b1c2-42ace4c61b81', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:33:23', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0a290d09-cb6c-446d-8b4f-25cf2023e92d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:06', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0a4317a0-9b8a-4430-b4dd-be91d23bc62f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:02', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0b35303e-2ffe-4990-a08e-e9999f39e62f', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:39', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0b8f8183-faaa-40a3-9593-2f2a45a7b44a', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0bd30a36-be07-418a-994c-4986d8fbcb6e', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:32:16', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('0be62b45-986f-4ad6-9bf2-e356cf7be5aa', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:05:25', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0c4b9ebf-fd3a-4140-b4ac-7951daa86b8f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:53', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0c4ea8e2-e29e-4802-8717-fac481130ade', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:43', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0c81577f-6afe-4582-8711-f3866f7304e8', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:16', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0ddf63b5-dfbc-498e-a61f-802a0e55f270', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:16:42', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0e342137-2190-4062-88f8-4092a49fa6de', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:52:50', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0e89e7b1-601e-4aaf-b4db-c086fb5890fa', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:21', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0f5ce432-5580-4c8e-8c1b-e68e92a3d582', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:08', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0f7ae1ca-e733-4a70-b30c-01c9297ec0a9', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:54:57', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('0fac1318-6647-4b21-b59f-29e7cdf9eaf2', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:50', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('0fcb3508-b862-443e-b43c-bdd407905a07', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:04:09', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('1012edeb-fa90-4af6-bd35-65a3ee65aeea', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:46', 'roleList', '/roleList--跳转到角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1019ad50-d3c7-4983-bdf5-133a309bcca8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:18:15', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('10320d73-4c45-4f85-8b0d-b0611f54efed', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:27', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1058d915-ee63-4823-9327-f12e57fec89d', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:08', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('107b5a62-cec6-4183-9efc-54e72b44b277', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:16', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1095c4a2-9864-48fe-9ed8-c49904516026', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:31:22', 'roleModule', '/roleModule--角色跳转分配权限', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('10d3961b-47e3-482d-a2fc-5df85a4f2463', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:41', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('112c05fa-17ce-47a9-bb88-9c19d8ed610f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:30:30', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('11380d54-c777-4c71-b6c2-615ced9c7c26', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:28:56', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('114271a8-c038-44ce-b4d7-1146f81502ba', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:41:59', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('11e529ba-807c-42b7-96c3-619a870eb1fe', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:54:00', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('12c0c02f-5d17-4521-9727-ca3dc4d85a50', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:31:30', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('136f4051-0d86-4d63-9c75-ea801095273d', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:47', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1374ee59-2fbe-4212-9e38-0827649cd06e', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:35', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('13e9fae6-1edd-421f-8eac-822eceecd00a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:11', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('142ff477-b7f8-41f5-8ee0-85b8fbf0e88f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:32', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1451813d-ea56-45a1-ba08-7a76c3aed28b', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:54:42', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('14547d68-a8e4-4325-a931-6fcdd0bcdd5c', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 18:59:30', NULL, '', '', '');
INSERT INTO `st_sys_log` VALUES ('1480a95f-0a08-4da3-964a-fb60adc21cd1', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 14:00:58', NULL, NULL, '1', NULL);
INSERT INTO `st_sys_log` VALUES ('14ddf388-6da5-49f3-bea9-8368ef06b165', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:38:53', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1519e787-d684-48ac-bb0d-26553c435f78', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:46', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('152abe83-ef35-49fb-b996-0ecd574b2d75', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:49:29', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1554c631-944c-4e8e-b146-cf3263f3e410', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:47:47', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('159c068f-6468-4b65-823a-0beed008116b', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:40:05', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1688178c-a2d4-474d-b5fd-c11507f2a9af', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:46', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('169eb403-9945-4197-bd21-53c6d19d4a8e', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:30:10', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('16dbc1e9-46f8-4b0b-97c4-357a3b204db8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:41', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('16deef82-d976-4775-a9e5-9367147d50b1', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('171fc98c-81ee-417e-926f-462ae86079a7', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:57:44', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1778aa66-2fdc-4b68-b433-af90d61d9a01', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:18:14', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('177ac8f9-7718-4f0f-a14f-2fdda406c81a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:16', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('17a2ce32-6d41-4ecc-ac06-c08d1928d161', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:45:49', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('17c0c239-e395-4a13-a6bb-97356cd8921d', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:45', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1800e9ea-b1c9-43c9-a4f8-37efbecc42aa', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:32', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1858ac8d-e3ee-43c6-962f-06990968fd63', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:40:31', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('18b8e133-9d85-4904-b258-4428c8879d49', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:50', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('18bb2684-3b8a-466a-a17f-6cb4ad5a897e', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:51', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('191774f7-8bfe-4315-ae93-1b58ad1860fb', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:35', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1967eb8d-83e1-4310-9c1e-90910352eec3', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 18:02:44', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1a03409a-c8e0-41b6-95a0-572cb41d350a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:45', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1a0abcdd-718d-4a09-b507-34a4e7c505aa', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:33:57', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1a5402c5-b56d-4f59-aafd-3d56aed364fc', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:20:35', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1ae9d78f-4445-400a-95b7-4e8258f853e3', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:44:36', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1b15ca59-ddf6-4282-b971-99d5e56e0a2d', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:52:12', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1bfcaeae-dc52-46ed-9b83-b26707348a12', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:27', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1c62f7f0-6deb-4671-9794-e20af0f55552', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:16:56', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1caa93e3-80e2-4925-9176-ab8abb7cd44c', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:02:00', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1db9febf-d137-4e52-b534-763bdc9826d4', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:51', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1e07e6b3-0922-4ba2-a0af-e9ad744f54a5', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:50:44', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1eedf353-91c2-4d2c-8de7-4d0a2b1182fe', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:53:27', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1f130ab2-8a72-4c29-81f5-1c9d56a8104f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:47', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1f1db5fc-e3a7-439b-adbb-d706c15947a7', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:54:25', 'toAdd', '/toAdd--跳转到新增角色', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1f31e417-b108-458a-9f7e-aa59a1903bfe', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:07:08', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1f4a613f-bf36-4688-8482-0bbca4788859', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:10', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1f754ee8-c584-4d1a-9c9a-fb35fe2a038d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('1fb54224-91fb-4be7-a2ae-eb21873adc7b', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:01:32', 'toAdd', '/toAdd--新建企业', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2072cf48-c8bf-4d48-b0b8-da704c020d59', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:52:48', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('207a8151-883c-4b35-ac7c-00fd67d542ef', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:26:05', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('207fc0d3-ee38-4e52-98e9-81315e7592f1', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:46:19', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2080e1d0-6ba3-417c-9803-bde6a556a784', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('214d0ea7-c1ae-47d6-a286-b136e8502d4c', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:07:10', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('21c73cf3-6a70-486d-a3df-95f55fc89d69', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:32:48', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('223bf00b-1481-4df9-b419-e2391b333e3e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:13', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('22600c4e-b95f-4770-8590-3dabeee3e742', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:11', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('227624a5-c620-4daf-a2d1-bc540d18005e', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:14', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('233f0215-56e1-4b52-93f8-c9749c037126', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:43:43', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('23a97999-7d37-44cf-8f31-bb242b6ec6c8', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:55', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('24009828-c405-4844-ae86-6b0c23fc821a', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:48', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('244b999d-72e0-4a2e-b124-0b704020d848', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:46:03', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('24615da1-c02e-4d1b-85c6-f8c9f3c4451f', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:11', NULL, '查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('247f819d-e16d-424f-89eb-1da3af7eb0bf', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:13', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('24ef7655-553f-4200-9b79-5917ac118e5b', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:32:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2559e404-47db-4193-b00e-60d328a4a2d1', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:58:27', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('256aec48-296d-4e2d-890c-ec613d92af02', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:57', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('25ea9669-182d-443a-b79e-dfe20e6fdbff', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:57', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('260713dc-95a7-48ec-b479-e402ac7c4888', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:40', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('26073271-dd63-483a-aff6-b8646432a483', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:55', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('26157dc3-610c-43b7-b024-ab098b72236d', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:20:45', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('26d344a6-6007-4685-921a-812e3be5e238', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:42:13', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('26dd6438-2821-4ef7-b702-db3120a36511', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:43', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('270f29ef-002d-44bd-b396-74e3579081a2', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:53:53', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('27a704be-2781-43dd-9089-c5c301a70fea', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:05', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('27ad90c4-53a8-4f9c-b2d7-2482079463e3', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:09:59', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('27bb69e3-8ed1-45a9-b777-fc64397003a4', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:26', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('282e41ac-b1ce-4d4c-98e9-a45a1a0b2227', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:32', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('283bc47d-0e64-4fe5-9d18-d35a9783e3ed', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:30', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('284327f9-9970-4884-a173-e32ab7a5537c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:43', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('28e8fd8d-baac-46be-8a65-89883a9a005b', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:50:40', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('29903641-b0f7-4ce0-ba33-eb856cca6bfc', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:11', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2a225ddf-e6d8-43c3-be7c-e5ddd775a1b9', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:40', 'toUpdate', '/toUpdate--编辑部门信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2a798aac-c3a3-4e67-a777-44b3ca57d467', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:26', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2a84e810-adfc-4078-bc01-4d6091d202dd', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:35', 'check', '/check--根据id审核企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2a9112f0-4813-4544-9a14-d42e6a5089cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:22:34', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2adbd4c0-ed21-40b5-ba36-4bdda9714bc9', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:25:16', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2aea7bb3-e00e-4031-9c22-415a3c1feab0', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:13', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2aed7bcc-21b6-4347-b63f-b796fb1acdd7', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:58', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2b07e3d2-10a7-494f-bb56-a69571d8b0ea', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:17', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2b3fcbeb-bd22-4f6a-8574-9d70a49dba4a', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:27:39', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2b48ef96-ff55-4690-a8d2-c417299ae106', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:03:52', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2b6c9cf7-3650-431d-94ca-74377b58d134', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:11', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2bea6458-70fa-4a4e-9f9c-fc01574735be', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:21:03', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2da8a78d-c69b-44f0-90b9-1af46088e0cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:25', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2db47694-a6ae-4add-b05b-a1eba557bb1f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:07:10', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2e31bea1-781e-4934-abe5-43bbcef422b6', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:50', 'toUpdate', '/toUpdate--编辑角色信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2e3f5a7b-4095-4646-999b-7d3164116283', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:50:59', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2e5075c5-0932-4e59-99be-f595bc7d6b36', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:58', 'getZtreeNodes', '/getZtreeNodes--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2e65ffb1-4971-4ab0-9223-740ab3979daa', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:45', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2e72b7f5-62d7-417e-b179-980e580d1e90', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:40:53', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('2fcb5821-4bda-48c6-be97-013c301bf265', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:26', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('316712bb-38ad-4f68-ba2b-39501ad203e4', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:13:23', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('319720dd-83f8-4929-a6e1-e696d53377b1', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:21:14', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('31c29f51-3a22-428d-9e4e-fc8286b4b5c4', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:45', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('31d97448-213a-4776-9890-59e81a1acdbb', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:45:59', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('321334d9-c7a7-4e49-8cdc-8862e7e9e487', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:39', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('32326914-cc48-4196-a9ff-fdcfb6fe388c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:44:36', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('32706c23-e55c-4c8d-bc19-dc4bed417371', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:54', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('329df33f-4058-45ac-92f8-c83029acbea3', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:04', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('32bc0541-7501-43e6-8a1a-21279ca9fcb6', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:53', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('334ad18b-0605-4ccb-832f-03dbcb1c5f52', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:24', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('336be3c0-76a3-4906-89a5-8bdb90da2503', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:22:26', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('338d5d56-dbf2-4ef2-a2ba-8fdf764cfac5', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:42', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3411ae75-05ac-40ee-b969-486db903ed5c', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:10', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('342d19e8-76e5-41c1-8760-a7f7346d6347', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3446ba65-f60e-4892-9278-5f54b58d9897', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:10', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3447db43-609b-47b4-bf3a-b38098802333', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:32:41', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('349c60f0-ee42-48dd-ab95-c4f670165d8a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:22:24', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('34b82480-bdee-449f-8747-0d375da60140', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:17', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('35e8211f-a91b-4733-b907-485389781624', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:44:27', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('362250ba-87bd-42dc-8057-097d8ded839c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:31', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('364c1a96-ae9c-46ff-a6b2-c4cd6f6d2e8c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:30', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('366afec0-8017-4861-bbd2-c913500572b6', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:35', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('368c6a04-247d-4774-a342-2de0c6a9df46', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:17:44', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('36a1dcdd-92f3-45d9-9d32-637fbe97585e', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:22', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('37394f3a-77a5-49c5-aebf-c2a0f6ead31b', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:09:02', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('37b53814-a1ba-4f7e-82f6-3c43ce87893b', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:27', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('37e489bf-7cab-4e5e-8485-74a47aaf6680', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:34', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('37ea996b-d8d5-4a3c-87e9-6e02c9b288b4', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:02', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('37fc6c7a-d975-491d-bcd8-def036c2d3c8', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:04', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('388161e2-9423-47a9-8f62-4a7fad8ba4c2', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:18', 'toUpdate', '/toUpdate--编辑企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('38b01310-3cba-4ba2-8d34-bbe108229b7c', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:57', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('392761bf-0c8f-4aea-a3fc-8718ed085f2f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:59', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('39552b38-0b34-42b1-bf68-54b1d7ae2e32', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:40', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3955e4bf-5d08-40f9-bca9-3152c51c7645', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:43:17', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('39ada971-51a3-4f9b-856c-afe0fa06c2ea', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:16', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3acfd7d0-4581-447e-900a-b17017c80bb0', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:20', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b07f08f-5ba6-4722-acc5-e8ae1d881a68', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:36', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b1cbb81-b10d-4af0-a13a-b0d4e01d183a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:37', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b724f77-9a79-46fb-970f-3f3af564eeaf', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:14', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b89a2da-0068-4152-a86e-a0d7f011d3e7', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:24', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b8b8d9d-af76-4079-b705-07dc12639cc5', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 14:18:03', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3b8f8d2b-003f-45ad-8034-c26f12aeae14', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:00:59', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3bc252f9-7888-462e-bf66-c19efbaee187', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:26', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3bc45b01-85cf-47fa-9ba0-ff3fc22ea04f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:32', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3c05ef47-8b80-4e95-8727-59c915dd98e7', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:43', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3c1ef925-64ef-4b1d-9c72-7aee686a7bd7', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:47', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3c4b851a-d1fa-4b83-9a4b-d4354984a423', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:18:12', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3cebb85a-1c6f-4b89-8d2e-27b845b6f9da', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:31', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3d5a3d4d-0ff4-4798-b600-5d40875529ee', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:25', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3d5c36a8-8de0-48f5-930a-0cd9f1bb2f6f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:09:04', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3d70efce-eae1-4978-8071-bf851d7a3268', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:18', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3d83a52b-89db-4cfd-b665-1036b0f2a72e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:00:00', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3dbbf0de-2ecb-4d6e-bff9-23d2c9ed6169', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:20', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3ea1ee0e-8dea-4719-acad-5855c7f89e17', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 18:52:28', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3ea626be-91d2-4882-9f9f-5fc50e4f280e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:50', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3f200ee2-9f80-4dd2-b800-411e46373d5c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:38', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3f76e689-5110-44cd-80b5-6b41cfa772f4', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:41', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3fd33e11-5031-42e7-9653-c44ca8469fcf', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:42:38', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('3ffa1f80-65b1-49cf-a3cb-4ffd4c805fec', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:34', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4044f2fe-00df-4857-9d5e-69294b0783cb', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:36:16', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4049fa53-61ae-4230-9a4c-afc7d4f2be11', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 18:52:26', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('408510dd-8364-428b-aaac-266d6f8cc7bb', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:13', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('417455ad-a340-4f40-a0ae-07c5fe8092db', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:08:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('41c5baf8-62a0-4324-ba21-57332e2becdb', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:33', 'toAdd', '/toAdd--跳转部门新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4248aa58-14d7-4003-817e-15d8c3dcb7b3', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:41', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4250a948-dc6f-4598-8ef7-01a36b66e134', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:21:07', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('42928997-7a48-4b74-bfbf-233606f5c89b', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:40', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('43e2bdc4-c978-41e1-a2ef-baf97cec1758', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:06', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('44aa7ec6-3582-4192-9fe6-fb8f717d19b1', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:21:19', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('44af5fb9-35e7-4918-84ec-ea34a2806eac', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:23:26', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('45935a00-797b-4bcb-9b3e-d1efd9347e2f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:44', 'roleList', '/roleList--跳转到角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('45987f9d-a920-4317-bcf9-7c91f532c124', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:11:46', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('45a3aa86-3e0a-4a7f-8d04-9c2a6f297491', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:07', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4617c3ad-369a-466a-8ca9-3d36eca28853', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:30:07', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4657d965-19f2-40bd-bdab-bd30706ccd41', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:48', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4745c59d-4694-4fca-8dc2-ac3bd06fa263', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 18:09:04', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4757d92e-70bc-4320-a4b0-50bf4c472d96', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:25:11', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4783b219-8871-4da6-a6b1-85a7d8dc2b34', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:39:45', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('47db40bb-8610-4270-b4f6-2402766fae80', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:00', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('480fcfd2-c782-4fbb-a5b2-ada88f61430f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:02', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('487c5094-8bae-422e-9624-e233ae46bb25', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:24:14', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('48a8632b-a9e1-406f-bd46-cb7aefc8b17e', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:51:51', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('492529ac-06ef-426d-8c5c-93346d58bd3e', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:22:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('49fb50c5-be3d-405c-a532-f210a1d31396', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:14', NULL, '查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4a127629-1834-45be-9846-9ee4e8b85531', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:30', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4adf5c54-36ed-40ca-986e-9498a1ac9d7f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:34', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4b3f5cd2-ae1b-45df-869f-e3edd5adfa8e', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:08:11', 'toAdd', '/toAdd--跳转到模块添加页面', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('4b642d12-71f6-4284-bb7a-24e3a17e68a2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:13', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4b7faad7-5d8b-4632-ae0c-6e2c2bb690f7', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:32', 'toUpdate', '/toUpdate--编辑企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4b9be289-6062-4631-beda-4fd70e9fb10c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:34', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4c11e719-5d54-4ce4-a029-11cc19762d22', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:35', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4c297e67-2509-4c53-a747-dcfe6b4e9231', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:42', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4c75d489-9e9c-4262-b7ad-03db757c02e8', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:26', 'toUpdate', '/toUpdate--跳转到模块修改页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4dc094d3-392d-46e1-8b85-df4a14658209', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:26', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4dd775be-dc42-4dcf-8f2b-0125a6143bba', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:42:20', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4ef3c62a-1fbc-457f-b31b-bd9137a00244', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:35', 'toUpdate', '/toUpdate--编辑部门信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4ef8d332-b391-4fb3-bc8b-ff2f60c60039', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4f0a98c6-ef14-49ba-8fd7-004b450cddae', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:37', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4fa38181-c525-438b-bbd2-e40b57a5dfcc', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:41', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('4fbd28be-9bf9-4214-a7e0-0eb7793f3d64', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:31:55', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('50723e06-d00d-46e2-a5ac-e61a2881376d', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:32:53', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5098ced0-445c-48d3-90b2-c00b3b15453e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:33:34', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('50c44884-3724-4fbd-add5-dbdbee3c5211', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:15', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('50f1b2d1-60bb-4da7-b4a6-9599d6a00234', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:20', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('511c48f1-51cd-49da-a20f-b317e3c1708e', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:31:22', 'getZtreeNodes', '/getZtreeNodes--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('512187c1-3af5-4e5f-88be-5aff55b1cfb5', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:36', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('512426ce-701d-4b5b-92fc-78da1ddfe1ec', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:30', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('513383ed-146e-4e5a-a57a-7e723d5ef360', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:11:07', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('51beeea9-23ef-490e-8f47-25c843da68bf', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:56', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('520c76f9-466b-43b5-8089-e0fdaf5449bf', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:18:18', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('524debac-bfab-40b9-8143-79ae57ec1b71', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:11', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('524e23f4-8efc-4e48-8ad5-e7b14718a365', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:34', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('52a12ae8-9151-4cbe-8fc6-f02d98df4126', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:18', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('52f2026a-bf45-4c9a-90c5-0b9461f3179d', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:46', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('53177c9a-6cf9-481b-88df-31b0d9724b2a', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:48:37', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('53646c71-0b30-4837-b7ac-a7e07fe37af7', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:46:00', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('53c50568-3ec6-4e00-95e9-e9b1039a1543', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:04', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('53c85934-8811-4d46-974e-a7ca9aab2c93', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:48', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5463e403-ac56-408e-bf7c-d17c506736f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:51', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('54cddfc9-b6c7-4ef8-89ca-a0522c75ec54', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:57', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5565f15c-b82a-4a28-8d89-ac65780eff33', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:36', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('559b1c59-48dc-4b39-84ae-4406e6d79fc8', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:20:39', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5608c939-e88a-4bf9-908f-37a4c3f537f7', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:47', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('563e8250-48da-4a00-b5b2-619f5474d9f7', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:23', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5675cfcd-2275-476d-9fa2-baa8883e6f78', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:29', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5692b3ae-21d5-490a-81f0-637d972451d3', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:30:26', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('571d538a-8be9-4146-b192-ad9f4a73af0c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:03:49', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('574dbca0-ecf1-491b-8177-efda91114082', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:31', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('57aa78ae-25bd-4405-9f4e-02112ec03ff1', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:37', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('585ca04b-b1e0-4bf1-be34-c65595031733', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:58', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('58b165f2-7e1e-45a4-b6a7-bb80c1932b98', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:34:09', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5960e722-7e0c-48a9-acc7-938cbee06f8c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:43', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('59b0df9a-1a7e-49fe-b389-c26a9f655af1', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:48:57', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5a6407c3-e612-4d1e-991d-251cf65e119d', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:24', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5ad73fd5-c432-48ed-8ba1-ee21da5d4a24', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:00', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5b0c4f73-ddb6-464b-a905-2acda23d909f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:05', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5b3c84c7-43f3-4c98-af9d-5ca66cabc13a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:00:35', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5b3d3f25-bc37-4b47-93a5-d81793c29255', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:19', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5b536a76-86ee-466c-a548-889766dee657', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:37', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('5bdc536f-5102-4f32-89a0-6f63c83dcc13', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:04:12', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('5be323df-b153-4034-822a-eaf4a545e33c', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:52', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('5c3070f4-5476-4798-a978-268095f46ccd', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:08:01', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('5c53cb72-3fc3-4dca-a893-2cd949d3abc5', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:47', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5cb4b64b-66f1-4416-845d-26817559d241', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:32', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5cb9b674-c660-44ac-b94d-bc17533a1686', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:13:21', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5dac725b-6753-458d-87ab-9e46e449a522', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:16', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5e3f68a3-600e-43f9-971e-6426d821465a', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:30:32', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('5ee9dff1-19a4-4eaf-935c-9b315918fead', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:04', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('5f4fd2fb-4f5f-4f38-9ede-ddb68d442f89', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:37:05', 'printExcelByTemplate', '/printExcelByTemplate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6011f715-2c72-4309-b20b-6dbb7baa49a8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:32', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('60208e1c-c266-474b-ae4a-c3573433a8b3', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:09', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('602f2959-44fa-4ba6-9731-63d757ae1168', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:50', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('60373bfa-294b-401f-95bb-7a6c1d480edf', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:30:01', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('60d85b5d-2470-43e1-bee6-2d946b368c62', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:53', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('61173cb8-09d5-4fac-9a78-b96f550e452d', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:42:17', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('626c08d3-5116-4a9f-8572-d7ee9e3a8449', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:28', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('627dcc36-9865-4e23-a66b-a3ffbf22a2c1', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:24', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('62e3605b-80b3-4029-8d57-5804f6746a6f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:43:34', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6315191e-b3c9-41dc-a30b-ab4b1f5747cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:14', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6370fc7c-8bd2-4990-90f7-af5560f386d8', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:47', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('63d8ddce-f7a2-4375-9b17-7fc3f1a635a2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:13:02', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('63fb2397-686c-4dd3-8b45-f4fd31db604a', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:09', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6426adbc-59b1-464e-9a0d-b348783c37a3', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:18:45', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6433da99-98fa-4208-bff9-bf12349072c2', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:20', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6451ebb8-5a3e-44fe-baf3-ad5c29863413', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:36', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6496bad3-b08c-4126-bbf8-b8368c2d0901', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:50:45', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('64b3876f-ab7e-41e3-ae4b-362cb7474019', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:58', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('64f1de9f-0ca6-4b3d-8961-bcd349ccb6eb', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:57', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('65885105-e8f8-4437-be9c-f05c08f192c9', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:33:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6649a39c-5160-4a8f-b91a-58fa652bf6a8', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:14', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('66810fed-eece-47c4-b0ec-23651eeca1bf', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:43:16', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('668cddc0-cab7-4dee-b102-6264ea6d6f6e', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:50:49', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6698d5d6-ef09-4f03-a758-f1d1dd272563', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:53', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('66dfe111-2f91-4af7-bb4d-6c6c93d431ba', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:10', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('67047770-c169-4107-98ec-275a2eaa754a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:56', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('673a3d09-2647-4073-b349-5ac3c2d3314f', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:40:05', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('674d4577-b68c-4dfd-9926-2e062c6d96b2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:17', 'submit', '/submit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('67ec06df-e492-416a-86d3-7ca0af112a7a', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:36:43', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6822b687-512e-408c-99ee-9f03deffaaa9', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:10', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('684f30b8-c661-429e-8f15-13821be9dc37', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:09:08', 'toUpdate', '/toUpdate--编辑角色信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6858274e-bbc7-44e9-9364-f5ee0936ed8b', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:06', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('68b5ffaa-dd99-4a9a-984b-67f0327b7519', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:08:04', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('68becbe9-c84e-493b-92d3-7e43378f1779', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:46', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('68c7afca-8952-4cb9-b14b-5b5d191451c7', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:16', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('68e077b0-be10-4fe8-995d-4c4f75decfae', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:29', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('696daf2c-2de9-47c7-9ce7-475fac9d2342', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:11', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('69eae063-47a2-4bb1-9b71-72bda957633b', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 18:52:21', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6a4355ac-2ff5-4b5a-ae80-7d9509c0f03e', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6a4b7e5b-8459-4be4-b7ef-1ac3982cd978', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:38:57', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6a61fd94-a48a-4123-89ce-aa48c4749b41', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:03', 'submit', '/submit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6a874ba6-ba91-4d5a-9a92-24a62a7424b4', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:38:32', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6ab55a04-af83-4e0d-807a-25c0f72687df', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:26', 'toUpdate', '/toUpdate--跳转到模块修改页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6ae2adf1-e49f-47e7-b7f1-5c15dc9e769f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:31', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6b21f043-ae49-4295-bff4-4dd48f3efea6', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:55:14', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6b8e83d9-017a-43ea-af15-766457e2aa26', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:37:41', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6bae3523-b660-4f9d-ba6a-361de0b8c99f', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:46', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6bc3b0ca-c460-4d3c-b24b-6c24950949dc', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:24', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6c043d08-196e-4ff7-8c0e-c91da9121fd4', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:37', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6c119a44-7c82-4455-bfd1-7a06f7c7205b', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:30', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6c217b08-d78a-4c4d-be0f-04fa4cf13555', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:30:36', 'roleList', '/roleList--跳转到角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6ca1f181-4c8a-472e-af69-f3ad2ff074ce', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:07', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6cf273c4-768e-4703-a4ac-8cb01113015b', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:41:46', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6e025fc1-bc57-4c87-b6e3-c83c44e39b5c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:29', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6e0a969a-f781-4c3d-8bdb-9d265b5f3691', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:52:40', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6e729222-5404-4359-b31c-8b7d196419f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:07', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6f62848b-d51e-4bbc-97ad-a89858f6e53c', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:16', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6f8cc8a8-ec71-4121-b4dc-14618d2fe2f0', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:50:46', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6f9e3d3b-b654-4a1c-8266-bdbd2e41c264', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:13', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6fce25c4-809e-42dc-a926-9ca6a6e6d2c4', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:07:36', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('6fedd986-908f-4592-9392-1ee1b64a8b58', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:08', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('700cdfb4-5216-4221-a72c-911596ee6d83', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:39:10', 'toAdd', '/toAdd--跳转部门新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('70456179-61fa-4b4e-8358-1031d141bfb2', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:30:09', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('709bc195-7248-4115-9aea-047473814b26', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:31', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7135d3e2-37cd-4cc9-8437-6008a9e50d45', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:39:12', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('71e705d7-ad5a-44f4-a5b3-aedec1ef2741', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:30', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7253b6f7-8c09-4715-8895-01fa563e573a', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:21', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('72db370d-6313-49f4-b274-c799296e5c9d', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:15', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('72f7ebda-9a2a-47f9-826c-d951f3ecb982', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:41:21', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('736ea564-1352-4923-9e49-b2d7e4ce0b7c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:33:38', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7370247c-f1c8-4bb3-85a5-c44f6ad67379', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:56', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('740b4982-b8b4-47a3-b15b-93c3cac55703', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:53:57', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('74f190a5-2a4f-4462-a4f2-b69ae3b62d82', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:54:03', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('75316be5-86b9-41e1-ad85-fe6eca9b3992', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:48', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('75562a12-c03e-4df2-b158-9bceda3be644', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 10:13:37', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('75727edd-9a30-4152-92db-558d9dd07fc4', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:37', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('759e8320-2d73-42f1-a2e4-c9fc1d8e1ea3', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('75c1ea67-c08e-4e89-8710-6e12bc897265', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:49:42', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('75e88143-98d8-446f-a691-77424f1d7c11', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:38:58', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('764cdc7d-7bad-41ef-8d08-2348882b0b38', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:00', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('76578054-3aca-4b41-a8bb-1cf4d89f0754', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:55', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7679da79-ccd4-469f-8ea7-87cd56398045', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:16', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('76f121b9-234f-49e1-aa9a-8f10df1921bc', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:42', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('77af2e6d-dbe1-495c-a094-8c401cdd13ad', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:06:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('77ec9e3a-a18b-48d1-bd58-a825ee564030', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:26', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('782b2b82-7516-44b7-bb17-73faf7ef8936', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:21', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('78318f52-04d9-4c2d-8b03-031a81780f4d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:20', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7866b746-82ec-449b-9e55-16006fe87ca1', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:25', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('786912be-359f-48ee-af79-0bfac84f2d87', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:39', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('78f5906f-59c4-49b0-9507-8ec12b3bc2f4', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:55:14', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7916dee7-155e-4875-971a-980074473f47', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:02', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7950a288-4680-4fb4-926e-18f45695dc74', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:51:53', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('796184b9-b84d-4c88-91a9-0926d0096926', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:15', 'cancel', '/cancel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7971bec3-e123-47a8-a418-390b223d7d70', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:34', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('7a75087e-a442-4b09-996f-666d45c00e0e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:48', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7ae66a1f-9d16-4481-a138-91cb28423601', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:38', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7b208c7a-b459-4a8c-bef9-909844f5785f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:42:40', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7b701c5e-b515-47eb-8fae-f764a8e07c41', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:21', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7b7d1002-7ad0-45e7-9a3c-54de41292e72', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:38:35', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7bd74510-e6ba-499d-9d88-b01e10b30151', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:46', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7c63c504-84aa-4699-8c8a-a99d0bf99fd4', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:33', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('7c8ffa2a-8612-408b-9ae1-702a6c17b4dd', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:54', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7c9a6f1e-4950-46da-9c56-6ebc150e636b', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:27', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7cd1ff2c-f107-4063-8b22-381bdea5b459', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:03', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7d486c6f-6c35-4e0c-a6f7-60059209aad6', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:18:31', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7d5584f3-a55e-4f89-92b2-4928eff9ae2c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:53:42', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7d810c38-8129-418d-9c92-36266b088715', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:46', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7e0f2342-acc2-4184-bced-d0dd91becbfc', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:37', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7ed26084-6552-4d2b-a4af-5d4988d34dc9', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:41', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7ed4b83f-3ee9-4e7a-9121-ced17e89f16f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:43', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7f08ec66-8335-428c-ba79-533577e70a08', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:29:02', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7f607899-143e-444f-aeb0-59b9b266791c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:22:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7f70597a-26e0-4a92-9d63-b941c6ec0d18', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:11', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7f73d41d-705a-472a-9c19-5dfad9054e5e', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7fc0fd1a-2db7-4ad8-bb1a-55215cd5eb52', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:36', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('7ff8bfb8-aa5f-4cc9-bfe4-dd18fc1fdd0b', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:15', 'toAdd', '/toAdd--新建企业', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8040985c-3ba4-48ac-a21c-c7f32861e3cf', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:45:44', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('80c40c6c-1324-4243-b7df-4313b52537ad', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:50:03', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('80d77642-3e67-41ee-a6f9-292e6bd6c99c', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:20', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8107c762-58d3-420e-a6c7-8097003f36cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:06', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('810cb980-fedc-40cf-999a-c946e8179adb', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:39:48', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('819ae0ea-39c3-4c63-b806-ebba7b9e2b4c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:56', 'submit', '/submit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('822cf59a-0b5b-485e-b4ee-d827c5bf7a6b', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:04', 'cancel', '/cancel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('823de31a-fb82-48bf-b48d-b1e954a5091c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:33', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8269208a-f409-4f06-8a18-7e5273d7e73a', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:42', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8279b14f-98b6-480b-95f2-52ccd2c15760', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:34:01', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('82bece1f-b585-44da-a539-dc8b36370c64', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:09', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('82d9fa21-bc6f-421a-9b7b-6839451bec06', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:27', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('830f8aa6-3b66-483d-9085-565c7c1a67bd', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:09', 'cancel', '/cancel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('831e4e33-d03c-4a7f-9aae-eb5ddc3e9bd6', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:27', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8329b306-ac96-4f71-a0dd-a8a89f07c6e8', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:35:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('83ec8bf3-3f4e-4647-883d-e8b7086e8b79', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:53:53', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('841364b6-eb28-4fab-89e1-4348163cc281', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:34', 'toUpdate', '/toUpdate--编辑企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8484d741-1681-4379-9691-1102d5487171', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:08', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8541c032-4313-4fcd-8deb-202c02499402', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:10:32', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('857d2332-ad06-4708-9366-25b40155262f', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:31', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('85bc25f1-101a-473d-aa65-f5eb7e8c7305', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:28', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('85c56d21-b3a5-4298-be55-b997c2c5ee2a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:30', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('85ff911e-b099-4f8a-aa34-2736d5fcccc9', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:46:30', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8660c2a6-6526-46d3-b840-86e1fa3c6e23', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:49:30', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('86ece9e9-af6d-489e-8680-d3c1d4929f2a', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:06:42', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('879cfc80-d0b3-4b17-b3d4-cecaa209d77f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:15', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('87b68151-f711-4008-a007-3a9393b8817d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:09', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('87bcdaa1-04d6-499c-bd3e-283423d8255d', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:14', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('89397782-1303-42e3-80de-522437e83026', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:01', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('897e6137-41c5-4957-b8a7-1bab56256c68', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:52:47', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('898b0bc2-af69-46ff-8c5a-e76386a1bd65', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 14:17:25', NULL, '', '1', '');
INSERT INTO `st_sys_log` VALUES ('898b6ba4-badf-4645-a6a9-46533756489b', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:48', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8995e599-dab9-407f-aa0b-d5cbf7f597fd', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:53:03', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('89d298f3-0655-4edb-b90a-245845f180c0', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:51:12', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('89e6b885-4f11-4861-af56-9ae25befd454', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:20:58', 'roleList', '/roleList--跳转到角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8a1059ab-a441-48d2-b52e-cdce874a9d30', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:36', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8a343fb2-ac8c-48b6-80aa-5c21ecea38b8', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:02:24', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8a9c0395-8397-44df-9f9c-39b22d935b79', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:17', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8aa52188-0b51-4599-956d-2798b3ea32db', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:50:05', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8af781af-f425-433c-b151-de4da26338c6', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:23', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8b670afd-d7b7-4422-821e-d98bbcce52c1', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:09:13', 'getZtreeNodes', '/getZtreeNodes--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8b72b143-3b69-449b-a684-f3d3b131ef89', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:58:27', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8c22045c-05b0-41e2-b0d6-e28cb9601562', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:46:11', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8cc02b20-88f3-43e9-ad01-156bb7d66cce', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:29:04', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8cf2fc97-c22e-404b-970f-9ab02cac7043', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:50', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8e9b5fa1-11f5-4369-b388-e4279e0d8fd9', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:39', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8e9bb303-45a6-43b2-ad92-642ba2e6a830', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:39:07', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8ec6036f-2bfa-4e41-b56c-8ae45b060f6a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:42', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8ecbb83c-d102-49ea-8692-57cf714c8c7f', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:47:41', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8f1d76b3-a543-4b62-b624-91feff42a8f3', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:34:01', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8f4046d6-23a0-4607-947e-5f14c93e07c4', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:56', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('8ff5a54d-8e52-4c86-85e7-09546a9f14bb', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:09:59', 'check', '/check--根据id审核企业信息', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('906967ac-0f24-4b0f-a9d8-cc552169bea2', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:03', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('90e3d1f3-3595-41e5-90cd-c02d22633909', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:16', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('91157ab5-227b-44c7-bd43-377fadcc12e2', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:53', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('913670a1-6b33-4b92-b677-311c1744854f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:48', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('91e8f92c-7631-4a06-b305-82888424f5d5', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:57', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9219105c-8cbd-4c05-8937-2032450fd40b', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:35:14', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('924400cf-a58f-41d7-ac33-be7f05af15f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:10', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('92db1c9d-479e-4581-b631-0c3e4ea430e9', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:48:09', NULL, '进入修改用户页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('93b74555-15f5-4423-b7ef-f9de1d9a94e2', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:09', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('93c31f4a-311f-40b8-ab65-1b4bcf42bfcb', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:17', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('93d89b03-2db6-46d4-a2cb-93aafcf95c2d', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:53', 'getZtreeNodes', '/getZtreeNodes--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('93e0ed38-5b1d-4b2e-bf4b-f287c61471e7', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:10:23', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('93e13c4e-15ea-40e8-8b26-bd99bb64f404', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('93e1e938-f42e-4b44-ae0e-45c79c3cc8e7', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:00', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('94765e9f-67e6-45b6-ac6b-b13b71efea87', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:36:18', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('94bdb17b-0c42-4e02-a41c-41a59830cc3f', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:28', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('94f64194-65c4-4a7c-8e7f-d422968f351e', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:15', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('955eedea-0215-4cf9-8caf-1e749c4ee93c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:18:18', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('95d7467b-794b-47c5-ab17-8c4d92c8d6f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:14', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('95d760af-d6a4-46ca-a46f-a4c9ffa349ba', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:57', 'roleModule', '/roleModule--角色跳转分配权限', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9676a69e-4f44-4794-8330-d588ab186c49', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:56', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('968c6884-babd-4f6b-8b4d-aec189c6862a', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:36', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9706dc39-d595-4fd8-80ed-bf5c15377be9', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:17', 'toAdd', '/toAdd--新建企业', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9732966b-b84c-450f-8497-6d27ecc4a6a6', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:12', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('976a52b9-e52b-4be7-853c-4e9306396b79', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:23', 'toExport', '/toExport--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('97942795-2d49-4fb5-99c7-e216a433a945', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:22:54', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('979bea5d-448e-41cf-8d04-9b9a91566bed', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:20', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('98616de4-9b78-4019-af3c-258d65ba1da2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:10', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9895e06d-61c1-4be4-a49b-187ea0cc36f5', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:34', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('98c56cf7-a199-4221-a964-0ca7208bbc32', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:26', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('98d44bfa-e15c-410d-9249-d3c0e9af87d6', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:44:38', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('98efc120-3339-47d1-ab86-49ec355c8ea8', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:37:34', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('99252d03-a15c-4855-9b44-7fcd188ff04c', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:39:09', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('99266246-4fdf-4a47-a224-38f187b48567', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:22:40', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9a02216e-8aac-4f39-8d37-23e694e1b4b8', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:45', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9a8f883b-df20-42ad-adce-5383cf59b5f8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:57', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9aa3c244-08f0-4b38-93c5-bb5ac1a19df4', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:09:00', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('9ac16796-5f67-43c4-8242-67017963babd', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:39', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9b04bb44-6d3d-4157-aa18-9df01d8b2acf', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:36', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9b0c3296-19a7-4ce6-bcf6-30e512841747', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:43:17', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9b408477-674e-4435-a317-ef2922991310', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:49:29', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9b5f4521-ee3d-40b1-9e4e-36653699aac2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:00:17', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9c31fe41-5722-469b-a012-f92f4e13f3e4', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:11', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9cdb57ac-2b0c-491c-ad36-2456419f7458', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:44:27', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9d2bcde1-49c3-414a-96d3-1f539fa78d0d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:33:25', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9d932631-522c-4e20-876a-05b290225bf6', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:11:44', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('9de48bad-2b68-4b73-b8bf-366d679cf3f5', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:15', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9dfc41f5-582f-4394-956e-781178658043', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:37', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9ebc2e88-fcfa-44ee-831e-20a8f399d72c', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:55', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('9ebde39e-0b0c-4ec5-866f-44f281b8a9a3', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:23', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9ec58d7d-eebf-42c5-aaea-8f4408e550ad', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:54:02', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9eddf327-4728-4779-8ec6-fd36dfdde03a', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:00', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9ee006fd-ab3c-4c27-8e02-d50d092614fb', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:00:18', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('9ee064ab-62b5-4e06-9485-7d294491ba69', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:39:03', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a028436a-a973-49b9-9877-3f96a52c8c3e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:43', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a07f54c3-f178-4a82-af8d-3c906f3e9b18', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:51', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a0a10cf9-c183-4e30-b9a8-9f29519cd5ce', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:43:42', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a0a6c306-689a-4222-b5da-fb0b5db3f626', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:01', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a0fba221-32df-411a-a02a-4677fff1a48f', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:39', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a167fd1a-6422-4cf3-b0df-49daf52da9f8', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:13', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('a1781d74-ce1d-4c4c-aaa0-9922be64804f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:45:49', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a19f8c7f-af9f-4c01-96bc-20b8aee995a0', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:13', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a21fd2e6-da72-4e67-b6ba-004641f6391f', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:12', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a24e1c79-542a-42c7-96f1-4be22f0f51c2', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:42', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a251b781-a25f-44b1-9258-1a660ad96e43', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:08', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a2a13c11-bee0-4005-bbb6-b422ddedf61c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:39:09', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a328bbbf-9490-4c85-af4a-08ec9c336065', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:39', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a345f0c5-d8eb-49cc-96e3-64eda319ab82', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:17', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a3466279-02ac-4c60-8f1a-107452fb04d4', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:52:09', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a3519b4d-ce0a-475b-864b-cb5363a2084a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:46:01', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a3e22453-0a99-4434-ac2c-a04b186e866d', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:53', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a3e5e132-36d2-47eb-a2e6-8a4965a11912', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:29:49', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a49be46d-b1a9-4a67-a574-d590a1610a47', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:54:01', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a4c52b1d-7068-4811-81a6-ec5fa7c44a8b', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:21:04', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a4d3a75f-6424-4f6d-8bb3-3e116062c15d', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:32:08', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('a4db6003-9a9a-46db-b2c8-0f252cde4317', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:34', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a617cda3-cc6f-47c5-a7ff-03302fdd5013', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:21', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a652a28e-9f11-4628-964e-51c4fcf7ccf0', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:12', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a66dfbe7-fd43-4d81-85db-3bd8113b3bec', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:24:12', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('a67a8c51-8ba2-440c-82e3-0cdad44a0553', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:48', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a6999537-1daf-45e2-b9f6-b76f24ee88b2', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:52:07', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a713023b-8130-42d8-8a26-a739d2491283', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:41', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a714d3b3-54fe-4565-baa0-de7ab06c1100', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:45', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a74ee3ad-3183-4350-be95-dff876ba22d8', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:22', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a76cd2d9-3449-4510-bc28-de78a88294f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:39:02', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a7afad45-5425-49f5-9789-4711cbc4a36f', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 14:16:07', NULL, '系统日志列表', '1', '');
INSERT INTO `st_sys_log` VALUES ('a7ed9bec-a7bb-49d7-a251-938019f64846', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:56', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a90b8c6d-5ccf-435c-9de5-40b04eab766d', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:45', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a9a61003-915b-425d-897c-5ac72bcd8d50', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:03', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('a9b05bd9-3c93-4b19-96d4-223c7cec80d2', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:45:44', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ab4aa3f0-5ba7-4f8b-b04f-2a0f95e30d3b', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:18', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ab63be7e-8b8e-4ab8-8746-509c44125e36', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:31', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('abb65a56-507a-49e2-a799-d96f1bd9ed90', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:27:42', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('abc6a9c0-e03e-42fc-9d1a-42d87604f661', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:53', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('ac8f5ec2-8ffb-4a9c-bd1f-01da3585f9cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:14', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ac951596-b70f-4bfb-9f15-9e25164e9c62', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:03', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ade7c288-0457-4fdb-8f5c-4e9f74c00846', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:06:00', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ae3c991e-45f2-41e4-a857-3fc74919de8c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:15', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('af23fe4c-1a49-439d-b6ec-46a698808ddb', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:38:59', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('af932f86-0f5b-4b87-b088-a19c5a564523', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:36:06', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('afb192f3-8bf2-4f0b-88bf-2245f41609b4', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('afbe2863-de35-431a-b24d-3e2a87a5f7f8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:10:24', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b14d7fd5-c5d6-4915-b15f-0db7cf7a5b53', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:18:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b15cef42-0e16-4199-9a82-fa8059516a57', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:00:05', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b1b63af9-9043-4946-b3d2-c546d230f9b4', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:14', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b1fcde69-7a58-4aa7-bddb-79566def5409', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:35', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b1fe743f-31c4-4021-93e1-40294385d0e2', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:29', 'edit', '/edit--保存或更新模块', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('b2272708-f488-45f7-a9fb-713919f4befc', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:47:45', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b2403a26-0423-4fe6-9b86-a1f231e4f85b', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:40', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b25712b1-a43c-4db1-89dc-0933e73a5a79', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:14', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b268695c-3f51-46bf-982c-d312a9ca66f3', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:33', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b275ea12-2cf8-4532-a56a-2741c23a1113', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:37:43', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b2c88e21-e7fb-40f6-ae9e-8a4fab73a24c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:23', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b2f05855-1933-43fd-9df0-2d27ee44fdb4', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 14:09:25', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b3b04b52-508e-46a0-8e9d-e19feeae2904', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:53:52', 'toAdd', '/toAdd--跳转用户新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b3d12b95-4f1e-47f7-98f4-589da4396e93', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b4b6a368-e1c6-4929-af28-c67e0c3b70c8', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:34', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b4fa7f4c-f282-49f1-b707-36c1eb8ae8ec', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:07', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b54ec38d-0845-49c4-9e43-4461cfcbca50', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:29:09', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b5684f30-9038-403c-bdc1-4c941909cc8f', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:20:43', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b5e5893d-f98d-4cf5-93bf-7a4f15859d73', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:06', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b62a069e-d2de-48cc-b43b-af04b2d64d49', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:43', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b63ac08a-fc3f-46bf-97fa-c1b1180ee10c', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:04:03', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('b64e08ce-796c-48b2-ab5b-d5328b0e0357', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:38:41', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b64fc0d2-1a8a-4d5f-ab47-a7a677f4defb', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:39', 'toView', '/toView--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b666ca37-ec95-48df-a9a7-1cac6cfd98f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:42:38', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b66a0f9b-52ec-4121-9525-89800d74b96d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:34', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b6bb6ee6-34af-44b4-b137-9147155004e4', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:50:26', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b6e14c00-83f8-4c3f-a8cc-ea2107d2a98c', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:56', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b730aebf-0451-4bcd-a3e6-b5b5a8f77701', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:55', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b7746483-d61c-4683-b947-46f2ae623a12', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:20', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b7981ae9-3937-4797-aca0-000f18ba2b41', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:29:08', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b79f5f15-315f-457d-a20e-267c591dcb91', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:30', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b818caf9-e3ff-4c72-bd31-922d9ad8e470', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:20', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b894e48d-917c-4e4a-975c-32f0c323c50a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:20', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b8f94621-f34f-44ef-ac00-fe8b3d0ae75f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:32:21', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b954db60-ee6e-42fd-8578-5da7ce3ab0d5', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:06:00', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('b9967ebc-6b0f-4e4a-b301-06f228b7d00e', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:14', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('b9e0a495-31d8-4e11-84ca-fed021dc2e2a', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:00', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ba039545-631b-4d31-9001-20d301f4ed54', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:38:31', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ba81f134-f5c3-4535-aafc-ad873f18367a', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:09:06', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('baa2cb78-729f-48c5-8d96-995a1b19647c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:45', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bac50924-3b4a-4779-80b0-f351ac7ce509', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:10', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('baeaf9d2-3eeb-436e-9ad4-cf4955a08071', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:25', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('baeba39c-b3c4-471d-b1f0-4fe4b0f4247f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:45:40', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bb07c396-3f43-4108-a509-6b27d6adf81e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:47', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bb28704a-658f-4c03-867c-5a8cf635bb3d', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:50:26', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bbc85525-13d9-4c93-bce6-2965f704dcec', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:43:17', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bbceb974-0d31-4db9-81f1-f0e7adb47a76', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:16:40', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bc3eb250-1fc8-467b-8d6c-8e796f4237f6', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:53:04', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bc6bad87-594a-4bf1-804a-e7ce7ee3f722', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:46', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bcc228cc-67ba-4aa8-9b8d-85cf21cc0541', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:40', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bd08d68c-9a8f-43d8-9cf6-4cc349c5c3c7', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:24:58', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bd8dd1a0-25e6-4576-bad6-521dd9ee3774', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 17:30:12', 'roleList', '/roleList--跳转到角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('be3d4641-4b5c-4f59-8610-c05cc65d4793', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:17', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bf09f537-125c-4956-8db7-56d4ade31933', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:29', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('bf1185df-68e1-47f8-a3ac-dfc26e26c3be', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 18:02:54', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bfa1968b-0ea1-4f19-90dd-fb7421b6648c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:54:30', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bfa3cdb4-1242-41ae-a046-aa9c1ed4791e', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:31', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bfa958e2-c226-4d2e-8039-f7258fa4b26e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:41', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('bffce1c4-e001-4b5d-8480-15156aff9a00', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 10:30:14', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c00acdc9-311d-49d9-89f3-59605fb5554c', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:08:57', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('c175377c-9800-4a65-a616-af1f05d8759a', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:54:38', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c190acfa-0954-4419-86ca-2fc60b6caba3', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:32', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c1a84994-6a1d-4e5e-b8d5-7573f8a48305', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:35', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c1b184fa-b31c-4fc6-8107-39d0fbcb352f', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:53:27', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c1e3f67c-e02b-4478-b243-84fb4e95d15d', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:24:10', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('c23860fa-ebaf-49ab-bc13-60d9abe48d24', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:08:43', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('c24b3e4b-f22a-4ea1-b372-5c982cf874d4', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:54:03', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c2722523-bfdb-428c-bffb-a11e43f391e6', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:22:30', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c275e2bf-617d-44ad-a038-ab8ad3d3bba1', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:24:48', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c3912ba9-15ff-4d8e-859d-a7bd1570119f', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:40', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c39569c1-0371-4201-9817-635b8fa62d96', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:09', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c3c2dcba-d709-46fb-a0bc-b54e30f1ac43', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:12:59', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c44290fb-815e-4e44-80ab-d68e2cefedae', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:26', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c443250c-6e23-4ca8-8875-e33a7d8e597b', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:01', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c50cad57-a2c1-4b93-a746-75187c44513f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:10:22', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c51256cc-36f4-479d-95f0-5fb378f21631', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:53:18', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c530c51a-e7f2-4481-a281-9b5559feb6c1', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:32:35', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c6106536-37a7-47f4-b220-76445872f54d', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:56', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c65e3ecf-f34b-44fc-9034-acef536c35fa', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:32:52', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c66f3801-24c5-41c9-8877-7edb7cfb7416', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:38:59', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c6e255d5-c09f-4107-9aea-e7893d6c28f3', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:54', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('c720c9e4-5bea-481c-9f76-d1f0b3587b92', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:25:28', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c7dcf0f2-01a4-4140-99db-0262cd6cbfdc', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:26', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c81324e0-0c50-4c28-957a-d64dc1d0fe0b', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:09', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c81c30e3-1258-4530-b16e-14658f5ffb89', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:12', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c82ef2e1-2875-45d2-af82-5f5e58a06323', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:07:43', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('c84bc3a5-8aa2-4962-8400-c4d3b48dd340', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:11:09', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('c90e596d-cb78-45f8-a0eb-2d958899b231', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 14:17:09', NULL, '系统日志列表', '1', '');
INSERT INTO `st_sys_log` VALUES ('c9414aaf-ef97-45f6-bef8-b42fd301d892', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 18:47:14', NULL, '', '1', '');
INSERT INTO `st_sys_log` VALUES ('c99bac8f-12cd-459b-8217-3d3f579b53de', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:36', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ca3cc8a0-8d17-4850-9dfa-163e995965e8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:21', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cac2b7da-7eb3-420c-b62c-660b135baf98', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:28', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('caf6d2e1-840d-463b-a008-130131292df6', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:53:06', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cb13ce52-59f1-4cc4-a241-ea75e3ed9fb1', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:52', 'toAdd', '/toAdd--跳转到新增角色', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cb59ec7c-f88e-412f-93fd-f0899414841c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:34:27', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cb944c5d-20e8-4dfa-b86f-782b56e6f787', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:17:50', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cbc5a30a-a3fa-49b3-a9fa-1db6e88ecc8c', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:28:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cbf5e079-66fa-42bd-92aa-be0ac85031c0', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:37', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cc1da2aa-26e2-4c2e-9e2d-296981150ec3', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:11:10', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('cc304330-86d8-43e2-9c79-5385b47b9e66', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:36', 'toAdd', '/toAdd--跳转部门新增页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cdb14193-0c29-4ce3-b398-5647a00bd716', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:50', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ce5c1de3-7030-4699-aa20-bd1c3553a590', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:32:02', 'printExcelByTemplate', '/printExcelByTemplate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cf205530-5a40-428c-b491-dea40e2bd016', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:41', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cf2e9fc2-1073-4cd0-9e73-7a22f594e4a4', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:23:23', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cf374c2b-6fde-47a3-9ba5-599d14dbffeb', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:25:01', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('cff7c0eb-396a-47fb-8327-3d0beab7691a', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:34', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d00322dc-7823-40f9-b77c-5bb8e548f34f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:30', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d09300e1-c4dc-4206-80f8-cd813d854df2', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:44:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d09ee507-6efd-4738-87f1-40645d2fd0ff', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:44', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d10f1fb0-c33c-4fad-8284-abf75e0ceafd', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:46', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d114942b-0dde-4d9b-8e5a-f09f8e9e2c56', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:32:10', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('d1199336-cf39-4f3e-adc4-738efb57eb23', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:57', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d142e3ad-d229-47e0-8b98-e7be639333d0', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:25', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d158d33c-0ac6-4c23-8265-c0dc6512692a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:33:18', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d22e5544-2ba0-48dc-8841-ec8b6679b335', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:06:42', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d2755db7-0a82-4531-9292-2c786d38192d', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:49:01', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d2cbbfd4-3767-4951-b891-cf29513de5c8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:52', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d319ae54-eaed-492a-a951-8bb053c9389d', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:31', 'toAdd', '/toAdd--新建企业', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d32f88d6-fb9a-4c9f-b7d6-e623647b2109', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:38', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d35b24b1-67d4-4083-a9bb-38ae0e094363', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:23', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d3f6a2fd-4318-4370-9b7a-401a3b4b2771', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:54:59', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d5286192-befd-4db3-bd9d-2882fc8b81f9', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:54', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d539e980-a7c6-413e-916d-c8985f9d557a', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:13', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d58272ee-a469-4439-a3ca-bacfa34124cd', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:02:54', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d588a9a8-91b8-4cb4-bd9d-b721a7e2d8c1', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:45:46', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d5e17dcd-9535-4497-aaa9-8e0a399aed5f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:00:03', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d697454b-91ec-4024-8f86-e9dddb13ce37', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:27', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d6c69e9f-e092-4c15-a331-09e0730f151a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:22', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d70b188f-476d-46b4-ac15-947b646b63c7', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:14', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d7197139-6021-44be-863e-042baf475040', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:38:13', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d840a89e-c041-4481-b808-b229f858a1e1', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d895a06a-53bc-472f-a839-a5fe372bbfcc', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:01:05', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('d8a56932-bb3a-4241-9cb0-ea3c26ab5eb5', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:08', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('da2b6e7d-1919-41ad-9229-c3dfd1fbff13', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:18', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dab2d87b-ca20-46c9-80bd-b1fd23d78ab8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:12', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('db9ecf77-cb33-4daf-8007-96530b48a743', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:13:25', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dba793df-ea34-4074-800f-7dcdc4043cba', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:09:13', 'roleModule', '/roleModule--角色跳转分配权限', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dc10b43c-260e-4630-86e0-9f2493bcf4e5', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:30:01', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dc48d363-4f38-4ef8-8d4a-2334141aa56d', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 14:23:24', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dc4c6488-120d-4766-9d16-f6c8f889c43f', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:47', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dc5ea987-91bc-4c77-93bf-4c01b39607a4', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:00:05', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dc6084ca-bf98-49e8-8c80-f20f4fc0d855', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:55', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dcc4350d-e644-4e50-9f2e-946788ff449e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:26', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dd0d8156-3c19-45e7-9405-3fb37f9fdcd8', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:30:43', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('de123e78-c986-4d8f-8c30-e0e37f851e01', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:51:46', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('de1453f1-b3e5-4a1d-9f7d-45075816c66b', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 17:13:28', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('de952468-982d-4681-ae8b-fc0e6ce932e7', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:50', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dea72456-986c-45c5-b5df-221f18877ee0', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:48', 'toAdd', '/toAdd--跳转到新增角色', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ded05758-70f3-4649-be72-0894983a99a2', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:21:02', 'toUpdate', '/toUpdate--跳转编辑页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dfb68abf-1127-4e49-8781-00d04b341f8e', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:30', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('dfdaf4d9-c2bc-4ef4-8e43-2501ec793fae', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:31:49', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('dfede380-1a8b-440d-8ea1-d73898b44883', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:52:28', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e016e946-6399-41c7-b6de-0d5f76dd1669', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:47', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e0a2f5b3-4f99-4c64-8c20-4e5c7d1d90bc', '老王', '0:0:0:0:0:0:0:1', '2019-11-08 11:20:35', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e0adab6f-5475-46ec-b4c6-bd3e7e3a1e1a', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:54:22', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e0bd3b78-3de5-435c-abd5-7869ec6016ba', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:12', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e101971f-64f9-44bd-89e2-5c4f384960d0', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:05:30', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e117ed37-dc8f-4b5f-9c6e-edb3700d68c5', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:08', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e199dcb0-9c0c-4b38-a8ba-e71ad9c22a43', '匿名', '0:0:0:0:0:0:0:1', '2019-03-20 14:17:22', NULL, '', '1', '');
INSERT INTO `st_sys_log` VALUES ('e1f83b8d-52bc-42c9-b03d-f43aa555031f', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:51:54', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e26b5589-db93-40d3-9577-4fb60a6e3571', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:12', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e2776be8-58a5-46b9-9608-1c293d33392a', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:10', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e29774c0-683d-4dcf-83de-3f98a19c09c6', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:12', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e29984a1-9c63-4203-a9b2-5d16f9ccc96e', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:24:02', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e30e0413-f9e2-48f2-acd1-ef270e7bf49f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:24', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e317dd50-cd2b-474c-b0ae-337fa96c3249', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e33369f0-d8f8-4673-a8ef-128a7b6c83e6', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:08:41', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('e3376510-39da-401b-8c5b-72bc1b7c6f1d', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:11:11', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('e3cc4026-bbc5-4de3-8325-ea014dedc76d', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:10', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('e3d69c0b-9294-4011-b03c-444380546194', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:22', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e4987fb4-489e-4102-9c59-99dda83ada61', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:52:14', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e4be8b11-fc2a-4935-acae-2efb61742c67', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:31', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e581ad94-08e2-4c27-baf3-1123c83e5998', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:53:55', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e6e0fc2e-5d33-4642-b220-4da2a7906956', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:48:55', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e6f4612d-ad63-4f35-b416-3a22d0a26e70', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:09:04', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('e78fe3cd-327b-4553-897d-e4626b2ce46d', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:50:21', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e7e91e8c-4387-4f50-963e-3bef3ac4061d', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:41', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e81146c3-9e33-4d18-90ad-fcc8c1b50067', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:56:12', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e83fe2bb-714d-4116-a12a-b32b8bb37a21', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:49', 'toUpdate', '/toUpdate--编辑企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e93551d2-b7d8-451a-bafb-b3bcdd3f80df', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:40', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e9c4f773-fa58-4eae-8c28-d0fa58568a66', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:38:36', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('e9fe4d74-481a-44fd-a61a-268e43169bdc', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:43:17', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ea937db8-c055-4ed4-bc17-ba57af4c56f1', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:48:51', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('eae23166-9b33-493a-a1f9-a6694a3cf77a', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 18:09:07', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('eb1b14e8-1a50-4f0f-84a3-06d0517e574a', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:18', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ebb2bd72-a34b-45e0-b8e2-c10baddd208d', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:27', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ec69b8d7-808d-4961-9071-c96c155b02a0', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:30', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ed096f52-5588-49a2-8096-436d41cab808', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:23', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ed6f1da2-edb7-4d22-a6f7-b4dd9a1535c2', '老王', '0:0:0:0:0:0:0:1', '2019-11-15 09:36:03', 'contractList', '/contractList--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('edddf871-ae51-4e37-ae65-7ee3c5086b8e', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-08 23:32:17', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('ee2013a1-4146-442a-9baa-6a05fee43921', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:32', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ee94e5b4-6ab0-49eb-877f-150ecd64c240', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:09', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ee9bc3c8-cdc2-4051-ae08-ecdb870416e5', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:21:04', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('eeb7b157-f647-4f9d-8716-c8609a1ebdd8', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:32', 'importExcel', '/import--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('eee032ea-8e8f-448a-b4eb-53de81a2bfb3', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:20:41', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('efb116d8-5703-4c38-89a3-34c5fd607cd7', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:23:00', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f041e08b-e780-47c0-a3d9-d47ab78ccb58', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:59:02', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f0667bfd-a63f-4854-814c-98f1b2d65be9', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:16:52', 'printExcel', '/printExcel--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f07e92bc-26d2-40c2-abda-d9a53ddefd94', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:56', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f08ba9ca-2131-4c00-b565-a2d5340e524c', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:09', NULL, '查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f0bdb62c-c989-48af-9879-9d28de855692', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:39:13', 'toUpdate', '/toUpdate--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f0e844e2-e670-4a69-bb61-76f6a3737e24', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:21:19', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f0f72446-7add-44b8-91e8-bf0d18c4ea12', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:02:53', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f119aedf-f935-47d9-b978-19abc32d1c95', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:40:59', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f11a8576-d3c7-4527-a7d6-caa4c8e2ecad', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:53:29', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f185aeb4-1d03-4d09-b502-2144ee9b8fc6', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:34:47', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f1bdc984-dae1-40ba-8d7a-c1c13b44ce34', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:50', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f1f0f904-34e0-4cb3-9f13-6f2671c09cb8', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:48', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f1f74a4d-a75d-4d22-a812-8d239a18ad67', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:24:29', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f332bfb6-7bdc-4fef-ad6e-6c0f0ac53e3f', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:53', 'roleModule', '/roleModule--角色跳转分配权限', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f3454771-74f5-49a0-a3c9-fbf66b49f0a5', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 16:08:51', 'list', '/list--分页查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f3aef06d-fb55-4b7c-8ec9-e95f53b73747', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 10:54:41', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f3f800e6-095e-4b70-b997-ace7ddcfb636', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:49:19', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f43334d3-61ca-483d-8866-347004f281f3', '老王', '0:0:0:0:0:0:0:1', '2019-11-18 11:49:22', 'exportPdf', '/exportPdf--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f4794061-dba1-4b40-8e6d-ada7e6b71e9f', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-09 09:04:10', 'list', '/list--分页显示企业列表', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('f491987c-ad78-4c9b-be6d-37671b2c2e7d', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:07', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f4cbe85d-e54c-44a2-b09a-952219c28dd1', 'zhangsan', '0:0:0:0:0:0:0:1', '2019-11-06 18:10:31', 'list', '/list--模块列表分页显示', '', 'SAAS企业');
INSERT INTO `st_sys_log` VALUES ('f53fb4bb-fd1f-44ba-aec2-9417fb8d3691', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:18:53', 'edit', '/edit--保存企业信息', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f56707f8-16bf-46c9-a5c7-65a883f19bbd', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:47:55', NULL, '查询用户列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f5822de1-564c-4d67-b316-58db35e68ebc', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:52:57', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f5950250-9360-487d-9ebf-0c2d8fd41911', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:28:45', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f636c99c-f1bd-4c36-8f7e-946b90b43fd9', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 17:22:58', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f688f77d-1099-4215-a693-dbe415b5a1d1', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:31', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f76e7370-bc8e-49de-b726-51c560d51d56', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:08:34', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f7798b1d-f558-4a54-a556-739cefc32116', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:35', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f786c28a-67bc-4249-97ce-87a7e70092b0', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:50:04', 'list', '/list--分页显示企业列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f7890ce4-9313-458b-8ac3-0fac3ffedb84', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:45', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f807ff75-f22c-4a51-8c2c-b5e3ef0af6a8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:31:37', 'toAdd', '/toAdd--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f90d6e9b-ad18-474a-8b6b-472735aa11bd', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:04:16', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f91c88d5-3d67-44d9-8eec-fe5e899be39c', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:47', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f9b05e21-1687-442d-be40-772df5fdccec', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:45:17', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f9b8671b-440f-4b7a-b94e-418cfb8eba80', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 15:52:40', 'list', '/list--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f9ba86b6-f8b5-4c54-9210-1d63a47f393f', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:35:43', 'print', '/print--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('f9dee730-b1cd-43f9-9fdd-03ea8849631e', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:34', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fa4485f9-822a-45f6-bf6c-1fa45ea1138c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:36', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('faa05bea-fff5-416c-a410-0a86366cd67b', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:25:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fac84763-4c5f-4908-8f44-b01e70c7eb78', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:53:39', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fad4e0dd-d4e9-4c01-b71e-ca6bf79d35b9', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:12', 'list', '/list--模块列表分页显示', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fc13793b-fb9c-41dc-9753-0957f08e7232', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:55:03', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fc2fd752-7816-4ca5-bd25-e3af61dc161c', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 18:02:53', 'list', '/list--分页显示角色列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fc75e583-849d-406c-9964-950cbad84e35', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 15:33:30', 'list', '/list--分页查询部门列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fcc4cc22-c004-4712-93e9-9997821bcb06', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 11:05:30', 'delete', '/delete--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fcfbef38-bad4-49e4-aad5-68dfd436e325', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:44:46', 'toImport', '/toImport--跳转到导入货物页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fd6f94d8-9064-4caa-9c5a-03d88c375977', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:44', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fd87f1ba-d4e2-4000-b081-93b51eff2bcd', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:52:09', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fd9c576e-e4c1-469e-a964-eeec697e27d2', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:16:40', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fdc7fd47-b7a2-4960-9a40-036ac2582f90', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:29:39', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fde46e95-ad98-4903-ac3f-8f71436216f8', '老王', '0:0:0:0:0:0:0:1', '2019-11-10 16:32:49', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('fe2dc0ef-c389-4d46-abaa-cc8103cafaad', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 12:36:29', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ff1a9feb-2a47-434d-a58c-802dd7201acf', 'lw', '0:0:0:0:0:0:0:1', '2019-03-20 18:55:48', NULL, '', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ff411caa-d295-43d3-b195-31d79ac8c135', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 23:23:20', 'edit', '/edit--', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ff52ab76-0d3d-4867-b9d5-eca691e7da23', '老王', '0:0:0:0:0:0:0:1', '2019-11-05 21:54:46', 'list', '/list--分页显示日志列表', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ff5fee31-ce5e-410f-9407-879f7e99bf04', '老王', '0:0:0:0:0:0:0:1', '2019-11-06 09:48:03', 'toAdd', '/toAdd--跳转到模块添加页面', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ff94756b-0b47-4046-80b0-6c597a346b03', '老王', '0:0:0:0:0:0:0:1', '2019-11-11 13:00:13', 'list', '/list--合同列表查询', '1', '传智播客教育股份有限公司');
INSERT INTO `st_sys_log` VALUES ('ffff53cf-466e-43cb-b2b8-25b34c6fc2f0', '老王', '0:0:0:0:0:0:0:1', '2019-11-14 10:30:24', 'edit', '/edit--', '1', '传智播客教育股份有限公司');

-- ----------------------------
-- Table structure for user_temp
-- ----------------------------
DROP TABLE IF EXISTS `user_temp`;
CREATE TABLE `user_temp`  (
  `USER_TEMP_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEY_CLASS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_CONTENT` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE` int(11) NULL DEFAULT 1 COMMENT '0停用1启用\n            ',
  `ORDER_NO` int(11) NULL DEFAULT NULL,
  `CNOTE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_BY` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`USER_TEMP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)用户缓存表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vote_record
-- ----------------------------
DROP TABLE IF EXISTS `vote_record`;
CREATE TABLE `vote_record`  (
  `VOTE_RECORD_ID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CTYPE` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不一定有',
  `VOTER` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可匿名',
  `VOTE_VALUE` int(11) NULL DEFAULT NULL,
  `IP` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADVISE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`VOTE_RECORD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '(2019.11.21新增)投票记录' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
