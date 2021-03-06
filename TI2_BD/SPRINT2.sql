-- MySQL Script generated by MySQL Workbench
-- Thu Apr  7 18:11:04 2022
-- Model: New Model    Version: 1.0
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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuário` (
  `idUsuário` INT(10) NOT NULL,
  `E-mail` CHAR(45) NOT NULL,
  `Senha` CHAR(45) NOT NULL,
  `Doadores_CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`idUsuário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Receptores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receptores` (
  `idReceptores` INT NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Nome` CHAR(45) NULL,
  `Tipo Sanguineo` CHAR(45) NULL,
  `Sobrenome` CHAR(45) NULL,
  `Telefone` CHAR(45) NULL,
  `Foto` CHAR(45) NULL,
  `Usuário_iD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReceptores`, `CPF`),
  CONSTRAINT `fk_Receptores_Usuário1`
    FOREIGN KEY (`Usuário_iD`)
    REFERENCES `mydb`.`Usuário` (`idUsuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mydb`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereço` (
  `CEP` INT NOT NULL,
  `Rua` CHAR(20) NULL,
  `Bairro` CHAR(20) NULL,
  `Numero` CHAR(20) NULL,
  `Complemento` CHAR(20) NULL,
  PRIMARY KEY (`CEP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doadores` (
  `idDoadores` INT(10) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Nome` CHAR(60) NULL,
  `Sobrenome` CHAR(60) NULL,
  `Telefone` INT(13) NULL,
  `Foto` VARCHAR(45) NULL,
  `Endereço_CEP` INT NOT NULL,
  `Usuário_iD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDoadores`, `CPF`),
  CONSTRAINT `fk_Doadores_Endereço`
    FOREIGN KEY (`Endereço_CEP`)
    REFERENCES `mydb`.`Endereço` (`CEP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doadores_Usuário1`
    FOREIGN KEY (`Usuário_iD`)
    REFERENCES `mydb`.`Usuário` (`idUsuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Instituição`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituição` (
  `idInstituição` CHAR(45) NOT NULL,
  `Endereço` CHAR(60) NOT NULL,
  `Telefone` CHAR(20) NOT NULL,
  `Agendamento` CHAR(45) NULL,
  `Nome` CHAR(45) NULL,
  `Receptores_idReceptores` INT NOT NULL,
  `Doadores_CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`idInstituição`),
  CONSTRAINT `fk_Instituição_Receptores1`
    FOREIGN KEY (`Receptores_idReceptores`)
    REFERENCES `mydb`.`Receptores` (`idReceptores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instituição_Doadores1`
    FOREIGN KEY (`Doadores_CPF`)
    REFERENCES `mydb`.`Doadores` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Informação_Centro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Informação_Centro` (
  `Tipo sanguineo` CHAR(3) NOT NULL,
  `Horário` INT(6) NULL,
  `Dias` CHAR(45) NULL,
  `Instituição_Endereço` CHAR(60) NOT NULL,
  CONSTRAINT `fk_Informação_Centro_Instituição1`
    FOREIGN KEY (`Instituição_Endereço`)
    REFERENCES `mydb`.`Instituição` (`Endereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
