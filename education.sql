/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.50 : Database - education
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`education` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `education`;

/*Table structure for table `acl_permission` */

DROP TABLE IF EXISTS `acl_permission`;

CREATE TABLE `acl_permission` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限';

/*Data for the table `acl_permission` */

insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','0','全部数据',0,'','','',NULL,NULL,0,'2019-11-15 17:13:06','2019-11-15 17:13:06');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268474480156673','1','权限管理',1,NULL,'/acl','Layout',NULL,NULL,0,'2019-11-15 17:13:06','2019-11-18 13:54:25');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268616021139457','1195268474480156673','用户管理',1,NULL,'user/list','/acl/user/list',NULL,NULL,0,'2019-11-15 17:13:40','2019-11-18 13:53:12');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268788138598401','1195268474480156673','角色管理',1,NULL,'role/list','/acl/role/list',NULL,NULL,0,'2019-11-15 17:14:21','2019-11-15 17:14:21');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268893830864898','1195268474480156673','菜单管理',1,NULL,'menu/list','/acl/menu/list',NULL,NULL,0,'2019-11-15 17:14:46','2019-11-15 17:14:46');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269143060602882','1195268616021139457','查看',2,'user.list','','',NULL,NULL,0,'2019-11-15 17:15:45','2019-11-17 21:57:16');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269295926206466','1195268616021139457','添加',2,'user.add','user/add','/acl/user/form',NULL,NULL,0,'2019-11-15 17:16:22','2019-11-15 17:16:22');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269473479483394','1195268616021139457','修改',2,'user.update','user/update/:id','/acl/user/form',NULL,NULL,0,'2019-11-15 17:17:04','2019-11-15 17:17:04');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269547269873666','1195268616021139457','删除',2,'user.remove','','',NULL,NULL,0,'2019-11-15 17:17:22','2019-11-15 17:17:22');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269821262782465','1195268788138598401','修改',2,'role.update','role/update/:id','/acl/role/form',NULL,NULL,0,'2019-11-15 17:18:27','2019-11-15 17:19:53');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269903542444034','1195268788138598401','查看',2,'role.list','','',NULL,NULL,0,'2019-11-15 17:18:47','2019-11-15 17:18:47');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270037005197313','1195268788138598401','添加',2,'role.add','role/add','/acl/role/form',NULL,NULL,0,'2019-11-15 17:19:19','2019-11-18 11:05:42');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270442602782721','1195268788138598401','删除',2,'role.remove','','',NULL,NULL,0,'2019-11-15 17:20:55','2019-11-15 17:20:55');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270621548568578','1195268788138598401','角色权限',2,'role.acl','role/distribution/:id','/acl/role/roleForm',NULL,NULL,0,'2019-11-15 17:21:38','2019-11-15 17:21:38');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270744097742849','1195268893830864898','查看',2,'permission.list','','',NULL,NULL,0,'2019-11-15 17:22:07','2019-11-15 17:22:07');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270810560684034','1195268893830864898','添加',2,'permission.add','','',NULL,NULL,0,'2019-11-15 17:22:23','2019-11-15 17:22:23');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270862100291586','1195268893830864898','修改',2,'permission.update','','',NULL,NULL,0,'2019-11-15 17:22:35','2019-11-15 17:22:35');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270887933009922','1195268893830864898','删除',2,'permission.remove','','',NULL,NULL,0,'2019-11-15 17:22:41','2019-11-15 17:22:41');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349439240048642','1','讲师管理',1,NULL,'/teacher','Layout',NULL,NULL,0,'2019-11-15 22:34:49','2019-11-15 22:34:49');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349699995734017','1195349439240048642','讲师列表',1,NULL,'list','/edu/teacher/list',NULL,NULL,0,'2019-11-15 22:35:52','2019-11-15 22:35:52');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349810561781761','1195349439240048642','添加讲师',1,NULL,'add','/edu/teacher/add',NULL,NULL,0,'2019-11-15 22:36:18','2019-11-15 22:36:18');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349876252971010','1195349810561781761','添加',2,'teacher.add','','',NULL,NULL,0,'2019-11-15 22:36:34','2019-11-15 22:36:34');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349979797753857','1195349699995734017','查看',2,'teacher.list','','',NULL,NULL,0,'2019-11-15 22:36:58','2019-11-15 22:36:58');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350117270261762','1195349699995734017','修改',2,'teacher.update','edit/:id','/edu/teacher/add',NULL,NULL,0,'2019-11-15 22:37:31','2019-11-15 22:37:31');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350188359520258','1195349699995734017','删除',2,'teacher.remove','','',NULL,NULL,0,'2019-11-15 22:37:48','2019-11-15 22:37:48');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350299365969922','1','课程分类',1,NULL,'/subject','Layout',NULL,NULL,0,'2019-11-15 22:38:15','2019-11-15 22:38:15');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350397751758850','1195350299365969922','课程分类列表',1,NULL,'list','/edu/subject/list',NULL,NULL,0,'2019-11-15 22:38:38','2019-11-15 22:38:38');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350500512206850','1195350299365969922','导入课程分类',1,NULL,'import','/edu/subject/add',NULL,NULL,0,'2019-11-15 22:39:03','2019-11-15 22:39:03');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350612172967938','1195350397751758850','查看',2,'subject.list','','',NULL,NULL,0,'2019-11-15 22:39:29','2019-11-15 22:39:29');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350687590748161','1195350500512206850','导入',2,'subject.import','','',NULL,NULL,0,'2019-11-15 22:39:47','2019-11-15 22:39:47');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350831744782337','1','课程管理',1,NULL,'/course','Layout',NULL,NULL,0,'2019-11-15 22:40:21','2019-11-15 22:40:21');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350919074385921','1195350831744782337','课程列表',1,NULL,'list','/edu/course/list',NULL,NULL,0,'2019-11-15 22:40:42','2019-11-15 22:40:42');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351020463296513','1195350831744782337','发布课程',1,NULL,'info','/edu/course/info',NULL,NULL,0,'2019-11-15 22:41:06','2019-11-15 22:41:06');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351159672246274','1195350919074385921','完成发布',2,'course.publish','publish/:id','/edu/course/publish',NULL,NULL,0,'2019-11-15 22:41:40','2019-11-15 22:44:01');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351326706208770','1195350919074385921','编辑课程',2,'course.update','info/:id','/edu/course/info',NULL,NULL,0,'2019-11-15 22:42:19','2019-11-15 22:42:19');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351566221938690','1195350919074385921','编辑课程大纲',2,'chapter.update','chapter/:id','/edu/course/chapter',NULL,NULL,0,'2019-11-15 22:43:17','2019-11-15 22:43:17');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351862889254913','1','统计分析',1,NULL,'/statistic','Layout',NULL,NULL,0,'2019-11-15 22:44:27','2019-11-15 22:44:27');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351968841568257','1195351862889254913','生成统计',1,NULL,'create','/edu/statistic/create',NULL,NULL,0,'2019-11-15 22:44:53','2019-11-15 22:44:53');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352054917074946','1195351862889254913','统计图表',1,NULL,'show','/edu/statistic/show',NULL,NULL,0,'2019-11-15 22:45:13','2019-11-15 22:45:13');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352127734386690','1195352054917074946','查看',2,'daily.list','','',NULL,NULL,0,'2019-11-15 22:45:30','2019-11-15 22:45:30');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352215768633346','1195351968841568257','生成',2,'daily.add','','',NULL,NULL,0,'2019-11-15 22:45:51','2019-11-15 22:45:51');
insert  into `acl_permission`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301740985311234','1195268616021139457','分配角色',2,'user.assgin','user/role/:id','/acl/user/roleForm',NULL,NULL,0,'2019-11-18 13:38:56','2019-11-18 13:38:56');

/*Table structure for table `acl_permission_copy1` */

DROP TABLE IF EXISTS `acl_permission_copy1`;

CREATE TABLE `acl_permission_copy1` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限';

/*Data for the table `acl_permission_copy1` */

insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','0','全部数据',0,'','','',NULL,NULL,0,'2019-11-15 17:13:06','2019-11-15 17:13:06');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268474480156673','1','权限管理',1,NULL,'/acl','Layout',NULL,NULL,0,'2019-11-15 17:13:06','2019-11-18 13:54:25');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268616021139457','1195268474480156673','用户管理',1,NULL,'user/list','/acl/user/list',NULL,NULL,0,'2019-11-15 17:13:40','2019-11-18 13:53:12');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268788138598401','1195268474480156673','角色管理',1,NULL,'role/list','/acl/role/list',NULL,NULL,0,'2019-11-15 17:14:21','2019-11-15 17:14:21');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195268893830864898','1195268474480156673','菜单管理',1,NULL,'menu/list','/acl/menu/list',NULL,NULL,0,'2019-11-15 17:14:46','2019-11-15 17:14:46');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269143060602882','1195268616021139457','查看',2,'user.list','','',NULL,NULL,0,'2019-11-15 17:15:45','2019-11-17 21:57:16');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269295926206466','1195268616021139457','添加',2,'user.add','user/add','/acl/user/form',NULL,NULL,0,'2019-11-15 17:16:22','2019-11-15 17:16:22');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269473479483394','1195268616021139457','修改',2,'user.update','user/update/:id','/acl/user/form',NULL,NULL,0,'2019-11-15 17:17:04','2019-11-15 17:17:04');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269547269873666','1195268616021139457','删除',2,'user.remove','','',NULL,NULL,0,'2019-11-15 17:17:22','2019-11-15 17:17:22');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269821262782465','1195268788138598401','修改',2,'role.update','role/update/:id','/acl/role/form',NULL,NULL,0,'2019-11-15 17:18:27','2019-11-15 17:19:53');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195269903542444034','1195268788138598401','查看',2,'role.list','','',NULL,NULL,0,'2019-11-15 17:18:47','2019-11-15 17:18:47');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270037005197313','1195268788138598401','添加',2,'role.add','role/add','/acl/role/form',NULL,NULL,0,'2019-11-15 17:19:19','2019-11-18 11:05:42');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270442602782721','1195268788138598401','删除',2,'role.remove','','',NULL,NULL,0,'2019-11-15 17:20:55','2019-11-15 17:20:55');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270621548568578','1195268788138598401','角色权限',2,'role.acl','role/distribution/:id','/acl/role/roleForm',NULL,NULL,0,'2019-11-15 17:21:38','2019-11-15 17:21:38');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270744097742849','1195268893830864898','查看',2,'permission.list','','',NULL,NULL,0,'2019-11-15 17:22:07','2019-11-15 17:22:07');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270810560684034','1195268893830864898','添加',2,'permission.add','','',NULL,NULL,0,'2019-11-15 17:22:23','2019-11-15 17:22:23');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270862100291586','1195268893830864898','修改',2,'permission.update','','',NULL,NULL,0,'2019-11-15 17:22:35','2019-11-15 17:22:35');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195270887933009922','1195268893830864898','删除',2,'permission.remove','','',NULL,NULL,0,'2019-11-15 17:22:41','2019-11-15 17:22:41');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349439240048642','1','讲师管理',1,NULL,'/teacher','Layout',NULL,NULL,0,'2019-11-15 22:34:49','2019-11-15 22:34:49');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349699995734017','1195349439240048642','讲师列表',1,NULL,'list','/edu/teacher/list',NULL,NULL,0,'2019-11-15 22:35:52','2019-11-15 22:35:52');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349810561781761','1195349439240048642','添加讲师',1,NULL,'add','/edu/teacher/add',NULL,NULL,0,'2019-11-15 22:36:18','2019-11-15 22:36:18');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349876252971010','1195349810561781761','添加',2,'teacher.add','','',NULL,NULL,0,'2019-11-15 22:36:34','2019-11-15 22:36:34');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195349979797753857','1195349699995734017','查看',2,'teacher.list','','',NULL,NULL,0,'2019-11-15 22:36:58','2019-11-15 22:36:58');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350117270261762','1195349699995734017','修改',2,'teacher.update','edit/:id','/edu/teacher/add',NULL,NULL,0,'2019-11-15 22:37:31','2019-11-15 22:37:31');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350188359520258','1195349699995734017','删除',2,'teacher.remove','','',NULL,NULL,0,'2019-11-15 22:37:48','2019-11-15 22:37:48');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350299365969922','1','课程分类',1,NULL,'/subject','Layout',NULL,NULL,0,'2019-11-15 22:38:15','2019-11-15 22:38:15');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350397751758850','1195350299365969922','课程分类列表',1,NULL,'list','/edu/subject/list',NULL,NULL,0,'2019-11-15 22:38:38','2019-11-15 22:38:38');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350500512206850','1195350299365969922','导入课程分类',1,NULL,'import','/edu/subject/add',NULL,NULL,0,'2019-11-15 22:39:03','2019-11-15 22:39:03');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350612172967938','1195350397751758850','查看',2,'subject.list','','',NULL,NULL,0,'2019-11-15 22:39:29','2019-11-15 22:39:29');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350687590748161','1195350500512206850','导入',2,'subject.import','','',NULL,NULL,0,'2019-11-15 22:39:47','2019-11-15 22:39:47');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350831744782337','1','课程管理',1,NULL,'/course','Layout',NULL,NULL,0,'2019-11-15 22:40:21','2019-11-15 22:40:21');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195350919074385921','1195350831744782337','课程列表',1,NULL,'list','/edu/course/list',NULL,NULL,0,'2019-11-15 22:40:42','2019-11-15 22:40:42');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351020463296513','1195350831744782337','发布课程',1,NULL,'info','/edu/course/info',NULL,NULL,0,'2019-11-15 22:41:06','2019-11-15 22:41:06');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351159672246274','1195350919074385921','完成发布',2,'course.publish','publish/:id','/edu/course/publish',NULL,NULL,0,'2019-11-15 22:41:40','2019-11-15 22:44:01');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351326706208770','1195350919074385921','编辑课程',2,'course.update','info/:id','/edu/course/info',NULL,NULL,0,'2019-11-15 22:42:19','2019-11-15 22:42:19');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351566221938690','1195350919074385921','编辑课程大纲',2,'chapter.update','chapter/:id','/edu/course/chapter',NULL,NULL,0,'2019-11-15 22:43:17','2019-11-15 22:43:17');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351862889254913','1','统计分析',1,NULL,'/statistic','Layout',NULL,NULL,0,'2019-11-15 22:44:27','2019-11-15 22:44:27');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195351968841568257','1195351862889254913','生成统计',1,NULL,'create','/edu/statistic/create',NULL,NULL,0,'2019-11-15 22:44:53','2019-11-15 22:44:53');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352054917074946','1195351862889254913','统计图表',1,NULL,'show','/edu/statistic/show',NULL,NULL,0,'2019-11-15 22:45:13','2019-11-15 22:45:13');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352127734386690','1195352054917074946','查看',2,'daily.list','','',NULL,NULL,0,'2019-11-15 22:45:30','2019-11-15 22:45:30');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352215768633346','1195351968841568257','生成',2,'daily.add','','',NULL,NULL,0,'2019-11-15 22:45:51','2019-11-15 22:45:51');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352547621965825','1','CMS管理',1,NULL,'/cms','Layout',NULL,NULL,0,'2019-11-15 22:47:11','2019-11-18 10:51:46');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352856645701633','1195353513549205505','查看',2,'banner.list','',NULL,NULL,NULL,0,'2019-11-15 22:48:24','2019-11-15 22:48:24');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195352909401657346','1195353513549205505','添加',2,'banner.add','banner/add','/cms/banner/form',NULL,NULL,0,'2019-11-15 22:48:37','2019-11-18 10:52:10');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195353051395624961','1195353513549205505','修改',2,'banner.update','banner/update/:id','/cms/banner/form',NULL,NULL,0,'2019-11-15 22:49:11','2019-11-18 10:52:05');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195353513549205505','1195352547621965825','Bande 列表',1,NULL,'banner/list','/cms/banner/list',NULL,NULL,0,'2019-11-15 22:51:01','2019-11-18 10:51:29');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195353672110673921','1195353513549205505','删除',2,'banner.remove','','',NULL,NULL,0,'2019-11-15 22:51:39','2019-11-15 22:51:39');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195354076890370050','1','订单管理',1,NULL,'/order','Layout',NULL,NULL,0,'2019-11-15 22:53:15','2019-11-15 22:53:15');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195354153482555393','1195354076890370050','订单列表',1,NULL,'list','/order/list',NULL,NULL,0,'2019-11-15 22:53:33','2019-11-15 22:53:58');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195354315093282817','1195354153482555393','查看',2,'order.list','','',NULL,NULL,0,'2019-11-15 22:54:12','2019-11-15 22:54:12');
insert  into `acl_permission_copy1`(`id`,`pid`,`name`,`type`,`permission_value`,`path`,`component`,`icon`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301740985311234','1195268616021139457','分配角色',2,'user.assgin','user/role/:id','/acl/user/roleForm',NULL,NULL,0,'2019-11-18 13:38:56','2019-11-18 13:38:56');

/*Table structure for table `acl_role` */

DROP TABLE IF EXISTS `acl_role`;

CREATE TABLE `acl_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `acl_role` */

insert  into `acl_role`(`id`,`role_name`,`role_code`,`remark`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','普通管理员',NULL,NULL,0,'2019-11-11 13:09:32','2019-11-18 10:27:18');
insert  into `acl_role`(`id`,`role_name`,`role_code`,`remark`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1193757683205607426','课程管理员',NULL,NULL,0,'2019-11-11 13:09:45','2019-11-18 10:25:44');

/*Table structure for table `acl_role_permission` */

DROP TABLE IF EXISTS `acl_role_permission`;

CREATE TABLE `acl_role_permission` (
  `id` char(19) NOT NULL DEFAULT '',
  `role_id` char(19) NOT NULL DEFAULT '',
  `permission_id` char(19) NOT NULL DEFAULT '',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_permission_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色权限';

/*Data for the table `acl_role_permission` */

insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979754455041','1','1',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979792203778','1','1195268474480156673',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979821563906','1','1195268616021139457',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979842535426','1','1195269143060602882',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979855118338','1','1195269295926206466',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979880284161','1','1195269473479483394',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979913838593','1','1195269547269873666',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979926421506','1','1196301740985311234',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301979951587330','1','1195268788138598401',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980014501889','1','1195269821262782465',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980035473410','1','1195269903542444034',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980052250626','1','1195270037005197313',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980077416450','1','1195270442602782721',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980094193665','1','1195270621548568578',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980119359489','1','1195268893830864898',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980136136706','1','1195270744097742849',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980249382913','1','1195270810560684034',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980270354434','1','1195270862100291586',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980287131649','1','1195270887933009922',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980303908866','1','1195349439240048642',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980320686082','1','1195349699995734017',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980345851905','1','1195349979797753857',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980362629121','1','1195350117270261762',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980383600641','1','1195350188359520258',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980408766465','1','1195349810561781761',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980421349378','1','1195349876252971010',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980438126593','1','1195350299365969922',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980450709506','1','1195350397751758850',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980501041153','1','1195350612172967938',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980517818370','1','1195350500512206850',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980538789889','1','1195350687590748161',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980622675970','1','1195350831744782337',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980639453186','1','1195350919074385921',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980660424705','1','1195351159672246274',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980677201922','1','1195351326706208770',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980698173441','1','1195351566221938690',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980714950658','1','1195351020463296513',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980723339266','1','1195351862889254913',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980744310786','1','1195351968841568257',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980761088001','1','1195352215768633346',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980777865217','1','1195352054917074946',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980794642434','1','1195352127734386690',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980811419650','1','1195352547621965825',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980828196865','1','1195353513549205505',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980844974082','1','1195352856645701633',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980861751298','1','1195352909401657346',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980886917122','1','1195353051395624961',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980928860162','1','1195353672110673921',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980954025986','1','1195354076890370050',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980970803201','1','1195354153482555393',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196301980987580418','1','1195354315093282817',1,'2019-11-18 13:39:53','2019-11-18 13:39:53');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293070077953','1','1',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293099438081','1','1195268474480156673',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293120409602','1','1195268616021139457',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293153964034','1','1195269143060602882',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293183324162','1','1195269295926206466',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293212684290','1','1195269473479483394',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293237850114','1','1195269547269873666',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293271404545','1','1196301740985311234',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293485314049','1','1195268788138598401',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293506285569','1','1195269821262782465',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293527257089','1','1195269903542444034',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293552422914','1','1195270037005197313',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293565005825','1','1195270442602782721',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293594365954','1','1195270621548568578',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293611143169','1','1195268893830864898',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293627920385','1','1195270744097742849',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293657280513','1','1195349439240048642',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293674057729','1','1195349699995734017',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293690834946','1','1195349979797753857',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293716000770','1','1195350117270261762',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293736972290','1','1195350188359520258',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293749555202','1','1195349810561781761',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293766332417','1','1195349876252971010',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293795692546','1','1195350299365969922',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293812469762','1','1195350397751758850',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293837635586','1','1195350612172967938',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293858607106','1','1195350500512206850',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293875384322','1','1195350687590748161',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293892161538','1','1195350831744782337',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293950881794','1','1195350919074385921',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305293976047617','1','1195351159672246274',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294127042561','1','1195351326706208770',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294156402690','1','1195351566221938690',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294177374209','1','1195351862889254913',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294194151425','1','1195351968841568257',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294223511554','1','1195352215768633346',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294240288770','1','1195352054917074946',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294248677377','1','1195352127734386690',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294248677378','1','1195352547621965825',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294319980546','1','1195353513549205505',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294319980547','1','1195352856645701633',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294319980548','1','1195352909401657346',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294378700802','1','1195353051395624961',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294378700803','1','1195353672110673921',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294458392577','1','1195354076890370050',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294483558402','1','1195354153482555393',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305294500335618','1','1195354315093282817',1,'2019-11-18 13:53:03','2019-11-18 13:53:03');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566656139266','1','1',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566689693698','1','1195268474480156673',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566706470913','1','1195268616021139457',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566740025346','1','1195269143060602882',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566756802561','1','1195269295926206466',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566781968385','1','1195269473479483394',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566811328514','1','1195269547269873666',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566828105730','1','1196301740985311234',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566853271554','1','1195268788138598401',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566878437378','1','1195269821262782465',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566895214593','1','1195269903542444034',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566916186113','1','1195270037005197313',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566949740546','1','1195270442602782721',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566966517761','1','1195270621548568578',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305566991683585','1','1195268893830864898',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567012655106','1','1195270744097742849',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567029432322','1','1195270810560684034',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567042015233','1','1195270862100291586',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567100735490','1','1195270887933009922',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567117512705','1','1195349439240048642',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567142678530','1','1195349699995734017',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567155261442','1','1195349979797753857',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567172038658','1','1195350117270261762',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567188815873','1','1195350188359520258',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567218176001','1','1195349810561781761',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567234953217','1','1195349876252971010',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567251730434','1','1195350299365969922',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567272701954','1','1195350397751758850',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567289479170','1','1195350612172967938',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567310450690','1','1195350500512206850',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567327227905','1','1195350687590748161',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567448862722','1','1195350831744782337',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567478222850','1','1195350919074385921',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567495000065','1','1195351159672246274',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567520165889','1','1195351326706208770',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567541137409','1','1195351566221938690',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567570497538','1','1195351862889254913',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567587274754','1','1195351968841568257',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567604051970','1','1195352215768633346',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567633412098','1','1195352054917074946',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567683743745','1','1195352127734386690',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567721492481','1','1195352547621965825',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567742464002','1','1195353513549205505',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567771824129','1','1195352856645701633',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567792795650','1','1195352909401657346',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567809572866','1','1195353051395624961',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567843127298','1','1195353672110673921',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567868293122','1','1195354076890370050',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567885070338','1','1195354153482555393',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196305567910236162','1','1195354315093282817',1,'2019-11-18 13:54:08','2019-11-18 13:54:08');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702601695234','1','1',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702652026881','1','1195268474480156673',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702668804098','1','1195268616021139457',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702698164226','1','1195269143060602882',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702723330049','1','1195269295926206466',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702744301569','1','1195269473479483394',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702765273089','1','1195269547269873666',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702790438913','1','1196301740985311234',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702945628161','1','1195268788138598401',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312702970793985','1','1195269821262782465',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703000154114','1','1195269903542444034',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703025319938','1','1195270037005197313',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703046291458','1','1195270442602782721',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703063068673','1','1195270621548568578',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703084040193','1','1195268893830864898',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703113400321','1','1195270744097742849',0,'2019-11-18 14:22:29','2019-11-18 14:22:29');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703134371842','1','1195270810560684034',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703159537665','1','1195270862100291586',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703184703490','1','1195270887933009922',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703209869313','1','1195349439240048642',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703230840834','1','1195349699995734017',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703251812354','1','1195349979797753857',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703272783873','1','1195350117270261762',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703293755394','1','1195350188359520258',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703327309826','1','1195349810561781761',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703348281345','1','1195349876252971010',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703365058561','1','1195350299365969922',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703386030082','1','1195350397751758850',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703440556034','1','1195350612172967938',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703486693378','1','1195350500512206850',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703511859202','1','1195350687590748161',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703654465537','1','1195350831744782337',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703683825665','1','1195350919074385921',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703700602882','1','1195351159672246274',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703717380098','1','1195351326706208770',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703738351618','1','1195351566221938690',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703759323137','1','1195351020463296513',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703776100353','1','1195351862889254913',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703792877570','1','1195351968841568257',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703830626305','1','1195352215768633346',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703843209217','1','1195352054917074946',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703868375041','1','1195352127734386690',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703889346561','1','1195352547621965825',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703901929473','1','1195353513549205505',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703918706689','1','1195352856645701633',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703952261121','1','1195352909401657346',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703973232642','1','1195353051395624961',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312703990009857','1','1195353672110673921',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312704048730114','1','1195354076890370050',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312704069701633','1','1195354153482555393',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196312704094867457','1','1195354315093282817',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788788518914','1','1',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788796907522','1','1195268474480156673',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788796907523','1','1195268616021139457',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788796907524','1','1195269143060602882',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788805296130','1','1195269295926206466',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788805296131','1','1195269473479483394',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788813684737','1','1195269547269873666',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788813684738','1','1196301740985311234',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788817879041','1','1195268788138598401',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788817879042','1','1195269821262782465',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788822073345','1','1195269903542444034',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788822073346','1','1195270037005197313',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788826267650','1','1195270442602782721',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788826267651','1','1195270621548568578',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788826267652','1','1195268893830864898',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788826267653','1','1195270744097742849',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788826267654','1','1195270810560684034',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788834656257','1','1195270862100291586',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788834656258','1','1195270887933009922',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788834656259','1','1195349439240048642',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788834656260','1','1195349699995734017',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788843044866','1','1195349979797753857',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788843044867','1','1195350117270261762',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788843044868','1','1195350188359520258',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788843044869','1','1195349810561781761',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788843044870','1','1195349876252971010',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788851433474','1','1195350299365969922',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788851433475','1','1195350397751758850',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788859822082','1','1195350612172967938',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788859822083','1','1195350500512206850',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116788859822084','1','1195350687590748161',0,'2021-07-22 15:52:44','2021-07-22 15:52:44');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789384110082','1','1195350831744782337',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789384110083','1','1195350919074385921',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789388304385','1','1195351159672246274',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789388304386','1','1195351326706208770',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789388304387','1','1195351566221938690',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789388304388','1','1195351020463296513',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789392498689','1','1195351862889254913',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789392498690','1','1195351968841568257',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789392498691','1','1195352215768633346',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789392498692','1','1195352054917074946',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789392498693','1','1195352127734386690',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789400887298','1','1195352547621965825',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789400887299','1','1195353513549205505',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789400887300','1','1195352856645701633',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789400887301','1','1195352909401657346',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789400887302','1','1195353051395624961',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789405081602','1','1195353672110673921',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789405081603','1','1195354076890370050',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789405081604','1','1195354153482555393',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116789405081605','1','1195354315093282817',0,'2021-07-22 15:52:45','2021-07-22 15:52:45');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893629341697','1','1',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893629341698','1','1195268474480156673',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893629341699','1','1195268616021139457',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730306','1','1195269143060602882',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730307','1','1195269295926206466',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730308','1','1195269473479483394',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730309','1','1195269547269873666',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730310','1','1196301740985311234',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730311','1','1195268788138598401',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730312','1','1195269821262782465',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730313','1','1195269903542444034',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730314','1','1195270037005197313',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730315','1','1195270442602782721',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893637730316','1','1195270621548568578',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118914','1','1195268893830864898',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118915','1','1195270744097742849',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118916','1','1195270810560684034',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118917','1','1195270862100291586',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118918','1','1195270887933009922',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118919','1','1195349439240048642',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118920','1','1195349699995734017',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118921','1','1195349979797753857',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893646118922','1','1195350117270261762',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313218','1','1195350188359520258',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313219','1','1195349810561781761',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313220','1','1195349876252971010',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313221','1','1195350299365969922',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313222','1','1195350397751758850',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893650313223','1','1195350612172967938',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893658701825','1','1195350500512206850',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116893658701826','1','1195350687590748161',0,'2021-07-22 15:53:09','2021-07-22 15:53:09');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894078132225','1','1195350831744782337',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894078132226','1','1195350919074385921',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894078132227','1','1195351159672246274',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894078132228','1','1195351326706208770',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520834','1','1195351566221938690',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520835','1','1195351862889254913',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520836','1','1195351968841568257',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520837','1','1195352215768633346',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520838','1','1195352054917074946',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520839','1','1195352127734386690',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520840','1','1195352547621965825',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520841','1','1195353513549205505',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894086520842','1','1195352856645701633',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715137','1','1195352909401657346',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715138','1','1195353051395624961',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715139','1','1195353672110673921',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715140','1','1195354076890370050',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715141','1','1195354153482555393',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');
insert  into `acl_role_permission`(`id`,`role_id`,`permission_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116894090715142','1','1195354315093282817',0,'2021-07-22 15:53:10','2021-07-22 15:53:10');

/*Table structure for table `acl_user` */

DROP TABLE IF EXISTS `acl_user`;

CREATE TABLE `acl_user` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `acl_user` */

insert  into `acl_user`(`id`,`username`,`password`,`nick_name`,`salt`,`token`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','admin','96e79218965eb72c92a549dd5a330112','admin','',NULL,0,'2019-11-01 10:39:47','2019-11-01 10:39:47');
insert  into `acl_user`(`id`,`username`,`password`,`nick_name`,`salt`,`token`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418116618977927169','test111','4061863caf7f28c0b0346719e764d561','test111',NULL,NULL,0,'2021-07-22 15:52:04','2021-07-22 15:52:04');

/*Table structure for table `acl_user_role` */

DROP TABLE IF EXISTS `acl_user_role`;

CREATE TABLE `acl_user_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `acl_user_role` */

insert  into `acl_user_role`(`id`,`role_id`,`user_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','1','1',0,'2019-11-11 13:09:53','2019-11-11 13:09:53');

/*Table structure for table `crm_banner` */

DROP TABLE IF EXISTS `crm_banner`;

CREATE TABLE `crm_banner` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) DEFAULT '' COMMENT '链接地址',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页banner表';

/*Data for the table `crm_banner` */

insert  into `crm_banner`(`id`,`title`,`image_url`,`link_url`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1194556896025845762','test1','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/banner/153525d0ef15459596.jpg','/course',1,0,'2019-11-13 18:05:32','2019-11-18 10:28:22');
insert  into `crm_banner`(`id`,`title`,`image_url`,`link_url`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1194607458461216769','test2','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/banner/1525939573202.jpg','/teacher',2,0,'2019-11-13 21:26:27','2019-11-14 09:12:15');

/*Table structure for table `edu_chapter` */

DROP TABLE IF EXISTS `edu_chapter`;

CREATE TABLE `edu_chapter` (
  `id` char(19) NOT NULL COMMENT '章节ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `title` varchar(50) NOT NULL COMMENT '章节名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程';

/*Data for the table `edu_chapter` */

insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1','14','第一章：HTML',0,'2019-01-01 12:27:40','2019-01-01 12:55:30');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1417690549686714370','1417690489733332993','测试章节1',0,'2021-07-21 11:39:01','2021-07-21 11:39:01');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1417690576484122625','1417690489733332993','测试章节2',0,'2021-07-21 11:39:08','2021-07-21 11:39:08');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418825383934984193','1418825326766620674','第二章',1,'2021-07-24 14:48:27','2021-07-24 14:51:08');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418827121056301058','1418825326766620674','第零章',0,'2021-07-24 14:55:21','2021-07-24 14:55:21');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418827653762273281','1418827632270659585','test1',0,'2021-07-24 14:57:28','2021-07-24 14:57:28');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418827677808218114','1418827632270659585','test2',1,'2021-07-24 14:57:34','2021-07-24 14:57:34');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418827695113916417','1418827632270659585','test3',2,'2021-07-24 14:57:38','2021-07-24 14:57:44');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418829408344481793','1418827632270659585','test0',0,'2021-07-24 15:04:26','2021-07-24 15:04:26');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418833166176686082','1418827632270659585','abcd',0,'2021-07-24 15:19:22','2021-07-24 15:19:22');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418943136230666242','14','第三章',0,'2021-07-24 22:36:21','2021-07-24 22:36:21');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418943164777099265','14','第四章',0,'2021-07-24 22:36:28','2021-07-24 22:36:28');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1418948108846395394','1418825326766620674','第一章',0,'2021-07-24 22:56:07','2021-07-24 22:56:07');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419136189620817922','1419136160680120321','第一章',0,'2021-07-25 11:23:29','2021-07-25 11:23:29');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419136218565709826','1419136160680120321','第二章',1,'2021-07-25 11:23:35','2021-07-25 11:23:35');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419136733496217601','1419136677221240834','第一章',0,'2021-07-25 11:25:38','2021-07-25 11:25:38');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419137523677925377','1419137497417388034','第一章',1,'2021-07-25 11:28:47','2021-07-25 11:28:47');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419137874774724609','1415475024315330561','第一章',0,'2021-07-25 11:30:10','2021-07-25 11:30:10');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419138315084369922','1419138292502237185','第一章',0,'2021-07-25 11:31:55','2021-07-25 11:31:55');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419138675710627841','1419138642986668033','第一章',0,'2021-07-25 11:33:21','2021-07-25 11:33:21');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419139519722033153','1419139495634145281','第一章',1,'2021-07-25 11:36:43','2021-07-25 11:36:43');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419140622526189569','1419140595082858497','第一章',0,'2021-07-25 11:41:05','2021-07-25 11:41:05');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('1419141477337927681','1419141455724679170','第一章',0,'2021-07-25 11:44:29','2021-07-25 11:44:29');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('15','18','第一章：Java入门',0,'2019-01-01 12:27:40','2019-10-09 09:13:19');
insert  into `edu_chapter`(`id`,`course_id`,`title`,`sort`,`gmt_create`,`gmt_modified`) values ('3','14','第二章：CSS',0,'2019-01-01 12:55:35','2019-01-01 12:27:40');

/*Table structure for table `edu_comment` */

DROP TABLE IF EXISTS `edu_comment`;

CREATE TABLE `edu_comment` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE,
  KEY `idx_teacher_id` (`teacher_id`) USING BTREE,
  KEY `idx_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';

/*Data for the table `edu_comment` */

insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1194499162790211585','18','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','课程很好',0,'2019-11-13 14:16:08','2019-11-13 14:16:08');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1194898406466420738','18','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','11',0,'2019-11-14 16:42:35','2019-11-14 16:42:35');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1194898484388200450','18','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','111',0,'2019-11-14 16:42:53','2019-11-14 16:42:53');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195251020861317122','18','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','2233',0,'2019-11-15 16:03:45','2019-11-15 16:03:45');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195251382720700418','18','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','4455',0,'2019-11-15 16:05:11','2019-11-15 16:05:11');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195252819177570306','18','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','55',0,'2019-11-15 16:10:53','2019-11-15 16:10:53');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195252899448160258','18','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','55',0,'2019-11-15 16:11:13','2019-11-15 16:11:13');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195252920587452417','18','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','223344',0,'2019-11-15 16:11:18','2019-11-15 16:11:18');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195262128095559681','18','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','11',0,'2019-11-15 16:47:53','2019-11-15 16:47:53');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196264505170767874','18','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','666666',0,'2019-11-18 11:10:58','2019-11-18 11:10:58');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416775119468072961','18','1189389726308478977','1416227615462748162','123116516','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','1561q2',0,'2021-07-18 23:01:26','2021-07-18 23:01:26');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416776810749857794','15','1189389726308478977','1416227615462748162','123116516','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','课程非常好~~~~~~~~~~~~~~~~',0,'2021-07-18 23:08:09','2021-07-18 23:08:09');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416776958984949761','18','1189389726308478977','1416227615462748162','123116516','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','课程nb的很',0,'2021-07-18 23:08:44','2021-07-18 23:08:44');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416952556218757121','1415475024315330561','1189389726308478977','1416227615462748162','123116516','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','课程nbplus',0,'2021-07-19 10:46:30','2021-07-19 10:46:30');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416978547242815489','18','1189389726308478977','1416227615462748162','123116516','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','12312',0,'2021-07-19 12:29:47','2021-07-19 12:29:47');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419162346768580609','1419139495634145281','','1419158984216145921','超级管理员','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','nb',0,'2021-07-25 13:07:25','2021-07-25 13:07:25');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419163493600346114','1419140595082858497','','1419158984216145921','超级管理员','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','sadsa666',0,'2021-07-25 13:11:58','2021-07-25 13:11:58');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419166758840844290','1419138292502237185','','1419158984216145921','超级管理员','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','666',0,'2021-07-25 13:24:57','2021-07-25 13:24:57');
insert  into `edu_comment`(`id`,`course_id`,`teacher_id`,`member_id`,`nickname`,`avatar`,`content`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419167518777425922','1419138292502237185','','1416370581095411713','Я','https://thirdwx.qlogo.cn/mmopen/vi_32/TicibT5ryib6O88ulBlCwibbKu5ias0ibZUQ7x8t8WROkVnQ8LmXJP67bpicR5lc08KF1QFiaJHVsHFqO2g5icEialAUSFNw/132','666',0,'2021-07-25 13:27:58','2021-07-25 13:27:58');

/*Table structure for table `edu_course` */

DROP TABLE IF EXISTS `edu_course`;

CREATE TABLE `edu_course` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) NOT NULL COMMENT '课程标题',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总课时',
  `cover` varchar(255) NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `view_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_title` (`title`) USING BTREE,
  KEY `idx_subject_id` (`subject_id`) USING BTREE,
  KEY `idx_teacher_id` (`teacher_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程';

/*Data for the table `edu_course` */

insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('14','1189389726308478977','1178214681210843137','1101348944971091969','Jquery入门学习','0.01',3,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295527931.jpg',3,44,15,'Normal',000,'2018-04-02 18:33:34','2021-07-24 22:53:07');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1415475024315330561','1189389726308478977','1178585108407984130','1178214681118568449','Python精品课程','0.01',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295455437.jpg',0,0,1,'Normal',000,'2021-07-15 08:55:19','2021-07-25 11:30:38');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418951152455671809','1189389726308478977','1178585108407984130','1178214681118568449','test0.1','0.00',5,'/static/default-course-cover.jpg',0,0,1,'Draft',001,'2021-07-24 23:08:12','2021-07-24 23:08:57');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418951696796729345','1189389726308478977','1178585108454121473','1101348944971091969','asd','6.00',1,'/static/default-course-cover.jpg',0,0,1,'Normal',001,'2021-07-24 23:10:22','2021-07-24 23:10:27');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1418951786877796353','1189389726308478977','1178214681382809602','1178214681324089345','asddsadas','6.00',0,'/static/default-course-cover.jpg',0,0,1,'Normal',001,'2021-07-24 23:10:44','2021-07-24 23:10:47');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419136160680120321','1','1178585108407984130','1178214681118568449','邮箱管理学','0.00',5,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/e2843a83c93247d6941ec3e778434932b51fd34a4f7f27371f20c3cfadbb0edb.jpeg',0,0,1,'Normal',000,'2021-07-25 11:23:22','2021-07-25 11:51:53');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419136677221240834','1189389726308478977','1178585108454121473','1101348944971091969','时间管理学','999.00',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/b9b771c41d7343bab894885ad7c15b03x4.jpg',0,0,1,'Normal',000,'2021-07-25 11:25:25','2021-07-25 11:26:45');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419137497417388034','1189426437876985857','1178585108407984130','1178214681118568449','Python深入浅出','10.00',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/166a446b776447f69ca42e77424bd654x5.jpg',0,0,1,'Normal',000,'2021-07-25 11:28:40','2021-07-25 11:29:43');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419138292502237185','1189390295668469762','1178585108407984130','1178214681118568449','SpringCloud入门','0.00',2,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/d514ef27032042799be6528fd25850ed23320d0e8bb39a78c68113b238c6af03.jpeg',0,0,1,'Normal',000,'2021-07-25 11:31:50','2021-07-25 11:50:04');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419138642986668033','1189389726308478977','1178214681353449473','1178214681324089345','SSM框架入门','0.00',2,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/0b4380bbd1b44f618d771ac7d4feb1e3803f551a1a5f7cbf8488fc3c64390254.jpeg',0,0,1,'Normal',000,'2021-07-25 11:33:13','2021-07-25 11:33:47');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419139495634145281','561879879848465','1178214681382809602','1178214681324089345','steam折扣学','0.00',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/70b663de07b64f3a9a4e9466daee0f16c225039daa9c193f676190f96483db0b.jpeg',0,0,1,'Normal',000,'2021-07-25 11:36:37','2021-07-25 11:52:44');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419140595082858497','55944895646515156','1178214681139539969','1178214681118568449','maven 入门','7.00',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/54606dcb2f764d2188f2ba57dcf2b88b4f5bf6545bae155c2332840362740023.jpeg',0,0,1,'Normal',000,'2021-07-25 11:40:59','2021-07-25 11:53:45');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419141455724679170','561879879848465','1178585108407984130','1178214681118568449','服务器中间件入门学习','0.00',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/25/9213051679f344a3a4394d14cc15ad40f5cafa66ebf75da799f4c04c4f79860d.jpeg',0,0,1,'Normal',000,'2021-07-25 11:44:24','2021-07-25 11:44:59');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('15','1189389726308478977','1178585108454121473','1101348944971091969','HTML5入门课程学习','0.01',23,'\r\nhttps://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295556203.jpg',0,51,17,'Normal',000,'2018-04-02 18:34:32','2019-11-12 10:19:20');
insert  into `edu_course`(`id`,`teacher_id`,`subject_id`,`subject_parent_id`,`title`,`price`,`lesson_num`,`cover`,`buy_count`,`view_count`,`version`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('18','1189389726308478977','1178214681139539969','1178214681118568449','Java精品课程','0.00',20,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295581911.jpg',151,737,6,'Normal',000,'2018-04-02 21:28:46','2021-07-24 15:50:51');

/*Table structure for table `edu_course_collect` */

DROP TABLE IF EXISTS `edu_course_collect`;

CREATE TABLE `edu_course_collect` (
  `id` char(19) NOT NULL COMMENT '收藏ID',
  `course_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程收藏';

/*Data for the table `edu_course_collect` */

insert  into `edu_course_collect`(`id`,`course_id`,`member_id`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1196269345666019330','1192252213659774977','1',1,'2019-11-18 11:30:12','2019-11-18 11:30:12');

/*Table structure for table `edu_course_description` */

DROP TABLE IF EXISTS `edu_course_description`;

CREATE TABLE `edu_course_description` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `description` text COMMENT '课程简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='课程简介';

/*Data for the table `edu_course_description` */

insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1104870479077879809','<p>11</p>','2019-03-11 06:23:44','2019-03-11 06:23:44');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1192252213659774977','<p>测试</p>','2019-11-07 09:27:33','2019-11-13 16:21:28');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('14','<p>sadas</p>','2019-03-13 06:04:43','2021-07-24 22:36:56');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1415475024315330561','<p>abcdabcdabcdabcd</p>','2021-07-15 08:55:19','2021-07-25 11:30:05');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1417690489733332993','<pre>&lt;template&gt;<br /><br />  &lt;div class=\"app-container\"&gt;<br /><br />    &lt;h2 style=\"text-align: center;\"&gt;发布新课程&lt;/h2&gt;<br /><br />    &lt;el-steps :active=\"1\" process-status=\"wait\" align-center style=\"margin-bottom: 40px;\"&gt;<br />      &lt;el-step title=\"填写课程基本信息\"/&gt;<br />      &lt;el-step title=\"创建课程大纲\"/&gt;<br />      &lt;el-step title=\"发布\"/&gt;<br />    &lt;/el-steps&gt;<br />    &lt;el-form label-width=\"120px\"&gt;<br /><br />      &lt;el-form-item label=\"课程标题\"&gt;<br />        &lt;el-input v-model=\"courseInfo.title\" placeholder=\" 示例：机器学习项目课：从基础到搭建项目视频课程。专业名称注意大小写\"/&gt;<br />      &lt;/el-form-item&gt;<br /><br />      &lt;!-- 所属分类 --&gt;<br />      &lt;el-form-item label=\"课程分类\"&gt;<br />        &lt;!-- 一级分类 --&gt;<br />        &lt;el-select<br />          v-model=\"courseInfo.subjectParentId\"<br />          placeholder=\"一级分类\" @change=\"subjectLevelOneChanged\"&gt;&lt;!--该方式声明方法可以自动获取id--&gt;<br /><br /><br />          &lt;el-option<br />            v-for=\"subject in subjectOneList\"<br />            :key=\"subject.id\"<br />            :label=\"subject.title\"<br />            :value=\"subject.id\"/&gt;<br /><br />        &lt;/el-select&gt;<br /><br />        &lt;!-- 二级分类 --&gt;<br />        &lt;el-select v-model=\"courseInfo.subjectId\" placeholder=\"二级分类\"&gt;<br />          &lt;el-option<br />            v-for=\"subject in subjectTwoList\"<br />            :key=\"subject.id\"<br />            :label=\"subject.title\"<br />            :value=\"subject.id\"/&gt;<br />        &lt;/el-select&gt;<br />      &lt;/el-form-item&gt;<br /><br /><br />      &lt;!-- 课程讲师 --&gt;<br />      &lt;el-form-item label=\"课程讲师\"&gt;<br />        &lt;el-select<br />          v-model=\"courseInfo.teacherId\"<br />          placeholder=\"请选择\"&gt;<br />          &lt;!--key保证唯一标识--&gt;<br />          &lt;el-option<br />            v-for=\"teacher in teacherList\"<br />            :key=\"teacher.id\"<br />            :label=\"teacher.name\"<br />            :value=\"teacher.id\"/&gt;<br /><br />        &lt;/el-select&gt;<br />      &lt;/el-form-item&gt;<br /><br />      &lt;el-form-item label=\"总课时\"&gt;<br />        &lt;el-input-number :min=\"0\" v-model=\"courseInfo.lessonNum\" controls-position=\"right\" placeholder=\"请填写课程的总课时数\"/&gt;<br />      &lt;/el-form-item&gt;<br /><br />      &lt;!-- 课程简介--&gt;<br />      &lt;el-form-item label=\"课程简介\"&gt;<br />        &lt;tinymce :height=\"300\" v-model=\"courseInfo.description\"/&gt;<br />      &lt;/el-form-item&gt;<br /><br /><br />      &lt;!-- 课程封面--&gt;<br />      &lt;el-form-item label=\"课程封面\"&gt;<br />        &lt;el-upload<br />          :show-file-list=\"false\"<br />          :on-success=\"handleAvatarSuccess\"<br />          :before-upload=\"beforeAvatarUpload\"<br />          :after-upload=\"uploadMessage\"<br />          :action=\"BASE_API+\'/eduoss/course/cover\'\"<br />          class=\"avatar-uploader\"&gt;<br />          &lt;img :src=\"courseInfo.cover\" width=\"400px\" height=\"200px\" title=\"点击更换封面\" alt=\"点击更换封面\"/&gt;<br />        &lt;/el-upload&gt;<br /><br />      &lt;/el-form-item&gt;<br /><br />      &lt;el-form-item label=\"课程价格\"&gt;<br />        &lt;el-input-number :min=\"0\" v-model=\"courseInfo.price\" controls-position=\"right\" placeholder=\"免费课程请设置为0元\"/&gt;<br />        元<br />      &lt;/el-form-item&gt;<br /><br />      &lt;el-form-item&gt;<br />        &lt;el-button :disabled=\"saveBtnDisabled\" type=\"primary\" @click=\"addOrUpdate\"&gt;保存并下一步&lt;/el-button&gt;<br />      &lt;/el-form-item&gt;<br />    &lt;/el-form&gt;<br />  &lt;/div&gt;<br />&lt;/template&gt;<br /><br /><br />&lt;script&gt;<br />import course from \'@/api/edu/course\'<br />import subject from \'@/api/edu/subject\'<br />import Tinymce from \'@/components/Tinymce\'<br />import { getInfo } from \'../../../api/login\'<br /><br />export default {<br />  components:{Tinymce},<br />  data() {<br />    return {<br />      BASE_API: process.env.BASE_API,<br />      saveBtnDisabled: false,<br />      courseInfo: {<br />        title: \'\',<br />        subjectId: \'\',   // 一级id<br />        subjectParentId: \'\',  // 二级id<br />        teacherId: \'\',<br />        lessonNum: \'\',<br />        description: \'\',<br />        cover: \'/static/default-course-cover.jpg\',<br />        price: 0<br />      },<br />      courseId:\'\',<br />      teacherList: [],<br />      subjectOneList: [],   // 此集合包含所有subject<br />      subjectTwoList: []<br />    }<br />  },<br />  created() {<br />    if (this.$route.params &amp;&amp; this.$route.params.id) {<br />      this.courseId = this.$route.params.id<br />      this.getInfo()<br />    }else{<br />      // 初始化一级分类<br />      this.getOneSubject()<br />    }<br />    // 初始化所有讲师<br />    this.getListTeacher()<br /><br />  },<br />  methods: {<br />    uploadMessage(){<br />      this.$message({<br />        type:\"success\",<br />        message:\"上传图片成功\",<br />      })<br />    },<br />    // 回显方法<br />    getInfo(){<br />      course.getCourseInfo(this.courseId)<br />        .then(response=&gt;{<br />          this.courseInfo = response.data.courseInfoVo<br />          subject.getSubjectList()<br />            .then(response=&gt;{<br />              this.subjectOneList = response.data.list<br />              // 二级选项需手动赋值，因为直接写入一级分类值无法<br />              for (let i = 0; i &lt; this.subjectOneList.length; i++) {<br />                var oneSubject = this.subjectOneList[i]<br />                if(this.courseInfo.subjectParentId === oneSubject.id){<br />                  this.subjectTwoList = oneSubject.children<br />                  break<br />                }<br />              }<br />            })<br />        })<br />    },<br />    // 课程封面上传成功与上传之前执行的两个方法<br />    handleAvatarSuccess(response,file) {<br />      this.courseInfo.cover = response.data.url<br />    },<br />    beforeAvatarUpload(file) {<br />      const isJPG = file.type === \'image/jpeg\'<br />      const isPNG = file.type === \'image/png\'<br />      const isLt10M = file.size &lt; 10 * 1024 * 1024<br /><br />      if (!isJPG&amp;&amp;!isPNG) {<br />        this.$message.error(\'上传头像图片只能是 JPG 或 PNG 格式!\')<br />      }<br />      if (!isLt10M) {<br />        this.$message.error(\'上传头像图片大小不能超过 10MB!\')<br />      }<br />      return (isJPG||isPNG) &amp;&amp; isLt10M<br />    },<br />    // 查询所有一级分类<br />    getOneSubject() {<br />      subject.getSubjectList()<br />        .then(response =&gt; {<br />          this.subjectOneList = response.data.list<br />        })<br />    },<br />    getTwoSubject() {<br /><br />    },<br />    subjectLevelOneChanged(id) {<br />      this.courseInfo.subjectId = \'\'   // 清空旧二级分类<br />      for (let i = 0; i &lt; this.subjectOneList.length; i++) {<br />        var oneSubject = this.subjectOneList[i]<br />        console.log(id + \'/\' + oneSubject.id)<br />        if (id === oneSubject.id) {<br />          this.subjectTwoList = oneSubject.children<br />          break<br />        }<br />      }<br />    },<br />    getListTeacher() {<br />      course.getListTeacher()<br />        .then(response =&gt; {<br />          this.teacherList = response.data.items<br />        })<br />    },<br />    addCourse(){<br />      course.addCourseInfo(this.courseInfo)<br />        .then(response =&gt; {<br />          // 提示<br />          this.$message({<br />            type: \'success\',<br />            message: \'添加课程信息成功！\'<br />          })<br />          // 跳转<br />          this.$router.push({ path: \'/course/chapter/\' + response.data.courseId })<br />        })<br />    },<br />    updateCourseInfo() {<br />      course.updateCourseInfo(this.courseInfo)<br />        .then(result =&gt; {<br />          this.$message({<br />            type:\"success\",<br />            message:\"修改课程信息成功！\",<br />          })<br /><br />          this.$router.push({path:\'/course/chapter/\'+this.courseId})<br />        })<br />      return undefined;<br />    },<br />    addOrUpdate() {<br />      if (!this.courseId) {<br />        //添加<br />        this.addCourse()<br />      } else {<br />        //修改<br />        this.updateCourseInfo()<br />      }<br />    }<br />  }<br />}<br />&lt;/script&gt;<br />&lt;style scoped&gt;<br />  .tinymce-container{<br />    line-height: 29px;<br />    width: 90%;<br />  }<br />&lt;/style&gt;</pre>','2021-07-21 11:38:47','2021-07-21 11:38:47');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1418547713754021889','','2021-07-23 20:25:05','2021-07-23 20:25:05');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1418557849193168898','<p>asdsa</p>','2021-07-23 21:05:21','2021-07-23 21:16:11');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1418785794348331010','<p>abcd</p>','2021-07-24 12:11:08','2021-07-24 13:04:31');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1418825326766620674','<p>test001</p>','2021-07-24 14:48:13','2021-07-24 22:53:14');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1418827632270659585','<p>aa</p>','2021-07-24 14:57:23','2021-07-24 15:49:03');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419136160680120321','<p>邮箱管理，让你学会管理繁杂的邮件！</p>','2021-07-25 11:23:22','2021-07-25 11:51:49');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419136677221240834','<p>时间管理，让你更好利用时间</p>','2021-07-25 11:25:25','2021-07-25 11:26:12');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419137497417388034','<p><strong>大牛教学，实力非凡！</strong></p>','2021-07-25 11:28:40','2021-07-25 11:29:39');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419138292502237185','<p><strong>大牛教学，实力非凡！</strong></p>','2021-07-25 11:31:50','2021-07-25 11:50:01');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419138642986668033','<p>SSM框架入门</p>','2021-07-25 11:33:13','2021-07-25 11:33:13');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419139495634145281','<p>steam折扣学</p>','2021-07-25 11:36:37','2021-07-25 11:52:41');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419140595082858497','<p>maven 入门</p>','2021-07-25 11:40:59','2021-07-25 11:53:42');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('1419141455724679170','<p><strong>涵盖RabbitMQ，Nginx，RocketMQ等等常用服务器中间件的大牛教学！<img src=\"static/tinymce4.7.5/plugins/emoticons/img/smiley-cool.gif\" alt=\"cool\" /></strong></p>','2021-07-25 11:44:24','2021-07-25 11:44:24');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('15','','2019-03-13 06:03:33','2019-03-13 06:04:22');
insert  into `edu_course_description`(`id`,`description`,`gmt_create`,`gmt_modified`) values ('18','<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>\n<p>------------------------------------</p>\n<p>视频特点：</p>\n<p>通过学习本Java视频教程，大家能够真正将Java基础知识学以致用、活学活用，构架Java编程思想，牢牢掌握\"源码级\"的Javase核心技术，并为后续JavaWeb等技术的学习奠定扎实基础。<br /><br />1.通俗易懂，细致入微：每个知识点高屋建瓴，深入浅出，简洁明了的说明问题<br />2.具实战性：全程真正代码实战，涵盖上百个企业应用案例及练习<br />3.深入：源码分析，更有 Java 反射、动态代理的实际应用等<br />4.登录官网，技术讲师免费在线答疑</p>','2019-03-06 18:06:36','2021-07-24 15:50:24');

/*Table structure for table `edu_subject` */

DROP TABLE IF EXISTS `edu_subject`;

CREATE TABLE `edu_subject` (
  `id` char(19) NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) NOT NULL COMMENT '类别名称',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程科目';

/*Data for the table `edu_subject` */

insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1101348944971091969','前端开发','0',3,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681118568449','后端开发','0',1,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681139539969','Java','1178214681118568449',1,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681210843137','JavaScript','1101348944971091969',4,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681231814658','云计算','0',5,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681252786178','Docker','1178214681231814658',5,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681294729217','Linux','1178214681231814658',6,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681324089345','系统/运维','0',7,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681353449473','Linux','1178214681324089345',7,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681382809602','Windows','1178214681324089345',8,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681399586817','数据库','0',9,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681428946945','MySQL','1178214681399586817',9,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681454112770','MongoDB','1178214681399586817',10,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681483472898','大数据','0',11,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681504444418','Hadoop','1178214681483472898',11,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681529610242','Spark','1178214681483472898',12,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681554776066','人工智能','0',13,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681584136193','Python','1178214681554776066',13,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681613496321','编程语言','0',14,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178214681626079234','Java','1178214681613496321',14,'2019-09-29 15:47:25','2019-09-29 15:47:25');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178585108407984130','Python','1178214681118568449',2,'2019-09-30 16:19:22','2019-09-30 16:19:22');
insert  into `edu_subject`(`id`,`title`,`parent_id`,`sort`,`gmt_create`,`gmt_modified`) values ('1178585108454121473','HTML/CSS','1101348944971091969',3,'2019-09-30 16:19:22','2019-09-30 16:19:22');

/*Table structure for table `edu_teacher` */

DROP TABLE IF EXISTS `edu_teacher`;

CREATE TABLE `edu_teacher` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `name` varchar(20) NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) unsigned NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='讲师';

/*Data for the table `edu_teacher` */

insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1','张三','近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站','高级',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297885942.jpg',0,0,'2019-10-30 14:18:46','2019-11-12 13:36:36');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1189389726308478977','晴天','高级讲师简介','高级讲师资历',2,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297919077.jpg',1,0,'2019-10-30 11:53:03','2019-10-30 11:53:03');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1189390295668469762','李刚','高级讲师简介','高级讲师',2,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297927029.jpg',2,0,'2019-10-30 11:55:19','2019-11-12 13:37:52');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1189426437876985857','王二','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297935589.jpg',0,0,'2019-10-30 14:18:56','2019-11-12 13:37:35');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1189426464967995393','王五','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297957332.jpg',0,0,'2019-10-30 14:19:02','2019-11-12 13:37:18');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1192249914833055746','李四','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297969808.jpg',0,0,'2019-11-07 09:18:25','2019-11-12 13:37:01');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('15164899841165198','冯星','高级讲师简介','特级教授',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297957332.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('165165','钟汉良','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297969808.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('46546','张杰','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297969808.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('4654897','胡歌','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297969808.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('545466465','周杰伦','高级讲师简介','高级讲师',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297957332.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('55944895646515156','翟威涛','高级讲师简介','特级教授',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297977255.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('561879879848465','刘德育','高级讲师简介','特级教授',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297987091.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('598987984665135156','王雨柯','高级讲师简介','特级教授',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442298121626.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');
insert  into `edu_teacher`(`id`,`name`,`intro`,`career`,`level`,`avatar`,`sort`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('649877984848946','周俊荣','高级讲师简介','特级教授',1,'https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/teacher/1442297977255.jpg',0,0,'2021-07-18 10:29:54','2021-07-22 10:29:56');

/*Table structure for table `edu_video` */

DROP TABLE IF EXISTS `edu_video`;

CREATE TABLE `edu_video` (
  `id` char(19) NOT NULL COMMENT '视频ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) NOT NULL COMMENT '章节ID',
  `title` varchar(50) NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
  `is_free` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE,
  KEY `idx_chapter_id` (`chapter_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='课程视频';

/*Data for the table `edu_video` */

insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418829878706315266','1418827632270659585','1418827653762273281','s1','ed7035c8daed4a57b092181d340382e8','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-24 15:06:18','2021-07-24 15:06:18');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418830363806932993','1418827632270659585','1418827653762273281','s2','72f62289485d4d599c25f671220a1cc8','test.mp4',5,0,0,0,'Empty',0,1,'2021-07-24 15:08:14','2021-07-24 15:30:07');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418834131592220674','1418827632270659585','1418827653762273281','abcd','0077bc45b8a04149868e2d7e6deed486','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-24 15:23:12','2021-07-24 15:23:12');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418835774299815937','1418827632270659585','1418827653762273281','test.0','c4f597d547ca4684a7c0723edeef8b62','test.mp4',2,0,0,0,'Empty',0,1,'2021-07-24 15:29:44','2021-07-24 15:29:57');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418841074721402881','18','15','1-1','9ddfc9aa0faa402c924c37da0aa01ebc','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-24 15:50:48','2021-07-24 15:50:48');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418941788349132802','14','1','1-1','58da8a278ec244a38c96a978f045e039','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-24 22:31:00','2021-07-24 22:31:00');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418947166650626050','14','1','1-2','5c942442d5714c11abe0a53b47826700','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-24 22:52:22','2021-07-24 22:52:22');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418948247216484354','1418825326766620674','1418948108846395394','1-1','a514ba4bb68d4eaabf74e91426e17138','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-24 22:56:40','2021-07-24 22:56:40');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1418948302635823105','1418825326766620674','1418948108846395394','1-2','10f401754d8f4e318f6d33d147b77e91','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-24 22:56:53','2021-07-24 22:56:53');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419136302934134785','1419136160680120321','1419136189620817922','1-1','81300a1cfab14faa8b2b0e1c988d99c6','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:23:56','2021-07-25 11:23:56');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419136346085134338','1419136160680120321','1419136189620817922','1-2','2c58e39ad0224c2bb48617e71ff685ee','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:24:06','2021-07-25 11:24:06');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419136377441751042','1419136160680120321','1419136218565709826','2-1','1da0658dafd540a1858caa0be9d5fe56','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:24:13','2021-07-25 11:24:13');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419136405606502402','1419136160680120321','1419136218565709826','2-2','ceb0a4ed85af4c389b8fb8e45e6e2e97','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:24:20','2021-07-25 11:24:20');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419136831739400193','1419136677221240834','1419136733496217601','1-1','a15c7d5280a94eb3b9f42f9a42fc779c','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:26:02','2021-07-25 11:26:02');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419137634483048450','1419137497417388034','1419137523677925377','第一节','d2203353c8d94ab1b4bf052ba899ec38','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:29:13','2021-07-25 11:29:13');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419137974322335746','1415475024315330561','1419137874774724609','1-1','1f26f3604b664d13b68533bf484d5104','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:30:34','2021-07-25 11:30:34');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419138415965769730','1419138292502237185','1419138315084369922','1-1','a66a623d90224372a7558859249a11e1','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:32:19','2021-07-25 11:32:19');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419138773458882562','1419138642986668033','1419138675710627841','第一节','fddd53657d454a7abadf8ca861c45352','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:33:45','2021-07-25 11:33:45');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419139586621181953','1419139495634145281','1419139519722033153','第一节','45900368359241dfbdc9500fdfee448f','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:36:58','2021-07-25 11:36:58');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419140776838828034','1419140595082858497','1419140622526189569','1-1','6364aca96b4041ee9e0b7cbc77c5d485','test.mp4',0,0,0,0,'Empty',0,1,'2021-07-25 11:41:42','2021-07-25 11:41:42');
insert  into `edu_video`(`id`,`course_id`,`chapter_id`,`title`,`video_source_id`,`video_original_name`,`sort`,`play_count`,`is_free`,`duration`,`status`,`size`,`version`,`gmt_create`,`gmt_modified`) values ('1419141584338817025','1419141455724679170','1419141477337927681','1-1','2936a2796e684af7b9aece42c9d71cce','test.mp4',1,0,0,0,'Empty',0,1,'2021-07-25 11:44:55','2021-07-25 11:44:55');

/*Table structure for table `statistics_daily` */

DROP TABLE IF EXISTS `statistics_daily`;

CREATE TABLE `statistics_daily` (
  `id` char(19) NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT '0' COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增课程数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `statistics_day` (`date_calculated`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站统计日数据';

/*Data for the table `statistics_daily` */

insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1078490017163833345','2018-12-28',0,0,154,170,'2018-12-28 11:17:12','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1087142127818768386','2019-01-02',2,0,167,177,'2019-01-21 08:17:36','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1087198321809457153','2019-01-01',1,0,130,189,'2019-01-21 12:00:54','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1087198383973236738','2019-01-03',0,0,114,130,'2019-01-21 12:01:09','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1087451681764982785','2019-01-04',0,0,118,155,'2019-01-22 04:47:39','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1087455336471785473','2019-01-05',0,0,184,186,'2019-01-22 05:02:11','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105339962460491777','2019-03-01',0,143,168,136,'2019-03-12 13:29:18','2019-03-12 13:29:18');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105339977027309569','2019-03-02',0,165,171,158,'2019-03-12 13:29:21','2019-03-12 13:29:21');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105339990738489346','2019-03-03',0,143,147,194,'2019-03-12 13:29:25','2019-03-12 13:29:25');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340000544772098','2019-03-04',0,155,106,153,'2019-03-12 13:29:27','2019-03-12 13:29:27');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340011244441602','2019-03-05',0,186,102,155,'2019-03-12 13:29:30','2019-03-12 13:29:30');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340020929089538','2019-03-06',0,140,192,129,'2019-03-12 13:29:32','2019-03-12 13:29:32');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340029800042497','2019-03-07',0,186,139,116,'2019-03-12 13:29:34','2019-03-12 13:29:34');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340038696161282','2019-03-08',0,120,166,112,'2019-03-12 13:29:36','2019-03-12 13:29:36');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340049441968129','2019-03-09',0,182,147,119,'2019-03-12 13:29:39','2019-03-12 13:29:39');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340059738984449','2019-03-10',0,199,141,103,'2019-03-12 13:29:41','2019-03-12 13:29:41');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340070438653953','2019-03-11',0,127,137,156,'2019-03-12 13:29:44','2019-03-12 13:29:44');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340080307851266','2019-03-12',0,167,123,132,'2019-03-12 13:29:46','2019-03-12 13:29:46');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340090047025153','2019-03-13',0,106,132,103,'2019-03-12 13:29:48','2019-03-12 13:29:48');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340100075606017','2019-03-14',0,166,180,118,'2019-03-12 13:29:51','2019-03-12 13:29:51');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340110511034370','2019-03-15',0,114,151,185,'2019-03-12 13:29:53','2019-03-12 13:29:53');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340121412030466','2019-03-16',0,134,105,126,'2019-03-12 13:29:56','2019-03-12 13:29:56');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340132833120258','2019-03-17',0,169,106,131,'2019-03-12 13:29:59','2019-03-12 13:29:59');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340145659301890','2019-03-18',0,120,106,163,'2019-03-12 13:30:02','2019-03-12 13:30:02');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340153578147842','2019-03-19',0,146,155,153,'2019-03-12 13:30:03','2019-03-12 13:30:03');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340162436517890','2019-03-20',0,127,181,186,'2019-03-12 13:30:06','2019-03-12 13:30:06');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340171517186050','2019-03-21',0,106,134,145,'2019-03-12 13:30:08','2019-03-12 13:30:08');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340181034061825','2019-03-22',0,161,182,143,'2019-03-12 13:30:10','2019-03-12 13:30:10');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340190072786946','2019-03-23',0,183,101,182,'2019-03-12 13:30:12','2019-03-12 13:30:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340199426084865','2019-03-24',0,117,100,102,'2019-03-12 13:30:14','2019-03-12 13:30:14');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340209261727745','2019-03-25',0,116,103,160,'2019-03-12 13:30:17','2019-03-12 13:30:17');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340217935548418','2019-03-26',0,101,119,150,'2019-03-12 13:30:19','2019-03-12 13:30:19');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340225967640577','2019-03-27',0,129,141,181,'2019-03-12 13:30:21','2019-03-12 13:30:21');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340234075230209','2019-03-28',0,113,179,158,'2019-03-12 13:30:23','2019-03-12 13:30:23');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340242837131265','2019-03-29',0,117,131,101,'2019-03-12 13:30:25','2019-03-12 13:30:25');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340252395950082','2019-03-30',0,153,187,174,'2019-03-12 13:30:27','2019-03-12 13:30:27');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105340261958963201','2019-03-31',0,179,135,199,'2019-03-12 13:30:29','2019-03-12 13:30:29');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372743634898945','2019-01-06',0,113,143,148,'2019-03-12 15:39:34','2019-03-12 15:39:34');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372754380705793','2019-01-07',0,173,158,153,'2019-03-12 15:39:36','2019-03-12 15:39:36');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372762526044162','2019-01-08',0,135,199,131,'2019-03-12 15:39:38','2019-03-12 15:39:38');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372771229224961','2019-01-09',0,161,107,162,'2019-03-12 15:39:40','2019-03-12 15:39:40');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372780922261505','2019-01-10',0,182,196,135,'2019-03-12 15:39:42','2019-03-12 15:39:42');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372790103592961','2019-01-11',0,123,194,102,'2019-03-12 15:39:45','2019-03-12 15:39:45');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1105372798626418689','2019-01-12',0,185,106,180,'2019-03-12 15:39:47','2019-03-12 15:39:47');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1165','2018-01-01',583,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1166','2018-01-02',583,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1167','2018-01-03',584,26,236,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1168','2018-01-04',584,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1169','2018-01-05',585,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1170','2018-01-06',585,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1171','2018-01-07',586,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1172','2018-01-08',586,26,237,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1173','2018-01-09',587,26,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1174','2018-01-10',587,26,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1175','2018-01-11',588,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1176','2018-01-12',588,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1177','2018-01-13',589,27,238,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1178','2018-01-14',589,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1179','2018-01-15',590,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1180','2018-01-16',590,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1181','2018-01-17',591,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1182','2018-01-18',591,27,239,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183','2018-01-19',592,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183991737299263490','2019-10-01',0,145,149,153,'2019-10-15 14:23:22','2019-10-15 14:23:22');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999299272904705','2019-10-03',0,125,102,153,'2019-10-15 14:53:25','2019-10-15 14:53:25');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999309477646338','2019-10-04',0,103,194,161,'2019-10-15 14:53:28','2019-10-15 14:53:28');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999318919024642','2019-10-05',0,173,174,147,'2019-10-15 14:53:30','2019-10-15 14:53:30');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999331409661954','2019-10-06',0,129,197,173,'2019-10-15 14:53:33','2019-10-15 14:53:33');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999342897860610','2019-10-07',0,184,125,169,'2019-10-15 14:53:36','2019-10-15 14:53:36');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999351588458498','2019-10-08',0,173,143,138,'2019-10-15 14:53:38','2019-10-15 14:53:38');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999360316805122','2019-10-09',0,161,158,117,'2019-10-15 14:53:40','2019-10-15 14:53:40');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1183999367480676353','2019-10-10',0,190,166,135,'2019-10-15 14:53:42','2019-10-15 14:53:42');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1184','2018-01-20',592,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1184030117693284353','2019-10-11',0,182,199,193,'2019-10-15 16:55:53','2019-10-15 16:55:53');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1185','2018-01-21',593,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1185373213064482818','2019-01-19',6,135,126,167,'2019-10-19 09:52:52','2019-10-19 09:52:52');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1186','2018-01-22',593,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1186536619937435650','2019-10-02',0,187,183,108,'2019-10-22 14:55:50','2019-10-22 14:55:50');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1187','2018-01-23',594,27,240,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1188','2018-01-24',594,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1189','2018-01-25',595,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1190','2018-01-26',595,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1191','2018-01-27',596,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1192','2018-01-28',596,27,241,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1192253597226455042','2019-11-01',0,129,122,167,'2019-11-07 09:33:03','2019-11-07 09:33:03');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1192253902756335617','2019-11-02',0,170,192,192,'2019-11-07 09:34:16','2019-11-07 09:34:16');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1193','2018-01-29',597,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1194','2018-01-30',597,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1194060032935493633','2019-11-11',0,121,121,122,'2019-11-12 09:11:11','2019-11-12 09:11:11');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1194060301425475585','2019-11-10',0,155,187,140,'2019-11-12 09:12:15','2019-11-12 09:12:15');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1195','2018-01-31',598,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1196','2018-02-01',598,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1197','2018-02-02',599,27,242,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1198','2018-02-03',599,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1199','2018-02-04',600,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1200','2018-02-05',600,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1201','2018-02-06',601,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1202','2018-02-07',601,27,243,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1203','2018-02-08',602,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1204','2018-02-09',602,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1205','2018-02-10',603,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1206','2018-02-11',603,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1207','2018-02-12',604,27,244,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1208','2018-02-13',604,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1209','2018-02-14',605,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1210','2018-02-15',605,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1211','2018-02-16',606,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1212','2018-02-17',606,27,245,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1213','2018-02-18',607,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1214','2018-02-19',607,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1215','2018-02-20',608,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1216','2018-02-21',608,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1217','2018-02-22',609,27,246,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1218','2018-02-23',609,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1219','2018-02-24',610,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1220','2018-02-25',610,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1221','2018-02-26',611,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1222','2018-02-27',611,27,247,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1223','2018-02-28',612,27,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1224','2018-03-01',612,27,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1225','2018-03-02',613,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1226','2018-03-03',613,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1227','2018-03-04',614,28,248,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1228','2018-03-05',614,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1229','2018-03-06',615,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1230','2018-03-07',615,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1231','2018-03-08',616,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1232','2018-03-09',616,28,249,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1233','2018-03-10',617,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1234','2018-03-11',617,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1235','2018-03-12',618,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1236','2018-03-13',618,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1237','2018-03-14',619,28,250,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1238','2018-03-15',619,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1239','2018-03-16',620,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1240','2018-03-17',620,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1241','2018-03-18',621,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1242','2018-03-19',621,28,251,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1243','2018-03-20',622,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1244','2018-03-21',622,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1245','2018-03-22',623,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1246','2018-03-23',623,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1247','2018-03-24',624,28,252,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1248','2018-03-25',624,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1249','2018-03-26',625,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1250','2018-03-27',625,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1251','2018-03-28',626,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1252','2018-03-29',626,28,253,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1253','2018-03-30',627,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1254','2018-03-31',627,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1255','2018-04-01',628,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1256','2018-04-02',628,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1257','2018-04-03',629,28,254,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1258','2018-04-04',629,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1259','2018-04-05',630,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1260','2018-04-06',630,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1261','2018-04-07',631,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1262','2018-04-08',631,28,255,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1263','2018-04-09',632,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1264','2018-04-10',632,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1265','2018-04-11',633,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1266','2018-04-12',633,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1267','2018-04-13',634,28,256,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1268','2018-04-14',634,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1269','2018-04-15',635,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1270','2018-04-16',635,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1271','2018-04-17',636,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1272','2018-04-18',636,28,257,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1273','2018-04-19',637,28,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1274','2018-04-20',637,28,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1275','2018-04-21',638,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1276','2018-04-22',638,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1277','2018-04-23',639,29,258,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1278','2018-04-24',639,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1279','2018-04-25',640,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1280','2018-04-26',640,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1281','2018-04-27',641,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1282','2018-04-28',641,29,259,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1283','2018-04-29',642,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1284','2018-04-30',642,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1285','2018-05-01',643,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1286','2018-05-02',643,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1287','2018-05-03',644,29,260,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1288','2018-05-04',644,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1289','2018-05-05',645,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1290','2018-05-06',645,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1291','2018-05-07',646,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1292','2018-05-08',646,29,261,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1293','2018-05-09',647,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1294','2018-05-10',647,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1295','2018-05-11',648,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1296','2018-05-12',648,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1297','2018-05-13',649,29,262,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1298','2018-05-14',649,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1299','2018-05-15',5,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1300','2018-05-16',650,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1301','2018-05-17',651,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1302','2018-05-18',651,29,263,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1303','2018-05-19',652,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1304','2018-05-20',652,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1305','2018-05-21',653,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1306','2018-05-22',1,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1307','2018-05-23',654,29,264,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1308','2018-05-24',654,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1309','2018-05-25',1,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1310','2018-05-26',655,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1311','2018-05-27',656,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1312','2018-05-28',656,29,265,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1313','2018-05-29',657,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1314','2018-05-30',657,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1315','2018-05-31',658,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1316','2018-06-01',658,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1317','2018-06-02',659,29,266,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1318','2018-06-03',659,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1319','2018-06-04',660,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1320','2018-06-05',660,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1321','2018-06-06',661,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1322','2018-06-07',661,29,267,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1323','2018-06-08',662,29,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1324','2018-06-09',662,29,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1325','2018-06-10',663,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1326','2018-06-11',663,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1327','2018-06-12',664,30,268,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1328','2018-06-13',664,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1329','2018-06-14',665,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1330','2018-06-15',665,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1331','2018-06-16',666,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1332','2018-06-17',666,30,269,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1333','2018-06-18',667,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1334','2018-06-19',667,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1335','2018-06-20',668,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1336','2018-06-21',668,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1337','2018-06-22',669,30,270,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1338','2018-06-23',669,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1339','2018-06-24',670,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1340','2018-06-25',670,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1341','2018-06-26',671,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1342','2018-06-27',671,30,271,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1343','2018-06-28',672,30,272,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1344','2018-06-29',672,30,272,14,'2018-01-25 06:38:19','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1345','2018-06-30',673,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1346','2018-07-01',673,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1347','2018-07-02',674,30,272,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1348','2018-07-03',674,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1349','2018-07-04',675,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1350','2018-07-05',675,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1351','2018-07-06',676,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1352','2018-07-07',676,30,273,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1353','2018-07-08',677,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1354','2018-07-09',677,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1355','2018-07-10',678,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1356','2018-07-11',678,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1357','2018-07-12',679,30,274,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1358','2018-07-13',679,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1359','2018-07-14',680,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1360','2018-07-15',680,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1361','2018-07-16',681,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1362','2018-07-17',681,30,275,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1363','2018-07-18',682,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1364','2018-07-19',682,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1365','2018-07-20',683,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1366','2018-07-21',683,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1367','2018-07-22',684,30,276,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1368','2018-07-23',684,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1369','2018-07-24',685,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1370','2018-07-25',685,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1371','2018-07-26',686,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1372','2018-07-27',686,30,277,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1373','2018-07-28',687,30,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1374','2018-07-29',687,30,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1375','2018-07-30',688,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1376','2018-07-31',688,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1377','2018-08-01',689,31,278,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1378','2018-08-02',689,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1379','2018-08-03',690,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1380','2018-08-04',690,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1381','2018-08-05',691,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1382','2018-08-06',691,31,279,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1383','2018-08-07',692,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1384','2018-08-08',692,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1385','2018-08-09',1,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1386','2018-08-10',693,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1387','2018-08-11',694,31,280,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1388','2018-08-12',694,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1389','2018-08-13',695,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1390','2018-08-14',695,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1391','2018-08-15',696,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1392','2018-08-16',696,31,281,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1393','2018-08-17',697,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1394','2018-08-18',697,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1395','2018-08-19',698,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1396','2018-08-20',698,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1397','2018-08-21',699,31,282,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1398','2018-08-22',699,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1399','2018-08-23',700,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1400','2018-08-24',700,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1401','2018-08-25',701,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1402','2018-08-26',701,31,283,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1403','2018-08-27',702,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1404','2018-08-28',702,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1405','2018-08-29',703,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1406','2018-08-30',703,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1407','2018-08-31',704,31,284,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1408','2018-09-01',1,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1409','2018-09-02',705,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1410','2018-09-03',705,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1411','2018-09-04',706,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1412','2018-09-05',706,31,285,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1413','2018-09-06',707,31,286,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1414','2018-09-07',707,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1415','2018-09-08',708,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1416','2018-09-09',1,31,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417','2018-09-10',1,31,2,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417449566831165442','2001-5-6',0,134,137,166,'2021-07-20 19:41:26','2021-07-20 19:41:26');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417453996729221121','2021-07-23',0,177,110,154,'2021-07-20 19:59:03','2021-07-20 19:59:03');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417454199217635330','2021-07-16',0,109,196,190,'2021-07-20 19:59:51','2021-07-20 19:59:51');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417773688412962817','2021-07-13',0,107,166,152,'2021-07-21 17:09:23','2021-07-21 17:09:23');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1417773719681499137','2021-07-02',0,114,188,193,'2021-07-21 17:09:30','2021-07-21 17:09:30');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418','2018-09-11',709,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418959508058681346','2021-07-09',0,149,101,176,'2021-07-24 23:41:24','2021-07-24 23:41:24');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418959969247571970','2021-07-07',0,189,177,160,'2021-07-24 23:43:14','2021-07-24 23:43:14');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418960944536498177','2021-06-29',0,110,104,141,'2021-07-24 23:47:07','2021-07-24 23:47:07');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418961146202828801','2021-07-30',0,187,109,105,'2021-07-24 23:47:55','2021-07-24 23:47:55');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1418961437912477697','2021-07-19',0,159,187,186,'2021-07-24 23:49:04','2021-07-24 23:49:04');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1419','2018-09-12',710,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1420','2018-09-13',710,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1421','2018-09-14',711,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1422','2018-09-15',711,31,287,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1423','2018-09-16',712,31,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1424','2018-09-17',712,31,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1425','2018-09-18',713,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1426','2018-09-19',713,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1427','2018-09-20',714,32,288,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1428','2018-09-21',714,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1429','2018-09-22',715,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1430','2018-09-23',715,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1431','2018-09-24',716,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1432','2018-09-25',716,32,289,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1433','2018-09-26',717,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1434','2018-09-27',717,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1435','2018-09-28',718,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1436','2018-09-29',718,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1437','2018-09-30',719,32,290,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1438','2018-10-01',719,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1439','2018-10-02',720,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1440','2018-10-03',720,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1441','2018-10-04',721,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1442','2018-10-05',721,32,291,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1443','2018-10-06',722,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1444','2018-10-07',722,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1445','2018-10-08',1,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1446','2018-10-09',723,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1447','2018-10-10',724,32,292,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1448','2018-10-11',724,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1449','2018-10-12',725,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1450','2018-10-13',725,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1451','2018-10-14',726,32,4,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1452','2018-10-15',726,32,293,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1453','2018-10-16',727,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1454','2018-10-17',727,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1455','2018-10-18',728,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1456','2018-10-19',728,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1457','2018-10-20',729,32,294,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1458','2018-10-21',729,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1459','2018-10-22',730,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1460','2018-10-23',730,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1461','2018-10-24',731,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1462','2018-10-25',731,32,295,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1463','2018-10-26',732,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1464','2018-10-27',732,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1465','2018-10-28',733,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1466','2018-10-29',2,32,3,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1467','2018-10-30',734,32,296,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1468','2018-10-31',734,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1469','2018-11-01',735,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1470','2018-11-02',735,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1471','2018-11-03',1,32,297,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1472','2018-11-04',736,32,1,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1473','2018-11-05',737,32,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1474','2018-11-06',737,32,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1475','2018-11-07',738,33,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1476','2018-11-08',738,33,169,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1477','2018-11-09',1,33,298,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1478','2018-11-10',739,33,78,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1479','2018-11-11',740,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1480','2018-11-12',740,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1481','2018-11-13',741,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1482','2018-11-14',741,33,299,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1483','2018-11-15',742,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1484','2018-11-16',742,33,35,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1485','2018-11-17',743,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1486','2018-11-18',743,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1487','2018-11-19',744,33,300,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1488','2018-11-20',744,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1489','2018-11-21',745,33,234,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1490','2018-11-22',456,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1491','2018-11-23',746,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1492','2018-11-24',746,33,301,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1493','2018-11-25',747,33,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1494','2018-11-26',747,4,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1495','2018-11-27',748,33,302,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1496','2018-11-28',748,33,36,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1497','2018-11-29',749,33,302,2,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1498','2018-11-30',749,3,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1499','2018-12-01',750,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1500','2018-12-02',234,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1501','2018-12-03',751,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1502','2018-12-04',751,33,303,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1503','2018-12-05',752,6,304,33,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1505','2018-12-07',753,33,55,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1506','2018-12-08',753,33,304,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1507','2018-12-09',754,33,304,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1508','2018-12-10',754,1,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1509','2018-12-11',755,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1510','2018-12-12',755,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1511','2018-12-13',756,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1512','2018-12-14',366,33,305,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1513','2018-12-15',757,33,66,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1514','2018-12-16',757,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1515','2018-12-17',758,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1516','2018-12-18',758,2,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1517','2018-12-19',759,33,306,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1518','2018-12-20',564,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1519','2018-12-21',760,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1520','2018-12-22',760,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1521','2018-12-23',761,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1522','2018-12-24',761,33,307,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1527','2018-12-29',764,34,308,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1528','2018-12-30',764,34,309,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1529','2018-12-31',765,34,309,14,'2018-01-25 06:38:20','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1554','2018-01-01',333,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1555','2018-01-02',778,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1556','2018-01-03',778,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1557','2018-01-04',779,34,314,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1558','2018-01-05',779,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1559','2018-01-06',780,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1560','2018-01-07',780,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1561','2018-01-08',781,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1562','2018-01-09',781,34,315,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1563','2018-01-10',782,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1564','2018-01-11',782,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1565','2018-01-12',783,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1566','2018-01-13',783,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1567','2018-01-14',784,34,316,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1568','2018-01-15',784,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1569','2018-01-16',23,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1570','2018-01-17',785,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1571','2018-01-18',786,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1572','2018-01-19',786,34,317,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1573','2018-01-20',787,2,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1574','2018-01-21',787,2,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1575','2018-01-22',788,1,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1576','2018-01-23',788,35,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1577','2018-01-24',789,35,318,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1578','2018-01-25',789,1,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1579','2018-01-26',790,1,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1580','2018-01-27',531,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1581','2018-01-28',791,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1582','2018-01-29',791,2,319,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1583','2018-01-30',2,4,2,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1584','2018-01-31',792,35,320,14,'2018-02-02 08:58:31','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1586','2018-02-01',793,4,3,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1587','2018-02-02',794,2,1,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1588','2018-02-03',794,1,4,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1589','2018-02-04',795,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1590','2018-02-05',795,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1591','2018-02-06',796,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1592','2018-02-07',796,35,321,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1593','2018-02-08',797,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1594','2018-02-09',797,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1595','2018-02-10',99,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1596','2018-02-11',798,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1597','2018-02-12',799,35,322,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1598','2018-02-13',799,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1599','2018-02-14',800,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1600','2018-02-15',800,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1601','2018-02-16',89,35,90,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1602','2018-02-17',801,35,323,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1603','2018-02-18',802,23,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1604','2018-02-19',802,2,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1605','2018-02-20',803,56,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1606','2018-02-21',45,35,89,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1607','2018-02-22',804,35,324,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1608','2018-02-23',804,35,325,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1609','2018-02-24',805,1,3,14,'2018-02-25 10:54:34','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1610','2018-05-15',0,0,0,7,'2018-05-16 00:25:27','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1611','2018-10-01',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1612','2018-10-02',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1613','2018-10-03',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1614','2018-10-04',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');
insert  into `statistics_daily`(`id`,`date_calculated`,`register_num`,`login_num`,`video_view_num`,`course_num`,`gmt_create`,`gmt_modified`) values ('1615','2018-10-05',0,0,0,7,'2018-10-24 16:17:15','2019-09-09 12:12:12');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
  `teacher_id` varchar(50) DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '订单金额（分）',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_order_no` (`order_no`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE,
  KEY `idx_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单';

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417417971353051137','20210720173552609','1415475024315330561','Python精品课程','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295455437.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.01',1,1,0,'2021-07-20 17:35:53','2021-07-20 17:36:46');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417418774704836609','20210720173903505','18','Java精品课程','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295581911.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.00',1,0,0,'2021-07-20 17:39:05','2021-07-20 17:39:05');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417424563699994626','20210720180205755','15','HTML5入门课程学习','\r\nhttps://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295556203.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.01',1,0,0,'2021-07-20 18:02:05','2021-07-20 18:02:05');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417424590166052865','20210720180211751','14','Jquery入门学习','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295527931.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.01',1,0,0,'2021-07-20 18:02:11','2021-07-20 18:02:11');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417425865028947970','20210720180715332','14','Jquery入门学习','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295527931.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.01',1,0,0,'2021-07-20 18:07:15','2021-07-20 18:07:15');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417425949305098241','20210720180735232','15','HTML5入门课程学习','\r\nhttps://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295556203.jpg','1189389726308478977','1416227615462748162','123116516','17364612480','0.01',1,0,0,'2021-07-20 18:07:35','2021-07-20 18:07:35');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417776225337786370','20210721171926539','1417690489733332993','test101','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/21/b3050bc61bd54b9cb247c1782057ab78x5.jpg','1','1416227615462748162','123116516','17364612480','1.00',1,0,0,'2021-07-21 17:19:28','2021-07-21 17:19:28');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417776247450157058','20210721171933769','1417690489733332993','test101','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/21/b3050bc61bd54b9cb247c1782057ab78x5.jpg','1','1416227615462748162','123116516','17364612480','1.00',1,0,0,'2021-07-21 17:19:33','2021-07-21 17:19:33');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417776670005387266','20210721172112307','1417690489733332993','test101','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course-cover/2021/07/21/b3050bc61bd54b9cb247c1782057ab78x5.jpg','1','1416227615462748162','123116516','17364612480','0.01',1,1,0,'2021-07-21 17:21:14','2021-07-21 17:21:49');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419166045813379074','20210725132205988','1415475024315330561','Python精品课程','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295455437.jpg','1189389726308478977','1419158984216145921','超级管理员','17364612480','0.01',1,0,0,'2021-07-25 13:22:07','2021-07-25 13:22:07');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419166834787127298','20210725132514823','14','Jquery入门学习','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295527931.jpg','1189389726308478977','1419158984216145921','超级管理员','17364612480','0.01',1,1,0,'2021-07-25 13:25:15','2021-07-25 13:25:35');
insert  into `t_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_id`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419167273402273793','20210725132659759','14','Jquery入门学习','https://guli-college-for-june.oss-cn-beijing.aliyuncs.com/course/1442295527931.jpg','1189389726308478977','1416370581095411713','Я','','0.01',1,0,0,'2021-07-25 13:26:59','2021-07-25 13:26:59');

/*Table structure for table `t_pay_log` */

DROP TABLE IF EXISTS `t_pay_log`;

CREATE TABLE `t_pay_log` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '支付金额（分）',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text COMMENT '其他属性',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付日志表';

/*Data for the table `t_pay_log` */

insert  into `t_pay_log`(`id`,`order_no`,`pay_time`,`total_fee`,`transaction_id`,`trade_state`,`pay_type`,`attr`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417418191721783299','20210720173552609','2021-07-20 17:36:46','0.01','4200001160202107207916895481','SUCCESS',1,'{\"transaction_id\":\"4200001160202107207916895481\",\"nonce_str\":\"fiKdh5NJE2bkGURn\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuCBsqMojoPw9oVerY7gYpgs\",\"sign\":\"D717859A7F5BFD484F45D07ADF66F7D4\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20210720173552609\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20210720173610\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2021-07-20 17:36:46','2021-07-20 17:36:46');
insert  into `t_pay_log`(`id`,`order_no`,`pay_time`,`total_fee`,`transaction_id`,`trade_state`,`pay_type`,`attr`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1417776819217752065','20210721172112307','2021-07-21 17:21:49','0.01','4200001200202107219555229866','SUCCESS',1,'{\"transaction_id\":\"4200001200202107219555229866\",\"nonce_str\":\"rwSwDVRjrvVmPlEf\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuCBsqMojoPw9oVerY7gYpgs\",\"sign\":\"B9C848DD73A1DB85722F0910D4FA6336\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20210721172112307\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20210721172149\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2021-07-21 17:21:49','2021-07-21 17:21:49');
insert  into `t_pay_log`(`id`,`order_no`,`pay_time`,`total_fee`,`transaction_id`,`trade_state`,`pay_type`,`attr`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419166919029723138','20210725132514823','2021-07-25 13:25:35','0.01','4200001175202107257543694705','SUCCESS',1,'{\"transaction_id\":\"4200001175202107257543694705\",\"nonce_str\":\"CbhZlVvvYjRvdNNM\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuCBsqMojoPw9oVerY7gYpgs\",\"sign\":\"DCBBC5D439B62A738638E37D36175C6D\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20210725132514823\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20210725132533\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2021-07-25 13:25:35','2021-07-25 13:25:35');

/*Table structure for table `ucenter_member` */

DROP TABLE IF EXISTS `ucenter_member`;

CREATE TABLE `ucenter_member` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `openid` varchar(128) DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(3) unsigned DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

/*Data for the table `ucenter_member` */

insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1',NULL,'13700000001','96e79218965eb72c92a549dd5a330112','小三123',1,5,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-01 12:11:33','2019-11-08 11:56:01');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1080736474267144193',NULL,'13700000011','96e79218965eb72c92a549dd5a330112','用户XJtDfaYeKk',1,19,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-02 12:12:45','2019-01-02 12:12:56');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1080736474355224577',NULL,'13700000002','96e79218965eb72c92a549dd5a330112','用户wUrNkzAPrc',1,27,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-02 12:13:56','2019-01-02 12:14:07');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099449442306',NULL,'13520191388','96e79218965eb72c92a549dd5a330112','用户XTMUeHDAoj',2,20,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099520745473',NULL,'13520191389','96e79218965eb72c92a549dd5a330112','用户vSdKeDlimn',1,21,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099608825858',NULL,'13520191381','96e79218965eb72c92a549dd5a330112','用户EoyWUVXQoP',1,18,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099701100545',NULL,'13520191382','96e79218965eb72c92a549dd5a330112','用户LcAYbxLNdN',2,24,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099776598018',NULL,'13520191383','96e79218965eb72c92a549dd5a330112','用户dZdjcgltnk',2,25,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1086387099852095490',NULL,'13520191384','96e79218965eb72c92a549dd5a330112','用户wNHGHlxUwX',2,23,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106746895272849410','o1R-t5u2TfEVeVjO9CPGdHPNw-to',NULL,NULL,'檀梵\'',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 10:39:57','2019-03-16 10:39:57');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106822699956654081',NULL,NULL,NULL,NULL,NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 15:41:10','2019-03-16 15:41:10');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106823035660357634','o1R-t5i4gENwHYRb5lVFy98Z0bdk',NULL,NULL,'GaoSir',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 15:42:30','2019-03-16 15:42:30');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106823041599492098',NULL,NULL,NULL,NULL,NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 15:42:32','2019-03-16 15:42:32');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106823115788341250','o1R-t5l_3rnbZbn4jWwFdy6Gk6cg',NULL,NULL,'换个网名哇、',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 15:42:49','2019-03-16 15:42:49');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106826046730227714','o1R-t5gyxumyBqt0CWcnh0S6Ya1g',NULL,NULL,'我是Helen',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 15:54:28','2019-03-16 15:54:28');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106828185829490690','o1R-t5nNlou5lRwBVgGNJFm4rbc4',NULL,NULL,' 虎头',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:02:58','2019-03-16 16:02:58');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106830599651442689','o1R-t5hZHQB1cbX7HZJsiM727_SA',NULL,NULL,'是吴啊',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:12:34','2019-03-16 16:12:34');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106830976199278593','o1R-t5meKOoyEJ3-IhWRCBKFcvzU',NULL,NULL,'我才是Helen',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:14:03','2019-03-16 16:14:03');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106831936900415490','o1R-t5jXYSWakGtnUBnKbfVT5Iok',NULL,NULL,'文若姬',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:17:52','2019-03-16 16:17:52');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106832491064442882','o1R-t5sud081Qsa2Vb2xSKgGnf_g',NULL,NULL,'Peanut',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:20:04','2019-03-16 16:20:04');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1106833021442510849','o1R-t5lsGc3I8P5bDpHj7m_AIRvQ',NULL,NULL,'食物链终结者',NULL,NULL,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',NULL,0,0,'2019-03-16 16:22:11','2019-03-16 16:22:11');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1191600824445046786',NULL,'15210078344','96e79218965eb72c92a549dd5a330112','IT妖姬',1,5,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-05 14:19:10','2019-11-08 18:04:43');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1191616288114163713',NULL,'17866603606','96e79218965eb72c92a549dd5a330112','xiaowu',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-05 15:20:37','2019-11-05 15:20:37');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1195187659054329857',NULL,'15010546384','96e79218965eb72c92a549dd5a330112','qy',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-15 11:51:58','2019-11-15 11:51:58');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1416370581095411713','o3_SC58hHhu3HdGuPLxEyNBl9k5o','',NULL,'Я',NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/TicibT5ryib6O88ulBlCwibbKu5ias0ibZUQ7x8t8WROkVnQ8LmXJP67bpicR5lc08KF1QFiaJHVsHFqO2g5icEialAUSFNw/132',NULL,0,0,'2021-07-17 20:13:56','2021-07-17 20:13:56');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419158984216145921',NULL,'17364612480','202cb962ac59075b964b07152d234b70','超级管理员',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2021-07-25 12:54:03','2021-07-25 12:54:03');
insert  into `ucenter_member`(`id`,`openid`,`mobile`,`password`,`nickname`,`sex`,`age`,`avatar`,`sign`,`is_disabled`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1419924491475099649','o3_SC57bjSRL5AraXVI5wu4o8Ivo','',NULL,'??????',NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/GCibwibPAkCCvAHyEkfAhDGTZ3je59EoNO3OG5aUgk4xKO5QQIShGmo3icnNZNhibV9NMeu23CX3reKpRCRTqOD4Jw/132',NULL,0,0,'2021-07-27 15:35:54','2021-07-27 15:35:54');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
