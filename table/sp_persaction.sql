--
-- Структура таблицы `sp_persaction`
--
-- Создание: Авг 18 2017 г., 05:26
-- Последнее обновление: Авг 18 2017 г., 05:28
--

DROP TABLE IF EXISTS `sp_persaction`;
CREATE TABLE `sp_persaction` (
  `PERSONID` tinyint(11) NOT NULL COMMENT 'ID типа персоны',
  `ACTIONID` int(11) NOT NULL COMMENT 'ID допустимого действия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `sp_persaction`
--

TRUNCATE TABLE `sp_persaction`;
--
-- Дамп данных таблицы `sp_persaction`
--

INSERT INTO `sp_persaction` (`PERSONID`, `ACTIONID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(4, 4),
(5, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_persaction`
--
ALTER TABLE `sp_persaction`
  ADD PRIMARY KEY (`PERSONID`,`ACTIONID`),
  ADD KEY `ACTIONID` (`ACTIONID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `sp_persaction`
--
ALTER TABLE `sp_persaction`
  ADD CONSTRAINT `sp_persaction_ibfk_1` FOREIGN KEY (`ACTIONID`) REFERENCES `sp_bizaction` (`ID`),
  ADD CONSTRAINT `sp_persaction_ibfk_2` FOREIGN KEY (`PERSONID`) REFERENCES `SP_PERSON_TYPE` (`UID`);

