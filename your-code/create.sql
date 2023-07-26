create database coches;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`VEHICULO` (
  `idVehículos` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `FABRICANTE` VARCHAR(45) NOT NULL,
  `MODELO` VARCHAR(45) NOT NULL,
  `AÑO` INT NOT NULL,
  `COLOR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVehículos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`CLIENTES` (
  `idCLIENTES` INT NOT NULL,
  `N. DE CLIENTE` INT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `TELEFONO` VARCHAR(45) NULL,
  `CORREO ELECTRONICO` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `CIUDAD` VARCHAR(45) NULL,
  `C.P.` INT NULL,
  `PROVINCIA` VARCHAR(45) NULL,
  `PAIS` VARCHAR(45) NULL,
  PRIMARY KEY (`idCLIENTES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`VENDEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`VENDEDORES` (
  `idVENDEDORES` INT NOT NULL,
  `N. DE VENDEDOR` INT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `OFICINA` VARCHAR(45) NULL,
  PRIMARY KEY (`idVENDEDORES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`FACTURAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`FACTURAS` (
  `idFACTURAS` INT NOT NULL,
  `N. DE FACTURA` INT NULL,
  `FECHA` DATETIME NULL,
  `VIN` VARCHAR(45) NULL,
  `N. DE CLIENTE` INT NULL,
  `N. DE VENDEDOR` INT NULL,
  `FABRICANTE` VARCHAR(45) NULL,
  `MODELO` VARCHAR(45) NULL,
  `VEHICULO_idVehículos` INT NOT NULL,
  `VENDEDORES_idVENDEDORES` INT NOT NULL,
  `CLIENTES_idCLIENTES` INT NOT NULL,
  PRIMARY KEY (`idFACTURAS`, `VEHICULO_idVehículos`, `VENDEDORES_idVENDEDORES`, `CLIENTES_idCLIENTES`),
  INDEX `fk_FACTURAS_VEHICULO_idx` (`VEHICULO_idVehículos` ASC) VISIBLE,
  INDEX `fk_FACTURAS_VENDEDORES1_idx` (`VENDEDORES_idVENDEDORES` ASC) VISIBLE,
  INDEX `fk_FACTURAS_CLIENTES1_idx` (`CLIENTES_idCLIENTES` ASC) VISIBLE,
  CONSTRAINT `fk_FACTURAS_VEHICULO`
    FOREIGN KEY (`VEHICULO_idVehículos`)
    REFERENCES `coches`.`VEHICULO` (`idVehículos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTURAS_VENDEDORES1`
    FOREIGN KEY (`VENDEDORES_idVENDEDORES`)
    REFERENCES `coches`.`VENDEDORES` (`idVENDEDORES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACTURAS_CLIENTES1`
    FOREIGN KEY (`CLIENTES_idCLIENTES`)
    REFERENCES `coches`.`CLIENTES` (`idCLIENTES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
