-- MySQL Script generated by MySQL Workbench
-- Mon May  9 11:43:37 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema medallo_motor_sport_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medallo_motor_sport_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `medallo_motor_sport_bd` DEFAULT CHARACTER SET utf8 ;
USE `medallo_motor_sport_bd` ;

-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`tipos_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`tipos_documento` (
  `tipo_documento` VARCHAR(10) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tipo_documento`),
  UNIQUE INDEX `idtipos_documento_UNIQUE` (`tipo_documento` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`usuarios` (
  `idusuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idusuario`, `tipo_documento`),
  UNIQUE INDEX `idusuarios_UNIQUE` (`idusuario` ASC) ,
  INDEX `fk_usuarios_tipos_documento_idx` (`tipo_documento` ASC) ,
  CONSTRAINT `fk_usuarios_tipos_documento`
    FOREIGN KEY (`tipo_documento`)
    REFERENCES `medallo_motor_sport_bd`.`tipos_documento` (`tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `numero_documento` VARCHAR(15) NOT NULL,
  `primer_nombre` VARCHAR(45) NULL,
  `segundo_nombre` VARCHAR(45) NULL,
  `primer_apellido` VARCHAR(45) NULL,
  `segundo_apellido` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`idcliente`, `tipo_documento`),
  INDEX `fk_clientes_tipos_documento1_idx` (`tipo_documento` ASC) ,
  UNIQUE INDEX `numero_documento_UNIQUE` (`numero_documento` ASC) ,
  CONSTRAINT `fk_clientes_tipos_documento1`
    FOREIGN KEY (`tipo_documento`)
    REFERENCES `medallo_motor_sport_bd`.`tipos_documento` (`tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`categorias` (
  `idcategoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `idcategorias_UNIQUE` (`idcategoria` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`fabricantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`fabricantes` (
  `idfabricante` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfabricante`),
  UNIQUE INDEX `idfabricantes_UNIQUE` (`idfabricante` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`usos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`usos` (
  `iduso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NULL,
  UNIQUE INDEX `iduso_UNIQUE` (`iduso` ASC) ,
  PRIMARY KEY (`iduso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`modelos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idfabricante` INT UNSIGNED NOT NULL,
  `idcategoria` INT UNSIGNED NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `idfabricante`, `idcategoria`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_modelos_fabricantes1_idx` (`idfabricante` ASC) ,
  INDEX `fk_modelos_categorias1_idx` (`idcategoria` ASC) ,
  CONSTRAINT `fk_modelos_fabricantes1`
    FOREIGN KEY (`idfabricante`)
    REFERENCES `medallo_motor_sport_bd`.`fabricantes` (`idfabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_modelos_categorias1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `medallo_motor_sport_bd`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`vehiculos` (
  `idvehiculo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idmodelo` INT UNSIGNED NOT NULL,
  `iduso` INT UNSIGNED NOT NULL,
  `numero_puertas` VARCHAR(5) NULL,
  `color` VARCHAR(45) NULL,
  `motor` VARCHAR(45) NULL,
  `traccion` VARCHAR(45) NULL,
  `peso` VARCHAR(45) NULL,
  `año` VARCHAR(45) NULL,
  `estado` TINYINT NOT NULL DEFAULT 1,
  `precio` DOUBLE NOT NULL,
  `modelos_id` INT UNSIGNED NOT NULL,
  `modelos_idfabricante` INT UNSIGNED NOT NULL,
  `modelos_idcategoria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idvehiculo`),
  UNIQUE INDEX `idvehiculos_UNIQUE` (`idvehiculo` ASC) ,
  INDEX `fk_vehiculos_usos1_idx` (`iduso` ASC) ,
  INDEX `fk_vehiculos_modelos1_idx` (`modelos_id` ASC, `modelos_idfabricante` ASC, `modelos_idcategoria` ASC) ,
  CONSTRAINT `fk_vehiculos_usos1`
    FOREIGN KEY (`iduso`)
    REFERENCES `medallo_motor_sport_bd`.`usos` (`iduso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculos_modelos1`
    FOREIGN KEY (`modelos_id` , `modelos_idfabricante` , `modelos_idcategoria`)
    REFERENCES `medallo_motor_sport_bd`.`modelos` (`id` , `idfabricante` , `idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`carrito` (
  `idcarrito` INT NOT NULL,
  `idvehiculo` INT UNSIGNED NOT NULL,
  `idcliente` INT NOT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `cantidad` INT UNSIGNED NOT NULL,
  `subtotal` DOUBLE NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`idcarrito`),
  INDEX `fk_carrito_vehiculos1_idx` (`idvehiculo` ASC) ,
  INDEX `fk_carrito_clientes1_idx` (`idcliente` ASC, `tipo_documento` ASC) ,
  CONSTRAINT `fk_carrito_vehiculos1`
    FOREIGN KEY (`idvehiculo`)
    REFERENCES `medallo_motor_sport_bd`.`vehiculos` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_clientes1`
    FOREIGN KEY (`idcliente` , `tipo_documento`)
    REFERENCES `medallo_motor_sport_bd`.`clientes` (`idcliente` , `tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`facturas` (
  `idfactura` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `total` DOUBLE UNSIGNED NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE INDEX `idfactura_UNIQUE` (`idfactura` ASC) ,
  INDEX `fk_facturas_clientes1_idx` (`idcliente` ASC, `tipo_documento` ASC) ,
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`idcliente` , `tipo_documento`)
    REFERENCES `medallo_motor_sport_bd`.`clientes` (`idcliente` , `tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medallo_motor_sport_bd`.`detalles_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medallo_motor_sport_bd`.`detalles_pedido` (
  `iddetalle_pedido` INT NOT NULL,
  `facturas_idfactura` INT UNSIGNED NOT NULL,
  `idcliente` INT NOT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `idvehiculo` INT UNSIGNED NOT NULL,
  `cantidad` INT UNSIGNED NOT NULL,
  `subtotal` DOUBLE UNSIGNED NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`iddetalle_pedido`, `facturas_idfactura`),
  INDEX `fk_detalles_pedido_facturas1_idx` (`facturas_idfactura` ASC) ,
  INDEX `fk_detalles_pedido_clientes1_idx` (`idcliente` ASC, `tipo_documento` ASC) ,
  INDEX `fk_detalles_pedido_vehiculos1_idx` (`idvehiculo` ASC) ,
  CONSTRAINT `fk_detalles_pedido_facturas1`
    FOREIGN KEY (`facturas_idfactura`)
    REFERENCES `medallo_motor_sport_bd`.`facturas` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_pedido_clientes1`
    FOREIGN KEY (`idcliente` , `tipo_documento`)
    REFERENCES `medallo_motor_sport_bd`.`clientes` (`idcliente` , `tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_pedido_vehiculos1`
    FOREIGN KEY (`idvehiculo`)
    REFERENCES `medallo_motor_sport_bd`.`vehiculos` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
