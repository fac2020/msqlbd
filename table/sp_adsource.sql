--
-- Структура таблицы `sp_adsource`
--
-- Создание: Авг 18 2017 г., 06:43
--

DROP TABLE IF EXISTS `sp_adsource`;
CREATE TABLE `sp_adsource` (
  `ID` tinyint(4) NOT NULL COMMENT 'ID',
  `NAME` varchar(255) NOT NULL COMMENT 'Наименование',
  `ADORDER` tinyint(4) NOT NULL COMMENT 'Порядок отображения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `sp_adsource`
--

TRUNCATE TABLE `sp_adsource`;
--
-- Дамп данных таблицы `sp_adsource`
--

INSERT INTO `sp_adsource` (`ID`, `NAME`, `ADORDER`) VALUES
(0, 'МЛС СИТИ', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_adsource`
--
ALTER TABLE `sp_adsource`
  ADD PRIMARY KEY (`ID`);
