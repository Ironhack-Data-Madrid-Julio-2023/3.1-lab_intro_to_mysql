-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CARS` (
  `cars_id` INT NOT NULL,
  `model` VARCHAR(45) NULL,
  `brand` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  PRIMARY KEY (`cars_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CUSTOMER` (
  `cust_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `zip` INT NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`SALESPERSON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`SALESPERSON` (
  `id_sales` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sales`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`INVOICE` (
  `inv_id` INT NOT NULL,
  `DATE` DATETIME NULL,
  `CARS_cars_id` INT NOT NULL,
  `CUSTOMER_cust_id` INT NOT NULL,
  `SALESPERSON_id_sales` INT NOT NULL,
  PRIMARY KEY (`inv_id`, `CARS_cars_id`, `CUSTOMER_cust_id`, `SALESPERSON_id_sales`),
  INDEX `fk_INVOICE_CARS1_idx` (`CARS_cars_id` ASC) VISIBLE,
  INDEX `fk_INVOICE_CUSTOMER1_idx` (`CUSTOMER_cust_id` ASC) VISIBLE,
  INDEX `fk_INVOICE_SALESPERSON1_idx` (`SALESPERSON_id_sales` ASC) VISIBLE,
  CONSTRAINT `fk_INVOICE_CARS1`
    FOREIGN KEY (`CARS_cars_id`)
    REFERENCES `lab_mysql`.`CARS` (`cars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVOICE_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_cust_id`)
    REFERENCES `lab_mysql`.`CUSTOMER` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVOICE_SALESPERSON1`
    FOREIGN KEY (`SALESPERSON_id_sales`)
    REFERENCES `lab_mysql`.`SALESPERSON` (`id_sales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
