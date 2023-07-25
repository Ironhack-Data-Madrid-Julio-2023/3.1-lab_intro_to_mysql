-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars_company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cars_company` ;

-- -----------------------------------------------------
-- Table `cars_company`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Cars` (
  `VIN` INT NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Customers` (
  `idCustomers` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state/province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip/postal code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Salespersons` (
  `staff id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `invoice number` VARCHAR(45) NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `Cars_VIN` INT NOT NULL,
  `Customers_idCustomers` INT NOT NULL,
  `Salespersons_staff id` INT NOT NULL,
  PRIMARY KEY (`idInvoices`, `Cars_VIN`, `Customers_idCustomers`, `Salespersons_staff id`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idCustomers` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_staff id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `cars_company`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `cars_company`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_staff id`)
    REFERENCES `cars_company`.`Salespersons` (`staff id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
