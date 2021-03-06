CREATE TABLE `ssc_neight` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `expect` char(13) NOT NULL,
  `count` int(6) NOT NULL,
  `bet` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `danma` VARCHAR(10) NOT NULL,
  `mahe` VARCHAR(10) NOT NULL,
  `bai` VARCHAR(100) NOT NULL,
  `shi` VARCHAR(100) NOT NULL,
  `ge` VARCHAR(100) NOT NULL,
  `opencode` VARCHAR(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`expect`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

ALTER TABLE `ssc` ADD COLUMN `ymd` CHAR(8) NOT NULL DEFAULT '';

CREATE TABLE `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `phone` char(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` VARCHAR (128) NOT NULL DEFAULT '' COMMENT '头像',
  `nickname` VARCHAR (60)  NULL DEFAULT '普通用户' COMMENT '昵称',
  `passwd` VARCHAR (256) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


CREATE TABLE `post` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` char(20) NOT NULL DEFAULT '' COMMENT '用户id',
  `content` VARCHAR (2048) NOT NULL DEFAULT '' COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:货找车 1:车找货',
  `status` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


