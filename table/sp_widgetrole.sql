-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 19 2017 г., 09:37
-- Версия сервера: 5.7.18-16-beget-5.7.18-16-2-1-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `stastrjn_r_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `sp_widgetrole`
--
-- Создание: Сен 19 2017 г., 06:28
-- Последнее обновление: Сен 19 2017 г., 06:36
--

DROP TABLE IF EXISTS `sp_widgetrole`;
CREATE TABLE `sp_widgetrole` (
  `IDROLE` int(11) NOT NULL COMMENT 'ID роли',
  `IDWIDGET` int(11) NOT NULL COMMENT 'ID доступного виджета'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список виджетов, доступных для каждой роли';

--
-- Очистить таблицу перед добавлением данных `sp_widgetrole`
--

TRUNCATE TABLE `sp_widgetrole`;
--
-- Дамп данных таблицы `sp_widgetrole`
--

INSERT INTO `sp_widgetrole` (`IDROLE`, `IDWIDGET`) VALUES
(0, 8),
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 11),
(1, 12),
(2, 7),
(2, 10),
(2, 11),
(2, 12),
(3, 7),
(3, 10),
(3, 11),
(3, 12),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_widgetrole`
--
ALTER TABLE `sp_widgetrole`
  ADD UNIQUE KEY `sp_widgetrole_index` (`IDROLE`,`IDWIDGET`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
