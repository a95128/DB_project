
-- ------------------------------------------------------
-- ------------------------------------------------------
-- Universidade do Minho
-- Licenciatura em Engenharia Informatica
-- Unidade Curricular de Bases de Dados
-- Caso de Estudo: LEIvraria
-- Criação do Esquema Físico
-- Maio e Junho/2023
-- ------------------------------------------------------
-- ------------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Livraria
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `Livraria` DEFAULT CHARACTER SET utf8 ;
USE `Livraria` ;

-- -----------------------------------------------------
-- Table `Livraria`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Autor` (
  `idAutor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Editora` (
  `idEditora` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEditora`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Formato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Formato` (
  `Formato ID` INT NOT NULL,
  `Digital` INT NOT NULL,
  `Fisico` INT NOT NULL,
  PRIMARY KEY (`Formato ID`)
)
ENGINE = InnoDB;



 -- -----------------------------------------------------
-- Table `Livraria`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Estado` (
  `Estado ID` INT NOT NULL,
  `Disponivel` INT NOT NULL,
  `Esgotado` INT NOT NULL,
  PRIMARY KEY (`Estado ID`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Livraria`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Livro` (
  `ID` INT NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Formato` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Autor` INT NOT NULL,
  `Editora` INT NOT NULL,
  `Edição` VARCHAR(45) NOT NULL,
  `Rating` INT NOT NULL,
  `Preço` DECIMAL(5,2) NOT NULL,
  `Estado` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `autor_idx` (`Autor` ASC) VISIBLE,
  INDEX `editora_idx` (`Editora` ASC) VISIBLE,
  INDEX `formato_idx` (`Formato` ASC) VISIBLE,
  INDEX `estado_idx` (`Estado` ASC) VISIBLE,
  CONSTRAINT `fk_autor`
    FOREIGN KEY (`Autor`)
    REFERENCES `Livraria`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_editora`
    FOREIGN KEY (`Editora`)
    REFERENCES `Livraria`.`Editora` (`idEditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato`
    FOREIGN KEY (`Formato`)
    REFERENCES `Livraria`.`Formato` (`Formato ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado`
    FOREIGN KEY (`Estado`)
    REFERENCES `Livraria`.`Estado` (`Estado ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Função`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Função` (
  `Funcionario ID` INT NOT NULL,
  `Entregador` VARCHAR(45) NOT NULL,
  `Livreiro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Funcionario ID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Funcionario` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Palavra-Passe` VARCHAR(45) NOT NULL,
  `IBAN` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `N da Porta` VARCHAR(45) NOT NULL,
  `Codigo Postal` VARCHAR(45) NOT NULL,
  `função` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `funçao_idx` (`função` ASC) VISIBLE,
  CONSTRAINT `fk_funcao`
    FOREIGN KEY (`função`)
    REFERENCES `Livraria`.`Função` (`Funcionario ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Compra` (
  `ID` INT NOT NULL,
  `Preço Consumidor` DECIMAL(5,2) NOT NULL,
  `Preço Custo` DECIMAL(5,2) NOT NULL,
  `Data` DATETIME NOT NULL,
  `Lucro` DECIMAL(5,2) NOT NULL,
  `Modo de compra` VARCHAR(45) NOT NULL,
  `Metodo de Pagamento` VARCHAR(45) NOT NULL,
  `Livro ID` INT NOT NULL,
  `Funcionario ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Livro ID_idx` (`Livro ID` ASC) VISIBLE,
  INDEX `Funcionario ID_idx` (`Funcionario ID` ASC) VISIBLE,
  CONSTRAINT `fk_livro_id`
    FOREIGN KEY (`Livro ID`)
    REFERENCES `Livraria`.`Livro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_id`
    FOREIGN KEY (`Funcionario ID`)
    REFERENCES `Livraria`.`Funcionario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Cliente` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Palavra-Passe` VARCHAR(45) NOT NULL,
  `Numero de telemovel` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Codigo Postal` VARCHAR(45) NOT NULL,
  `N da Porta` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`CompraLivro`
-- -----------------------------------------------------
 
CREATE TABLE IF NOT EXISTS `Livraria`.`CompraLivro` (
  `idCompraLivro` INT NOT NULL,
  `Cliente ID` INT NOT NULL,
  `Compra ID` INT NOT NULL,
  PRIMARY KEY (`idCompraLivro`),
  INDEX `cliente_id_idx` (`Cliente ID` ASC) VISIBLE,
  INDEX `compra_id_idx` (`Compra ID` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_id`
    FOREIGN KEY (`Cliente ID`)
    REFERENCES `Livraria`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_id`
    FOREIGN KEY (`Compra ID`)
    REFERENCES `Livraria`.`Compra` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


CREATE INDEX IDAutor ON Autor(idAutor);
CREATE INDEX NomeAutor ON Autor(nome);
CREATE INDEX TituloLivro ON Livro(Titulo);
CREATE INDEX IDCompra ON Compra(ID);
CREATE INDEX IDCliente ON Cliente(ID);

-- ------------------------------------------------------
-- <fim>
-- GRUPO 33
-- ------------------------------------------------------

DROP TABLE IF EXISTS `Livraria`.`CompraLivro`;
DROP TABLE IF EXISTS `Livraria`.`Cliente`;
DROP TABLE IF EXISTS `Livraria`.`Compra`;
DROP TABLE IF EXISTS `Livraria`.`Funcionario`;
DROP TABLE IF EXISTS `Livraria`.`Função`;
DROP TABLE IF EXISTS `Livraria`.`Livro`;
DROP TABLE IF EXISTS `Livraria`.`Estado`;
DROP TABLE IF EXISTS `Livraria`.`Formato`;
DROP TABLE IF EXISTS `Livraria`.`Editora`;
DROP TABLE IF EXISTS `Livraria`.`Autor`;
drop database `Livraria`; 
TRUNCATE TABLE `Livraria`.`Cliente`;
select * FROM `Livraria`.`Cliente`;
select * FROM `Livraria`.`Autor`;