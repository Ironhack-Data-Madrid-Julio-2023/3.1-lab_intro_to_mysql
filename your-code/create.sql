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
-- Table `cars_company`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`cars` (
  `idcars` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`customers` (
  `idcustomers` INT NOT NULL,
  `Customer ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `CIty` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Salespersons` (
  `idSalespersons` INT NOT NULL,
  `Staff ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSalespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  `Salespersons_idSalespersons` INT NOT NULL,
  `cars_idcars` INT NOT NULL,
  PRIMARY KEY (`idInvoices`, `customers_idcustomers`, `Salespersons_idSalespersons`, `cars_idcars`),
  INDEX `fk_Invoices_customers_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_idSalespersons` ASC) VISIBLE,
  INDEX `fk_Invoices_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_customers`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `cars_company`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_idSalespersons`)
    REFERENCES `cars_company`.`Salespersons` (`idSalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `cars_company`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
