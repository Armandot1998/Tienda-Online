
CREATE TABLE `TipoProducto` (
  `idTipoProducto` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;

CREATE TABLE`Cargo` (
  `idCargo` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;

CREATE TABLE `Productos` (
  `idProductos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NULL,
  `idTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `TipoProducto` (`idTipoProducto`))
ENGINE = InnoDB;

CREATE TABLE `Usuarios` (
  `idUsuarios` INT NOT NULL,
   `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `cedula` INT(10) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `idCargo` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
    FOREIGN KEY (`idCargo`)
    REFERENCES `Cargo` (`idCargo`))
ENGINE = InnoDB;

CREATE TABLE `DetalleDeFactura` (
  `idDetalleDeFactura` INT NOT NULL,
  `idProductos` INT NOT NULL, 
  `cantidad` INT NULL,
  PRIMARY KEY (`idDetalleDeFactura`),
    FOREIGN KEY (`idProductos`)
    REFERENCES `Productos` (`idProductos`)
)
ENGINE = InnoDB;

CREATE TABLE `Factura` (
  `idFactura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `idDetalleDeFactura` INT NOT NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
    FOREIGN KEY (`idDetalleDeFactura`)
    REFERENCES `DetalleDeFactura` (`idDetalleDeFactura`),
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `Usuarios` (`idUsuarios`))
ENGINE = InnoDB;

INSERT INTO TipoProducto values (
    1, 'Telefono Celular');

INSERT INTO TipoProducto values (     
    2, 'Televisor');
INSERT INTO TipoProducto values (     
    3, 'Ordenador');

INSERT INTO Cargo values(
    1, 'Cliente');

INSERT INTO Cargo values (
    2, 'Vendedor');

INSERT INTO Cargo values (
    3, 'gerente');
INSERT INTO Cargo values (    
    4, 'Tecnico');


INSERT INTO Productos  values(
    1, 'Galaxy J2 Prime', 'Samsung', 120.00, 1
);


INSERT INTO Productos  values(
    2, 'Televisor Smart Tv Uhd 4K', 'Samsung', 1469.00, 1
);


INSERT INTO Productos  values(
    3, 'PC Gamer Core I7', 'Dell', 900.00, 1
);

INSERT INTO Usuarios values(
    1, 'Armando Telmo', 'Cajilema Cuji', 1726850660, 'armandotcajilema@gmail.com', '12345', 1
);

INSERT INTO DetalleDeFactura values(
    1, 1, 1
);

INSERT INTO DetalleDeFactura values(
    2, 3, 1
);

INSERT INTO Factura values(
    1, '2017-11-30', 2, 1
);