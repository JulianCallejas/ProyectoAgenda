DROP DATABASE IF EXISTS agendapp;
CREATE DATABASE  IF NOT EXISTS `agendapp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agendapp`;

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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendas` (
  `Id_Agenda` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_Agenda`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  CONSTRAINT `Usuario` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
INSERT INTO `agendas` VALUES (3,'andres'),(1,'angel'),(2,'pepe');
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Id_Empleado` varchar(12) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Empleado`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  UNIQUE KEY `Id_Empleado_UNIQUE` (`Id_Empleado`),
  CONSTRAINT `Usuario1` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('11110000','angel','Angel','Arboleda Cortes','Backend'),('11110001','pepe','Pepe','Perez','Operario'),('11110002','andres','Andres','Ruiz','Operario');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `Id_Tarea` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Creadapor` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Final` time NOT NULL,
  `Titulo_Tarea` varchar(45) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Comentarios` text,
  `Estado` varchar(45) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Cierre` datetime NOT NULL,
  `Id_Agenda1` int NOT NULL,
  PRIMARY KEY (`Id_Tarea`,`Id_Agenda1`),
  UNIQUE KEY `Id_tarea_UNIQUE` (`Id_Tarea`),
  KEY `fk_Tareas_Agendas1_idx` (`Id_Agenda1`),
  CONSTRAINT `fk_Tareas_Agendas1` FOREIGN KEY (`Id_Agenda1`) REFERENCES `agendas` (`Id_Agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'pepe','angel','2022-09-25','08:00:00','18:00:00','Creacion de vista principal usuarios',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),(2,'pepe','angel','2022-09-22','10:00:00','18:00:00','Creación diseño vistas usuarios',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),(3,'pepe','angel','2022-09-24','08:00:00','18:00:00','Desarrollo de codigo para Agregar usuario',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),(4,'angel','angel','2022-09-20','08:00:00','18:00:00','Construir Archivo Gestion Configuracion',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-22 00:00:00',1),(5,'angel','angel','2022-09-20','08:00:00','18:00:00','Creación de historias de usuario',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-20 00:00:00',1),(6,'angel','angel','2022-09-21','08:00:00','18:00:00','Creación de grafico UML',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-24 00:00:00',1),(7,'andres','angel','2022-09-26','08:00:00','18:00:00','Creacion de grafico ERM',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-28 00:00:00',3),(8,'andres ','angel','2022-09-27','08:00:00','18:00:00','Creación de Tablas para Base de datos',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-28 00:00:00',3),(9,'andres','angel ','2022-09-28','08:00:00','18:00:00','Creación Base de datos',NULL,NULL,'Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',3);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contrasena` char(102) NOT NULL,
  `Administrador` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'angel','pedro@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary ''),(2,'pepe','pepe@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),(3,'andres','andres@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'agendapp'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_CreateEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_CreateEmpleados`(IN p_Id_Empleado varchar(12), p_Usuario varchar(15), p_Nombre varchar(45), p_Apellido varchar(45), p_Cargo varchar(45))
BEGIN
    insert into agendas(Id_Empleado, Usuario, Nombre, Apellido, Cargo)
    values (p_Id_Empleado, p_Usuario, p_Nombre, p_Apellido, p_Cargo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CreateTareas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_CreateTareas`(IN p_Usuario varchar(45), p_Creadapor varchar(45), p_Fecha date, p_Hora_Inicio time,
p_Hora_Final time, p_Titulo_Tarea varchar(45), p_Descripcion varchar(255), p_Comentarios text, p_Estado varchar(45), p_Fecha_Creacion datetime, 
p_Fecha_Cierre datetime, Id_Agenda1 int)
BEGIN
    insert into agendas(Usuario, Creadapor, Fecha, Hora_Inicio, Hora_Final, Titulo_Tarea, Descripcion, Comentarios, 
    Estado, Fecha_Creacion, Fecha_Cierre, Id_Agenda1)
    values (p_Usuario, p_Creadapor, p_Fecha, p_Hora_Inicio, p_Hora_Final, p_Titulo_Tarea, p_Descripcion, p_Comentarios, 
    p_Estado, p_Fecha_Creacion, p_Fecha_Cierre, Id_Agenda1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_CreateUser`(IN p_Usuario varchar(15), p_Email varchar(45), p_Contrasena char(102), p_Administrador bit(1))
BEGIN
    insert into usuarios(Usuario, Email, Contrasena, Administrador)
    values (p_Usuario, p_Email, p_Contrasena, p_Administrador);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DeleteAgendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_DeleteAgendas`(IN p_Id_Agenda int)
BEGIN
    DELETE FROM agendas
    WHERE Id_Agenda = p_Id_Agenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DeleteEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_DeleteEmpleados`(IN p_Id_Empleado int)
BEGIN
    DELETE FROM agendas
    WHERE Id_Empleado = p_Id_Empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DeleteTareas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_DeleteTareas`(IN p_Id_Tarea int)
BEGIN
    DELETE FROM tareas
    WHERE Id_Tarea = p_Id_Tarea;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_DeleteUser`(IN p_id int)
BEGIN
    DELETE FROM usuarios
    WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SelectAllUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectAllUsuarios`()
BEGIN
	SELECT id, usu.Usuario, Id_Empleado, Nombre, Apellido, Cargo, Email, Administrador
	FROM usuarios AS usu
	INNER JOIN empleados AS emp
	ON usu.usuario = emp.usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SelectTarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectTarea`(IN p_Id_Tarea int)
BEGIN
	SELECT Id_Tarea, Usuario, Creadapor, Fecha, Hora_Inicio, Hora_Final, Titulo_Tarea, Descripcion, Comentarios, 
    Estado, Fecha_Creacion, Fecha_Cierre, Id_Agenda1
	FROM tareas
    WHERE Id_Tarea = p_Id_Tarea;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SelectTareasUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectTareasUsuario`(IN p_id int)
BEGIN
	SELECT 	usu.Usuario, 
		usu.Email, 
        usu.Administrador, 
        age.Id_Agenda, 
        tar.Id_tarea, 
        tar.Usuario, 
        tar.Creadapor, 
        tar.Fecha, 
        tar.Hora_Inicio, 
        tar.Hora_Final, 
        tar.Titulo_Tarea, 
        tar.Descripción, 
        tar.Comentarios, 
        tar.Estado, 
        tar.Fecha_Creacion, 
        tar.Fecha_Cerrie
FROM usuarios AS usu LEFT JOIN agendas  AS age ON usu.Usuario = age.Usuario LEFT JOIN tareas AS tar ON age.Id_Agenda = tar.Id_Agenda1
WHERE usu.Usuario = useragenda AND  tar.Id_tarea = idtarea
ORDER BY tar.Estado DESC, tar.Fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SelectUsuariosWord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectUsuariosWord`(IN p_Word varchar(15))
BEGIN
    SELECT usu.id, usu.Usuario, usu.Email, usu.Administrador, emp.Id_Empleado, emp.Nombre, emp.Apellido, emp.Cargo
	FROM agendapp.usuarios AS usu LEFT JOIN agendapp.empleados AS emp ON usu.Usuario = emp.Usuario 
	WHERE CONCAT(usu.Usuario, usu.Email, usu.Administrador, emp.Id_Empleado, emp.Nombre, emp.Apellido, emp.Cargo) LIKE CONCAT('%', p_Word, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UpdateAgendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateAgendas`(IN p_Id_Agenda int, p_Usuario varchar(15))
BEGIN
    UPDATE agendas
    SET Usuario = p_Usuario
    WHERE Id_Agenda = p_Id_Agenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UpdateEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateEmpleados`(IN p_Id_Empleado varchar(12), p_Usuario varchar(15), p_Nombre varchar(45), p_Apellido varchar(45), p_Cargo varchar(45))
BEGIN
    UPDATE agendas
    SET Usuario = p_Usuario, Nombre = p_Nombre, Apellido = p_Apellido, Cargo = p_Cargo
    WHERE Id_Empleado = p_Id_Empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UpdateTareas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateTareas`(IN p_Id_Tarea int, p_Usuario varchar(45), p_Creadapor varchar(45), p_Fecha date, p_Hora_Inicio time,
p_Hora_Final time, p_Titulo_Tarea varchar(45), p_Descripcion varchar(255), p_Comentarios text, p_Estado varchar(45), p_Fecha_Creacion datetime, 
p_Fecha_Cierre datetime, Id_Agenda1 int)
BEGIN
    UPDATE tareas
    SET Usuario = p_Usuario, Creadapor = p_Creadapor, Fecha = p_Fecha, Hora_Inicio = p_Hora_Inicio,
    Hora_Final = p_Hora_Final, Titulo_Tarea = p_Titulo_Tarea, Descripcion = p_Descripcion, Comentarios = p_Comentarios,
    Estado = p_Estado, Fecha_Creacion = p_Fecha_Creacion, Fecha_Cierre = p_Fecha_Cierre, Id_Agenda1 = p_Id_Agenda1
    WHERE Id_Tarea = p_Id_Tarea;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateUser`(IN p_id int, p_Usuario varchar(15), p_Email varchar(45), p_Contrasena char(102), p_Administrador bit(1))
BEGIN
    UPDATE usuarios
    SET Usuario = p_Usuario, Email = p_Email, Contrasena = p_Contrasena, Administrador = p_Administrador
    WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UserData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UserData`(IN loguser VARCHAR(15))
BEGIN
SELECT usu.id, usu.Usuario, usu.Contrasena, usu.Email, usu.Administrador, emp.Id_Empleado, emp.Nombre, emp.Apellido, emp.Cargo
FROM agendapp.usuarios AS usu LEFT JOIN agendapp.empleados AS emp ON usu.Usuario = emp.Usuario
WHERE usu.Usuario = loguser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UserDataById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `SP_UserDataById`(IN logid INT)
BEGIN
SELECT usu.id, usu.Usuario, usu.Contrasena, usu.Email, usu.Administrador, emp.Id_Empleado, emp.Nombre, emp.Apellido, emp.Cargo
FROM agendapp.usuarios AS usu LEFT JOIN agendapp.empleados AS emp ON usu.Usuario = emp.Usuario
WHERE usu.id = logid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-11 21:38:50
