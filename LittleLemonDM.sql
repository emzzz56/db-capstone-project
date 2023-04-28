-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(200) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Addresses` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `Street` VARCHAR(200) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `DelieveryID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`DelieveryID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `LittleLemonDB`.`Addresses` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuType` (
  `MenuTypeID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`MenuTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(225) NULL,
  `TypeID` INT NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuType_idx` (`TypeID` ASC) VISIBLE,
  CONSTRAINT `MenuType`
    FOREIGN KEY (`TypeID`)
    REFERENCES `LittleLemonDB`.`MenuType` (`MenuTypeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `TotalCost` DECIMAL NULL,
  `CustomerID` INT NULL,
  `DeliveryID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `DeliveryID_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrdersCustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DeliveryID`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery` (`DelieveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(225) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL NULL,
  `Email` VARCHAR(225) NULL,
  `Phone` VARCHAR(45) NULL,
  `Address` VARCHAR(225) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `BookingsCustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
