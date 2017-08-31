ALTER TABLE `wrk_agencyad` ADD `ADPHONE` VARCHAR(36) NOT NULL COMMENT 'Телефон для рекламы' AFTER `ADSOURCEID`;
INSERT INTO `sp_userprop` (`ID`, `NAME`, `UPCOMMENT`, `UPTYPE`, `DEFSTRING`, `UTYPE`, `PARENTUID`) VALUES ('', 'AGENTADPHONE', 'Подставлять в экспортируемые объявления телефон агента', '0', '0', '1', '');

