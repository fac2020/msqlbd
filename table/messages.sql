DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `ID` int(20) NOT NULL,
  `IDFROM` int(11) NOT NULL,
  `IDTO` int(11) NOT NULL,
  `BODY` text NOT NULL,
  `MESTIME` datetime NOT NULL,
  `ISREAD` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDTOINDEX` (`IDTO`),
  ADD KEY `IDFROMINDEX` (`IDFROM`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT;
