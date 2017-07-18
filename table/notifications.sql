DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `ID` int(11) NOT NULL,
  `IDEVENT` varchar(36) NOT NULL COMMENT 'ID события',
  `AGENTID` int(11) NOT NULL COMMENT 'ID агента для оповещения',
  `MESSAGE` text NOT NULL,
  `ISREAD` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - не прочитано, 1 - прочитано'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;