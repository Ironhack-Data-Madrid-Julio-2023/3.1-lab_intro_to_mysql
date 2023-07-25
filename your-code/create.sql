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
-- -----------------------------------------------------
-- Schema manolo
-- -----------------------------------------------------
USE `Manolo` ;

-- -----------------------------------------------------
-- Table `Manolo`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`Cars` (
  `car_id` INT NOT NULL,
  `VIN` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Manolo`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`Customers` (
  `cust_key` INT NOT NULL,
  `cust_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` INT NULL,
  PRIMARY KEY (`cust_key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Manolo`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`Salesperson` (
  `salep_id` INT NOT NULL,
  `staff_id` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salep_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Manolo`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Manolo`.`Invoice` (
  `invoice_id` INT NOT NULL,
  `Invoice_num` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `Cars_car_id` INT NOT NULL,
  `Salesperson_salep_id` INT NOT NULL,
  `Customers_cust_key` INT NOT NULL,
  PRIMARY KEY (`invoice_id`, `Cars_car_id`, `Salesperson_salep_id`, `Customers_cust_key`),
  INDEX `fk_Invoice_Cars1_idx` (`Cars_car_id` ASC) VISIBLE,
  INDEX `fk_Invoice_Salesperson1_idx` (`Salesperson_salep_id` ASC) VISIBLE,
  INDEX `fk_Invoice_Customers1_idx` (`Customers_cust_key` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_car_id`)
    REFERENCES `Manolo`.`Cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Salesperson1`
    FOREIGN KEY (`Salesperson_salep_id`)
    REFERENCES `Manolo`.`Salesperson` (`salep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customers1`
    FOREIGN KEY (`Customers_cust_key`)
    REFERENCES `Manolo`.`Customers` (`cust_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


