

-- -----------------------------------------------------
-- Schema comercio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comercio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comercio` DEFAULT CHARACTER SET utf8 ;
USE `comercio` ;

-- -----------------------------------------------------
-- Table `comercio`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comercio`.`categorias` (
  `idcategorias` INT NOT NULL,
  `desCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comercio`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comercio`.`produtos` (
  `idprodutos` INT NOT NULL,
  `desProduto` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `qtdade` INT NOT NULL,
  `foto` LONGBLOB NOT NULL,
  `categorias_idcategorias` INT NOT NULL,
  PRIMARY KEY (`idprodutos`),
  CONSTRAINT `fk_produtos_categorias`
    FOREIGN KEY (`categorias_idcategorias`)
    REFERENCES `comercio`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comercio`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comercio`.`clientes` (
  `idclientes` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comercio`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comercio`.`pedidos` (
  `idpedidos` INT NOT NULL,
  `data` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `sessao` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `comercio`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comercio`.`pedidoItens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comercio`.`pedidoItens` (
  `idpedidoItens` INT NOT NULL,
  `qtdade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  `toal` FLOAT NOT NULL,
  `produtos_idprodutos` INT NOT NULL,
  `pedidos_idpedidos` INT NOT NULL,
  PRIMARY KEY (`idpedidoItens`),
  CONSTRAINT `fk_pedidoItens_produtos1`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `comercio`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoItens_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `comercio`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
