--
-- Структура таблицы `wrk_zakazsd`
--
-- Создание: Авг 01 2017 г., 05:51
--

DROP TABLE IF EXISTS `wrk_zakazsd`;
CREATE TABLE `wrk_zakazsd` (
  `ID` bigint(20) NOT NULL COMMENT 'ID',
  `FIRMID` int(11) NOT NULL COMMENT 'ID Фирмы',
  `AGENTID` int(11) NOT NULL COMMENT 'ID Агента',
  `CENA` int(11) NOT NULL COMMENT 'Цена, тыс. руб',
  `TYPEOBJ` tinyint(4) NOT NULL COMMENT 'ID Типа объекта',
  `SUBTYPEOBJ` tinyint(4) NOT NULL,
  `ROOMS` tinyint(4) NOT NULL COMMENT 'Комнат реализуется',
  `OFROOM` tinyint(4) NOT NULL COMMENT 'Общее количество комнат',
  `S_LAND` double(15,1) NOT NULL COMMENT 'Площадь участка',
  `S_LIVING` double(15,1) NOT NULL COMMENT 'Жилая площадь',
  `S_KIT` double(15,1) NOT NULL COMMENT 'Площадь кухни',
  `S_SUM` double(15,1) NOT NULL COMMENT 'Общая площадь',
  `FLOOR` tinyint(4) NOT NULL COMMENT 'Этаж',
  `FLOORS` tinyint(4) NOT NULL COMMENT 'Этажность',
  `AdministrativeArea` int(11) NOT NULL,
  `SubAdministrativeArea` int(11) NOT NULL,
  `Locality` int(11) NOT NULL,
  `DependentLocality` int(11) NOT NULL,
  `District` int(11) NOT NULL,
  `FULLADRESS` varchar(500) NOT NULL COMMENT 'Адрес полностью',
  `BILDING` varchar(20) NOT NULL COMMENT 'Дом',
  `LANDMARK` varchar(255) NOT NULL COMMENT 'Ориентир',
  `COMMENT` varchar(1000) NOT NULL COMMENT 'Описание',
  `HIDDENCOMMENT` varchar(500) NOT NULL COMMENT 'Скрытый комментарий',
  `STATE` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Состояние заявки: -1 - Удалена, 0 - ОС, 1 - в работе',
  `OSDATE` date NOT NULL COMMENT 'Дата отложенного спроса',
  `LATPOSITIONS` decimal(10,7) NOT NULL COMMENT 'Широта для ГИС',
  `LNGPOSITIONS` decimal(10,7) NOT NULL COMMENT 'Долгота для ГИС',
  `WALLMATERIAL` tinyint(4) NOT NULL COMMENT 'Материал стен',
  `ZAKDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата заведения заявки',
  `WEBLINK` varchar(200) NOT NULL COMMENT 'Ссылка на объект в сети',
  `CLIENTID` int(11) NOT NULL COMMENT 'ID клиента по заявке',
  `PRIVATEOBJECT` tinyint(4) NOT NULL COMMENT '0 - обычный объект, 1 - персональный объект агнтства, без контактов, 2 - с контактами',
  `GEOCOORDS` point NOT NULL COMMENT 'Геокоординаты точки',
  `ZALOG` int(11) NOT NULL COMMENT 'Размер залога',
  `SROK` tinyint(4) NOT NULL COMMENT '0-длительный, 1-посуточно, 2-любой'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
