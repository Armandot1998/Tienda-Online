CREATE DATABASE MusicalQuality;

USE MusicalQuality;

CREATE TABLE `Usuario` (
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB ;

CREATE TABLE `Login` (
  `idLogin` INT(11) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `clave` BLOB NULL DEFAULT NULL,
  `IdUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idLogin`),
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `usuario` (`idUsuario`))
ENGINE = InnoDB;

CREATE TABLE `Generos` (
  `idGeneros` INT not NULL ,
  `genero` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGeneros`)  )
ENGINE = InnoDB;

CREATE TABLE `Registro` (
  `idRegistro` INT(11) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `edad` INT(11) NOT NULL ,
  `email` VARCHAR(255) NOT NULL,
  `clave` BLOB NOT NULL,
  `idLogin` INT(11) NOT NULL ,
  PRIMARY KEY (`idRegistro`),
    FOREIGN KEY (`idLogin`)
    REFERENCES `login` (`idLogin`))
ENGINE = InnoDB;

CREATE TABLE `ListaDeReproduccion` (
  `idListaDeReproduccion` INT(11) NOT NULL ,
  `nombreLista` VARCHAR(255) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idListaDeReproduccion`)  ,
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Usuario` (`idUsuario`))
ENGINE = InnoDB;

CREATE TABLE `Musica` (
  `idMusica` INT(11) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `artista` VARCHAR(255) NOT NULL,
  `album` VARCHAR(255) NOT NULL,
  `caratula` LONGBLOB NOT NULL ,
  `audio` LONGBLOB NOT NULL ,
  `linkCompra` LONGTEXT NOT NULL,
  `idListaDeReproduccion` INT(11) NOT NULL,
  `idGeneros` INT NOT NULL ,
  PRIMARY KEY (`idMusica`)  ,
    FOREIGN KEY (`idListaDeReproduccion`)
    REFERENCES `ListaDeReproduccion` (`idListaDeReproduccion`),
    FOREIGN KEY (`idGeneros`)
    REFERENCES `generos` (`idGeneros`))
ENGINE = InnoDB;
