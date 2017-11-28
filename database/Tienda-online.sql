

CREATE SCHEMA IF NOT EXISTS `TiendaOnline` DEFAULT CHARACTER SET utf8 ;
USE `TiendaOnline` ;

CREATE TABLE IF NOT EXISTS `TiendaOnline`.`TipoProducto` (
  `idTipoProducto` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoProducto`),
  UNIQUE INDEX `idTipoProductoUnique` (`idTipoProducto` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiendaOnline`.`Productos` (
  `idProductos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NULL,
  `tipoProductoidTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  UNIQUE INDEX `idProductosUnique` (`idProductos` ASC),
  INDEX `fkProductosTipoProductoidx` (`TipoProductoidTipoProducto` ASC),
  CONSTRAINT `fkProductosTipoProducto`
    FOREIGN KEY (`TipoProductoidTipoProducto`)
    REFERENCES `TiendaOnline`.`TipoProducto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiendaOnline`.`Cargo` (
  `idCargo` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`),
  UNIQUE INDEX `idCargoUnique` (`idCargo` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiendaOnline`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `cedula` INT(10) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `CargoidCargo` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fkUsuariosCargo1idx` (`CargoidCargo` ASC),
  CONSTRAINT `fkUsuariosCargo1`
    FOREIGN KEY (`CargoidCargo`)
    REFERENCES `TiendaOnline`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `TiendaOnline`.`DetalleDeFactura` (
  `idDetalleDeFactura` INT NOT NULL,
  `cantidad` INT NULL,
  `ProductosidProductos` INT NOT NULL,
  PRIMARY KEY (`idDetalleDeFactura`),
  UNIQUE INDEX `idDetalleDeFacturaUnique` (`idDetalleDeFactura` ASC),
  INDEX `fkDetalleDeFacturaProductos1idx` (`ProductosidProductos` ASC),
  CONSTRAINT `fkDetalleDeFacturaProductos1`
    FOREIGN KEY (`ProductosidProductos`)
    REFERENCES `TiendaOnline`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TiendaOnline`.`Factura` (
  `idFactura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `DetalleDeFacturaidDetalleDeFactura` INT NOT NULL,
  `UsuariosidUsuarios` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE INDEX `idtable1Unique` (`idFactura` ASC),
  INDEX `fkFacturaDetalleDeFactura1idx` (`DetalleDeFacturaidDetalleDeFactura` ASC),
  INDEX `fkFacturaUsuarios1idx` (`UsuariosidUsuarios` ASC),
  CONSTRAINT `fkFacturaDetalleDeFactura1`
    FOREIGN KEY (`DetalleDeFacturaidDetalleDeFactura`)
    REFERENCES `TiendaOnline`.`DetalleDeFactura` (`idDetalleDeFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkFacturaUsuarios1`
    FOREIGN KEY (`UsuariosidUsuarios`)
    REFERENCES `TiendaOnline`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
