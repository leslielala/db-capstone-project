-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GlobalSuperStore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GlobalSuperStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GlobalSuperStore` DEFAULT CHARACTER SET utf8 ;
USE `GlobalSuperStore` ;

-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `BookingID` INT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `GlobalSuperStore`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisines` VARCHAR(45) NULL,
  `Starters` VARCHAR(45) NULL,
  `Courses` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  `Desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Staff` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(45) NOT NULL,
  `Salary` INT NULL,
  `Role` VARCHAR(45) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL,
  `BookingID` INT NULL,
  `OrderDate` DATE NOT NULL,
  `OrderQuantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `MenuID` INT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `GlobalSuperStore`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `GlobalSuperStore`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `GlobalSuperStore`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GlobalSuperStore`.`Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GlobalSuperStore`.`Delivery_Status` (
  `DeliveryID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `GlobalSuperStore`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `GlobalSuperStore`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
