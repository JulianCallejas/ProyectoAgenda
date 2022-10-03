-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema agendapp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agendapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agendapp` DEFAULT CHARACTER SET utf8mb3 ;
USE `agendapp` ;

-- -----------------------------------------------------
-- Table `agendapp`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendapp`.`usuario` (
  `Usuario` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Administrador` BIT(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Usuario`),
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `agendapp`.`agendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendapp`.`agendas` (
  `Id_Agenda` INT NOT NULL,
  `Usuario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Id_Agenda`),
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  CONSTRAINT `Usuario`
    FOREIGN KEY (`Usuario`)
    REFERENCES `agendapp`.`usuario` (`Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `agendapp`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendapp`.`empleados` (
  `Id_Empleado` VARCHAR(12) NOT NULL,
  `Usuario` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Cargo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Empleado`),
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  UNIQUE INDEX `Id_Empleado_UNIQUE` (`Id_Empleado` ASC) VISIBLE,
  CONSTRAINT `Usuario1`
    FOREIGN KEY (`Usuario`)
    REFERENCES `agendapp`.`usuario` (`Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `agendapp`.`tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendapp`.`tareas` (
  `Id_tarea` INT NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Creadapor` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Hora_Inicio` TIME NOT NULL,
  `Hora_Final` TIME NOT NULL,
  `Titulo_Tarea` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(45) NULL DEFAULT NULL,
  `Comentarios` TEXT NULL DEFAULT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Fecha_Creacion` DATETIME NOT NULL,
  `Fecha_Cerrie` DATETIME NOT NULL,
  `Id_Agenda1` INT NOT NULL,
  PRIMARY KEY (`Id_tarea`, `Id_Agenda1`),
  UNIQUE INDEX `Id_tarea_UNIQUE` (`Id_tarea` ASC) VISIBLE,
  INDEX `fk_Tareas_Agendas1_idx` (`Id_Agenda1` ASC) VISIBLE,
  CONSTRAINT `fk_Tareas_Agendas1`
    FOREIGN KEY (`Id_Agenda1`)
    REFERENCES `agendapp`.`agendas` (`Id_Agenda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
