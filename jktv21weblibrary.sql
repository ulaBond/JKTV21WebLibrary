-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 28 2023 г., 08:28
-- Версия сервера: 10.1.33-MariaDB
-- Версия PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jktv21weblibrary`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `ID` bigint(20) NOT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`ID`, `BIRTHDAY`, `FIRSTNAME`, `LASTNAME`) VALUES
(1, '1841-02-15 00:00:05', 'Лев', 'Толстой'),
(2, '1841-02-15 00:00:23', 'Lesja ', 'Ukrainka'),
(3, '1864-03-11 00:00:56', 'Ivan', 'Kotsybinskiy'),
(4, '1814-03-09 00:00:04', 'Taras', 'Shevchenko'),
(5, '1985-06-13 00:00:49', 'Artem', 'Chekh');

-- --------------------------------------------------------

--
-- Структура таблицы `author_book`
--

CREATE TABLE `author_book` (
  `Author_ID` bigint(20) NOT NULL,
  `books_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author_book`
--

INSERT INTO `author_book` (`Author_ID`, `books_ID`) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 9),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`ID`, `TITLE`) VALUES
(1, 'Mavka'),
(2, 'Война и мир'),
(3, 'Anna Karenina'),
(4, 'Fata Morgana'),
(5, 'Kobzar'),
(6, 'Anatomical Atlas'),
(7, 'You will nit find this in Yandex'),
(8, 'Plastic'),
(9, 'Bojarynja');

-- --------------------------------------------------------

--
-- Структура таблицы `book_author`
--

CREATE TABLE `book_author` (
  `Book_ID` bigint(20) NOT NULL,
  `authors_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_author`
--

INSERT INTO `book_author` (`Book_ID`, `authors_ID`) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 3),
(5, 4),
(6, 5),
(7, 5),
(8, 5),
(9, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `ID` bigint(20) NOT NULL,
  `RETURNBOOK` datetime DEFAULT NULL,
  `TAKEONBOOK` datetime DEFAULT NULL,
  `BOOK_ID` bigint(20) DEFAULT NULL,
  `READER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reader`
--

CREATE TABLE `reader` (
  `ID` bigint(20) NOT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`Author_ID`,`books_ID`),
  ADD KEY `FK_AUTHOR_BOOK_books_ID` (`books_ID`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`Book_ID`,`authors_ID`),
  ADD KEY `FK_BOOK_AUTHOR_authors_ID` (`authors_ID`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HISTORY_BOOK_ID` (`BOOK_ID`),
  ADD KEY `FK_HISTORY_READER_ID` (`READER_ID`);

--
-- Индексы таблицы `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reader`
--
ALTER TABLE `reader`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `FK_AUTHOR_BOOK_Author_ID` FOREIGN KEY (`Author_ID`) REFERENCES `author` (`ID`),
  ADD CONSTRAINT `FK_AUTHOR_BOOK_books_ID` FOREIGN KEY (`books_ID`) REFERENCES `book` (`ID`);

--
-- Ограничения внешнего ключа таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `FK_BOOK_AUTHOR_Book_ID` FOREIGN KEY (`Book_ID`) REFERENCES `book` (`ID`),
  ADD CONSTRAINT `FK_BOOK_AUTHOR_authors_ID` FOREIGN KEY (`authors_ID`) REFERENCES `author` (`ID`);

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_HISTORY_BOOK_ID` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_READER_ID` FOREIGN KEY (`READER_ID`) REFERENCES `reader` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
