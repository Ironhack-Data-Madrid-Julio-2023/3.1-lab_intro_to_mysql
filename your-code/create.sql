-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema negocio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema negocio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `negocio` DEFAULT CHARACTER SET latin1 ;
USE `negocio` ;

-- -----------------------------------------------------
-- Table `negocio`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `negocio`.`cliente` (
  `idcliente` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `num telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `dirección` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `estado/provincia` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocio`.`coches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `negocio`.`coches` (
  `id` VARCHAR(45) NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `fabricante` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `año` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocio`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `negocio`.`facturas` (
  `id` VARCHAR(45) NOT NULL,
  `num de factura` VARCHAR(45) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `coche` VARCHAR(45) NOT NULL,
  `cliente` VARCHAR(45) NOT NULL,
  `persona de venta` VARCHAR(45) NOT NULL,
  `cliente_id` VARCHAR(45) NOT NULL,
  `coches_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `cliente_id`, `coches_id`),
  INDEX `fk_facturas_cliente_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_facturas_coches1_idx` (`coches_id` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `negocio`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_coches1`
    FOREIGN KEY (`coches_id`)
    REFERENCES `negocio`.`coches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocio`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `negocio`.`vendedores` (
  `id` VARCHAR(45) NOT NULL,
  `id personal` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `almacen` VARCHAR(45) NOT NULL,
  `facturas_id` VARCHAR(45) NOT NULL,
  `facturas_cliente_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `facturas_id`, `facturas_cliente_id`),
  INDEX `fk_vendedores_facturas1_idx` (`facturas_id` ASC, `facturas_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_vendedores_facturas1`
    FOREIGN KEY (`facturas_id` , `facturas_cliente_id`)
    REFERENCES `negocio`.`facturas` (`id` , `cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
