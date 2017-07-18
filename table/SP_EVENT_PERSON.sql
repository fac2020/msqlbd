
DROP TABLE IF EXISTS `SP_EVENT_PERSON`;
CREATE TABLE `SP_EVENT_PERSON` (
  `UID` int(11) NOT NULL COMMENT 'UID',
  `IDEVENT` int(11) DEFAULT NULL COMMENT 'ID события',
  `IDPERSONTYPE` tinyint(4) DEFAULT NULL COMMENT 'ID типа субъекта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица типов субъектов, необходимых для события' PACK_KEYS=0;

INSERT INTO `SP_EVENT_PERSON` (`UID`, `IDEVENT`, `IDPERSONTYPE`) VALUES
(1, 15, 1),
(2, 15, 2),
(4, 15, 3),
(5, 22, 1),
(6, 22, 2),
(7, 22, 3),
(8, 13, 1),
(9, 13, 2),
(10, 20, 1),
(11, 20, 2),
(12, 17, 1),
(13, 17, 2),
(14, 17, 3),
(15, 24, 1),
(16, 24, 2),
(17, 24, 3);
