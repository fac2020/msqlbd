CREATE TABLE IF NOT EXISTS `wrk_bizrule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGENCYID` int(11) NOT NULL COMMENT 'агентство',
  `IDEVENT` int(11) NOT NULL COMMENT 'тип события',
  `PERSONTYPEID` int(11) NOT NULL COMMENT 'тип субъекта',
  `AGENTID` int(11) NOT NULL COMMENT 'id агента, если не задан тип',
  `EVENTPARAMS` varchar(50) NOT NULL COMMENT 'отслуживаемые параметры события (если есть)',
  `ACTIONTYPEID` int(11) NOT NULL COMMENT 'id типа действия',
  `ACTIONTEMPLATE` text NOT NULL COMMENT 'шаблон для действя (назв. для задачи, текст для сообщения)',
  `ACTIONPARAMS` varchar(200) NOT NULL COMMENT 'параметры действия (даты для задачи)',
  `ISWRK` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 - отключено, 1 - работает',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;