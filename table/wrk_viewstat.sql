-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 03 2017 г., 14:47
-- Версия сервера: 5.7.18-16-beget-5.7.18-16-2-1-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `stastrjn_nrn`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wrk_viewstat`
--
-- Создание: Окт 03 2017 г., 11:47
--

DROP TABLE IF EXISTS `wrk_viewstat`;
CREATE TABLE `wrk_viewstat` (
  `ID` bigint(20) NOT NULL COMMENT 'ID просмотра',
  `IDZAKAZ` bigint(20) NOT NULL COMMENT 'ID заявки',
  `ZAKAZTYPE` tinyint(4) NOT NULL COMMENT 'тип заявки (0,1,2,3)',
  `IDVIEWER` int(11) NOT NULL COMMENT 'ID просматривающего',
  `DATEVIEW` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата просмотра',
  `IPVIEWER` int(11) NOT NULL COMMENT 'IP просматривающего'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wrk_viewstat`
--
ALTER TABLE `wrk_viewstat`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wrk_viewstat`
--
ALTER TABLE `wrk_viewstat`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID просмотра';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
