-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 19 2017 г., 09:39
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
-- Структура таблицы `wrk_userwidget`
--
-- Создание: Сен 19 2017 г., 06:39
--

DROP TABLE IF EXISTS `wrk_userwidget`;
CREATE TABLE `wrk_userwidget` (
  `IDUSER` int(11) NOT NULL COMMENT 'UID пользователя',
  `IDWIDGET` int(11) NOT NULL COMMENT 'UID виджета',
  `ORDERPOS` int(11) NOT NULL COMMENT 'Порядок отображения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Настройки отображения виджетов пользователя';

--
-- Очистить таблицу перед добавлением данных `wrk_userwidget`
--

TRUNCATE TABLE `wrk_userwidget`;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
