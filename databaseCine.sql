-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cine` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema cine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cine` DEFAULT CHARACTER SET utf8 ;
USE `Cine` ;

-- -----------------------------------------------------
-- Table `Cine`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cine`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cine`.`Pelicula` (
  `id` BIGINT(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` TEXT(100) NOT NULL,
  `sinopsis` TEXT(100) NOT NULL,
  `raiting` INT(10) NOT NULL,
  `fecha de registro` DATETIME NOT NULL,
  `fecha de actualizacion` DATETIME NOT NULL,
  `estado` TINYINT(10) NOT NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `Cine`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `categoria_idx` ON `Cine`.`Pelicula` (`categoria` ASC) VISIBLE;

USE `cine` ;

-- -----------------------------------------------------
-- Table `cine`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine`.`categoria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cine`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine`.`pelicula` (
  `id` BIGINT(45) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `sinopsis` TEXT NOT NULL,
  `raiting` INT(10) NOT NULL,
  `fecha_de_registro` DATETIME NOT NULL,
  `fecha_de_actualizacion` DATETIME NOT NULL,
  `estado` TINYINT(10) NOT NULL,
  `categoria` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `cine`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `categoria` ON `cine`.`pelicula` (`categoria` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
