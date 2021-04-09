# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.26)
# Database: mdlm_t3
# Generation Time: 2021-04-09 11:40:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table backend_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backend_layout`;

CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table be_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `be_groups`;

CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8_unicode_ci,
  `explicit_allowdeny` text COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8_unicode_ci,
  `db_mountpoints` text COLLATE utf8_unicode_ci,
  `pagetypes_select` text COLLATE utf8_unicode_ci,
  `tables_select` text COLLATE utf8_unicode_ci,
  `tables_modify` text COLLATE utf8_unicode_ci,
  `groupMods` text COLLATE utf8_unicode_ci,
  `file_mountpoints` text COLLATE utf8_unicode_ci,
  `file_permissions` text COLLATE utf8_unicode_ci,
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `subgroup` text COLLATE utf8_unicode_ci,
  `workspace_perms` smallint(6) NOT NULL DEFAULT '1',
  `category_perms` text COLLATE utf8_unicode_ci,
  `availableWidgets` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table be_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `be_sessions`;

CREATE TABLE `be_sessions` (
  `ses_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_data` longblob,
  `ses_backuserid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;

INSERT INTO `be_sessions` (`ses_id`, `ses_iplock`, `ses_userid`, `ses_tstamp`, `ses_data`, `ses_backuserid`)
VALUES
	('840906f1bf6b85a21feca1e25cf4beb5','[DISABLED]',1,1617968375,X'613A333A7B733A32363A22666F726D50726F74656374696F6E53657373696F6E546F6B656E223B733A36343A2233313838313835666531653539666333306236343861663335356264633336653430333332666237326561656633633962666266373835616530346362373435223B733A32373A22636F72652E74656D706C6174652E666C6173684D65737361676573223B4E3B733A35323A225459504F335C434D535C5265636F72646C6973745C436F6E74726F6C6C65725C5265636F72644C697374436F6E74726F6C6C6572223B613A313A7B733A31323A227365617263685F6669656C64223B733A303A22223B7D7D',0),
	('ed587a904a577831557027bb8aa5b6c0','[DISABLED]',1,1617918564,X'613A333A7B733A32363A22666F726D50726F74656374696F6E53657373696F6E546F6B656E223B733A36343A2265306135616162363332386662613431363931356663663437643339316264363436333161666539643332356166656462303536663533343761303563356264223B733A32373A22636F72652E74656D706C6174652E666C6173684D65737361676573223B4E3B733A35323A225459504F335C434D535C5265636F72646C6973745C436F6E74726F6C6C65725C5265636F72644C697374436F6E74726F6C6C6572223B613A313A7B733A31323A227365617263685F6669656C64223B733A303A22223B7D7D',0);

/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table be_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `be_users`;

CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usergroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8_unicode_ci,
  `options` smallint(5) unsigned NOT NULL DEFAULT '0',
  `realName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob,
  `file_mountpoints` text COLLATE utf8_unicode_ci,
  `file_permissions` text COLLATE utf8_unicode_ci,
  `workspace_perms` smallint(6) NOT NULL DEFAULT '1',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disableIPlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `createdByAction` int(11) NOT NULL DEFAULT '0',
  `usergroup_cached_list` text COLLATE utf8_unicode_ci,
  `workspace_id` int(11) NOT NULL DEFAULT '0',
  `category_perms` text COLLATE utf8_unicode_ci,
  `tx_news_categorymounts` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;

INSERT INTO `be_users` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `disable`, `starttime`, `endtime`, `description`, `username`, `avatar`, `password`, `admin`, `usergroup`, `lang`, `email`, `db_mountpoints`, `options`, `realName`, `userMods`, `allowed_languages`, `uc`, `file_mountpoints`, `file_permissions`, `workspace_perms`, `lockToDomain`, `disableIPlock`, `TSconfig`, `lastlogin`, `createdByAction`, `usergroup_cached_list`, `workspace_id`, `category_perms`, `tx_news_categorymounts`, `password_reset_token`)
VALUES
	(1,0,1617875018,1550930293,0,0,0,0,0,NULL,'idtypo3',0,'$2y$12$f1YIpb0zhLCXGFs6MBVqUODXQzlj.9nPxCjdNGLyJ/Rk8yT7oNLna',1,'','','',NULL,0,'',NULL,'',X'613A32363A7B733A31343A22696E746572666163655365747570223B733A373A226261636B656E64223B733A31303A226D6F64756C6544617461223B613A363A7B733A31303A227765625F6C61796F7574223B613A323A7B733A383A2266756E6374696F6E223B733A313A2231223B733A383A226C616E6775616765223B733A313A2230223B7D733A393A22636C6970626F617264223B613A353A7B733A363A226E6F726D616C223B613A323A7B733A323A22656C223B613A313A7B733A31343A2274745F636F6E74656E747C323135223B733A313A2231223B7D733A343A226D6F6465223B733A343A22636F7079223B7D733A353A227461625F31223B613A303A7B7D733A353A227461625F32223B613A303A7B7D733A353A227461625F33223B613A303A7B7D733A373A2263757272656E74223B733A363A226E6F726D616C223B7D733A31303A22466F726D456E67696E65223B613A323A7B693A303B613A313A7B733A33323A223836323035633539333532373062386565343133353932656331623632323932223B613A343A7B693A303B733A32353A224D61696E205479706F5363726970742052656E646572696E67223B693A313B613A353A7B733A343A2265646974223B613A313A7B733A31323A227379735F74656D706C617465223B613A313A7B693A313B733A343A2265646974223B7D7D733A373A2264656656616C73223B4E3B733A31323A226F7665727269646556616C73223B4E3B733A31313A22636F6C756D6E734F6E6C79223B4E3B733A363A226E6F56696577223B4E3B7D693A323B733A33353A2226656469742535427379735F74656D706C617465253544253542312535443D65646974223B693A333B613A353A7B733A353A227461626C65223B733A31323A227379735F74656D706C617465223B733A333A22756964223B693A313B733A333A22706964223B693A313B733A333A22636D64223B733A343A2265646974223B733A31323A2264656C657465416363657373223B623A313B7D7D7D693A313B733A33323A223836323035633539333532373062386565343133353932656331623632323932223B7D733A35373A225459504F335C434D535C4261636B656E645C5574696C6974795C4261636B656E645574696C6974793A3A6765745570646174655369676E616C223B613A303A7B7D733A383A227765625F6C697374223B613A303A7B7D733A32303A2273797374656D5F74787363686564756C65724D31223B613A313A7B733A383A2266756E6374696F6E223B733A393A227363686564756C6572223B7D7D733A31393A227468756D626E61696C73427944656661756C74223B693A313B733A31343A22656D61696C4D6541744C6F67696E223B693A303B733A383A227469746C654C656E223B733A323A223530223B733A383A22656469745F525445223B693A313B733A32303A22656469745F646F634D6F64756C6555706C6F6164223B693A313B733A31353A22726573697A65546578746172656173223B693A313B733A32353A22726573697A655465787461726561735F4D6178486569676874223B733A333A22353030223B733A32343A22726573697A655465787461726561735F466C657869626C65223B693A303B733A343A226C616E67223B733A303A22223B733A31393A2266697273744C6F67696E54696D655374616D70223B693A313630323233383839303B733A31353A226D6F64756C6553657373696F6E4944223B613A363A7B733A31303A227765625F6C61796F7574223B733A33323A223438383031373461643465396666353364343264313333346435613335306133223B733A393A22636C6970626F617264223B733A33323A223438383031373461643465396666353364343264313333346435613335306133223B733A31303A22466F726D456E67696E65223B733A34303A2263346636636536393166303966643433616637656432343335303436636263666664353239666135223B733A35373A225459504F335C434D535C4261636B656E645C5574696C6974795C4261636B656E645574696C6974793A3A6765745570646174655369676E616C223B733A34303A2263346636636536393166303966643433616637656432343335303436636263666664353239666135223B733A383A227765625F6C697374223B733A33323A223438383031373461643465396666353364343264313333346435613335306133223B733A32303A2273797374656D5F74787363686564756C65724D31223B733A34303A2263346636636536393166303966643433616637656432343335303436636263666664353239666135223B7D733A31373A224261636B656E64436F6D706F6E656E7473223B613A313A7B733A363A22537461746573223B613A313A7B733A383A225061676574726565223B613A313A7B733A393A22737461746548617368223B613A383A7B733A333A22305F31223B733A313A2231223B733A333A22305F36223B733A313A2231223B733A353A22305F313435223B733A313A2231223B733A333A22305F38223B733A313A2231223B733A343A22305F3230223B733A313A2231223B733A353A22305F313531223B733A313A2231223B733A353A22305F313333223B733A313A2231223B733A333A22305F33223B733A313A2231223B7D7D7D7D733A383A227265616C4E616D65223B733A303A22223B733A353A22656D61696C223B733A303A22223B733A383A2270617373776F7264223B733A303A22223B733A393A2270617373776F726432223B733A303A22223B733A363A22617661746172223B733A303A22223B733A31313A2273746172744D6F64756C65223B733A303A22223B733A32353A2273686F7748696464656E46696C6573416E64466F6C64657273223B693A303B733A31303A22636F70794C6576656C73223B733A303A22223B733A31353A2272656375727369766544656C657465223B693A303B733A31383A227265736574436F6E66696775726174696F6E223B733A303A22223B733A31313A226E6577736F7665726C6179223B733A313A2230223B733A32313A2268696465596F617374496E506167654D6F64756C65223B693A303B7D',NULL,NULL,1,'',0,NULL,1617965953,0,NULL,0,NULL,'',''),
	(2,0,1617874681,1617874681,0,0,0,0,0,NULL,'_cli_',0,'$2y$12$4hfujDoYcIukgIYKHWbwL.MAuCOTNVBVxzFLHHjVPk8OX628dC.e2',1,'','','',NULL,0,'',NULL,'',X'613A31323A7B733A31343A22696E746572666163655365747570223B733A303A22223B733A31303A226D6F64756C6544617461223B613A303A7B7D733A31393A227468756D626E61696C73427944656661756C74223B693A313B733A31343A22656D61696C4D6541744C6F67696E223B693A303B733A383A227469746C654C656E223B693A35303B733A383A22656469745F525445223B733A313A2231223B733A32303A22656469745F646F634D6F64756C6555706C6F6164223B733A313A2231223B733A31353A22726573697A65546578746172656173223B693A313B733A32353A22726573697A655465787461726561735F4D6178486569676874223B693A3530303B733A32343A22726573697A655465787461726561735F466C657869626C65223B693A303B733A343A226C616E67223B733A303A22223B733A31393A2266697273744C6F67696E54696D655374616D70223B693A313631373837343638313B7D',NULL,NULL,1,'',0,NULL,0,0,NULL,0,NULL,'','');

/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache_adminpanel_requestcache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_adminpanel_requestcache`;

CREATE TABLE `cache_adminpanel_requestcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_adminpanel_requestcache_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_adminpanel_requestcache_tags`;

CREATE TABLE `cache_adminpanel_requestcache_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_hash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_hash`;

CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;

INSERT INTO `cache_hash` (`id`, `identifier`, `expires`, `content`)
VALUES
	(1,'d07b003d9fce07cd551ada22027bf881',2145909600,X'613A333A7B733A383A226F7074696F6E732E223B613A383A7B733A31353A22656E61626C65426F6F6B6D61726B73223B733A313A2231223B733A31303A2266696C655F6C6973742E223B613A343A7B733A32383A22656E61626C65446973706C6179426967436F6E74726F6C50616E656C223B733A31303A2273656C65637461626C65223B733A32333A22656E61626C65446973706C61795468756D626E61696C73223B733A31303A2273656C65637461626C65223B733A31353A22656E61626C65436C6970426F617264223B733A31303A2273656C65637461626C65223B733A31303A227468756D626E61696C2E223B613A323A7B733A353A227769647468223B733A323A223634223B733A363A22686569676874223B733A323A223634223B7D7D733A393A2270616765547265652E223B613A313A7B733A33313A22646F6B7479706573546F53686F77496E4E6577506167654472616741726561223B733A32313A22312C362C342C372C332C3235342C3235352C313939223B7D733A31323A22636F6E746578744D656E752E223B613A313A7B733A363A227461626C652E223B613A333A7B733A363A2270616765732E223B613A323A7B733A31323A2264697361626C654974656D73223B733A303A22223B733A353A22747265652E223B613A313A7B733A31323A2264697361626C654974656D73223B733A303A22223B7D7D733A393A227379735F66696C652E223B613A323A7B733A31323A2264697361626C654974656D73223B733A303A22223B733A353A22747265652E223B613A313A7B733A31323A2264697361626C654974656D73223B733A303A22223B7D7D733A31353A227379735F66696C656D6F756E74732E223B613A323A7B733A31323A2264697361626C654974656D73223B733A303A22223B733A353A22747265652E223B613A313A7B733A31323A2264697361626C654974656D73223B733A303A22223B7D7D7D7D733A31313A2273617665446F6356696577223B733A313A2231223B733A31303A2273617665446F634E6577223B733A313A2231223B733A31313A2273617665446F634E65772E223B613A333A7B733A353A227061676573223B733A313A2230223B733A383A227379735F66696C65223B733A313A2230223B733A31373A227379735F66696C655F6D65746164617461223B733A313A2230223B7D733A31343A2264697361626C6544656C6574652E223B613A313A7B733A383A227379735F66696C65223B733A313A2231223B7D7D733A393A2261646D50616E656C2E223B613A313A7B733A373A22656E61626C652E223B613A313A7B733A333A22616C6C223B733A313A2231223B7D7D733A31323A2254434164656661756C74732E223B613A313A7B733A393A227379735F6E6F74652E223B613A323A7B733A363A22617574686F72223B733A303A22223B733A353A22656D61696C223B733A303A22223B7D7D7D');

/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache_hash_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_hash_tags`;

CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;

INSERT INTO `cache_hash_tags` (`id`, `identifier`, `tag`)
VALUES
	(1,'d07b003d9fce07cd551ada22027bf881','UserTSconfig');

/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache_imagesizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_imagesizes`;

CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_imagesizes_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_imagesizes_tags`;

CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_maps2_cachedhtml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_maps2_cachedhtml`;

CREATE TABLE `cache_maps2_cachedhtml` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_maps2_cachedhtml_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_maps2_cachedhtml_tags`;

CREATE TABLE `cache_maps2_cachedhtml_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_news_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_news_category`;

CREATE TABLE `cache_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_news_category_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_news_category_tags`;

CREATE TABLE `cache_news_category_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_pages`;

CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_pages_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_pages_tags`;

CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_pagesection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_pagesection`;

CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_pagesection_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_pagesection_tags`;

CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_rootline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_rootline`;

CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;

INSERT INTO `cache_rootline` (`id`, `identifier`, `expires`, `content`)
VALUES
	(1,'1__0_0',1620560375,X'613A313A7B693A303B613A32353A7B733A333A22706964223B693A303B733A333A22756964223B693A313B733A393A2274337665725F6F6964223B693A303B733A31303A2274337665725F77736964223B693A303B733A31313A2274337665725F7374617465223B693A303B733A353A227469746C65223B733A343A22486F6D65223B733A393A226E61765F7469746C65223B733A303A22223B733A353A226D65646961223B733A303A22223B733A363A226C61796F7574223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A31363A22657874656E64546F5375627061676573223B693A303B733A373A22646F6B74797065223B693A313B733A383A225453636F6E666967223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B733A3431303A224558543A626F6F7473747261705F7061636B6167652F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F5443454D41494E2E7473636F6E6669672C4558543A626F6F7473747261705F7061636B6167652F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F544345464F524D2E7473636F6E6669672C4558543A626F6F7473747261705F7061636B6167652F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F4D6F642F5765624C61796F75742F4261636B656E644C61796F7574732E7473636F6E6669672C4558543A626F6F7473747261705F7061636B6167652F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F436F6E74656E74456C656D656E742F416C6C2E7473636F6E6669672C4558543A736974655F7061636B6167652F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F416C6C2E7473636F6E6669672C4558543A69645F6E6577732F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F416C6C2E7473636F6E666967223B733A31313A2269735F73697465726F6F74223B693A313B733A393A226D6F756E745F706964223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A383A226E61765F68696465223B693A303B733A383A2273686F7274637574223B693A303B733A31333A2273686F72746375745F6D6F6465223B693A303B7D7D');

/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache_rootline_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_rootline_tags`;

CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;

INSERT INTO `cache_rootline_tags` (`id`, `identifier`, `tag`)
VALUES
	(1,'1__0_0','pageId_1');

/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache_staticfilecache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_staticfilecache`;

CREATE TABLE `cache_staticfilecache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_staticfilecache_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_staticfilecache_tags`;

CREATE TABLE `cache_staticfilecache_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_treelist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_treelist`;

CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `treelist` mediumtext COLLATE utf8_unicode_ci,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_vhs_main
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_vhs_main`;

CREATE TABLE `cache_vhs_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_vhs_main_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_vhs_main_tags`;

CREATE TABLE `cache_vhs_main_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_vhs_markdown
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_vhs_markdown`;

CREATE TABLE `cache_vhs_markdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cache_vhs_markdown_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_vhs_markdown_tags`;

CREATE TABLE `cache_vhs_markdown_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fe_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fe_groups`;

CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `felogin_redirectPid` tinytext COLLATE utf8_unicode_ci,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext COLLATE utf8_unicode_ci,
  `TSconfig` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;

INSERT INTO `fe_groups` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `description`, `tx_extbase_type`, `felogin_redirectPid`, `title`, `lockToDomain`, `subgroup`, `TSconfig`)
VALUES
	(1,31,1601460929,1601460929,1,0,0,'','0','','Visitors','','','');

/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fe_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fe_sessions`;

CREATE TABLE `fe_sessions` (
  `ses_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_data` mediumblob,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ses_anonymous` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;

INSERT INTO `fe_sessions` (`ses_id`, `ses_iplock`, `ses_userid`, `ses_tstamp`, `ses_data`, `ses_permanent`, `ses_anonymous`)
VALUES
	('800fa1c52ae6ade8f5bb5596bf37baf5','[DISABLED]',0,1617915468,X'613A313A7B733A34313A2274785F666F726D5F686F6E6579706F745F6E616D655F636F6E74616374666F726D2D313037666F726D223B733A31303A22313256795044496F4C66223B7D',0,1);

/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fe_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fe_users`;

CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `felogin_redirectPid` tinytext COLLATE utf8_unicode_ci,
  `felogin_forgotHash` varchar(80) COLLATE utf8_unicode_ci DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` tinytext COLLATE utf8_unicode_ci,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` blob,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8_unicode_ci,
  `TSconfig` text COLLATE utf8_unicode_ci,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `is_online` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`),
  KEY `felogin_forgotHash` (`felogin_forgotHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;

INSERT INTO `fe_users` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `disable`, `starttime`, `endtime`, `description`, `tx_extbase_type`, `felogin_redirectPid`, `felogin_forgotHash`, `username`, `password`, `usergroup`, `name`, `first_name`, `middle_name`, `last_name`, `address`, `telephone`, `fax`, `email`, `lockToDomain`, `uc`, `title`, `zip`, `city`, `country`, `www`, `company`, `image`, `TSconfig`, `lastlogin`, `is_online`)
VALUES
	(1,31,1617904366,1601460951,1,0,0,0,0,'','0','','2c9d36ac3889dc7941812f2741e44b80930b20a4','etienne.bertrand.zang@gmail.com','$2y$12$a3N4dDhe3.2rcUQehl1evOQV4FqPDHj4/LMzq07erS4XsBAFxQ9qa','1','Julien Henchoz','Julien','','Henchoz','','','','julien.henchoz@ideative.ch','',NULL,'','','','','','','0','',1601469516,1601469516);

/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `rowDescription` text COLLATE utf8_unicode_ci,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_source` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `perms_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT '0',
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `is_siteroot` smallint(6) NOT NULL DEFAULT '0',
  `php_tree_stop` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT '0',
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT '0',
  `abstract` text COLLATE utf8_unicode_ci,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT '0',
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT '0',
  `l18n_cfg` smallint(6) NOT NULL DEFAULT '0',
  `fe_login_mode` smallint(6) NOT NULL DEFAULT '0',
  `backend_layout` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8_unicode_ci,
  `legacy_overlay_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_index` smallint(6) NOT NULL DEFAULT '0',
  `no_follow` smallint(6) NOT NULL DEFAULT '0',
  `og_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `og_description` text COLLATE utf8_unicode_ci,
  `og_image` int(10) unsigned NOT NULL DEFAULT '0',
  `twitter_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_description` text COLLATE utf8_unicode_ci,
  `twitter_image` int(10) unsigned NOT NULL DEFAULT '0',
  `canonical_link` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_icon` int(10) unsigned DEFAULT '0',
  `thumbnail` int(10) unsigned DEFAULT '0',
  `tx_yoastseo_focuskeyword` tinytext COLLATE utf8_unicode_ci,
  `tx_yoastseo_robot_instructions` int(11) NOT NULL DEFAULT '0',
  `tx_yoastseo_hide_snippet_preview` smallint(6) NOT NULL DEFAULT '0',
  `tx_yoastseo_cornerstone` smallint(6) NOT NULL DEFAULT '0',
  `tx_yoastseo_score_readability` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_yoastseo_score_seo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_yoastseo_snippetpreview` smallint(6) NOT NULL DEFAULT '0',
  `tx_yoastseo_focuskeyword_analysis` smallint(6) NOT NULL DEFAULT '0',
  `tx_yoastseo_readability_analysis` smallint(6) NOT NULL DEFAULT '0',
  `categories` int(11) NOT NULL DEFAULT '0',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT '0.5',
  `sitemap_changefreq` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_yoastseo_focuskeyword_synonyms` tinytext COLLATE utf8_unicode_ci,
  `tx_yoastseo_focuskeyword_premium` int(11) NOT NULL DEFAULT '0',
  `tx_sluggi_lock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tx_sluggi_sync` smallint(5) unsigned NOT NULL DEFAULT '1',
  `twitter_card` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_staticfilecache_cache` smallint(6) DEFAULT '1',
  `tx_staticfilecache_cache_force` smallint(6) DEFAULT '0',
  `tx_staticfilecache_cache_offline` smallint(6) DEFAULT '0',
  `tx_staticfilecache_cache_priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `tx_yoastseo_cornerstone` (`tx_yoastseo_cornerstone`),
  KEY `slug` (`slug`(127)),
  KEY `translation_source` (`l10n_source`),
  KEY `legacy_overlay` (`legacy_overlay_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `fe_group`, `sorting`, `rowDescription`, `editlock`, `sys_language_uid`, `l10n_parent`, `l10n_source`, `l10n_state`, `t3_origuid`, `l10n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `perms_userid`, `perms_groupid`, `perms_user`, `perms_group`, `perms_everybody`, `title`, `slug`, `doktype`, `TSconfig`, `is_siteroot`, `php_tree_stop`, `url`, `shortcut`, `shortcut_mode`, `subtitle`, `layout`, `target`, `media`, `lastUpdated`, `keywords`, `cache_timeout`, `cache_tags`, `newUntil`, `description`, `no_search`, `SYS_LASTCHANGED`, `abstract`, `module`, `extendToSubpages`, `author`, `author_email`, `nav_title`, `nav_hide`, `content_from_pid`, `mount_pid`, `mount_pid_ol`, `l18n_cfg`, `fe_login_mode`, `backend_layout`, `backend_layout_next_level`, `tsconfig_includes`, `legacy_overlay_uid`, `tx_impexp_origuid`, `seo_title`, `no_index`, `no_follow`, `og_title`, `og_description`, `og_image`, `twitter_title`, `twitter_description`, `twitter_image`, `canonical_link`, `nav_icon`, `thumbnail`, `tx_yoastseo_focuskeyword`, `tx_yoastseo_robot_instructions`, `tx_yoastseo_hide_snippet_preview`, `tx_yoastseo_cornerstone`, `tx_yoastseo_score_readability`, `tx_yoastseo_score_seo`, `tx_yoastseo_snippetpreview`, `tx_yoastseo_focuskeyword_analysis`, `tx_yoastseo_readability_analysis`, `categories`, `sitemap_priority`, `sitemap_changefreq`, `tx_yoastseo_focuskeyword_synonyms`, `tx_yoastseo_focuskeyword_premium`, `tx_sluggi_lock`, `tx_sluggi_sync`, `twitter_card`, `tx_staticfilecache_cache`, `tx_staticfilecache_cache_force`, `tx_staticfilecache_cache_offline`, `tx_staticfilecache_cache_priority`)
VALUES
	(1,0,1550761184,1550750822,1,0,0,0,0,'',0,NULL,0,0,0,0,NULL,0,X'613A34393A7B733A373A22646F6B74797065223B4E3B733A353A227469746C65223B4E3B733A343A22736C7567223B4E3B733A393A226E61765F7469746C65223B4E3B733A383A227375627469746C65223B4E3B733A383A226E61765F69636F6E223B4E3B733A393A2273656F5F7469746C65223B4E3B733A383A226E6F5F696E646578223B4E3B733A393A226E6F5F666F6C6C6F77223B4E3B733A31343A2263616E6F6E6963616C5F6C696E6B223B4E3B733A383A226F675F7469746C65223B4E3B733A31343A226F675F6465736372697074696F6E223B4E3B733A383A226F675F696D616765223B4E3B733A31333A22747769747465725F7469746C65223B4E3B733A31393A22747769747465725F6465736372697074696F6E223B4E3B733A31333A22747769747465725F696D616765223B4E3B733A383A226162737472616374223B4E3B733A383A226B6579776F726473223B4E3B733A31313A226465736372697074696F6E223B4E3B733A363A22617574686F72223B4E3B733A31323A22617574686F725F656D61696C223B4E3B733A31313A226C61737455706461746564223B4E3B733A363A226C61796F7574223B4E3B733A383A226E6577556E74696C223B4E3B733A31343A226261636B656E645F6C61796F7574223B4E3B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B4E3B733A393A227468756D626E61696C223B4E3B733A31363A22636F6E74656E745F66726F6D5F706964223B4E3B733A363A22746172676574223B4E3B733A31333A2263616368655F74696D656F7574223B4E3B733A31303A2263616368655F74616773223B4E3B733A31313A2269735F73697465726F6F74223B4E3B733A393A226E6F5F736561726368223B4E3B733A31333A227068705F747265655F73746F70223B4E3B733A363A226D6F64756C65223B4E3B733A353A226D65646961223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A225453636F6E666967223B4E3B733A383A226C31386E5F636667223B4E3B733A363A2268696464656E223B4E3B733A383A226E61765F68696465223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A22657874656E64546F5375627061676573223B4E3B733A383A2266655F67726F7570223B4E3B733A31333A2266655F6C6F67696E5F6D6F6465223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,1,'Home','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1550761184,NULL,'',0,'','','',0,0,0,0,0,0,'','','EXT:bootstrap_package/Configuration/TsConfig/Page/TCEMAIN.tsconfig,EXT:bootstrap_package/Configuration/TsConfig/Page/TCEFORM.tsconfig,EXT:bootstrap_package/Configuration/TsConfig/Page/Mod/WebLayout/BackendLayouts.tsconfig,EXT:bootstrap_package/Configuration/TsConfig/Page/ContentElement/All.tsconfig,EXT:site_package/Configuration/TsConfig/Page/All.tsconfig,EXT:id_news/Configuration/TsConfig/Page/All.tsconfig',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(3,1,1551211003,1551211003,1,0,0,0,0,'0',1001023,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'General storage','/general-storage',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(5,1,1552231599,1551274498,1,0,0,0,0,'',2432,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Contenus de démonstration','/demo',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,'',0,1552231599,'This page contains an example of each available content element in this package.','',0,'','','Demo',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,1,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(7,1,1552231599,1551285716,1,0,0,0,0,'',2432,NULL,0,1,5,5,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Demo contents','/demo',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Demo',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,1,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(8,1,1551892210,1551298982,1,0,0,0,0,'',384,NULL,0,0,0,0,NULL,0,X'613A35343A7B733A373A22646F6B74797065223B4E3B733A353A227469746C65223B4E3B733A343A22736C7567223B4E3B733A393A226E61765F7469746C65223B4E3B733A383A227375627469746C65223B4E3B733A383A226E61765F69636F6E223B4E3B733A393A2273656F5F7469746C65223B4E3B733A31313A226465736372697074696F6E223B4E3B733A32333A2274785F796F61737473656F5F636F726E657273746F6E65223B4E3B733A32343A2274785F796F61737473656F5F666F6375736B6579776F7264223B4E3B733A383A226E6F5F696E646578223B4E3B733A393A226E6F5F666F6C6C6F77223B4E3B733A31343A2263616E6F6E6963616C5F6C696E6B223B4E3B733A383A226F675F7469746C65223B4E3B733A31343A226F675F6465736372697074696F6E223B4E3B733A383A226F675F696D616765223B4E3B733A31333A22747769747465725F7469746C65223B4E3B733A31393A22747769747465725F6465736372697074696F6E223B4E3B733A31333A22747769747465725F696D616765223B4E3B733A33323A2274785F796F61737473656F5F686964655F736E69707065745F70726576696577223B4E3B733A32393A2274785F796F61737473656F5F73636F72655F726561646162696C697479223B4E3B733A32313A2274785F796F61737473656F5F73636F72655F73656F223B4E3B733A383A226162737472616374223B4E3B733A383A226B6579776F726473223B4E3B733A363A22617574686F72223B4E3B733A31323A22617574686F725F656D61696C223B4E3B733A31313A226C61737455706461746564223B4E3B733A363A226C61796F7574223B4E3B733A383A226E6577556E74696C223B4E3B733A31343A226261636B656E645F6C61796F7574223B4E3B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B4E3B733A393A227468756D626E61696C223B4E3B733A31363A22636F6E74656E745F66726F6D5F706964223B4E3B733A363A22746172676574223B4E3B733A31333A2263616368655F74696D656F7574223B4E3B733A31303A2263616368655F74616773223B4E3B733A31313A2269735F73697465726F6F74223B4E3B733A393A226E6F5F736561726368223B4E3B733A31333A227068705F747265655F73746F70223B4E3B733A363A226D6F64756C65223B4E3B733A353A226D65646961223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A225453636F6E666967223B4E3B733A383A226C31386E5F636667223B4E3B733A363A2268696464656E223B4E3B733A383A226E61765F68696465223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A22657874656E64546F5375627061676573223B4E3B733A383A2266655F67726F7570223B4E3B733A31333A2266655F6C6F67696E5F6D6F6465223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,0,'News','/news',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1590511548,'This page shows a basic news system.','',0,'','','',0,0,0,0,0,0,'','','EXT:id_news/Configuration/TsConfig/Page/Preview/News.tsconfig',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,1,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(9,8,1551717056,1551298991,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,X'613A31333A7B733A373A22646F6B74797065223B4E3B733A353A227469746C65223B4E3B733A343A22736C7567223B4E3B733A31343A226261636B656E645F6C61796F7574223B4E3B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B4E3B733A363A226D6F64756C65223B4E3B733A353A226D65646961223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A225453636F6E666967223B4E3B733A363A2268696464656E223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Articles','/news/articles',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(10,8,1551299022,1551298999,1,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Categories','/news/categories',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(11,8,1551717463,1551299006,1,0,0,0,0,'',64,NULL,0,0,0,0,NULL,0,X'613A35343A7B733A373A22646F6B74797065223B4E3B733A353A227469746C65223B4E3B733A343A22736C7567223B4E3B733A393A226E61765F7469746C65223B4E3B733A383A227375627469746C65223B4E3B733A383A226E61765F69636F6E223B4E3B733A393A2273656F5F7469746C65223B4E3B733A31313A226465736372697074696F6E223B4E3B733A32333A2274785F796F61737473656F5F636F726E657273746F6E65223B4E3B733A32343A2274785F796F61737473656F5F666F6375736B6579776F7264223B4E3B733A383A226E6F5F696E646578223B4E3B733A393A226E6F5F666F6C6C6F77223B4E3B733A31343A2263616E6F6E6963616C5F6C696E6B223B4E3B733A383A226F675F7469746C65223B4E3B733A31343A226F675F6465736372697074696F6E223B4E3B733A383A226F675F696D616765223B4E3B733A31333A22747769747465725F7469746C65223B4E3B733A31393A22747769747465725F6465736372697074696F6E223B4E3B733A31333A22747769747465725F696D616765223B4E3B733A33323A2274785F796F61737473656F5F686964655F736E69707065745F70726576696577223B4E3B733A32393A2274785F796F61737473656F5F73636F72655F726561646162696C697479223B4E3B733A32313A2274785F796F61737473656F5F73636F72655F73656F223B4E3B733A383A226162737472616374223B4E3B733A383A226B6579776F726473223B4E3B733A363A22617574686F72223B4E3B733A31323A22617574686F725F656D61696C223B4E3B733A31313A226C61737455706461746564223B4E3B733A363A226C61796F7574223B4E3B733A383A226E6577556E74696C223B4E3B733A31343A226261636B656E645F6C61796F7574223B4E3B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B4E3B733A393A227468756D626E61696C223B4E3B733A31363A22636F6E74656E745F66726F6D5F706964223B4E3B733A363A22746172676574223B4E3B733A31333A2263616368655F74696D656F7574223B4E3B733A31303A2263616368655F74616773223B4E3B733A31313A2269735F73697465726F6F74223B4E3B733A393A226E6F5F736561726368223B4E3B733A31333A227068705F747265655F73746F70223B4E3B733A363A226D6F64756C65223B4E3B733A353A226D65646961223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A225453636F6E666967223B4E3B733A383A226C31386E5F636667223B4E3B733A363A2268696464656E223B4E3B733A383A226E61765F68696465223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A22657874656E64546F5375627061676573223B4E3B733A383A2266655F67726F7570223B4E3B733A31333A2266655F6C6F67696E5F6D6F6465223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,0,'News detail','/news/view',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1551717463,NULL,'',0,'','','',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(12,8,1551717056,1551351960,1,0,0,0,0,'',256,NULL,0,1,9,9,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,X'613A34313A7B733A373A22646F6B74797065223B693A3235343B733A353A227469746C65223B733A383A2241727469636C6573223B733A343A22736C7567223B733A31343A222F6E6577732F61727469636C6573223B733A363A2268696464656E223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B4E3B733A383A225453636F6E666967223B4E3B733A31333A227068705F747265655F73746F70223B693A303B733A383A22656469746C6F636B223B693A303B733A363A226C61796F7574223B693A303B733A383A2266655F67726F7570223B733A313A2230223B733A31363A22657874656E64546F5375627061676573223B693A303B733A363A22746172676574223B733A303A22223B733A353A22616C696173223B733A303A22223B733A31333A2263616368655F74696D656F7574223B693A303B733A31303A2263616368655F74616773223B733A303A22223B733A393A226D6F756E745F706964223B693A303B733A31313A2269735F73697465726F6F74223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A363A226D6F64756C65223B733A303A22223B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A383A226C31386E5F636667223B693A303B733A31343A226261636B656E645F6C61796F7574223B733A303A22223B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A31373A227473636F6E6669675F696E636C75646573223B733A303A22223B733A383A226E6F5F696E646578223B693A303B733A393A226E6F5F666F6C6C6F77223B693A303B733A393A227468756D626E61696C223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A333A2275726C223B733A303A22223B733A31313A226C61737455706461746564223B693A303B733A383A226E6577556E74696C223B693A303B733A393A226E6F5F736561726368223B693A303B733A383A2273686F7274637574223B693A303B733A31333A2273686F72746375745F6D6F6465223B693A303B733A363A22617574686F72223B733A303A22223B733A31323A22617574686F725F656D61696C223B733A303A22223B733A353A226D65646961223B693A303B733A383A226F675F696D616765223B693A303B733A31333A22747769747465725F696D616765223B693A303B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Articles','/news/articles',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(13,1,1551892210,1551360145,1,0,0,0,0,'',384,NULL,0,1,8,8,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,X'613A35353A7B733A373A22646F6B74797065223B693A313B733A353A227469746C65223B733A343A224E657773223B733A343A22736C7567223B733A353A222F6E657773223B733A393A226E61765F7469746C65223B733A303A22223B733A383A227375627469746C65223B733A303A22223B733A383A226E61765F69636F6E223B693A303B733A393A2273656F5F7469746C65223B733A303A22223B733A31343A2263616E6F6E6963616C5F6C696E6B223B733A303A22223B733A383A226F675F7469746C65223B733A303A22223B733A31343A226F675F6465736372697074696F6E223B4E3B733A31333A22747769747465725F7469746C65223B733A303A22223B733A31393A22747769747465725F6465736372697074696F6E223B4E3B733A383A226162737472616374223B4E3B733A383A226B6579776F726473223B4E3B733A31313A226465736372697074696F6E223B4E3B733A31363A22636F6E74656E745F66726F6D5F706964223B693A303B733A363A2268696464656E223B693A303B733A383A226E61765F68696465223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B4E3B733A383A225453636F6E666967223B4E3B733A31333A227068705F747265655F73746F70223B693A303B733A383A22656469746C6F636B223B693A303B733A363A226C61796F7574223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A31363A22657874656E64546F5375627061676573223B693A303B733A363A22746172676574223B733A303A22223B733A353A22616C696173223B733A303A22223B733A31333A2263616368655F74696D656F7574223B693A303B733A31303A2263616368655F74616773223B733A303A22223B733A393A226D6F756E745F706964223B693A303B733A31313A2269735F73697465726F6F74223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A363A226D6F64756C65223B733A303A22223B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A383A226C31386E5F636667223B693A303B733A31343A226261636B656E645F6C61796F7574223B733A303A22223B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A31373A227473636F6E6669675F696E636C75646573223B733A36313A224558543A69645F6E6577732F436F6E66696775726174696F6E2F5473436F6E6669672F506167652F507265766965772F4E6577732E7473636F6E666967223B733A383A226E6F5F696E646578223B693A303B733A393A226E6F5F666F6C6C6F77223B693A303B733A393A227468756D626E61696C223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A333A2275726C223B733A303A22223B733A31313A226C61737455706461746564223B693A303B733A383A226E6577556E74696C223B693A303B733A393A226E6F5F736561726368223B693A303B733A383A2273686F7274637574223B693A303B733A31333A2273686F72746375745F6D6F6465223B693A303B733A363A22617574686F72223B733A303A22223B733A31323A22617574686F725F656D61696C223B733A303A22223B733A353A226D65646961223B693A303B733A383A226F675F696D616765223B693A303B733A31333A22747769747465725F696D616765223B693A303B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Actualités','/actualites',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','EXT:id_news/Configuration/TsConfig/Page/Preview/News.tsconfig',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,1,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(20,1,1607014922,1607014220,1,0,0,0,0,'0',640,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Événements','/evenements',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(21,20,1607015702,1607014377,1,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Détail d\'un événement','/evenements/detail',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(23,20,1607015707,1607015453,1,0,0,0,0,'0',384,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Catégories','/evenements/categories',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(24,20,1607015412,1607014450,1,0,0,0,0,'0',768,NULL,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Événements','/evenements/evenements',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(25,20,1607015722,1607015709,1,0,0,0,0,'0',384,NULL,0,1,23,164,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Categories','/events/categories',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(29,8,1551717034,1551705607,1,0,0,0,0,'',64,NULL,0,1,11,11,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,X'613A36303A7B733A373A22646F6B74797065223B693A313B733A353A227469746C65223B733A31313A224E6577732064657461696C223B733A343A22736C7567223B733A31313A222F6E6577732F766965772F223B733A393A226E61765F7469746C65223B733A303A22223B733A383A227375627469746C65223B733A303A22223B733A383A226E61765F69636F6E223B693A303B733A393A2273656F5F7469746C65223B733A303A22223B733A31313A226465736372697074696F6E223B4E3B733A32333A2274785F796F61737473656F5F636F726E657273746F6E65223B693A303B733A32343A2274785F796F61737473656F5F666F6375736B6579776F7264223B733A303A22223B733A31343A2263616E6F6E6963616C5F6C696E6B223B733A303A22223B733A383A226F675F7469746C65223B733A303A22223B733A31343A226F675F6465736372697074696F6E223B4E3B733A31333A22747769747465725F7469746C65223B733A303A22223B733A31393A22747769747465725F6465736372697074696F6E223B4E3B733A33323A2274785F796F61737473656F5F686964655F736E69707065745F70726576696577223B693A303B733A32393A2274785F796F61737473656F5F73636F72655F726561646162696C697479223B733A333A22626164223B733A32313A2274785F796F61737473656F5F73636F72655F73656F223B733A333A22626164223B733A383A226162737472616374223B4E3B733A383A226B6579776F726473223B4E3B733A31363A22636F6E74656E745F66726F6D5F706964223B693A303B733A363A2268696464656E223B693A303B733A383A226E61765F68696465223B693A313B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B4E3B733A383A225453636F6E666967223B4E3B733A31333A227068705F747265655F73746F70223B693A303B733A383A22656469746C6F636B223B693A303B733A363A226C61796F7574223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A31363A22657874656E64546F5375627061676573223B693A303B733A363A22746172676574223B733A303A22223B733A353A22616C696173223B733A303A22223B733A31333A2263616368655F74696D656F7574223B693A303B733A31303A2263616368655F74616773223B733A303A22223B733A393A226D6F756E745F706964223B693A303B733A31313A2269735F73697465726F6F74223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A363A226D6F64756C65223B733A303A22223B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A383A226C31386E5F636667223B693A303B733A31343A226261636B656E645F6C61796F7574223B733A303A22223B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A31373A227473636F6E6669675F696E636C75646573223B733A303A22223B733A383A226E6F5F696E646578223B693A303B733A393A226E6F5F666F6C6C6F77223B693A303B733A393A227468756D626E61696C223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A333A2275726C223B733A303A22223B733A31313A226C61737455706461746564223B693A303B733A383A226E6577556E74696C223B693A303B733A393A226E6F5F736561726368223B693A303B733A383A2273686F7274637574223B693A303B733A31333A2273686F72746375745F6D6F6465223B693A303B733A363A22617574686F72223B733A303A22223B733A31323A22617574686F725F656D61696C223B733A303A22223B733A353A226D65646961223B693A303B733A383A226F675F696D616765223B693A303B733A31333A22747769747465725F696D616765223B693A303B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Détail d\'une actualité','/actualites/detail-dune-actualite',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(30,8,1551705648,1551705634,1,0,0,0,0,'',128,NULL,0,1,10,10,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,X'613A32383A7B733A373A22646F6B74797065223B693A3235343B733A353A227469746C65223B733A31303A2243617465676F72696573223B733A343A22736C7567223B733A31363A222F6E6577732F63617465676F72696573223B733A363A2268696464656E223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B4E3B733A383A225453636F6E666967223B4E3B733A31333A227068705F747265655F73746F70223B693A303B733A383A22656469746C6F636B223B693A303B733A363A226C61796F7574223B693A303B733A383A2266655F67726F7570223B733A313A2230223B733A31363A22657874656E64546F5375627061676573223B693A303B733A363A22746172676574223B733A303A22223B733A353A22616C696173223B733A303A22223B733A31333A2263616368655F74696D656F7574223B693A303B733A31303A2263616368655F74616773223B733A303A22223B733A393A226D6F756E745F706964223B693A303B733A31313A2269735F73697465726F6F74223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A363A226D6F64756C65223B733A303A22223B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A383A226C31386E5F636667223B693A303B733A31343A226261636B656E645F6C61796F7574223B733A303A22223B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A226E6F5F696E646578223B693A303B733A393A226E6F5F666F6C6C6F77223B693A303B733A393A227468756D626E61696C223B693A303B7D',0,0,0,0,0,0,0,1,1,31,31,0,'Catégories','/actualites/categories',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(31,0,1551779859,1551779837,1,0,0,0,0,'0',2048,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'FE Users','/',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(32,0,1551779917,1551779908,1,0,1,0,0,'',2048,NULL,0,1,31,31,'',0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Utilisateurs Frontend','/',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(133,1,1551908869,1551875807,1,0,0,0,0,'0',3712,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Pages d\'erreur','/erreur',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(134,1,1551908869,1551875860,1,0,0,0,0,'',3712,NULL,0,1,133,133,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Error Pages','/error',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(135,133,1551876146,1551875950,1,0,0,0,0,'',64,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Page Introuvable','/page-introuvable',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1551876146,NULL,'',0,'','','Erreur 404',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(136,133,1551876146,1551875988,1,0,0,0,0,'',64,NULL,0,1,135,135,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Page not found','/page-not-found',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Error 404',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(137,133,1551876112,1551876042,1,0,0,0,0,'',128,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Accès refusé','/acces-refuse',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1551876112,NULL,'',0,'','','Erreur 403',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(138,133,1551876137,1551876117,1,0,0,0,0,'',128,NULL,0,1,137,137,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Access denied','/access-denied',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Error 403',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(139,133,1551876199,1551876166,1,0,0,0,0,'',32,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Erreur','/erreur-systeme',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Erreur 500',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(140,133,1551876276,1551876229,1,0,0,0,0,'',32,NULL,0,1,139,139,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Error','/system-error',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Error 500',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(141,133,1551876316,1551876290,1,0,0,0,0,'',16,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Maintenance','/maintenance',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Erreur 503',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(142,133,1551876370,1551876320,1,0,0,0,0,'',16,NULL,0,1,141,141,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Maintenance','/maintenance',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','Error 503',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(143,1,1552145737,1551892808,1,0,0,0,0,'0',2432,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Se connecter','/se-connecter',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1552145737,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'good','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(144,1,1552145737,1551908758,1,0,0,0,0,'',2432,NULL,0,1,143,143,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Login','/login',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(151,1,1552145070,1552145061,1,0,0,0,0,'0',2176,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Contact','/contact',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1552145070,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(152,1,1552145102,1552145083,1,0,1,0,0,'',2176,NULL,0,1,151,151,'',0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Contact','/contact',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(153,151,1552145522,1552145161,1,0,0,0,0,'',256,NULL,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Merci','/contact/merci',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,1,1552145522,NULL,'',0,'','','',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'good','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(154,151,1552145522,1552145473,1,0,0,0,0,'',256,NULL,0,1,153,153,'',0,'',0,0,0,0,0,0,0,1,1,31,31,0,'Thank you','/contact/thank-you',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,1,0,NULL,'',0,'','','',1,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'bad','bad',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(155,3,1552176243,1552176160,1,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,0,X'613A31333A7B733A373A22646F6B74797065223B4E3B733A353A227469746C65223B4E3B733A343A22736C7567223B4E3B733A31343A226261636B656E645F6C61796F7574223B4E3B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B4E3B733A363A226D6F64756C65223B4E3B733A353A226D65646961223B4E3B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A225453636F6E666967223B4E3B733A363A2268696464656E223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B7D',0,0,0,0,0,0,0,1,1,31,31,0,'GoogleMaps POI','/googlemaps-poi',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(156,3,1552176250,1552176218,1,0,0,0,0,'',512,NULL,0,1,155,155,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,X'613A34313A7B733A373A22646F6B74797065223B693A3235343B733A353A227469746C65223B733A31343A22476F6F676C654D61707320504F49223B733A343A22736C7567223B733A31303A222F676D6170732D706F69223B733A363A2268696464656E223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B4E3B733A383A225453636F6E666967223B4E3B733A31333A227068705F747265655F73746F70223B693A303B733A383A22656469746C6F636B223B693A303B733A363A226C61796F7574223B693A303B733A383A2266655F67726F7570223B733A313A2230223B733A31363A22657874656E64546F5375627061676573223B693A303B733A363A22746172676574223B733A303A22223B733A353A22616C696173223B733A303A22223B733A31333A2263616368655F74696D656F7574223B693A303B733A31303A2263616368655F74616773223B733A303A22223B733A393A226D6F756E745F706964223B693A303B733A31313A2269735F73697465726F6F74223B693A303B733A31323A226D6F756E745F7069645F6F6C223B693A303B733A363A226D6F64756C65223B733A303A22223B733A31333A2266655F6C6F67696E5F6D6F6465223B693A303B733A383A226C31386E5F636667223B693A303B733A31343A226261636B656E645F6C61796F7574223B733A303A22223B733A32353A226261636B656E645F6C61796F75745F6E6578745F6C6576656C223B733A303A22223B733A31373A227473636F6E6669675F696E636C75646573223B4E3B733A383A226E6F5F696E646578223B693A303B733A393A226E6F5F666F6C6C6F77223B693A303B733A393A227468756D626E61696C223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A333A2275726C223B733A303A22223B733A31313A226C61737455706461746564223B693A303B733A383A226E6577556E74696C223B693A303B733A393A226E6F5F736561726368223B693A303B733A383A2273686F7274637574223B693A303B733A31333A2273686F72746375745F6D6F6465223B693A303B733A363A22617574686F72223B733A303A22223B733A31323A22617574686F725F656D61696C223B733A303A22223B733A353A226D65646961223B693A303B733A383A226F675F696D616765223B693A303B733A31333A22747769747465725F696D616765223B693A303B7D',0,0,0,0,0,0,0,1,1,31,31,0,'GoogleMaps POI','/googlemaps-poi',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,'',0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(161,1,1607014922,1607014890,1,0,0,0,0,'0',640,NULL,0,1,20,20,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Events','/events',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(162,20,1607015690,1607015371,1,0,0,0,0,'0',128,NULL,0,1,21,21,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Event detail','/events/detail',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',1,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0),
	(163,20,1607015425,1607015417,1,0,0,0,0,'0',768,NULL,0,1,24,24,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,NULL,0,0,0,0,0,0,0,1,1,31,31,0,'Events','/events/events',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'',0,0,NULL,0,0,0,'','',0,0,0,0,0.5,'',NULL,0,0,1,'',1,0,0,0);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_be_shortcuts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_be_shortcuts`;

CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` text COLLATE utf8_unicode_ci,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sc_group` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_category`;

CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `items` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `images` int(10) unsigned DEFAULT '0',
  `single_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(11) NOT NULL DEFAULT '0',
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci,
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maps2_marker_icons` int(10) unsigned NOT NULL DEFAULT '0',
  `maps2_marker_icon_width` int(10) unsigned NOT NULL DEFAULT '0',
  `maps2_marker_icon_height` int(10) unsigned NOT NULL DEFAULT '0',
  `maps2_marker_icon_anchor_pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `maps2_marker_icon_anchor_pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;

INSERT INTO `sys_category` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `description`, `sys_language_uid`, `l10n_parent`, `l10n_state`, `t3_origuid`, `l10n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `title`, `parent`, `items`, `fe_group`, `images`, `single_pid`, `shortcut`, `import_id`, `import_source`, `seo_title`, `seo_description`, `seo_headline`, `seo_text`, `slug`, `maps2_marker_icons`, `maps2_marker_icon_width`, `maps2_marker_icon_height`, `maps2_marker_icon_anchor_pos_x`, `maps2_marker_icon_anchor_pos_y`)
VALUES
	(1,10,1590423483,1551299202,1,0,0,0,0,256,'',0,0,NULL,0,X'613A323A7B733A343A22736C7567223B4E3B733A353A227469746C65223B4E3B7D',0,0,0,0,0,0,0,'All news',0,0,'0',0,0,0,'','','','','','','all-news',0,0,0,0,0),
	(2,10,1590423483,1551299226,1,0,0,0,0,256,'',1,1,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"images\":\"parent\",\"single_pid\":\"parent\",\"shortcut\":\"parent\",\"maps2_marker_icons\":\"parent\"}',1,X'613A31393A7B733A353A227469746C65223B733A383A22416C6C206E657773223B733A363A22706172656E74223B693A303B733A353A226974656D73223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31306E5F706172656E74223B693A303B733A363A2268696464656E223B693A303B733A393A2273656F5F7469746C65223B733A303A22223B733A31353A2273656F5F6465736372697074696F6E223B733A303A22223B733A31323A2273656F5F686561646C696E65223B733A303A22223B733A383A2273656F5F74657874223B733A303A22223B733A31313A226465736372697074696F6E223B733A303A22223B733A31323A22706174685F7365676D656E74223B733A383A22616C6C2D6E657773223B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A363A22696D61676573223B693A303B733A31303A2273696E676C655F706964223B693A303B733A383A2273686F7274637574223B693A303B733A343A22736C7567223B733A383A22616C6C2D6E657773223B733A31383A226D617073325F6D61726B65725F69636F6E73223B693A303B7D',0,0,0,0,0,0,0,'Toutes les actualités',0,0,'0',0,0,0,'','','','','','','toutes-les-actualites',0,0,0,0,0),
	(3,10,1590423483,1551299317,1,0,0,0,0,32,'',0,0,NULL,0,X'613A323A7B733A343A22736C7567223B4E3B733A353A227469746C65223B4E3B7D',0,0,0,0,0,0,0,'Category 1',1,6,'0',0,0,0,'','','','','','','category-1',0,0,0,0,0),
	(4,10,1590423483,1551299321,1,0,0,0,0,16,'',1,3,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"images\":\"parent\",\"single_pid\":\"parent\",\"shortcut\":\"parent\",\"maps2_marker_icons\":\"parent\"}',3,X'613A31393A7B733A353A227469746C65223B733A31303A2243617465676F72792031223B733A363A22706172656E74223B693A313B733A353A226974656D73223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31306E5F706172656E74223B693A303B733A363A2268696464656E223B693A303B733A393A2273656F5F7469746C65223B733A303A22223B733A31353A2273656F5F6465736372697074696F6E223B733A303A22223B733A31323A2273656F5F686561646C696E65223B733A303A22223B733A383A2273656F5F74657874223B733A303A22223B733A31313A226465736372697074696F6E223B733A303A22223B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A363A22696D61676573223B693A303B733A31303A2273696E676C655F706964223B693A303B733A383A2273686F7274637574223B693A303B733A31323A22706174685F7365676D656E74223B733A31303A2263617465676F72792D31223B733A343A22736C7567223B733A31303A2263617465676F72792D31223B733A31383A226D617073325F6D61726B65725F69636F6E73223B693A303B7D',0,0,0,0,0,0,0,'Catégorie 1',1,0,'0',0,0,0,'','','','','','','categorie-1',0,0,0,0,0),
	(5,10,1590423483,1551299339,1,0,0,0,0,64,'',0,0,NULL,0,X'613A323A7B733A343A22736C7567223B4E3B733A353A227469746C65223B4E3B7D',0,0,0,0,0,0,0,'Category 2',1,0,'0',0,0,0,'','','','','','','category-2',0,0,0,0,0),
	(6,10,1590423483,1551299341,1,0,0,0,0,64,'',1,5,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"images\":\"parent\",\"single_pid\":\"parent\",\"shortcut\":\"parent\",\"maps2_marker_icons\":\"parent\"}',5,X'613A31393A7B733A353A227469746C65223B733A31303A2243617465676F72792032223B733A363A22706172656E74223B693A313B733A353A226974656D73223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31306E5F706172656E74223B693A303B733A363A2268696464656E223B693A303B733A393A2273656F5F7469746C65223B733A303A22223B733A31353A2273656F5F6465736372697074696F6E223B733A303A22223B733A31323A2273656F5F686561646C696E65223B733A303A22223B733A383A2273656F5F74657874223B733A303A22223B733A31313A226465736372697074696F6E223B733A303A22223B733A31323A22706174685F7365676D656E74223B733A31303A2263617465676F72792D32223B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A363A22696D61676573223B693A303B733A31303A2273696E676C655F706964223B693A303B733A383A2273686F7274637574223B693A303B733A343A22736C7567223B733A31303A2263617465676F72792D32223B733A31383A226D617073325F6D61726B65725F69636F6E73223B693A303B7D',0,0,0,0,0,0,0,'Catégorie 2',1,0,'0',0,0,0,'','','','','','','categorie-2',0,0,0,0,0);

/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_category_record_mm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_category_record_mm`;

CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local_foreign` (`uid_local`,`uid_foreign`),
  KEY `uid_foreign_tablefield` (`uid_foreign`,`tablenames`(40),`fieldname`(3),`sorting_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;

INSERT INTO `sys_category_record_mm` (`uid_local`, `uid_foreign`, `tablenames`, `fieldname`, `sorting`, `sorting_foreign`)
VALUES
	(3,12,'tx_news_domain_model_news','categories',1,1),
	(3,13,'tx_news_domain_model_news','categories',2,1),
	(5,3,'tx_news_domain_model_news','categories',0,1),
	(5,4,'tx_news_domain_model_news','categories',0,1),
	(3,1,'tx_news_domain_model_news','categories',3,1),
	(3,2,'tx_news_domain_model_news','categories',4,1),
	(3,5,'tx_news_domain_model_news','categories',5,1),
	(3,6,'tx_news_domain_model_news','categories',6,1),
	(9,14,'tx_news_domain_model_news','categories',0,1),
	(9,15,'tx_news_domain_model_news','categories',0,1),
	(11,16,'tx_news_domain_model_news','categories',0,1),
	(11,17,'tx_news_domain_model_news','categories',0,1);

/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_collection`;

CREATE TABLE `sys_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `table_name` tinytext COLLATE utf8_unicode_ci,
  `items` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_collection_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_collection_entries`;

CREATE TABLE `sys_collection_entries` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `last_indexed` int(11) NOT NULL DEFAULT '0',
  `missing` smallint(6) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT '0',
  `identifier` text COLLATE utf8_unicode_ci,
  `identifier_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `modification_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;

INSERT INTO `sys_file` (`uid`, `pid`, `tstamp`, `last_indexed`, `missing`, `storage`, `type`, `metadata`, `identifier`, `identifier_hash`, `folder_hash`, `extension`, `mime_type`, `name`, `sha1`, `size`, `creation_date`, `modification_date`)
VALUES
	(1,0,1550760141,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackage.svg','53b7aaf32363271515e80e6c7b25293292185218','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackage.svg','432a35f0e0b0c1ec08dd5ad94b5903d93090403a',5508,1550759813,1544889244),
	(2,0,1550760141,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackageInverted.svg','5b24af7f7f2c99d8a6188015bc8298396b952ab7','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackageInverted.svg','4725d40dd7fcd037fb7b12918b91d2c40c1acc3f',5444,1550759813,1544889244),
	(6,0,1551300668,1551300668,0,1,'2',0,'/user_upload/dummy.jpg','b421f164e6aff69984533dfe087cff2877d3f4dd','19669f1e02c2f16705ec7587044c66443be70725','jpg','image/jpeg','dummy.jpg','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9',217066,1551300635,1551174046),
	(8,0,1551301863,1551301863,0,1,'5',0,'/user_upload/file.pdf','526d503d58a31857c76e6596117433b30fc6383b','19669f1e02c2f16705ec7587044c66443be70725','pdf','application/pdf','file.pdf','363f49e95487f7fcc81f7ad401e65d70f1529ed8',585554,1551301859,1551301767),
	(11,0,1551873151,1551873151,0,1,'2',0,'/user_upload/typo3.svg','aa9733f4b330bec6107318215377859b2233b852','19669f1e02c2f16705ec7587044c66443be70725','svg','image/svg+xml','typo3.svg','4c1c0c2fb10767a77a84c2b198d9bec13fea2b18',426,1551873143,1551873089),
	(12,0,1551873461,1551873461,0,1,'4',0,'/user_upload/FREE_TO_RUN_-_Trailer.youtube','dfd2380ca8837cba779ae3d9783b16818f6ae1ca','19669f1e02c2f16705ec7587044c66443be70725','youtube','video/youtube','FREE_TO_RUN_-_Trailer.youtube','e237fedf066cc22b21a9ff715374546d28fbfb46',11,1551873461,1551873461),
	(13,0,1551873473,1551873474,0,1,'4',0,'/user_upload/FESTIVALS_LE_NOUVEL_ELDORADO_-_TEASER.youtube','0a125241e0c53e2eacb4058f980ed682c525285f','19669f1e02c2f16705ec7587044c66443be70725','youtube','video/youtube','FESTIVALS_LE_NOUVEL_ELDORADO_-_TEASER.youtube','c9f4e2d5f46477e315132f4233987e6dcbc2449a',11,1551873473,1551873473),
	(14,0,1552144094,1552144094,0,1,'1',0,'/Forms/ENcontactForm.form.yaml','7bdb5a3b181b9c6818c1d2663cbac022fa023659','9243466b8b38df23d9e8e3bb58640bf8de7e67df','yaml','text/plain','ENcontactForm.form.yaml','09b04ed56ee646fd1f54f41aa9d67548996ce507',3945,1552143940,1552143940),
	(15,0,1552144094,1552144094,0,1,'1',0,'/Forms/FRcontactForm.form.yaml','0974e9a914050a39fad220c3f75ae5f3bf62b802','9243466b8b38df23d9e8e3bb58640bf8de7e67df','yaml','text/plain','FRcontactForm.form.yaml','2c7f11f7d0ed52fcbd6bbc0b54a8e611e798935a',3874,1552143940,1552143940),
	(18,0,1552150042,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/Icons/Glyphicons/info-sign.svg','5e8d86ac1f5d92f16b63770c8ccedb5b2b2966ba','26ee2062564d829d0374ec9bebe419a4e18f5be9','svg','image/svg+xml','info-sign.svg','6529cf09de801596bcce705295dfbacce9537ff2',777,1551785278,1544889244),
	(19,0,1552150042,0,0,0,'1',0,'/typo3conf/ext/bootstrap_package/Resources/Private/Forms/Contact.form.yaml','2a55626b114d39e0df900fed7de4bce280b525e8','cb325869a98c4a4b1426fc4e5bff6efce9ef3234','yaml','text/plain','Contact.form.yaml','81cc5aae0a367bdf5cb3481b993f58c44f34730b',4738,1551785276,1544889244),
	(20,0,1617874952,0,0,0,'2',0,'/typo3conf/ext/site_package/Resources/Public/Images/logo.svg','120d1adbde95d60d61940d1ee210e34b8f6b2847','7c74b6690e0af656eabc2ee13c11c4338c9a9dc1','svg','image/svg+xml','logo.svg','7ac69e923c49347fcba76214ed7e70a66ea67384',5167,1617874136,1617874136),
	(21,0,1617874952,0,0,0,'2',0,'/typo3conf/ext/site_package/Resources/Public/Images/logo-inverted.svg','fa7e3883da5d7964d4eca21880442dc5221e179b','7c74b6690e0af656eabc2ee13c11c4338c9a9dc1','svg','image/svg+xml','logo-inverted.svg','983f42470f5a3a84c9e2b5f11016367532d2e54c',5149,1617874136,1617874136),
	(22,0,1617889323,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/Images/logo.svg','2fcd69918d078927a0312a34471b7b41d75afccd','ce640635e01515086a08cf25ad71adb8359106fc','svg','image/svg+xml','logo.svg','7ac69e923c49347fcba76214ed7e70a66ea67384',5167,1617874136,1617874136),
	(23,0,1617889323,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/Images/logo-inverted.svg','0457122c3250524555773bc415f674e5df465860','ce640635e01515086a08cf25ad71adb8359106fc','svg','image/svg+xml','logo-inverted.svg','983f42470f5a3a84c9e2b5f11016367532d2e54c',5149,1617874136,1617874136),
	(24,0,1617909711,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/FavIcons/apple-touch-icon.png','375f01fab66c4063726be4425d0791ba7992c47f','4aa5493ce36acc3704509a22dcea72b262e13d6e','png','image/png','apple-touch-icon.png','bea2f67baa4bfbebda26307ddd1d2dd3f130375f',25684,1617905488,1617905275),
	(25,0,1617909711,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/FavIcons/favicon-32x32.png','d10f1b0a1d153d6ea2dddaacd892ebdd876af854','4aa5493ce36acc3704509a22dcea72b262e13d6e','png','image/png','favicon-32x32.png','393fb3d44a0d6d7310c6dd0c38a96285d8a5eaa8',1697,1617905488,1617905275),
	(26,0,1617909711,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/FavIcons/favicon-16x16.png','90969ffde960adfb1afd9a5d56a0933209e838fa','4aa5493ce36acc3704509a22dcea72b262e13d6e','png','image/png','favicon-16x16.png','124e627d428966d749751d6307ecb34b170d7141',891,1617905488,1617905275),
	(27,0,1617909711,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/FavIcons/safari-pinned-tab.svg','147805a5e63eb9e9f01204e0f61934f43cd95070','4aa5493ce36acc3704509a22dcea72b262e13d6e','svg','image/svg+xml','safari-pinned-tab.svg','1bdc3fc311fa495be045bed3b29344e5ef49bb44',10963,1617905488,1617905276),
	(28,0,1617914534,0,0,0,'2',0,'/typo3conf/ext/bza_main/Resources/Public/Images/logo.jpg','83d9f508e434ad89947a25079d6b98c737ef5734','ce640635e01515086a08cf25ad71adb8359106fc','jpg','image/jpeg','logo.jpg','5358424cc349c9c4d94d5e02f12c4031844d2525',10991,1617914361,1614009719);

/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_file_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file_collection`;

CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `folder` text COLLATE utf8_unicode_ci,
  `recursive` smallint(6) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_file_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file_metadata`;

CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `alternative` text COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;

INSERT INTO `sys_file_metadata` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `sys_language_uid`, `l10n_parent`, `l10n_state`, `t3_origuid`, `l10n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `file`, `title`, `width`, `height`, `description`, `alternative`, `categories`)
VALUES
	(1,0,1550760141,1550760138,1,0,0,NULL,0,'',0,0,0,0,0,0,0,1,NULL,244,68,NULL,NULL,0),
	(2,0,1550760141,1550760138,1,0,0,NULL,0,'',0,0,0,0,0,0,0,2,NULL,244,68,NULL,NULL,0),
	(6,0,1551300668,1551300667,1,0,0,NULL,0,'',0,0,0,0,0,0,0,6,NULL,1536,1023,NULL,NULL,0),
	(8,0,1551301863,1551301862,1,0,0,NULL,0,'',0,0,0,0,0,0,0,8,NULL,0,0,NULL,NULL,0),
	(10,0,1551873151,1551873150,1,0,0,NULL,0,'',0,0,0,0,0,0,0,11,NULL,16,16,NULL,NULL,0),
	(11,0,1551873461,1551873459,1,0,0,NULL,0,'',0,0,0,0,0,0,0,12,'FREE TO RUN – Trailer',480,270,NULL,NULL,0),
	(12,0,1551873474,1551873472,1,0,0,NULL,0,'',0,0,0,0,0,0,0,13,'FESTIVALS LE NOUVEL ELDORADO - TEASER',480,270,NULL,NULL,0),
	(13,0,1552144094,1552144085,1,0,0,NULL,0,'',0,0,0,0,0,0,0,14,NULL,0,0,NULL,NULL,0),
	(14,0,1552144094,1552144085,1,0,0,NULL,0,'',0,0,0,0,0,0,0,15,NULL,0,0,NULL,NULL,0),
	(15,0,1552145760,1552145757,1,0,0,NULL,0,'',0,0,0,0,0,0,0,17,NULL,32,32,NULL,NULL,0),
	(16,0,1552150042,1552150039,1,0,0,NULL,0,'',0,0,0,0,0,0,0,18,NULL,32,32,NULL,NULL,0),
	(17,0,1617874951,1617874951,0,0,0,NULL,0,'',0,0,0,0,0,0,0,20,NULL,210,52,NULL,NULL,0),
	(18,0,1617874951,1617874951,0,0,0,NULL,0,'',0,0,0,0,0,0,0,21,NULL,210,52,NULL,NULL,0),
	(19,0,1617889322,1617889322,1,0,0,NULL,0,'',0,0,0,0,0,0,0,22,NULL,210,52,NULL,NULL,0),
	(20,0,1617889322,1617889322,1,0,0,NULL,0,'',0,0,0,0,0,0,0,23,NULL,210,52,NULL,NULL,0),
	(21,0,1617909709,1617909709,1,0,0,NULL,0,'',0,0,0,0,0,0,0,24,NULL,180,180,NULL,NULL,0),
	(22,0,1617909709,1617909709,1,0,0,NULL,0,'',0,0,0,0,0,0,0,25,NULL,32,32,NULL,NULL,0),
	(23,0,1617909709,1617909709,1,0,0,NULL,0,'',0,0,0,0,0,0,0,26,NULL,16,16,NULL,NULL,0),
	(24,0,1617909709,1617909709,1,0,0,NULL,0,'',0,0,0,0,0,0,0,27,NULL,400,400,NULL,NULL,0),
	(25,0,1617914533,1617914533,1,0,0,NULL,0,'',0,0,0,0,0,0,0,28,NULL,400,400,NULL,NULL,0);

/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_file_processedfile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file_processedfile`;

CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `original` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci,
  `configuration` blob,
  `configurationsha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;

INSERT INTO `sys_file_processedfile` (`uid`, `tstamp`, `crdate`, `storage`, `original`, `identifier`, `name`, `configuration`, `configurationsha1`, `originalfilesha1`, `task_type`, `checksum`, `width`, `height`)
VALUES
	(1,1617874952,1617874952,0,20,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','7ac69e923c49347fcba76214ed7e70a66ea67384','Image.CropScaleMask','7e39a21596',210,52),
	(2,1617874952,1617874952,0,21,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','983f42470f5a3a84c9e2b5f11016367532d2e54c','Image.CropScaleMask','956d827384',210,52),
	(3,1617889397,1617889397,0,22,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','7ac69e923c49347fcba76214ed7e70a66ea67384','Image.CropScaleMask','b0052c49cd',210,52),
	(4,1617889397,1617889397,0,23,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','983f42470f5a3a84c9e2b5f11016367532d2e54c','Image.CropScaleMask','2af6c2a531',210,52),
	(5,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A323530303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','43aba68494660a67b9d4176ab38f400dadb78add','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','7f3d4e5ead',NULL,NULL),
	(6,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313938343B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','7642eeeb48777e17ccfe40ad299a4b0474a4d542','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','ed676155f6',NULL,NULL),
	(7,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313533363B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','2694a2eeffabd55048583ff24d6ea6c9dc4f93ef','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','1ecb4f2820',NULL,NULL),
	(8,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313135323B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','8de26be90e3aa4677586f34972c628e4e1506fa0','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','d02307e121',NULL,NULL),
	(9,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3734383B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','5145f5cd04d938cf66bd4b729a5c2546f9f5d51c','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','41bce8169c',NULL,NULL),
	(10,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313233303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','e8dd685d94d4454a4a15facdce89bfa7aecf5f3a','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','602dc9e2fc',NULL,NULL),
	(11,1617902486,1617902486,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3937323B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','d310c0b1ed12be589e1c6244206332ab52b53b71','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','470b6c6edd',NULL,NULL),
	(12,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313130303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','013cecd923f59a410611402187055a763c68a59b','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','843657dd5d',NULL,NULL),
	(13,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3932303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','d6c532fac79f74ae7340dca7311482304d1103a0','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','7120932ab5',NULL,NULL),
	(14,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3638303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','cf2eda657680e587f6f971ef728630d6d456e19d','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','c68ddf9a77',NULL,NULL),
	(15,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3530303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','81c13e849ae84d032c9f0e3805b43b5c2b54d6ef','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','b50428d39b',NULL,NULL),
	(16,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3337343B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','fe99132c8b06a533c81165edcdfea60272e46f99','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','d4638ec502',NULL,NULL),
	(17,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313233383B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','0e3fe03991167a714328f9d48fef2ee208df2f8f','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','3a38c97d21',NULL,NULL),
	(18,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3938303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','2848b926e5a2486fd0ef59c896b694228951c79e','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','a555ac4f39',NULL,NULL),
	(19,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3735363B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','bbf9fcf1a858483e1088070608d4d2f269aaf21f','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','7e04eb7527',NULL,NULL),
	(20,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3536343B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','ba0cdb07e5f4b153bdd983c900d3ed654b33e19e','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','0fcb5a2ea3',NULL,NULL),
	(21,1617902487,1617902487,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3734363B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','c1898c49e50934a56b141ff50265187e93c39b1d','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','9bfc83c82f',NULL,NULL),
	(22,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313234353B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','edb178569aa867aa2d57f842a7b4b05dd5f6cc66','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','297f6037bc',NULL,NULL),
	(23,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3938373B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','4be245b24be6bfeab8e05006a4c2f2e06c410aed','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','40102fc5a5',NULL,NULL),
	(24,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3736333B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','4bef8ab41cff2e67f75afc46b1b0fb663278e5ff','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','b5a52975b3',NULL,NULL),
	(25,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3537313B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','57d26f2f2b2cf80f3470af971fa64d76f3f4f8ed','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','04b32b3e3a',NULL,NULL),
	(26,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313230313B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','14111f10e76c3d1b3154ea06a2468dee19cfe6a8','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','5722978faa',NULL,NULL),
	(27,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3934333B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','0ca1b8f6f8c6655b3437d26a63493b6387010428','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','24778f9771',NULL,NULL),
	(28,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3731393B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','d8a7196823c27413244be4cdb5fd9cd05737b729','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','dbef637ebd',NULL,NULL),
	(29,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A313038303B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','eacb4ae84de642d69754336c63088e7645e97223','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','ecda0daf2a',NULL,NULL),
	(30,1617902488,1617902488,1,6,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B693A3637363B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','77342f7504cd4917921de66de205d010d51ef1f8','c15fc0cf2b0e74938ec8bb8ba966cb0a67733eb9','Image.CropScaleMask','584e6ba5bc',NULL,NULL),
	(31,1617909711,1617909711,0,24,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','bea2f67baa4bfbebda26307ddd1d2dd3f130375f','Image.CropScaleMask','c6c096527f',NULL,NULL),
	(32,1617909711,1617909711,0,25,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','393fb3d44a0d6d7310c6dd0c38a96285d8a5eaa8','Image.CropScaleMask','ab1a373e65',NULL,NULL),
	(33,1617909711,1617909711,0,26,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','124e627d428966d749751d6307ecb34b170d7141','Image.CropScaleMask','0b65dc03dd',NULL,NULL),
	(34,1617909711,1617909711,0,27,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','1bdc3fc311fa495be045bed3b29344e5ef49bb44','Image.CropScaleMask','a30245b805',400,400),
	(35,1617914534,1617914534,0,28,'',NULL,X'613A373A7B733A353A227769647468223B4E3B733A363A22686569676874223B4E3B733A383A226D696E5769647468223B4E3B733A393A226D696E486569676874223B4E3B733A383A226D61785769647468223B4E3B733A393A226D6178486569676874223B4E3B733A343A2263726F70223B4E3B7D','24f48d5b4de7d99b7144e6559156976855e74b5d','5358424cc349c9c4d94d5e02f12c4031844d2525','Image.CropScaleMask','daf7c9dcf4',NULL,NULL);

/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_file_reference
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file_reference`;

CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  `table_local` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `alternative` text COLLATE utf8_unicode_ci,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT '0',
  `showinpreview` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;

INSERT INTO `sys_file_reference` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `sys_language_uid`, `l10n_parent`, `l10n_state`, `l10n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `uid_local`, `uid_foreign`, `tablenames`, `fieldname`, `sorting_foreign`, `table_local`, `title`, `description`, `alternative`, `link`, `crop`, `autoplay`, `showinpreview`)
VALUES
	(5,9,1551690970,1551301686,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,1,'tx_news_domain_model_news','fal_media',1,'sys_file','Image title','This is the image caption','Alternative text for image','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(6,9,1551690970,1551301686,1,0,0,1,5,NULL,X'613A313A7B733A363A2268696464656E223B693A303B7D',0,0,0,0,0,0,0,6,2,'tx_news_domain_model_news','fal_media',1,'sys_file','Titre de l\'image','Ceci est la légende de l\'image','Text alternatif pour l\'image','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(7,9,1551690970,1551301968,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,8,1,'tx_news_domain_model_news','fal_related_files',1,'sys_file','Here goes a related document','This document is totally related to this news',NULL,'','',0,0),
	(8,9,1551690970,1551301968,1,0,0,1,7,NULL,'',0,0,0,0,0,0,0,8,2,'tx_news_domain_model_news','fal_related_files',1,'sys_file','Voici un document associé','Ce document est totalement lié à cette actualité',NULL,'','',0,0),
	(9,9,1551685313,1551359762,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,8,12,'tx_news_domain_model_news','fal_related_files',1,'sys_file','Related document title','This is the description of the file you\'re about to download',NULL,'','',0,0),
	(10,9,1551685353,1551359783,1,0,0,1,9,NULL,X'613A363A7B733A353A227469746C65223B733A32323A2252656C6174656420646F63756D656E74207469746C65223B733A31313A226465736372697074696F6E223B733A36303A225468697320697320746865206465736372697074696F6E206F66207468652066696C6520796F752772652061626F757420746F20646F776E6C6F6164223B733A393A227569645F6C6F63616C223B693A383B733A363A2268696464656E223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31306E5F706172656E74223B693A303B7D',0,0,0,0,0,0,0,8,13,'tx_news_domain_model_news','fal_related_files',1,'sys_file','Titre du document à télécharger','Ceci est la description du document à télécharger',NULL,'','',0,0),
	(11,9,1551360497,1551360497,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,7,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(12,9,1551360497,1551360497,1,0,0,1,0,NULL,'',0,0,0,0,0,0,0,6,0,'','',0,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(13,9,1551684651,1551360497,1,0,0,0,0,NULL,X'613A393A7B733A31333A2273686F77696E70726576696577223B4E3B733A353A227469746C65223B4E3B733A31313A22616C7465726E6174697665223B4E3B733A343A226C696E6B223B4E3B733A31313A226465736372697074696F6E223B4E3B733A343A2263726F70223B4E3B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,6,9,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(14,9,1551360497,1551360497,1,0,0,1,0,NULL,'',0,0,0,0,0,0,0,6,0,'','',0,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(15,9,1551360497,1551360497,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,3,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(16,9,1551360497,1551360497,1,0,0,1,0,NULL,'',0,0,0,0,0,0,0,6,0,'','',0,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(17,9,1551360497,1551360497,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,5,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(18,9,1551360497,1551360497,1,0,0,1,0,NULL,'',0,0,0,0,0,0,0,6,0,'','',0,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(19,9,1551685353,1551360497,1,0,0,1,11,NULL,'',0,0,0,0,0,0,0,6,8,'tx_news_domain_model_news','fal_media',1,'sys_file','[Translate to Français:] ','[Translate to Français:] ','[Translate to Français:] ','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(20,9,1551685353,1551360497,1,0,0,1,13,NULL,'',0,0,0,0,0,0,0,6,10,'tx_news_domain_model_news','fal_media',1,'sys_file','[Translate to Français:] ','[Translate to Français:] ','[Translate to Français:] ','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(21,9,1551685353,1551360497,1,0,0,1,15,NULL,'',0,0,0,0,0,0,0,6,4,'tx_news_domain_model_news','fal_media',1,'sys_file','[Translate to Français:] ','[Translate to Français:] ','[Translate to Français:] ','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(22,9,1551685353,1551360497,1,0,0,1,17,NULL,'',0,0,0,0,0,0,0,6,6,'tx_news_domain_model_news','fal_media',1,'sys_file','[Translate to Français:] ','[Translate to Français:] ','[Translate to Français:] ','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(23,9,1551685313,1551685243,1,0,0,0,0,NULL,X'613A393A7B733A31333A2273686F77696E70726576696577223B4E3B733A353A227469746C65223B4E3B733A31313A22616C7465726E6174697665223B4E3B733A343A226C696E6B223B4E3B733A31313A226465736372697074696F6E223B4E3B733A343A2263726F70223B4E3B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,6,12,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,1),
	(24,9,1551685353,1551685243,1,0,0,1,23,NULL,'',0,0,0,0,0,0,0,6,13,'tx_news_domain_model_news','fal_media',1,'sys_file','[Translate to Français:] ','[Translate to Français:] ','[Translate to Français:] ','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(25,9,1551690970,1551689770,1,0,0,0,0,NULL,X'613A383A7B733A353A227469746C65223B4E3B733A31313A22616C7465726E6174697665223B4E3B733A343A226C696E6B223B4E3B733A31313A226465736372697074696F6E223B4E3B733A343A2263726F70223B4E3B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,6,66,'tt_content','assets',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(40,5,1551866867,1551866867,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,105,'tt_content','assets',1,'sys_file','This is the image title','This is the caption of the image','The is the image\'s alternative text','','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(41,5,1551867274,1551867231,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,106,'tt_content','media',1,'sys_file','This is a link to an image','Here goes the description of the file',NULL,'','',0,0),
	(42,5,1551867274,1551867231,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,8,106,'tt_content','media',2,'sys_file','This is a link to a PDF','Here goes the description of the file',NULL,'','',0,0),
	(43,5,1551867985,1551867680,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,1,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(44,5,1551867985,1551867985,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,2,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(45,5,1551868045,1551868045,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,3,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(46,5,1551868045,1551868045,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,4,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(47,5,1551868414,1551868414,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,5,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(48,5,1551868414,1551868414,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,6,'tx_bootstrappackage_carousel_item','background_image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(49,5,1551869086,1551869086,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,3,'tx_bootstrappackage_timeline_item','image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(51,5,1551870852,1551870852,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,1,'tx_bootstrappackage_card_group_item','image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(52,5,1551870956,1551870956,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,2,'tx_bootstrappackage_card_group_item','image',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(53,5,1551873230,1551873230,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,11,1,'tx_bootstrappackage_icon_group_item','icon_file',1,'sys_file',NULL,NULL,NULL,'','',0,0),
	(54,5,1551873296,1551873267,1,0,0,0,0,NULL,X'613A333A7B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,11,2,'tx_bootstrappackage_icon_group_item','icon_file',1,'sys_file',NULL,NULL,NULL,'','',0,0),
	(55,5,1551873368,1551873296,1,0,0,0,0,NULL,X'613A333A7B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,11,3,'tx_bootstrappackage_icon_group_item','icon_file',1,'sys_file',NULL,NULL,NULL,'','',0,0),
	(56,5,1551873368,1551873368,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,11,4,'tx_bootstrappackage_icon_group_item','icon_file',1,'sys_file',NULL,NULL,NULL,'','',0,0),
	(57,5,1551873477,1551873477,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,12,123,'tt_content','assets',1,'sys_file',NULL,NULL,NULL,'','',0,0),
	(58,5,1551873477,1551873477,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,13,123,'tt_content','assets',2,'sys_file',NULL,NULL,NULL,'','',0,0),
	(59,5,1551873699,1551873577,1,0,0,0,0,NULL,X'613A383A7B733A353A227469746C65223B4E3B733A31313A22616C7465726E6174697665223B4E3B733A343A226C696E6B223B4E3B733A31313A226465736372697074696F6E223B4E3B733A343A2263726F70223B4E3B733A393A227569645F6C6F63616C223B4E3B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,6,1,'tx_bootstrappackage_tab_item','media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(63,5,1551892175,1551892124,1,0,0,0,0,NULL,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,6,5,'pages','thumbnail',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(65,8,1551892210,1551892210,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,8,'pages','thumbnail',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(66,8,1551892210,1551892210,1,0,0,1,65,NULL,'',0,0,0,0,0,0,0,6,13,'pages','thumbnail',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),
	(67,5,1602235878,1602235878,1,0,0,0,0,NULL,'',0,0,0,0,0,0,0,6,214,'tt_content','assets',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"large\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"medium\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"small\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null},\"extrasmall\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0);

/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_file_storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_file_storage`;

CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext COLLATE utf8_unicode_ci,
  `configuration` text COLLATE utf8_unicode_ci,
  `is_default` smallint(6) NOT NULL DEFAULT '0',
  `is_browsable` smallint(6) NOT NULL DEFAULT '0',
  `is_public` smallint(6) NOT NULL DEFAULT '0',
  `is_writable` smallint(6) NOT NULL DEFAULT '0',
  `is_online` smallint(6) NOT NULL DEFAULT '1',
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT '1',
  `processingfolder` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;

INSERT INTO `sys_file_storage` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `description`, `name`, `driver`, `configuration`, `is_default`, `is_browsable`, `is_public`, `is_writable`, `is_online`, `auto_extract_metadata`, `processingfolder`)
VALUES
	(1,0,1550750841,1550750841,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin/ (auto-created)','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);

/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_filemounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_filemounts`;

CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT '0',
  `read_only` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_history`;

CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `actiontype` smallint(6) NOT NULL DEFAULT '0',
  `usertype` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT '0',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext COLLATE utf8_unicode_ci,
  `workspace` int(11) DEFAULT '0',
  `correlation_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;

INSERT INTO `sys_history` (`uid`, `tstamp`, `actiontype`, `usertype`, `userid`, `originaluserid`, `recuid`, `tablename`, `history_data`, `workspace`, `correlation_id`)
VALUES
	(1,1617875018,2,'BE',1,0,1,'be_users','{\"oldRecord\":{\"password\":\"$2y$12$gCel\\/aspE4OlktIjwrkjPuDxv.CYNjMccMlwk0yd6tFJk4VEJxyVS\"},\"newRecord\":{\"password\":\"$2y$12$f1YIpb0zhLCXGFs6MBVqUODXQzlj.9nPxCjdNGLyJ\\/Rk8yT7oNLna\"}}',0,'0400$b3aefd1db8e2468dbd5073c538eb92af:084907bc914ff27cf2301aec50eb66b2'),
	(2,1617889309,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"include_static_file\":\"EXT:site_package\\/Configuration\\/TypoScript\"},\"newRecord\":{\"include_static_file\":\"EXT:bza_main\\/Configuration\\/TypoScript\"}}',0,'0400$30c6ae12a7d4d4dd2472b8ba529a2c86:35af6288617af54964e77af08c30949a'),
	(3,1617904366,2,'BE',1,0,1,'fe_users','{\"oldRecord\":{\"username\":\"julien.henchoz@ideative.ch\",\"password\":\"$2y$12$HVat58zoHhbFf9K01H8r5uds8m7tSPBwWFekTADu0x07vDze12ds.\"},\"newRecord\":{\"username\":\"etienne.bertrand.zang@gmail.com\",\"password\":\"$2y$12$a3N4dDhe3.2rcUQehl1evOQV4FqPDHj4\\/LMzq07erS4XsBAFxQ9qa\"}}',0,'0400$a8766bb6086df93b8de423a92ef772df:237e89c1b2a56068427543279fe1982e');

/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_language`;

CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `locale` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hreflang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `direction` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;

INSERT INTO `sys_language` (`uid`, `pid`, `tstamp`, `hidden`, `sorting`, `title`, `flag`, `language_isocode`, `nav_title`, `locale`, `hreflang`, `direction`)
VALUES
	(1,0,1551810433,0,256,'English','gb','en','','','','');

/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_lockedrecords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_lockedrecords`;

CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `record_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT '0',
  `record_pid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;

INSERT INTO `sys_lockedrecords` (`uid`, `userid`, `tstamp`, `record_table`, `record_uid`, `record_pid`, `username`, `feuserid`)
VALUES
	(2,1,1617965978,'sys_template',1,0,'idtypo3',0);

/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recuid` int(10) unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT '0',
  `error` smallint(5) unsigned NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `details_nr` smallint(6) NOT NULL DEFAULT '0',
  `IP` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8_unicode_ci,
  `event_pid` int(11) NOT NULL DEFAULT '-1',
  `workspace` int(11) NOT NULL DEFAULT '0',
  `NEWid` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT '0',
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `parent` (`pid`),
  KEY `errorcount` (`tstamp`,`error`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` (`uid`, `pid`, `tstamp`, `userid`, `action`, `recuid`, `tablename`, `recpid`, `error`, `details`, `type`, `details_nr`, `IP`, `log_data`, `event_pid`, `workspace`, `NEWid`, `request_id`, `time_micro`, `component`, `level`, `message`, `data`)
VALUES
	(1,0,1617968361,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,0,'::1','a:2:{i:0;s:7:\"idtypo3\";i:1;s:3:\"all\";}',-1,0,'','',0,'',0,NULL,NULL),
	(2,0,1617968363,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,0,'::1','a:2:{i:0;s:7:\"idtypo3\";i:1;s:5:\"pages\";}',-1,0,'','',0,'',0,NULL,NULL);

/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_news`;

CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_redirect
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_redirect`;

CREATE TABLE `sys_redirect` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedon` int(10) unsigned NOT NULL DEFAULT '0',
  `createdon` int(10) unsigned NOT NULL DEFAULT '0',
  `createdby` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `source_host` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_path` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_regexp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `force_https` smallint(5) unsigned NOT NULL DEFAULT '0',
  `respect_query_parameters` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keep_query_parameters` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target_statuscode` int(11) NOT NULL DEFAULT '307',
  `hitcount` int(11) NOT NULL DEFAULT '0',
  `lasthiton` int(11) NOT NULL DEFAULT '0',
  `disable_hitcount` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `index_source` (`source_host`(80),`source_path`(80)),
  KEY `parent` (`pid`,`deleted`,`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sys_refindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_refindex`;

CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT '0',
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `workspace` int(11) NOT NULL DEFAULT '0',
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT '0',
  `ref_string` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;

INSERT INTO `sys_refindex` (`hash`, `tablename`, `recuid`, `field`, `flexpointer`, `softref_key`, `softref_id`, `sorting`, `deleted`, `workspace`, `ref_table`, `ref_uid`, `ref_string`)
VALUES
	('03484cc9b243176ab9ece2f4cc0549b1','tt_content',218,'tx_container_parent','','','',0,0,0,'tt_content',216,''),
	('05cfff6ffedac2ddf2e4794a56ae900d','pages',152,'sys_language_uid','','','',0,0,0,'sys_language',1,''),
	('08dda64e164f907f66e2c75906225193','sys_file',14,'storage','','','',0,0,0,'sys_file_storage',1,''),
	('130bf2d0d7b637ca034f61ea15b94574','sys_file',15,'storage','','','',0,0,0,'sys_file_storage',1,''),
	('1d1f7032de8d9616f4ceacd21c4bfc71','tt_content',217,'tx_container_parent','','','',0,0,0,'tt_content',216,''),
	('34b9e6d767d7fd2531ccfe699c0ba894','tt_content',179,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','54ea2b5d8afeac70076ddd3fc37897b5',-1,0,0,'sys_file',15,''),
	('37b22d1fbb755eec169f1a9534554b19','tt_content',218,'records','','','',0,0,0,'tt_content',214,''),
	('380d428a2deeda1b9a3a95bd7522065d','pages',155,'l10n_parent','','','',0,1,0,'pages',4,''),
	('45200169656b9b96854b35a7d3835ff9','pages',155,'sys_language_uid','','','',0,1,0,'sys_language',1,''),
	('6f0ad722303ff36a7bc9e1190c5d0313','pages',152,'l10n_parent','','','',0,0,0,'pages',151,''),
	('8ba01abd3ce16dc75b77e3c3906d7713','fe_users',1,'usergroup','','','',0,0,0,'fe_groups',1,''),
	('b6987ff6bebb239d89ebf1b3d1647639','sys_language',1,'static_lang_isocode','','','',0,0,0,'static_languages',30,''),
	('c5efbbd9e541f7ade21e2051831b2c22','tt_content',217,'records','','','',0,0,0,'tt_content',105,''),
	('e418b4d779a5d25330ddc2e3aaf6657c','pages',154,'l10n_parent','','','',0,0,0,'pages',153,''),
	('f28d02924caca0a140a621ab3f5376bb','pages',154,'sys_language_uid','','','',0,0,0,'sys_language',1,''),
	('fbee753b6f001cb6547c0d143aa7605a','tt_content',182,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','9fe3908f15f50943c6c5f416b6adf85f',-1,0,0,'sys_file',14,'');

/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_registry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_registry`;

CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;

INSERT INTO `sys_registry` (`uid`, `entry_namespace`, `entry_key`, `entry_value`)
VALUES
	(1,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ExtensionManagerTables',X'693A313B'),
	(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\WizardDoneToRegistry',X'693A313B'),
	(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\StartModuleUpdate',X'693A313B'),
	(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FrontendUserImageUpdateWizard',X'693A313B'),
	(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\DatabaseRowsUpdateWizard',X'693A313B'),
	(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CommandLineBackendUserRemovalUpdate',X'693A313B'),
	(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FillTranslationSourceField',X'693A313B'),
	(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SectionFrameToFrameClassUpdate',X'693A313B'),
	(9,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SplitMenusUpdate',X'693A313B'),
	(10,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BulletContentElementUpdate',X'693A313B'),
	(11,'installUpdate','TYPO3\\CMS\\Install\\Updates\\UploadContentElementUpdate',X'693A313B'),
	(12,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateFscStaticTemplateUpdate',X'693A313B'),
	(13,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FileReferenceUpdate',X'693A313B'),
	(14,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateFeSessionDataUpdate',X'693A313B'),
	(15,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Compatibility7ExtractionUpdate',X'693A313B'),
	(16,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FormLegacyExtractionUpdate',X'693A313B'),
	(17,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RteHtmlAreaExtractionUpdate',X'693A313B'),
	(18,'installUpdate','TYPO3\\CMS\\Install\\Updates\\LanguageSortingUpdate',X'693A313B'),
	(19,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Typo3DbExtractionUpdate',X'693A313B'),
	(20,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FuncExtractionUpdate',X'693A313B'),
	(21,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateUrlTypesInPagesUpdate',X'693A313B'),
	(22,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SeparateSysHistoryFromSysLogUpdate',X'693A313B'),
	(23,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectExtractionUpdate',X'693A313B'),
	(24,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserStartModuleUpdate',X'693A313B'),
	(25,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayUpdate',X'693A313B'),
	(26,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayBeGroupsAccessRights',X'693A313B'),
	(27,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendLayoutIconUpdateWizard',X'693A313B'),
	(28,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectsExtensionUpdate',X'693A313B'),
	(29,'installUpdate','TYPO3\\CMS\\Install\\Updates\\AdminPanelInstall',X'693A313B'),
	(30,'installUpdate','TYPO3\\CMS\\Install\\Updates\\PopulatePageSlugs',X'693A313B'),
	(31,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Argon2iPasswordHashes',X'693A313B'),
	(32,'installUpdate','TYPO3\\CMS\\Form\\Hooks\\FormFileExtensionUpdate',X'693A313B'),
	(33,'core','formProtectionSessionToken:1',X'733A36343A2233313838313835666531653539666333306236343861663335356264633336653430333332666237326561656633633962666266373835616530346362373435223B'),
	(34,'core','formProtectionSessionToken:2',X'733A36343A2233643461306439303466393837323937366235323234646265666630353331346338616432373339373830323764646435376464303433636139616432656330223B'),
	(35,'installUpdate','resetDummyData',X'693A313B'),
	(36,'languagePacks','baseUrl',X'733A33333A2268747470733A2F2F6C6F63616C697A652E7479706F332E6F72672F786C6966662F223B'),
	(37,'languagePacks','fr-eventnews',X'693A313535323134363832373B'),
	(38,'languagePacks','fr-id_feuser',X'693A313535323134363833323B'),
	(39,'languagePacks','fr-id_news',X'693A313631373837343638343B'),
	(40,'languagePacks','fr-site_package',X'693A313631373837343638353B'),
	(41,'languagePacks','fr',X'693A313631373837343638363B'),
	(42,'languagePacks','fr-id_redirect40x',X'693A313631373837343638343B'),
	(43,'languagePacks','fr-maps2',X'693A313535323134363833353B'),
	(44,'extensionDataImport','typo3conf/ext/content_defender/ext_tables_static+adt.sql',X'733A303A22223B'),
	(45,'languagePacks','fr-container',X'693A313631373837343638333B'),
	(46,'languagePacks','fr-id_events',X'693A313631373837343638343B'),
	(47,'languagePacks','fr-id_utils',X'693A313631373837343638343B'),
	(48,'languagePacks','fr-logentries',X'693A313631373837343638343B'),
	(49,'languagePacks','fr-sluggi',X'693A313631373837343638353B');

/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_template`;

CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clear` smallint(5) unsigned NOT NULL DEFAULT '0',
  `include_static_file` text COLLATE utf8_unicode_ci,
  `constants` text COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci,
  `basedOn` tinytext COLLATE utf8_unicode_ci,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT '0',
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;

INSERT INTO `sys_template` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `description`, `t3_origuid`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `title`, `sitetitle`, `root`, `clear`, `include_static_file`, `constants`, `config`, `basedOn`, `includeStaticAfterBasedOn`, `static_file_mode`, `tx_impexp_origuid`)
VALUES
	(1,1,1617889309,1550750822,1,0,0,0,0,0,'Ideative HOW TO :\r\n\r\nAll TypoScript configurations must be stored in *.typoscript files. \r\n\r\nThis Template should only load the Site Package template.\r\n\r\nFor better code maintenance, the templates of the different extensions installed in this system should only be loaded from \"EXT:/site_package/Configuration/TypoScript/General/setup.typoscript\" by adding the line\r\n\r\n<INCLUDE_TYPOSCRIPT: source=\"FILE:EXT:extension_key/Configuration/TypoScript/setup.typoscript\">',0,0,0,0,0,0,0,0,'Main TypoScript Rendering','Dummy TYPO3',1,1,'EXT:bza_main/Configuration/TypoScript','','',NULL,0,0,0),
	(3,8,1551694457,1551693564,1,0,0,0,0,256,NULL,0,0,0,0,0,0,0,0,'News RSS','',0,0,'EXT:id_news/Configuration/TypoScript/Rss',NULL,NULL,'',0,0,0);

/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tt_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tt_content`;

CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text COLLATE utf8_unicode_ci,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `editlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_source` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l18n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `CType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext COLLATE utf8_unicode_ci,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `assets` int(10) unsigned NOT NULL DEFAULT '0',
  `image` int(10) unsigned NOT NULL DEFAULT '0',
  `imagewidth` int(10) unsigned NOT NULL DEFAULT '0',
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media` int(10) unsigned NOT NULL DEFAULT '0',
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `frame_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT '0',
  `space_before_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8_unicode_ci,
  `pages` text COLLATE utf8_unicode_ci,
  `colPos` int(11) NOT NULL DEFAULT '0',
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT '0',
  `header_layout` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT '0',
  `file_collections` text COLLATE utf8_unicode_ci,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filelink_sorting` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `recursive` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imageheight` int(10) unsigned NOT NULL DEFAULT '0',
  `pi_flexform` mediumtext COLLATE utf8_unicode_ci,
  `accessibility_title` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT '0',
  `accessibility_bypass_text` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `selected_categories` text COLLATE utf8_unicode_ci,
  `category_field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
  `teaser` text COLLATE utf8_unicode_ci,
  `readmore_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quote_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quote_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `panel_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `file_folder` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT '0',
  `icon_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_size` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `icon_type` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `icon_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_background` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `external_media_source` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `external_media_ratio` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_bootstrappackage_card_group_item` int(10) unsigned DEFAULT '0',
  `tx_bootstrappackage_carousel_item` int(10) unsigned DEFAULT '0',
  `tx_bootstrappackage_accordion_item` int(10) unsigned DEFAULT '0',
  `tx_bootstrappackage_icon_group_item` int(10) unsigned DEFAULT '0',
  `tx_bootstrappackage_tab_item` int(10) unsigned DEFAULT '0',
  `tx_bootstrappackage_timeline_item` int(10) unsigned DEFAULT '0',
  `background_color_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT '0',
  `background_image_options` mediumtext COLLATE utf8_unicode_ci,
  `tx_news_related_news` int(11) NOT NULL DEFAULT '0',
  `categories` int(11) NOT NULL DEFAULT '0',
  `columns_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_yoastseo_linking_suggestions` int(11) NOT NULL DEFAULT '0',
  `overtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_container_parent` int(11) NOT NULL DEFAULT '0',
  `enable_mobile_slider` smallint(6) NOT NULL DEFAULT '0',
  `accordion_open_first` int(11) NOT NULL DEFAULT '0',
  `accordion_allow_multiple` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `index_newscontent` (`tx_news_related_news`),
  KEY `translation_source` (`l10n_source`),
  KEY `container_parent` (`tx_container_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;

INSERT INTO `tt_content` (`uid`, `rowDescription`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `fe_group`, `sorting`, `editlock`, `sys_language_uid`, `l18n_parent`, `l10n_source`, `l10n_state`, `t3_origuid`, `l18n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `CType`, `header`, `header_position`, `bodytext`, `bullets_type`, `uploads_description`, `uploads_type`, `assets`, `image`, `imagewidth`, `imageorient`, `imagecols`, `imageborder`, `media`, `layout`, `frame_class`, `cols`, `space_before_class`, `space_after_class`, `records`, `pages`, `colPos`, `subheader`, `header_link`, `image_zoom`, `header_layout`, `list_type`, `sectionIndex`, `linkToTop`, `file_collections`, `filelink_size`, `filelink_sorting`, `filelink_sorting_direction`, `target`, `date`, `recursive`, `imageheight`, `pi_flexform`, `accessibility_title`, `accessibility_bypass`, `accessibility_bypass_text`, `selected_categories`, `category_field`, `table_class`, `table_caption`, `table_delimiter`, `table_enclosure`, `table_header_position`, `table_tfoot`, `tx_impexp_origuid`, `teaser`, `readmore_label`, `quote_source`, `quote_link`, `panel_class`, `file_folder`, `icon`, `icon_set`, `icon_file`, `icon_position`, `icon_size`, `icon_type`, `icon_color`, `icon_background`, `external_media_source`, `external_media_ratio`, `tx_bootstrappackage_card_group_item`, `tx_bootstrappackage_carousel_item`, `tx_bootstrappackage_accordion_item`, `tx_bootstrappackage_icon_group_item`, `tx_bootstrappackage_tab_item`, `tx_bootstrappackage_timeline_item`, `background_color_class`, `background_image`, `background_image_options`, `tx_news_related_news`, `categories`, `columns_size`, `tx_yoastseo_linking_suggestions`, `overtitle`, `tx_container_parent`, `enable_mobile_slider`, `accordion_open_first`, `accordion_allow_multiple`)
VALUES
	(1,'',5,1601651551,1551220221,1,0,0,0,0,'',15104,0,0,0,0,NULL,0,X'613A31373A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','2 columns, equal width with container-fluid','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','none',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\">blur</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'equal-width',0,'',0,0,0,0),
	(5,'',5,1601651532,1551220535,1,0,0,0,0,'',1026,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Column 1','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum egestas augue quis lectus sagittis consectetur. Nunc a diam eros. Praesent sollicitudin, lacus suscipit dignissim hendrerit, lectus sapien malesuada nunc, vitae dignissim tortor neque et magna. Nulla aliquam orci ipsum, in posuere sem dictum id. Quisque dapibus tellus eros, id congue massa cursus et.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','none',0,'','normal',NULL,NULL,201,'','',0,'3','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',1,0,0,0),
	(6,'',5,1601651532,1551220556,1,0,0,0,0,'',1025,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Column 2','','<p>Aliquam tempor ante a commodo viverra. Nam aliquet elementum porttitor. Proin nec arcu pharetra, lobortis nisi at, congue ligula. Donec ac pellentesque massa. Curabitur sollicitudin tincidunt nulla eu varius. Praesent ultricies nec risus a congue. Cras interdum libero sed justo facilisis, facilisis pulvinar risus elementum. Quisque faucibus volutpat nulla ut pretium.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','none',0,'','normal',NULL,NULL,202,'','',0,'3','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',1,0,0,0),
	(7,'',5,1551353244,1551272906,1,0,0,0,0,'',15360,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','2 columns, left wide with container','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'secondary',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(8,'',5,1551353254,1551272925,1,0,0,0,0,'',15616,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','2 columns, right wide','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'right-wide',0,'',0,0,0,0),
	(9,NULL,5,1551353244,1551272944,1,0,0,0,0,'0',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_5',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',7,0,0,0),
	(10,NULL,5,1551353244,1551272954,1,0,0,0,0,'0',3074,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',7,0,0,0),
	(11,NULL,5,1551353254,1551273002,1,0,0,0,0,'0',3074,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',8,0,0,0),
	(12,NULL,5,1551353254,1551273042,1,0,0,0,0,'0',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_5',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',8,0,0,0),
	(13,'',5,1551353317,1551273507,1,0,0,0,0,'',15872,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-3columns','3 columns equal width','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'primary',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'0',0,'',0,0,0,0),
	(14,'',5,1551353305,1551273531,1,0,0,0,0,'',16128,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-3columns','3 columns, left wide','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'dark',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(15,'',5,1551353268,1551273549,1,0,0,0,0,'',16384,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-3columns','3 columns, right wide','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'right-wide',0,'',0,0,0,0),
	(16,NULL,5,1551353317,1551273561,1,0,0,0,0,'0',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_5',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',13,0,0,0),
	(17,NULL,5,1551353305,1551273566,1,0,0,0,0,'0',3075,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_5',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',14,0,0,0),
	(18,NULL,5,1551353268,1551273571,1,0,0,0,0,'0',3075,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_5',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',15,0,0,0),
	(19,NULL,5,1551353317,1551273582,1,0,0,0,0,'0',3075,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',13,0,0,0),
	(20,NULL,5,1551353305,1551273588,1,0,0,0,0,'0',3074,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',14,0,0,0),
	(21,NULL,5,1551353268,1551273595,1,0,0,0,0,'0',3074,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',15,0,0,0),
	(22,'',5,1551353065,1551273611,1,0,0,0,0,'',16640,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-4columns','4 columns','',NULL,0,0,0,0,0,0,0,2,0,0,'container-fluid','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'light',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'0',0,'',0,0,0,0),
	(25,NULL,5,1551353065,1551273677,1,0,0,0,0,'0',3076,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',22,0,0,0),
	(28,NULL,5,1551353065,1551273727,1,0,0,0,0,'0',3075,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_6',NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',22,0,0,0),
	(32,NULL,5,1551353305,1551273788,1,0,0,0,0,'0',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_201',NULL,203,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',14,0,0,0),
	(33,NULL,5,1551353268,1551273795,1,0,0,0,0,'0',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_201',NULL,203,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',15,0,0,0),
	(34,NULL,5,1551353065,1551273801,1,0,0,0,0,'0',3074,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_201',NULL,203,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',22,0,0,0),
	(37,'',5,1551353065,1551273846,1,0,0,0,0,'',3073,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Column 4','','<p>Aenean hendrerit, felis non hendrerit sollicitudin, sem dui tincidunt erat, in ultricies leo est vitae urna. Nunc ac ante eu quam ultricies pellentesque in id ex. Praesent dignissim efficitur tellus, at cursus ligula consequat eu. Mauris vitae diam porta, placerat lacus ultrices, congue ipsum. Curabitur id justo ac odio varius consequat et eget felis. Pellentesque a orci quis nisl blandit malesuada.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','none',0,'','normal',NULL,NULL,204,'','',0,'3','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',22,0,0,0),
	(38,'',5,1601651532,1551285781,1,0,0,0,0,'',3073,0,1,6,6,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',6,X'613A33343A7B733A353A224354797065223B733A393A22746578746D65646961223B733A363A22636F6C506F73223B693A2D313B733A363A22686561646572223B733A383A22436F6C756D6E2032223B733A31333A226865616465725F6C61796F7574223B733A313A2233223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A303A22223B733A383A22626F647974657874223B733A3337363A223C703E416C697175616D2074656D706F7220616E7465206120636F6D6D6F646F20766976657272612E204E616D20616C697175657420656C656D656E74756D20706F72747469746F722E2050726F696E206E656320617263752070686172657472612C206C6F626F72746973206E6973692061742C20636F6E677565206C6967756C612E20446F6E65632061632070656C6C656E746573717565206D617373612E2043757261626974757220736F6C6C696369747564696E2074696E636964756E74206E756C6C61206575207661726975732E205072616573656E7420756C74726963696573206E6563207269737573206120636F6E6775652E204372617320696E74657264756D206C696265726F20736564206A7573746F20666163696C697369732C20666163696C697369732070756C76696E617220726973757320656C656D656E74756D2E205175697371756520666175636962757320766F6C7574706174206E756C6C61207574207072657469756D2E3C2F703E223B733A363A22617373657473223B693A303B733A31313A22696D6167656F7269656E74223B693A303B733A393A22696D616765636F6C73223B693A323B733A31303A22696D6167655F7A6F6F6D223B693A303B733A363A226C61796F7574223B733A31323A226E6F2D636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A313B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B693A323B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'textmedia','Colonne 2','','<p>Aliquam tempor ante a commodo viverra. Nam aliquet elementum porttitor. Proin nec arcu pharetra, lobortis nisi at, congue ligula. Donec ac pellentesque massa. Curabitur sollicitudin tincidunt nulla eu varius. Praesent ultricies nec risus a congue. Cras interdum libero sed justo facilisis, facilisis pulvinar risus elementum. Quisque faucibus volutpat nulla ut pretium.</p>\r\n\r\n',0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal','','',202,'','',0,'3','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',40,0,0,0),
	(39,'',5,1601651532,1551285781,1,0,0,0,0,'',3074,0,1,5,5,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',5,X'613A33343A7B733A353A224354797065223B733A393A22746578746D65646961223B733A363A22636F6C506F73223B693A2D313B733A363A22686561646572223B733A383A22436F6C756D6E2031223B733A31333A226865616465725F6C61796F7574223B733A313A2233223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A303A22223B733A383A22626F647974657874223B733A3337363A223C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E73656374657475722061646970697363696E6720656C69742E20566573746962756C756D20656765737461732061756775652071756973206C656374757320736167697474697320636F6E73656374657475722E204E756E632061206469616D2065726F732E205072616573656E7420736F6C6C696369747564696E2C206C61637573207375736369706974206469676E697373696D2068656E6472657269742C206C65637475732073617069656E206D616C657375616461206E756E632C207669746165206469676E697373696D20746F72746F72206E65717565206574206D61676E612E204E756C6C6120616C697175616D206F72636920697073756D2C20696E20706F73756572652073656D2064696374756D2069642E205175697371756520646170696275732074656C6C75732065726F732C20696420636F6E677565206D61737361206375727375732065742E3C2F703E223B733A363A22617373657473223B693A303B733A31313A22696D6167656F7269656E74223B693A303B733A393A22696D616765636F6C73223B693A323B733A31303A22696D6167655F7A6F6F6D223B693A303B733A363A226C61796F7574223B733A31323A226E6F2D636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A313B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B693A313B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'textmedia','Colonne 1','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum egestas augue quis lectus sagittis consectetur. Nunc a diam eros. Praesent sollicitudin, lacus suscipit dignissim hendrerit, lectus sapien malesuada nunc, vitae dignissim tortor neque et magna. Nulla aliquam orci ipsum, in posuere sem dictum id. Quisque dapibus tellus eros, id congue massa cursus et.</p>\r\n\r\n',0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal','','',201,'','',0,'3','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',40,0,0,0),
	(40,'',5,1601651551,1551285781,1,0,0,0,0,'',20864,0,1,1,1,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',1,X'613A33313A7B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A34333A223220636F6C756D6E732C20657175616C207769647468207769746820636F6E7461696E65722D666C756964223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2232223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A323B733A363A226C61796F7574223B733A31323A226E6F2D636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A343A226E6F6E65223B733A31373A2273706163655F61667465725F636C617373223B733A343A226E6F6E65223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535393A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E626C75723C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A31313A22657175616C2D7769647468223B733A363A22617373657473223B693A303B7D',0,0,0,0,0,0,0,'container-2columns','2 colonnes, largeur égale','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','none','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\">blur</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'equal-width',0,'',0,0,0,0),
	(41,NULL,5,1551431183,1551285781,1,0,0,0,0,'',3073,0,1,9,9,NULL,9,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',43,0,0,0),
	(42,NULL,5,1551431183,1551285781,1,0,0,0,0,'',3074,0,1,10,10,NULL,10,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',43,0,0,0),
	(43,'',5,1551431183,1551285781,1,0,0,0,0,'',20928,0,1,7,7,NULL,7,X'613A33303A7B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A33353A223220636F6C756D6E732C206C6566742077696465207769746820636F6E7461696E6572223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2232223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A323B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A393A227365636F6E64617279223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A393A226C6566742D77696465223B7D',0,0,0,0,0,0,0,'container-2columns','2 colonnes, gauche large','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'secondary',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(44,NULL,5,1551431243,1551285781,1,0,0,0,0,'',3073,0,1,12,12,NULL,12,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',46,0,0,0),
	(45,NULL,5,1551431243,1551285781,1,0,0,0,0,'',3074,0,1,11,11,NULL,11,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',46,0,0,0),
	(46,'',5,1551431243,1551285781,1,0,0,0,0,'',20960,0,1,8,8,NULL,8,X'613A33303A7B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A32313A223220636F6C756D6E732C2072696768742077696465223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2232223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A323B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A31303A2272696768742D77696465223B7D',0,0,0,0,0,0,0,'container-2columns','2 colonnes, droite large','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'right-wide',0,'',0,0,0,0),
	(47,NULL,5,1551431284,1551285781,1,0,0,0,0,'',3073,0,1,16,16,NULL,16,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',50,0,0,0),
	(48,'',5,1551431284,1551285781,1,0,0,0,0,'',3074,0,1,31,31,NULL,31,X'613A33343A7B733A353A224354797065223B733A393A22746578746D65646961223B733A363A22636F6C506F73223B693A2D313B733A363A22686561646572223B733A383A22436F6C756D6E2033223B733A31333A226865616465725F6C61796F7574223B733A313A2233223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A303A22223B733A383A22626F647974657874223B733A3330393A223C703E5175697371756520626C616E6469742073697420616D657420746F72746F7220657420626962656E64756D2E2053656420746F72746F72206D61757269732C207472697374697175652071756973206E756C6C61206E6F6E2C20636F6E76616C6C6973207072657469756D20697073756D2E20496E746567657220617563746F72206D692061632072757472756D20656C656D656E74756D2E3C2F703E0D0A3C703E416C697175616D206D616C657375616461206C616F72656574206D657475732065752076756C7075746174652E2053757370656E64697373652072686F6E63757320697073756D206F64696F2C20696163756C6973206D616C657375616461206E756E6320616C697175616D20756C7472696365732E204D6175726973206174206E6973692066656C69732E3C2F703E223B733A363A22617373657473223B693A303B733A31313A22696D6167656F7269656E74223B693A303B733A393A22696D616765636F6C73223B693A323B733A31303A22696D6167655F7A6F6F6D223B693A303B733A363A226C61796F7574223B733A313A2230223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A31333B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B693A333B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'textmedia','Colonne 3','','<p>Quisque blandit sit amet tortor et bibendum. Sed tortor mauris, tristique quis nulla non, convallis pretium ipsum. Integer auctor mi ac rutrum elementum.</p>\r\n\r\n<p>Aliquam malesuada laoreet metus eu vulputate. Suspendisse rhoncus ipsum odio, iaculis malesuada nunc aliquam ultrices. Mauris at nisi felis.</p>',0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','','',203,'','',0,'3','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',50,0,0,0),
	(49,NULL,5,1551431284,1551285781,1,0,0,0,0,'',3075,0,1,19,19,NULL,19,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',50,0,0,0),
	(50,'',5,1551431284,1551285781,1,0,0,0,0,'',20976,0,1,13,13,NULL,13,X'613A33303A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A373A227072696D617279223B733A31363A226261636B67726F756E645F696D616765223B693A313B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A32313A223320636F6C756D6E7320657175616C207769647468223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2233223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A333B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A313A2230223B7D',0,0,0,0,0,0,0,'container-3columns','3 colonnes','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'primary',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'0',0,'',0,0,0,0),
	(51,NULL,5,1551431312,1551285781,1,0,0,0,0,'',3073,0,1,32,32,NULL,32,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_48','',203,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',54,0,0,0),
	(52,NULL,5,1551431312,1551285781,1,0,0,0,0,'',3074,0,1,20,20,NULL,20,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',54,0,0,0),
	(53,NULL,5,1551431312,1551285781,1,0,0,0,0,'',3075,0,1,17,17,NULL,17,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',54,0,0,0),
	(54,'',5,1551431312,1551285781,1,0,0,0,0,'',20984,0,1,14,14,NULL,14,X'613A33303A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226461726B223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A32303A223320636F6C756D6E732C206C6566742077696465223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2233223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A333B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A393A226C6566742D77696465223B7D',0,0,0,0,0,0,0,'container-3columns','3 colonnes, gauche large','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'dark',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(55,NULL,5,1551431344,1551285781,1,0,0,0,0,'',3073,0,1,33,33,NULL,33,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_48','',203,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',58,0,0,0),
	(56,NULL,5,1551431344,1551285781,1,0,0,0,0,'',3074,0,1,21,21,NULL,21,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',58,0,0,0),
	(57,NULL,5,1551431344,1551285781,1,0,0,0,0,'',3075,0,1,18,18,NULL,18,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',58,0,0,0),
	(58,'',5,1551431344,1551285781,1,0,0,0,0,'',20988,0,1,15,15,NULL,15,X'613A33303A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A32313A223320636F6C756D6E732C2072696768742077696465223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2233223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A333B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A31303A2272696768742D77696465223B7D',0,0,0,0,0,0,0,'container-3columns','3 colonnes, droite large','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'right-wide',0,'',0,0,0,0),
	(59,'',5,1551431379,1551285781,1,0,0,0,0,'',3073,0,1,37,37,NULL,37,X'613A33343A7B733A353A224354797065223B733A393A22746578746D65646961223B733A363A22636F6C506F73223B693A2D313B733A363A22686561646572223B733A383A22436F6C756D6E2034223B733A31333A226865616465725F6C61796F7574223B733A313A2233223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A303A22223B733A383A22626F647974657874223B733A3430393A223C703E41656E65616E2068656E6472657269742C2066656C6973206E6F6E2068656E64726572697420736F6C6C696369747564696E2C2073656D206475692074696E636964756E7420657261742C20696E20756C74726963696573206C656F206573742076697461652075726E612E204E756E6320616320616E7465206575207175616D20756C747269636965732070656C6C656E74657371756520696E2069642065782E205072616573656E74206469676E697373696D206566666963697475722074656C6C75732C20617420637572737573206C6967756C6120636F6E7365717561742065752E204D6175726973207669746165206469616D20706F7274612C20706C616365726174206C6163757320756C7472696365732C20636F6E67756520697073756D2E20437572616269747572206964206A7573746F206163206F64696F2076617269757320636F6E73657175617420657420656765742066656C69732E2050656C6C656E7465737175652061206F7263692071756973206E69736C20626C616E646974206D616C6573756164612E3C2F703E223B733A363A22617373657473223B693A303B733A31313A22696D6167656F7269656E74223B693A303B733A393A22696D616765636F6C73223B693A323B733A31303A22696D6167655F7A6F6F6D223B693A303B733A363A226C61796F7574223B733A313A2230223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A32323B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B693A343B733A31313A226C31386E5F706172656E74223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'textmedia','Colonne 4','','<p>Aenean hendrerit, felis non hendrerit sollicitudin, sem dui tincidunt erat, in ultricies leo est vitae urna. Nunc ac ante eu quam ultricies pellentesque in id ex. Praesent dignissim efficitur tellus, at cursus ligula consequat eu. Mauris vitae diam porta, placerat lacus ultrices, congue ipsum. Curabitur id justo ac odio varius consequat et eget felis. Pellentesque a orci quis nisl blandit malesuada.</p>\r\n\r\n',0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','','',204,'','',0,'3','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',63,0,0,0),
	(60,NULL,5,1551431379,1551285781,1,0,0,0,0,'',3074,0,1,34,34,NULL,34,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_48','',203,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',63,0,0,0),
	(62,NULL,5,1551431379,1551285781,1,0,0,0,0,'',3075,0,1,25,25,NULL,25,X'613A373A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',63,0,0,0),
	(63,'',5,1551431379,1551285781,1,0,0,0,0,'',20990,0,1,22,22,NULL,22,X'613A33303A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A353A226C69676874223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A353A224354797065223B733A31363A2267726964656C656D656E74735F706931223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A393A223420636F6C756D6E73223B733A31333A226865616465725F6C61796F7574223B733A313A2232223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B733A313A2234223B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B693A343B733A363A226C61796F7574223B733A31353A22636F6E7461696E65722D666C756964223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A353A226D65646961223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A313A2230223B7D',0,0,0,0,0,0,0,'container-4columns','4 colonnes','',NULL,0,0,0,0,0,0,0,2,0,0,'container-fluid','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'light',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'0',0,'',0,0,0,0),
	(66,'',9,1551690970,1551300309,1,0,0,0,0,'',1,0,0,0,0,NULL,0,X'613A33313A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A383A22626F647974657874223B4E3B733A363A22617373657473223B4E3B733A31313A22696D6167656F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Also include some content elements','','<p>Sed ullamcorper porta hendrerit. Sed laoreet sem vitae erat posuere, eu rhoncus nisl gravida. Quisque sollicitudin lacus id dui faucibus, id vulputate leo imperdiet. Praesent dapibus mi augue, ac laoreet ex semper quis.&nbsp;</p>',0,0,0,1,0,0,26,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,0,'',0,'',0,0,0,0),
	(67,'',9,1551690970,1551300309,1,0,0,0,0,'',1,0,1,66,66,NULL,0,X'613A33333A7B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A363A22617373657473223B693A313B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A353A224354797065223B733A393A22746578746D65646961223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A33343A22416C736F20696E636C75646520736F6D6520636F6E74656E7420656C656D656E7473223B733A31333A226865616465725F6C61796F7574223B733A313A2230223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A343A2264617465223B693A303B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A31343A22436F6F6C20666561747572657321223B733A383A22626F647974657874223B733A3233323A223C703E53656420756C6C616D636F7270657220706F7274612068656E6472657269742E20536564206C616F726565742073656D207669746165206572617420706F73756572652C2065752072686F6E637573206E69736C20677261766964612E205175697371756520736F6C6C696369747564696E206C61637573206964206475692066617563696275732C2069642076756C707574617465206C656F20696D706572646965742E205072616573656E742064617069627573206D692061756775652C206163206C616F726565742065782073656D70657220717569732E266E6273703B3C2F703E223B733A31313A22696D6167656F7269656E74223B693A32363B733A393A22696D616765636F6C73223B693A323B733A31303A22696D6167655F7A6F6F6D223B693A303B733A363A226C61796F7574223B733A313A2230223B733A31313A226672616D655F636C617373223B733A373A2264656661756C74223B733A31383A2273706163655F6265666F72655F636C617373223B733A303A22223B733A31373A2273706163655F61667465725F636C617373223B733A303A22223B733A31323A2273656374696F6E496E646578223B693A313B733A393A226C696E6B546F546F70223B693A303B733A31363A227379735F6C616E67756167655F756964223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A363A2268696464656E223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A383A22656469746C6F636B223B693A303B733A31303A2263617465676F72696573223B693A303B733A31343A22726F774465736372697074696F6E223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B7D',0,0,0,0,0,0,0,'textmedia','Inclut également des éléments de contenu','','<p>Sed ullamcorper porta hendrerit. Sed laoreet sem vitae erat posuere, eu rhoncus nisl gravida. Quisque sollicitudin lacus id dui faucibus, id vulputate leo imperdiet. Praesent dapibus mi augue, ac laoreet ex semper quis.&nbsp;</p>',0,0,0,1,0,0,0,2,0,0,'0','default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',2,0,'',0,'',0,0,0,0),
	(68,'',8,1590511548,1551360265,1,0,0,0,0,'',256,0,0,0,0,NULL,0,X'613A31393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A393A226C6973745F74797065223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'list','News list','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'100','news_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.orderBy\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.orderDirection\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categoryConjunction\">\n                    <value index=\"vDEF\">and</value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.includeSubCategories\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.archiveRestriction\">\n                    <value index=\"vDEF\">active</value>\n                </field>\n                <field index=\"settings.timeRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestrictionHigh\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.startingpoint\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.selectedList\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">News-&gt;list</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"additional\">\n            <language index=\"lDEF\">\n                <field index=\"settings.detailPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.listPid\">\n                    <value index=\"vDEF\">8</value>\n                </field>\n                <field index=\"settings.backPid\">\n                    <value index=\"vDEF\">8</value>\n                </field>\n                <field index=\"settings.limit\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.offset\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.tags\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.hidePagination\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.list.paginate.itemsPerPage\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsFirst\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.excludeAlreadyDisplayedNews\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.disableOverrideDemand\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"template\">\n            <language index=\"lDEF\">\n                <field index=\"settings.media.maxWidth\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.media.maxHeight\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.cropMaxCharacters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.templateLayout\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraEntry\">\n            <language index=\"lDEF\">\n                <field index=\"settings.eventRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraEntryEventNews\">\n            <language index=\"lDEF\">\n                <field index=\"settings.eventRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(69,'',11,1551684213,1551362316,1,0,0,0,0,'',256,0,0,0,0,NULL,0,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A393A226C6973745F74797065223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'list','News detail','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'100','news_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.orderBy\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.orderDirection\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categoryConjunction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.includeSubCategories\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.archiveRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestrictionHigh\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.startingpoint\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.selectedList\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.singleNews\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.previewHiddenRecords\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">News-&gt;detail</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"additional\">\n            <language index=\"lDEF\">\n                <field index=\"settings.detailPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.listPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.backPid\">\n                    <value index=\"vDEF\">8</value>\n                </field>\n                <field index=\"settings.limit\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.offset\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.tags\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.hidePagination\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.list.paginate.itemsPerPage\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsFirst\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.excludeAlreadyDisplayedNews\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.disableOverrideDemand\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"template\">\n            <language index=\"lDEF\">\n                <field index=\"settings.media.maxWidth\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.media.maxHeight\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.cropMaxCharacters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.templateLayout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraEntry\">\n            <language index=\"lDEF\">\n                <field index=\"settings.eventRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(70,'',8,1551698990,1551362533,1,0,0,0,0,'',128,0,0,0,0,NULL,0,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A393A226C6973745F74797065223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'list','News categories','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'100','news_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.orderBy\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.orderDirection\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categoryConjunction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\">1,3,5</value>\n                </field>\n                <field index=\"settings.includeSubCategories\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.archiveRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestrictionHigh\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.startingpoint\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.selectedList\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">Category-&gt;list</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"additional\">\n            <language index=\"lDEF\">\n                <field index=\"settings.detailPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.listPid\">\n                    <value index=\"vDEF\">8</value>\n                </field>\n                <field index=\"settings.backPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.limit\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.offset\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.tags\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.hidePagination\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.list.paginate.itemsPerPage\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsFirst\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.excludeAlreadyDisplayedNews\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.disableOverrideDemand\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"template\">\n            <language index=\"lDEF\">\n                <field index=\"settings.media.maxWidth\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.media.maxHeight\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.cropMaxCharacters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.templateLayout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraEntry\">\n            <language index=\"lDEF\">\n                <field index=\"settings.eventRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(100,'',5,1601650844,1551864920,1,0,0,0,0,'',1280,0,0,0,0,NULL,0,X'613A32353A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A383A22626F647974657874223B4E3B733A363A22617373657473223B4E3B733A31313A22696D6167656F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Titles','','<h1>Title H1</h1>\r\n<h2>Title H2</h2>\r\n<h3>Title H3</h3>\r\n<h4>Title H4</h4>\r\n<h5>Title H5</h5>\r\n<h2>Standard table</h2>\r\n<table class=\"table\"> 	<thead> 		<tr> 			<th scope=\"col\">Title</th> 			<th scope=\"col\">Column 1</th> 			<th scope=\"col\">Column 2</th> 		</tr> 	</thead> 	<tbody> 		<tr> 			<td>Some data</td> 			<td>42</td> 			<td>42.1</td> 		</tr> 		<tr> 			<td>Some other data</td> 			<td>N/A</td> 			<td>N/A</td> 		</tr> 	</tbody> </table>\r\n<h2>Striped&nbsp;table</h2>\r\n<table class=\"table table-striped\"> 	<thead> 		<tr> 			<th scope=\"col\">Title</th> 			<th scope=\"col\">Column 1</th> 			<th scope=\"col\">Column 2</th> 		</tr> 	</thead> 	<tbody> 		<tr> 			<td>Some data</td> 			<td>42</td> 			<td>42.1</td> 		</tr> 		<tr> 			<td>Some other data</td> 			<td>N/A</td> 			<td>N/A</td> 		</tr> 	</tbody> </table>\r\n<h2>Bordered table</h2>\r\n<table class=\"table table-bordered\"> 	<thead> 		<tr> 			<th scope=\"col\">Title</th> 			<th scope=\"col\">Column 1</th> 			<th scope=\"col\">Column 2</th> 		</tr> 	</thead> 	<tbody> 		<tr> 			<td>Some data</td> 			<td>42</td> 			<td>42.1</td> 		</tr> 		<tr> 			<td>Some other data</td> 			<td>N/A</td> 			<td>N/A</td> 		</tr> 	</tbody> </table>\r\n<h2>Unordered list</h2>\r\n<ul> 	<li> 	<p>Bullet 1</p> 	</li> 	<li>Bullet 2</li> </ul>\r\n<h2>Ordered list</h2>\r\n<ol> 	<li> 	<p>List item 1</p> 	</li> 	<li>List item 2</li> </ol>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','none',NULL,NULL,201,'','',0,'100','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',200,0,0,0),
	(105,'',5,1551866867,1551866797,1,0,0,0,0,'',4592,0,0,0,0,NULL,0,X'613A33313A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A383A22626F647974657874223B4E3B733A363A22617373657473223B4E3B733A31313A22696D6167656F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Text & media','','<p class=\"lead\">This is some lead text.&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis fermentum massa at ullamcorper.</p>\r\n<p>This is a regular paragraph. Pellentesque tincidunt blandit laoreet. Maecenas viverra purus id volutpat ullamcorper. Phasellus elementum leo eget finibus consectetur. Donec lobortis felis non quam lacinia ullamcorper. Nullam vitae mattis elit.</p>\r\n<p>Vestibulum quis suscipit enim, vitae mattis odio. Pellentesque in nunc sollicitudin, pellentesque lorem id, condimentum sem. Vestibulum mattis sem aliquet pulvinar aliquet. Maecenas nec porta dolor, eu laoreet mauris. Aenean cursus mollis tincidunt.</p>\r\n<p><small>This is some text in a \"small\" tag.&nbsp;Aenean a ornare nisi, id venenatis purus. Ut sagittis sed risus sit amet hendrerit.</small></p>',0,0,0,1,0,0,25,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'This is the subheader','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(106,'',5,1551867274,1551867231,1,0,0,0,0,'',4600,0,0,0,0,NULL,0,X'613A33343A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A353A226D65646961223B4E3B733A31363A2266696C655F636F6C6C656374696F6E73223B4E3B733A31363A2266696C656C696E6B5F736F7274696E67223B4E3B733A32363A2266696C656C696E6B5F736F7274696E675F646972656374696F6E223B4E3B733A363A22746172676574223B4E3B733A31333A2266696C656C696E6B5F73697A65223B4E3B733A31393A2275706C6F6164735F6465736372697074696F6E223B4E3B733A31323A2275706C6F6164735F74797065223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'uploads','File links','',NULL,0,0,0,0,0,0,0,2,0,2,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,'',0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(107,'',5,1551867366,1551867357,1,0,0,0,0,'',4604,0,0,0,0,NULL,0,X'613A32363A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'form_formframework','Basic contact form','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">EXT:bootstrap_package/Resources/Private/Forms/Contact.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(109,'',5,1551867502,1551867502,1,0,0,0,0,'',4584,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(110,'',5,1551867535,1551867535,1,0,0,0,0,'',4602,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(111,'',5,1551867573,1551867573,1,0,0,0,0,'',4605,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(112,'',5,1551870363,1551867596,1,0,0,0,0,'',5606,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(113,'',5,1551867985,1551867680,1,0,0,0,0,'',5374,0,0,0,0,NULL,0,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A33333A2274785F626F6F7473747261707061636B6167655F6361726F7573656C5F6974656D223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'carousel','Carousel','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"interval\">\n                    <value index=\"vDEF\">5000</value>\n                </field>\n                <field index=\"transition\">\n                    <value index=\"vDEF\">fade</value>\n                </field>\n                <field index=\"wrap\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"show_nav_title\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,2,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(114,'',5,1551868368,1551868045,1,0,0,0,0,'',5502,0,0,0,0,NULL,113,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A33333A2274785F626F6F7473747261707061636B6167655F6361726F7573656C5F6974656D223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'carousel_small','Carousel small','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"interval\">\n                    <value index=\"vDEF\">5000</value>\n                </field>\n                <field index=\"transition\">\n                    <value index=\"vDEF\">fade</value>\n                </field>\n                <field index=\"wrap\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"show_nav_title\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,2,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(115,'',5,1551868570,1551868414,1,0,0,0,0,'',5566,0,0,0,0,NULL,113,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A33333A2274785F626F6F7473747261707061636B6167655F6361726F7573656C5F6974656D223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'carousel_fullscreen','Carousel fullscreen','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'','normal','','',0,'','',0,'2','',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"interval\">\n                    <value index=\"vDEF\">5000</value>\n                </field>\n                <field index=\"transition\">\n                    <value index=\"vDEF\">fade</value>\n                </field>\n                <field index=\"wrap\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"show_nav_title\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,2,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(116,'',5,1551869086,1551868768,1,0,0,0,0,'',5598,0,0,0,0,NULL,0,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A33333A2274785F626F6F7473747261707061636B6167655F74696D656C696E655F6974656D223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'timeline','Timeline','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"sorting\">\n                    <value index=\"vDEF\">date desc</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,3,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(118,'',5,1551892511,1551870852,1,0,0,0,0,'',4750,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'card_group','Card group','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"align\">\n                    <value index=\"vDEF\">left</value>\n                </field>\n                <field index=\"columns\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',2,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(119,'',5,1601649157,1551871346,1,0,0,0,0,'',1152,0,0,0,0,NULL,0,X'613A353A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Buttons','','<p><a class=\"btn btn-default\" href=\"t3://page?uid=5\">Button default</a></p>\r\n<p><a class=\"btn btn-primary\" href=\"t3://page?uid=5\">Button primary</a></p>\r\n<p><a class=\"btn btn-secondary\" href=\"t3://page?uid=5\">Button secondary</a></p>\r\n<p><a class=\"btn btn-success\" href=\"t3://page?uid=5\">Button success</a></p>\r\n<p><a class=\"btn btn-info\" href=\"t3://page?uid=5\">Button info</a></p>\r\n<p><a class=\"btn btn-warning\" href=\"t3://page?uid=5\">Button warning</a></p>\r\n<p><a class=\"btn btn-danger\" href=\"t3://page?uid=5\">Button danger</a></p>\r\n<p><a class=\"btn btn-outline-default\" href=\"t3://page?uid=5\">Button outline default</a></p>\r\n<p><a class=\"btn btn-outline-primary\" href=\"t3://page?uid=5\">Button outline primary</a></p>\r\n<p><a class=\"btn btn-outline-secondary\" href=\"t3://page?uid=5\">Button outline secondary</a></p>\r\n<p><a class=\"btn btn-outline-success\" href=\"t3://page?uid=5\">Button outline success</a></p>\r\n<p><a class=\"btn btn-outline-info\" href=\"t3://page?uid=5\">Button outline info</a></p>\r\n<p><a class=\"btn btn-outline-warning\" href=\"t3://page?uid=5\">Button outline warning</a></p>\r\n<p><a class=\"btn btn-outline-danger\" href=\"t3://page?uid=5\">Button outline danger</a></p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,202,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',200,0,0,0),
	(121,'',5,1601654557,1551872819,1,0,0,0,0,'',10366,0,0,0,0,NULL,0,X'613A333A7B733A363A22636F6C506F73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B7D',0,0,0,0,0,0,0,'external_media','External media','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','https://www.youtube.com/watch?v=SjjT4lOyFWk','16by9',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(122,'',5,1551892534,1551873230,1,0,0,0,0,'',4742,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'icon_group','Icon group','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,4,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(123,'',5,1551873501,1551873477,1,0,0,0,0,'',5629,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'media','Media','',NULL,0,0,0,2,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(124,'',5,1551873699,1551873577,1,0,0,0,0,'',4734,0,0,0,0,NULL,0,X'613A32383A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A32383A2274785F626F6F7473747261707061636B6167655F7461625F6974656D223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'tab','Tabs','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"default_tab\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,1,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(125,'',5,1551892253,1551891937,1,0,0,0,0,'',5310,0,0,0,0,NULL,0,X'613A33313A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A353A227061676573223B4E3B733A31343A22726561646D6F72655F6C6162656C223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A32303A226163636573736962696C6974795F627970617373223B4E3B733A32353A226163636573736962696C6974795F6279706173735F74657874223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'menu_card_list','Menu of pages as cards','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,'5,8',0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"align\">\n                    <value index=\"vDEF\">left</value>\n                </field>\n                <field index=\"columns\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(126,'',5,1551892388,1551892388,1,0,0,0,0,'',5342,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'menu_thumbnail_list','Menu of pages as thumbnails','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,'5,8',0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"align\">\n                    <value index=\"vDEF\">left</value>\n                </field>\n                <field index=\"columns\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(127,'',5,1551892457,1551892457,1,0,0,0,0,'',5278,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(128,'',5,1551892480,1551892480,1,0,0,0,0,'',5358,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'div','Divider','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(130,'',5,1551892643,1551892643,1,0,0,0,0,'',3841,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel default','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(131,'',5,1551892658,1551892658,1,0,0,0,0,'',3842,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel primary','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','primary',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(132,'',5,1551892671,1551892671,1,0,0,0,0,'',3843,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel success','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','success',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(133,'',5,1551892685,1551892685,1,0,0,0,0,'',3844,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel info','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','info',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(134,'',5,1551892697,1551892697,1,0,0,0,0,'',3845,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel warning','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','warning',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(135,'',5,1551892709,1551892709,1,0,0,0,0,'',3846,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'panel','Panel danger','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','danger',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(136,'',5,1551892860,1551892823,1,0,0,0,0,'',4596,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'quote','Quote','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi. ',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','The Architect','t3://page?uid=5','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(137,'',5,1551892913,1551892895,1,0,0,0,0,'',4594,0,0,0,0,NULL,0,X'613A33323A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A383A22626F647974657874223B4E3B733A31333A2269636F6E5F706F736974696F6E223B4E3B733A393A2269636F6E5F74797065223B4E3B733A393A2269636F6E5F73697A65223B4E3B733A383A2269636F6E5F736574223B4E3B733A343A2269636F6E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'texticon','Text & icon','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pretium arcu vestibulum dolor viverra consequat. Proin eu tristique felis, at venenatis mi. Sed sit amet orci lobortis nunc pellentesque ultricies quis non nibh.</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'EXT:bootstrap_package/Resources/Public/Images/Icons/Glyphicons/info-sign.svg','EXT:bootstrap_package/Resources/Public/Images/Icons/Glyphicons/',0,'left','medium','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(138,'',5,1559126042,1559125192,1,0,0,0,0,'',4598,0,0,0,0,NULL,0,X'613A33303A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-3columns','Key figures','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','normal',NULL,NULL,0,'','',0,'2','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'equal-width',0,'',0,0,0,0),
	(139,'',5,1559126042,1559125339,1,0,0,0,0,'',1539,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'key_figure','42','','<h2>fans worldwide</h2>',0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal',NULL,NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'Over',138,0,0,0),
	(140,'',5,1559126042,1559125489,1,0,0,0,0,'',1538,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'key_figure','1','','<h2>fish</h2>\r\n<p>to translate them all</p>',0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal',NULL,NULL,202,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',138,0,0,0),
	(141,'',5,1601652628,1559125575,1,0,0,0,0,'',1537,0,0,0,0,NULL,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'key_figure','5','','<h2>books</h2>\r\n<p>in the trilogy</p>',0,0,0,0,0,0,0,2,0,0,'0','default',0,'','normal',NULL,NULL,203,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',138,0,0,0),
	(176,'',143,1601469857,1551908738,1,0,0,0,0,'',8,0,0,0,0,NULL,0,X'613A32303A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'felogin_login','Formulaire de login','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','none',NULL,NULL,0,'','',0,'100','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"showForgotPassword\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"pages\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.showForgotPassword\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.pages\">\n                    <value index=\"vDEF\">31</value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_redirect\">\n            <language index=\"lDEF\">\n                <field index=\"redirectMode\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"redirectPageLogin\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectPageLogout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectMode\">\n                    <value index=\"vDEF\">groupLogin,userLogin,login,getpost,referer</value>\n                </field>\n                <field index=\"settings.redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectPageLogin\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLogout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_messages\">\n            <language index=\"lDEF\">\n                <field index=\"welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(177,'',143,1601469867,1601460587,1,0,0,0,0,'',264,0,1,176,176,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',176,X'613A32343A7B733A353A224354797065223B733A31333A2266656C6F67696E5F6C6F67696E223B733A363A22636F6C506F73223B693A303B733A363A22686561646572223B733A31393A22466F726D756C61697265206465206C6F67696E223B733A31333A226865616465725F6C61796F7574223B733A333A22313030223B733A31353A226865616465725F706F736974696F6E223B733A303A22223B733A31313A226865616465725F6C696E6B223B733A303A22223B733A393A22737562686561646572223B733A303A22223B733A31313A2270695F666C6578666F726D223B733A363330373A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D2273686F77466F72676F7450617373776F7264223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273686F775065726D614C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E313C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273686F774C6F676F7574466F726D41667465724C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227061676573223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22726563757273697665223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E73686F77466F72676F7450617373776F7264223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E313C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E73686F775065726D614C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E313C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E73686F774C6F676F7574466F726D41667465724C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7061676573223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E33313C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E726563757273697665223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A20202020202020203C736865657420696E6465783D22735F7265646972656374223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D2272656469726563744D6F6465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22726564697265637446697273744D6574686F64223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227265646972656374506167654C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227265646972656374506167654C6F67696E4572726F72223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227265646972656374506167654C6F676F7574223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22726564697265637444697361626C65223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E72656469726563744D6F6465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E67726F75704C6F67696E2C757365724C6F67696E2C6C6F67696E2C676574706F73742C726566657265723C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E726564697265637446697273744D6574686F64223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7265646972656374506167654C6F67696E223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7265646972656374506167654C6F67696E4572726F72223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7265646972656374506167654C6F676F7574223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E726564697265637444697361626C65223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A20202020202020203C736865657420696E6465783D22735F6D65737361676573223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D2277656C636F6D655F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2277656C636F6D655F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22737563636573735F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22737563636573735F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D226572726F725F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D226572726F725F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227374617475735F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D227374617475735F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D226C6F676F75745F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D226C6F676F75745F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22666F72676F745F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D22666F72676F745F72657365745F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E77656C636F6D655F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E77656C636F6D655F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E737563636573735F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E737563636573735F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E6572726F725F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E6572726F725F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7374617475735F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E7374617475735F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E6C6F676F75745F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E6C6F676F75745F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E666F72676F745F686561646572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2273657474696E67732E666F72676F745F72657365745F6D657373616765223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A363A226C61796F7574223B733A393A22636F6E7461696E6572223B733A31383A2273706163655F6265666F72655F636C617373223B733A343A226E6F6E65223B733A31373A2273706163655F61667465725F636C617373223B733A343A226E6F6E65223B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A343A226E6F6E65223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B733A3535353A223C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574662D3822207374616E64616C6F6E653D2279657322203F3E0A3C5433466C6578466F726D733E0A202020203C646174613E0A20202020202020203C736865657420696E6465783D2273444546223E0A2020202020202020202020203C6C616E677561676520696E6465783D226C444546223E0A202020202020202020202020202020203C6669656C6420696E6465783D22706172616C6C6178223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266616465223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E303C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A202020202020202020202020202020203C6669656C6420696E6465783D2266696C746572223E0A20202020202020202020202020202020202020203C76616C756520696E6465783D2276444546223E3C2F76616C75653E0A202020202020202020202020202020203C2F6669656C643E0A2020202020202020202020203C2F6C616E67756167653E0A20202020202020203C2F73686565743E0A202020203C2F646174613E0A3C2F5433466C6578466F726D733E223B733A31363A227379735F6C616E67756167655F756964223B693A303B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A383A2266655F67726F7570223B733A303A22223B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B693A303B733A31313A226C31386E5F706172656E74223B693A303B733A31323A2273656374696F6E496E646578223B693A313B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B733A363A22617373657473223B693A303B7D',0,0,0,0,0,0,0,'felogin_login','Login form','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','none','','',0,'','',0,'100','',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"showForgotPassword\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"pages\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.showForgotPassword\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showPermaLogin\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.showLogoutFormAfterLogin\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.pages\">\n                    <value index=\"vDEF\">31</value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_redirect\">\n            <language index=\"lDEF\">\n                <field index=\"redirectMode\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"redirectPageLogin\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectPageLogout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectMode\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectFirstMethod\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.redirectPageLogin\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLoginError\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectPageLogout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.redirectDisable\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"s_messages\">\n            <language index=\"lDEF\">\n                <field index=\"welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.welcome_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.success_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.error_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.status_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.logout_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_header\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.forgot_reset_message\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(179,'',151,1552174238,1552145123,1,0,0,0,0,'',256,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'form_formframework','Contactez-nous','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,201,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/Forms/FRcontactForm.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"3e3320370efe27a86b8e29ffcb7a1f10\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.EmailToReceiver.subject\">\n                    <value index=\"vDEF\">{subject}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientAddress\">\n                    <value index=\"vDEF\">rpresedo@ideative.ch</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientName\">\n                    <value index=\"vDEF\">Roberto Presedo</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderName\">\n                    <value index=\"vDEF\">{fullname}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.replyToAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.carbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.blindCarbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.format\">\n                    <value index=\"vDEF\">html</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"35ab4bdc9accc48d7702131de170b5f8\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.Redirect.pageUid\">\n                    <value index=\"vDEF\">pages_153</value>\n                </field>\n                <field index=\"settings.finishers.Redirect.additionalParameters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"a148c6d4630ae3cefef5f6ae9daa3d4c\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.EmailToReceiver.subject\">\n                    <value index=\"vDEF\">{subject}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientAddress\">\n                    <value index=\"vDEF\">rpresedo@ideative.ch</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientName\">\n                    <value index=\"vDEF\">Roberto Presedo</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderName\">\n                    <value index=\"vDEF\">{fullname}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.replyToAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.carbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.blindCarbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.format\">\n                    <value index=\"vDEF\">html</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"a2582cff78ee9c0525761c233b790e9e\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.Redirect.pageUid\">\n                    <value index=\"vDEF\">pages_153</value>\n                </field>\n                <field index=\"settings.finishers.Redirect.additionalParameters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',190,0,0,0),
	(180,'',153,1552145464,1552145464,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'textmedia','Nous avons bien reçu votre message','','<p>Nous vous remercions vivement de votre message.</p>\r\n<p>Vous recevrez une réponse dans les plus brefs délais.</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(181,'',153,1552145619,1552145560,1,0,0,0,0,'',512,0,1,0,180,NULL,180,'',0,0,0,0,0,0,0,'textmedia','We have received your message.','','<p>We thank you very much for your message.&nbsp;<br /> You will receive an answer as soon as possible.&nbsp;</p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','','','',0,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,0,0),
	(190,'',151,1552170553,1552162127,1,0,0,0,0,'',3456,0,0,0,0,NULL,0,X'613A32393A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B4E3B733A32343A2274785F67726964656C656D656E74735F6368696C6472656E223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A353A226D65646961223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','2 colonnes','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,0,'','',0,'100','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(191,'',151,1552173993,1552162268,1,0,0,0,0,'',0,0,0,0,0,NULL,0,X'613A343A7B733A363A22636F6C506F73223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Zang Sàrl','','<p>41b, Route des Jeunes<br /> 1227 Carouge<br /> T + 41 22 552 98 00<br /> <a href=\"mailto:hello@ideative.ch\">hello@ideative.ch</a></p>',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,NULL,202,'intelligence digitale','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',190,0,0,0),
	(192,'',151,1552175270,1552162352,1,0,0,0,0,'',128,0,0,0,0,NULL,0,X'613A33313A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A393A226C6973745F74797065223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A353A227061676573223B4E3B733A393A22726563757273697665223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B7D',0,0,0,0,0,0,0,'list','Google Maps','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','',NULL,'',202,'','',0,'100','maps2_maps2',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEFAULT\">\n            <language index=\"lDEF\">\n                <field index=\"settings.poiCollection\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.mapWidth\">\n                    <value index=\"vDEF\">100%</value>\n                </field>\n                <field index=\"settings.mapHeight\">\n                    <value index=\"vDEF\">300</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMapOptions\">\n            <language index=\"lDEF\">\n                <field index=\"settings.zoom\">\n                    <value index=\"vDEF\">15</value>\n                </field>\n                <field index=\"settings.mapTypeId\">\n                    <value index=\"vDEF\">google.maps.MapTypeId.ROADMAP</value>\n                </field>\n                <field index=\"settings.zoomControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.mapTypeControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.scaleControl\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.streetViewControl\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.fullScreenControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.activateScrollWheel\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.styles\">\n                    <value index=\"vDEF\">[\n    {\n        &quot;featureType&quot;: &quot;administrative&quot;,\n        &quot;elementType&quot;: &quot;labels.text.fill&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#444444&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;landscape.man_made&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;simplified&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;poi&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;saturation&quot;: -100\n            },\n            {\n                &quot;lightness&quot;: 45\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road&quot;,\n        &quot;elementType&quot;: &quot;labels.text.fill&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#6be6b0&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road.highway&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;simplified&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road.arterial&quot;,\n        &quot;elementType&quot;: &quot;labels.icon&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;transit&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;water&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#6be6b0&quot;\n            },\n            {\n                &quot;visibility&quot;: &quot;on&quot;\n            }\n        ]\n    }\n]</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',190,0,0,0),
	(196,'',151,1552175933,1552175825,1,0,0,0,0,'',1,0,1,0,191,NULL,191,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'textmedia','Zang Sàrl','','<p>41b, Route des Jeunes<br /> 1227 Carouge<br /> T + 41 22 552 98 00<br /> <a href=\"mailto:hello@ideative.ch\">hello@ideative.ch</a></p>\r\n\r\n',0,0,0,0,0,0,0,2,0,0,'container','default',0,'','','','',202,'intelligence digitale','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',199,0,0,0),
	(197,'',151,1552175948,1552175825,1,0,0,0,0,'',2,0,1,0,192,NULL,192,X'613A33323A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A343A2264617465223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A393A226C6973745F74797065223B4E3B733A31313A2270695F666C6578666F726D223B4E3B733A353A227061676573223B4E3B733A393A22726563757273697665223B4E3B733A363A226C61796F7574223B4E3B733A31313A226672616D655F636C617373223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A2273656374696F6E496E646578223B4E3B733A393A226C696E6B546F546F70223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31313A226C31386E5F706172656E74223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A383A22656469746C6F636B223B4E3B733A31303A2263617465676F72696573223B4E3B733A31343A22726F774465736372697074696F6E223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B733A32333A2274785F67726964656C656D656E74735F636F6C756D6E73223B4E3B7D',0,0,0,0,0,0,0,'list','Google Maps','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','','','',202,'','',0,'100','maps2_maps2',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEFAULT\">\n            <language index=\"lDEF\">\n                <field index=\"settings.poiCollection\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.mapWidth\">\n                    <value index=\"vDEF\">100%</value>\n                </field>\n                <field index=\"settings.mapHeight\">\n                    <value index=\"vDEF\">300</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMapOptions\">\n            <language index=\"lDEF\">\n                <field index=\"settings.zoom\">\n                    <value index=\"vDEF\">15</value>\n                </field>\n                <field index=\"settings.mapTypeId\">\n                    <value index=\"vDEF\">google.maps.MapTypeId.ROADMAP</value>\n                </field>\n                <field index=\"settings.zoomControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.mapTypeControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.scaleControl\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.streetViewControl\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.fullScreenControl\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.activateScrollWheel\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"settings.styles\">\n                    <value index=\"vDEF\">[\n    {\n        &quot;featureType&quot;: &quot;administrative&quot;,\n        &quot;elementType&quot;: &quot;labels.text.fill&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#444444&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;landscape.man_made&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;simplified&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;poi&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;saturation&quot;: -100\n            },\n            {\n                &quot;lightness&quot;: 45\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road&quot;,\n        &quot;elementType&quot;: &quot;labels.text.fill&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#6be6b0&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road.highway&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;simplified&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;road.arterial&quot;,\n        &quot;elementType&quot;: &quot;labels.icon&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;transit&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;visibility&quot;: &quot;off&quot;\n            }\n        ]\n    },\n    {\n        &quot;featureType&quot;: &quot;water&quot;,\n        &quot;elementType&quot;: &quot;all&quot;,\n        &quot;stylers&quot;: [\n            {\n                &quot;color&quot;: &quot;#6be6b0&quot;\n            },\n            {\n                &quot;visibility&quot;: &quot;on&quot;\n            }\n        ]\n    }\n]</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',199,0,0,0),
	(198,'',151,1552175902,1552175825,1,0,0,0,0,'',3,0,1,0,179,NULL,179,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'form_formframework','Contact Us','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','','','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/Forms/ENcontactForm.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"3e3320370efe27a86b8e29ffcb7a1f10\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.EmailToReceiver.subject\">\n                    <value index=\"vDEF\">{subject}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientAddress\">\n                    <value index=\"vDEF\">rpresedo@ideative.ch</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientName\">\n                    <value index=\"vDEF\">Roberto Presedo</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderName\">\n                    <value index=\"vDEF\">{fullname}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.replyToAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.carbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.blindCarbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.format\">\n                    <value index=\"vDEF\">html</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"35ab4bdc9accc48d7702131de170b5f8\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.Redirect.pageUid\">\n                    <value index=\"vDEF\">pages_153</value>\n                </field>\n                <field index=\"settings.finishers.Redirect.additionalParameters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"a148c6d4630ae3cefef5f6ae9daa3d4c\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.EmailToReceiver.subject\">\n                    <value index=\"vDEF\">{subject}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientAddress\">\n                    <value index=\"vDEF\">rpresedo@ideative.ch</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.recipientName\">\n                    <value index=\"vDEF\">Roberto Presedo</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.senderName\">\n                    <value index=\"vDEF\">{fullname}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.replyToAddress\">\n                    <value index=\"vDEF\">{email}</value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.carbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.blindCarbonCopyAddress\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.finishers.EmailToReceiver.format\">\n                    <value index=\"vDEF\">html</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"a2582cff78ee9c0525761c233b790e9e\">\n            <language index=\"lDEF\">\n                <field index=\"settings.finishers.Redirect.pageUid\">\n                    <value index=\"vDEF\">pages_153</value>\n                </field>\n                <field index=\"settings.finishers.Redirect.additionalParameters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',199,0,0,0),
	(199,'',151,1552175954,1552175825,1,0,0,0,0,'',3712,0,1,0,190,NULL,190,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','2 colonnes','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'','','','',0,'','',0,'100','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(200,NULL,5,1601651217,1601649130,1,0,0,0,0,'',1536,0,0,0,0,NULL,0,X'613A31373A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B733A32353A2274785F67726964656C656D656E74735F636F6E7461696E6572223B4E3B7D',0,0,0,0,0,0,0,'container-2columns','','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'left-wide',0,'',0,0,0,0),
	(201,NULL,5,1601653454,1601653454,1,0,0,0,0,'',1024,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'textmedia','Column 3','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce accumsan pellentesque lacus non luctus. Donec accumsan velit a neque maximus rutrum. Nam dapibus nunc vitae dapibus blandit.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal',NULL,NULL,203,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',13,0,0,0),
	(202,NULL,5,1601655393,1601654675,1,0,0,0,0,'',16512,0,0,0,0,NULL,0,X'613A31373A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B4E3B733A32303A22656E61626C655F6D6F62696C655F736C69646572223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'container-3columns','3 columns with mobile carousel option','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'equal-width',0,'',0,1,0,0),
	(205,NULL,5,1601654763,1601654763,1,0,0,0,0,'',768,0,0,0,0,NULL,16,X'613A333A7B733A363A22636F6C506F73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_5','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(206,NULL,5,1601654763,1601654763,1,0,0,0,0,'',640,0,1,205,205,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',47,X'613A31343A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B733A363A22636F6C506F73223B693A3230313B733A31393A2274785F636F6E7461696E65725F706172656E74223B693A3230323B733A363A226C61796F7574223B733A313A2230223B733A31383A2273706163655F6265666F72655F636C617373223B733A343A226E6F6E65223B733A31373A2273706163655F61667465725F636C617373223B733A363A226E6F726D616C223B733A31323A2273656374696F6E496E646578223B693A313B733A363A22617373657473223B693A303B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_39','',201,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(207,NULL,5,1601654791,1601654791,1,0,0,0,0,'',576,0,0,0,0,NULL,19,X'613A333A7B733A363A22636F6C506F73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_6','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(208,NULL,5,1601654791,1601654791,1,0,0,0,0,'',544,0,1,207,207,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',49,X'613A31343A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B733A363A22636F6C506F73223B693A3230323B733A31393A2274785F636F6E7461696E65725F706172656E74223B693A3230323B733A363A226C61796F7574223B733A313A2230223B733A31383A2273706163655F6265666F72655F636C617373223B733A343A226E6F6E65223B733A31373A2273706163655F61667465725F636C617373223B733A363A226E6F726D616C223B733A31323A2273656374696F6E496E646578223B693A313B733A363A22617373657473223B693A303B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_38','',202,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(209,NULL,5,1601654816,1601654816,1,0,0,0,0,'',528,0,0,0,0,NULL,33,X'613A333A7B733A363A22636F6C506F73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_201','',203,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(210,NULL,5,1601654816,1601654816,1,0,0,0,0,'',520,0,1,209,209,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"assets\":\"parent\"}',55,X'613A31343A7B733A363A2268696464656E223B693A303B733A393A22737461727474696D65223B693A303B733A373A22656E6474696D65223B693A303B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B733A303A22223B733A31363A226261636B67726F756E645F696D616765223B693A303B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31323A22636F6C756D6E735F73697A65223B733A303A22223B733A363A22636F6C506F73223B693A3230333B733A31393A2274785F636F6E7461696E65725F706172656E74223B693A3230323B733A363A226C61796F7574223B733A313A2230223B733A31383A2273706163655F6265666F72655F636C617373223B733A343A226E6F6E65223B733A31373A2273706163655F61667465725F636C617373223B733A363A226E6F726D616C223B733A31323A2273656374696F6E496E646578223B693A313B733A363A22617373657473223B693A303B7D',0,0,0,0,0,0,0,'shortcut','Reference','',NULL,0,0,0,0,0,0,0,2,0,0,'0','default',0,'none','normal','tt_content_48','',203,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',202,0,0,0),
	(211,NULL,5,1601655743,1601655672,1,0,0,0,0,'',516,0,0,0,0,NULL,0,X'613A32343A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31353A226865616465725F706F736974696F6E223B4E3B733A31313A226865616465725F6C696E6B223B4E3B733A393A22737562686561646572223B4E3B733A383A22626F647974657874223B4E3B733A363A22617373657473223B4E3B733A31313A22696D6167656F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'textmedia','All styles exposed','center','<p class=\"text-center\">Here are all of the available RTE styles exposed.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal',NULL,NULL,200,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',200,0,0,0),
	(212,NULL,5,1601655877,1601655877,1,0,0,0,0,'',514,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'textmedia','Mobile slider','center','<p class=\"text-center\">This 3 columns element should become a carousel when viewed on a mobile device.</p>',0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal',NULL,NULL,200,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',202,0,0,0),
	(213,NULL,5,1602238409,1602235832,1,0,0,0,0,'',2304,0,0,0,0,NULL,0,X'613A31373A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A32303A226163636F7264696F6E5F6F70656E5F6669727374223B4E3B733A32343A226163636F7264696F6E5F616C6C6F775F6D756C7469706C65223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'container-accordion','Accordion','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,1,1),
	(214,NULL,5,1602235878,1602235878,1,0,0,0,0,'',513,0,0,0,0,NULL,0,'',0,0,0,0,0,0,0,'textmedia','Element 1','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a augue eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis eros risus, sagittis ac lacus sit amet, molestie lobortis quam. Nulla tempus et augue nec ultrices. Fusce tempor aliquet pellentesque.</p>',0,0,0,1,0,0,0,2,0,0,'no-container','default',0,'none','normal',NULL,NULL,200,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',213,0,1,0),
	(215,NULL,5,1602235946,1602235902,1,0,0,0,0,'',769,0,0,0,0,NULL,0,X'613A31363A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A373A227265636F726473223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Element 2','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal','tt_content_214',NULL,200,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',213,0,1,0),
	(216,NULL,5,1602252630,1602252463,1,0,0,0,0,'',2688,0,0,0,0,NULL,0,X'613A31353A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'container-tabs','Tabs','',NULL,0,0,0,0,0,0,0,2,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',0,0,1,1);

INSERT INTO `tt_content` (`uid`, `rowDescription`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `fe_group`, `sorting`, `editlock`, `sys_language_uid`, `l18n_parent`, `l10n_source`, `l10n_state`, `t3_origuid`, `l18n_diffsource`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `CType`, `header`, `header_position`, `bodytext`, `bullets_type`, `uploads_description`, `uploads_type`, `assets`, `image`, `imagewidth`, `imageorient`, `imagecols`, `imageborder`, `media`, `layout`, `frame_class`, `cols`, `space_before_class`, `space_after_class`, `records`, `pages`, `colPos`, `subheader`, `header_link`, `image_zoom`, `header_layout`, `list_type`, `sectionIndex`, `linkToTop`, `file_collections`, `filelink_size`, `filelink_sorting`, `filelink_sorting_direction`, `target`, `date`, `recursive`, `imageheight`, `pi_flexform`, `accessibility_title`, `accessibility_bypass`, `accessibility_bypass_text`, `selected_categories`, `category_field`, `table_class`, `table_caption`, `table_delimiter`, `table_enclosure`, `table_header_position`, `table_tfoot`, `tx_impexp_origuid`, `teaser`, `readmore_label`, `quote_source`, `quote_link`, `panel_class`, `file_folder`, `icon`, `icon_set`, `icon_file`, `icon_position`, `icon_size`, `icon_type`, `icon_color`, `icon_background`, `external_media_source`, `external_media_ratio`, `tx_bootstrappackage_card_group_item`, `tx_bootstrappackage_carousel_item`, `tx_bootstrappackage_accordion_item`, `tx_bootstrappackage_icon_group_item`, `tx_bootstrappackage_tab_item`, `tx_bootstrappackage_timeline_item`, `background_color_class`, `background_image`, `background_image_options`, `tx_news_related_news`, `categories`, `columns_size`, `tx_yoastseo_linking_suggestions`, `overtitle`, `tx_container_parent`, `enable_mobile_slider`, `accordion_open_first`, `accordion_allow_multiple`)
VALUES
	(217,NULL,5,1602252607,1602252482,1,0,0,0,0,'',0,0,0,0,0,NULL,215,X'613A31363A7B733A353A224354797065223B4E3B733A363A22636F6C506F73223B4E3B733A31393A2274785F636F6E7461696E65725F706172656E74223B4E3B733A363A22686561646572223B4E3B733A373A227265636F726473223B4E3B733A363A226C61796F7574223B4E3B733A31383A2273706163655F6265666F72655F636C617373223B4E3B733A31373A2273706163655F61667465725F636C617373223B4E3B733A32323A226261636B67726F756E645F636F6C6F725F636C617373223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A383A2266655F67726F7570223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Element 1','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal','tt_content_105','',200,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',216,0,1,0),
	(218,NULL,5,1602252501,1602252491,1,0,0,0,0,'',256,0,0,0,0,NULL,215,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,0,0,0,0,'shortcut','Element 2','',NULL,0,0,0,0,0,0,0,2,0,0,'no-container','default',0,'none','normal','tt_content_214','',200,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,NULL,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',0,0,'',0,'',216,0,1,0),
	(222,NULL,1,1607084471,1607084446,1,0,0,0,0,'0',256,0,0,0,0,NULL,0,NULL,0,0,0,0,0,0,0,'textmedia','Bienvenue sur le Starter Package Zang !','','<h2 class=\"text-center\">&nbsp;</h2><h2 class=\"text-center\">Créer de l’<strong>intelligence</strong><br /> dans votre <strong>écosystème</strong> digital</h2><p>Zang est une agence spécialisée en stratégie digitale, UI/UX, développement TYPO3 et Drupal, storytelling et e-marketing. Basée à Genève l\'agence met ses compétences en oeuvre pour la réalisation de solutions digitales intelligentes.</p><ul> 	<li>Nous sommes une agence digitale basée 100% à Genève.</li> 	<li>Nous déployons notre expertise sur 5 axes.&nbsp;</li> 	<li>Nous concevons des solutions digitales performantes.&nbsp;</li> 	<li>Nous sommes une équipe de 30 spécialistes passionnés par le digital.</li> 	<li>Nous sommes une marque du groupe audiovisuel et digital Point Prod Actua.</li> </ul>',0,0,0,0,0,0,0,0,0,0,'container','default',0,'none','normal',NULL,NULL,0,'Nous sommes heureux de vous présenter cette démo','',0,'0','',0,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,0,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','','','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',0,0,0,0),
	(223,NULL,20,1607083341,1607083285,1,0,0,0,0,'0',256,0,-1,0,0,NULL,0,NULL,0,0,0,0,0,0,0,'list','Events list plugin (news)','',NULL,0,0,0,0,0,0,0,0,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'100','news_pi1',0,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?><T3FlexForms><data><sheet index=\"sDEF\"><language index=\"lDEF\"><field index=\"settings.orderBy\"><value index=\"vDEF\"></value></field><field index=\"settings.orderDirection\"><value index=\"vDEF\"></value></field><field index=\"settings.categoryConjunction\"><value index=\"vDEF\"></value></field><field index=\"settings.categories\"><value index=\"vDEF\"></value></field><field index=\"settings.includeSubCategories\"><value index=\"vDEF\">0</value></field><field index=\"settings.archiveRestriction\"><value index=\"vDEF\">active</value></field><field index=\"settings.timeRestriction\"><value index=\"vDEF\"></value></field><field index=\"settings.timeRestrictionHigh\"><value index=\"vDEF\"></value></field><field index=\"settings.topNewsRestriction\"><value index=\"vDEF\"></value></field><field index=\"settings.startingpoint\"><value index=\"vDEF\">24</value></field><field index=\"settings.recursive\"><value index=\"vDEF\"></value></field><field index=\"settings.selectedList\"><value index=\"vDEF\"></value></field><field index=\"switchableControllerActions\"><value index=\"vDEF\">News-&gt;list</value></field></language></sheet><sheet index=\"additional\"><language index=\"lDEF\"><field index=\"settings.detailPid\"><value index=\"vDEF\">21</value></field><field index=\"settings.listPid\"><value index=\"vDEF\">20</value></field><field index=\"settings.backPid\"><value index=\"vDEF\">20</value></field><field index=\"settings.limit\"><value index=\"vDEF\"></value></field><field index=\"settings.offset\"><value index=\"vDEF\"></value></field><field index=\"settings.tags\"><value index=\"vDEF\"></value></field><field index=\"settings.hidePagination\"><value index=\"vDEF\">0</value></field><field index=\"settings.list.paginate.itemsPerPage\"><value index=\"vDEF\"></value></field><field index=\"settings.topNewsFirst\"><value index=\"vDEF\">0</value></field><field index=\"settings.excludeAlreadyDisplayedNews\"><value index=\"vDEF\">1</value></field><field index=\"settings.disableOverrideDemand\"><value index=\"vDEF\">1</value></field></language></sheet><sheet index=\"template\"><language index=\"lDEF\"><field index=\"settings.media.maxWidth\"><value index=\"vDEF\"></value></field><field index=\"settings.media.maxHeight\"><value index=\"vDEF\"></value></field><field index=\"settings.cropMaxCharacters\"><value index=\"vDEF\"></value></field><field index=\"settings.templateLayout\"><value index=\"vDEF\">2</value></field></language></sheet><sheet index=\"extraEntryEventNews\"><language index=\"lDEF\"><field index=\"settings.eventRestriction\"><value index=\"vDEF\">1</value></field></language></sheet></data></T3FlexForms>','',0,'',NULL,'','',NULL,0,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','','','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',0,0,0,0),
	(224,NULL,21,1607083733,1607083648,1,0,0,0,0,'0',256,0,-1,0,0,NULL,0,NULL,0,0,0,0,0,0,0,'list','Event detail plugin (news)','',NULL,0,0,0,0,0,0,0,0,0,0,'container','default',0,'none','normal',NULL,NULL,0,'','',0,'100','news_pi1',0,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?><T3FlexForms><data><sheet index=\"sDEF\"><language index=\"lDEF\"><field index=\"settings.orderBy\"><value index=\"vDEF\"></value></field><field index=\"settings.orderDirection\"><value index=\"vDEF\"></value></field><field index=\"settings.categoryConjunction\"><value index=\"vDEF\"></value></field><field index=\"settings.categories\"><value index=\"vDEF\"></value></field><field index=\"settings.includeSubCategories\"><value index=\"vDEF\">0</value></field><field index=\"settings.archiveRestriction\"><value index=\"vDEF\"></value></field><field index=\"settings.timeRestriction\"><value index=\"vDEF\"></value></field><field index=\"settings.timeRestrictionHigh\"><value index=\"vDEF\"></value></field><field index=\"settings.topNewsRestriction\"><value index=\"vDEF\"></value></field><field index=\"settings.startingpoint\"><value index=\"vDEF\">24</value></field><field index=\"settings.recursive\"><value index=\"vDEF\"></value></field><field index=\"settings.selectedList\"><value index=\"vDEF\"></value></field><field index=\"switchableControllerActions\"><value index=\"vDEF\">News-&gt;detail</value></field><field index=\"settings.singleNews\"><value index=\"vDEF\"></value></field><field index=\"settings.previewHiddenRecords\"><value index=\"vDEF\">2</value></field></language></sheet><sheet index=\"additional\"><language index=\"lDEF\"><field index=\"settings.detailPid\"><value index=\"vDEF\">21</value></field><field index=\"settings.listPid\"><value index=\"vDEF\"></value></field><field index=\"settings.backPid\"><value index=\"vDEF\">20</value></field><field index=\"settings.limit\"><value index=\"vDEF\"></value></field><field index=\"settings.offset\"><value index=\"vDEF\"></value></field><field index=\"settings.tags\"><value index=\"vDEF\"></value></field><field index=\"settings.hidePagination\"><value index=\"vDEF\">0</value></field><field index=\"settings.list.paginate.itemsPerPage\"><value index=\"vDEF\"></value></field><field index=\"settings.topNewsFirst\"><value index=\"vDEF\">0</value></field><field index=\"settings.excludeAlreadyDisplayedNews\"><value index=\"vDEF\">0</value></field><field index=\"settings.disableOverrideDemand\"><value index=\"vDEF\">1</value></field></language></sheet><sheet index=\"template\"><language index=\"lDEF\"><field index=\"settings.media.maxWidth\"><value index=\"vDEF\"></value></field><field index=\"settings.media.maxHeight\"><value index=\"vDEF\"></value></field><field index=\"settings.cropMaxCharacters\"><value index=\"vDEF\"></value></field><field index=\"settings.templateLayout\"><value index=\"vDEF\"></value></field></language></sheet><sheet index=\"extraEntryEventNews\"><language index=\"lDEF\"><field index=\"settings.eventRestriction\"><value index=\"vDEF\">1</value></field></language></sheet></data></T3FlexForms>','',0,'',NULL,'','',NULL,0,0,0,0,0,NULL,'','','','default',NULL,'','',0,'','default','default','','','','',0,0,0,0,0,0,'',0,NULL,0,0,'',0,'',0,0,0,0);

/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_bootstrappackage_accordion_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_accordion_item`;

CREATE TABLE `tx_bootstrappackage_accordion_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8_unicode_ci,
  `media` int(10) unsigned DEFAULT '0',
  `mediaorient` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT '1',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_bootstrappackage_card_group_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_card_group_item`;

CREATE TABLE `tx_bootstrappackage_card_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` int(11) NOT NULL DEFAULT '0',
  `bodytext` text COLLATE utf8_unicode_ci,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_icon` int(10) unsigned DEFAULT '0',
  `link_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_bootstrappackage_card_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` DISABLE KEYS */;

INSERT INTO `tx_bootstrappackage_card_group_item` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `l10n_state`, `tt_content`, `header`, `subheader`, `image`, `bodytext`, `link`, `link_title`, `link_icon`, `link_class`)
VALUES
	(1,5,1551870956,1551870852,1,0,0,0,0,1,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,118,'This is a card item','This is the card subheader',1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accumsan porta neque, vestibulum commodo sem pharetra sit amet. Praesent commodo lacus arcu, non pretium massa molestie quis.</p>','t3://page?uid=5','Call to action',0,'default'),
	(2,5,1551870956,1551870938,1,0,0,0,0,2,0,0,X'613A31323A7B733A363A22686561646572223B4E3B733A393A22737562686561646572223B4E3B733A353A22696D616765223B4E3B733A383A22626F647974657874223B4E3B733A343A226C696E6B223B4E3B733A31303A226C696E6B5F7469746C65223B4E3B733A393A226C696E6B5F69636F6E223B4E3B733A31303A226C696E6B5F636C617373223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,118,'Another card item','',1,'<p>Sed sapien tellus, luctus non porttitor sed, feugiat ut tortor. Curabitur dictum ante nisl, id rhoncus eros elementum eget.&nbsp;</p>','t3://page?uid=5','Another call to action',0,'secondary');

/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_bootstrappackage_carousel_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_carousel_item`;

CREATE TABLE `tx_bootstrappackage_carousel_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_layout` smallint(5) unsigned NOT NULL DEFAULT '1',
  `header_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subheader_layout` smallint(5) unsigned NOT NULL DEFAULT '2',
  `subheader_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `button_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8_unicode_ci,
  `image` int(10) unsigned DEFAULT '0',
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `background_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT '0',
  `background_image_options` mediumtext COLLATE utf8_unicode_ci,
  `header_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_bootstrappackage_carousel_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` DISABLE KEYS */;

INSERT INTO `tx_bootstrappackage_carousel_item` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `l10n_state`, `tt_content`, `item_type`, `header`, `header_layout`, `header_class`, `subheader`, `subheader_layout`, `subheader_class`, `nav_title`, `button_text`, `bodytext`, `image`, `link`, `text_color`, `background_color`, `background_image`, `background_image_options`, `header_position`)
VALUES
	(1,5,1551867985,1551867680,1,0,0,0,0,1,0,0,X'613A31373A7B733A393A226974656D5F74797065223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31323A226865616465725F636C617373223B4E3B733A393A22737562686561646572223B4E3B733A31363A227375626865616465725F6C61796F7574223B4E3B733A31353A227375626865616465725F636C617373223B4E3B733A393A226E61765F7469746C65223B4E3B733A31303A22746578745F636F6C6F72223B4E3B733A343A226C696E6B223B4E3B733A31363A226261636B67726F756E645F636F6C6F72223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,113,'header','Lorem ipsum dolor sit amet',1,'none','This is the subheader',2,'none','This is the navigation title','',NULL,0,'t3://page?uid=5','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center'),
	(2,5,1551867985,1551867985,1,0,0,0,0,2,0,0,X'613A31373A7B733A393A226974656D5F74797065223B4E3B733A363A22686561646572223B4E3B733A31333A226865616465725F6C61796F7574223B4E3B733A31323A226865616465725F636C617373223B4E3B733A393A22737562686561646572223B4E3B733A31363A227375626865616465725F6C61796F7574223B4E3B733A31353A227375626865616465725F636C617373223B4E3B733A393A226E61765F7469746C65223B4E3B733A31303A22746578745F636F6C6F72223B4E3B733A343A226C696E6B223B4E3B733A31363A226261636B67726F756E645F636F6C6F72223B4E3B733A31363A226261636B67726F756E645F696D616765223B4E3B733A32343A226261636B67726F756E645F696D6167655F6F7074696F6E73223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,113,'header','Another carousel item',1,'none','',2,'none','','',NULL,0,'','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center'),
	(3,5,1551868368,1551868045,1,0,0,0,0,1,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,1,NULL,114,'header','Lorem ipsum dolor sit amet',1,'none','This is the subheader',2,'none','This is the navigation title','',NULL,0,'t3://page?uid=5','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center'),
	(4,5,1551868368,1551868045,1,0,0,0,0,2,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,2,NULL,114,'header','Another carousel item',1,'none','',2,'none','','',NULL,0,'','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center'),
	(5,5,1551868570,1551868414,1,0,0,0,0,1,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,1,NULL,115,'header','Lorem ipsum dolor sit amet',1,'none','This is the subheader',2,'none','This is the navigation title','',NULL,0,'t3://page?uid=5','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center'),
	(6,5,1551868570,1551868414,1,0,0,0,0,2,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,2,NULL,115,'header','Another carousel item',1,'none','',2,'none','','',NULL,0,'','#FFFFFF','#333333',1,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','center');

/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_bootstrappackage_icon_group_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_icon_group_item`;

CREATE TABLE `tx_bootstrappackage_icon_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT '0',
  `bodytext` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_bootstrappackage_icon_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` DISABLE KEYS */;

INSERT INTO `tx_bootstrappackage_icon_group_item` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `l10n_state`, `tt_content`, `header`, `subheader`, `link`, `icon_file`, `bodytext`)
VALUES
	(1,5,1551873368,1551873230,1,0,0,0,0,1,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,122,'First item','This is the subheader','',1,NULL),
	(2,5,1551873368,1551873267,1,0,0,0,0,2,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,122,'Second item','With a subheader too','',1,NULL),
	(3,5,1551873368,1551873296,1,0,0,0,0,3,0,0,X'613A373A7B733A363A22686561646572223B4E3B733A393A22737562686561646572223B4E3B733A393A2269636F6E5F66696C65223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,122,'Third item','Another subheader right here','',1,NULL),
	(4,5,1551873368,1551873368,1,0,0,0,0,4,0,0,X'613A373A7B733A363A22686561646572223B4E3B733A393A22737562686561646572223B4E3B733A393A2269636F6E5F66696C65223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,122,'Fourth item','You guessed it, this is a subheader','',1,NULL);

/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_bootstrappackage_tab_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_tab_item`;

CREATE TABLE `tx_bootstrappackage_tab_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8_unicode_ci,
  `media` int(10) unsigned DEFAULT '0',
  `mediaorient` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT '1',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_bootstrappackage_tab_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` DISABLE KEYS */;

INSERT INTO `tx_bootstrappackage_tab_item` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sorting`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `l10n_state`, `tt_content`, `header`, `bodytext`, `media`, `mediaorient`, `imagecols`, `image_zoom`)
VALUES
	(1,5,1551891358,1551873577,1,0,0,0,0,1,0,0,X'613A31303A7B733A363A22686561646572223B4E3B733A383A22626F647974657874223B4E3B733A353A226D65646961223B4E3B733A31313A226D656469616F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,124,'First item','<h3>Lorem ipsum dolor sit amet</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accumsan porta neque, vestibulum commodo sem pharetra sit amet. Praesent commodo lacus arcu, non pretium massa molestie quis.</p>\r\n<p>Cras purus quam, blandit at eleifend ac, malesuada quis lorem. Pellentesque eget eros fermentum quam hendrerit mollis vel a nulla. Donec pulvinar lectus at velit condimentum consequat. Vivamus blandit enim eu rutrum ullamcorper. Quisque posuere, libero a facilisis commodo, arcu leo euismod erat, non porttitor leo justo ac erat.</p>\r\n<p>Phasellus ut mauris ligula. Etiam sed lacus a lorem elementum venenatis quis et magna.&nbsp;</p>',1,'left',2,0),
	(2,5,1551891358,1551891358,1,0,0,0,0,2,0,0,X'613A31303A7B733A363A22686561646572223B4E3B733A383A22626F647974657874223B4E3B733A353A226D65646961223B4E3B733A31313A226D656469616F7269656E74223B4E3B733A393A22696D616765636F6C73223B4E3B733A31303A22696D6167655F7A6F6F6D223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,124,'Second item','<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h3>\r\n<p>Fusce non ante sagittis, tempus eros vitae, aliquam purus. Praesent non elementum nisi. Morbi lobortis erat eget tortor tincidunt, et euismod mi pharetra. Praesent et metus mauris. Sed non sollicitudin sapien, non egestas nunc. Maecenas in bibendum justo.</p>\r\n<h4>Quisque nec cursus libero, rutrum eleifend ante</h4>\r\n<p>Suspendisse a lobortis orci. Praesent posuere pretium efficitur. Proin lectus odio, ornare eget posuere a, congue sed lectus. Nunc malesuada vel justo ut lobortis. Ut mi ipsum, dictum id tempus et, suscipit vel est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus varius feugiat sem. Aenean condimentum placerat quam, et commodo lacus maximus ut. Fusce eu fringilla urna, nec eleifend odio.</p>\r\n<p>Sed hendrerit ex vel ultricies convallis. In id volutpat nunc, quis rutrum mauris. In luctus bibendum lorem, et volutpat dui mattis ut. Maecenas massa justo, lacinia ut cursus eu, porta ac orci.</p>',0,'left',2,0);

/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_bootstrappackage_timeline_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_bootstrappackage_timeline_item`;

CREATE TABLE `tx_bootstrappackage_timeline_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tt_content` int(10) unsigned DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8_unicode_ci,
  `icon_file` int(10) unsigned DEFAULT '0',
  `image` int(10) unsigned DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_bootstrappackage_timeline_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` DISABLE KEYS */;

INSERT INTO `tx_bootstrappackage_timeline_item` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `l10n_state`, `tt_content`, `date`, `header`, `bodytext`, `icon_file`, `image`, `sorting`)
VALUES
	(1,5,1551869086,1551868768,1,0,0,0,0,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,116,'1996-01-01 00:00:00','Cobweb is founded','<p>Nulla dignissim euismod facilisis. Aenean tellus eros, finibus eu tortor vitae, bibendum consequat tortor.&nbsp;</p>',0,0,0),
	(2,5,1551869086,1551868768,1,0,0,0,0,0,0,X'613A313A7B733A363A2268696464656E223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,116,'2006-03-06 00:00:00','Grafmiville is founded','<p>Nulla dignissim euismod facilisis. Aenean tellus eros, finibus eu tortor vitae, bibendum consequat tortor.&nbsp;</p>',0,0,0),
	(3,5,1551869086,1551869086,1,0,0,0,0,0,0,X'613A393A7B733A343A2264617465223B4E3B733A363A22686561646572223B4E3B733A383A22626F647974657874223B4E3B733A393A2269636F6E5F66696C65223B4E3B733A353A22696D616765223B4E3B733A363A2268696464656E223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B7D',0,0,0,'',0,0,0,0,0,0,NULL,116,'2018-09-01 00:00:00','Zang is founded','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae ipsum non libero commodo dignissim sed a tellus. In hac habitasse platea dictumst.</p>',0,1,0);

/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_eventnews_domain_model_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_eventnews_domain_model_location`;

CREATE TABLE `tx_eventnews_domain_model_location` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` double NOT NULL DEFAULT '0',
  `lng` double NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_eventnews_domain_model_organizer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_eventnews_domain_model_organizer`;

CREATE TABLE `tx_eventnews_domain_model_organizer` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_extensionmanager_domain_model_extension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;

CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `extension_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(10) unsigned NOT NULL DEFAULT '1',
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT '0',
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `state` int(11) NOT NULL DEFAULT '0',
  `review_state` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `serialized_dependencies` mediumtext COLLATE utf8_unicode_ci,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8_unicode_ci,
  `authorcompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT '0',
  `current_version` int(11) NOT NULL DEFAULT '0',
  `lastreviewedversion` int(11) NOT NULL DEFAULT '0',
  `documentation_link` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`repository`),
  KEY `index_extrepo` (`extension_key`,`repository`),
  KEY `index_versionrepo` (`integer_version`,`repository`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_extensionmanager_domain_model_repository
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_repository`;

CREATE TABLE `tx_extensionmanager_domain_model_repository` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `wsdl_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mirror_list_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `extension_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_extensionmanager_domain_model_repository` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_repository` DISABLE KEYS */;

INSERT INTO `tx_extensionmanager_domain_model_repository` (`uid`, `pid`, `title`, `description`, `wsdl_url`, `mirror_list_url`, `last_update`, `extension_count`)
VALUES
	(1,0,'TYPO3.org Main Repository','Main repository on typo3.org. This repository has some mirrors configured which are available with the mirror url.','https://typo3.org/wsdl/tx_ter_wsdl.php','https://repositories.typo3.org/mirrors.xml.gz',1346191200,0);

/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_repository` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_impexp_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_impexp_presets`;

CREATE TABLE `tx_impexp_presets` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public` smallint(6) NOT NULL DEFAULT '0',
  `item_uid` int(11) NOT NULL DEFAULT '0',
  `preset_data` blob,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_maps2_domain_model_poi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_maps2_domain_model_poi`;

CREATE TABLE `tx_maps2_domain_model_poi` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `poicollection` int(10) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `pos_index` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_maps2_domain_model_poicollection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_maps2_domain_model_poicollection`;

CREATE TABLE `tx_maps2_domain_model_poicollection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT '0',
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `collection_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configuration_map` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `radius` int(10) unsigned NOT NULL DEFAULT '0',
  `pois` int(10) unsigned NOT NULL DEFAULT '0',
  `stroke_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stroke_opacity` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stroke_weight` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fill_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fill_opacity` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info_window_content` text COLLATE utf8_unicode_ci,
  `info_window_images` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_icons` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_icon_width` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_icon_height` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_icon_anchor_pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `marker_icon_anchor_pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  `categories` int(11) NOT NULL DEFAULT '0',
  `map_provider` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_maps2_domain_model_poicollection` WRITE;
/*!40000 ALTER TABLE `tx_maps2_domain_model_poicollection` DISABLE KEYS */;

INSERT INTO `tx_maps2_domain_model_poicollection` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `starttime`, `endtime`, `t3ver_oid`, `t3ver_wsid`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `l10n_state`, `collection_type`, `title`, `configuration_map`, `latitude`, `longitude`, `radius`, `pois`, `stroke_color`, `stroke_opacity`, `stroke_weight`, `fill_color`, `fill_opacity`, `address`, `info_window_content`, `info_window_images`, `marker_icons`, `marker_icon_width`, `marker_icon_height`, `marker_icon_anchor_pos_x`, `marker_icon_anchor_pos_y`, `categories`, `map_provider`)
VALUES
	(1,155,1552162732,1552062062,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,X'613A31373A7B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31353A22636F6C6C656374696F6E5F74797065223B4E3B733A353A227469746C65223B4E3B733A373A2261646472657373223B4E3B733A383A226C61746974756465223B4E3B733A393A226C6F6E676974756465223B4E3B733A31393A22696E666F5F77696E646F775F636F6E74656E74223B4E3B733A31383A22696E666F5F77696E646F775F696D61676573223B4E3B733A31323A226D61726B65725F69636F6E73223B4E3B733A31373A226D61726B65725F69636F6E5F7769647468223B4E3B733A31383A226D61726B65725F69636F6E5F686569676874223B4E3B733A32343A226D61726B65725F69636F6E5F616E63686F725F706F735F78223B4E3B733A32343A226D61726B65725F69636F6E5F616E63686F725F706F735F79223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31303A2263617465676F72696573223B4E3B7D',NULL,'Point','Zang Sàrl','',46.182863,6.130774,0,0,'','','','','','Route des Jeunes 41B, 1227 Carouge, Suisse',NULL,0,0,0,0,0,0,0,''),
	(2,155,1552062062,1552062062,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,X'613A31373A7B733A363A2268696464656E223B4E3B733A31363A227379735F6C616E67756167655F756964223B4E3B733A31353A22636F6C6C656374696F6E5F74797065223B4E3B733A353A227469746C65223B4E3B733A373A2261646472657373223B4E3B733A383A226C61746974756465223B4E3B733A393A226C6F6E676974756465223B4E3B733A31393A22696E666F5F77696E646F775F636F6E74656E74223B4E3B733A31383A22696E666F5F77696E646F775F696D61676573223B4E3B733A31323A226D61726B65725F69636F6E73223B4E3B733A31373A226D61726B65725F69636F6E5F7769647468223B4E3B733A31383A226D61726B65725F69636F6E5F686569676874223B4E3B733A32343A226D61726B65725F69636F6E5F616E63686F725F706F735F78223B4E3B733A32343A226D61726B65725F69636F6E5F616E63686F725F706F735F79223B4E3B733A393A22737461727474696D65223B4E3B733A373A22656E6474696D65223B4E3B733A31303A2263617465676F72696573223B4E3B7D',NULL,'Point','Infomaniak','',46.191201,6.130484,0,0,'','','','','','Rue Eugène-Marziano 25, 1227 Genève, Suisse','<p>Ceci est le contenu de la box info</p>\r\n<p><strong>On peut y mettre ce que nous voulons</strong></p>',0,0,0,0,0,0,0,'');

/*!40000 ALTER TABLE `tx_maps2_domain_model_poicollection` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_news_domain_model_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_link`;

CREATE TABLE `tx_news_domain_model_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `l10n_source` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `parent` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `uri` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_news_domain_model_link` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_link` DISABLE KEYS */;

INSERT INTO `tx_news_domain_model_link` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `l10n_source`, `t3ver_oid`, `t3ver_id`, `t3_origuid`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `sorting`, `deleted`, `hidden`, `description`, `l10n_state`, `parent`, `title`, `uri`)
VALUES
	(1,9,1551351945,1551351739,1,0,0,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,0,'',0,0,0,0,0,513,0,0,'This link is there just to show the \"Related link\" feature',NULL,3,'Here comes a related link','http://www.google.com'),
	(2,9,1551352055,1551352012,1,1,1,'a:1:{s:6:\"hidden\";i:0;}',0,0,0,1,0,'',0,0,0,0,0,513,0,0,'This link is there just to show the \"Related link\" feature','{\"title\":\"parent\",\"description\":\"parent\",\"uri\":\"parent\"}',4,'Here comes a related link','http://www.google.com'),
	(3,9,1551352150,1551352116,1,0,0,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,0,'',0,0,0,0,0,1,0,0,'Just there to show the \"related links\" feature',NULL,1,'A related link','https://www.google.com'),
	(4,9,1551352150,1551352116,1,1,3,'a:3:{s:5:\"title\";s:14:\"A related link\";s:11:\"description\";s:46:\"Just there to show the \"related links\" feature\";s:3:\"uri\";s:22:\"https://www.google.com\";}',0,0,0,0,0,'',0,0,0,0,0,1,0,0,'Just there to show the \"related links\" feature','{\"title\":\"parent\",\"description\":\"parent\",\"uri\":\"parent\"}',2,'A related link','https://www.google.com'),
	(5,9,1551352276,1551352217,1,0,0,'a:1:{s:6:\"hidden\";N;}',0,0,0,3,0,'',0,0,0,0,0,1,0,0,'Just there to show the \"related links\" feature',NULL,5,'A related link','https://www.google.com'),
	(6,9,1551352304,1551352217,1,1,5,'a:4:{s:5:\"title\";s:14:\"A related link\";s:11:\"description\";s:46:\"Just there to show the \"related links\" feature\";s:3:\"uri\";s:22:\"https://www.google.com\";s:6:\"hidden\";i:0;}',0,0,0,4,0,'',0,0,0,0,0,1,0,0,'Just there to show the \"related links\" feature','{\"title\":\"parent\",\"description\":\"parent\",\"uri\":\"parent\"}',6,'A related link','https://www.google.com');

/*!40000 ALTER TABLE `tx_news_domain_model_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_news_domain_model_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_news`;

CREATE TABLE `tx_news_domain_model_news` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `editlock` smallint(6) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `l10n_source` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `teaser` text COLLATE utf8_unicode_ci,
  `bodytext` mediumtext COLLATE utf8_unicode_ci,
  `datetime` bigint(20) NOT NULL DEFAULT '0',
  `archive` bigint(20) NOT NULL DEFAULT '0',
  `author` tinytext COLLATE utf8_unicode_ci,
  `author_email` tinytext COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  `related` int(11) NOT NULL DEFAULT '0',
  `related_from` int(11) NOT NULL DEFAULT '0',
  `related_files` tinytext COLLATE utf8_unicode_ci,
  `fal_related_files` int(10) unsigned DEFAULT '0',
  `related_links` tinytext COLLATE utf8_unicode_ci,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `tags` int(11) NOT NULL DEFAULT '0',
  `media` text COLLATE utf8_unicode_ci,
  `fal_media` int(10) unsigned DEFAULT '0',
  `internalurl` text COLLATE utf8_unicode_ci,
  `externalurl` text COLLATE utf8_unicode_ci,
  `istopnews` int(11) NOT NULL DEFAULT '0',
  `content_elements` int(11) NOT NULL DEFAULT '0',
  `path_segment` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_title` tinytext COLLATE utf8_unicode_ci,
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_event` smallint(5) unsigned NOT NULL DEFAULT '0',
  `full_day` smallint(5) unsigned NOT NULL DEFAULT '0',
  `event_end` int(10) unsigned DEFAULT '0',
  `organizer` int(10) unsigned DEFAULT '0',
  `location` int(10) unsigned DEFAULT '0',
  `organizer_simple` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_simple` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_changefreq` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT '0.5',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `sys_language_uid_l10n_parent` (`sys_language_uid`,`l10n_parent`),
  KEY `import` (`import_id`,`import_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `path_segment` (`path_segment`(185),`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_news_domain_model_news` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news` DISABLE KEYS */;

INSERT INTO `tx_news_domain_model_news` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `editlock`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `l10n_source`, `deleted`, `hidden`, `starttime`, `endtime`, `fe_group`, `notes`, `l10n_state`, `sorting`, `title`, `teaser`, `bodytext`, `datetime`, `archive`, `author`, `author_email`, `categories`, `related`, `related_from`, `related_files`, `fal_related_files`, `related_links`, `type`, `keywords`, `description`, `tags`, `media`, `fal_media`, `internalurl`, `externalurl`, `istopnews`, `content_elements`, `path_segment`, `alternative_title`, `import_id`, `import_source`, `is_event`, `full_day`, `event_end`, `organizer`, `location`, `organizer_simple`, `location_simple`, `sitemap_changefreq`, `sitemap_priority`)
VALUES
	(1,9,1551690970,1551299689,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:28:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"is_event\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'This news is part of category 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam viverra nunc eget orci pretium, euismod ultrices mi cursus. Quisque eu condimentum elit.','<p>Sed pulvinar, eros vitae venenatis fringilla, ipsum metus elementum ipsum, pellentesque aliquam metus mi eu justo. Vestibulum eu nulla metus. Vivamus sit amet maximus ante. Maecenas purus urna, ultrices eget tristique ut, eleifend non nunc.&nbsp;</p>',1551299663,1746597600,'Bob Dylan','bob.dylan@ideative.ch',1,1,0,NULL,1,'1','0','','',0,NULL,1,NULL,NULL,0,1,'this-news-is-part-of-category-1','','','',0,0,0,0,0,'','','',0.5),
	(2,9,1551690970,1551299754,1,0,0,0,'',0,0,0,0,0,1,0,1,1,'a:29:{s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:6:\"author\";s:9:\"Bob Dylan\";s:12:\"author_email\";s:21:\"bob.dylan@ideative.ch\";s:10:\"categories\";i:1;s:7:\"related\";i:1;s:13:\"related_links\";s:1:\"1\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"editlock\";i:0;s:16:\"content_elements\";i:1;s:4:\"tags\";i:0;s:9:\"fal_media\";i:1;s:17:\"fal_related_files\";i:1;s:4:\"type\";s:1:\"0\";s:9:\"istopnews\";i:0;s:5:\"title\";s:31:\"This news is part of category 1\";s:12:\"path_segment\";s:31:\"this-news-is-part-of-category-1\";s:6:\"teaser\";s:151:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam viverra nunc eget orci pretium, euismod ultrices mi cursus. Quisque eu condimentum elit.\";s:8:\"datetime\";i:1551299663;s:7:\"archive\";i:1746597600;s:8:\"is_event\";i:0;s:8:\"bodytext\";s:253:\"<p>Sed pulvinar, eros vitae venenatis fringilla, ipsum metus elementum ipsum, pellentesque aliquam metus mi eu justo. Vestibulum eu nulla metus. Vivamus sit amet maximus ante. Maecenas purus urna, ultrices eget tristique ut, eleifend non nunc.&nbsp;</p>\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:11:\"l10n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:5:\"notes\";s:0:\"\";}',0,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'Cette actualité fait partie de la catégorie 1','Sed pulvinar, eros vitae venenatis fringilla, ipsum metus elementum ipsum, pellentesque aliquam metus mi eu justo.','<p>Fusce rhoncus gravida dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat, eros eget auctor porttitor, leo mauris pellentesque diam, ut aliquet tortor ipsum nec risus.</p>',1551299663,1746597600,'Bob Dylan','bob.dylan@ideative.ch',1,1,0,NULL,1,'1','0','','',0,NULL,1,NULL,NULL,0,1,'cette-actualite-fait-partie-de-la-categorie-1','','','',0,0,0,0,0,'','','',0.5),
	(3,9,1551685353,1551351618,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:1:{s:10:\"categories\";N;}',0,0,0,0,0,'','',NULL,0,'A news from category 2','Integer vitae posuere ante. Sed quis suscipit ex, a lacinia orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam interdum feugiat ipsum ut accumsan. ','<p>Donec ut posuere erat. In auctor dignissim elit, vitae scelerisque magna ultricies nec. Sed quis posuere arcu. Curabitur nec venenatis quam, eu suscipit augue. Mauris pharetra turpis tellus, vel finibus nulla blandit dapibus.</p>\r\n<p>Quisque at luctus elit, sit amet porttitor dui. Nam et dapibus tellus, sed vehicula arcu. Aenean ultricies, tortor non mattis facilisis, justo lacus consectetur sem, sit amet sodales neque nunc ut nulla. Integer ornare in orci sed imperdiet. Nulla ultricies malesuada massa sit amet consectetur.</p>',1551351551,0,'Julien Henchoz','julien.henchoz@ideative.ch',1,1,0,NULL,1,'1','0','news, article, category 2','This is the meta description for this test news',0,NULL,1,NULL,NULL,0,1,'a-news-from-category-2','','','',0,0,0,0,0,'','','',0.5),
	(4,9,1551685353,1551352012,1,0,0,0,'',0,0,0,0,0,3,0,1,3,'a:29:{s:4:\"type\";s:1:\"0\";s:9:\"istopnews\";i:0;s:5:\"title\";s:22:\"A news from category 2\";s:12:\"path_segment\";s:22:\"a-news-from-category-2\";s:6:\"teaser\";s:202:\"Integer vitae posuere ante. Sed quis suscipit ex, a lacinia orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam interdum feugiat ipsum ut accumsan. \";s:8:\"datetime\";i:1551351551;s:7:\"archive\";i:0;s:8:\"is_event\";i:0;s:8:\"bodytext\";s:536:\"<p>Donec ut posuere erat. In auctor dignissim elit, vitae scelerisque magna ultricies nec. Sed quis posuere arcu. Curabitur nec venenatis quam, eu suscipit augue. Mauris pharetra turpis tellus, vel finibus nulla blandit dapibus.</p>\r\n<p>Quisque at luctus elit, sit amet porttitor dui. Nam et dapibus tellus, sed vehicula arcu. Aenean ultricies, tortor non mattis facilisis, justo lacus consectetur sem, sit amet sodales neque nunc ut nulla. Integer ornare in orci sed imperdiet. Nulla ultricies malesuada massa sit amet consectetur.</p>\";s:16:\"content_elements\";i:1;s:9:\"fal_media\";i:1;s:17:\"fal_related_files\";i:1;s:10:\"categories\";i:1;s:7:\"related\";i:1;s:13:\"related_links\";s:1:\"1\";s:4:\"tags\";i:0;s:6:\"author\";s:14:\"Julien Henchoz\";s:12:\"author_email\";s:26:\"julien.henchoz@ideative.ch\";s:8:\"keywords\";s:25:\"news, article, category 2\";s:11:\"description\";s:47:\"This is the meta description for this test news\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:5:\"notes\";s:0:\"\";s:11:\"l10n_parent\";i:0;}',0,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'Une news de catégorie 2','Integer vitae posuere ante. Sed quis suscipit ex, a lacinia orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam interdum feugiat ipsum ut accumsan. ','<p>Donec ut posuere erat. In auctor dignissim elit, vitae scelerisque magna ultricies nec. Sed quis posuere arcu. Curabitur nec venenatis quam, eu suscipit augue. Mauris pharetra turpis tellus, vel finibus nulla blandit dapibus.</p>\r\n<p>Quisque at luctus elit, sit amet porttitor dui. Nam et dapibus tellus, sed vehicula arcu. Aenean ultricies, tortor non mattis facilisis, justo lacus consectetur sem, sit amet sodales neque nunc ut nulla. Integer ornare in orci sed imperdiet. Nulla ultricies malesuada massa sit amet consectetur.</p>',1551351551,0,'Julien Henchoz','julien.henchoz@ideative.ch',1,2,0,NULL,0,'1','0','news, article, category 2','This is the meta description for this test news',0,NULL,1,NULL,NULL,0,0,'une-news-de-categorie-2','','','',0,0,0,0,0,'','','',0.5),
	(5,9,1551685353,1551352217,1,0,0,0,'',0,0,0,0,0,1,0,0,0,'a:1:{s:10:\"categories\";N;}',0,0,0,0,0,'','',NULL,0,'Top news from category 1','In at accumsan est. Pellentesque cursus nunc nec ex efficitur, ac semper lacus interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin quis odio ac nibh auctor bibendum a quis urna.','<p>In fermentum tellus lorem, non egestas diam convallis quis. Donec finibus magna erat, nec varius odio dapibus vitae. Fusce nibh quam, maximus eu auctor at, scelerisque id arcu. Nulla elementum sed mauris vitae imperdiet.</p>\r\n<p>Mauris maximus accumsan purus, quis ultrices tortor lobortis eu. Vestibulum pellentesque ligula quis neque rhoncus, et mattis massa euismod. Maecenas tempor finibus tellus dapibus bibendum. Aliquam commodo tincidunt libero.&nbsp;</p>',1551299663,1746597600,'Bob Dylan','bob.dylan@ideative.ch',1,1,2,NULL,1,'1','0','','',0,NULL,1,NULL,NULL,1,1,'top-news-from-category-1','','','',0,0,0,0,0,'','','',0.5),
	(6,9,1551685353,1551352217,1,0,0,0,'',0,0,0,0,0,2,0,1,5,'a:29:{s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:6:\"author\";s:9:\"Bob Dylan\";s:12:\"author_email\";s:21:\"bob.dylan@ideative.ch\";s:10:\"categories\";i:1;s:7:\"related\";i:1;s:13:\"related_links\";s:1:\"1\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"editlock\";i:0;s:16:\"content_elements\";i:1;s:4:\"tags\";i:0;s:9:\"fal_media\";i:1;s:17:\"fal_related_files\";i:1;s:4:\"type\";s:1:\"0\";s:9:\"istopnews\";i:1;s:5:\"title\";s:24:\"Top news from category 1\";s:12:\"path_segment\";s:24:\"top-news-from-category-1\";s:6:\"teaser\";s:228:\"In at accumsan est. Pellentesque cursus nunc nec ex efficitur, ac semper lacus interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin quis odio ac nibh auctor bibendum a quis urna.\";s:8:\"datetime\";i:1551299663;s:7:\"archive\";i:1746597600;s:8:\"is_event\";i:0;s:8:\"bodytext\";s:465:\"<p>In fermentum tellus lorem, non egestas diam convallis quis. Donec finibus magna erat, nec varius odio dapibus vitae. Fusce nibh quam, maximus eu auctor at, scelerisque id arcu. Nulla elementum sed mauris vitae imperdiet.</p>\r\n<p>Mauris maximus accumsan purus, quis ultrices tortor lobortis eu. Vestibulum pellentesque ligula quis neque rhoncus, et mattis massa euismod. Maecenas tempor finibus tellus dapibus bibendum. Aliquam commodo tincidunt libero.&nbsp;</p>\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:11:\"l10n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:5:\"notes\";s:0:\"\";}',5,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'Une \"top news\" de catégorie 1','Sed pulvinar, eros vitae venenatis fringilla, ipsum metus elementum ipsum, pellentesque aliquam metus mi eu justo.','<p>Fusce rhoncus gravida dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat, eros eget auctor porttitor, leo mauris pellentesque diam, ut aliquet tortor ipsum nec risus.</p>',1551299663,1746597600,'Bob Dylan','bob.dylan@ideative.ch',1,1,0,NULL,0,'1','0','','',0,NULL,1,NULL,NULL,1,0,'une-top-news-de-categorie-1','','','',0,0,0,0,0,'','','',0.5),
	(7,9,1551685353,1551352478,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:1:{s:10:\"categories\";N;}',0,0,0,0,0,'','',NULL,0,'News of type internal link','This news has no detail page, and is in fact an internal link.','',1551352448,0,'','',0,0,0,NULL,0,'0','1','','',0,NULL,1,'5',NULL,0,0,'news-of-type-internal-link','','','',0,0,0,0,0,'','','',0.5),
	(8,9,1551685353,1551353227,1,0,0,0,'',0,0,0,0,0,7,0,1,7,'a:29:{s:4:\"type\";s:1:\"1\";s:9:\"istopnews\";i:0;s:5:\"title\";s:26:\"News of type internal link\";s:12:\"path_segment\";s:26:\"news-of-type-internal-link\";s:6:\"teaser\";s:62:\"This news has no detail page, and is in fact an internal link.\";s:11:\"internalurl\";s:1:\"5\";s:8:\"datetime\";i:1551352448;s:7:\"archive\";i:0;s:8:\"is_event\";i:0;s:9:\"fal_media\";i:1;s:17:\"fal_related_files\";i:0;s:10:\"categories\";i:0;s:7:\"related\";i:0;s:13:\"related_links\";s:1:\"0\";s:4:\"tags\";i:0;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:5:\"notes\";s:0:\"\";s:11:\"l10n_parent\";i:0;s:16:\"content_elements\";i:0;}',0,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'News de type lien interne','Cette news n\'a pas de page de détail, c\'est un lien interne.','',1551352448,0,'','',0,0,0,NULL,0,'0','1','','',0,NULL,1,'5',NULL,0,0,'news-de-type-lien-interne','','','',0,0,0,0,0,'','','',0.5),
	(9,9,1551695154,1551353285,1,0,0,0,'',0,0,0,0,0,7,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:11:\"externalurl\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"is_event\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'News of type external link','This news has no detail page, and is in fact an external link.','',1551352448,0,'','',0,0,0,NULL,0,'0','2','','',0,NULL,1,'https://www.google.com','https://www.google.com',0,0,'news-of-type-external-link','','','',0,0,0,0,0,'','','',0.5),
	(10,9,1551695154,1551353285,1,0,0,0,'',0,0,0,0,0,8,0,1,9,'a:29:{s:4:\"type\";s:1:\"1\";s:9:\"istopnews\";i:0;s:5:\"title\";s:26:\"News of type external link\";s:12:\"path_segment\";s:26:\"news-of-type-external-link\";s:6:\"teaser\";s:62:\"This news has no detail page, and is in fact an external link.\";s:11:\"internalurl\";s:1:\"5\";s:8:\"datetime\";i:1551352448;s:7:\"archive\";i:0;s:8:\"is_event\";i:0;s:9:\"fal_media\";i:1;s:17:\"fal_related_files\";i:0;s:10:\"categories\";i:0;s:7:\"related\";i:0;s:13:\"related_links\";s:1:\"0\";s:4:\"tags\";i:0;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:5:\"notes\";s:0:\"\";s:11:\"l10n_parent\";i:0;s:16:\"content_elements\";i:0;}',9,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'News de type lien externe','Cette news n\'a pas de page de détail, c\'est un lien externe.','',1551352448,0,'','',0,0,0,NULL,0,'0','1','','',0,NULL,1,'5',NULL,0,0,'news-de-type-lien-externe','','','',0,0,0,0,0,'','','',0.5),
	(12,9,1551685353,1551359497,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:1:{s:10:\"categories\";N;}',0,0,0,0,0,'','',NULL,0,'News of type file link','Fusce sodales augue sed leo cursus, sed accumsan tellus malesuada. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.','',1551359405,0,'','',1,0,0,NULL,1,'0','10','','',0,NULL,1,'1',NULL,0,0,'news-of-type-file-link','','','',0,0,0,0,0,'','','',0.5),
	(13,9,1551685353,1551359783,1,0,0,0,'',0,0,0,0,0,12,0,1,12,'a:27:{s:4:\"type\";s:2:\"10\";s:9:\"istopnews\";i:0;s:5:\"title\";s:22:\"News of type file link\";s:12:\"path_segment\";s:22:\"news-of-type-file-link\";s:6:\"teaser\";s:252:\"Fusce sodales augue sed leo cursus, sed accumsan tellus malesuada. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\";s:17:\"fal_related_files\";i:1;s:8:\"datetime\";i:1551359405;s:7:\"archive\";i:0;s:10:\"categories\";i:1;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";s:17:\"alternative_title\";s:0:\"\";s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:5:\"notes\";s:0:\"\";s:11:\"l10n_parent\";i:0;s:7:\"related\";i:0;s:13:\"related_links\";s:1:\"0\";s:16:\"content_elements\";i:0;s:4:\"tags\";i:0;s:9:\"fal_media\";i:1;}',0,0,0,0,0,'','','{\"starttime\":\"parent\",\"endtime\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"categories\":\"parent\",\"related\":\"parent\",\"related_links\":\"parent\",\"keywords\":\"parent\",\"description\":\"parent\",\"editlock\":\"parent\",\"content_elements\":\"parent\",\"tags\":\"parent\",\"fal_media\":\"parent\",\"fal_related_files\":\"parent\"}',0,'News de type fichier','Fusce sodales augue sed leo cursus, sed accumsan tellus malesuada. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.','',1551359405,0,'','',1,0,0,NULL,1,'0','10','','',0,NULL,1,'1',NULL,0,0,'news-de-type-fichier','','','',0,0,0,0,0,'','','',0.5),
	(14,24,1607017845,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,'0',NULL,NULL,0,'Un événement très intéressant','Neque doloribus est sunt officiis fugiat eveniet. Rerum voluptates ut odit. Porro earum omnis consequatur quibusdam consequatur non. Est est fuga enim exercitationem quia accusamus ex omnis. Laboriosam possimus qui nesciunt aperiam id magnam.','<p>Quo voluptatum expedita culpa excepturi libero est quia. Odio odio itaque asperiores. Voluptatibus itaque eius id. Nobis voluptatibus sed rerum non cumque. Accusantium nostrum dolorum asperiores cumque minus. Illo in quo facilis in ut.</p><p>Ut veritatis reiciendis ad voluptates beatae qui. Corrupti sint laborum saepe eius. Velit neque voluptas sed fugiat quaerat.</p><p>Sed est reiciendis architecto quo veritatis est placeat laudantium. Quo est ipsam ex nostrum quaerat odit dolorem. Molestiae perspiciatis voluptatum eius dolore similique. Sint et eos sit quas minus aliquam facilis. Et est velit autem laudantium. Natus officiis esse iure numquam.</p><p>Omnis hic nobis error. Eum velit id facere quaerat atque occaecati ipsum. Repudiandae nobis cum assumenda. Molestiae perferendis est dolores eligendi repudiandae. Eligendi rem quia odit at harum quae dolores. Et voluptatem dolorem numquam.</p>',1607017688,0,NULL,NULL,0,0,0,NULL,0,NULL,'0',NULL,NULL,0,NULL,0,NULL,NULL,0,0,'un-evenement-tres-interessant',NULL,'','',1,0,0,0,0,'','','',0.5),
	(15,24,1607023569,0,0,0,0,0,'',0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,'0',NULL,NULL,0,'A very interesting event','Neque doloribus est sunt officiis fugiat eveniet. Rerum voluptates ut odit. Porro earum omnis consequatur quibusdam consequatur non. Est est fuga enim exercitationem quia accusamus ex omnis. Laboriosam possimus qui nesciunt aperiam id magnam.','<p>Quo voluptatum expedita culpa excepturi libero est quia. Odio odio itaque asperiores. Voluptatibus itaque eius id. Nobis voluptatibus sed rerum non cumque. Accusantium nostrum dolorum asperiores cumque minus. Illo in quo facilis in ut.</p><p>Ut veritatis reiciendis ad voluptates beatae qui. Corrupti sint laborum saepe eius. Velit neque voluptas sed fugiat quaerat.</p><p>Sed est reiciendis architecto quo veritatis est placeat laudantium. Quo est ipsam ex nostrum quaerat odit dolorem. Molestiae perspiciatis voluptatum eius dolore similique. Sint et eos sit quas minus aliquam facilis. Et est velit autem laudantium. Natus officiis esse iure numquam.</p><p>Omnis hic nobis error. Eum velit id facere quaerat atque occaecati ipsum. Repudiandae nobis cum assumenda. Molestiae perferendis est dolores eligendi repudiandae. Eligendi rem quia odit at harum quae dolores. Et voluptatem dolorem numquam.</p>',1607017688,0,NULL,NULL,0,0,0,NULL,0,NULL,'0',NULL,NULL,0,NULL,0,NULL,NULL,0,0,'a-very-interesting-event',NULL,'','',1,0,0,0,0,'','','',0.5);

/*!40000 ALTER TABLE `tx_news_domain_model_news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_news_domain_model_news_related_mm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_news_related_mm`;

CREATE TABLE `tx_news_domain_model_news_related_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_news_domain_model_news_related_mm` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news_related_mm` DISABLE KEYS */;

INSERT INTO `tx_news_domain_model_news_related_mm` (`uid_local`, `uid_foreign`, `sorting`, `sorting_foreign`)
VALUES
	(1,3,0,1),
	(1,4,0,1),
	(3,1,0,1),
	(3,2,0,1),
	(3,5,0,1),
	(5,3,1,0),
	(5,4,2,0),
	(3,6,0,1);

/*!40000 ALTER TABLE `tx_news_domain_model_news_related_mm` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_news_domain_model_news_tag_mm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_news_tag_mm`;

CREATE TABLE `tx_news_domain_model_news_tag_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_news_domain_model_news_ttcontent_mm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_news_ttcontent_mm`;

CREATE TABLE `tx_news_domain_model_news_ttcontent_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_news_domain_model_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_news_domain_model_tag`;

CREATE TABLE `tx_news_domain_model_tag` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `l10n_source` int(11) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tx_scheduler_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_scheduler_task`;

CREATE TABLE `tx_scheduler_task` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `nextexecution` int(10) unsigned NOT NULL DEFAULT '0',
  `lastexecution_time` int(10) unsigned NOT NULL DEFAULT '0',
  `lastexecution_failure` text COLLATE utf8_unicode_ci,
  `lastexecution_context` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialized_task_object` mediumblob,
  `serialized_executions` mediumblob,
  `task_group` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `index_nextexecution` (`nextexecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_scheduler_task` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task` DISABLE KEYS */;

INSERT INTO `tx_scheduler_task` (`uid`, `crdate`, `disable`, `deleted`, `description`, `nextexecution`, `lastexecution_time`, `lastexecution_failure`, `lastexecution_context`, `serialized_task_object`, `serialized_executions`, `task_group`)
VALUES
	(2,0,0,0,'',1552456800,1552391285,'','CLI',X'4F3A35353A225459504F335C434D535C457874656E73696F6E6D616E616765725C5461736B5C557064617465457874656E73696F6E4C6973745461736B223A373A7B733A31303A22002A007461736B556964223B693A323B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A363A22406461696C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323435363830303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A333B7D','',3),
	(7,0,0,0,'',1554098400,0,NULL,'',X'4F3A33353A225459504F335C434D535C52656379636C65725C5461736B5C436C65616E65725461736B223A393A7B733A393A22002A00706572696F64223B693A33303B733A31323A22002A007463615461626C6573223B613A33363A7B693A303B733A33343A2274785F626F6F7473747261707061636B6167655F6163636F7264696F6E5F6974656D223B693A313B733A31343A226261636B656E645F6C61796F7574223B693A323B733A383A2262655F7573657273223B693A333B733A393A2262655F67726F757073223B693A343B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B693A353B733A33353A2274785F626F6F7473747261707061636B6167655F636172645F67726F75705F6974656D223B693A363B733A33333A2274785F626F6F7473747261707061636B6167655F6361726F7573656C5F6974656D223B693A373B733A31323A227379735F63617465676F7279223B693A383B733A31363A227374617469635F636F756E7472696573223B693A393B733A32303A227374617469635F636F756E7472795F7A6F6E6573223B693A31303B733A31373A227374617469635F63757272656E63696573223B693A31313B733A31383A227379735F66696C655F7265666572656E6365223B693A31323B733A31363A227379735F66696C655F73746F72616765223B693A31333B733A31393A227379735F66696C655F636F6C6C656374696F6E223B693A31343B733A31343A227379735F66696C656D6F756E7473223B693A31353B733A33353A2274785F626F6F7473747261707061636B6167655F69636F6E5F67726F75705F6974656D223B693A31363B733A31363A227374617469635F6C616E677561676573223B693A31373B733A33343A2274785F6576656E746E6577735F646F6D61696E5F6D6F64656C5F6C6F636174696F6E223B693A31383B733A32353A2274785F6D617073325F646F6D61696E5F6D6F64656C5F706F69223B693A31393B733A33353A2274785F6D617073325F646F6D61696E5F6D6F64656C5F706F69636F6C6C656374696F6E223B693A32303B733A32353A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6C696E6B223B693A32313B733A32343A2274785F6E6577735F646F6D61696E5F6D6F64656C5F746167223B693A32323B733A32353A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6E657773223B693A32333B733A33353A2274785F6576656E746E6577735F646F6D61696E5F6D6F64656C5F6F7267616E697A6572223B693A32343B733A31303A2274745F636F6E74656E74223B693A32353B733A353A227061676573223B693A32363B733A31343A227379735F636F6C6C656374696F6E223B693A32373B733A31323A227379735F7265646972656374223B693A32383B733A32333A2274785F7363686564756C65725F7461736B5F67726F7570223B693A32393B733A383A227379735F6E657773223B693A33303B733A32383A2274785F626F6F7473747261707061636B6167655F7461625F6974656D223B693A33313B733A31323A227379735F74656D706C617465223B693A33323B733A31383A227374617469635F7465727269746F72696573223B693A33333B733A33333A2274785F626F6F7473747261707061636B6167655F74696D656C696E655F6974656D223B693A33343B733A383A2266655F7573657273223B693A33353B733A393A2266655F67726F757073223B7D733A31303A22002A007461736B556964223B693A373B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A313A2230223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A383A22406D6F6E74686C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535343039383430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A323B7D',NULL,2),
	(9,0,0,0,'',1552456800,1552391290,'','CLI',X'4F3A36323A225459504F335C434D535C5363686564756C65725C5461736B5C43616368696E674672616D65776F726B47617262616765436F6C6C656374696F6E5461736B223A383A7B733A31363A2273656C65637465644261636B656E6473223B613A353A7B693A303B733A34303A225459504F335C434D535C436F72655C43616368655C4261636B656E645C4E756C6C4261636B656E64223B693A313B733A35313A225459504F335C434D535C436F72655C43616368655C4261636B656E645C5472616E7369656E744D656D6F72794261636B656E64223B693A323B733A34363A225459504F335C434D535C436F72655C43616368655C4261636B656E645C53696D706C6546696C654261636B656E64223B693A333B733A303A22223B693A343B733A34303A225459504F335C434D535C436F72655C43616368655C4261636B656E645C46696C654261636B656E64223B7D733A31303A22002A007461736B556964223B693A393B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A363A22406461696C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323435363830303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A323B7D','',2),
	(10,0,0,0,'',1552391400,1552391284,'','CLI',X'4F3A34383A225459504F335C434D535C5363686564756C65725C5461736B5C46696C6553746F72616765496E646578696E675461736B223A383A7B733A31303A2273746F72616765556964223B693A313B733A31303A22002A007461736B556964223B693A31303B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A31313A222A2F35202A202A202A202A223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323339313430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A313B7D','',1),
	(11,0,0,0,'',1552391400,1552391284,'','CLI',X'4F3A35303A225459504F335C434D535C5363686564756C65725C5461736B5C46696C6553746F7261676545787472616374696F6E5461736B223A393A7B733A31303A2273746F72616765556964223B693A313B733A31323A226D617846696C65436F756E74223B693A3130303B733A31303A22002A007461736B556964223B693A31313B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A31313A222A2F35202A202A202A202A223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323339313430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A313B7D','',1),
	(12,0,0,0,'',1554098400,1552391290,'','CLI',X'4F3A35343A225459504F335C434D535C5363686564756C65725C5461736B5C52656379636C657247617262616765436F6C6C656374696F6E5461736B223A383A7B733A31323A226E756D6265724F6644617973223B693A33303B733A31303A22002A007461736B556964223B693A31323B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A383A22406D6F6E74686C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535343039383430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A313B7D','',1),
	(13,0,0,0,'',1552802400,1552391290,'','CLI',X'4F3A35313A225459504F335C434D535C5363686564756C65725C5461736B5C5461626C6547617262616765436F6C6C656374696F6E5461736B223A31303A7B733A393A22616C6C5461626C6573223B623A313B733A31323A226E756D6265724F6644617973223B693A303B733A353A227461626C65223B4E3B733A31303A22002A007461736B556964223B693A31333B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A373A22407765656B6C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323830323430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A323B7D','',2),
	(14,0,0,0,'',1554098400,1552391290,'','CLI',X'4F3A34343A225459504F335C434D535C5363686564756C65725C5461736B5C4970416E6F6E796D697A6174696F6E5461736B223A31303A7B733A31323A226E756D6265724F6644617973223B693A33303B733A343A226D61736B223B733A313A2232223B733A353A227461626C65223B733A373A227379735F6C6F67223B733A31303A22002A007461736B556964223B693A31343B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A313A2230223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A383A22406D6F6E74686C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535343039383430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A333B7D','',3),
	(16,0,0,0,'',1552802400,0,NULL,'',X'4F3A35303A225459504F335C434D535C5363686564756C65725C5461736B5C4F7074696D697A6544617461626173655461626C655461736B223A383A7B733A31343A2273656C65637465645461626C6573223B613A38313A7B693A303B733A31343A226261636B656E645F6C61796F7574223B693A313B733A393A2262655F67726F757073223B693A323B733A31313A2262655F73657373696F6E73223B693A333B733A383A2262655F7573657273223B693A343B733A31343A2263616368655F747265656C697374223B693A353B733A32363A2263665F61646D696E70616E656C5F726571756573746361636865223B693A363B733A33313A2263665F61646D696E70616E656C5F7265717565737463616368655F74616773223B693A373B733A31333A2263665F63616368655F68617368223B693A383B733A31383A2263665F63616368655F686173685F74616773223B693A393B733A31393A2263665F63616368655F696D61676573697A6573223B693A31303B733A32343A2263665F63616368655F696D61676573697A65735F74616773223B693A31313B733A32323A2263665F63616368655F6E6577735F63617465676F7279223B693A31323B733A32373A2263665F63616368655F6E6577735F63617465676F72795F74616773223B693A31333B733A31343A2263665F63616368655F7061676573223B693A31343B733A31393A2263665F63616368655F70616765735F74616773223B693A31353B733A32303A2263665F63616368655F7061676573656374696F6E223B693A31363B733A32353A2263665F63616368655F7061676573656374696F6E5F74616773223B693A31373B733A31373A2263665F63616368655F726F6F746C696E65223B693A31383B733A32323A2263665F63616368655F726F6F746C696E655F74616773223B693A31393B733A33333A2263665F657874626173655F646174616D6170666163746F72795F646174616D6170223B693A32303B733A33383A2263665F657874626173655F646174616D6170666163746F72795F646174616D61705F74616773223B693A32313B733A31393A2263665F6D617073325F63616368656468746D6C223B693A32323B733A32343A2263665F6D617073325F63616368656468746D6C5F74616773223B693A32333B733A31313A2263665F7668735F6D61696E223B693A32343B733A31363A2263665F7668735F6D61696E5F74616773223B693A32353B733A31353A2263665F7668735F6D61726B646F776E223B693A32363B733A32303A2263665F7668735F6D61726B646F776E5F74616773223B693A32373B733A393A2266655F67726F757073223B693A32383B733A31313A2266655F73657373696F6E73223B693A32393B733A383A2266655F7573657273223B693A33303B733A353A227061676573223B693A33313B733A31363A227374617469635F636F756E7472696573223B693A33323B733A32303A227374617469635F636F756E7472795F7A6F6E6573223B693A33333B733A31373A227374617469635F63757272656E63696573223B693A33343B733A31363A227374617469635F6C616E677561676573223B693A33353B733A31383A227374617469635F7465727269746F72696573223B693A33363B733A31363A227379735F62655F73686F727463757473223B693A33373B733A31323A227379735F63617465676F7279223B693A33383B733A32323A227379735F63617465676F72795F7265636F72645F6D6D223B693A33393B733A31343A227379735F636F6C6C656374696F6E223B693A34303B733A32323A227379735F636F6C6C656374696F6E5F656E7472696573223B693A34313B733A31303A227379735F646F6D61696E223B693A34323B733A383A227379735F66696C65223B693A34333B733A31393A227379735F66696C655F636F6C6C656374696F6E223B693A34343B733A31373A227379735F66696C655F6D65746164617461223B693A34353B733A32323A227379735F66696C655F70726F63657373656466696C65223B693A34363B733A31383A227379735F66696C655F7265666572656E6365223B693A34373B733A31363A227379735F66696C655F73746F72616765223B693A34383B733A31343A227379735F66696C656D6F756E7473223B693A34393B733A31313A227379735F686973746F7279223B693A35303B733A31323A227379735F6C616E6775616765223B693A35313B733A31373A227379735F6C6F636B65647265636F726473223B693A35323B733A373A227379735F6C6F67223B693A35333B733A383A227379735F6E657773223B693A35343B733A31323A227379735F7265646972656374223B693A35353B733A31323A227379735F726566696E646578223B693A35363B733A31323A227379735F7265676973747279223B693A35373B733A31323A227379735F74656D706C617465223B693A35383B733A31303A2274745F636F6E74656E74223B693A35393B733A33343A2274785F626F6F7473747261707061636B6167655F6163636F7264696F6E5F6974656D223B693A36303B733A33353A2274785F626F6F7473747261707061636B6167655F636172645F67726F75705F6974656D223B693A36313B733A33333A2274785F626F6F7473747261707061636B6167655F6361726F7573656C5F6974656D223B693A36323B733A33353A2274785F626F6F7473747261707061636B6167655F69636F6E5F67726F75705F6974656D223B693A36333B733A32383A2274785F626F6F7473747261707061636B6167655F7461625F6974656D223B693A36343B733A33333A2274785F626F6F7473747261707061636B6167655F74696D656C696E655F6974656D223B693A36353B733A33343A2274785F6576656E746E6577735F646F6D61696E5F6D6F64656C5F6C6F636174696F6E223B693A36363B733A33353A2274785F6576656E746E6577735F646F6D61696E5F6D6F64656C5F6F7267616E697A6572223B693A36373B733A34323A2274785F657874656E73696F6E6D616E616765725F646F6D61696E5F6D6F64656C5F657874656E73696F6E223B693A36383B733A34333A2274785F657874656E73696F6E6D616E616765725F646F6D61696E5F6D6F64656C5F7265706F7369746F7279223B693A36393B733A33303A2274785F67726964656C656D656E74735F6261636B656E645F6C61796F7574223B693A37303B733A31373A2274785F696D706578705F70726573657473223B693A37313B733A32353A2274785F6D617073325F646F6D61696E5F6D6F64656C5F706F69223B693A37323B733A33353A2274785F6D617073325F646F6D61696E5F6D6F64656C5F706F69636F6C6C656374696F6E223B693A37333B733A32353A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6C696E6B223B693A37343B733A32353A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6E657773223B693A37353B733A33363A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6E6577735F72656C617465645F6D6D223B693A37363B733A33323A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6E6577735F7461675F6D6D223B693A37373B733A33383A2274785F6E6577735F646F6D61696E5F6D6F64656C5F6E6577735F7474636F6E74656E745F6D6D223B693A37383B733A32343A2274785F6E6577735F646F6D61696E5F6D6F64656C5F746167223B693A37393B733A31373A2274785F7363686564756C65725F7461736B223B693A38303B733A32333A2274785F7363686564756C65725F7461736B5F67726F7570223B7D733A31303A22002A007461736B556964223B693A31363B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313531343736313230303B733A363A22002A00656E64223B733A313A2230223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A373A22407765656B6C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323830323430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A323B7D',NULL,2),
	(18,1552393025,0,0,'',1552802400,0,NULL,'',X'4F3A35343A225459504F335C434D535C5363686564756C65725C5461736B5C457865637574655363686564756C61626C65436F6D6D616E645461736B223A31303A7B733A32303A22002A00636F6D6D616E644964656E746966696572223B733A31353A226C616E67756167653A757064617465223B733A31323A22002A00617267756D656E7473223B613A313A7B733A373A226C6F63616C6573223B613A303A7B7D7D733A31313A22002A0064656661756C7473223B613A313A7B733A373A226C6F63616C6573223B613A303A7B7D7D733A31303A22002A007461736B556964223B693A31383B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313535323337303430303B733A363A22002A00656E64223B733A313A2230223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A373A22407765656B6C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323830323430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A333B7D',NULL,3),
	(19,1552393115,0,0,'',1552802400,0,NULL,'',X'4F3A35343A225459504F335C434D535C5363686564756C65725C5461736B5C457865637574655363686564756C61626C65436F6D6D616E645461736B223A31303A7B733A32303A22002A00636F6D6D616E644964656E746966696572223B733A32313A22636C65616E75703A6F727068616E7265636F726473223B733A31323A22002A00617267756D656E7473223B613A303A7B7D733A31313A22002A0064656661756C7473223B613A303A7B7D733A31303A22002A007461736B556964223B693A31393B733A31313A22002A0064697361626C6564223B623A303B733A31393A22002A0072756E4F6E4E65787443726F6E4A6F62223B623A303B733A31323A22002A00657865637574696F6E223B4F3A32393A225459504F335C434D535C5363686564756C65725C457865637574696F6E223A363A7B733A383A22002A007374617274223B693A313535323337303430303B733A363A22002A00656E64223B733A303A22223B733A31313A22002A00696E74657276616C223B693A303B733A31313A22002A006D756C7469706C65223B733A313A2230223B733A31303A22002A0063726F6E436D64223B733A373A22407765656B6C79223B733A32333A22002A0069734E657753696E676C65457865637574696F6E223B623A303B7D733A31363A22002A00657865637574696F6E54696D65223B693A313535323830323430303B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31323A22002A007461736B47726F7570223B693A323B7D',NULL,2);

/*!40000 ALTER TABLE `tx_scheduler_task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_scheduler_task_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_scheduler_task_group`;

CREATE TABLE `tx_scheduler_task_group` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `groupName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tx_scheduler_task_group` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task_group` DISABLE KEYS */;

INSERT INTO `tx_scheduler_task_group` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `hidden`, `sorting`, `groupName`, `description`)
VALUES
	(1,0,0,0,0,0,0,64,'FAL et fichiers',NULL),
	(2,0,0,0,0,0,0,192,'Maintenance du système',NULL),
	(3,0,0,0,0,0,0,256,'Mises à jour automatiques',NULL),
	(4,0,0,0,0,0,0,512,'Notifications',NULL);

/*!40000 ALTER TABLE `tx_scheduler_task_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tx_staticfilecache_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tx_staticfilecache_queue`;

CREATE TABLE `tx_staticfilecache_queue` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `cache_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `cache_priority` int(11) NOT NULL DEFAULT '0',
  `page_uid` int(11) NOT NULL DEFAULT '0',
  `invalid_date` int(11) NOT NULL DEFAULT '0',
  `call_date` int(11) NOT NULL DEFAULT '0',
  `call_result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `call_date` (`call_date`,`cache_url`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
