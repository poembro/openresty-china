# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.31-log)
# Database: openresty_china
# Generation Time: 2022-01-25 02:18:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `create_time`)
VALUES
	(1,'分享','2016-02-17 16:22:04'),
	(2,'问答','2016-02-17 16:22:04'),
	(3,'相亲','2021-09-20 11:15:20');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table collect
# ------------------------------------------------------------

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_topic` (`user_id`,`topic_id`),
  KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='我的收藏';

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;

INSERT INTO `collect` (`id`, `user_id`, `topic_id`, `create_time`)
VALUES
	(3,7,39,'2021-09-19 23:06:41'),
	(10,7,32,'2021-09-19 23:07:27'),
	(11,2,31,'2021-09-20 19:30:45'),
	(12,8,54,'2021-09-20 20:23:33'),
	(14,2,57,'2021-09-20 20:23:58'),
	(15,2,56,'2021-09-20 20:24:01'),
	(16,2,55,'2021-09-20 20:24:07'),
	(19,2,52,'2021-09-20 20:24:29'),
	(20,2,51,'2021-09-20 20:24:34'),
	(21,2,50,'2021-09-20 20:24:39'),
	(22,2,49,'2021-09-20 20:24:42'),
	(23,2,48,'2021-09-20 20:24:48'),
	(24,2,41,'2021-09-20 20:24:58'),
	(25,2,43,'2021-09-20 20:25:04'),
	(26,2,47,'2021-09-20 20:25:14'),
	(27,2,42,'2021-09-20 20:25:24'),
	(28,2,40,'2021-09-20 20:25:35'),
	(29,2,46,'2021-09-20 20:25:41'),
	(30,2,44,'2021-09-20 20:26:03'),
	(31,2,45,'2021-09-20 20:26:41'),
	(32,2,32,'2021-09-20 20:27:18'),
	(33,2,35,'2021-09-20 20:27:23'),
	(34,2,37,'2021-09-20 20:27:26'),
	(35,2,38,'2021-09-20 20:27:28'),
	(36,8,33,'2021-09-20 20:31:03'),
	(40,8,52,'2021-09-20 21:15:39'),
	(46,8,57,'2021-09-20 21:42:52'),
	(47,8,56,'2021-09-20 21:42:58'),
	(48,8,51,'2021-09-20 21:43:10'),
	(54,8,42,'2021-09-20 21:46:41'),
	(57,2,69,'2021-12-31 22:36:02');

/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(3000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_topic_id` (`topic_id`),
  KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

INSERT INTO `comment` (`id`, `topic_id`, `user_id`, `create_time`, `content`)
VALUES
	(3,31,8,'2021-09-20 10:46:11','111'),
	(5,33,2,'2021-09-20 15:53:10','### 这里填写我要发的内容XXX\n\n这里写我要发的正文内容，如果需要罗列展示了在内容里面一些小的格式，比如：\n\n- **加粗** - `-**加粗**`\n- *倾斜* - `*倾斜*`\n- ~~删除线~~ - `~~删除线~~`\n- `Code 标记` - ``Code 标记``\n- [超级链接](http://github.com) - `[超级链接](http://github.com)`\n- [poembro@126.com](mailto:poembro@126.com) - `[sumory.poembro@126.com](mailto:poembro@126.com)`\n'),
	(6,31,2,'2021-09-20 19:50:16','hello world [@test](/user/test/index) '),
	(7,56,8,'2021-09-20 20:22:21','暗示企业公司要被一个叫蜂巢的给干掉？'),
	(8,33,8,'2021-09-20 20:34:56','漂亮 学习了'),
	(9,56,2,'2021-09-20 21:06:39','哈哈哈'),
	(10,40,2,'2021-09-20 21:08:11','支持'),
	(11,40,2,'2021-09-20 21:08:31','曝光'),
	(12,40,8,'2021-10-22 10:19:06',' [@admin](/user/admin/index) testing'),
	(13,40,8,'2021-10-22 10:19:44',' [@admin](/user/admin/index) 央视曝光外卖平台乱收打包费 hao');

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_relation` (`from_id`,`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;

INSERT INTO `follow` (`id`, `from_id`, `to_id`, `create_time`)
VALUES
	(1,8,2,'2021-09-20 19:53:47'),
	(2,2,8,'2021-09-20 20:32:53');

/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table like
# ------------------------------------------------------------

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_topic` (`user_id`,`topic_id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;

INSERT INTO `like` (`id`, `user_id`, `topic_id`, `create_time`)
VALUES
	(1,2,39,'2021-09-19 22:50:37'),
	(2,7,39,'2021-09-19 22:57:40'),
	(3,7,32,'2021-09-19 23:06:59'),
	(4,8,37,'2021-09-20 10:48:35'),
	(5,2,33,'2021-09-20 15:54:02'),
	(6,2,31,'2021-09-20 19:30:42'),
	(7,8,32,'2021-09-20 20:03:23'),
	(8,8,54,'2021-09-20 20:23:33'),
	(9,2,58,'2021-09-20 20:23:52'),
	(10,2,57,'2021-09-20 20:23:57'),
	(11,2,56,'2021-09-20 20:24:01'),
	(12,2,55,'2021-09-20 20:24:06'),
	(13,2,54,'2021-09-20 20:24:14'),
	(14,2,53,'2021-09-20 20:24:22'),
	(15,2,52,'2021-09-20 20:24:28'),
	(16,2,51,'2021-09-20 20:24:33'),
	(17,2,50,'2021-09-20 20:24:38'),
	(18,2,49,'2021-09-20 20:24:42'),
	(19,2,48,'2021-09-20 20:24:47'),
	(20,2,41,'2021-09-20 20:24:58'),
	(21,2,43,'2021-09-20 20:25:04'),
	(22,2,47,'2021-09-20 20:25:13'),
	(23,2,42,'2021-09-20 20:25:23'),
	(24,2,40,'2021-09-20 20:25:34'),
	(25,2,46,'2021-09-20 20:25:41'),
	(26,2,44,'2021-09-20 20:26:03'),
	(27,2,45,'2021-09-20 20:26:40'),
	(28,2,32,'2021-09-20 20:27:18'),
	(29,2,35,'2021-09-20 20:27:22'),
	(30,2,37,'2021-09-20 20:27:25'),
	(31,2,38,'2021-09-20 20:27:27'),
	(32,8,33,'2021-09-20 20:31:02'),
	(33,8,56,'2021-09-20 21:04:20'),
	(34,8,58,'2021-09-20 21:09:58'),
	(35,8,52,'2021-09-20 21:15:30'),
	(36,8,57,'2021-09-20 21:35:24'),
	(38,8,51,'2021-09-20 21:43:06'),
	(39,8,42,'2021-09-20 21:46:19'),
	(40,2,69,'2021-12-31 22:35:47');

/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '接收用户id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型：0评论了你的文章 1评论中提到了你, 2某人关注了你',
  `from_id` int(11) NOT NULL DEFAULT '0' COMMENT '来自用户的id',
  `content` varchar(2000) NOT NULL COMMENT '内容',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1已读，0未读',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;

INSERT INTO `notification` (`id`, `user_id`, `type`, `from_id`, `content`, `topic_id`, `comment_id`, `status`, `create_time`)
VALUES
	(1,2,0,7,'',39,1,1,'2021-09-19 22:58:50'),
	(2,2,0,7,'',39,2,1,'2021-09-19 23:05:40'),
	(3,1,0,8,'',31,3,0,'2021-09-20 10:46:11'),
	(4,1,0,8,'',31,4,0,'2021-09-20 11:57:42'),
	(5,7,0,2,'',33,5,0,'2021-09-20 15:53:10'),
	(6,8,1,2,'',31,6,1,'2021-09-20 19:50:16'),
	(7,1,0,2,'',31,6,0,'2021-09-20 19:50:16'),
	(8,2,2,8,'',0,0,1,'2021-09-20 19:53:47'),
	(9,8,0,8,'',56,7,1,'2021-09-20 20:22:21'),
	(10,8,2,2,'',0,0,1,'2021-09-20 20:32:53'),
	(11,7,0,8,'',33,8,0,'2021-09-20 20:34:56'),
	(12,8,0,2,'',56,9,1,'2021-09-20 21:06:39'),
	(13,8,0,2,'',40,10,1,'2021-09-20 21:08:11'),
	(14,8,0,2,'',40,11,1,'2021-09-20 21:08:31'),
	(15,2,1,8,'',40,12,0,'2021-10-22 10:19:06'),
	(16,8,0,8,'',40,12,0,'2021-10-22 10:19:06'),
	(17,2,1,8,'',40,13,0,'2021-10-22 10:19:44'),
	(18,8,0,8,'',40,13,0,'2021-10-22 10:19:44');

/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL,
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '创建者用户名',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '赞个数',
  `collect_num` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `reply_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `follow` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `last_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '最后回复者id',
  `last_reply_name` varchar(255) NOT NULL DEFAULT '' COMMENT '最后回复者用户名',
  `last_reply_time` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属类',
  `is_good` int(11) NOT NULL DEFAULT '0' COMMENT '1精华帖，0普通帖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;

INSERT INTO `topic` (`id`, `title`, `content`, `user_id`, `create_time`, `update_time`, `user_name`, `like_num`, `collect_num`, `reply_num`, `follow`, `view_num`, `last_reply_id`, `last_reply_name`, `last_reply_time`, `category_id`, `is_good`)
VALUES
	(31,'Hello World! ','Hello World! ',1,'2016-02-27 22:44:23','2021-09-20 00:15:27','sumory',1,1,2,0,36,2,'admin','2021-09-20 19:50:16',2,0),
	(32,'Framework','test',2,'2016-02-27 22:44:23','2021-09-20 00:14:43','admin',3,2,0,0,17,0,'','2016-02-27 22:44:23',1,0),
	(33,'发帖最佳实践','### 这里填写我要发的内容XXX\n\n这里写我要发的正文内容，如果需要罗列展示了在内容里面一些小的格式，比如：\n\n- **加粗** - `-**加粗**`\n- *倾斜* - `*倾斜*`\n- ~~删除线~~ - `~~删除线~~`\n- `Code 标记` - ``Code 标记``\n- [超级链接](http://github.com) - `[超级链接](http://github.com)`\n- [poembro@126.com](mailto:poembro@126.com) - `[sumory.poembro@126.com](mailto:poembro@126.com)`\n\n\n\n \n\n# 分割线\n# 分割线\n# 分割线\n# 分割线\n# 上面这段内容的格式为:\n```\n### 这里填写我要发的内容XXX\n\n这里写我要发的正文内容，如果需要罗列展示了在内容里面一些小的格式，比如：\n\n- **加粗** - `-**加粗**`\n- *倾斜* - `*倾斜*`\n- ~~删除线~~ - `~~删除线~~`\n- `Code 标记` - ``Code 标记``\n- [超级链接](http://github.com) - `[超级链接](http://github.com)`\n- [poembro@126.com](mailto:poembro@126.com) - `[sumory.poembro@126.com](mailto:poembro@126.com)`\n\n\n```\n\n### 将灰色区域的内容复制，粘贴到编辑区域，然后点击预览。 即可看到对应格式效果。根据需要修改模板里的内容后，最终发布即可。',7,'2016-02-27 22:44:23','2021-09-20 15:52:39','momo',2,1,2,0,33,8,'test','2021-09-20 20:34:56',1,1),
	(35,'孩子3岁以前不建议用电动牙刷','口腔健康与全身健康息息相关。专家建议，婴儿出生之后，即使一颗牙齿也没有，家长也应每天用软纱布为孩子擦洗口腔。\n半岁左右牙齿萌出后，可以继续用这种方法擦洗口腔和牙齿表面。\n\n当多颗牙齿萌出后，家长可用指套刷或软毛刷为孩子每天刷牙2次，并清洁所有的牙面，特别是接近牙龈缘的部位，建议使用牙线帮助儿童清洁牙齿缝隙。\n儿童2岁左右开始学习刷牙，适合儿童的刷牙方法是“圆弧刷牙法”。\n\n具体操作方法是将刷毛放置在牙面上，轻压使刷毛弯曲，在牙面上画圈，每部位反复画圈 5 次以上，前牙内侧需将牙刷竖放，牙齿的各个面均应刷到。\n选择大小适宜的儿童牙刷，每两至三个月更换一次，当出现牙刷毛外翻或倒毛时，应及时更换牙刷，做到一人一刷一口杯。\n\n每天早晚刷牙，每次刷牙时间不少于 2 分钟，晚上睡前刷牙更重要。学龄前儿童很难完成精细复杂的刷牙动作，需要家长帮助和监督。\n此外，家长要注意给孩子选择适用其年龄阶段的牙刷，#孩子3岁以前不建议用电动牙刷#。',2,'2016-02-27 22:44:23','2021-09-20 15:14:52','admin',1,1,0,0,20,0,'','2016-02-27 22:44:23',2,0),
	(37,'孩子刚出生就需要做口腔清洁','  从小养成好的刷牙习惯，对人一生的健康都会起到积极作用。专家建议，孩子刚出生就需要做一些口腔清洁，通过按摩牙龈等方法让孩子适应口腔清洁的活动。在孩子长出第一颗牙之后，家长就应帮孩子刷牙。此外，家长要注意给孩子选择适用其年龄阶段的牙刷.',6,'2016-02-27 22:44:23','2021-09-20 15:13:27','jerry',2,1,0,0,27,0,'','2016-02-27 22:44:23',1,0),
	(38,'根管治疗后的现状','2019.12在武大口腔做的根管加陶瓷牙套。 完全不行，一旦咬到硬物就会破损。\n第一次是咬到米饭里的小石头,去补了，没花钱，临走时交代注意保护,下次就只能换牙套。\n平时都蛮注意基本不用那边牙吃饭。 结果晚上吃鸭脖，又中枪了。 非常绝望！\n\n问下大家，牙科这块医疗发展为何如此不堪。\n\n',7,'2016-02-27 22:44:23','2021-09-20 15:04:45','momo',1,1,0,0,77,0,'','2016-02-27 22:44:23',2,0),
	(39,'Markdown语法说明','# Guide\n\n这是一篇讲解如何正确使用OpenResty China 的 **Markdown** 的排版示例，学会这个很有必要，能让你的文章有更佳清晰的排版。\n\n> 引用文本：Markdown is a text formatting syntax inspired\n\n## 语法指导\n\n### 普通内容\n\n这段内容展示了在内容里面一些小的格式，比如：\n\n- **加粗** - `**加粗**`\n- *倾斜* - `*倾斜*`\n- ~~删除线~~ - `~~删除线~~`\n- `Code 标记` - ``Code 标记``\n- [超级链接](http://github.com) - `[超级链接](http://github.com)`\n- [sumory.wu@gmail.com](mailto:sumory.wu@gmail.com) - `[sumory.wu@gmail.com](mailto:sumory.wu@gmail.com)`\n\n### 评论文章时提及用户\n\n@sumory  ... 通过 @ 可以在评论里面提及用户，信息提交以后，被提及的用户将会收到系统通知。以便让他来关注这个帖子或回帖。\n\n### 表情符号 Emoji\n\nOpenResty China 支持表情符号，你可以用系统默认的 Emoji 符号。\n也可以用图片的表情，输入 `:` 将会出现智能提示。\n\n#### 一些表情例子\n\n:smile: :laughing: :dizzy_face: :sob: :cold_sweat: :sweat_smile:  :cry: :triumph: :heart_eyes:  :satisfied: :relaxed: :sunglasses: :weary:\n\n:+1: :-1: :100: :clap: :bell: :gift: :question: :bomb: :heart: :coffee: :cyclone: :bow: :kiss: :pray: :shit: :sweat_drops: :exclamation: :anger:\n\n对应字符串表示如下：\n\n```\n:smile: :laughing: :dizzy_face: :sob: :cold_sweat: :sweat_smile:  :cry: :triumph: :heart_eyes:  :satisfied: :relaxed: :sunglasses: :weary:\n:+1: :-1: :100: :clap: :bell: :gift: :question: :bomb: :heart: :coffee: :cyclone: :bow: :kiss: :pray: :shit: :sweat_drops: :exclamation: :anger:\n```\n\n更多表情请访问：[http://www.emoji-cheat-sheet.com](http://www.emoji-cheat-sheet.com)\n\n### 大标题 - Heading 3\n\n你可以选择使用 H2 至 H6，使用 ##(N) 打头，H1 不能使用，会自动转换成 H2。\n\n> NOTE: 别忘了 # 后面需要有空格！\n\n#### Heading 4\n\n##### Heading 5\n\n###### Heading 6\n\n### 代码块\n\n#### 普通\n\n```\n*emphasize*    **strong**\n_emphasize_    __strong__\n@a = 1\n```\n\n#### 语法高亮支持\n\n如果在 ``` 后面更随语言名称，可以有语法高亮的效果哦，比如:\n\n##### 演示 Lua 代码高亮\n\n```lua\nlocal lor = require(\"lor.index\")\nlocal app = lor()\n\napp:get(\"/\", function(req, res, next)\n    res:send(\"hello world!\")\nend)\n\napp:run()\n```\n\n##### 演示 Javascript 高亮\n\n```js\n(function (L) {\n    var _this = null;\n    L.Common = L.Common || {};\n    _this = L.Common = {\n        data: {},\n \n        init: function () {\n            console.log(\"init function\");\n        },\n\n        formatDate: function (now) {\n            var year = now.getFullYear();\n            var month = now.getMonth() + 1;\n            var date = now.getDate();\n            var hour = now.getHours();\n            var minute = now.getMinutes();\n            var second = now.getSeconds();\n            if (second < 10) second = \"0\" + second;\n            return year + \"-\" + month + \"-\" + date + \" \" + hour + \":\" + minute + \":\" + second;\n        }\n    };\n}(APP));\n```\n\n##### 演示 YAML 文件\n\n```yml\nzh-CN:\n  name: 姓名\n  age: 年龄\n```\n\n> Tip: 语言名称支持下面这些: `ruby`, `python`, `js`, `html`, `erb`, `css`, `coffee`, `bash`, `json`, `yml`, `xml` ...\n\n### 有序、无序列表\n\n#### 无序列表\n\n- Ruby\n  - Rails\n    - ActiveRecord\n- Go\n  - Gofmt\n  - Revel\n- Node.js\n  - Koa\n  - Express\n\n#### 有序列表\n\n1. Node.js\n  1. Express\n  2. Koa\n  3. Sails\n2. Ruby\n  1. Rails\n  2. Sinatra\n3. Go\n\n### 表格\n\n如果需要展示数据什么的，可以选择使用表格哦\n\n| header 1 | header 3 |\n| -------- | -------- |\n| cell 1   | cell 2   |\n| cell 3   | cell 4   |\n| cell 5   | cell 6   |\n\n### 段落\n\n留空白的换行，将会被自动转换成一个段落，会有一定的段落间距，便于阅读。\n\n请注意后面 Markdown 源代码的换行留空情况。',2,'2016-02-27 22:44:23','2016-02-27 22:44:23','admin',2,1,0,0,221,7,'momo','2021-09-19 23:05:40',1,1),
	(40,'央视曝光外卖平台乱收打包费','近日，不少消费者反映，有不少外卖平台和商家在打包费上动了歪心思，乱收打包费。专家表示，强制收取和重复收取打包费，不仅不合理，还侵犯了消费者的权益。',8,'2021-09-20 20:10:49',NULL,'test',1,1,4,0,8,8,'test','2021-10-22 10:19:44',1,0),
	(41,'小伙每天喝3瓶碳酸饮料牙齿烂穿','近日，常州的小陈因牙疼难忍，到医院就诊。经检查，小陈右侧的第一横磨牙，已严重龋坏。原来，小陈每天都喝两三瓶碳酸饮料，且晚上饮用后，不漱口就直接入睡。医生解释，碳酸会破坏牙齿表面的牙釉质，损害牙齿。',8,'2021-09-20 20:11:17',NULL,'test',1,1,0,0,3,0,'','2000-01-01 00:00:00',1,0),
	(42,'苏炳添赛后脚下一软','9月20日上午，赛后，苏炳添在经过退场通道时脚下一软，险些摔跤。网友：赛场上封神，赛场下也是人。永远爱你，苏神！',8,'2021-09-20 20:11:45',NULL,'test',2,2,0,0,25,0,'','2000-01-01 00:00:00',2,0),
	(43,'婆婆给我们缝的被子','老人给做的被子太漂亮了，看样子盖着也会很舒服，爱了爱了～',8,'2021-09-20 20:12:09',NULL,'test',1,1,0,0,4,0,'','2000-01-01 00:00:00',1,0),
	(44,'范丞丞首部电影门锁亮相北影节','身着纯黑挂锁装饰西服套装，即将亮相北京国际电影节开幕式红毯。光影流转，“门锁”在身，表达着他首部电影作品对于自己的意义。《门锁》小吴，期待早日相见。[耶]\n秋雨微凉，共同等待北京国际电影节大幕拉开，合力生光。\n\n ![wm02.jpg](/static/files/1632140003.073.jpg) ',8,'2021-09-20 20:13:24',NULL,'test',1,1,0,0,3,0,'','2000-01-01 00:00:00',1,0),
	(45,'北影节开幕红毯','北京电影节“天坛奖”评委会亮相开幕红毯群访，主席巩俐和评委会成员陈坤、陈正道、乌尔善、张颂文与媒体打招呼后离开。',8,'2021-09-20 20:14:00',NULL,'test',1,1,0,0,2,0,'','2000-01-01 00:00:00',1,0),
	(46,'新来的员工该不会是个哑巴','为什么我就没遇到过社恐的同事呢，我遇到得都是社会牛逼证',8,'2021-09-20 20:14:30',NULL,'test',1,1,0,0,4,0,'','2000-01-01 00:00:00',1,0),
	(47,'3岁双胞胎互相理发变光头','9月19日，广东东莞，三岁双胞胎哥俩在妈妈给剃头器充电去忙的间隙，两人居然给对方互相理发，当妈妈发现的时候已经为时已晚且无法挽救，后来没办法，索性就都给剔成了光头。',8,'2021-09-20 20:14:50',NULL,'test',1,1,0,0,3,0,'','2000-01-01 00:00:00',1,0),
	(48,'天舟三号货运飞船发射圆满成功','9月20日15时许，长征七号遥四运载火箭将天舟三号货运飞船准确送入预定轨道，发射取得圆满成功。（记者刘诗瑶、余建斌） ​',8,'2021-09-20 20:15:11',NULL,'test',1,1,0,0,5,0,'','2000-01-01 00:00:00',1,0),
	(49,'48岁农民奶奶背着孙子画国画','湖南浏阳新河村，有一群女性“农民画家”，她们上午扛锄头干农活，下午拿起毛笔画国画。48岁的黄女士经常将小孙子背在背上创作，她最擅长的是水墨山水画，最多一天能画10幅左右，每月能赚两千多元',8,'2021-09-20 20:15:39',NULL,'test',1,1,0,0,2,0,'','2000-01-01 00:00:00',1,0),
	(50,'嫦娥回不了广寒宫的原因','嫦娥：今年我不会回不了广寒宫过中秋了吧\n\n ![02.jpg](/static/files/1632140196.947.jpg) ',8,'2021-09-20 20:16:38',NULL,'test',1,1,0,0,4,0,'','2000-01-01 00:00:00',1,0),
	(51,'有些螃蟹是需要爬高跨栏的','网友：我知道，吃起来会更香[喵喵]】#簖蟹是种什么蟹#？它是江苏泰州姜堰特产。“簖”（duàn）是种竹子编制的渔具，高度1米左右，只有身强力壮的螃蟹才能跨过。因此，簖也成了筛选器，能筛选出肉质饱满的螃蟹。如今，当地蟹农更新养殖技术，年产值可超1亿元↓（总台记者吴睿 黄成 泰州台）',8,'2021-09-20 20:18:41',NULL,'test',2,2,0,0,6,0,'','2000-01-01 00:00:00',1,0),
	(52,'北京电影节','一身黑色西装的拢龙@朱一龙 ，帅得很周正[赞]，目前朱一龙主演电影《峰爆》正在热映，电影《人生大事》让人期待[打call]',8,'2021-09-20 20:19:01',NULL,'test',2,2,0,0,9,0,'','2000-01-01 00:00:00',1,0),
	(53,'北京电影节 朱一龙','9月20日，@朱一龙 一身黑色西服亮相北影节红毯，挺拔有型，生图也超绝！[赞]谈到自己正在上映的新片《峰爆》，他说在拍的时候尽全力去拍，当然希望观众可以喜欢，这部片向大家展示了什么叫《中国式救援》，把老铁道兵的精神都传达出来了。他还透露自己的新电影《人生大事》可能很快会上，他演的是一个做殡葬的丧葬师，电影讲的是这位丧葬师一个小女孩发生的一系列故事。',8,'2021-09-20 20:19:30',NULL,'test',1,0,0,0,5,0,'','2000-01-01 00:00:00',1,0),
	(54,'北京环球影城矿泉水10元一瓶','#北京环球影城有多吸金#？记者实地探访发现，在园区一天，门票、餐饮加上纪念品消费，花费动辄超过千元。而在随机采访的消费者也表示，园区内差不多人均100块钱可以在园区内解决一顿饭。园区餐车的矿泉水10元一瓶，可乐15元一瓶，而一杯网红饮料要50元一杯……',8,'2021-09-20 20:21:03',NULL,'test',2,1,0,0,12,0,'','2000-01-01 00:00:00',1,0),
	(55,'苏州一景区游客蹦极停滞半空','9月19日，一名游客在江苏苏州古里红豆山庄景区体验蹦极项目时停滞在空中。20日，据景区工作人员向@新京报我们视频 介绍，停滞在半空的游客可能是跳下去的时候把拉其上来的挂钩弄掉了，所以下去一个人帮他把扣子扣好，再把游客拉上来。目前，该景区蹦极项目正常开放。',8,'2021-09-20 20:21:18',NULL,'test',1,1,0,0,8,0,'','2000-01-01 00:00:00',1,0),
	(56,'南非63只非洲企鹅被蜜蜂蛰死','卫报当地时间20日报道，南非海岸鸟类保护基金会表示，在开普敦外的海滩上，63只濒危的非洲企鹅被蜜蜂蛰死。\n\n专家表示，经过测试，他们在企鹅的眼睛周围发现了蜜蜂叮咬的痕迹，企鹅尸体上也没有其他外伤，现场也发现了死蜜蜂的尸体。尸检还发现企鹅都被蜜蜂蜇过多次。\n\n专家表示这是非常罕见的情况。基金会表示，企鹅的尸体已经被送去进行疾病和毒理学检测',8,'2021-09-20 20:21:39','2021-09-20 21:04:16','test',2,2,2,0,26,2,'admin','2021-09-20 21:06:39',1,0),
	(57,'灵媒豆瓣开分7.0合理吗','过往大多数恐怖类作品, 证明缺失突然惊吓的作品, 不能称之为恐怖片。 《灵媒》则证明, 安安稳稳叙述一个故事, 给予的恐怖能有多少。 你觉得豆瓣给这部电影开分7.0合理吗？ ​',8,'2021-09-20 20:22:44',NULL,'test',2,2,0,0,50,0,'','2000-01-01 00:00:00',1,0),
	(58,'小可爱身上挂了个小可爱','导语：当小可爱身上挂了个小可爱，没想到还能这样撸猫，可爱加倍！\n\n',8,'2021-09-20 20:23:09',NULL,'test',2,0,0,0,34,0,'','2000-01-01 00:00:00',1,0),
	(59,'laravel安装篇之Composer','# Composer   PHP依赖管理的新时代\n\n### 原理就是借用PHP 的phar扩展特性 把代码打包   然后用php的cli 模式执行这个包       跟java一样打成一个tar包, \n```\ncurl -sS https://getcomposer.org/installer | php\n\n如果有错\n[root@www php]# cd 进入PHP源码包目录/ext/phar \n[root@www php]# phpize\n[root@www php]# ./configure --with-php-config=/usr/local/php/bin/php-config \n[root@www php]#make && make install \n\n\n\n设置 composer 镜像源\n[root@www php]#composer config -g repo.packagist composer https://packagist.phpcomposer.com\n\n\n\n\n#安装包的时候注意 要保证当前目录下有  composer.json 文件\n[root@www php]#vi composer.json\n{\n	\"require\": {\n		\"monolog/monolog\": \"1.2.*\"   #########表示待会执行时会在当前目录下创建一个vendor目录\n	}\n}\n  \n[root@www php]# php composer.phar install     \n	Do not run Composer as root/super user! See https://getcomposer.org/root for details\n	Loading composer repositories with package information\n	Updating dependencies (including require-dev)\n	  - Installing guzzlehttp/promises (1.3.0)\n		Downloading: 100%         \n\n	  - Installing psr/http-message (1.0.1)\n		Downloading: Failed       \n		Downloading: 100%         \n\n	  - Installing guzzlehttp/psr7 (1.3.1)\n		Downloading: 100%         \n\n	  - Installing guzzlehttp/guzzle (dev-master 471026d)\n		Cloning 471026d23a14f6eadd0147eb5697f48ebe6adec8\n		Failed to download guzzlehttp/guzzle from source: Failed to clone https://github.com/guzzle/guzzle.git, git was not found, check that it is installed and in your PATH env.\n\n	sh: git: command not found\n\n		Now trying to download from dist\n	  - Installing guzzlehttp/guzzle (dev-master 471026d)\n		Downloading: 100%         \n\n	Writing lock file\n	Generating autoload files\n	You have new mail in /var/spool/mail/root\n\n	\n	\n	\n	\n	\n	\n \n# 遇到问题 (在docker里面执行安装composer出现错误)\n[root@www php]#/data/web/test # curl -sS https://getcomposer.org/installer -k | php\nAll settings correct for using Composer\nDownloading...\nThe \"https://getcomposer.org/versions\" file could not be downloaded: SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed\nFailed to enable crypto\nfailed to open stream: operation failed\nRetrying...\nThe \"https://getcomposer.org/versions\" file could not be downloaded: SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed\nFailed to enable crypto\nfailed to open stream: operation failed\nRetrying...\nThe \"https://getcomposer.org/versions\" file could not be downloaded: SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed\nFailed to enable crypto\nfailed to open stream: operation failed\nThe download failed repeatedly, aborting.\n\n\n# 解决就是时间更新问题   以及 网络代理\nyum -y install ntp ntpdate\nntpdate cn.pool.ntp.org  /*同步网络时间到本机系统时间*/\nhwclock --systohc       /*同步系统时间到硬件时间*/\ntimedatectl\ndate  \"+%F %T\"  /*查看时间*/\n\n	\n\n# 创建 1个 名为 blog 项目\n	\n[root@www /data/web/test]#  php composer.phar -vvv create-project --prefer-dist laravel/laravel blog \"5.8.*\"\nCreating a \"laravel/laravel\" project at \"./blog\"\nInstalling laravel/laravel (v5.8.35)\n  - Downloading laravel/laravel (v5.8.35)\n  - Installing laravel/laravel (v5.8.35): Extracting archive\nCreated project in /data/web/test/blog\n\n\n\n```\n\n\n\n',2,'2021-09-24 14:28:46','2021-10-08 21:35:58','admin',0,0,0,0,27,0,'','2000-01-01 00:00:00',1,0),
	(60,'拉取php7.4版本的docker','\n```\nhttps://hub.docker.com/_/php?tab=tags&page=1&ordering=last_updated\n\ndocker pull php:7.4.24-fpm-alpine3.14\n\n\n\n docker run -p 127.0.0.1:9000:9000 -d --network=host --name my-running-php -v \"$PWD\":/data/web/test -w /data/web/test 0f53f2917118\n\ndocker container exec -it 4f2ca7399f1d /bin/sh\n\n\n如果在docker php容器内部 增加了 什么东西 要备份 \n \n\n3.备份当前已经改好的\ndocker commit -a \"poemrbo\" -m \"提交时的说明文字\" -p efb9d80324c3 my-running-php:php7.4prod \n    -a :提交的镜像作者； \n    -c :使用Dockerfile指令来创建镜像； \n    -m :提交时的说明文字； \n    -p :在commit时，将容器暂停。\n\n\n\n```',2,'2021-09-24 14:33:52',NULL,'admin',0,0,0,0,22,0,'','2000-01-01 00:00:00',1,0),
	(61,'laravel学习笔记一','```\n# 配置文件 .env 是区分各开发环境 生产环境的 比如数据库配置\n/data/web/test # cd blog/\n/data/web/test/blog # cat .env\nAPP_NAME=Laravel \nAPP_DEBUG=true \n\nDB_CONNECTION=mysql\nDB_HOST=127.0.0.1\nDB_PORT=3306\nDB_DATABASE=laravel\nDB_USERNAME=root\nDB_PASSWORD=\n\n# 而 Laravel 框架的所有配置文件都保存在 config 目录中，如config/social.php。\nreturn [\n   ‘debug\' => env(\'APP_DEBUG\', false),  //把.env里面的东西用env()函数搬运过来\n    \'weixin\' => [\n        \'url\' => \'https://weixin.com/qrcode.png\',\n        \'username\' => \'my_wexin_name\'\n    ],\n    \'weibo\' => [\n        \'url\' => \'https://weibo.com/my_acount\',\n        \'username\' => \'my_acount\'\n    ]\n];\n\n当让可以 动态设置\nconfig(\'social.weibo.username\', \'默认值\')\n// 上面等同于下面，注意是 `get` 而不是 `set`\nConfig::get(\'social.weibo.username\', \'默认值\');\n\n \n测试如下:\n$ php artisan tinker\n>>> env(\'APP_DEBUG\')\n=> true\n>>> getenv(\'APP_DEBUG\')\n=> \"true\"\n>>> $_ENV[\'APP_DEBUG\']\n=> \"true\"\n>>> $_SERVER[\'APP_DEBUG\']\n=> \"true\"\n>>> config(\'app.debug\')\n=> true\n\n\n# 路由\n### 普通http请求方法限制\nRoute::match([\'get\', \'post\'], \'/\', function () {\n    //支持两种方法\n});\n\nRoute::any(\'foo\', function () {\n    //可以接收所有的方法\n})；\n\n\n\n### 路径上的参数限制\nRoute::get(\'user/{id}/{name}\', function ($id, $name) {\n    // 同时限定两个参数\n})->where([\'id\' => \'[0-9]+\', \'name\' => \'[a-z]+\']);\n \n//全局参数限制(针对所有 路径上的id)\napp/Providers/RouteServiceProvider.php\n//定义路由模型绑定、路由全局约束等\npublic function boot()\n{\n    Route::pattern(\'id\', \'[0-9]+\'); \n    parent::boot();\n}\n\n\n\n\n### 给路由命名 (可以为指定路由生成URL或重定向)\nRoute::get(\'user/profile\', \'UserProfileController@show\')->name(\'profile\');\n// 生成 URL...\n$url = route(\'profile\');\n//生成 URL 带参数\nRoute::get(\'user/{id}/profile\', function ($id) {\n    //todo\n})->name(\'profile\');\n$url = route(\'profile\', [\'id\' => 1]);\n \n// 生成重定向...\nreturn redirect()->route(\'profile\');\n\n\n\n\n### 访问控制 (让某个用户访问身份验证，并且访问频率每分钟不超过60)\nRoute::middleware(\'auth:api\', \'throttle:60,1\')->group(function () {\n    Route::get(\'/user\', function () {\n        //\n    });\n});\n\n\n\n# 中间件 (Laravel 自带了 身份验证、CSRF 保护 CORS 等中间件。都位于 app/Http/Middleware 目录。)\n\n### 定义中间件 (会在app/Http/Middleware目录下创建CheckAge类文件)\nphp artisan make:middleware CheckAge \n\n<?php\n\nnamespace App\\Http\\Middleware;\n\nuse Closure;\n\nclass CheckAge\n{\n    /**\n     * Handle an incoming request.\n     *\n     * @param  \\Illuminate\\Http\\Request  $request\n     * @param  \\Closure  $next\n     * @return mixed\n     */\n    public function handle($request, Closure $next)\n    {\n        if ($request->age <= 200) {\n            return redirect(\'home\');  // age 参数小于或等于 200 则重定向\n        }\n\n        return $next($request); // age 大于200 继续后续handler\n    }\n}\n\n### 注册中间件\n- 全局中间件  只需要在app/Http/Kernel.php 中的 $middleware 属性中列出这个中间件\n- 为路由分配中间件  需要在app/Http/Kernel.php 中分配1个键  将其放入该类中的 $routeMiddleware 属性中\n- 注意如果没有放在可直接填写完整命名空间加双冒号class即可\n\n### 中间组件\n- 如果需要某1个键把多个中间件打包成1个组，方便将其应用到路由中去，可以使用Http 核心的 $middlewareGroups 属性。\n    protected $middlewareGroups = [\n        \'web\' => [\n            \\App\\Http\\Middleware\\EncryptCookies::class,......\n        ],\n\n        \'api\' => [\n            \'throttle:60,1\',\n            \'bindings\',\n        ],\n    ];\n使用方法\nRoute::group([\'middleware\' => [\'api\']], function () {\n    //\n});\n\n### 中间件 排序\n可以使用 app/Http/Kernel.php 文件的 $middlewarePriority 属性指定中间件优先级：\n\n### 中间件参数\n需要在执行给定操作之前验证用户是否属于给定的「角色」 ，可以创建一个 CheckRole 中间件，由它来接收「角色」名称作为附加参数。\n附加的中间参数应该在 $next 参数之后传递给中间件：\n \n<?php \nnamespace App\\Http\\Middleware; \nuse Closure;\n\nclass CheckRole\n{ \n    public function handle($request, Closure $next, $role)\n    {\n        if (! $request->user()->hasRole($role)) {\n            // Redirect...\n        }\n\n        return $next($request);\n    } \n}\n\n\n定义路由时通过一个 : 来隔开中间件名称和参数来指定中间件参数。多个参数就使用逗号分隔：\nRoute::put(\'post/{id}\', function ($id) {\n    //\n})->middleware(\'role:editor\');\n\n\n\n\n## 接受用户输入     Illuminate\\Support\\Facades\\Input\n\nFacades : \"门面\" 的意思 。门面是介于一个类的实例化与没有实例化中间的一个状态。其实是静态方法\n\nInput::get(\"参数的名字\"，\"如果用户没传 使用该默认值\")\nInput::all() 获取所有的输入\nInput::only([]) 获取指定几个 输入\nInput::exceput([])  获取指定几个用户的输入 以外的所有参数\nInput::has(\'name\')  判断某个输入的参数是否存在\n上述方法 即可以 获取get中的信息 也可以获取post中的信息\n\n\n如果每次都嫌弃   Illuminate\\Support\\Facades\\Input 太长\n则可以在 config/app.php中定义长串的别名  (在 aliase 数组中定义别名)\n\n\n调试函数 dd($app)   ==等价于==>  var_dump + die()\n\n\n\n\n\n\n## laravel 的 facades 门面   (是1个可以在容器中访问对象的类)\nuse Illuminate\\Support\\Facades\\Cache;\nRoute::get(\'facades\', function ($id) {\n    Cache([\'name\'=>\"张三\"], 3000);   // 将会在storage/framework/cache/data/创建1个文件\n    Cache::get(\'name\')  //底层会走__call()\n\n    或者=>   resolve(\"cache.store\")->get(\"name\") \n\n    或者=> Cache(\"name\")\n})\n\n## laravel 的 Contracts 契约 都是用来调用底层代码实现 \nFacades 是引入到命名空间上的门面    \nContracts  是定义了一堆接口  \n每一个Facades 门面 都有个相对应的Contracts  契约 \n\nRoute::get(\'Contracts\', function (Illuminate\\Contracts\\Cache\\Factory $cache) {\n      $cache->put([\'name\' => \"张三\"], 3000)\n      $cache->get(\"name\")\n})\n\n\n\nUser::where(\'is_official\', true)->value(\'id\')   获取一条数据的 id 字段值\n\nUser::where(\'is_official\', true)->pluck(\'id\')   \n// 表示 select * from users where is_official=true  拿到所有数据后； pluck(\'id\') 是将到所有id的值提出来 组成一个数组 [1,2,3,4] \n\n\n\n\n\n\n\nmigration (laravel数据迁移)\n1.本质上就是mysql中，有一个migration表，记录了 所有的cmd脚本文件名。 \n每个脚本只干1件事情 \n如：创建表是一个文件。 \n增加1个字段也是一个文件。\n\n2. 每次执行migration命令时 它会扫描一下表中是否有对应目录的文件，如果mysql表中已经有了则不执行老的脚本。\n\n3.每次想执行sql 时候 先要生成文件模版，\n然后修改模版里面的 up down 方法。最后执行\n\n\n\n\n\n```',2,'2021-09-24 15:53:42','2021-12-31 23:23:00','admin',0,0,0,0,38,0,'','2000-01-01 00:00:00',1,0),
	(63,'artisan 在laravel命令行中起什么作用','## artisan 是laravel 的命令行接口名称， 提供了一些命令帮助laravel开发应用\n\n比如 php artisan migrate --help    (用来做数据迁移的)\n\n我们也可以自定义  php artisan lor \n\n具体实现 ： 自定义命令默认放在 app/Console/Commands 目录，当然了 要是在composer.json中配置了自动加载，可以随意放在任何目录+\n\nphp artisan make:console Lor (Artisan命令生成文件，然后去填充文件内容即可)\n\n完了之后，app/Console/Commands/Lor.php 类下面写了 send 方法\n\nphp artisan make:console Lor --command=lor:send\n```\n<?php\n\nnamespace App\\Console\\Commands;\n\nuse App\\User;\nuse App\\DripEmailer;\nuse Illuminate\\Console\\Command;\n\nclass Lor extends Command\n{\n    /**\n     * 命令行的名称及用法。\n     * (注意)该属性定义命令行调用时必须输入的格式 \n     \'email:send {user} {--queue}\'          回头命令行调用 : php artisan email:send 1 --queue=default \n     * @var string\n     */\n    protected $signature = \'lor:send {user}\';\n\n    /**\n     * 命令行的概述。\n     *\n     * @var string\n     */\n    protected $description = \'Send drip e-mails to a user\';\n\n    /**\n     * 滴灌电子邮件服务。\n     *\n     * @var DripEmailer\n     */\n    protected $drip;\n\n    /**\n     * 创建新的命令实例。\n     *\n     * @param  DripEmailer  $drip\n     * @return void\n     */\n    public function __construct(DripEmailer $drip)\n    {\n        parent::__construct();\n\n        $this->drip = $drip;\n    }\n\n    /**\n     * 运行命令。\n     * \n     * @return mixed\n     */\n    public function handle()\n    {\n         $name = $this->ask(\'你是名字是?\');\n         $password = $this->secret(\'密码是？\');\n         if ($this->confirm(\'你希望继续吗? [y|N]\')) {\n             //\n         }\n         $name = $this->anticipate(\'你的名字是?\', [\'Taylor\', \'Dayle\']);\n         $name = $this->choice(\'你的名字是?\', [\'Taylor\', \'Dayle\'], false);\n         $this->info(\'把我显示在界面上\');\n         $this->error(\'有东西出问题了！\');\n         $this->line(\'把我显示在界面上\');\n               $this->drip->send(User::find($this->argument(\'user\'))); //可以获取命令行参数\n         }\n}\n```',2,'2021-09-26 17:04:18','2021-09-26 17:04:42','admin',0,0,0,0,22,0,'','2000-01-01 00:00:00',1,0),
	(64,'composer.json中的字段含义','```\n{\n    \"name\": \"laravel/laravel\",   /* 包名称   供应商名称 + 项目名称  用 / 分隔 */\n    \"type\": \"project\",    /* 包的安装类型，1. 默认为 library。 2. project 表示当前是1个项目，而不是库 3. metapackage: 当一个空的包，包含依赖并且需要触发依赖的安装*/\n    \"description\": \"The Laravel Framework.\", /* 描述 */\n    \"keywords\": [  \n        \"framework\",\n        \"laravel\"\n    ],\n   \"authors\": [\n        {\n            \"name\": \"Nils Adermann\",\n            \"email\": \"naderman@naderman.de\",\n            \"homepage\": \"http://www.naderman.de\",\n            \"role\": \"Developer\"\n        },\n        {\n            \"name\": \"Jordi Boggiano\",\n            \"email\": \"j.boggiano@seld.be\",\n            \"homepage\": \"http://seld.be\",\n            \"role\": \"Developer\"\n        }\n    ],\n    \"license\": \"MIT\",\n    \"require\": {\n        \"php\": \"^7.1.3\",\n        \"doctrine/dbal\": \"^2.13\",\n        \"elasticsearch/elasticsearch\": \"7.9.1\",\n        \"fideloper/proxy\": \"^4.0\",\n        \"fruitcake/laravel-cors\": \"^2.0\",\n        \"guzzlehttp/guzzle\": \"6.3.3\",\n        \"laravel/framework\": \"5.8.*\",\n        \"laravel/tinker\": \"^1.0\",\n        \"nategood/httpful\": \"^0.3.2\",\n        \"predis/predis\": \"^1.1\",\n        \"qcloud/cos-sdk-v5\": \"^2.2\",\n        \"ramsey/uuid\": \"3.x-dev\",\n        \"symfony/process\": \"4.4.26\",\n        \"tucker-eric/eloquentfilter\": \"^2.4\",\n        \"tymon/jwt-auth\": \"^1.0\"\n    },\n    \"require-dev\": { /*这个列表是为开发或测试等目的，额外列出的依赖。 */\n        \"beyondcode/laravel-dump-server\": \"^1.0\",\n        \"filp/whoops\": \"^2.0\",\n        \"fzaninotto/faker\": \"^1.4\",\n        \"mockery/mockery\": \"^1.0\",\n        \"nunomaduro/collision\": \"^3.0\",\n        \"phpunit/phpunit\": \"^7.5\"\n    },\n    \"config\": { \n        \"optimize-autoloader\": true,\n        \"preferred-install\": \"dist\", /*默认auto 它可以是 source、dist 或 auto。这个选项允许你设置 Composer 的默认安装方法*/\n        \"sort-packages\": true\n    },\n    \"extra\": {\n        \"laravel\": {\n            \"dont-discover\": []\n        }\n    },\n    \"autoload\": {\n        \"psr-4\": {\n            \"App\\\\\": \"app/\", \n            \"Common\\\\\": \"packagist/stnts-common/\",\n            \"Cos\\\\\": \"packagist/cos/src/\",\n            \"Easydown\\\\\": \"packagist/easydown/src/\",\n            \"BaseCommon\\\\\": \"packagist/base-common/\",\n            \"Aiyutan\\\\\": \"packagist/aiyutan/src/\",\n            \"Ifanni\\\\\": \"packagist/ifanni/src/\",     /* 当 代码中遇到Ifanni\\\\ 时 则自动加载器将去 packagist/ifanni/src/ 目录下查找对应类文件*/\n            \"GoStart\\\\\": \"packagist/go-start/src/\",\n            \"OperationLog\\\\\": \"packagist/operation-log/src/\"\n        },\n        \"classmap\": [  /*  引用的所有组合都会在install/update过程中生成，并存储到 vendor/composer/autoload_classmap.php文件中去，这个map是经过扫描指定目录所有.php和.inc文件里内置类而得到的*/\n            \"database/seeds\",\n            \"database/factories\"\n        ],\n        \"files\": [  /*  如果 每次请求时都要载入某些文件,  比如通用函数库 而非类库 就可以放在这里*/\n            \"bootstrap/helper.php\" \n        ]\n    },\n    \"autoload-dev\": { /*以开发为目的的自定义加载规则*/\n        \"psr-4\": {\n            \"Tests\\\\\": \"tests/\"\n        }\n    },\n    \"minimum-stability\": \"dev\", /*默认为 stable 表示稳定包   dev表示开发中的包 */\n    \"prefer-stable\": true, /*为true时 Composer 将优先使用它，表示更稳定的包版本*/\n    \"scripts\": { /* 允许你在安装过程中的各个阶段挂接脚本*/\n        \"post-autoload-dump\": [ /*在自动加载器被转储后触发，无论是 install/update 还是 dump-autoload 命令都会触发。*/\n            \"Illuminate\\\\Foundation\\\\ComposerScripts::postAutoloadDump\",\n            \"@php artisan package:discover --ansi\"\n        ],\n        \"post-root-package-install\": [ /*在 create-project 命令期间，根包安装完成后触发。*/\n            \"@php -r \\\"file_exists(\'.env\') || copy(\'.env.example\', \'.env\');\\\"\"\n        ],\n        \"post-create-project-cmd\": [ /*在 create-project 命令执行后触发。*/\n            \"@php artisan key:generate --ansi\"\n        ]\n    }\n}\n\n\n```',2,'2021-09-26 19:30:44',NULL,'admin',0,0,0,0,16,0,'','2000-01-01 00:00:00',1,0),
	(65,'php之trait 用来包一些公共属性方法供其他类使用','## php 是单继承语言,无法同时从两个基类中继承属性和方法, 而Trait就是为了解决这个问题而生\n\n```\ntrait Com{\n    public $name = \"武汉xx网络科技\"；\n    public function handle(){\n        echo \"hello \" .. this->name;\n    }\n}\n\nclass A{\n    public function eat(){\n         echo \"eat\";\n    }\n}\n\nclass B extends A{\n    use Com;\n    public function drive(){\n           echo \"drive\";\n    }\n}\n\n$obj = new B();\n$obj->drive();\n$obj->eat();\n$obj->handle();\n\n\n\n\n\n//trait1 与 trait 2内部都有相同方法  \n<?php\ntrait trait1{\n    public function eat(){\n        echo \"This is trait1 eat\";\n    }\n    public function drive(){\n        echo \"This is trait1 drive\";\n    }\n}\ntrait trait2{\n    public function eat(){\n        echo \"This is trait2 eat\";\n    }\n    public function drive(){\n        echo \"This is trait2 drive\";\n    }\n}\nclass cat{\n    use trait1,trait2{\n        trait1::eat insteadof trait2;  //用 trait1 下面的 eat方法 替换  trait2下面的 eat方法 \n        trait1::drive insteadof trait2;\n    }\n}\nclass dog{\n    use trait1,trait2{\n        trait1::eat insteadof trait2;  \n        trait1::drive insteadof trait2;\n        trait2::eat as eaten;  //给trait2的eat方法  起个别名  依旧能访问\n        trait2::drive as driven;\n    }\n}\n$cat = new cat();\n$cat->eat();\necho \"<br/>\";\n$cat->drive();\necho \"<br/>\";\necho \"<br/>\";\necho \"<br/>\";\n$dog = new dog();\n$dog->eat();\necho \"<br/>\";\n$dog->drive();\necho \"<br/>\";\n$dog->eaten();\necho \"<br/>\";\n$dog->driven();\n?>\n```',2,'2021-09-27 11:28:34','2021-09-27 11:37:56','admin',0,0,0,0,16,0,'','2000-01-01 00:00:00',1,0),
	(66,'gorm 学习使用','##  gorm  简介\n一个用来访问数据的库，而且被封装过的，开发人员用着可以节省代码量的库\n\n 官方文档 https://gorm.io/zh_CN/docs/models.html\n\n## 约定\n```\ngorm 使用id作为主键，默认使用结构体名 “蛇形复数“做表名，同时语义符合英文语法(尽管形式很生猛)，可以通过Config进行选择是否使用复数。\n字段名的 蛇形 作为列名，并使用 CreatedAt、UpdatedAt 字段追踪创建、更新时间\n例如:\n// data将会变成表名称\ntype Data struct {\n	ID  uint   `json:\"id,omitempty\" gorm:\"primaryKey\"`\n	Msg string `json:\"msg,omitempty\" gorm:\"type:varchar(10) unique\"`\n}\n//users 将会变成表名称    接口体名使用AaBc 则aa_bcs是表名\ntype User struct {\n  ID   string // 默认情况下，名为 `ID` 的字段会作为表的主键  \n  UUID   string `gorm:\"primaryKey\"`  //这里强制指定其他字段作为主键\n  Name string\n}\n\n\ntype User struct {\n  gorm.Model   //该字段  等价于 4个默认字段\n  Name string\n}\n// 等效于\ntype User struct {\n  ID        uint           `gorm:\"primaryKey\"`\n  CreatedAt time.Time\n  UpdatedAt time.Time\n  DeletedAt gorm.DeletedAt `gorm:\"index\"` \n  Name string `gorm:\"<-:create\"` // 允许读和创建\n  Name string `gorm:\"<-:update\"` // 允许读和更新\n  Name string `gorm:\"<-\"`        // 允许读和写（创建和更新）\n  Name string `gorm:\"<-:false\"`  // 允许读，禁止写\n  Name string `gorm:\"->\"`        // 只读（除非有自定义配置，否则禁止写）\n  Name string `gorm:\"->;<-:create\"` // 允许读和写\n  Name string `gorm:\"->:false;<-:create\"` // 仅创建（禁止从 db 读）\n  Name string `gorm:\"-\"`  // 通过 struct 读写会忽略该字段  注意 使用 GORM Migrator 创建表时，不会创建该字段 因为它被忽略了.\n  Author  Author `gorm:\"embedded;embeddedPrefix:author_\"`  //使用结构体字段 可以通过 embedded 将其嵌入      等价于  AuthorName  string, AuthorEmail string\n\n  Field int `json:\"-\"` // 字段被本包忽略\n  Field int `json:\"myName\"`  // 字段在json里的键为\"myName\"\n  Field int `json:\"myName,omitempty\"`  // 字段在json里的键为\"myName\"且如果字段为空值将在生成json 后 json里面看不到该字段  \n  Field int `json:\",omitempty\"` // 字段在json里的键为\"Field\"（默认值），但如果字段为空值会跳过；注意前导的逗号\n  Int64String int64 `json:\",string\"` //强制指定 编码为字符串类型 ,但它只适用于字符串、浮点数、整数类型的字段\n}\n\n//更多标签  https://gorm.io/zh_CN/docs/models.html#embedded_struct\n```\n\n\n\n## 案例\n```\npackage main\n\nimport (\n   \"fmt\" \n   \"github.com/jinzhu/gorm\"\n   _ \"github.com/jinzhu/gorm/dialects/mysql\"\n)\n\ntype Animal struct {\n   ID   int64\n   Name string\n   Age  int64\n}\n\nfunc main() {\n   db, err := gorm.Open(\"mysql\", \"root:root@(localhost)/gormdemo?charset=utf8&parseTime=true&loc=Local\")\n   if err != nil {\n      fmt.Println(\"connect db error: \", err)\n   }\n   defer db.Close()\n   init_data(db)\n   query_test(db)\n   err=update_test(db)\n   if err!=nil{\n      fmt.Println(err)\n   }\n   err=delet_test(db)\n   if err!=nil{\n      fmt.Println(err)\n   }\n   err=trans_test(db)\n   if err!=nil{\n      fmt.Println(err)\n   }\n}\nfunc init_data(db *gorm.DB)  {\n   sql:=`DROP TABLE IF EXISTS animals ;`\n   db.Exec(sql)\n   sql=`\n      CREATE TABLE animals (\n        id BIGINT(20) NOT NULL AUTO_INCREMENT,\n        NAME VARCHAR(255) DEFAULT \'galeone\',\n        age INT(10) UNSIGNED DEFAULT \'0\',\n        PRIMARY KEY (id)\n      ) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;`\n   db.Exec(sql)\n   sql=`\n      INSERT INTO animals SELECT \'1\', \'demo-test\', \'20\'\n      UNION ALL SELECT \'2\', \'galeone\', \'30\'\n      UNION ALL SELECT \'3\', \'demotest\', \'30\'\n      UNION ALL SELECT \'4\', \'jim\', \'90\'\n      UNION ALL SELECT\'5\', \'jimmy\', \'10\'\n      UNION ALL SELECT \'6\', \'jim\', \'23\'\n      UNION ALL SELECT \'7\', \'test3\', \'27\'\n      `\n   db.Exec(sql)\n}\nfunc create_test(db * gorm.DB)(error) {\n   animal := Animal{Name: \"demo-test\", Age: 20}\n   db.Create(&animal)\n   return nil\n}\nfunc query_test(db *gorm.DB)(error)  {\n   //根据主键查询第一条记录\n   var animal Animal\n   db.First(&animal)\n   fmt.Println(animal)\n\n   //根据主键查询最后一条记录\n   var animal2 Animal\n   db.Last(&animal2)\n   fmt.Println(animal2)\n\n   //指定某条记录（仅当主键为整型时可用）\n   var animal3 Animal\n   db.First(&animal3, 2)\n   fmt.Println(animal3)\n\n   //where条件\n   //符合条件的第一条记录\n   var animal4 Animal\n   db.Where(\"name = ?\", \"demo-test\").First(&animal4)\n   fmt.Println(\"where : \", animal4, animal4.ID, animal4.Name, animal4.Age)\n\n   //符合条件的所有记录\n   var animals5 []Animal\n   db.Where(\"name = ?\", \"galeone\").Find(&animals5)\n   fmt.Println(animals5)\n   for k, v := range animals5 {\n      fmt.Println(\"k:\", k, \"ID:\", v.ID, \"Name:\", v.Name, \"Age:\", v.Age)\n   }\n\n   //IN\n   var animals6 []Animal\n   db.Where(\"name IN (?)\", []string{\"demo-test\", \"demotest2\"}).Find(&animals6)\n   fmt.Println(animals6)\n\n   //LIKE\n   var animals7 []Animal\n   db.Where(\"name like ?\", \"%jim%\").Find(&animals7)\n   fmt.Println(animals7)\n\n   //AND\n   var animals8 []Animal\n   db.Where(\"name = ? AND age >= ?\", \"jim\", \"24\").Find(&animals8)\n   fmt.Println(animals8)\n\n   //总数\n   var count int\n   var animals9 []Animal\n   db.Where(\"name = ?\", \"galeone\").Or(\"name = ?\", \"jim\").Find(&animals9).Count(&count)\n   fmt.Println(animals9)\n   fmt.Println(count)\n\n   //Scan, 原生查询\n   var animals10 []Animal\n   db.Raw(\"SELECT id, name, age From Animals WHERE name = ? AND age = ? \", \"galeone\", \"30\").Scan(&animals10)\n   fmt.Println(\"Scan: \", animals10)\n\n   //原生查询，select all\n   var animals11 []Animal\n   rows, _ := db.Raw(\"SELECT id,name FROM Animals\").Rows()\n   //注意：上面的 select id,name 后面不能写成 * 代替，不然出来的结果都是默认0值\n   //像这样结果： ALL:  [{0  0} {0  0} {0  0} {0  0} {0  0} {0  0} {0  0}]\n   //Scan 后面是什么字段，select 后面就紧跟什么字段\n   for rows.Next() {\n      var result Animal\n      rows.Scan(&result.ID, &result.Name)\n      animals11 = append(animals11, result)\n   }\n   fmt.Println(\"ALL: \", animals11)\n   //output:ALL:  [{1 demo-test 0} {2 galeone 0} {3 demotest2 0} {4 galeone 0} {5 galeone 0} {6 jim 0} {7 jimmy 0}]\n\n   //select 查询\n   var animal12 Animal\n   db.Select(\"name,age\").Find(&animal12) //只查询name，age字段，相当于select name,age from user\n   fmt.Println(\"select: \", animal12)\n//map 结构\n    animals13:=map[int64]Animal{}\n   var animals14 []Animal\n   db.Raw(\"SELECT id, name, age From Animals WHERE id>5\").Find(&animals14)\n   for _,v:= range  animals14{\n      animals13[v.ID]=v\n   }\n   fmt.Println(animals13)\n   return nil\n}\n\nfunc update_test(db *gorm.DB)(err error){\n   //根据条件更新字段值,\n   //后面加Debug()，运行时，可以打印出sql\n   err=db.Debug().Model(&Animal{}).Where(\"id = ? \", 5).Update(\"name\", \"jimupdate\").Error\n   if err!=nil{\n      return err\n   }\n   //UPDATE `animals` SET `name` = \'jimupdate\'  WHERE (id = 4)\n\n   //另外一种写法： 根据条件更新\n   var animal Animal\n   animal = Animal{ID: 3}\n   err=db.Debug().Model(animal).Update(\"name\", \"demotest2update\").Error\n   if err!=nil{\n      return err\n   }\n   // db.Debug().Model(&animal).Update(\"name\", \"demotest2update\") // 这种写法也可以\n   //UPDATE `animals` SET `name` = \'demotest2update\'  WHERE `animals`.`id` = 3\n\n   /// 多个条件更新\n   err=db.Model(&Animal{}).Where(\"id = ? AND age = ?\", 4, 90).Update(\"name\", \"jimupdate3\").Error\n   if err!=nil{\n      return err\n   }\n   //UPDATE `animals` SET `name` = \'jimupdate2\'  WHERE (id = 4 AND age = 45)\n\n   /// 更新多个值\n   err=db.Debug().Model(&Animal{}).Where(\"id = ?\", 6).Update(Animal{Name: \"jim\", Age: 90}).Error\n   if err!=nil{\n      return err\n   }\n   // UPDATE `animals` SET `age` = 90, `name` = \'jim\'  WHERE (id = 4)\n\n   animal2 := Animal{ID: 7}\n   err=db.Debug().Model(&animal2).Update(map[string]interface{}{\"name\": \"jimm\", \"age\": 27}).Error\n   //UPDATE `animals` SET `age` = 100, `name` = \'jimm\'  WHERE `animals`.`id` = 5\n   return nil\n}\n\nfunc delet_test(db *gorm.DB)(err error)  {\n   err=db.Debug().Where(\"id = ?\", 7).Delete(&Animal{}).Error\n   if err!=nil{\n      return err\n   }\n   // DELETE FROM `animals`  WHERE (id = 13)\n   err=db.Debug().Delete(&Animal{}, \"id = ? AND age = ?\", 6, 90).Error\n   //DELETE FROM `animals`  WHERE (id = 14 AND age = 10)\n   return err\n}\nfunc trans_test(db *gorm.DB)(wrong error)  {\n   tx:=db.Begin()\n   defer func() {\n      if err:=recover(); err!=nil{\n         tx.Rollback()\n         if val,ok:=err.(error); ok{\n            wrong=val\n         }\n      } else{\n         err:=tx.Commit().Error\n         if err !=nil{\n            tx.Rollback()\n            wrong=err\n         }\n      }\n   }()\n\n   an:= Animal{Name: \"gavin\", Age: 35}\n   err:=tx.Create(&an).Error\n   if err!=nil{\n      panic(err)\n   }\n   err=tx.Exec(\"UPDATE animals SET age=40 WHERE id=1\").Error\n   if err!=nil{\n      panic(err)\n   }\n   trans_test2(tx)\n   return nil\n}\nfunc trans_test2(db *gorm.DB)  {\n   var animals1 Animal\n   //err:=db.Set(\"gorm:query_option\", \"FOR UPDATE\").Table(\"animals\").Select(\"id, `NAME`,Age\").Where(\"ID=?\",2).Find(&animals1).Error\n   err:=db.Set(\"gorm:query_option\", \"FOR UPDATE\").First(&animals1,2).Error\n   if err!=nil{\n      fmt.Println(err)\n      panic(err)\n   }\n   animals1.Name=animals1.Name +\"_ gavin update\"\n   err=db.Set(\"gorm:query_option\", \"FOR UPDATE\").Table(\"animals\").Where(\"ID=?\",2).Update(&animals1).Error\n   if err!=nil{\n      fmt.Println(err)\n      panic(err)\n   }\n}\n\n```',2,'2021-09-29 11:09:22','2021-09-29 11:48:54','admin',0,0,0,0,14,0,'','2000-01-01 00:00:00',1,0),
	(67,'gofmt工具，用来格式化代码','\n## golang有一个gofmt工具，用来格式化代码，有多种用法。 “大道至简”，我们这里只介绍一种，最实用的命令gofmt -w -l src，src是项目目录。\n\n```\n-l 显示那些需要格式化的文件\n -w 把改写后的内容直接写入到文件中，而不是作为结果打印到标准输出。\n-r 添加形如“a[b:len(a)] -> a[b:]”的重写规则，方便我们做批量替换\n-s 简化文件中的代码\n-d 显示格式化前后的 diff 而不是写入文件，默认是 false\n-e 打印所有的语法错误到标准输出。如果不使用此标记，则只会打印不同行的前 10 个错误。\n-cpuprofile 支持调试模式，写入相应的 cpufile 到指定的文件 \n```',2,'2021-10-08 16:05:16',NULL,'admin',0,0,0,0,4,0,'','2000-01-01 00:00:00',1,0),
	(68,'依赖注入-控制反转','\n\n```\n\n\ninterface Base{\n    public function echo();\n}\n\nclass A implements Base{\n    public function echo(){\n        echo \"A\";\n    }\n}\n\nclass B implements Base{\n    public function echo(){\n        echo \"B\";\n    }\n\n    //该方法依赖A类\n    public function get(){\n        $m = new A(); //如果这里 逻辑特别多 还要new 其他对象的时候 \n\n        $m->echo();\n        echo \"我就想调一下A类的echo (或者该方法依赖A类) 我得在这里面new 以至于代码耦合度高\";\n    }\n}\n\n\nclass C implements Base{\n    public function echo(){\n        echo \"B\";\n    }\n\n    //该方法依赖A类\n    public function get(){\n        $m = new A(); //如果这里 逻辑特别多 还要new 其他对象的时候 \n\n        $m->echo();\n        echo \"我就想调一下A类的echo (或者该方法依赖A类) 我得在这里面new 以至于代码耦合度高\";\n    }\n}\n\n///////////依赖注入//////由外到内控制/////\nclass Y{\n    // 对比B类C类的先进之处就是多了构造类\n    // 现将对应的A B 等等只要实现了Base的类都可以注入进来\n    public function __construct(Base $base) {\n       $this->a = $base;\n    }\n\n    public function get(){\n        $this->a->echo(); //达到效果  在这里写一次就够了\n    }\n}\n\n///////////控制反转/////由内到外控制//// IOC容器控制各对象生命周期\nclass IOC {\n    public $arr = [];\n    public function __construct() {\n        $this->a = new A();\n    }\n\n    public function register($classname) {\n        $arr[$classname] = new $classname;\n    }\n\n    public function get($active){\n        $this->arr[$active]->echo(); //达到效果  在这里写一次就够了\n    }\n}\n\n\n```',2,'2021-10-11 00:03:26',NULL,'admin',0,0,0,0,10,0,'','2000-01-01 00:00:00',1,0),
	(69,'mysql知识点','# mysql 存储引擎数据结构动画效果\n\n\n### 图形化模拟数据结构   [链接地址](https://www.cs.usfca.edu/~galles/visualization/Algorithms.html)\n\n### B-Tree\n- 节点中的数据+索引从左到右递增排列\n- 所有索引元素不重复\n- 叶子节点具有相同的深度,叶子节点的指针为空\n\n### B-Plus-Tree\n- 非叶子节点不存data, 只存索引(冗余),空间用来放更多的索引\n- 叶子节点包含所有索引字段\n- 叶子节点用指针连接,提高区间访问性能\n- 叶子节点情况下 主键索引bigin8B 树末端了后面没有下级，所以省去了6B字节的指针 \n\n\n### mysql 基础常识\n\n- mysql 1 page大小16kb   通过sql语句查看  show GLOBAL STATUS like \"Innodb page size\";     \n如mysql表的主键索引 bigint 占用8B字节   +  6B 字节的指针( 树的下级节点指针)    16KB%14B = 1170 即:1个page页 可以放1170个索引节点\n高度为3的B+树 放满索引，可以放 1170*1170*16 = 2kw个索引\n\n- mysam 存储引擎表 对应三个文件 frm(表结构信息)  MYD(数据文件) MYI (索引文件)   举例: 一条sql 查询 流程 select * from t where col = 50 ;流程1.先去frm文件拿到col字段是否索引字段   2. 如果是 要去MYI文件查询索引节点为30的项.  3.找到后取该节点的下的data数据即磁盘位置指针 4.用磁盘位置去 MYD文件找到对应数据\n\n- innodb  存储引擎表对应二个文件 frm(表结构信息) ibd(数据和索引文件)   举例: 一条sql 查询 流程 select * from t where col = 50 ;流程1.先去frm文件拿到col字段是否索引字段   2. 如果是找到对应叶子节点直接取下data数据   注意点: 非主键索引如md5字符串，每个索引节点都是md5 找到叶子节点的数据data字段后拿到的是主键id 然后再通过主键找到完整的那一整条数据\n\n- 非聚集索引  MYD 与 MYI 文件分开存储, 典型代表有mysam     反之 聚集索引则是 innodb \n\n- 回表  即: mysam 一颗B+树 查到的只是磁盘位置,还要再读一次 MYD文件取数据data      反之 innodb 数据data直接 集成到叶子节点上了\n\n- 主键: innodb 表中如果没有 主键 以及 没有1列是唯一值时， innodb 会自动帮忙维护1列 主键  \n\n- hash 索引 仅仅支持 “=”   “in”  不支持范围 ， 而 b+tree 索引 可以支持 >  <  = in  等等 因为底层叶子节点从左到右 是1个递增双向链表\n\n# mysql 默认隔离级别\n\n###  知识点\n- 市面上各数据库默认事物隔离级别对比     mysql:  repeatable(可重复读)     oracle : read commited(提交后可读)   sql server : read commited(提交后可读)\n\n### 为什么mysql 默认隔离级别为 可重复读 \n- 1.早期为了保证mysql服务主从复制，采用binlog 日志，而binlog有三种格式 (statement:记录的就是sql语句，row:记录的是每行实际数据变更  mixed是statement与row混合)\n- 2.mysql5.0以前binlog只支持statement 格式，该格式 (read comment)提交后可读有bug , 主从不一致; master上执行的顺序是先删后插,而binglog-statment记录的事先插后删\n- 3.解决1. 隔离级别设为可重复读(Repeatable Read),在该隔离级别下引入间隙锁。当事物A 执行delete语句时，会锁住间隙。那么事物B执行插入语句就会阻塞住！\n- 4.解决2. binglog的格式修改为row格式，此时是基于行的复制，自然就不会出现sql执行顺序不一样的问题！奈何这个格式在mysql5.1版本开始才引入。因此由于历史原因，mysql将默认的隔离级别设为可重复读(Repeatable Read)，保证主从复制不出问题！\n- 5. 排出解决方案3  采用读未提交(Read UnCommitted),一个事务读到另一个事务未提交读数据，从逻辑上都说不过去\n- 6. 排出解决方案4 采用串行化(Serializable)，每个次读操作都会加锁，快照读失效，一般是使用mysql自带分布式事务功能时才使用该隔离级别 性能堪忧\n- 7.对比  总结\n```\n对比一\nselect * from test where id <3 for update;\n可重复读(Repeatable Read)，模式下执行该语句， 存在间隙锁，其他事务\"不可以\"插入数据！\n读已提交(Read Commited)模式下执行该语句  不存在间隙锁，其他事务可以插入数据！\n\n对比二\nupdate test set color = \'blue\' where color = \'red\'; \n可重复读(Repeatable Read)，模式下执行该语句，条件列未命中索引会锁表！\n读已提交(Read Commited)模式下执行该语句， 只锁行\n\n总结\n推荐采用 读已提交(Read Commited)隔离级别，并且设置主从复制用binlog为row格式，基于行的复制！Innodb的创始人也是建议binlog使用该格式！\n\n参考 ： https://www.cnblogs.com/shoshana-kong/p/10516404.html\n```\n\n\n#### select......for update会加锁 ，会加锁 会加锁  查询条件用了索引/主键\n\n\n',2,'2021-11-16 20:57:27','2021-12-31 22:43:57','admin',1,1,0,0,20,0,'','2000-01-01 00:00:00',1,0),
	(70,'golang','\n\n\n```\ngolang\n\n\n\n群里已经有的个人项目：\nhttps://github.com/SuperDraven/go-blog\nhttps://github.com/gensword/collections\nhttps://github.com/xusenlin/ForestBlog\nhttps://github.com/xusenlin/MareWood\nhttps://github.com/overtalk/shm\n\nhttps://github.com/xusenlin/hzzm(https://hz.xusenlin.com/)\n\nhttps://github.com/roseduan/rosedb\n\n比较好的一个数据结构和算法资源：\nhttps://github.com/wangzheng0822/algo\n\n\nGo开发规范：https://github.com/uber-go/guide/blob/master/style.md\n\n\n\n\n\n##gmp模型\ng表示goroutine \nm表示pthread\np表示n个队列 里面存放即将执行的协程\n\n当线程执行协程时 先从p队列获取 没有则将公共队列的协程转移到p\n(一般go运行时有 runtime.GOMAXPROCS 个p队列 即 4核CPU就是4个队列 每个队列最多放256个g 满了放公共队列，p队列空了去公共队列转移到p，m是按需自动创建)\n\n\n##关于锁\nsync mutex 是一个接口其中只有\nunlock \nlock\n任何时间点只允许1个goroutine在临界区运行\n避免死锁\n公平\n\n0值是未锁\nunlock未加锁的mutex会panic (恐慌不用recove会直接退出进程)\n加锁的mutex不和这个特定的goroutine关联\n非重入锁 (重复执行lock导致死锁)\n\n总结：\ngolang中的锁是通过CAS原子操作实现的，Mutex结构如下：\ntype Mutex struct {\nstate int32 \nsema uint32\n}\n\ngolang用的是信号量，挂起阻塞\nnginx用的是自旋锁\ntypedef struct __lock_t {\nint flag; //锁的状态 0-空闲， 1-被占用\n}lock_t; \n\nvoid init(lock_t *mutex) { //初始化锁对象\nmutex->flag = 0;\n}\n\nvoid lock(lock_t *mutex) {\nwhile(mutex->flag == 1)\n;// 自旋等待\nmutex->flag = 1;\n}\n\nvoid unlock(lock_t *mutex) {\nmutex->flag = 0;\n}\n\n##channl底层\ntype hchan struct {\nqcount uint // total data in the queue\ndataqsiz uint // size of the circular queue\nbuf unsafe.Pointer // points to an array of dataqsiz elements\nelemsize uint16\nclosed uint32\nelemtype *_type // element type\nsendx uint // send index\nrecvx uint // receive index\nrecvq waitq // list of recv waiters\nsendq waitq // list of send waiters\n\n// lock protects all fields in hchan, as well as several\n// fields in sudogs blocked on this channel.\n//\n// Do not change another G&apos;s status while holding this lock\n// (in particular, do not ready a G), as this can deadlock\n// with stack shrinking.\nlock mutex\n}\n总结：channel就是一个结构体，里面带缓冲带锁 (而且还是mutex) \n\nA. 给一个 nil channel 发送数据，造成永远阻塞\nB. 从一个 nil channel 接收数据，造成永远阻塞\nC. 给一个已经关闭的 channel 发送数据，引起 panic 重点\nD. 从一个已经关闭的 channel 接收数据，如果缓冲区中为空，则返回一个零值\nE.无缓冲的channel是同步的，而有缓冲的channel是非同步的；\n\n\nA. select机制用来处理异步IO问题；\nB. select机制最大的一条限制就是每个case语句里必须是一个IO操作；\nC. golang在语言级别支持select关键字；\n\n\n##切片比map(底层红黑树)性能好\n1.map 需要初始化才能使用；\n2.指针不支持索引。\ntype Param map[string]interface{}\ntype Show struct {\n*Param\n}\nfunc main() {\ns := new(Show)\np := make(Param)\np[&quot;day&quot;] = 2\ns.Param = &p\ntmp := *s.Param\nfmt.Println(tmp[&quot;day&quot;])\n}\n\n\n\n\ntime.newTimer 到时间只触发1次\ntime.newTicker 不断触发 \n\n\n关于range\nrange返回的是拷贝值！ 不是引用\nv := []int{1, 2, 3}\nfor i := range v {\nv = append(v, i)\n}\n1.循环次数在循环开始前就已经确定，循环内改变切片的长度，不影响循环次数。\n2.append后len>cap 会分新空间再将原切片内容拷过去。 (len<1024时cap两倍增加否则cap呈25%趋势增加)\n\n关于结构体\n1.结构体只能比较是否相等，但是不能比较大小。\n2.相同类型的结构体才能够进行比较\n3.如果类型实现 String() 方法，当格式化输出时会自动使用 String() 方法。String() 方法内使用格式化输出，会导致递归调用，最后抛错。\n4.不能使用短变量&quot;声明&quot;去设置结构体字段值。\ndata.result, err := work() \ndata.result, err = work()\n\n\n\n\n\n\n\n关于字符串\n1. rune 是 int32 的别名一样，byte 是 uint8 的别名，别名类型无序转换，可直接转换\n\n2. 连接strings.Join()、buffer.WriteString()等。\n\n\n3. nil 只能赋值给指针、chan、func、interface、map 或 slice 类型的变量。\n\nerror是内建类型\ntype error interface {\nError() string\n}\n\n类型选择的语法形如：i.(type)，其中 i 是接口，type 是固定关键字。\n注意：只有接口类型才可以进行类型选择。其他类型，例如 int、string等是不能的：\ntype A interface {\nShowA() int\n}\ntype B interface {\nShowB() int\n}\ntype Work struct {\ni int\n}\nfunc (w Work) ShowA() int {\nreturn w.i + 10\n}\nfunc (w Work) ShowB() int {\nreturn w.i + 20\n}\n\nfunc main() {\nvar a A = Work{3} //注意值类型实现的方法\ns := a.(Work)\nfmt.Println(s.ShowA())\nfmt.Println(s.ShowB())\n}\n\n\n形如 [i,j,k]，第三个参数 k 用来限制新切片的容量，但不能超过原数组（切片）的底层数组大小。截取获得的切片的长度和容量分别是：j-i、k-i。\n\n永远不要使用一个指针指向一个接口类型，因为它已经是一个指针。\n\n当且仅当动态值和动态类型都为 nil 时，接口类型值才为 nil\n\n按照Go语言规范，任何类型在未初始化时都对应一个零值：布尔类型是false，整型是0，字符串是&quot;&quot;，而指针，函数，interface，slice，channel和map的零值都是nil。\n\n\n函数返回值类型。nil 可以用作 interface、function、pointer、map、slice 和 channel 的“空值”。如果直接return nil，Go 语言不能识别类型，所以会报错\n\n\n如果类型定义了 String() 方法，当使用 fmt.Printf()、fmt.Print() 和 fmt.Println() 会自动使用 String() 方法，实现字符串的打印\n\n\n\n关于切片\n1.切片是不能比较的；\n\n2.字面量初始化切片时候，可以指定索引，没有指定索引的元素会在前一个索引基础之上加一。\nvar x = []int{2: 2, 3, 0: 1}\nfmt.Println(x) //[1 0 2 3]\n\n\ni++ 和 i-- 在 Go 语言中是语句，不是表达式，因此不能赋值给另外的变量。此外没有 ++i 和 --i。\n\n常量不同于变量的在运行期分配内存，常量通常会被编译器在预处理阶段直接展开，作为指令数据使用，所以常量无法寻址。\n\n\n\n\n\n\n```',2,'2021-12-31 22:40:38',NULL,'admin',0,0,0,0,2,0,'','2000-01-01 00:00:00',1,0),
	(71,'路上追尾   被撞   发生交通事故等 处理流程','# 汽车发生交通事故的处理流程如下：\n- 1、保护现场，不要挪动车辆和受伤人员；\n-  2、初步判断现场责任；\n-  3、打122交警电话进行报警；\n-  4、全责方致电自己的保险公司出险；\n-  5、双方协调是否需要快速理赔；\n-  6、如果警察出警，留好事故责任认定书；\n- 7、如果协商赔偿或快速理赔，一定要对方留下押金，现金最好，驾驶证副本互换也可；\n-  8、保证自己手续齐全的情况下，尽量不要私了\n-  9、弄不清事故造成的经济损失时，致电购车的4s店，询问工作人员。\n',2,'2021-12-31 22:46:07',NULL,'admin',0,0,0,0,1,0,'','2000-01-01 00:00:00',1,0),
	(72,'问牙医  一个科普牙科知识的网站',' \n问牙医 \nhttps://askthedentist.com/\n一个科普牙科知识的网站\n\n一个在线文献库 \nhttps://onlinelibrary.wiley.com/\nWiley是指1807年创立于美国的一个数据库， 是全球历史最悠久﹑最知名的学术出版商之一，享有世界第一大独立的学术图书出版商和第三大学术期刊出版商的美誉。\n',2,'2021-12-31 22:58:09',NULL,'admin',0,0,0,0,1,0,'','2000-01-01 00:00:00',1,0),
	(73,'查看进程，按内存从大到小','```\n查看进程，按内存从大到小 \n[root@iZwz9 src]# ps -e -o \"%C : %p : %z : %a\"|sort -k5 -nr\n\n\n查看进程，按CPU利用率从大到小排序\n [root@iZwz9 src]#ps -e -o \"%C : %p : %z : %a\"|sort -nr查看剩余内存 [root@iZwz9 src]#free -m |grep \"Mem\" | awk \"{print $2}\"\n\n\n\n\n\n\n\n\nkeep-alive分 tcp 和 http 两种 \n\n\n系统级别:\necho 1800 > /proc/sys/net/ipv4/tcp_keepalive_time echo 15 > /proc/sys/net/ipv4/tcp_keepalive_intvl echo 5 > /proc/sys/net/ipv4/tcp_keepalive_probes 以上shell命令表示: keepalive是TCP保鲜定时器，当网络两端建立了TCP连接之后，持续1800秒没有数据流发送往来，此时server主动向client发送侦测包,每隔15秒1次,共5次； 直到收到对方的ack；\n\n\n\nnginx 即可以设置tcp层的keepalive 又可以设置http层的keepalive\n如:\n\n\nlisten 80 default so_keepalive=3s:5s:8;  \n表示连接成功后,持续3秒任然没有数据流往来，server主动向client发送侦测包，每隔5秒1次,共8次\n\n\n\nkeepalive_timeout 75s 300s; server发送响应结果后 再维持连接75s才断开连接 keepalive_requests 8192; 一次连接最多只能请求8129次； \n\n\n\n\n\n centos 6.5 下载地址 \nhttps://archive.kernel.org/centos-vault/6.5/isos/x86_64/\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nopenSSH升级\n###########centos6.5 openssh 升级\nhttp://blog.csdn.net/levy_cui/article/details/53100315\nhttp://blog.csdn.net/songzhusheren/article/details/53167008\n\n前提：\nyum install zlib-devel\nyum install openssl-devel\nyum -y install pam-devel\n\ncp -R /etc/ssh /etc/ssh_bak \n或者\nmv /etc/ssh /etc/ssh2 \n\ncp /root/openssh-7.6p1/contrib/redhat/sshd.init /etc/init.d/sshd\ncp /usr/bin/ssh /usr/bin/ssh-backup\ncp /usr/sbin/sshd /usr/sbin/sshd-backup\n\n\nhttp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/\n\ntar -zxvf openssh-7.6p1.tar.gz \ncd openssh-7.6p1\n./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pam --with-zlib --with-md5-passwords --with-tcp-wrappers\nmake && make install \n/etc/init.d/sshd restart\n或者\nsystemctl restart sshd.service\nsystemctl list-unit-files|grep sshd.service\n防止登录不上\nyum install telnet-server\n\nvi /etc/xinetd.d/telnet\nservice telnet\n{\nflags = REUSE\nsocket_type = stream\nwait = no\nuser = root\nserver = /usr/sbin/in.telnetd\nlog_on_failure += USERID\ndisable = no\n}\n\n默认不允许root登录\n\nvi /etc/securetty\n增加\npts/0\npts/1\npts/2\n如果登录用户较多，需要更多的pts/*\n\n/etc/init.d/xinetd restart\n这样root可以telnet登录了\n\nssh升级后建议再修改回还原设置\n\n\n\n\nyum remove telnet-server\n\n\n```',2,'2021-12-31 22:59:31','2021-12-31 23:03:23','admin',0,0,0,0,4,0,'','2000-01-01 00:00:00',1,0),
	(74,'问题.肉眼看到的图形是如何对应十六进制的','```\n问题.肉眼看到的图形是如何对应十六进制的\n在fiddler中 点击左侧的链接，点击右侧inspectors->textview->hexview，可以看到16进制, 这个怎么对应识别\n如.选中对应乱码右侧会跟随选中， 比如选中 0 对应十六进制 30 其中这个30到底怎么来\n\n回答.\n首先与乱码对应的是128位 ASCII码 (注意它有33个不可打印字符(如控制字符回车,换行等) + 95个可打印字符)\n图形数字0在ASCII码中对应的 十进制位置是48 十六进制则是30 (30则与之对应)\n图形大写M在ASCII码中对应的 十进制位置是77 十六进制则是4D\n\n\n\n\n```',2,'2021-12-31 23:12:48',NULL,'admin',0,0,0,0,1,0,'','2000-01-01 00:00:00',1,0),
	(75,'前端面试题','```\n\n\n前端面试题:\n1.cookie session 区别,优缺点？\n\n2.解释下盒子模型？\n\n3.标签选择器有哪些？\n\n4.call 和 apply 的作用与区别？\n\n5.url参数乱码问题如何解决？\n\n6.下面代码输出什么？\nfunction A() {\n    getName = function () { \n        console.log(&apos;1&apos;);\n    };\n    return this;\n};\nA.getName = function () {\n    console.log(&apos;2&apos;);\n};\nA.prototype.getName = function () { \n    console.log(&apos;3&apos;);\n};\nvar getName = function () {\n    console.log(&apos;4&apos;);\n};\nfunction getName() { \n    console.log(&apos;5&apos;);\n};\nA.getName(); \ngetName(); \nA().getName(); \ngetName(); \nnew A.getName(); \nnew A().getName();\n\n\n```',2,'2021-12-31 23:17:10',NULL,'admin',0,0,0,0,1,0,'','2000-01-01 00:00:00',1,0),
	(76,'科目1、 4','```\n假一 吊二 撤三 醉五 逃终生。\n\n申请换证，驾驶证有效期满&quot;前&quot;90日内申请换证\n\n驾驶人信息变化，30日内申请换证\n\n居住地车管所申请换证\n\n有罚款未缴纳，计分转入下个周期\n\n低于80mg/100ml饮酒驾驶 高于醉酒驾驶\n\n记12分，驾驶与准驾车型不符的有酒后驾车，逃逸，营运车辆超出核定人数20%，号牌不合规定的，伪造的驾驶证，高速路倒车、逆行的\n\n记6分，驾驶证被扣期间驾驶的，违反交通信号灯的，营运车辆超出核定人数不到20%的，，高速停车的或占用应急车道的，不避让校车的\n\n机动车在铁道口、窄路、窄桥 陡坡、转弯、掉头最高速度不得超过30公里，拖拉机，电瓶车不超过15公里\n\n高速路的车速 最低60 最高不超过120\n高速同方向两车道，最左侧最低100 \n高速同方向三车道，最左侧最低110，中间最低90 最右侧最低60\n90-110的速度 不可以在最左侧 会妨碍后方车辆，但是可以在慢车道\n\n城市无中心线30、有线50；\n公路无中心线40、有线70。\n\n能见度200、距离100、车速60；\n能见度100、距离50、车速40；\n能见度50、驶离高速公路。\n\n(遇有雾、雨、雪、沙尘、冰雹等低能见度气象条件下，能见度在100米以下时，车速不得超过 40/h 车距50)\n\n货车在高速上 最高100公里/小时\n\n中型客车 核载19人\n\n横着停放的公交车图标 会有个边框围着，如果边框是虚线 则为公交车，实线 则为大客车\n\n狭窄的坡路会车时，下坡让上坡。理由是上坡阻力大,停车让行后，起步容易溜车\n\n&quot;口五站三&quot;不能停车，即：xx路口，弯道，坡道，隧道，窄桥 50米内不能停车,车站，加油站30米内不能停车\n\n\n\n\n\n\n\n\n\n\n```',2,'2021-12-31 23:19:59',NULL,'admin',0,0,0,0,1,0,'','2000-01-01 00:00:00',1,0);

/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `city` varchar(11) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `sign` varchar(255) NOT NULL DEFAULT '',
  `github` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `email_public` int(11) NOT NULL DEFAULT '0' COMMENT '1公开，0私密',
  `is_admin` int(11) DEFAULT '0' COMMENT '1管理员，0普通用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `avatar`, `create_time`, `city`, `website`, `company`, `sign`, `github`, `email`, `email_public`, `is_admin`)
VALUES
	(1,'sumory','2d39682dbb53e8b7df86581b0e48a5f8a4f2815617360c4d9607945b5cdde4c5','2.png','2016-01-01 00:08:00','北京','http://sumory.com','here.cn','这就是一条签名','sumory','sumory.wu@gmail.com',1,1),
	(2,'admin','0d74e43cb3e67a56099eb855f0130bf07edf2b7378f4a4fbad69790a5c92ea98','a.png','2016-02-19 19:08:00','北京','http://kefu2.youuue.com/','无','nothing at all.','','poembro@126.com',0,1),
	(6,'jerry','2d39682dbb53e8b7df86581b0e48a5f8a4f2815617360c4d9607945b5cdde4c5','3.png','2016-01-23 00:01:19','','','','','','',0,0),
	(7,'momo','2d39682dbb53e8b7df86581b0e48a5f8a4f2815617360c4d9607945b5cdde4c5','7.png','2016-02-23 00:01:40','','','','','','',0,0),
	(8,'test','2d39682dbb53e8b7df86581b0e48a5f8a4f2815617360c4d9607945b5cdde4c5','t.png','2021-09-20 00:23:56','武汉','','武汉新城','五','','',0,0);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
