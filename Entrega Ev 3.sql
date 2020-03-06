CREATE DATABASE cines;

USE cines;
CREATE TABLE sala
(
   numero_Sala          int not null,
   nombre_Sala          varchar(20) not null,
   cant_Butacas         int not null,
   PRIMARY KEY (numero_Sala)
);

USE cines;
CREATE TABLE cine
  (nombre_Cine          varchar(30) not null,
   numero_Sala          int,
   direccion_Cine       varchar(80) not null,
   telefono_Cine        int not null,
   PRIMARY KEY (nombre_Cine),
   FOREIGN KEY (numero_Sala) REFERENCES sala (NUMERO_SALA));

USE cines;
CREATE TABLE promocion
  (dias_Ini_Desc date not null,
   dia_Ter_Desc date not null,
   porciento int not null,
   personas_Objetivo varchar(20) not null,
   PRIMARY KEY (dias_Ini_Desc, dia_Ter_Desc));
   
 USE cines;  
CREATE TABLE funcion
  (dia_De_Semana        date not null,
   hora_Comienzo        time not null,
   pelicula_Exhib       varchar(30) not null,
   sala_Exhib           varchar(20) not null,
   numero_Sala          int not null,
   dias_Ini_Desc        date,
   dia_Ter_Desc         date,
   PRIMARY KEY (sala_Exhib, pelicula_Exhib, hora_Comienzo, dia_De_Semana),
   FOREIGN KEY (numero_Sala) REFERENCES sala (NUMERO_SALA),
   FOREIGN KEY (dias_Ini_Desc, dia_Ter_Desc) REFERENCES promocion(dias_Ini_Desc, dia_Ter_Desc));

USE cines;
CREATE TABLE peliculas
   (titulo_Dis varchar(30) not null,
   titulo_Orig varchar(30),
   genero varchar(15) not null,
   idiom_Orig varchar(15) not null,
   subs_Esp bool not null,
   pais_Orig varchar(15) not null,
   ano_Prod int not null,
   url_Web varchar(40),
   duracion varchar(7) not null,
   calif varchar(10) not null,
   fecha_Estreno date not null,
   resumen varchar(100) not null,
   id_Pelicula int not null,
   nombre_Cine varchar(30),
   dias_Ini_Desc date,
   dia_Ter_Desc date,
   PRIMARY KEY(id_Pelicula),
   FOREIGN KEY (NOMBRE_CINE) REFERENCES cine (nombre_Cine),
   FOREIGN KEY (dias_Ini_Desc, dia_Ter_Desc) REFERENCES promocion(dias_Ini_Desc, dia_Ter_Desc));

USE cines;
CREATE TABLE opinion
  (nombre_Op varchar(20) not null,
   fecha_Nac date not null,
   fecha_Reg date not null,
   calificacion varchar(10) not null,
   comentario varchar(400) not null,
   id_Opinion int not null,
   id_Pelicula int not null,
   PRIMARY KEY (id_OPINION),
   FOREIGN KEY (id_Pelicula) REFERENCES peliculas(id_Pelicula));
   
USE cines;   
CREATE TABLE realizador
  (nombre varchar(20) not null,
   nacionalidad varchar(20) not null,
   cant_Pel_Dir int not null,
   cant_Pel_Act int not null,
   PRIMARY KEY (nombre));

USE cines;
CREATE TABLE peliculas_sin_id
  (nombre varchar(20),
   nombre_Pel varchar(40) not null,
   fecha_Publ date not null,
   PRIMARY KEY (nombre_Pel)
   FOREIGN KEY (nombre) REFERENCES realizador (nombre));

USE cines;
CREATE TABLE realizadores
  (id_Pelicula          int not null,
   nombre               varchar(20) not null,
   labor                varchar(15) not null,
   papeles_Interp       varchar(100) not null
   FOREIGN KEY (id_Pelicula) REFERENCES peliculas(id_Pelicula),
   FOREIGN KEY (nombre) REFERENCES realizador (nombre));



