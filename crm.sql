/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.5.49 : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `crm`;

/*Table structure for table `approval` */

DROP TABLE IF EXISTS `approval`;

CREATE TABLE `approval` (
  `approval_id` int(11) NOT NULL,
  `approval_namea_id` int(11) DEFAULT NULL,
  `approval_namea` varchar(255) DEFAULT NULL,
  `approval_nameb_id` int(11) DEFAULT NULL,
  `approval_nameb` varchar(255) DEFAULT NULL,
  `approval_namec_id` int(11) DEFAULT NULL,
  `approval_namec` varchar(255) DEFAULT NULL,
  `approval_named_id` int(11) DEFAULT NULL,
  `approval_named` varchar(255) DEFAULT NULL,
  `approval_namee_id` int(11) DEFAULT NULL,
  `approval_namee` varchar(255) DEFAULT NULL,
  `approval_namef_id` int(11) DEFAULT NULL,
  `approval_namef` varchar(255) DEFAULT NULL,
  `approval_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approval` */

/*Table structure for table `approval_new` */

DROP TABLE IF EXISTS `approval_new`;

CREATE TABLE `approval_new` (
  `approval_id` int(11) NOT NULL COMMENT '审批信息id',
  `approval_name` varchar(255) DEFAULT NULL COMMENT '审批信息名称',
  `approval_type` varchar(255) DEFAULT NULL COMMENT '审批信息类型',
  `approval_value` varchar(255) DEFAULT NULL COMMENT '审批信息值',
  `approval_SecurityLevel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approval_new` */

insert  into `approval_new`(`approval_id`,`approval_name`,`approval_type`,`approval_value`,`approval_SecurityLevel`) values 
(1,'所有人',NULL,'所有人','10'),
(2,'主管级',NULL,'主管级','20'),
(3,'经理级',NULL,'经理级','30'),
(4,'总监级',NULL,'总监级','40'),
(5,'副总经理',NULL,'副总经理','60'),
(6,'总经理',NULL,'总经理','80'),
(7,'创建者',NULL,'创建者','-1');

/*Table structure for table `base_dict` */

DROP TABLE IF EXISTS `base_dict`;

CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `base_dict` */

insert  into `base_dict`(`dict_id`,`dict_type_code`,`dict_type_name`,`dict_item_name`,`dict_item_code`,`dict_sort`,`dict_enable`,`dict_memo`) values 
('1','001','客户行业','教育培训 ',NULL,1,'1',NULL),
('10','003','公司性质','民企',NULL,3,'1',NULL),
('12','004','年营业额','1-10万',NULL,1,'1',NULL),
('13','004','年营业额','10-20万',NULL,2,'1',NULL),
('14','004','年营业额','20-50万',NULL,3,'1',NULL),
('15','004','年营业额','50-100万',NULL,4,'1',NULL),
('16','004','年营业额','100-500万',NULL,5,'1',NULL),
('17','004','年营业额','500-1000万',NULL,6,'1',NULL),
('18','005','客户状态','基础客户',NULL,1,'1',NULL),
('19','005','客户状态','潜在客户',NULL,2,'1',NULL),
('2','001','客户行业','电子商务',NULL,2,'1',NULL),
('20','005','客户状态','成功客户',NULL,3,'1',NULL),
('21','005','客户状态','无效客户',NULL,4,'1',NULL),
('22','006','客户级别','普通客户',NULL,1,'1',NULL),
('23','006','客户级别','VIP客户',NULL,2,'1',NULL),
('24','007','商机状态','意向客户',NULL,1,'1',NULL),
('25','007','商机状态','初步沟通',NULL,2,'1',NULL),
('26','007','商机状态','深度沟通',NULL,3,'1',NULL),
('27','007','商机状态','签订合同',NULL,4,'1',NULL),
('3','001','客户行业','对外贸易',NULL,3,'1',NULL),
('30','008','商机类型','新业务',NULL,1,'1',NULL),
('31','008','商机类型','现有业务',NULL,2,'1',NULL),
('32','009','商机来源','电话营销',NULL,1,'1',NULL),
('33','009','商机来源','网络营销',NULL,2,'1',NULL),
('34','009','商机来源','推广活动',NULL,3,'1',NULL),
('4','001','客户行业','酒店旅游',NULL,4,'1',NULL),
('5','001','客户行业','房地产',NULL,5,'1',NULL),
('6','002','客户信息来源','电话营销',NULL,1,'1',NULL),
('7','002','客户信息来源','网络营销',NULL,2,'1',NULL),
('8','003','公司性质','合资',NULL,1,'1',NULL),
('9','003','公司性质','国企',NULL,2,'1',NULL);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`),
  KEY `FK_cst_customer_source` (`cust_source`),
  KEY `FK_cst_customer_industry` (`cust_industry`),
  KEY `FK_cst_customer_level` (`cust_level`),
  KEY `FK_cst_customer_user_id` (`cust_user_id`),
  KEY `FK_cst_customer_create_id` (`cust_create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`cust_id`,`cust_name`,`cust_user_id`,`cust_create_id`,`cust_source`,`cust_industry`,`cust_level`,`cust_linkman`,`cust_phone`,`cust_mobile`,`cust_zipcode`,`cust_address`,`cust_createtime`) values 
(14,'马云1',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:01'),
(15,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:01'),
(16,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:01'),
(17,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:02'),
(22,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),
(24,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),
(25,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),
(26,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),
(28,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),
(29,'令狐冲',NULL,NULL,'7','1','23','任盈盈','0108888886','13888888886','6123456','北京三里桥6','2016-04-08 16:32:04'),
(30,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),
(31,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),
(33,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),
(34,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),
(35,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),
(36,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),
(37,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),
(38,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),
(39,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),
(40,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),
(41,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),
(42,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),
(43,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),
(44,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(45,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(46,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(47,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(48,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(49,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),
(50,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(51,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(52,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(53,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(54,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(55,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),
(56,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),
(57,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),
(58,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),
(59,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),
(60,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),
(61,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),
(62,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),
(63,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(64,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(65,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(66,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(67,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(68,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),
(69,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),
(70,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),
(71,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),
(72,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),
(73,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),
(74,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(75,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(76,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(77,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(78,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(79,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),
(80,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(81,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(82,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(83,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(84,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(85,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),
(86,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(87,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(88,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(89,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(90,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(91,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),
(92,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),
(93,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),
(94,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),
(95,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),
(96,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),
(97,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(98,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(99,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(100,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(101,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(102,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),
(103,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),
(104,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),
(105,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),
(106,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),
(107,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),
(108,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(109,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(110,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(111,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(112,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(113,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),
(114,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),
(115,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),
(116,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),
(117,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),
(118,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),
(119,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(120,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(121,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(122,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(123,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(124,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),
(125,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),
(126,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),
(127,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),
(128,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),
(129,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),
(130,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(131,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(132,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(133,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(134,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(135,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),
(136,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),
(137,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),
(138,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),
(139,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),
(140,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),
(141,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(142,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(143,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(144,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(145,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(146,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),
(147,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),
(148,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),
(149,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),
(150,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),
(151,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),
(152,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(153,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(154,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(155,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(156,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(157,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),
(158,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),
(159,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),
(160,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),
(161,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `department_id` int(10) NOT NULL COMMENT '部门id',
  `department_name` varchar(255) DEFAULT NULL,
  `department_zhuguanji` varchar(255) DEFAULT NULL,
  `department_jingliji` varchar(255) DEFAULT NULL,
  `department_zongjianji` varchar(255) DEFAULT NULL,
  `department_fuzongjingliji` varchar(255) DEFAULT NULL,
  `department_zongjingliji` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`department_id`,`department_name`,`department_zhuguanji`,`department_jingliji`,`department_zongjianji`,`department_fuzongjingliji`,`department_zongjingliji`) values 
(1,'信息部','6','5','7','8','9'),
(2,'财务部','5','8','6','9','9');

/*Table structure for table `department_user` */

DROP TABLE IF EXISTS `department_user`;

CREATE TABLE `department_user` (
  `department_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_user_uid` varchar(255) DEFAULT NULL COMMENT '用户id',
  `department_user_did` varchar(255) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`department_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `department_user` */

insert  into `department_user`(`department_user_id`,`department_user_uid`,`department_user_did`) values 
(1,'9','1'),
(6,'5','1'),
(7,'6','1'),
(8,'7','1');

/*Table structure for table `dingdan` */

DROP TABLE IF EXISTS `dingdan`;

CREATE TABLE `dingdan` (
  `d_id` int(10) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `d_cfname` varchar(255) DEFAULT NULL COMMENT '处单方姓名',
  `d_phone` varchar(255) DEFAULT NULL COMMENT '输入您的手机号码',
  `province10` varchar(255) DEFAULT NULL COMMENT '省份',
  `city10` varchar(255) DEFAULT NULL COMMENT '城市',
  `district10` varchar(255) DEFAULT NULL COMMENT '区',
  `d_jdxxdz` varchar(255) DEFAULT NULL COMMENT '街道信息详细地址',
  `d_yy` varchar(255) DEFAULT NULL COMMENT '医院选择框',
  `d_fw` varchar(255) DEFAULT NULL COMMENT '服务类型',
  `d_djh` varchar(255) DEFAULT NULL COMMENT '正确的登记号',
  `d_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `d_status` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `d_a` varchar(255) DEFAULT NULL,
  `d_b` varchar(255) DEFAULT NULL,
  `d_c` varchar(255) DEFAULT NULL,
  `d_e` varchar(255) DEFAULT NULL,
  `d_f` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dingdan` */

insert  into `dingdan`(`d_id`,`d_name`,`d_cfname`,`d_phone`,`province10`,`city10`,`district10`,`d_jdxxdz`,`d_yy`,`d_fw`,`d_djh`,`d_create_time`,`d_status`,`d_a`,`d_b`,`d_c`,`d_e`,`d_f`) values 
(2,'梁开愿','梁开愿1','13187417497','广东省','广州市','荔湾区','广东大翔集团','医院2','待见','123','2020-05-13 23:57:24',NULL,NULL,NULL,NULL,NULL,NULL),
(3,'123','梁开愿1','13187417497','内蒙古自治区','呼和浩特市','新城区','123123','医院1','待见','123','2020-05-14 00:07:55',NULL,NULL,NULL,NULL,NULL,NULL),
(4,'梁开愿','','','','','','','','','','2020-05-14 00:09:06',NULL,NULL,NULL,NULL,NULL,NULL),
(5,'梁开愿','','','','','','','','','','2020-05-14 00:09:16',NULL,NULL,NULL,NULL,NULL,NULL),
(6,'梁开愿','梁开愿11','131874174971','北京市','北京市市辖区','东城区','广东大翔集团1','医院2','自检','123123','2020-05-14 00:36:40',NULL,NULL,NULL,NULL,NULL,NULL),
(7,'1235555','梁开愿166666','13187417497','山西省','太原市','小店区','广东大翔集团666','医院1','待见','1239999','2020-05-22 19:17:56',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `fuwuleixing` */

DROP TABLE IF EXISTS `fuwuleixing`;

CREATE TABLE `fuwuleixing` (
  `f_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `f_name` varchar(255) DEFAULT NULL COMMENT '服务类型',
  `f_a` varchar(255) DEFAULT NULL,
  `f_b` varchar(255) DEFAULT NULL,
  `f_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `fuwuleixing` */

insert  into `fuwuleixing`(`f_id`,`f_name`,`f_a`,`f_b`,`f_c`) values 
(1,'待见',NULL,NULL,NULL),
(2,'自检',NULL,NULL,NULL);

/*Table structure for table `head` */

DROP TABLE IF EXISTS `head`;

CREATE TABLE `head` (
  `head_id` int(10) NOT NULL COMMENT '标题id',
  `head_name` varchar(255) DEFAULT NULL COMMENT '标题名称',
  `head_url` varchar(255) DEFAULT NULL COMMENT '标题链接',
  `head_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '标题创建时间',
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `head` */

insert  into `head`(`head_id`,`head_name`,`head_url`,`head_date`) values 
(1,'客户管理','/customer/list.action','2020-02-10 21:51:06'),
(2,'用户注册','/toadduser.action','2020-02-10 21:53:53'),
(3,'用户列表','/userList.action','2020-02-10 21:54:18'),
(4,'创建流程','/toaddworkflow.action','2020-02-10 22:49:29'),
(5,'流程列表','/workflow/list.action','2020-02-11 08:51:10'),
(6,'新建流程（查有效流程）','/workflow/findworkflowNormal.action','2020-02-11 08:51:21'),
(7,'未完成流程','/workflow/notFinishworkflowdata.action','2020-02-11 08:56:00'),
(8,'已完成流程','/workflow/Finishworkflowdata.action','2020-02-11 08:56:13'),
(9,'未创建节点流程','/Approval_newList.action','2020-02-11 08:56:25'),
(10,'创建角色','/toaddRole.action','2020-02-11 08:56:36'),
(11,'角色列表','/roleList.action','2020-02-11 08:56:46'),
(12,'添加部门','/Department/toaddDepartment.action','2020-04-14 15:51:19'),
(13,'部门列表','/Department/showDepartment.action','2020-04-14 16:07:06'),
(14,'待办事宜','/workflow/workflow_todo.action','2020-04-29 14:11:12');

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `node_id` int(11) NOT NULL COMMENT '节点id',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名字',
  `node_memo` varchar(255) DEFAULT NULL COMMENT '节点备注',
  `node_a` varchar(255) DEFAULT NULL,
  `node_b` varchar(255) DEFAULT NULL,
  `node_c` varchar(255) DEFAULT NULL,
  `node_d` varchar(255) DEFAULT NULL,
  `node_e` varchar(255) DEFAULT NULL,
  `node_f` varchar(255) DEFAULT NULL,
  `node_g` varchar(255) DEFAULT NULL,
  `node_h` varchar(255) DEFAULT NULL,
  `node_i` varchar(255) DEFAULT NULL,
  `node_j` varchar(255) DEFAULT NULL,
  `node_k` varchar(255) DEFAULT NULL,
  `node_l` varchar(255) DEFAULT NULL,
  `node_m` varchar(255) DEFAULT NULL,
  `node_n` varchar(255) DEFAULT NULL,
  `node_o` varchar(255) DEFAULT NULL,
  `node_p` varchar(255) DEFAULT NULL,
  `node_q` varchar(255) DEFAULT NULL,
  `workflow_id` varchar(255) DEFAULT NULL,
  `node_uid` varchar(255) DEFAULT NULL COMMENT '用户id信息',
  `node_createtime` varchar(255) DEFAULT NULL COMMENT '节点创建时间',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `node` */

insert  into `node`(`node_id`,`node_name`,`node_memo`,`node_a`,`node_b`,`node_c`,`node_d`,`node_e`,`node_f`,`node_g`,`node_h`,`node_i`,`node_j`,`node_k`,`node_l`,`node_m`,`node_n`,`node_o`,`node_p`,`node_q`,`workflow_id`,`node_uid`,`node_createtime`) values 
(1,'aaaaa','aaaaaaaaaaa','aaaa','a','a1','a2','a3','','','','','','','','','','','','',NULL,NULL,NULL),
(3,'测试节点信息','','10','20','30','40','50','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL);

/*Table structure for table `node_approve` */

DROP TABLE IF EXISTS `node_approve`;

CREATE TABLE `node_approve` (
  `node_approve_id` int(11) NOT NULL COMMENT '审批节点信息id',
  `node_approve_wid` varchar(255) DEFAULT NULL,
  `node_approve_start` varchar(255) DEFAULT NULL,
  `node_approve_one` varchar(255) DEFAULT NULL,
  `node_approve_two` varchar(255) DEFAULT NULL,
  `node_approve_three` varchar(255) DEFAULT NULL,
  `node_approve_four` varchar(255) DEFAULT NULL,
  `node_approve_five` varchar(255) DEFAULT NULL,
  `node_approve_end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`node_approve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `node_approve` */

insert  into `node_approve`(`node_approve_id`,`node_approve_wid`,`node_approve_start`,`node_approve_one`,`node_approve_two`,`node_approve_three`,`node_approve_four`,`node_approve_five`,`node_approve_end`) values 
(1,'5','10','20','','30','60','80','-1');

/*Table structure for table `node_new` */

DROP TABLE IF EXISTS `node_new`;

CREATE TABLE `node_new` (
  `node_id` int(11) NOT NULL COMMENT '节点信息id',
  `node_workflowid` varchar(255) DEFAULT NULL COMMENT '流程id，记录对应流程的节点信息',
  `node_workflowname` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `node_approvalone` varchar(255) DEFAULT NULL COMMENT '创建者',
  `node_approvaltwo` varchar(255) DEFAULT NULL COMMENT '第一审批信息',
  `node_approvalthree` varchar(255) DEFAULT NULL COMMENT '第二审批信息',
  `node_approvalfour` varchar(255) DEFAULT NULL COMMENT '第三审批信息',
  `node_approvalfive` varchar(255) DEFAULT NULL COMMENT '第四审批信息',
  `node_approvalsix` varchar(255) DEFAULT NULL COMMENT '归档',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `node_new` */

insert  into `node_new`(`node_id`,`node_workflowid`,`node_workflowname`,`node_approvalone`,`node_approvaltwo`,`node_approvalthree`,`node_approvalfour`,`node_approvalfive`,`node_approvalsix`) values 
(1,'1','测试','文员','','','','','部门文员'),
(2,'5','请假流程','所有人','直接上级','人力资源中心经理','集团经理','董事长','创建者'),
(3,'6','物品申请','所有人','部门领导','人力资源中心总裁','','','创建者');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(10) NOT NULL,
  `permission_name` varchar(255) DEFAULT NULL,
  `permission_roleid` varchar(255) DEFAULT NULL,
  `permission_type` varchar(255) DEFAULT NULL,
  `permission_headid` varchar(255) DEFAULT NULL,
  `permission_headname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `permission` */

insert  into `permission`(`permission_id`,`permission_name`,`permission_roleid`,`permission_type`,`permission_headid`,`permission_headname`) values 
(0,NULL,NULL,NULL,NULL,NULL),
(1,'1','1','2','1',NULL),
(2,'2','1','2','2',NULL),
(3,'3','1','3','3',NULL),
(4,NULL,'1',NULL,'4',NULL),
(5,NULL,'1',NULL,'5',NULL),
(6,NULL,'1',NULL,'6',NULL),
(7,NULL,'1',NULL,'7',NULL),
(8,NULL,'1',NULL,'8',NULL),
(9,NULL,'1',NULL,'9',NULL),
(10,NULL,'1',NULL,'10',NULL),
(11,NULL,'1',NULL,'11',NULL),
(12,NULL,'2',NULL,'9',NULL),
(13,NULL,'2',NULL,'10',NULL),
(14,NULL,'2',NULL,'11',NULL),
(15,NULL,'2',NULL,'8',NULL),
(16,NULL,NULL,NULL,NULL,NULL),
(17,NULL,'1',NULL,'12',NULL),
(18,NULL,'1',NULL,'13',NULL),
(19,NULL,'1',NULL,'14',NULL);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `pId` varchar(20) DEFAULT NULL COMMENT '身份证',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `birthdate` datetime DEFAULT NULL COMMENT '出生日期',
  `img` varchar(120) DEFAULT 'D:\\\\eclipse\\\\workspace\\\\Text92\\\\WebContent\\\\imgfile\\\\1.jpg' COMMENT '学生个人照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1600502251 DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`pId`,`name`,`sex`,`birthdate`,`img`) values 
(112,'113','的撒3','阿','1999-09-09 00:00:00','D:\\\\eclipse\\\\workspace\\\\Text92\\\\WebContent\\\\imgfile\\\\1.jpg'),
(113,'114','的撒4','阿','1999-09-09 00:00:00',NULL),
(1600502241,'113','的撒35','阿','1999-09-09 00:00:00','D:\\\\eclipse\\\\workspace\\\\Text92\\\\WebContent\\\\imgfile\\\\1.jpg'),
(1600502242,'114','的撒4','阿','1999-09-09 00:00:00','D:\\\\eclipse\\\\workspace\\\\Text92\\\\WebContent\\\\imgfile\\\\1.jpg'),
(1600502248,'4414**************','男','男','1998-04-27 00:00:00',NULL),
(1600502250,'123','的撒','阿','1999-09-09 00:00:00',NULL);

/*Table structure for table `port_dept` */

DROP TABLE IF EXISTS `port_dept`;

CREATE TABLE `port_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `dept_lead` varchar(255) DEFAULT NULL COMMENT '部门负责人',
  `dept_consignorId` varchar(255) DEFAULT NULL COMMENT '经营单位',
  `dept_memo` varchar(255) DEFAULT NULL COMMENT '部门备注',
  `dept_superiorId` bigint(20) DEFAULT NULL COMMENT '上级部门',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `port_dept` */

/*Table structure for table `port_deptemp` */

DROP TABLE IF EXISTS `port_deptemp`;

CREATE TABLE `port_deptemp` (
  `DeptEmp_id` bigint(20) NOT NULL COMMENT '部门人员表id',
  `DeptEmp_did` varchar(255) DEFAULT NULL COMMENT '部门id主键',
  `DeptEmp_uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `DeptEmp_duty` varchar(255) DEFAULT NULL COMMENT '职位，默认为0',
  `DeptEmp_DutyLevel` bigint(20) DEFAULT NULL COMMENT '职位级别，默认0',
  `DeptEmp_lead` varchar(255) DEFAULT NULL COMMENT '部门领导，对应的人员',
  `DeptEmp_leadid` bigint(20) DEFAULT NULL COMMENT '部门领导id',
  PRIMARY KEY (`DeptEmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `port_deptemp` */

/*Table structure for table `port_stationtype` */

DROP TABLE IF EXISTS `port_stationtype`;

CREATE TABLE `port_stationtype` (
  `station_id` bigint(20) NOT NULL COMMENT '岗位id，唯一标识',
  `station_name` varchar(255) DEFAULT NULL COMMENT '岗位名称',
  `station_memo` varchar(255) DEFAULT NULL COMMENT '岗位备注',
  `station_superiorId` bigint(255) DEFAULT NULL COMMENT '岗位上级',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `port_stationtype` */

/*Table structure for table `port_stationtypeemp` */

DROP TABLE IF EXISTS `port_stationtypeemp`;

CREATE TABLE `port_stationtypeemp` (
  `StationTypeEmp_id` bigint(20) NOT NULL COMMENT '岗位人员表id',
  `StationTypeEmp_uid` bigint(20) DEFAULT NULL COMMENT '岗位用户id',
  `StationTypeEmp_deptId` bigint(20) DEFAULT NULL COMMENT '岗位所属部门',
  `StationTypeEmp_StationTypeId` bigint(20) DEFAULT NULL COMMENT '所属岗位',
  PRIMARY KEY (`StationTypeEmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `port_stationtypeemp` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_memo` varchar(255) DEFAULT NULL COMMENT '角色备注',
  `role_up` varchar(255) DEFAULT NULL COMMENT '上级角色',
  `role_dpm` varchar(255) DEFAULT NULL COMMENT '角色部门',
  `role_a` varchar(255) DEFAULT NULL,
  `role_b` varchar(255) DEFAULT NULL,
  `role_c` varchar(255) DEFAULT NULL,
  `role_status` varchar(10) DEFAULT NULL COMMENT '角色状态，1为正式，0为删除',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_memo`,`role_up`,`role_dpm`,`role_a`,`role_b`,`role_c`,`role_status`) values 
(1,'信息专员','','','信息部','','','','1'),
(2,'信息经理','','','信息部','','','','1'),
(3,'采购员','','','采购部','','','','0'),
(4,'123','123','','123','','','','0'),
(5,'123','123','','123','','','','1');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(32) NOT NULL COMMENT '用户id',
  `user_code` varchar(32) DEFAULT NULL COMMENT '用户账号',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` char(1) NOT NULL COMMENT '1:正常,0:暂停',
  `user_a` varchar(255) DEFAULT NULL,
  `user_b` varchar(255) DEFAULT NULL,
  `user_c` varchar(255) DEFAULT NULL,
  `user_roleid` varchar(255) DEFAULT NULL COMMENT '用户对应的角色id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_code`,`user_name`,`user_password`,`user_state`,`user_a`,`user_b`,`user_c`,`user_roleid`) values 
(5,'m0003','112','123','1',NULL,NULL,NULL,'0'),
(6,'m0001','111','123','1',NULL,NULL,NULL,'0'),
(7,'m0001','113','123','1',NULL,NULL,NULL,'0'),
(8,'m0001','114','123','1',NULL,NULL,NULL,'2'),
(9,'m0002','123','123','1',NULL,NULL,NULL,''),
(10,NULL,'116','1','1',NULL,NULL,NULL,'0');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` varchar(11) NOT NULL DEFAULT '' COMMENT '工号',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `age` varchar(4) DEFAULT NULL COMMENT '年龄',
  `title` varchar(20) DEFAULT NULL COMMENT '职称',
  `department` varchar(20) DEFAULT NULL COMMENT '所在系',
  `course` varchar(20) DEFAULT NULL COMMENT '教授课程',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(20) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`age`,`title`,`department`,`course`,`phone`,`address`) values 
('1600502202','小二','2','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502203','小三','3','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502204','小四','4','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502205','小五','5','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502206','小六','6','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502207','小七','7','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502208','小八','8','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502209','小九','9','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502210','小十','10','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502212','小十二','12','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502221','小一','1','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502223','小三','3','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502224','小四','4','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502225','小五','5','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502226','小六','6','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502227','小七','7','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502228','小八','8','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502229','小九','9','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502230','小十','10','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502231','小十一','11','讲师','信工','JAVA','15911111111','广东广州大学城'),
('1600502232','小十二','12','讲师','信工','计算机','15911111111','广东广州大学城'),
('1600502271','小一','1','讲师','信工','JAVA','15922222222','广东广州大学城'),
('1600502272','小二','2','讲师','信工','计算机','15922222222','广东广州大学城'),
('1600502273','小三','3','讲师','信工','JAVA','15922222222','广东广州大学城'),
('1600502274','小四','4','讲师','信工','计算机','15922222222','广东广州大学城'),
('1600502275','小五','5','讲师','信工','JAVA','15922222222','广东广州大学城'),
('1600502276','小六','6','讲师','信工','计算机','15922222222','广东广州大学城'),
('1600502277','小七','7','讲师','信工','JAVA','15922222222','广东广州大学城'),
('1600502278','小八','8','讲师','信工','计算机','15922222222','广东广州大学城'),
('1600502279','小九','9','讲师','信工','JAVA','15922222222','广东广州大学城'),
('1600502280','小十','10','讲师','信工','计算机','15933333333','广东广州大学城'),
('1600502281','小十一','11','讲师','信工','JAVA','15933333333','广东广州大学城'),
('1600502282','小十二','12','讲师','信工','计算机','15933333333','广东广州大学城'),
('666666','小6','10','讲师','信工','计算机','15933333333','广东广州大学城');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(11) NOT NULL DEFAULT '0',
  `password` varchar(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text9用户';

/*Data for the table `user` */

insert  into `user`(`username`,`password`) values 
('Admin','123456'),
('admin2','admin');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_role_id` int(10) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_role` */

insert  into `user_role`(`user_role_id`,`user_id`,`role_id`) values 
(1,'1',NULL),
(2,'2',NULL),
(3,'3',NULL),
(4,'4',NULL),
(5,'5',NULL),
(6,'6',NULL),
(7,'7',NULL),
(8,'8',NULL),
(9,'9',NULL),
(10,'10',NULL);

/*Table structure for table `workflow` */

DROP TABLE IF EXISTS `workflow`;

CREATE TABLE `workflow` (
  `workflow_id` int(11) NOT NULL COMMENT '流程id',
  `workflow_name` varchar(255) DEFAULT NULL COMMENT '流程名字',
  `workflow_memo` varchar(255) DEFAULT NULL COMMENT '流程备注',
  `workflow_a` varchar(255) DEFAULT NULL,
  `workflow_b` varchar(255) DEFAULT NULL,
  `workflow_c` varchar(255) DEFAULT NULL,
  `workflow_d` varchar(255) DEFAULT NULL,
  `workflow_e` varchar(255) DEFAULT NULL,
  `workflow_f` varchar(255) DEFAULT NULL,
  `workflow_g` varchar(255) DEFAULT NULL,
  `workflow_h` varchar(255) DEFAULT NULL,
  `workflow_i` varchar(255) DEFAULT NULL,
  `workflow_j` varchar(255) DEFAULT NULL,
  `workflow_k` varchar(255) DEFAULT NULL,
  `workflow_l` varchar(255) DEFAULT NULL,
  `workflow_m` varchar(255) DEFAULT NULL,
  `workflow_n` varchar(255) DEFAULT NULL,
  `workflow_o` varchar(255) DEFAULT NULL,
  `workflow_p` varchar(255) DEFAULT NULL,
  `workflow_q` varchar(255) DEFAULT NULL,
  `workflow_r` varchar(255) DEFAULT NULL COMMENT '设置流程是否有效0为测试，1为有效，2为作废',
  `workflow_s` varchar(255) DEFAULT NULL,
  `workflow_t` varchar(255) DEFAULT NULL,
  `workflow_u` varchar(255) DEFAULT NULL,
  `workflow_v` varchar(255) DEFAULT NULL,
  `workflow_w` varchar(255) DEFAULT NULL,
  `workflow_x` varchar(255) DEFAULT NULL,
  `workflow_y` varchar(255) DEFAULT NULL,
  `workflow_z` varchar(255) DEFAULT NULL,
  `workflow_uid` varchar(255) DEFAULT NULL COMMENT '用户id信息',
  `workflow_node_id` varchar(255) DEFAULT NULL COMMENT '对应审批流id',
  `workflow_createtime` timestamp NULL DEFAULT NULL COMMENT '流程创建时间',
  PRIMARY KEY (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `workflow` */

insert  into `workflow`(`workflow_id`,`workflow_name`,`workflow_memo`,`workflow_a`,`workflow_b`,`workflow_c`,`workflow_d`,`workflow_e`,`workflow_f`,`workflow_g`,`workflow_h`,`workflow_i`,`workflow_j`,`workflow_k`,`workflow_l`,`workflow_m`,`workflow_n`,`workflow_o`,`workflow_p`,`workflow_q`,`workflow_r`,`workflow_s`,`workflow_t`,`workflow_u`,`workflow_v`,`workflow_w`,`workflow_x`,`workflow_y`,`workflow_z`,`workflow_uid`,`workflow_node_id`,`workflow_createtime`) values 
(1,'测试','备注1','申请人','申请时间','申请原因','资产','批准人','','','','','','','','','','','','','0','流程状态','','','','','','','',NULL,'',NULL),
(2,'2','2','33','aaa','','','','','','','','','','','','','','','','2','流程状态','','','','','','','',NULL,'',NULL),
(3,'name','memo','a','b','c','d','e','f','','','','','','','','','','','','2','流程状态','','','','','','','','9','',NULL),
(4,'3','','3','','','','','','','','','','','','','','','','','2','流程状态','','','','','','','',NULL,'',NULL),
(5,'请假流程','用于员工请假','请假人','请假原因','请假开始时间','请假结束时间','','','','','','','','','','','','','','1','流程状态','','','','','','','','9','',NULL),
(6,'物品申请','it物品申请','物品名称','申请人','用途','申请时间','','','','','','','','','','','','','','1','流程状态','','','','','','','',NULL,'',NULL),
(7,'11','11','11','11','11','11','11','11','','','','','','','','','','','','2','流程状态','','','','','','','','9','',NULL),
(8,'外出考勤申请','用于员工外出考勤申请','申请人','申请部门','申请时间','外出时间','外出原因','回来时间','总计时长','','','','','','','','','','','1','流程状态','','','','','','','',NULL,'',NULL);

/*Table structure for table `workflow_approve` */

DROP TABLE IF EXISTS `workflow_approve`;

CREATE TABLE `workflow_approve` (
  `workflow_approve_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_approve_wdid` varchar(255) DEFAULT NULL COMMENT '流程数据id',
  `workflow_approve_uid` varchar(255) DEFAULT NULL COMMENT '流程创建用户id',
  `workflow_approve_nodeid` varchar(255) DEFAULT NULL COMMENT '当前流转到节点',
  `workflow_approve_opera_uid` varchar(255) DEFAULT NULL COMMENT '当前节点操作用户',
  `workflow_approve_opera` varchar(255) DEFAULT NULL COMMENT '当前操作,1待审批 2 已审批 3 退回',
  `workflow_approve_a` varchar(255) DEFAULT NULL,
  `workflow_approve_b` varchar(255) DEFAULT NULL,
  `workflow_approve_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workflow_approve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `workflow_approve` */

insert  into `workflow_approve`(`workflow_approve_id`,`workflow_approve_wdid`,`workflow_approve_uid`,`workflow_approve_nodeid`,`workflow_approve_opera_uid`,`workflow_approve_opera`,`workflow_approve_a`,`workflow_approve_b`,`workflow_approve_c`) values 
(6,'19','9','20','9','1',NULL,NULL,NULL),
(7,'20','9','30','9','1',NULL,NULL,NULL),
(8,'21','9','20','9','1',NULL,NULL,NULL);

/*Table structure for table `workflow_data` */

DROP TABLE IF EXISTS `workflow_data`;

CREATE TABLE `workflow_data` (
  `workflow_data_id` int(11) NOT NULL COMMENT '流程数据id',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_name` varchar(255) DEFAULT NULL COMMENT '流程表外键id',
  `workflow_data_a` varchar(255) DEFAULT NULL,
  `workflow_data_b` varchar(255) DEFAULT NULL,
  `workflow_data_c` varchar(255) DEFAULT NULL,
  `workflow_data_d` varchar(255) DEFAULT NULL,
  `workflow_data_e` varchar(255) DEFAULT NULL,
  `workflow_data_f` varchar(255) DEFAULT NULL,
  `workflow_data_g` varchar(255) DEFAULT NULL,
  `workflow_data_h` varchar(255) DEFAULT NULL,
  `workflow_data_i` varchar(255) DEFAULT NULL,
  `workflow_data_j` varchar(255) DEFAULT NULL,
  `workflow_data_k` varchar(255) DEFAULT NULL,
  `workflow_data_l` varchar(255) DEFAULT NULL,
  `workflow_data_m` varchar(255) DEFAULT NULL,
  `workflow_data_n` varchar(255) DEFAULT NULL,
  `workflow_data_o` varchar(255) DEFAULT NULL,
  `workflow_data_p` varchar(255) DEFAULT NULL,
  `workflow_data_q` varchar(255) DEFAULT NULL,
  `workflow_data_r` varchar(255) DEFAULT NULL,
  `workflow_data_s` varchar(255) DEFAULT NULL COMMENT '设置流程是否完成，1为未完成，2为已完成',
  `workflow_data_t` varchar(255) DEFAULT NULL,
  `workflow_data_u` varchar(255) DEFAULT NULL,
  `workflow_data_v` varchar(255) DEFAULT NULL,
  `workflow_data_w` varchar(255) DEFAULT NULL,
  `workflow_data_x` varchar(255) DEFAULT NULL,
  `workflow_data_y` varchar(255) DEFAULT NULL,
  `workflow_data_z` varchar(255) DEFAULT NULL,
  `workflow_data_uid` varchar(255) DEFAULT NULL COMMENT '用户id信息',
  `workflow_data_node_id` varchar(255) DEFAULT NULL COMMENT '对应审批流id',
  `workflow_data_createtime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`workflow_data_id`),
  KEY `workflow_id` (`workflow_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `workflow_data` */

insert  into `workflow_data`(`workflow_data_id`,`workflow_id`,`workflow_name`,`workflow_data_a`,`workflow_data_b`,`workflow_data_c`,`workflow_data_d`,`workflow_data_e`,`workflow_data_f`,`workflow_data_g`,`workflow_data_h`,`workflow_data_i`,`workflow_data_j`,`workflow_data_k`,`workflow_data_l`,`workflow_data_m`,`workflow_data_n`,`workflow_data_o`,`workflow_data_p`,`workflow_data_q`,`workflow_data_r`,`workflow_data_s`,`workflow_data_t`,`workflow_data_u`,`workflow_data_v`,`workflow_data_w`,`workflow_data_x`,`workflow_data_y`,`workflow_data_z`,`workflow_data_uid`,`workflow_data_node_id`,`workflow_data_createtime`) values 
(10,6,'物品申请','电脑','小张','工作需要','2019-10-06','','','','','','','','','','','','','','','2','','','','','','','','9','','2019-10-26 23:02:20'),
(11,6,'物品申请','路由器','小红','公用','2019-06-15','','','','','','','','','','','','','','','1','','','','','','','','9','','2019-10-26 23:02:20'),
(12,1,'测试','小红','2019-06-06','工作','1','小梁','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2019-10-26 23:02:20'),
(13,1,'测试','aaa','aaaaaa','a','aaaaaaaaa','aaaaaaa','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2019-10-26 23:02:20'),
(14,1,'测试','aaa','sdfdsfsdf','faff','sfddsfs','fsdfsdf','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2019-10-26 23:02:20'),
(16,6,'物品申请','aaaaa','aaaaaa','aaaaaaaa','aaaaaaaa','','','','','','','','','','','','','',NULL,'2','','','','','','','','9','','2019-27-15'),
(17,6,'物品申请','','','','','','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2020-15-24 17:15:3'),
(18,6,'物品申请','123','123123123','12312312','123123131231213','','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2020-23-24 17:23:36'),
(19,6,'物品申请','1','2','3','44','','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2020-26-24 17:26:10'),
(20,8,'外出考勤申请','12','','123','123','','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2020-26-24 17:26:52'),
(21,6,'物品申请','123','111','1','124','','','','','','','','','','','','','',NULL,'1','','','','','','','','9','','2020-42-29 14:42:1');

/*Table structure for table `xinxidengjibiao` */

DROP TABLE IF EXISTS `xinxidengjibiao`;

CREATE TABLE `xinxidengjibiao` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yingpingzhiwei` varchar(255) DEFAULT NULL COMMENT '应聘职位',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `chushengnianyue` varchar(255) DEFAULT NULL COMMENT '出生年月',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `minzu` varchar(255) DEFAULT NULL COMMENT '民族',
  `shengao` varchar(255) DEFAULT NULL COMMENT '身高',
  `tizhong` varchar(255) DEFAULT NULL COMMENT '体重',
  `city10` text COMMENT '城市',
  `province10` varchar(255) DEFAULT NULL COMMENT '籍贯省份',
  `zhengzhimianmao` varchar(255) DEFAULT NULL COMMENT '政治面貌',
  `hunyinzhuangkuang` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `shoujihaoma` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `rudangshijian` varchar(255) DEFAULT NULL COMMENT '入党/团时间',
  `weixinhao` varchar(255) DEFAULT NULL COMMENT '微信号',
  `emall` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `hukouxingzhi` varchar(255) DEFAULT NULL COMMENT '户口性质',
  `wenhuachengdu` varchar(255) DEFAULT NULL COMMENT '文化程度',
  `hujidizhi` varchar(255) DEFAULT NULL COMMENT '户籍地址',
  `xianzhuzhi` varchar(255) DEFAULT NULL COMMENT '现住址',
  `jjlxr_yubenrenguanxi` varchar(255) DEFAULT NULL COMMENT '与本人关系',
  `jjlxr_xingming` varchar(255) DEFAULT NULL COMMENT '姓    名',
  `jjlxr_dianhua` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `jsjsp_bangongruanjian1` varchar(255) DEFAULT NULL COMMENT '办公软件',
  `jsjsp_bangongruanjian2` varchar(255) DEFAULT NULL,
  `jsjsp_bangongruanjian3` varchar(255) DEFAULT NULL,
  `jsjsp_bangongruanjian4` varchar(255) DEFAULT NULL,
  `jsjsp_huitugongju1` varchar(255) DEFAULT NULL COMMENT '制图软件',
  `jsjsp_huitugongju2` varchar(255) DEFAULT NULL,
  `jsjsp_huitugongju3` varchar(255) DEFAULT NULL,
  `jsjsp_qita` varchar(255) DEFAULT NULL COMMENT '其    他',
  `yuyannengli1` varchar(255) DEFAULT NULL COMMENT '语言能力',
  `yuyannengli2` varchar(255) DEFAULT NULL,
  `yuyannengli3` varchar(255) DEFAULT NULL,
  `jiazhao1` varchar(255) DEFAULT NULL COMMENT '有效驾照',
  `jiazhao2` varchar(255) DEFAULT NULL,
  `weifajilu1` varchar(255) DEFAULT NULL COMMENT '违法记录',
  `weifajilu2` varchar(255) DEFAULT NULL,
  `weifajilu3` varchar(255) DEFAULT NULL,
  `ahytc_yundonglei` varchar(255) DEFAULT NULL COMMENT '爱好与特长运动类',
  `ahytc_wenyilei` varchar(255) DEFAULT NULL COMMENT '爱好与特长文艺类',
  `ahytc_qita1` varchar(255) DEFAULT NULL COMMENT '爱好与特长其他',
  `ahytc_qita2` varchar(255) DEFAULT NULL,
  `zyzgzs_yiyaolei` varchar(255) DEFAULT NULL COMMENT '职业资格证书',
  `zyzgzs_caiwulei` varchar(255) DEFAULT NULL,
  `zyzgzs_yuyanlei` varchar(255) DEFAULT NULL,
  `zyzgzs_qita` varchar(255) DEFAULT NULL,
  `jybj_qizhishijian1` varchar(255) DEFAULT NULL COMMENT '教育背景起止时间',
  `jybj_qizhishijian2` varchar(255) DEFAULT NULL,
  `jybj_qizhishijian3` varchar(255) DEFAULT NULL,
  `jybj_zaiheyuanxiaoxuexi1` varchar(255) DEFAULT NULL COMMENT '教育背景进修',
  `jybj_zaiheyuanxiaoxuexi2` varchar(255) DEFAULT NULL,
  `jybj_zaiheyuanxiaoxuexi3` text,
  `jybj_zhuanye1` text COMMENT '教育背景专业',
  `jybj_zhuanye2` text,
  `jybj_zhuanye3` text,
  `jybj_jiudufangshi1` text COMMENT '教育背景就读方式',
  `jybj_jiudufangshi2` text,
  `jybj_jiudufangshi3` text,
  `jybj_xuelizhengshu1` text COMMENT '教育背景学历',
  `jybj_xuelizhengshu2` text,
  `jybj_xuelizhengshu3` text,
  `rzjl_qizhishijian1` text COMMENT '任职经历起止时间',
  `rzjl_qizhishijian2` text,
  `rzjl_qizhishijian3` text,
  `rzjl_gongzuodanwei1` text COMMENT '任职经历工作单位',
  `rzjl_gongzuodanwei2` text,
  `rzjl_gongzuodanwei3` text,
  `rzjl_zhiwu1` text COMMENT '任职经历职务',
  `rzjl_zhiwu2` text,
  `rzjl_zhiwu3` text,
  `rzjl_lizhiyuanyin1` text COMMENT '任职经历离职原因',
  `rzjl_lizhiyuanyin2` text,
  `rzjl_lizhiyuanyin3` text,
  `rzjl_zmr_lxfs1` text COMMENT '任职经历证明人及联系方式',
  `rzjl_zmr_lxfs2` text,
  `rzjl_zmr_lxfs3` text,
  `jtcy_xingming1` text COMMENT '家庭成员信息姓名',
  `jtcy_xingming2` text,
  `jtcy_xingming3` text,
  `jtcy_yubenrenguanxi1` text COMMENT '家庭成员信息与本人关系',
  `jtcy_yubenrenguanxi2` text,
  `jtcy_yubenrenguanxi3` text,
  `jtcy_chushengnianyue1` text COMMENT '家庭成员信息出生年月',
  `jtcy_chushengnianyue2` text,
  `jtcy_chushengnianyue3` text,
  `jtcy_congshizhiye1` text COMMENT '家庭成员信息从事职业',
  `jtcy_congshizhiye2` text,
  `jtcy_congshizhiye3` text,
  `jtcy_juzhudi1` text COMMENT '家庭成员信息居住地',
  `jtcy_juzhudi2` text,
  `jtcy_juzhudi3` text,
  `grjksm_shili` text COMMENT '个人健康说明视力',
  `grjksm_tingli` varchar(255) DEFAULT NULL COMMENT '个人健康说明听力',
  `grjksm_xuexing` varchar(255) DEFAULT NULL COMMENT '个人健康说明血型',
  `grjksm_jibing_sm` text COMMENT '个人健康疾病说明',
  `grjksm_jibing` varchar(255) DEFAULT NULL COMMENT '个人健康说明疾病',
  `qita_jituanqinshu` varchar(255) DEFAULT NULL COMMENT '其他',
  `qita_jituanqinshu1` varchar(255) DEFAULT NULL,
  `qita_jituanqinshu2` varchar(255) DEFAULT NULL,
  `qita_jituanqinshu3` varchar(255) DEFAULT NULL,
  `qita_yubenrenguanxi1` varchar(255) DEFAULT NULL,
  `qita_yubenrenguanxi2` varchar(255) DEFAULT NULL,
  `qita_yubenrenguanxi3` varchar(255) DEFAULT NULL,
  `qita_zigongsirenzhi` varchar(255) DEFAULT NULL,
  `qita_zgsrz_mingcheng` varchar(255) DEFAULT NULL,
  `qianming` varchar(255) DEFAULT NULL COMMENT '签名',
  `riqi` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xinxidengjibiao` */

insert  into `xinxidengjibiao`(`id`,`yingpingzhiwei`,`name`,`chushengnianyue`,`sex`,`minzu`,`shengao`,`tizhong`,`city10`,`province10`,`zhengzhimianmao`,`hunyinzhuangkuang`,`shoujihaoma`,`rudangshijian`,`weixinhao`,`emall`,`hukouxingzhi`,`wenhuachengdu`,`hujidizhi`,`xianzhuzhi`,`jjlxr_yubenrenguanxi`,`jjlxr_xingming`,`jjlxr_dianhua`,`jsjsp_bangongruanjian1`,`jsjsp_bangongruanjian2`,`jsjsp_bangongruanjian3`,`jsjsp_bangongruanjian4`,`jsjsp_huitugongju1`,`jsjsp_huitugongju2`,`jsjsp_huitugongju3`,`jsjsp_qita`,`yuyannengli1`,`yuyannengli2`,`yuyannengli3`,`jiazhao1`,`jiazhao2`,`weifajilu1`,`weifajilu2`,`weifajilu3`,`ahytc_yundonglei`,`ahytc_wenyilei`,`ahytc_qita1`,`ahytc_qita2`,`zyzgzs_yiyaolei`,`zyzgzs_caiwulei`,`zyzgzs_yuyanlei`,`zyzgzs_qita`,`jybj_qizhishijian1`,`jybj_qizhishijian2`,`jybj_qizhishijian3`,`jybj_zaiheyuanxiaoxuexi1`,`jybj_zaiheyuanxiaoxuexi2`,`jybj_zaiheyuanxiaoxuexi3`,`jybj_zhuanye1`,`jybj_zhuanye2`,`jybj_zhuanye3`,`jybj_jiudufangshi1`,`jybj_jiudufangshi2`,`jybj_jiudufangshi3`,`jybj_xuelizhengshu1`,`jybj_xuelizhengshu2`,`jybj_xuelizhengshu3`,`rzjl_qizhishijian1`,`rzjl_qizhishijian2`,`rzjl_qizhishijian3`,`rzjl_gongzuodanwei1`,`rzjl_gongzuodanwei2`,`rzjl_gongzuodanwei3`,`rzjl_zhiwu1`,`rzjl_zhiwu2`,`rzjl_zhiwu3`,`rzjl_lizhiyuanyin1`,`rzjl_lizhiyuanyin2`,`rzjl_lizhiyuanyin3`,`rzjl_zmr_lxfs1`,`rzjl_zmr_lxfs2`,`rzjl_zmr_lxfs3`,`jtcy_xingming1`,`jtcy_xingming2`,`jtcy_xingming3`,`jtcy_yubenrenguanxi1`,`jtcy_yubenrenguanxi2`,`jtcy_yubenrenguanxi3`,`jtcy_chushengnianyue1`,`jtcy_chushengnianyue2`,`jtcy_chushengnianyue3`,`jtcy_congshizhiye1`,`jtcy_congshizhiye2`,`jtcy_congshizhiye3`,`jtcy_juzhudi1`,`jtcy_juzhudi2`,`jtcy_juzhudi3`,`grjksm_shili`,`grjksm_tingli`,`grjksm_xuexing`,`grjksm_jibing_sm`,`grjksm_jibing`,`qita_jituanqinshu`,`qita_jituanqinshu1`,`qita_jituanqinshu2`,`qita_jituanqinshu3`,`qita_yubenrenguanxi1`,`qita_yubenrenguanxi2`,`qita_yubenrenguanxi3`,`qita_zigongsirenzhi`,`qita_zgsrz_mingcheng`,`qianming`,`riqi`) values 
(5,'文员','肖慧平','2000-02-03','女','汉','170','50',NULL,'河北省','团员','已婚','13187417497','2005-02-03','1093595726','1093595726@qq.com','（广州）本地城镇','硕士研究生及以上','广西贺州','广州','同学','小红','13178888172','Word','Excel','PPT','app','CAD','Photoshop',NULL,'无','普通话','粤话','英语','c1',NULL,NULL,NULL,'','爱好与特长1','爱好与特长2','爱好与特长3',NULL,'职业资格证书1','职业资格证书2','职业资格证书3','职业资格证书4','教育背景1','教育背景11','教育背景111','教育背景2','教育背景22','教育背景222','教育背景3','教育背景33','教育背景333','教育背景4','教育背景44','教育背景444','教育背景5','教育背景55','教育背景555','任职经历1','任职经历11','任职经历111','任职经历2','任职经历22','任职经历222','任职经历3','任职经历33','任职经历333','任职经历4','任职经历44','任职经历444','任职经历5','任职经历55','任职经历555','家庭成员1','家庭成员11','家庭成员111','家庭成员2','家庭成员22','家庭成员222','家庭成员3','家庭成员33','家庭成员333','家庭成员4','家庭成员44','家庭成员444','家庭成员5','家庭成员55','家庭成员555','良好','辅助','O','',NULL,NULL,'亲属员工1姓名','亲属员工1姓名','亲属员工1姓名','1','2','3',NULL,'嘻嘻嘻',NULL,'2020-06-03 00:16:49'),
(6,'文员','肖慧平','2000-02-03','女','汉','170','50','石家庄市','河北省','团员','未婚','13187417497','2005-02-03','1093595726','1093595726@qq.com','外地农村','硕士研究生及以上','广西贺州','广州','同学','小红','13178888172','Word','Excel','PPT','app','CAD','Photoshop','PPT','asa','普通话','粤话','英语','c1','无','无',NULL,'','爱好与特长1','爱好与特长2','爱好与特长3',NULL,'职业资格证书1','职业资格证书2','职业资格证书3','职业资格证书4','教育背景1','教育背景11','教育背景111','教育背景2','教育背景22','教育背景222','教育背景3','教育背景33','教育背景333','教育背景4','教育背景44','教育背景444','教育背景5','教育背景55','教育背景555','任职经历1','任职经历11','任职经历111','任职经历2','任职经历22','任职经历222','任职经历3','任职经历33','任职经历333','任职经历4','任职经历44','任职经历444','任职经历5','任职经历55','任职经历555','家庭成员1','家庭成员11','家庭成员111','家庭成员2','家庭成员22','家庭成员222','家庭成员3','家庭成员33','家庭成员333','家庭成员4','家庭成员44','家庭成员444','家庭成员5','家庭成员55','家庭成员555','良好','良好','O',NULL,'无','无','亲属员工1姓名','亲属员工1姓名','亲属员工1姓名','1','2','3','无','哈哈哈',NULL,'2020-05-21 14:26:04'),
(41,'qe','以大111','2020-5-21','女','满族','165','152',NULL,'广西贺州','团员','未婚','13187417497','','','','（广州）本地城镇','硕士研究生及以上','广西贺州市八步区','广州','11111323','无11','啊啊',NULL,NULL,NULL,'','CAD','Photoshop',NULL,'',NULL,NULL,'','c1',NULL,'无',NULL,'无','','','',NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','良好','辅助','','',NULL,NULL,'','','3','','','33',NULL,',',NULL,'2020-06-03 00:13:37'),
(47,'文员','肖慧平','2020-5-21','男','汉','170','50',NULL,'广西贺州','团员','已婚','13187417497','2020-5-21','1093595726','1093595726@qq.com','（广州）本地农村','高中及以下','广西贺州','广州','同学','小东','13178888172','Word','Excel','PPT','办公软件1','CAD','Photoshop','qitaqita','制图软件2','普通话','粤话','语言能力','c1','无','无','','违法记录123','爱好与特长1','爱好与特长2','爱好与特长3',NULL,'职业资格证书1','职业资格证书2','职业资格证书3','职业资格证书4','教育背景1','教育背景11','教育背景111','教育背景2','教育背景22','教育背景222','教育背景3','教育背景33','教育背景333','教育背景4','教育背景44','教育背景444','教育背景5','教育背景55','教育背景555','任职经历1','任职经历11','任职经历111','任职经历2','任职经历22','任职经历222','任职经历3','任职经历33','任职经历333','任职经历4','任职经历44','任职经历444','任职经历5','任职经历55','任职经历555','家庭成员1','家庭成员11','家庭成员111','家庭成员2','家庭成员22','家庭成员222','家庭成员3','家庭成员33','家庭成员333','家庭成员4','家庭成员44','家庭成员444','家庭成员5','家庭成员55','家庭成员555','辅助','良好','B型','心思病','无','无','亲属员工1姓名','亲属员工2姓名','亲属员工3姓名','1','2','3','无','汕头',NULL,'2020-05-21 15:52:16'),
(48,'文员','肖慧平','2020-5-22','男','汉','','',NULL,'广西贺州','团员','已婚','13187417497','','','','外地农村','高中及以下','广西贺州','广州','','','',NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,'','',NULL,NULL,NULL,'','','','',NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','良好','良好','','',NULL,NULL,'','','','','','',NULL,'',NULL,NULL),
(49,'文员','肖慧平','2020-5-22','男','汉','','',NULL,'广西贺州','团员','已婚','13187417497','','','','外地农村','高中及以下','广西贺州','广州','','','',NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,'','',NULL,NULL,NULL,'','','','',NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','良好','良好','','',NULL,NULL,'','','','','','',NULL,'',NULL,NULL),
(77,'招聘专员','何倩怡','2020-5-14','女','汉','1111','1111',NULL,'1111','11111','未婚','13249761174','2020-5-8','0000000000','000000000','外地农村','大学本科','0000000000','0000000000000','00000000000','000000000000','00000000','Word','Excel','PPT','','CAD','Photoshop',NULL,'','普通话','粤话','','C1',NULL,'无',NULL,'','','','',NULL,'','','','人力三级证','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','良好','良好','','','无','无','','','','','','','无','',NULL,NULL),
(78,'123','123','2020-5-22','男','132','','',NULL,'123','群众','已婚','123','','','','（广州）本地城镇','硕士研究生及以上','123','123','','','',NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,'','',NULL,NULL,NULL,'','','','',NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','良好','辅助','','',NULL,NULL,'','','','','','',NULL,'',NULL,NULL),
(79,'11111111111','流程公文','2222222222','女','满族222','444444444','sfaaaaaaaa',NULL,'aaaaaaaa','群众','已婚','aaaaaaaaaddd','2020-6-4','fffffffffffff','ggggggggggg','（广州）本地农村','大学本科','qqqqqqqqqqqqq','1111111111111','1qqq','2333333333','ggcccccccc','Word','Excel','PPT','xzzzzz','CAD','Photoshop',NULL,'zccccccccc','普通话','粤话','nnnnnnnnnnnn','c1',NULL,'无',NULL,'','nnnnnnnnnnn','bbbbbbbbbbv','vvvvvvvvsdaf',NULL,'asfddhhhhhhh','ktyu','tuy','ert','etr','dgjh','h;jg;','ertely','dhg','jfghj','hjk','she','fghjfjghj','ghj','eter','fghjf','gjd','rey','fghj24','fsgklkj','kjhgre','ngf','mnbvj','mnbgfd','.lkuyt','hge','nhgre','kjhytr','nbfd','nhgre','mnhgf','loiuyt','nhgr','nhbgf','jhytr','jhytr','jhgtrmhg','juytre','jhtrmjhg','bhgfd','jht','jhgtre','ytrergdhfg','jhytr','jhytrnhgfre','jhgtr','jhytr','jhgtrjhg','jhtreaes','辅助','良好','kjhy','jhytre','无',NULL,'gdae','gsdfas','hgdf','dgfsdd','dfgsa','dfgsfa','无','sgfdujyt5r',NULL,'2020-06-03 00:39:13'),
(80,'11111111111','流程公文区','2020-6-13','男','满族','','',NULL,'aaaaaaaa','群众','已婚','aaaaaaaaaddd','','','','（广州）本地城镇','硕士研究生及以上','qqqqqqqqqqqqq','1111111111111','','','','Word',NULL,NULL,'','CAD',NULL,NULL,'','普通话',NULL,'','','无','无',NULL,'','','','',NULL,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','辅助','良好','kjhy','',NULL,NULL,'','','','','','',NULL,'',NULL,'2020-06-03 00:48:50');

/*Table structure for table `yiyuan` */

DROP TABLE IF EXISTS `yiyuan`;

CREATE TABLE `yiyuan` (
  `y_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '医院id主键',
  `y_name` varchar(255) DEFAULT NULL COMMENT '医院名称',
  `y_a` varchar(255) DEFAULT NULL,
  `y_b` varchar(255) DEFAULT NULL,
  `y_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`y_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `yiyuan` */

insert  into `yiyuan`(`y_id`,`y_name`,`y_a`,`y_b`,`y_c`) values 
(1,'医院1',NULL,NULL,NULL),
(2,'医院2',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
