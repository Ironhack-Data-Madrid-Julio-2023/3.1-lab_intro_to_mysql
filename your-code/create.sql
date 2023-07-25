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
  `idCars` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Customers` (
  `idCustomers` INT NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `StateProvince` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`SalesPerson` (
  `idSalesPerson` INT NOT NULL,
  `StaffID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSalesPerson`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_company`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_company`.`Invoice` (
  `idInvoice` INT NOT NULL,
  `InvoiceNumber` VARCHAR(45) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `SalesPerson_idSalesPerson` INT NOT NULL,
  `Cars_idCars` INT NOT NULL,
  `Customers_idCustomers` INT NOT NULL,
  PRIMARY KEY (`idInvoice`, `SalesPerson_idSalesPerson`, `Cars_idCars`, `Customers_idCustomers`),
  INDEX `fk_Invoice_SalesPerson_idx` (`SalesPerson_idSalesPerson` ASC) VISIBLE,
  INDEX `fk_Invoice_Cars1_idx` (`Cars_idCars` ASC) VISIBLE,
  INDEX `fk_Invoice_Customers1_idx` (`Customers_idCustomers` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_SalesPerson`
    FOREIGN KEY (`SalesPerson_idSalesPerson`)
    REFERENCES `cars_company`.`SalesPerson` (`idSalesPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_idCars`)
    REFERENCES `cars_company`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `cars_company`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
