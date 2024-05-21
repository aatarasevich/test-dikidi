-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 21 2024 г., 14:26
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `andremv9_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `company_moto`
--
-- Создание: Май 21 2024 г., 11:20
-- Последнее обновление: Май 21 2024 г., 11:20
--

DROP TABLE IF EXISTS `company_moto`;
CREATE TABLE `company_moto` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `company_moto`
--

INSERT INTO `company_moto` (`id`, `name`) VALUES
(1, 'Honda'),
(2, 'Yamaha'),
(3, 'BMW'),
(4, 'Harley-Davidson Sportster'),
(5, 'Kawasaki');

-- --------------------------------------------------------

--
-- Структура таблицы `moto`
--
-- Создание: Май 21 2024 г., 11:20
-- Последнее обновление: Май 21 2024 г., 11:20
--

DROP TABLE IF EXISTS `moto`;
CREATE TABLE `moto` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `out_of_production` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `moto`
--

INSERT INTO `moto` (`id`, `type_id`, `company_id`, `serial_number`, `out_of_production`) VALUES
(1, 1, 1, 'ABC123', 0),
(2, 2, 2, 'XYZ456', 0),
(3, 3, 1, 'DEF789', 1),
(4, 1, 3, 'GHI012', 0),
(5, 2, 2, 'JKL345', 0),
(6, 3, 1, 'MNO678', 0),
(7, 1, 3, 'PQR901', 1),
(8, 2, 2, 'STU234', 0),
(9, 3, 1, 'VWX567', 0),
(10, 1, 3, 'YZA890', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `type_moto`
--
-- Создание: Май 21 2024 г., 11:20
-- Последнее обновление: Май 21 2024 г., 11:20
--

DROP TABLE IF EXISTS `type_moto`;
CREATE TABLE `type_moto` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_moto`
--

INSERT INTO `type_moto` (`id`, `name`) VALUES
(1, 'Классический'),
(2, 'Скутер'),
(3, 'Туристический'),
(4, 'Спортивный'),
(5, 'Туристический эндуро');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `company_moto`
--
ALTER TABLE `company_moto`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Индексы таблицы `type_moto`
--
ALTER TABLE `type_moto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `company_moto`
--
ALTER TABLE `company_moto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `moto`
--
ALTER TABLE `moto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `type_moto`
--
ALTER TABLE `type_moto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_moto` (`id`),
  ADD CONSTRAINT `moto_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_moto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
