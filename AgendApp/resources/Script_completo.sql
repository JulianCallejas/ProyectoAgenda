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
INSERT INTO `agendas` 
VALUES 	(1,'angel'),
		(2,'pepe'),
        (3,'andres'),
        (4, 'user4'),
		(5, 'user5'),
		(6, 'user6'),
		(7, 'user7'),
		(8, 'user8'),
		(9, 'user9'),
		(10, 'user10'),
		(11, 'user11'),
		(12, 'user12'),
		(13, 'user13'),
		(14, 'user14'),
		(15, 'user15'),
		(16, 'user16'),
		(17, 'user17'),
		(18, 'user18'),
		(19, 'user19'),
		(20, 'user20'),
		(21, 'user21'),
		(22, 'user22'),
		(23, 'user23');
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
INSERT INTO `empleados` 
VALUES 	('11110000','angel','Angel','Arboleda Cortes','Backend'),
		('11110001','pepe','Pepe','Perez','Operario'),
        ('11110002','andres','Andres','Ruiz','Operario'),
        ('11110004','user4','Christian','Acevedo','Operario'),
		('11110005','user5','Maria','Acevedo','Front'),
		('11110006','user6','Andres','Acevedo','Back'),
		('11110007','user7','Sebastian','Ortiz','Operario'),
		('11110008','user8','Laura','Acosta','Operario'),
		('11110009','user9','Gisela','Bermúdez','Operario'),
		('11110010','user10','Frank','Acosta','Operario'),
		('11110011','user11','Juan','Acosta','Front'),
		('11110012','user12','Diego','Acosta','Back'),
		('11110013','user13','Brayan','Acosta','Operario'),
		('11110014','user14','Nini','Acosta','Operario'),
		('11110015','user15','Angie','Acosta','Operario'),
		('11110016','user16','Cristian','Acosta','Operario'),
		('11110017','user17','Kevin','Acosta','Front'),
		('11110018','user18','Carlos','Acosta','Back'),
		('11110019','user19','Edgar','Acosta','Operario'),
		('11110020','user20','Angie','Acosta','Operario'),
		('11110021','user21','Yulitza','Acosta','Operario'),
		('11110022','user22','Steven','Espinosa','Operario'),
		('11110023','user23','Lorena','Garavito','front');

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
INSERT INTO `tareas` 
VALUES 	(1,'pepe','pepe','2022-09-25','08:00:00','18:00:00','Creacion de vista principal usuarios','Comenatario Creacion de vista principal usuarios','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),
		(2,'pepe','pepe','2022-09-22','10:00:00','18:00:00','Creación diseño vistas usuarios','Comentario Creación diseño vistas usuarios','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',2),
        (3,'pepe','angel','2022-09-24','08:00:00','18:00:00','Desarrollo de codigo para Agregar usuario','Comentario Desarrollo de codigo para Agregar usuario','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
        (4,'angel','angel','2022-09-20','08:00:00','18:00:00','Construir Archivo Gestion Configuracion','Comentario Construir Archivo Gestion Configuracion','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-22 00:00:00',1),
        (5,'angel','angel','2022-09-20','08:00:00','18:00:00','Creación de historias de usuario','Comenatrio Creación de historias de usuario','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-20 00:00:00',1),
        (6,'angel','angel','2022-09-21','08:00:00','18:00:00','Creación de grafico UML','Comentario Creación de grafico UML','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-24 00:00:00',1),
        (7,'andres','andres','2022-09-26','08:00:00','18:00:00','Creacion de grafico ERM','Comentario Creacion de grafico ERM','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-28 00:00:00',3),
        (8,'andres ','andres','2022-09-27','08:00:00','18:00:00','Creación de Tablas para Base de datos','Comentario Creación de Tablas para Base de datos','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-28 00:00:00',3),
        (9,'andres','angel ','2022-09-28','08:00:00','18:00:00','Creación Base de datos','Comentario Creación Base de datos','De acuerdo con el ingeniero Trejo, el sector que más tiene potencial para desarrollar inteligencia artificial es el agro, pues existe una tendencia global en todas las industrias con la personalización, “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-29 00:00:00',3),
		(10,'pepe','pepe','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(11,'pepe','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(12,'pepe','pepe','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(13,'pepe','pepe','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(14,'pepe','pepe','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(15,'pepe','pepe','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(16,'pepe','angel','2022-09-27','08:00:00','12:00:00','Lavar y guardar los platos','Lavar y guardar los platos Antes de Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(17,'pepe','pepe','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(18,'pepe','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(19,'pepe','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(20,'pepe','pepe','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(21,'pepe','pepe','2022-09-28','13:00:00','18:00:00','Jugar de cocinero y preparar la comida una noche a la semana','Jugar de cocinero y preparar la comida una noche a la semana Antes de Hacer el jardín','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(22,'pepe','pepe','2022-09-29','08:00:00','12:00:00','Hacer el jardín','Hacer el jardín Antes de Lavar el auto familiar','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
		(23,'pepe','angel','2022-09-29','13:00:00','18:00:00','Lavar el auto familiar','Lavar el auto familiar Despues de Guardar sus pertenencias','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',2),
        
        (24,'user4','user4','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(25,'user4','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(26,'user4','user4','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(27,'user4','user4','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(28,'user4','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(29,'user4','user4','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(30,'user4','user4','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(31,'user4','user4','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(32,'user4','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',4),
		(33,'user4','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',4),

		(34,'user5','user5','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(35,'user5','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(36,'user5','user5','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(37,'user5','user5','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(38,'user5','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(39,'user5','user5','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(40,'user5','user5','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(41,'user5','user5','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(42,'user5','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',5),
		(43,'user5','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',5),

		(44,'user6','user6','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(45,'user6','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(46,'user6','user6','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(47,'user6','user6','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(48,'user6','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(49,'user6','user6','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(50,'user6','user6','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(51,'user6','user6','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(52,'user6','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',6),
		(53,'user6','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',6),

		(54,'user7','user7','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(55,'user7','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(56,'user7','user7','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(57,'user7','user7','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(58,'user7','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(59,'user7','user7','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(60,'user7','user7','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(61,'user7','user7','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(62,'user7','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',7),
		(63,'user7','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',7),

		(64,'user8','user8','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(65,'user8','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(66,'user8','user8','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(67,'user8','user8','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(68,'user8','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(69,'user8','user8','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(70,'user8','user8','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(71,'user8','user8','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(72,'user8','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',8),
		(73,'user8','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',8),

		(74,'user9','user9','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(75,'user9','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(76,'user9','user9','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(77,'user9','user9','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(78,'user9','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(79,'user9','user9','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(80,'user9','user9','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(81,'user9','user9','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(82,'user9','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',9),
		(83,'user9','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',9),

		(84,'user10','user10','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(85,'user10','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(86,'user10','user10','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(87,'user10','user10','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(88,'user10','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(89,'user10','user10','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(90,'user10','user10','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(91,'user10','user10','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(92,'user10','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',10),
		(93,'user10','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',10),

		(94,'user11','user11','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(95,'user11','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(96,'user11','user11','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(97,'user11','user11','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(98,'user11','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(99,'user11','user11','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(100,'user11','user11','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(101,'user11','user11','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(102,'user11','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',11),
		(103,'user11','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',11),

		(104,'user12','user12','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(105,'user12','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(106,'user12','user12','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(107,'user12','user12','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(108,'user12','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(109,'user12','user12','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(110,'user12','user12','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(111,'user12','user12','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(112,'user12','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',12),
		(113,'user12','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',12),

		(114,'user13','user13','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(115,'user13','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(116,'user13','user13','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(117,'user13','user13','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(118,'user13','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(119,'user13','user13','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(120,'user13','user13','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(121,'user13','user13','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(122,'user13','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',13),
		(123,'user13','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',13),

		(124,'user14','user14','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(125,'user14','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(126,'user14','user14','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(127,'user14','user14','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(128,'user14','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(129,'user14','user14','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(130,'user14','user14','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(131,'user14','user14','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(132,'user14','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',14),
		(133,'user14','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',14),

		(134,'user15','user15','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(135,'user15','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(136,'user15','user15','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(137,'user15','user15','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(138,'user15','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(139,'user15','user15','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(140,'user15','user15','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(141,'user15','user15','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(142,'user15','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',15),
		(143,'user15','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',15),

		(144,'user16','user16','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(145,'user16','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(146,'user16','user16','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(147,'user16','user16','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(148,'user16','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(149,'user16','user16','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(150,'user16','user16','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(151,'user16','user16','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(152,'user16','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',16),
		(153,'user16','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',16),

		(154,'user17','user17','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(155,'user17','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(156,'user17','user17','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(157,'user17','user17','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(158,'user17','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(159,'user17','user17','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(160,'user17','user17','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(161,'user17','user17','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(162,'user17','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',17),
		(163,'user17','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',17),

		(164,'user18','user18','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(165,'user18','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(166,'user18','user18','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(167,'user18','user18','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(168,'user18','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(169,'user18','user18','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(170,'user18','user18','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(171,'user18','user18','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(172,'user18','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',18),
		(173,'user18','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',18),

		(174,'user19','user19','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(175,'user19','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(176,'user19','user19','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(177,'user19','user19','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(178,'user19','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(179,'user19','user19','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(180,'user19','user19','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(181,'user19','user19','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(182,'user19','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',19),
		(183,'user19','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',19),

		(184,'user20','user20','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(185,'user20','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(186,'user20','user20','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(187,'user20','user20','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(188,'user20','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(189,'user20','user20','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(190,'user20','user20','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(191,'user20','user20','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(192,'user20','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',20),
		(193,'user20','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',20),

		(194,'user21','user21','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(195,'user21','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(196,'user21','user21','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(197,'user21','user21','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(198,'user21','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(199,'user21','user21','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(200,'user21','user21','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(201,'user21','user21','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(202,'user21','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',21),
		(203,'user21','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',21),

		(204,'user22','user22','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(205,'user22','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(206,'user22','user22','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(207,'user22','user22','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(208,'user22','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(209,'user22','user22','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(210,'user22','user22','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(211,'user22','user22','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(212,'user22','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',22),
		(213,'user22','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',22),

		(214,'user23','user23','2022-09-24','08:00:00','12:00:00','Guardar sus pertenencias','Guardar sus pertenencias Antes de Lavar la ropa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(215,'user23','angel','2022-09-24','13:00:00','18:00:00','Lavar la ropa','Lavar la ropa Antes de Doblar y guardar la ropa limpia','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(216,'user23','user23','2022-09-25','08:00:00','12:00:00','Doblar y guardar la ropa limpia','Doblar y guardar la ropa limpia Antes de Pasar la aspiradora, barrer, quitar el polvo','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(217,'user23','user23','2022-09-25','13:00:00','18:00:00','Pasar la aspiradora, barrer, quitar el polvo','Pasar la aspiradora, barrer, quitar el polvo Antes de Poner la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(218,'user23','angel','2022-09-26','08:00:00','12:00:00','Poner la mesa','Poner la mesa Antes de Recoger la mesa','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(219,'user23','user23','2022-09-26','13:00:00','18:00:00','Recoger la mesa','Recoger la mesa Antes de Lavar y guardar los platos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(220,'user23','user23','2022-09-28','08:00:00','12:00:00','Preparar sus propias loncheras para la escuela','Preparar sus propias loncheras para la escuela Antes de Jugar de cocinero y preparar la comida una noche a la semana','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(221,'user23','user23','2022-09-27','13:00:00','18:00:00','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros','Alimentar, sacar a caminar a las mascotas de la familia; limpiar las jaulas de las aves y limpiar los areneros Antes de Trapear los pisos','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(222,'user23','angel','2022-09-27','08:00:00','12:00:00','Trapear los pisos','Trapear los pisos Antes de Limpiar el lavabo, el inodoro, la tina del baño, la ducha','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Completa','2022-09-01 17:35:04','2022-09-30 00:00:00',23),
		(223,'user23','angel','2022-09-28','13:00:00','18:00:00','Limpiar el lavabo, el inodoro, la tina del baño, la ducha','Limpiar el lavabo, el inodoro, la tina del baño, la ducha Antes de Preparar sus propias loncheras para la escuela','De acuerdo con el ingeniero Trejo el sector que más tiene potencial para desarrollar inteligencia artificial es el agro pues existe una tendencia global en todas las industrias con la personalización “mientras más personalizado sea el producto más lo quieren comprar".','Pendiente','2022-09-01 17:35:04','2022-09-30 00:00:00',23);

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
INSERT INTO `usuarios` 
VALUES 	(1,'angel','pedro@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary ''),
		(2,'pepe','pepe@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
        (3,'andres','andres@gmail.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
        
        (4,'user4','user4@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(5,'user5','user5@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(6,'user6','user6@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(7,'user7','user7@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(8,'user8','user8@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(9,'user9','user9@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(10,'user10','user10@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(11,'user11','user11@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(12,'user12','user12@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(13,'user13','user13@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(14,'user14','user14@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(15,'user15','user15@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(16,'user16','user16@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(17,'user17','user17@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(18,'user18','user18@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(19,'user19','user19@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(20,'user20','user20@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(21,'user21','user21@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(22,'user22','user22@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0'),
		(23,'user23','user23@correo.com','pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112',_binary '\0');

        
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
    
    INSERT INTO agendas(Usuario)
    VALUES(p_Usuario);
    
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
CREATE PROCEDURE `SP_SelectTareasUsuario`(IN p_Usuario varchar(15))
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
        tar.Descripcion, 
        tar.Comentarios, 
        tar.Estado, 
        tar.Fecha_Creacion, 
        tar.Fecha_Cierre
FROM usuarios AS usu LEFT JOIN agendas  AS age ON usu.Usuario = age.Usuario LEFT JOIN tareas AS tar ON age.Id_Agenda = tar.Id_Agenda1
WHERE usu.Usuario = p_Usuario
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
