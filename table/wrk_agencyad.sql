--
-- Структура таблицы `wrk_agencyad`
--
-- Создание: Авг 18 2017 г., 06:41
--

DROP TABLE IF EXISTS `wrk_agencyad`;
CREATE TABLE `wrk_agencyad` (
  `AGENCYID` int(11) NOT NULL COMMENT 'ID агентства',
  `ZAKAZID` int(11) NOT NULL COMMENT 'ID заявки',
  `ZAKAZTYPE` int(11) NOT NULL COMMENT '0-Пк, 1-Пр, 2-Сн, 3 -Сд',
  `CREATESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата добавления в рекламу',
  `ADSTATE` tinyint(4) NOT NULL COMMENT 'Состояние (0-не активно, 1- активно)',
  `CHANGESYAMP` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата изменения состояния',
  `CHANGEUSER` int(11) NOT NULL COMMENT 'Кто изменил состояние',
  `ADSOURCEID` tinyint(4) NOT NULL COMMENT 'Ресурс для рекламы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Индексы таблицы `wrk_agencyad`
--
ALTER TABLE `wrk_agencyad`
  ADD PRIMARY KEY (`AGENCYID`,`ZAKAZID`);
