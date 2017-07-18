CREATE TABLE IF NOT EXISTS `sp_bizaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL COMMENT 'тип действия',
  `REQPARAMS` varchar(200) NOT NULL COMMENT 'обязательные параметры. имя:тип',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
