-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 19 2017 г., 08:59
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
-- Структура таблицы `sp_role`
--
-- Создание: Сен 19 2017 г., 05:58
-- Последнее обновление: Сен 19 2017 г., 05:58
--

DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `ID` int(11) NOT NULL COMMENT 'UID',
  `NAME` varchar(50) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='роли пользователей в системе';

--
-- Очистить таблицу перед добавлением данных `sp_role`
--

TRUNCATE TABLE `sp_role`;
--
-- Дамп данных таблицы `sp_role`
--

INSERT INTO `sp_role` (`ID`, `NAME`) VALUES
(-1, 'administrator'),
(0, 'user'),
(1, 'agency'),
(2, 'agent'),
(3, 'agent_seller'),
(4, 'director'),
(5, 'dispetcher');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_role`
--
ALTER TABLE `sp_role`
  ADD PRIMARY KEY (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
