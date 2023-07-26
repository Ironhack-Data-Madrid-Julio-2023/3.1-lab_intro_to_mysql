-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ManoloDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ManoloDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ManoloDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ManoloDB` ;

-- -----------------------------------------------------
-- Table `ManoloDB`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ManoloDB`.`Cars` (
  `idCars` INT NOT NULL,
  `Vin` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ManoloDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ManoloDB`.`Customers` (
  `idCustomers` INT NOT NULL,
  `customer_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` INT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ManoloDB`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ManoloDB`.`salespersons` (
  `id` INT NOT NULL,
  `staff_id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ManoloDB`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ManoloDB`.`invoices` (
  `id` INT NOT NULL,
  `invoice_number` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `Car` INT NOT NULL,
  `salespersons_id` INT NOT NULL,
  `customer` INT NOT NULL,
  PRIMARY KEY (`id`, `Car`, `salespersons_id`, `customer`),
  INDEX `fk_invoices_Cars_idx` (`Car` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_id` ASC) VISIBLE,
  INDEX `fk_invoices_Customers1_idx` (`customer` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_Cars`
    FOREIGN KEY (`Car`)
    REFERENCES `ManoloDB`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_id`)
    REFERENCES `ManoloDB`.`salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_Customers1`
    FOREIGN KEY (`customer`)
    REFERENCES `ManoloDB`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
