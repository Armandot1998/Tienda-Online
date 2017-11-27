
--creamos la base de datos con el nombre "TIENDA-ONLINE"

CREATE DATABASE 'tienda_online';

USE DATABASE 'tienda_online';

CREATE TABLE 'productos' 
(id_pro INT NOT NULL, 
nombre_pro VARCHAR(50) NOT NULL, 
marca_pro VARCHAR(50) NOT NULL, 
precio_pro DOUBLE NOT NULL, 
id_tipo INT NOT NULL, 
PRIMARY KEY(id_pro)
);

USE DATABASE 'tienda_online';

SHOW TABLES;

CREATE TABLE 'tipo_proucto' 
(id_tipo INT NOT NULL, 
descripcion TEXT NOT NULL, 
PRIMARY KEY(id_tipo)
);

SHOW TABLES;

CREATE TABLE 'usuarios'
(id_uauario INT NOT NULL, 
nombres VARCHAR(50) NOT NULL, 
apellidos VARCHAR(50) NOT NULL, 
correo VARCHAR(50) NOT NULL, 
contraseña VARCHAR(20) NOT NULL, 
cedula VARCHAR(10) NOT NULL, 
id_cargo INT NOT NULL, 
PRIMARY KEY(id_usuario)
);

CREATE TABLE 'cargo'
(id_cargo INT NOT NULL, 
cargo VARCHAR(60) NOT NULL,
PRIMARY KEY(id_cargo)
);
