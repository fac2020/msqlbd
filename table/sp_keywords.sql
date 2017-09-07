-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 06 2017 г., 12:19
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
-- Структура таблицы `sp_keywords`
--
-- Создание: Сен 06 2017 г., 08:57
-- Последнее обновление: Сен 06 2017 г., 09:16
--

DROP TABLE IF EXISTS `sp_keywords`;
CREATE TABLE `sp_keywords` (
  `ID` int(11) NOT NULL COMMENT 'UID',
  `NAME` varchar(255) NOT NULL COMMENT 'Ключевое слово',
  `DESCRIPT` varchar(255) NOT NULL COMMENT 'Описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ключевые слова для шаблонов сообщений и задач';

--
-- Очистить таблицу перед добавлением данных `sp_keywords`
--

TRUNCATE TABLE `sp_keywords`;
--
-- Дамп данных таблицы `sp_keywords`
--

INSERT INTO `sp_keywords` (`ID`, `NAME`, `DESCRIPT`) VALUES
(1, '#IDOBJECT', 'HTML ссылка на объект события'),
(2, '#OBJECTNAME', 'Имя объекта события'),
(3, '#IDAGENT', 'Ссылка на ответственного по событию'),
(4, '#AGENTNAME', 'Имя ответственного по событию'),
(5, '#IDAUDIT', 'Ссылка на аудитора по событию'),
(6, '#AUDITNAME', 'Имя ответственного по событию'),
(7, '#IDCLIENT', 'Ссылка на клиента по событию'),
(8, '#CLIENTNAME', 'Имя клиента по событию'),
(9, '#IDAGENT2', 'Ссылка на ответственного по связанной заявке'),
(10, '#AGEN2TNAME', 'Имя ответственного по связанной заявке'),
(11, '#IDAUDIT2', 'Ссылка на аудитора по связанной заявке'),
(12, '#AUDIT2NAME', 'Имя на аудитора по связанной заявке'),
(13, '#IDSEMP', 'Ссылка на сотрудника, указанного в правиле'),
(14, '#SEMPNAME', 'Имя сотрудника, указанного в правиле');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sp_keywords`
--
ALTER TABLE `sp_keywords`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sp_keywords`
--
ALTER TABLE `sp_keywords`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID', AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
