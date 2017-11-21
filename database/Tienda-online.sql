
--creando la base de datos

CREATE DATABASE tienda_online;

--necesitamos tres tablas: una para celulares, para computadoras y una para televisores.

--creamos la primera tabla con 4 campos: id, nombre, marca, precio.

CREATE TABLE IF NOT EXISTS 'celulares' (

'id' INT(5) unisigned NOT NULL AUTOINCREMENT, 
'nombre' VARCHAR(30) NOT NULL, 
'marca' VARCHAR(30) NOT NULL, 
'precio' INT(5) NOT NULL, 
PRIMARY KEY('id')
) ENGINE=InnoDB DEFAULT CHARACTER SET= utf8;

--creamos la segunda tabla con los mismos campos que la tabla anterior.

CREATE TABLE IF NOT EXISTS 'computadoras' (

'id' INT(5) unisigned NOT NULL AUTOINCREMENT, 
'nombre' VARCHAR(30) NOT NULL, 
'marca' VARCHAR(30) NOT NULL, 
'precio' INT(5) NOT NULL, 
PRIMARY KEY('id')
) ENGINE=InnoDB DEFAULT CHARACTER SET= utf8;

--creamos la tercera tabla con los mismos campos que la tabla anterior.

CREATE TABLE IF NOT EXISTS 'televisores' (

'id' INT(5) unisigned NOT NULL AUTOINCREMENT, 
'nombre' VARCHAR(30) NOT NULL, 
'marca' VARCHAR(30) NOT NULL, 
'precio' INT(5) NOT NULL, 
PRIMARY KEY('id')
) ENGINE=InnoDB DEFAULT CHARACTER SET= utf8;

---laDHYFGBlñifvbLPDIFBPÑFBGKJFD

