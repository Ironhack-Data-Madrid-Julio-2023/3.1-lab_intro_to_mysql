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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema vehiculos
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `cars_id` INT NOT NULL,
  `vin` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `	model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`cars_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customers_id` INT NOT NULL,
  `custom_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`customers_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons` (
  `salespersons_id` INT NOT NULL,
  `staff_id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salespersons_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `id` INT NOT NULL,
  `invoice_number` INT NULL,
  `date` DATE NULL,
  `cars_id` INT NOT NULL,
  `customers_id` INT NOT NULL,
  `salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cars_id`, `customers_id`, `salespersons_id`),
  INDEX `fk_invoices_cars_idx` (`cars_id` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_id`)
    REFERENCES `mydb`.`cars` (`cars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `mydb`.`customers` (`customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_id`)
    REFERENCES `mydb`.`salespersons` (`salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

