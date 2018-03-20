-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 09 2017 г., 12:05
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
-- Структура таблицы `sp_adsubstitution`
--
-- Создание: Окт 09 2017 г., 09:04
--

DROP TABLE IF EXISTS `sp_adsubstitution`;
CREATE TABLE `sp_adsubstitution` (
  `ID` int(11) NOT NULL COMMENT 'ID',
  `FIELDNAME` varchar(255) NOT NULL COMMENT 'Поле для подстановки',
  `SOURCESTRING` varchar(255) NOT NULL COMMENT 'Исходное значение',
  `RESULTSTRING` varchar(255) NOT NULL COMMENT 'Результат подстановки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_adsubstitution`
--
ALTER TABLE `sp_adsubstitution`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sp_ads_field_idx` (`FIELDNAME`) USING BTREE,
  ADD KEY `sp_ads_source_idx` (`SOURCESTRING`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sp_adsubstitution`
--
ALTER TABLE `sp_adsubstitution`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
