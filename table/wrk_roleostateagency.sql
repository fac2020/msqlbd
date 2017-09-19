-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 19 2017 г., 12:57
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
-- Структура таблицы `wrk_roleostateagency`
--
-- Создание: Сен 19 2017 г., 07:59
-- Последнее обновление: Сен 19 2017 г., 08:36
--

DROP TABLE IF EXISTS `wrk_roleostateagency`;
CREATE TABLE `wrk_roleostateagency` (
  `IDROLE` int(11) NOT NULL COMMENT 'UID роли',
  `IDOSTATE` int(11) NOT NULL COMMENT 'UID стстуса',
  `IDAGENCY` int(11) NOT NULL COMMENT 'UID агентства'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Доступность статусов объектов в зависимости от роли';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wrk_roleostateagency`
--
ALTER TABLE `wrk_roleostateagency`
  ADD PRIMARY KEY (`IDROLE`,`IDOSTATE`,`IDAGENCY`),
  ADD KEY `wrosa_index` (`IDAGENCY`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
