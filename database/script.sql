CREATE DATABASE Musical_Quality DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE Musical_Quality;

CREATE TABLE IF NOT EXISTS `Musical_Quality`.`Usuario` (
  `idUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`idUsuario`)  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Musical_Quality`.`Login` (
  `idLogin` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `contraseña` BLOB NULL DEFAULT NULL COMMENT '',
  `usuarioIdUsuario` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idLogin`)  ,
  INDEX `fk_login_usuario1_idx` (`usuarioIdUsuario` ASC) ,
  CONSTRAINT `fk_login_usuario1`
    FOREIGN KEY (`usuarioIdUsuario`)
    REFERENCES `musical_quality`.`usuario` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Musical_Quality`.`Generos` (
  `idGeneros` INT not NULL ,
  `genero` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGeneros`)  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Musical_Quality`.`Registro` (
  `idRegistro` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `apellido` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `edad` INT(11) NULL DEFAULT NULL COMMENT '',
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `contraseña` BLOB NULL DEFAULT NULL COMMENT '',
  `loginIdLogin` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idRegistro`)  ,
  INDEX `fk_registro_login1_idx` (`loginIdLogin` ASC) ,
  CONSTRAINT `fk_registro_login1`
    FOREIGN KEY (`loginIdLogin`)
    REFERENCES `musical_quality`.`login` (`idLogin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `Musical_Quality`.`ListaDeReproduccion` (
  `idListaDeReproduccion` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombreLista` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `usuarioIdUsuario` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idListaDeReproduccion`)  ,
  INDEX `fk_lista_de_reproduccion_Usuario1_idx` (`UsuarioIdUsuario` ASC) ,
  CONSTRAINT `fk_lista_de_reproduccion_Usuario1`
    FOREIGN KEY (`UsuarioIdUsuario`)
    REFERENCES `musical_quality`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `Musical_Quality`.`Musica` (
  `idMusica` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `artista` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `album` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `caratula` LONGBLOB NULL DEFAULT NULL COMMENT '',
  `audio` LONGBLOB NULL DEFAULT NULL COMMENT '',
  `linkCompra` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '',
  `listaDeReproduccionIdListaDeReproduccion` INT(11) NOT NULL COMMENT '',
  `generosIdGeneros` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idMusica`)  ,
    FOREIGN KEY (`listaDeReproduccionIdListaDeReproduccion`)
    REFERENCES `ListaDeReproduccion` (`idListaDeReproduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musica_Generos1`
    FOREIGN KEY (`generosIdGeneros`)
    REFERENCES `generos` (`idGeneros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
