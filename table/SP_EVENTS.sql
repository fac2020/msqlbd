--
-- Структура таблицы `SP_EVENTS`
--
-- Создание: Авг 18 2017 г., 05:08
-- Последнее обновление: Авг 18 2017 г., 05:08
--

DROP TABLE IF EXISTS `SP_EVENTS`;
CREATE TABLE `SP_EVENTS` (
  `UID` int(11) NOT NULL COMMENT 'UID',
  `IDPARENT` int(11) DEFAULT NULL COMMENT 'id родителя',
  `NAME` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  `TABNAME` varchar(255) DEFAULT NULL COMMENT 'Таблица, содержащая субъект',
  `PARAMSFLAG` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Метка необходимости параметра'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица возможных событий' PACK_KEYS=0;

--
-- Очистить таблицу перед добавлением данных `SP_EVENTS`
--

TRUNCATE TABLE `SP_EVENTS`;
--
-- Дамп данных таблицы `SP_EVENTS`
--

INSERT INTO `SP_EVENTS` (`UID`, `IDPARENT`, `NAME`, `TABNAME`, `PARAMSFLAG`) VALUES
(1, 0, 'Задачи', NULL, 0),
(2, 1, 'Задача поставлена', 'task', 0),
(3, 1, 'Задача завершена', 'task', 0),
(4, 1, 'Задача просрочена', 'task', 0),
(5, 1, 'Задача завершена исполнителем', 'task', 0),
(6, 1, 'Задача принята аудитором', 'task', 0),
(7, 1, 'Задача отклонена аудитором', 'task', 0),
(8, 0, 'Показы', NULL, 0),
(9, 8, 'Показ создан', 'pokaz', 0),
(10, 8, 'Показ состоялся', 'pokaz', 0),
(11, 8, 'Показ не состоялся', 'pokaz', 0),
(12, 0, 'Заявка на продажу', NULL, 0),
(13, 12, 'Заявка создана', 'wrk_zakazpr', 0),
(14, 12, 'Заявка распределена на агента', 'wrk_zakazpr', 0),
(15, 12, 'Заявка перераспределена на другого агента', 'wrk_zakazpr', 0),
(16, 12, 'Изменена цена заявки', 'wrk_zakazpr', 0),
(17, 12, 'Заявка удалена', 'wrk_zakazpr', 0),
(18, 12, 'Изменен статус заявки', 'prlog', 1),
(19, 0, 'Заявка на покупку', NULL, 0),
(20, 19, 'Заявка создана', 'wrk_zakazpk', 0),
(21, 19, 'Заявка распределена на агента', 'wrk_zakazpk', 0),
(22, 19, 'Заявка перераспределена на другого агента', 'wrk_zakazpk', 0),
(23, 19, 'Изменены параметры заявки', 'wrk_zakazpk', 0),
(24, 19, 'Заявка удалена', 'wrk_zakazpk', 0),
(25, 19, 'Изменен статус заявки', 'prlog', 1),
(26, 0, 'Сотрудники', NULL, 0),
(27, 26, 'Сотрудник создан', 'sp_agent', 0),
(28, 26, 'Изменен родитель сотрудника', 'sp_agent', 0),
(29, 26, 'Изменена роль сотрудника', 'sp_agent', 0),
(30, 26, 'Сотрудник уволен', 'sp_agent', 0),
(31, 12, 'Добавлен клиент', 'wrk_zakazpr', 0),
(32, 0, 'Связки', NULL, 0),
(33, 32, 'Создана связка', 'wrk_prpk', 0),
(34, 32, 'Смена статуса связки владельцем', 'wrk_prpk', 0),
(35, 32, 'Смена статуса связки', 'wrk_prpk', 0),
(36, 32, 'Связка удалена', 'wrk_prpk', 0),
(37, 19, 'Добавлен клиент', 'wrk_zakazpk', 0),
(38, 0, 'Ипотека', NULL, 0),
(39, 38, 'Отправлен запрос на ипотеку', 'wrk_ipotekarequest', 0);

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
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID', AUTO_INCREMENT=40;
