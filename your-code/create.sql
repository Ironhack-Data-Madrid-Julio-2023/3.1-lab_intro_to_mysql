-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Manolo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Manolo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Manolo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Manolo` ;

-- -----------------------------------------------------
-- Table `Manolo`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`cars` (
  `cars_id` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`cars_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manolo`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`customers` (
  `cust_id` INT NOT NULL,
  `customer_ID` SMALLINT(6) NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `st_or_prov` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` SMALLINT(6) NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manolo`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`salespersons` (
  `salesp_id` INT NOT NULL,
  `staff_ID` SMALLINT(6) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salesp_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manolo`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`invoices` (
  `inv_id` INT NOT NULL,
  `invoice_num` INT NULL,
  `date` DATE NULL,
  `cust_id` INT NOT NULL,
  `salesp_id` INT NOT NULL,
  `cars_id` INT NOT NULL,
  PRIMARY KEY (`inv_id`, `cust_id`, `salesp_id`, `cars_id`),
  INDEX `fk_invoices_customers_idx` (`cust_id` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salesp_id` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customers`
    FOREIGN KEY (`cust_id`)
    REFERENCES `Manolo`.`customers` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salesp_id`)
    REFERENCES `Manolo`.`salespersons` (`salesp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_id`)
    REFERENCES `Manolo`.`cars` (`cars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

