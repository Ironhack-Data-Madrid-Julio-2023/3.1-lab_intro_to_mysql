-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `idcustomers` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invoices_number` INT NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `car` INT NULL DEFAULT NULL,
  `customer` INT NULL DEFAULT NULL,
  `sales_person` INT NULL DEFAULT NULL,
  `cars_idcars` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idinvoices`, `cars_idcars`, `customers_idcustomers`),
  INDEX `fk_invoices_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `mydb`.`cars` (`idcars`),
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons` (
  `idsalespersons` INT NOT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `strore` VARCHAR(45) NULL DEFAULT NULL,
  `invoices_idinvoices` INT NOT NULL,
  PRIMARY KEY (`idsalespersons`, `invoices_idinvoices`),
  INDEX `fk_salespersons_invoices_idx` (`invoices_idinvoices` ASC) VISIBLE,
  CONSTRAINT `fk_salespersons_invoices`
    FOREIGN KEY (`invoices_idinvoices`)
    REFERENCES `mydb`.`invoices` (`idinvoices`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `idcars` INT NOT NULL,
  `vin` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `salespersons_idsalespersons` INT NOT NULL,
  `salespersons_invoices_idinvoices` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idcars`, `salespersons_idsalespersons`, `salespersons_invoices_idinvoices`, `customers_idcustomers`),
  INDEX `fk_cars_salespersons1_idx` (`salespersons_idsalespersons` ASC, `salespersons_invoices_idinvoices` ASC) VISIBLE,
  INDEX `fk_cars_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_cars_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`),
  CONSTRAINT `fk_cars_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons` , `salespersons_invoices_idinvoices`)
    REFERENCES `mydb`.`salespersons` (`idsalespersons` , `invoices_idinvoices`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons_has_customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons_has_customers` (
  `salespersons_idsalespersons` INT NOT NULL,
  `salespersons_invoices_idinvoices` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`salespersons_idsalespersons`, `salespersons_invoices_idinvoices`, `customers_idcustomers`),
  INDEX `fk_salespersons_has_customers_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_salespersons_has_customers_salespersons1_idx` (`salespersons_idsalespersons` ASC, `salespersons_invoices_idinvoices` ASC) VISIBLE,
  CONSTRAINT `fk_salespersons_has_customers_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`),
  CONSTRAINT `fk_salespersons_has_customers_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons` , `salespersons_invoices_idinvoices`)
    REFERENCES `mydb`.`salespersons` (`idsalespersons` , `invoices_idinvoices`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

