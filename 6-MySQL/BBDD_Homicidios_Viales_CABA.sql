/************************************************************
********************** Creando la BBDD **********************
************************************************************/

-- Eliminamos La BBDD a crear por si tenemos uno de nombre igual y no haya problemas
DROP DATABASE ProyectoIndividual2; 

-- Creamos nuestra BBDD y ponemos if no existe para q no nos salte error si existiera (es redundante pero es mas seguro, mientras aprendemos)
CREATE DATABASE IF NOT EXISTS ProyectoIndividual2; 
-- Llamamos a usar nuestra BBDD vacia
USE ProyectoIndividual2;  

-- Creamos las tablas a partir de los CSV proporcionado
-- No habilitamos los PrimaryKey ni los ForeinKey ya q no nos dejará hacer el ETL, Luego ya lo haremos
-- Para visualizar las columnas de los CSV use 'LibreOffice'

-- Para leer las Tablas tenemos que poner los Archivos CSV en la Carpeta de C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ para que los lea

/********************************************************************************
********************** Cargando la tabla resultadokpi1.csv **********************
********************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `resultadokpi1`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `resultadokpi1` (
    `Año` 							INTEGER PRIMARY KEY, 
    `Homicidios_EJ` 				INTEGER, 
    `Homicidios_JD` 				INTEGER,
    `Poblacion` 					INTEGER, 
    `Tasa_EJ` 						FLOAT, 
    `Tasa_JD` 						FLOAT, 
    `Porcentaje_de_comparacion` 	FLOAT
);

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datos\\resultadokpi1.csv'
INTO TABLE `resultadokpi1`
CHARACTER SET utf8mb4 -- Especificar la codificación de caracteres utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' -- Añadir la secuencia de escape '\\' para manejar correctamente los caracteres especiales
LINES TERMINATED BY '\n' IGNORE 1 
LINES;

-- Vemos los datos en la tabla
SELECT * FROM `resultadokpi1`;

/********************************************************************************
********************** Cargando la tabla resultadokpi2.csv **********************
********************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `resultadokpi2`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `resultadokpi2` (
    `Año` 							INTEGER PRIMARY KEY, 
    `Homicidios_Año_actual` 		INTEGER, 
    `Tasa_Año_actual` 				FLOAT,
    `Porcentaje_de_comparacion` 	FLOAT,
	FOREIGN KEY (`Año`) REFERENCES resultadokpi1(`Año`)
);

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datos\\resultadokpi2.csv'
INTO TABLE `resultadokpi2`
CHARACTER SET utf8mb4 -- Especificar la codificación de caracteres utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' -- Añadir la secuencia de escape '\\' para manejar correctamente los caracteres especiales
LINES TERMINATED BY '\n' IGNORE 1 
LINES;

-- Vemos los datos en la tabla
SELECT * FROM `resultadokpi2`;

/********************************************************************************
********************** Cargando la tabla resultadokpi3.csv **********************
********************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `resultadokpi3`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `resultadokpi3` (
    `Año` 							INTEGER PRIMARY KEY, 
    `Homicidios_Año_actual_FE` 		INTEGER, 
    `Tasa_Año_actual_FE` 			FLOAT,
    `Porcentaje_de_cambio_FE` 		FLOAT, 
    `Homicidios_Año_actual_MA` 		INTEGER, 
    `Tasa_Año_actual_MA` 			FLOAT, 
    `Porcentaje_de_cambio_MA` 		FLOAT,
    FOREIGN KEY (`Año`) REFERENCES resultadokpi1(`Año`)
);

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datos\\resultadokpi3.csv'
INTO TABLE `resultadokpi3`
CHARACTER SET utf8mb4 -- Especificar la codificación de caracteres utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' -- Añadir la secuencia de escape '\\' para manejar correctamente los caracteres especiales
LINES TERMINATED BY '\n' IGNORE 1 
LINES;

-- Vemos los datos en la tabla
SELECT * FROM `resultadokpi3`;

/*************************************************************************************
********************** Cargando la tabla homicidiosEDAunion.csv **********************
*************************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `Homicidios`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `Homicidios` (
`Id`			VARCHAR(10),
`Victimas`		INTEGER,
`Hora`			INTEGER,
`Lugar`			VARCHAR(25), 
`Calle`			VARCHAR(100),
`Longitud`		VARCHAR(25),
`Latitud`		VARCHAR(25),
`Acusado`		VARCHAR(25),
`Año`			INTEGER, 
`Mes`			INTEGER,
`Dia`			INTEGER, 
`Rol`			VARCHAR(25), 
`Victima`		VARCHAR(25),
`Sexo`			VARCHAR(25),
`Edad`			INTEGER,
`Barrio`		VARCHAR(25), 
`nombre_comuna`	VARCHAR(100), 
`url_imagen`	VARCHAR(500),
FOREIGN KEY (`Año`) REFERENCES resultadokpi1(`Año`)    
);

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datos\\homicidiosEDAunion.csv'
INTO TABLE `Homicidios`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Id,Victimas,Hora,Lugar,Calle,Longitud,Latitud,Acusado,Año,Mes,Dia,Rol,Victima,Sexo,Edad,Barrio,nombre_comuna, url_imagen);

ALTER TABLE `Homicidios` MODIFY `Longitud` DECIMAL(10,6); 
ALTER TABLE `Homicidios` MODIFY `Latitud` DECIMAL(10,6); 

SELECT * FROM `Homicidios`;
/*
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data/HomicidiosMySQL.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM `Homicidios`;
*/