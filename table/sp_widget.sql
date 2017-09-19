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
-- Структура таблицы `sp_widget`
--
-- Создание: Сен 19 2017 г., 05:57
-- Последнее обновление: Сен 19 2017 г., 06:22
--

DROP TABLE IF EXISTS `sp_widget`;
CREATE TABLE `sp_widget` (
  `ID` int(11) NOT NULL COMMENT 'UID',
  `NAME` varchar(255) NOT NULL COMMENT 'Наименование',
  `WCOMMENT` varchar(255) NOT NULL COMMENT 'Описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `sp_widget`
--

TRUNCATE TABLE `sp_widget`;
--
-- Дамп данных таблицы `sp_widget`
--

INSERT INTO `sp_widget` (`ID`, `NAME`, `WCOMMENT`) VALUES
(1, 'WINCALL', 'Входящие звонки'),
(2, 'WBATTARY', 'Общая информация по батареям: всего, на осмотр, в работе, потенциал'),
(3, 'WBATTARYSTAGE', 'Этапы батарей'),
(4, 'WPARSER', 'Количество загруженных парсером объектов'),
(5, 'WSHOWING', 'Показы'),
(6, 'WTASKSAUDIT', 'Задачи (аудит)'),
(7, 'WTASKS', 'Задачи'),
(8, 'WZAKAZ', 'Заявки'),
(9, 'WLIMITATIONS', 'Недостатки'),
(10, 'WSHOWINGOWN', 'Показы агента'),
(11, 'WZAKAZOWN', 'Заявки агента'),
(12, 'WLINKSOWN', 'Связки агента');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_widget`
--
ALTER TABLE `sp_widget`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sp_widget`
--
ALTER TABLE `sp_widget`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID', AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
