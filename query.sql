-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel_mine
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hotel_mine` ;

-- -----------------------------------------------------
-- Schema hotel_mine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_mine` DEFAULT CHARACTER SET utf8 ;
USE `hotel_mine` ;

-- -----------------------------------------------------
-- Table `hotel_mine`.`guests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_mine`.`guests` ;

CREATE TABLE IF NOT EXISTS `hotel_mine`.`guests` (
  `guest_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `size_of_party` INT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guest_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_mine`.`room_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_mine`.`room_type` ;

CREATE TABLE IF NOT EXISTS `hotel_mine`.`room_type` (
  `type_id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NULL,
  `description` BLOB NULL,
  `base_price` DECIMAL(4,2) NULL,
  `max_occupant` INT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_mine`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_mine`.`rooms` ;

CREATE TABLE IF NOT EXISTS `hotel_mine`.`rooms` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_number` INT NULL,
  `floor` INT NULL,
  `type_id` INT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `type_fk_rooms_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `type_fk_rooms`
    FOREIGN KEY (`type_id`)
    REFERENCES `hotel_mine`.`room_type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_mine`.`reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_mine`.`reservations` ;

CREATE TABLE IF NOT EXISTS `hotel_mine`.`reservations` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `confirmation_num` INT NOT NULL,
  `check_in` DATETIME NOT NULL,
  `check_out` DATETIME NULL,
  `invoice` DECIMAL(5,2) NULL,
  `room_id` INT NULL,
  `guests_guest_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `rooms_fk_reservations_idx` (`room_id` ASC) VISIBLE,
  INDEX `fk_reservations_guests1_idx` (`guests_guest_id` ASC) VISIBLE,
  CONSTRAINT `rooms_fk_reservations`
    FOREIGN KEY (`room_id`)
    REFERENCES `hotel_mine`.`rooms` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_guests1`
    FOREIGN KEY (`guests_guest_id`)
    REFERENCES `hotel_mine`.`guests` (`guest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
