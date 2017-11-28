

CREATE DATABASE `TiendaOnline`;
USE `TiendaOnline`;

CREATE TABLE `TipoProducto` (
  `idTipoProducto` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;


CREATE TABLE `Productos` (
  `idProductos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NULL,
  `tipoProductoidTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
    FOREIGN KEY (`TipoProductoidTipoProducto`)
    REFERENCES `TipoProducto` (`idTipoProducto`))
ENGINE = InnoDB;

CREATE TABLE`Cargo` (
  `idCargo` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`),
ENGINE = InnoDB;


CREATE TABLE `Usuarios` (
  `idUsuarios` INT NOT NULL,
   `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `cedula` INT(10) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseÃ±a` VARCHAR(45) NOT NULL,
  `Cargo_idCargo` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
    FOREIGN KEY (`Cargo_idCargo`)
    REFERENCES `Cargo` (`idCargo`)
)
ENGINE = InnoDB;

CREATE TABLE `DetalleDeFactura` (
  `idDetalleDeFactura` INT NOT NULL,
  `cantidad` INT NULL,
  `ProductosidProductos` INT NOT NULL,
  PRIMARY KEY (`idDetalleDeFactura`),
    FOREIGN KEY (`ProductosidProductos`)
    REFERENCES `TiendaOnline`.`Productos` (`idProductos`)
)
ENGINE = InnoDB;

CREATE TABLE `Factura` (
  `idFactura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `DetalleDeFacturaidDetalleDeFactura` INT NOT NULL,
  `UsuariosidUsuarios` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
    FOREIGN KEY (`DetalleDeFacturaidDetalleDeFactura`)
    REFERENCES `DetalleDeFactura` (`idDetalleDeFactura`),
    FOREIGN KEY (`UsuariosidUsuarios`)
    REFERENCES `Usuarios` (`idUsuarios`))
ENGINE = InnoDB;
