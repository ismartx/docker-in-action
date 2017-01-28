CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `search_key` varchar(100) NOT NULL COMMENT 'key',
  `name` varchar(100) NOT NULL COMMENT '名字',
  `data` varchar(100) NOT NULL COMMENT '数据',
  `status` enum('ON','OFF') DEFAULT 'ON' COMMENT '状态',
  `level` int(11) DEFAULT NULL COMMENT '显示级别',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
