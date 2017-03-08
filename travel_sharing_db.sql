-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for travel_sharing
DROP DATABASE IF EXISTS `travel_sharing`;
CREATE DATABASE IF NOT EXISTS `travel_sharing` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `travel_sharing`;

-- Dumping structure for table travel_sharing.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_published` datetime NOT NULL,
  `town_id_from` int(11) NOT NULL,
  `town_id_to` int(11) NOT NULL,
  `seats` tinyint(4) NOT NULL,
  `departure_time` datetime NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_posts_users` (`user_id`),
  KEY `FK_posts_towns_from` (`town_id_from`),
  KEY `FK_posts_towns_to` (`town_id_to`),
  CONSTRAINT `FK_posts_towns_from` FOREIGN KEY (`town_id_from`) REFERENCES `towns` (`id`),
  CONSTRAINT `FK_posts_towns_to` FOREIGN KEY (`town_id_to`) REFERENCES `towns` (`id`),
  CONSTRAINT `FK_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_sharing.posts: ~1 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `date_published`, `town_id_from`, `town_id_to`, `seats`, `departure_time`, `price`) VALUES
	(1, 1, '2017-04-06 19:29:28', 1, 3, 2, '2017-04-10 13:00:00', 20);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table travel_sharing.towns
DROP TABLE IF EXISTS `towns`;
CREATE TABLE IF NOT EXISTS `towns` (
  `id` int(11) NOT NULL,
  `town_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_sharing.towns: ~256 rows (approximately)
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
INSERT INTO `towns` (`id`, `town_name`) VALUES
	(1, 'София'),
	(2, 'Пловдив'),
	(3, 'Варна'),
	(4, 'Бургас'),
	(5, 'Русе'),
	(6, 'Стара Загора'),
	(7, 'Плевен'),
	(8, 'Добрич'),
	(9, 'Сливен'),
	(10, 'Шумен'),
	(11, 'Перник'),
	(12, 'Пазарджик'),
	(13, 'Ямбол'),
	(14, 'Хасково'),
	(15, 'Благоевград'),
	(16, 'Велико Търново'),
	(17, 'Враца'),
	(18, 'Габрово'),
	(19, 'Асеновград'),
	(20, 'Видин'),
	(21, 'Казанлък'),
	(22, 'Кърджали'),
	(23, 'Кюстендил'),
	(24, 'Монтана'),
	(25, 'Търговище'),
	(26, 'Димитровград'),
	(27, 'Силистра'),
	(28, 'Ловеч'),
	(29, 'Дупница'),
	(30, 'Разград'),
	(31, 'Горна Оряховица'),
	(32, 'Свищов'),
	(33, 'Петрич'),
	(34, 'Смолян'),
	(35, 'Сандански'),
	(36, 'Самоков'),
	(37, 'Велинград'),
	(38, 'Севлиево'),
	(39, 'Лом'),
	(40, 'Нова Загора'),
	(41, 'Карлово'),
	(42, 'Айтос'),
	(43, 'Троян'),
	(44, 'Ботевград'),
	(45, 'Харманли'),
	(46, 'Пещера'),
	(47, 'Гоце Делчев'),
	(48, 'Свиленград'),
	(49, 'Карнобат'),
	(50, 'Панагюрище'),
	(51, 'Чирпан'),
	(52, 'Попово'),
	(53, 'Раковски'),
	(54, 'Радомир'),
	(55, 'Първомай'),
	(56, 'Нови Искър'),
	(57, 'Поморие'),
	(58, 'Несебър'),
	(59, 'Червен бряг'),
	(60, 'Козлодуй'),
	(61, 'Ихтиман'),
	(62, 'Нови пазар'),
	(63, 'Берковица'),
	(64, 'Раднево'),
	(65, 'Провадия'),
	(66, 'Разлог'),
	(67, 'Балчик'),
	(68, 'Бяла Слатина'),
	(69, 'Каварна'),
	(70, 'Костинброд'),
	(71, 'Банкя'),
	(72, 'Стамболийски'),
	(73, 'Етрополе'),
	(74, 'Кнежа'),
	(75, 'Левски'),
	(76, 'Павликени'),
	(77, 'Мездра'),
	(78, 'Елхово'),
	(79, 'Тетевен'),
	(80, 'Луковит'),
	(81, 'Тутракан'),
	(82, 'Трявна'),
	(83, 'Девня'),
	(84, 'Средец'),
	(85, 'Омуртаг'),
	(86, 'Сопот'),
	(87, 'Исперих'),
	(88, 'Велики Преслав'),
	(89, 'Бяла'),
	(90, 'Ракитово'),
	(91, 'Гълъбово'),
	(92, 'Кричим'),
	(93, 'Лясковец'),
	(94, 'Септември'),
	(95, 'Момчилград'),
	(96, 'Банско'),
	(97, 'Белене'),
	(98, 'Аксаково'),
	(99, 'Белослав'),
	(100, 'Своге'),
	(101, 'Дряново'),
	(102, 'Любимец'),
	(103, 'Кубрат'),
	(104, 'Пирдоп'),
	(105, 'Елин Пелин'),
	(106, 'Симитли'),
	(107, 'Сливница'),
	(108, 'Златоград'),
	(109, 'Хисаря'),
	(110, 'Дулово'),
	(111, 'Долни чифлик'),
	(112, 'Симеоновград'),
	(113, 'Генерал Тошево'),
	(114, 'Тервел'),
	(115, 'Костенец'),
	(116, 'Девин'),
	(117, 'Мадан'),
	(118, 'Стралджа'),
	(119, 'Царево'),
	(120, 'Вършец'),
	(121, 'Твърдица'),
	(122, 'Куклен'),
	(123, 'Бобов дол'),
	(124, 'Котел'),
	(125, 'Съединение'),
	(126, 'Елена'),
	(127, 'Оряхово'),
	(128, 'Якоруда'),
	(129, 'Божурище'),
	(130, 'Тополовград'),
	(131, 'Белоградчик'),
	(132, 'Стражица'),
	(133, 'Камено'),
	(134, 'Чепеларе'),
	(135, 'Созопол'),
	(136, 'Перущица'),
	(137, 'Суворово'),
	(138, 'Златица'),
	(139, 'Крумовград'),
	(140, 'Долна баня'),
	(141, 'Дългопол'),
	(142, 'Ветово'),
	(143, 'Полски Тръмбеш'),
	(144, 'Тръстеник'),
	(145, 'Койнаре'),
	(146, 'Долни Дъбник'),
	(147, 'Славяново'),
	(148, 'Годеч'),
	(149, 'Правец'),
	(150, 'Игнатиево'),
	(151, 'Костандово'),
	(152, 'Брацигово'),
	(153, 'Две могили'),
	(154, 'Стрелча'),
	(155, 'Неделино'),
	(156, 'Свети Влас'),
	(157, 'Сапарева баня'),
	(158, 'Брезник'),
	(159, 'Смядово'),
	(160, 'Ардино'),
	(161, 'Дебелец'),
	(162, 'Никопол'),
	(163, 'Шивачево'),
	(164, 'Белово'),
	(165, 'Цар Калоян'),
	(166, 'Мартен'),
	(167, 'Ивайловград'),
	(168, 'Кресна'),
	(169, 'Върбица'),
	(170, 'Рудозем'),
	(171, 'Вълчедръм'),
	(172, 'Приморско'),
	(173, 'Глоджево'),
	(174, 'Летница'),
	(175, 'Мъглиж'),
	(176, 'Искър'),
	(177, 'Шабла'),
	(178, 'Гулянци'),
	(179, 'Долна Митрополия'),
	(180, 'Крън'),
	(181, 'Вълчи дол'),
	(182, 'Сливо поле'),
	(183, 'Баня'),
	(184, 'Драгоман'),
	(185, 'Сунгурларе'),
	(186, 'Батак'),
	(187, 'Джебел'),
	(188, 'Завет'),
	(189, 'Криводол'),
	(190, 'Мизия'),
	(191, 'Белица'),
	(192, 'Каспичан'),
	(193, 'Кула'),
	(194, 'Николаево'),
	(195, 'Ветрен'),
	(196, 'Гурково'),
	(197, 'Роман'),
	(198, 'Калофер'),
	(199, 'Каблешково'),
	(200, 'Априлци'),
	(201, 'Бухово'),
	(202, 'Долна Оряховица'),
	(203, 'Павел баня'),
	(204, 'Ябланица'),
	(205, 'Рила'),
	(206, 'Опака'),
	(207, 'Угърчин'),
	(208, 'Златарица'),
	(209, 'Хаджидимово'),
	(210, 'Добринище'),
	(211, 'Обзор'),
	(212, 'Бяла черква'),
	(213, 'Дунавци'),
	(214, 'Брегово'),
	(215, 'Трън'),
	(216, 'Садово'),
	(217, 'Килифарево'),
	(218, 'Лъки'),
	(219, 'Малко Търново'),
	(220, 'Доспат'),
	(221, 'Копривщица'),
	(222, 'Кочериново'),
	(223, 'Лозница'),
	(224, 'Бяла'),
	(225, 'Борово'),
	(226, 'Черноморец'),
	(227, 'Батановци'),
	(228, 'Пордим'),
	(229, 'Ахелой'),
	(230, 'Сухиндол'),
	(231, 'Българово'),
	(232, 'Брезово'),
	(233, 'Главиница'),
	(234, 'Каолиново'),
	(235, 'Чипровци'),
	(236, 'Меричлери'),
	(237, 'Земен'),
	(238, 'Плачковци'),
	(239, 'Кермен'),
	(240, 'Момин проход'),
	(241, 'Алфатар'),
	(242, 'Грамада'),
	(243, 'Сеново'),
	(244, 'Бойчиновци'),
	(245, 'Антоново'),
	(246, 'Ахтопол'),
	(247, 'Бобошево'),
	(248, 'Шипка'),
	(249, 'Болярово'),
	(250, 'Димово'),
	(251, 'Брусарци'),
	(252, 'Китен'),
	(253, 'Клисура'),
	(254, 'Плиска'),
	(255, 'Маджарово'),
	(256, 'Мелник');
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;

-- Dumping structure for table travel_sharing.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel_sharing.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `date_of_birth`, `gender`, `phone_number`, `rating`, `picture`) VALUES
	(1, 'john', '123', 'John', 'Doe', 'john@gmail.com', '1996-03-06 20:00:00', 'Male', '+359887123456', 0, '0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
