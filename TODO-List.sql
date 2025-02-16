-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_ibfk_2` FOREIGN KEY (`name`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (7,'diana_todorova'),(4,'elena_stoyanova'),(3,'georgi_dimitrov'),(1,'ivan_petrov'),(10,'lilia_petrova'),(2,'maria_ivanova'),(5,'nikolay_karamfilov'),(6,'pavel_hristov'),(8,'stefan_angelov'),(9,'vasil_ivanov');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_tags`
--

DROP TABLE IF EXISTS `task_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_tags` (
  `task_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`task_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `task_tags_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_tags`
--

LOCK TABLES `task_tags` WRITE;
/*!40000 ALTER TABLE `task_tags` DISABLE KEYS */;
INSERT INTO `task_tags` VALUES (1,1),(8,2),(3,3),(9,4),(5,5),(10,5),(4,7),(2,8),(7,9),(6,10);
/*!40000 ALTER TABLE `task_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `status` enum('pending','in progress','completed') DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Сутрешна тренировка','30-минутна кардио тренировка вкъщи или навън','pending','2025-02-03','2025-02-02 13:48:13',1),(2,'Пазаруване','Купуване на пресни плодове, зеленчуци и хляб','pending','2025-02-03','2025-02-02 13:48:13',8),(3,'Приготвяне на обяд','Готвене на здравословен обяд за семейството','pending','2025-02-03','2025-02-02 13:48:13',3),(4,'Проверка на имейли','Преглед и отговор на важни съобщения','in progress','2025-02-03','2025-02-02 13:48:13',7),(5,'Разходка','30-минутна разходка в парка за освежаване','pending','2025-02-03','2025-02-02 13:48:13',5),(6,'Работна среща','Ежедневна среща с екипа за обсъждане на задачите','completed','2025-02-03','2025-02-02 13:48:13',10),(7,'Учене на ново умение','30 минути практика по програмиране','in progress','2025-02-03','2025-02-02 13:48:13',9),(8,'Четене на книга','Прочитане на поне 20 страници от любимата книга','pending','2025-02-03','2025-02-02 13:48:13',2),(9,'Почистване на дома','Подреждане и почистване на кухнята и хола','pending','2025-02-03','2025-02-02 13:48:13',4),(10,'Планиране на следващия ден','Записване на задачите за утре','pending','2025-02-03','2025-02-02 13:48:13',5);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivan_petrov','ivan.petrov@gmail.com','Abc12345','2025-02-02 13:33:28'),(2,'maria_ivanova','maria.ivanova@work.com','Xyz98765','2025-02-02 13:33:28'),(3,'georgi_dimitrov','georgi.dimitrov@abv.bg','Passw0rd','2025-02-02 13:33:28'),(4,'elena_stoyanova','elena.stoyanova@yahoo.com','Hello123','2025-02-02 13:33:28'),(5,'nikolay_karamfilov','nikolay.k@tech.com','1234abcd','2025-02-02 13:33:28'),(6,'pavel_hristov','pavel.hristov@outlook.com','Qwerty78','2025-02-02 13:33:28'),(7,'diana_todorova','diana.todorova@mail.bg','Zxcvbnm1','2025-02-02 13:33:28'),(8,'stefan_angelov','stefan.angelov@business.com','TestUser1','2025-02-02 13:33:28'),(9,'vasil_ivanov','vasil.ivanov@gmail.com','Monkey12','2025-02-02 13:33:28'),(10,'lilia_petrova','lilia.petrova@recovery.com','Secret987','2025-02-02 13:33:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-02 16:29:34
