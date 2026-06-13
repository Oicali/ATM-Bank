-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema atm_bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atm_bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atm_bank` DEFAULT CHARACTER SET utf8mb4 ;
USE `atm_bank` ;

-- -----------------------------------------------------
-- Table `atm_bank`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm_bank`.`users` (
  `user_id` VARCHAR(12) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `pin` VARCHAR(6) NOT NULL COMMENT 'Only one PIN is needed for both account',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm_bank`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm_bank`.`accounts` (
  `user_id` VARCHAR(12) NOT NULL,
  `account_type` ENUM('Savings', 'Checking') NOT NULL,
  `balance` DECIMAL(10,2) NOT NULL DEFAULT 0,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_accounts_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `atm_bank`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm_bank`.`billers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm_bank`.`billers` (
  `biller_id` INT NOT NULL AUTO_INCREMENT,
  `biller_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`biller_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm_bank`.`banks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm_bank`.`banks` (
  `bank_id` INT NOT NULL AUTO_INCREMENT,
  `bank_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bank_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm_bank`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm_bank`.`transactions` (
  `transaction_id` VARCHAR(12) NOT NULL COMMENT 'serves as the reference number',
  `user_id` VARCHAR(12) NOT NULL COMMENT 'Display account type and user full name',
  `account_type` ENUM('Savings', 'Checking') NULL,
  `transaction_type` ENUM('Withdrawal', 'Deposit', 'Bank Transfer', 'Bills Payment') NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `updated_balance` DECIMAL(10,2) NOT NULL COMMENT 'join with accounts table for balance',
  `date_of_transaction` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biller_id` INT NULL COMMENT 'Not required. Only insert value here when bills payment. Display the name of biller',
  `bank_id` INT NULL COMMENT 'Not required. Only insert value the name of selected bank when fund transfer. Display the name of bank',
  `bank_account_id` INT NULL COMMENT 'Not required. Only insert value the account number when fund transfer',
  PRIMARY KEY (`transaction_id`),
  INDEX `biller_id_idx` (`biller_id` ASC) VISIBLE,
  INDEX `bank_id_idx` (`bank_id` ASC) VISIBLE,
  INDEX `fk_transactions_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_biller_id`
    FOREIGN KEY (`biller_id`)
    REFERENCES `atm_bank`.`billers` (`biller_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_bank_id`
    FOREIGN KEY (`bank_id`)
    REFERENCES `atm_bank`.`banks` (`bank_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `atm_bank`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
