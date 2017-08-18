--
-- Структура таблицы `sp_eventsparams`
--
-- Создание: Авг 18 2017 г., 05:46
-- Последнее обновление: Авг 18 2017 г., 05:55
--

DROP TABLE IF EXISTS `sp_eventsparams`;
CREATE TABLE `sp_eventsparams` (
  `UID` int(11) NOT NULL COMMENT 'UID',
  `EVENTID` int(11) NOT NULL COMMENT 'ID события',
  `PARAMID` int(11) NOT NULL COMMENT 'ID параметра',
  `TABLENAME` varchar(255) NOT NULL COMMENT 'таблица, хранящая параметр'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `sp_eventsparams`
--

TRUNCATE TABLE `sp_eventsparams`;
--
-- Дамп данных таблицы `sp_eventsparams`
--

INSERT INTO `sp_eventsparams` (`UID`, `EVENTID`, `PARAMID`, `TABLENAME`) VALUES
(1, 18, 1, 'sp_objectstate'),
(2, 18, 2, 'sp_objectstate'),
(3, 18, 3, 'sp_objectstate'),
(4, 18, 4, 'sp_objectstate'),
(5, 18, 5, 'sp_objectstate'),
(6, 18, 6, 'sp_objectstate'),
(7, 18, 7, 'sp_objectstate'),
(8, 18, 8, 'sp_objectstate'),
(9, 18, 9, 'sp_objectstate'),
(10, 18, 10, 'sp_objectstate'),
(11, 18, 11, 'sp_objectstate'),
(12, 18, 12, 'sp_objectstate'),
(13, 18, 13, 'sp_objectstate'),
(14, 18, 14, 'sp_objectstate'),
(15, 18, 15, 'sp_objectstate'),
(16, 18, 16, 'sp_objectstate'),
(17, 18, 17, 'sp_objectstate'),
(18, 18, 18, 'sp_objectstate'),
(19, 18, 19, 'sp_objectstate'),
(20, 18, 20, 'sp_objectstate'),
(21, 18, 21, 'sp_objectstate'),
(22, 18, 22, 'sp_objectstate'),
(23, 18, 23, 'sp_objectstate'),
(24, 18, 25, 'sp_objectstate'),
(25, 18, 26, 'sp_objectstate'),
(26, 18, 27, 'sp_objectstate'),
(27, 18, 28, 'sp_objectstate'),
(28, 18, 30, 'sp_objectstate'),
(29, 18, 31, 'sp_objectstate'),
(30, 18, 32, 'sp_objectstate'),
(31, 18, 33, 'sp_objectstate'),
(32, 18, 34, 'sp_objectstate'),
(33, 18, 35, 'sp_objectstate'),
(34, 25, 29, 'sp_objectstate'),
(35, 25, 36, 'sp_objectstate');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_eventsparams`
--
ALTER TABLE `sp_eventsparams`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sp_eventsparams`
--
ALTER TABLE `sp_eventsparams`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID', AUTO_INCREMENT=67;
