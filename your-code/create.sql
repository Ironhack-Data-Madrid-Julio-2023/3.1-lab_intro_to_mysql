--- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons` (
  `id_salespersons` INT NOT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_salespersons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `id_customers` INT NOT NULL,
  `customer_id` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postal` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_customers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `id_cars` INT NOT NULL,
  `vin` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` YEAR(4) NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `salespersons_id Salespersons` INT NOT NULL,
  `customers_id_customers` INT NOT NULL,
  PRIMARY KEY (`id_cars`, `salespersons_id Salespersons`, `customers_id_customers`),
  INDEX `fk_cars_salespersons1_idx` (`salespersons_id Salespersons` ASC) VISIBLE,
  INDEX `fk_cars_customers1_idx` (`customers_id_customers` ASC) VISIBLE,
  CONSTRAINT `fk_cars_salespersons1`
    FOREIGN KEY (`salespersons_id Salespersons`)
    REFERENCES `mydb`.`salespersons` (`id_salespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_customers1`
    FOREIGN KEY (`customers_id_customers`)
    REFERENCES `mydb`.`customers` (`id_customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `id_invoices` INT NOT NULL,
  `id` INT NULL DEFAULT NULL,
  `invoice_number` INT NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `car` VARCHAR(45) NULL DEFAULT NULL,
  `customer` VARCHAR(45) NULL DEFAULT NULL,
  ` sales_person` VARCHAR(45) NULL DEFAULT NULL,
  `salespersons_id Salespersons` INT NOT NULL,
  `cars_id_cars` INT NOT NULL,
  `customers_id_customers` INT NOT NULL,
  PRIMARY KEY (`id_invoices`, `salespersons_id Salespersons`, `cars_id_cars`, `customers_id_customers`),
  INDEX `fk_invoices_salespersons_idx` (`salespersons_id Salespersons` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_id_cars` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_id_customers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salespersons`
    FOREIGN KEY (`salespersons_id Salespersons`)
    REFERENCES `mydb`.`salespersons` (`id_salespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_id_cars`)
    REFERENCES `mydb`.`cars` (`id_cars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_id_customers`)
    REFERENCES `mydb`.`customers` (`id_customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons_has_customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons_has_customers` (
  `salespersons_id_salespersons` INT NOT NULL,
  `customers_id_customers` INT NOT NULL,
  PRIMARY KEY (`salespersons_id_salespersons`, `customers_id_customers`),
  INDEX `fk_salespersons_has_customers_customers1_idx` (`customers_id_customers` ASC) VISIBLE,
  INDEX `fk_salespersons_has_customers_salespersons1_idx` (`salespersons_id_salespersons` ASC) VISIBLE,
  CONSTRAINT `fk_salespersons_has_customers_salespersons1`
    FOREIGN KEY (`salespersons_id_salespersons`)
    REFERENCES `mydb`.`salespersons` (`id_salespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salespersons_has_customers_customers1`
    FOREIGN KEY (`customers_id_customers`)
    REFERENCES `mydb`.`customers` (`id_customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

