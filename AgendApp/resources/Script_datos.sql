-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: agendapp
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
INSERT INTO `agendas` VALUES (3,'andres'),(1,'angel'),(2,'pepe');
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('11110000','angel','Angel','Arboleda Cortes','Backend'),('11110001','pepe','Pepe','Perez','Operario'),('11110002','andres','Andres','Ruiz','Operario');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'pepe','angel','2022-09-25','08:00:00','18:00:00','Creacion de vista principal usuarios',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),(2,'pepe','angel','2022-09-22','10:00:00','18:00:00','Creación diseño vistas usuarios',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),(3,'pepe','angel','2022-09-24','08:00:00','18:00:00','Desarrollo de codigo para Agregar usuario',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),(4,'angel','angel','2022-09-20','08:00:00','18:00:00','Construir Archivo Gestion Configuracion',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-22 00:00:00',1),(5,'angel','angel','2022-09-20','08:00:00','18:00:00','Creación de historias de usuario',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-20 00:00:00',1),(6,'angel','angel','2022-09-21','08:00:00','18:00:00','Creación de grafico UML',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-24 00:00:00',1),(7,'andres','angel','2022-09-26','08:00:00','18:00:00','Creacion de grafico ERM',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-28 00:00:00',3),(8,'andres ','angel','2022-09-27','08:00:00','18:00:00','Creación de Tablas para Base de datos',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-28 00:00:00',3),(9,'andres','angel ','2022-09-28','08:00:00','18:00:00','Creación Base de datos',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',3);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'angel','pedro@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary ''),(2,'pepe','pepe@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),(3,'andres','andres@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-11 21:38:37
