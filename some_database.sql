-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 20 2017 г., 15:37
-- Версия сервера: 10.1.25-MariaDB
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `some_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `curency`
--

CREATE TABLE `curency` (
  `cid` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `curency`
--

INSERT INTO `curency` (`cid`, `name`, `description`) VALUES
(1, 'руб', 'Российский рубль'),
(3, 'usd', 'Доллар США');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `prid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `xml_id` int(10) UNSIGNED NOT NULL,
  `prgid` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`prid`, `name`, `description`, `xml_id`, `prgid`, `active`) VALUES
(1, 'тачка строительная', '', 0, 2, 1),
(2, 'бетономешалка', '', 0, 2, 1),
(3, 'кусачки', '', 0, 3, 1),
(4, 'молоток', '', 0, 3, 1),
(5, 'пила циркулярная', '', 0, 4, 1),
(6, 'угловая шлифовальная машина', '', 0, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_group`
--

CREATE TABLE `product_group` (
  `prgid` int(10) UNSIGNED NOT NULL,
  `prgid_parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_group`
--

INSERT INTO `product_group` (`prgid`, `prgid_parent`, `name`, `active`) VALUES
(1, 0, 'Техника', 1),
(2, 1, 'Механическая', 1),
(3, 1, 'Ручная', 1),
(4, 1, 'Электрика', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_group_property_type`
--

CREATE TABLE `product_group_property_type` (
  `prgptid` int(10) UNSIGNED NOT NULL,
  `prgid` int(10) UNSIGNED NOT NULL,
  `ptid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_group_property_type`
--

INSERT INTO `product_group_property_type` (`prgptid`, `prgid`, `ptid`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(7, 3, 2),
(8, 3, 3),
(9, 3, 4),
(10, 3, 5),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `property_type`
--

CREATE TABLE `property_type` (
  `ptid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` tinytext NOT NULL,
  `xml_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `property_type`
--

INSERT INTO `property_type` (`ptid`, `name`, `definition`, `xml_id`, `active`) VALUES
(1, 'цвет', '', 0, 1),
(2, 'длина', '', 0, 1),
(3, 'ширина', '', 0, 1),
(4, 'высота', '', 0, 1),
(5, 'масса', '', 0, 1),
(6, 'напряжение питания', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `property_value`
--

CREATE TABLE `property_value` (
  `pvid` int(10) UNSIGNED NOT NULL,
  `ptid` int(10) UNSIGNED NOT NULL,
  `value` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_filter` varchar(100) NOT NULL,
  `prid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `property_value`
--

INSERT INTO `property_value` (`pvid`, `ptid`, `value`, `active`, `set_filter`, `prid`) VALUES
(1, 1, 'белый', 1, '', 1),
(2, 2, '50', 1, '', 1),
(3, 3, '40', 1, '', 1),
(4, 4, '80', 1, '', 1),
(5, 5, '15', 1, '', 1),
(6, 1, 'красный', 1, '', 2),
(7, 2, '100', 1, '', 2),
(8, 3, '50', 1, '', 2),
(9, 4, '100', 1, '', 2),
(10, 5, '30', 1, '', 2),
(11, 2, '15', 1, '', 3),
(12, 3, '10', 1, '', 3),
(13, 4, '1', 1, '', 3),
(14, 5, '0,2', 1, '', 3),
(15, 2, '25', 1, '', 4),
(16, 3, '10', 1, '', 4),
(17, 4, '2', 1, '', 4),
(18, 5, '0,3', 1, '', 4),
(19, 1, 'красный', 1, '', 5),
(20, 2, '30', 1, '', 5),
(21, 3, '30', 1, '', 5),
(22, 4, '30', 1, '', 5),
(23, 5, '3', 1, '', 5),
(24, 6, '220', 1, '', 5),
(25, 1, 'желтый', 1, '', 6),
(26, 2, '30', 1, '', 6),
(27, 3, '15', 1, '', 6),
(28, 4, '15', 1, '', 6),
(29, 5, '2', 1, '', 6),
(30, 6, '220', 1, '', 6);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `property_value_with_currency`
-- (See below for the actual view)
--
CREATE TABLE `property_value_with_currency` (
`name` varchar(100)
,`value` varchar(100)
,`prid` int(11) unsigned
);

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE `stock` (
  `sid` int(10) UNSIGNED NOT NULL,
  `stid` int(10) UNSIGNED NOT NULL,
  `value` decimal(6,2) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `prid` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stock`
--

INSERT INTO `stock` (`sid`, `stid`, `value`, `cid`, `prid`, `active`) VALUES
(1, 1, '1000.00', 1, 1, 1),
(2, 1, '2000.00', 1, 2, 1),
(3, 1, '200.00', 1, 3, 1),
(4, 1, '150.00', 1, 4, 1),
(5, 1, '4100.00', 1, 5, 1),
(6, 1, '2400.00', 1, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `stock_type`
--

CREATE TABLE `stock_type` (
  `stid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stock_type`
--

INSERT INTO `stock_type` (`stid`, `name`, `description`, `active`) VALUES
(1, 'закупочная цена', '', 1);

-- --------------------------------------------------------

--
-- Структура для представления `property_value_with_currency`
--
DROP TABLE IF EXISTS `property_value_with_currency`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `property_value_with_currency`  AS  (select `st`.`name` AS `name`,concat(`s`.`value`,' ',`c`.`name`) AS `value`,`s`.`prid` AS `prid` from ((`stock` `s` left join `stock_type` `st` on((`s`.`stid` = `st`.`stid`))) left join `curency` `c` on((`s`.`cid` = `c`.`cid`)))) union (select `pt`.`name` AS `name`,`pv`.`value` AS `value`,`pv`.`prid` AS `prid` from (`property_value` `pv` left join `property_type` `pt` on((`pv`.`ptid` = `pt`.`ptid`)))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `curency`
--
ALTER TABLE `curency`
  ADD PRIMARY KEY (`cid`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prid`);

--
-- Индексы таблицы `product_group`
--
ALTER TABLE `product_group`
  ADD PRIMARY KEY (`prgid`);

--
-- Индексы таблицы `product_group_property_type`
--
ALTER TABLE `product_group_property_type`
  ADD PRIMARY KEY (`prgptid`);

--
-- Индексы таблицы `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`ptid`);

--
-- Индексы таблицы `property_value`
--
ALTER TABLE `property_value`
  ADD PRIMARY KEY (`pvid`);

--
-- Индексы таблицы `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `stock_type`
--
ALTER TABLE `stock_type`
  ADD PRIMARY KEY (`stid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `curency`
--
ALTER TABLE `curency`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `prid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `product_group`
--
ALTER TABLE `product_group`
  MODIFY `prgid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `product_group_property_type`
--
ALTER TABLE `product_group_property_type`
  MODIFY `prgptid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `property_type`
--
ALTER TABLE `property_type`
  MODIFY `ptid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `property_value`
--
ALTER TABLE `property_value`
  MODIFY `pvid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `stock`
--
ALTER TABLE `stock`
  MODIFY `sid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `stock_type`
--
ALTER TABLE `stock_type`
  MODIFY `stid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
