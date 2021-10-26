CREATE USER 'brayan'@'localhost' IDENTIFIED BY 'contra123';
GRANT ALL PRIVILEGES ON *.* TO 'brayan'@'localhost';

CREATE SCHEMA REVISTLAND;
USE REVISTLAND;

CREATE TABLE tipo_usuario (
  id_tipo_usuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(15) NOT NULL,
  CONSTRAINT PK_tipo_usuario PRIMARY KEY (id_tipo_usuario)
); 

CREATE TABLE usuario (
  nombre VARCHAR(25) NOT NULL,
  contrasena VARCHAR(45) NOT NULL,
  id_tipo_usuario INT NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (nombre),
  CONSTRAINT FK_to_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);

CREATE TABLE perfil (
  nombre_usuario VARCHAR(25) NOT NULL,
  hobbies VARCHAR(255),
  descripcion VARCHAR(255),
  gustos VARCHAR(255),
  foto MEDIUMBLOB,
  CONSTRAINT PK_perfil PRIMARY KEY (nombre_usuario),
  CONSTRAINT FK_to_usuario_of_perfil FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
);

CREATE TABLE categoria (
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_categoria PRIMARY KEY(nombre)
); 

CREATE TABLE etiqueta (
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_etiqueta PRIMARY KEY (nombre)
);

CREATE TABLE etiquetas_preferencia_usuario (
  nombre_usuario VARCHAR(25) NOT NULL,
  nombre_etiqueta VARCHAR(20) NOT NULL,
  CONSTRAINT PK_preferencia_etiqueta PRIMARY KEY(nombre_usuario,nombre_etiqueta),
  CONSTRAINT FK_etiqueta_usuario FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre),
  CONSTRAINT FK_preferencia_etiquetas FOREIGN KEY(nombre_etiqueta) REFERENCES etiqueta(nombre)
);

CREATE TABLE categoria_preferencia_usuario (
  nombre_usuario VARCHAR(25) NOT NULL,
  nombre_categoria VARCHAR(20) NOT NULL,
  CONSTRAINT PK_preferencia_categoria PRIMARY KEY(nombre_usuario,nombre_categoria),
  CONSTRAINT FK_categoria_usuario_categoria FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre),
  CONSTRAINT FK_preferencia_categorias FOREIGN KEY(nombre_categoria) REFERENCES categoria(nombre)
);

CREATE TABLE revista (
  id_revista INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  precio_mensual DECIMAL(7,2) NOT NULL,
  precio_anual DECIMAL(7,2) NOT NULL,
  es_interactiva TINYINT NOT NULL,
  permitir_suscripciones TINYINT NOT NULL,
  CONSTRAINT PK_revista PRIMARY KEY (id_revista)
);

CREATE TABLE categoria_revista (
  nombre_categoria VARCHAR(20) NOT NULL,
  id_revista INT NOT NULL,
  CONSTRAINT PK_categoria_revista PRIMARY KEY (nombre_categoria,id_revista),
  CONSTRAINT FK_to_revista_of_categoria_revista FOREIGN KEY (id_revista) REFERENCES revista(id_revista),
  CONSTRAINT FK_to_categoria_of_categoria_revista FOREIGN KEY (nombre_categoria) REFERENCES categoria(nombre)
); 

CREATE TABLE etiqueta_revista (
  nombre_etiqueta VARCHAR(20) NOT NULL,
  id_revista INT NOT NULL,
  CONSTRAINT PK_etiqueta_revista PRIMARY KEY (nombre_etiqueta,id_revista),
  CONSTRAINT FK_to_etiqueta_of_etiqueta_revista FOREIGN KEY (nombre_etiqueta) REFERENCES etiqueta(nombre),
  CONSTRAINT FK_to_revista_of_etiqueta_revista FOREIGN KEY (id_revista) REFERENCES revista(id_revista)
);

CREATE TABLE publicacion (
  id_publicacion INT NOT NULL AUTO_INCREMENT,
  fecha_publicacion DATE NOT NULL,
  id_revista INT NOT NULL,
  nombre_usuario VARCHAR(25) NOT NULL,
  CONSTRAINT PK_publicacion PRIMARY KEY (id_publicacion),
  CONSTRAINT FK_to_revista FOREIGN KEY (id_revista) REFERENCES revista(id_revista),
  CONSTRAINT FK_to_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuario(nombre)
);

CREATE TABLE archivo(
  id_archivo INT NOT NULL AUTO_INCREMENT,
  archivo MEDIUMBLOB NOT NULL,
  nombre_archivo VARCHAR(45),
  CONSTRAINT PK_archivo PRIMARY KEY(id_archivo)
); 

CREATE TABLE volumen(
  id_volumen INT NOT NULL AUTO_INCREMENT,
  id_revista INT NOT NULL,
  nombre_volumen VARCHAR(45) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  id_archivo INT NOT NULL,
  CONSTRAINT PK_volumen PRIMARY KEY(id_volumen),
  CONSTRAINT FK_to_revista_of_volumen FOREIGN KEY(id_revista) REFERENCES revista(id_revista),
  CONSTRAINT FK_to_archivo_of_volumen FOREIGN KEY(id_archivo) REFERENCES archivo(id_archivo)
);

CREATE TABLE tipo_pago (
  id_tipo_pago INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_tipo_pago PRIMARY KEY (id_tipo_pago)
); 

CREATE TABLE suscripcion (
  id_suscripcion INT NOT NULL AUTO_INCREMENT,
  id_tipo_pago INT NOT NULL,
  id_revista INT NOT NULL,
  fecha_suscripcion DATE NOT NULL,
  fecha_finalizacion DATE NOT NULL,
  nombre_usuario VARCHAR(25) NOT NULL,
  costo_total DECIMAL(7,2) NOT NULL,
  ganancia_editor DECIMAL(7,2) NOT NULL,
  cuota_por_servicio DECIMAL(7,2) NOT NULL,
  vigente TINYINT,
  CONSTRAINT PK_suscripcion PRIMARY KEY (id_suscripcion),
  CONSTRAINT FK_to_tipo_pago FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago (id_tipo_pago),
  CONSTRAINT FK_to_revista_of_suscripcion FOREIGN KEY (id_revista) REFERENCES revista(id_revista),
  CONSTRAINT FK_to_usuario_of_suscripcion FOREIGN KEY (nombre_usuario) REFERENCES usuario(nombre)
); 

CREATE TABLE me_gusta (
  id_like INT NOT NULL AUTO_INCREMENT,
  id_publicacion INT NOT NULL,
  fecha_like DATE NOT NULL,
  nombre_usuario VARCHAR(25) NOT NULL,
  CONSTRAINT PK_like PRIMARY KEY (id_like),
  CONSTRAINT FK_to_usuario_of_like FOREIGN KEY (nombre_usuario) REFERENCES usuario(nombre),
  CONSTRAINT FK_to_publicacion_of_like FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion)
); 

CREATE TABLE comentario (
  id_comentario INT NOT NULL AUTO_INCREMENT,
  contenido VARCHAR(255) NOT NULL,
  fecha_comentario DATE NOT NULL,
  nombre_usuario VARCHAR(25) NOT NULL,
  id_publicacion INT NOT NULL,
  CONSTRAINT PK_comentario PRIMARY KEY (id_comentario),
  CONSTRAINT FK_to_usuario_of_comentario FOREIGN KEY (nombre_usuario) REFERENCES usuario(nombre),
  CONSTRAINT FK_to_publicacion_of_comentario FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion)
);

CREATE TABLE porcentaje_ganancia(
  id INT NOT NULL AUTO_INCREMENT,
  porcentaje DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_porcentaje_ganancia PRIMARY KEY(id)
);

CREATE TABLE fecha_global (
  id INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  CONSTRAINT PK_fecha_global PRIMARY KEY(id)
);

CREATE TABLE tipo_anuncio (
  id_tipo_anuncio INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  precio DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_tipo_anuncio PRIMARY KEY(id_tipo_anuncio)
); 

CREATE TABLE texto_anuncio(
  id_texto_anuncio INT NOT NULL AUTO_INCREMENT,
  contenido VARCHAR(50) NOT NULL,
  CONSTRAINT PK_texto_anuncio PRIMARY KEY(id_texto_anuncio)
);

CREATE TABLE imagen_anuncio(
  id_imagen_anuncio INT NOT NULL AUTO_INCREMENT,
  imagen MEDIUMBLOB,
  CONSTRAINT PK_imagen_anuncio PRIMARY KEY(id_imagen_anuncio)
);

CREATE TABLE link_video_anuncio(
  id_video_anuncio INT NOT NULL AUTO_INCREMENT,
  link VARCHAR(300) NOT NULL,
  CONSTRAINT PK_video_anuncio PRIMARY KEY(id_video_anuncio)
);

CREATE TABLE empresa_anunciante (
  id_anunciante INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,

  CONSTRAINT PK_empresa_anunciante PRIMARY KEY (id_anunciante)
);

CREATE TABLE anuncio (
  id_anuncio INT NOT NULL AUTO_INCREMENT,
  id_tipo_anuncio INT NOT NULL,
  id_archivo INT,
  id_texto_anuncio INT,
  id_video_anuncio INT,
  activado TINYINT NOT NULL,
  fecha_activacion DATE,
  fecha_finalizacion DATE,
  cantidad_dias INT NOT NULL,  
  CONSTRAINT PK_anuncio PRIMARY KEY (id_anuncio)
);

CREATE TABLE pago_anuncio (
  id_pago INT NOT NULL AUTO_INCREMENT,
  id_anunciante INT NOT NULL,
  fecha_compra DATE NOT NULL,
  id_anuncio INT NOT NULL,
  costo DECIMAL(7,2) NOT NULL,                       
  CONSTRAINT PK_pago_anuncio PRIMARY KEY (id_pago),
  CONSTRAINT FK_to_anunciante FOREIGN KEY (id_anunciante) REFERENCES empresa_anunciante (id_anunciante),
  CONSTRAINT FK_to_anuncio_of_pago_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncio (id_anuncio)
);

CREATE TABLE categoria_anuncio (
  id_anuncio INT NOT NULL,
  nombre_categoria VARCHAR(20) NOT NULL,
  CONSTRAINT PK_categoria_anuncio PRIMARY KEY (nombre_categoria,id_anuncio),
  CONSTRAINT FK_to_anuncio_of_categoria_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncio (id_anuncio),
  CONSTRAINT FK_to_categoria_of_categoria_anuncio FOREIGN KEY (nombre_categoria) REFERENCES categoria (nombre)
);

CREATE TABLE etiqueta_anuncio (
  id_anuncio INT NOT NULL,
  nombre_etiqueta VARCHAR(20) NOT NULL,
  CONSTRAINT PK_etiqueta_anuncio PRIMARY KEY (nombre_etiqueta,id_anuncio),
  CONSTRAINT FK_to_anuncio_of_etiqueta_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncio (id_anuncio),
  CONSTRAINT FK_to_etiqueta_of_etiqueta_anuncio FOREIGN KEY (nombre_etiqueta) REFERENCES etiqueta (nombre)
);

CREATE TABLE detalle_cobro_por_dia (
  id_detalle_cobro_por_dia INT NOT NULL AUTO_INCREMENT,
  id_revista INT NOT NULL,
  fecha_cobro DATE,
  cobro_por_dia DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_detalle_cobro_por_dia PRIMARY KEY (id_detalle_cobro_por_dia),
  CONSTRAINT FK_to_revista_of_dcpd FOREIGN KEY (id_revista) REFERENCES revista(id_revista)
);  

CREATE TABLE costo_por_dia (
  id_costo_por_dia INT NOT NULL AUTO_INCREMENT,
  id_revista INT NOT NULL,
  costo DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_costo_por_dia PRIMARY KEY (id_costo_por_dia),
  CONSTRAINT FK_to_revista_of_cpd FOREIGN KEY (id_revista) REFERENCES revista(id_revista)
);

CREATE TABLE cantidad_cobro_por_dia_global(
  id INT NOT NULL AUTO_INCREMENT,
  cantidad DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_cantidad_cobro_por_dia_global PRIMARY KEY(id)
); 

INSERT INTO tipo_usuario(nombre) VALUES('EDITOR'); 
INSERT INTO tipo_usuario(nombre) VALUES('ADMINISTRADOR'); 
INSERT INTO tipo_usuario(nombre) VALUES('NORMAL');
INSERT INTO usuario VALUES("admin","admin",2);

INSERT INTO tipo_pago(nombre) VALUES("MENSUAL");
INSERT INTO tipo_pago(nombre) VALUES("ANUAL");

INSERT INTO categoria VALUES('DEPORTES');
INSERT INTO categoria VALUES('ECONOMIA');
INSERT INTO categoria VALUES('SALUD');
INSERT INTO categoria VALUES('INFANTIL');
INSERT INTO categoria VALUES('CIENCIA');
INSERT INTO categoria VALUES('ALIMENTOS');
INSERT INTO categoria VALUES('FARANDULA');

INSERT INTO porcentaje_ganancia(porcentaje) VALUES(20);
INSERT INTO cantidad_cobro_por_dia_global(cantidad) VALUES(1.25);

INSERT INTO fecha_global(fecha) VALUES('2021-10-26'); 

INSERT INTO tipo_anuncio(nombre,precio) VALUES("TEXTO", 10); 
INSERT INTO tipo_anuncio(nombre,precio) VALUES("IMAGEN", 20); 
INSERT INTO tipo_anuncio(nombre,precio) VALUES("VIDEO", 30);