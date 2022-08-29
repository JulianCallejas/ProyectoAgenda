-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2022 a las 13:40:17
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agendapp`
--
CREATE DATABASE IF NOT EXISTS `agendapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `agendapp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendas`
--

DROP TABLE IF EXISTS `agendas`;
CREATE TABLE `agendas` (
  `Id_Agenda` int(11) NOT NULL,
  `Usuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `Id_Empleado` varchar(12) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

DROP TABLE IF EXISTS `tareas`;
CREATE TABLE `tareas` (
  `Id_tarea` int(11) NOT NULL,
  `Usuario` varchar(45) NOT NULL,
  `Creadapor` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Final` time NOT NULL,
  `Titulo_Tarea` varchar(45) NOT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  `Comentarios` text,
  `Estado` varchar(45) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Fecha_Cerrie` datetime NOT NULL,
  `Id_Agenda1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contrasena` char(102) NOT NULL,
  `Administrador` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Usuario`, `Email`, `Contrasena`, `Administrador`) VALUES
(1, 'angel', 'pedro@gmail.com', 'pbkdf2:sha256:260000$LMxugUi9GxdqdTYx$059a5efa2c51c1e05f3932062960653770cfcaf3fea56a425d8648b9b0fee112', b'0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`Id_Agenda`),
  ADD UNIQUE KEY `Usuario_UNIQUE` (`Usuario`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_Empleado`),
  ADD UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  ADD UNIQUE KEY `Id_Empleado_UNIQUE` (`Id_Empleado`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`Id_tarea`,`Id_Agenda1`),
  ADD UNIQUE KEY `Id_tarea_UNIQUE` (`Id_tarea`),
  ADD KEY `fk_Tareas_Agendas1_idx` (`Id_Agenda1`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `Usuario` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `Usuario1` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `fk_Tareas_Agendas1` FOREIGN KEY (`Id_Agenda1`) REFERENCES `agendas` (`Id_Agenda`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
