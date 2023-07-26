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
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `cars_id` INT NOT NULL,
  `vin` VARCHAR(45) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `	model` VARCHAR(45) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cars_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customers_id` INT NOT NULL,
  `custom_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customers_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons` (
  `salespersons_id` INT NOT NULL,
  `staff_id` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salespersons_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `id` INT NOT NULL,
  `invoice_number` INT NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `cars_id` INT NOT NULL,
  `customers_id` INT NOT NULL,
  `salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cars_id`, `customers_id`, `salespersons_id`),
  INDEX `fk_invoices_cars_idx` (`cars_id` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_id`)
    REFERENCES `mydb`.`cars` (`cars_id`),
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `mydb`.`customers` (`customers_id`),
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_id`)
    REFERENCES `mydb`.`salespersons` (`salespersons_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`cars`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan	', 2019, 'Blue');
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (1, 'ZM8G7BEUQZ97IH46V	', 'Peugeot', 'Rifter', 2019, 'Red');
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White');
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver');
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray');
INSERT INTO `mydb`.`cars` (`cars_id`, `vin`, `manufacturer`, `	model`, `year`, `color`) VALUES (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country	', 2019, 'Gray');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`customers` (`customers_id`, `custom_id`, `name`, `phone`, `email`, `address`, `city`, `state_province`, `country`) VALUES (0, 10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', NULL);
INSERT INTO `mydb`.`customers` (`customers_id`, `custom_id`, `name`, `phone`, `email`, `address`, `city`, `state_province`, `country`) VALUES (1, 20001, 'Hedy Lamarr', '+43 1 514442250', '-', '	Weiglgasse 10', 'Viena', 'Vienna', NULL);
INSERT INTO `mydb`.`customers` (`customers_id`, `custom_id`, `name`, `phone`, `email`, `address`, `city`, `state_province`, `country`) VALUES (2, 30001, 'Katherine Johnson', '+1 202 358 0000', '-', '300 E St SW', 'Washington, DC	', 'Washington', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`salespersons`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (0, '00001', 'Petey Cruiser	', 'Madrid');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (1, '	00002', 'Anna Sthesia	', 'Barcelona');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (2, '00003', '	Paul Molive', 'Berlin');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (3, '00004', 'Gail Forcewind', 'Paris');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (4, '00005', 'Paige Turner	', 'Mimia');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (5, '00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (6, '	00007', '	Walter Melon', 'Amsterdam');
INSERT INTO `mydb`.`salespersons` (`salespersons_id`, `staff_id`, `name`, `store`) VALUES (7, '00008', 'Shonda Leer', 'São Paulo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`invoices`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (0, 3K096I98581DHSNUP, 'Volkswagen', Tiguan, 2019, Blue);
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (1, ZM8G7BEUQZ97IH46V, 'Peugeot', Rifter, 2019, Red);
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (2, RKXVNNIHLVVZOUB4M, 'Ford', Fusion, 2018, White);
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (3, HKNDGS7CU31E9Z7JW, 'Toyota', RAV4, 2018, Silver);
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (4, DAM41UDN3CHU2WVF6, 'Volvo', V60, 2019, Gray);
INSERT INTO `mydb`.`invoices` (`id`, `invoice_number`, `date`, `cars_id`, `customers_id`, `salespersons_id`) VALUES (5, DAM41UDN3CHU2WVF6, 'Volvo', V60 Cross Country	, 2019, Gray);

COMMIT;



