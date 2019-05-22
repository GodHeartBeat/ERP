/*
SQLyog Community Edition- MySQL GUI v6.54
MySQL - 5.5.25a : Database - erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE `erp`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `sf` varchar(50) DEFAULT '普通管理员',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`realname`,`sex`,`age`,`address`,`tel`,`addtime`,`sf`) values (1,'admin','111','陈道明','男','22','成都市金牛区','13900000000','2014-04-13 17:50:31','系统管理员'),(5,'111111','111','tom','男','21','test','13588888888','2014-04-13 17:50:3','普通管理员');

/*Table structure for table `affiche` */

DROP TABLE IF EXISTS `affiche`;

CREATE TABLE `affiche` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `adder` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `affiche` */

insert  into `affiche`(`id`,`title`,`content`,`addtime`,`adder`) values (1,'ERP财务管理系统的设计与实现','ERP财务管理系统的设计与实现','2014-04-01 17:50:31','admin'),(2,'ERP财务管理系统的设计与实现','ERP财务管理系统的设计与实现','2014-03-31 16:21:14','admin');

/*Table structure for table `bmyh` */

DROP TABLE IF EXISTS `bmyh`;

CREATE TABLE `bmyh` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bmmc` varchar(500) DEFAULT NULL,
  `username` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `realname` varchar(500) DEFAULT NULL,
  `sex` varchar(500) DEFAULT NULL,
  `age` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `tel` varchar(500) DEFAULT NULL,
  `addtime` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `bmyh` */

insert  into `bmyh`(`id`,`bmmc`,`username`,`password`,`realname`,`sex`,`age`,`address`,`tel`,`addtime`) values (2,'项目运营部','xm1','111','李三','男','22','火炬大厦','13800000000','2014-04-02 13:22:31'),(3,'业务部','yw1','111','test','男','22','test','13900000000','2014-04-02 17:26:20');

/*Table structure for table `hdys` */

DROP TABLE IF EXISTS `hdys`;

CREATE TABLE `hdys` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ysmc` varchar(500) DEFAULT NULL,
  `ysnd` varchar(500) DEFAULT NULL,
  `ysje` float DEFAULT NULL,
  `xx` varchar(500) DEFAULT NULL,
  `sj` date DEFAULT NULL,
  `bmyh` varchar(500) DEFAULT NULL,
  `bmmc` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `spsj` varchar(500) DEFAULT NULL,
  `spr` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `hdys` */

insert  into `hdys`(`id`,`ysmc`,`ysnd`,`ysje`,`xx`,`sj`,`bmyh`,`bmmc`,`spjg`,`spsj`,`spr`) values (1,'测试名称','测试活动',30000,'测试说明','2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(2,'测试活动','测试活动',3500,'测试活动','2014-04-02','yw1','业务部','已同意','2014-04-02','admin');

/*Table structure for table `hk` */

DROP TABLE IF EXISTS `hk`;

CREATE TABLE `hk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `hklx` varchar(500) DEFAULT NULL,
  `hkxm` varchar(500) DEFAULT NULL,
  `hkje` float DEFAULT NULL,
  `sj` date DEFAULT NULL,
  `bmyh` varchar(500) DEFAULT NULL,
  `bmmc` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `spsj` varchar(500) DEFAULT NULL,
  `spr` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `hk` */

insert  into `hk`(`id`,`hklx`,`hkxm`,`hkje`,`sj`,`bmyh`,`bmmc`,`spjg`,`spsj`,`spr`) values (1,'部门收益资金上缴','营业收入',800000,'2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(2,'预算余额还款','省钱啦',500,'2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(3,'预算余额还款','测试',750,'2014-04-02','yw1','业务部','已同意','2014-04-02','admin'),(4,'预算余额还款','test',125,'2014-04-02','xm1','项目运营部','未审批','暂无','暂无');

/*Table structure for table `jk` */

DROP TABLE IF EXISTS `jk`;

CREATE TABLE `jk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `jklx` varchar(500) DEFAULT NULL,
  `jkxm` varchar(500) DEFAULT NULL,
  `jkje` float DEFAULT NULL,
  `sj` date DEFAULT NULL,
  `bmyh` varchar(500) DEFAULT NULL,
  `bmmc` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `spsj` varchar(500) DEFAULT NULL,
  `spr` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `jk` */

insert  into `jk`(`id`,`jklx`,`jkxm`,`jkje`,`sj`,`bmyh`,`bmmc`,`spjg`,`spsj`,`spr`) values (2,'预算不足借款','测试项目',1500,'2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(3,'预算不足借款','测试',600,'2014-04-02','yw1','业务部','已同意','2014-04-02','admin');

/*Table structure for table `ndys` */

DROP TABLE IF EXISTS `ndys`;

CREATE TABLE `ndys` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ysmc` varchar(500) DEFAULT NULL,
  `ysnd` varchar(500) DEFAULT NULL,
  `ysje` float DEFAULT NULL,
  `xx` varchar(500) DEFAULT NULL,
  `sj` varchar(500) DEFAULT NULL,
  `bmyh` varchar(500) DEFAULT NULL,
  `bmmc` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `spsj` varchar(500) DEFAULT NULL,
  `spr` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `ndys` */

insert  into `ndys`(`id`,`ysmc`,`ysnd`,`ysje`,`xx`,`sj`,`bmyh`,`bmmc`,`spjg`,`spsj`,`spr`) values (2,'年度测试预算','2014',20000,'测试','2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(3,'1','2013',2,'3','2014-04-02','xm1','项目运营部','已同意','2014-04-02','admin'),(4,'测试名称','2011',8000,'测试','2014-04-02','yw1','业务部','已同意','2014-04-02','admin');

/*Table structure for table `nj` */

DROP TABLE IF EXISTS `nj`;

CREATE TABLE `nj` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zchm` varchar(500) DEFAULT NULL,
  `sfxm` varchar(500) DEFAULT NULL,
  `sfje` varchar(500) DEFAULT NULL,
  `sj` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `nj` */

insert  into `nj`(`id`,`zchm`,`sfxm`,`sfje`,`sj`) values (2,'人事部','测试','测试一下','2014-03-31 16:12:16'),(3,'业务部','赚钱','测试','2014-04-02 13:00:32'),(4,'项目运营部','测试','测试','2014-04-02 13:00:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
