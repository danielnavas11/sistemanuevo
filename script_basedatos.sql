--Aca esta el script para crear la base de datos en postgres
--ver el archivo jdbc.properties para el usuario y la clave del postgresql
CREATE DATABASE ivd
  WITH OWNER = postgres;

CREATE TABLE usuario
(
  id_usuario serial NOT NULL,
  usuario character varying(30),
  password character varying(200),
  administrador character varying(1),
  CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
);
--user demo
--clave demo
INSERT INTO usuario (id_usuario, usuario, password, administrador) VALUES (1, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'S');
