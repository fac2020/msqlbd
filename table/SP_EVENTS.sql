DROP TABLE IF EXISTS `SP_EVENTS`;
CREATE TABLE `SP_EVENTS` (
  `UID` int(11) NOT NULL COMMENT 'UID',
  `IDPARENT` int(11) DEFAULT NULL COMMENT 'id родителя',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  `TABNAME` varchar(255) DEFAULT NULL COMMENT 'Таблица, содержащая субъект'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица возможных событий' PACK_KEYS=0;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `SP_EVENTS`
--
ALTER TABLE `SP_EVENTS`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `UID` (`UID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `SP_EVENTS`
--
ALTER TABLE `SP_EVENTS`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID';