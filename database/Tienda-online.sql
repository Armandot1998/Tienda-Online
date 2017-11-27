

CREATE SCHEMA IF NOT EXISTS `TIENDA_ONLINE` DEFAULT CHARACTER SET utf8 ;
USE `TIENDA_ONLINE` ;

CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Tipo_producto` (
  `idTipo_producto` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipo_producto`),
  UNIQUE INDEX `idTipo_producto_UNIQUE` (`idTipo_producto` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Productos` (
  `idProductos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NULL,
  `Tipo_producto_idTipo_producto` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  UNIQUE INDEX `idProductos_UNIQUE` (`idProductos` ASC),
  INDEX `fk_Productos_Tipo_producto_idx` (`Tipo_producto_idTipo_producto` ASC),
  CONSTRAINT `fk_Productos_Tipo_producto`
    FOREIGN KEY (`Tipo_producto_idTipo_producto`)
    REFERENCES `TIENDA_ONLINE`.`Tipo_producto` (`idTipo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Cargo` (
  `idCargo` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`),
  UNIQUE INDEX `idCargo_UNIQUE` (`idCargo` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `cedula` INT(10) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseÃ±a` VARCHAR(45) NOT NULL,
  `Cargo_idCargo` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuarios_Cargo1_idx` (`Cargo_idCargo` ASC),
  CONSTRAINT `fk_Usuarios_Cargo1`
    FOREIGN KEY (`Cargo_idCargo`)
    REFERENCES `TIENDA_ONLINE`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Detalle_de_factura` (
  `idDetalle_de_factura` INT NOT NULL,
  `cantidad` INT NULL,
  `Productos_idProductos` INT NOT NULL,
  PRIMARY KEY (`idDetalle_de_factura`),
  UNIQUE INDEX `idDetalle_de_factura_UNIQUE` (`idDetalle_de_factura` ASC),
  INDEX `fk_Detalle_de_factura_Productos1_idx` (`Productos_idProductos` ASC),
  CONSTRAINT `fk_Detalle_de_factura_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `TIENDA_ONLINE`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `TIENDA_ONLINE`.`Factura` (
  `idFactura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `Detalle_de_factura_idDetalle_de_factura` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE INDEX `idtable1_UNIQUE` (`idFactura` ASC),
  INDEX `fk_Factura_Detalle_de_factura1_idx` (`Detalle_de_factura_idDetalle_de_factura` ASC),
  INDEX `fk_Factura_Usuarios1_idx` (`Usuarios_idUsuarios` ASC),
  CONSTRAINT `fk_Factura_Detalle_de_factura1`
    FOREIGN KEY (`Detalle_de_factura_idDetalle_de_factura`)
    REFERENCES `TIENDA_ONLINE`.`Detalle_de_factura` (`idDetalle_de_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `TIENDA_ONLINE`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

