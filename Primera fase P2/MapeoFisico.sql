CREATE USER 'brayan'@'localhost' IDENTIFIED BY 'contra123';
GRANT ALL PRIVILEGES ON *.* TO 'brayan'@'localhost';

CREATE SCHEMA REVISTLAND;
USE REVISTLAND;

CREATE TABLE REVISTA (
  precio_mensual DECIMAL NOT NULL,
  id_revista INT NOT NULL AUTO_INCREMENT,
  es_interactiva TINYINT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  esGratuita TINYINT NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  id_costo_por_dia INT NOT NULL,
  precio_anual DECIMAL NOT NULL,
  permitir_suscripciones TINYINT NOT NULL,
  CONSTRAINT PK_revista PRIMARY KEY (id_revista)
); 

CREATE TABLE TIPO_USUARIO (
  id_tipo_usuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(15) NOT NULL,
  CONSTRAINT PK_tipo_usuario PRIMARY KEY (id_tipo_usuario)
); 

CREATE TABLE USUARIO (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  contrasena VARCHAR(45) NOT NULL,
  id_tipo_usuario INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (id_usuario),
  INDEX FK_to_tipo_usuario_idx (id_tipo_usuario ASC) VISIBLE,
  CONSTRAINT FK_to_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES TIPO_USUARIO(id_tipo_usuario)
); 

CREATE TABLE PUBLICACION (
  fecha_publicacion DATE NOT NULL,
  id_revista INT NOT NULL,
  id_publicacion INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  CONSTRAINT PK_publicacion PRIMARY KEY (id_publicacion),
  INDEX FK_to_revista_idx (id_revista ASC) VISIBLE,
  CONSTRAINT FK_to_revista FOREIGN KEY (id_revista) REFERENCES REVISTA(id_revista),
  CONSTRAINT FK_to_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE DETALLE_COBRO_POR_DIA (
  id_publicacion INT NOT NULL,
  id_detalle_cobro_por_dia INT NOT NULL AUTO_INCREMENT,
  cobro_por_dia DECIMAL NOT NULL,
  CONSTRAINT PK_detalle_cobro_por_dia PRIMARY KEY (id_detalle_cobro_por_dia),
  INDEX FK_to_publicacion_idx (id_publicacion ASC) VISIBLE,
  CONSTRAINT FK_to_publicacion FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id_publicacion)
); 

CREATE TABLE ME_GUSTA (
  id_like INT NOT NULL AUTO_INCREMENT,
  id_publicacion INT NOT NULL,
  fecha_like DATE NOT NULL,
  id_usuario INT NOT NULL,
  CONSTRAINT PK_like PRIMARY KEY (id_like),
  INDEX FK_to_usuario_idx (id_usuario ASC) VISIBLE,
  INDEX FK_to_publicacion_idx (id_publicacion ASC) VISIBLE,
  CONSTRAINT FK_to_usuario_of_like FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario),
  CONSTRAINT FK_to_publicacion_of_like FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id_publicacion)
); 

CREATE TABLE COMENTARIO (
  id_comentario INT NOT NULL AUTO_INCREMENT,
  fecha_comentario DATE NOT NULL,
  id_usuario INT NOT NULL,
  id_publicacion INT NOT NULL,
  CONSTRAINT PK_comentario PRIMARY KEY (id_comentario),
  INDEX FK_to_usuario_idx (id_usuario ASC) VISIBLE,
  INDEX FK_to_publicacion_idx (id_publicacion ASC) VISIBLE,
  CONSTRAINT FK_to_usuario_of_comentario FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario),
  CONSTRAINT FK_to_publicacion_of_comentario FOREIGN KEY (id_publicacion) REFERENCES PUBLICACION(id_publicacion)
); 

CREATE TABLE COSTO_POR_DIA (
  costo_por_dia DECIMAL NOT NULL,
  id_costo_por_dia INT NOT NULL AUTO_INCREMENT,
  CONSTRAINT PK_costo_por_dia PRIMARY KEY (id_costo_por_dia)
); 

CREATE TABLE CAMBIO_COSTO_POR_DIA (
  id_costo_por_dia INT NOT NULL,
  fecha_cambio DATE NOT NULL,
  id_revista INT NOT NULL,
  id_cambio_costo_por_dia INT NOT NULL AUTO_INCREMENT,
  CONSTRAINT PK_cambio_costo_por_dia PRIMARY KEY (id_cambio_costo_por_dia),
  INDEX FK_to_cost_por_dia_idx (id_costo_por_dia ASC) VISIBLE,
  INDEX FK_to_revista_idx (id_revista ASC) VISIBLE,
  CONSTRAINT FK_to_cost_por_dia FOREIGN KEY (id_costo_por_dia) REFERENCES COSTO_POR_DIA(id_costo_por_dia),
  CONSTRAINT FK_to_revista_of_cambio_costo_por_dia FOREIGN KEY (id_revista) REFERENCES REVISTA(id_revista)
); 

CREATE TABLE INFORMACION_EXTRA (
  id_usuario INT NOT NULL,
  hobbies VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  gustos VARCHAR(255) NOT NULL,
  foto BLOB NOT NULL,
  CONSTRAINT PK_informacion_extra PRIMARY KEY (id_usuario),
  CONSTRAINT FK_to_usuario_of_informacion_extra FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario)
); 

CREATE TABLE TIPO_PAGO (
  id_tipo_pago INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_tipo_pago PRIMARY KEY (id_tipo_pago)
); 

CREATE TABLE SUSCRIPCION (
  id_tipo_pago INT NOT NULL,
  id_revista INT NOT NULL,
  fecha_suscripcion DATE NOT NULL,
  id_usuario INT NOT NULL,
  costo DECIMAL NOT NULL,
  ganancia_editor DECIMAL NOT NULL,
  costo_por_servicio DECIMAL NOT NULL,
  INDEX FK_to_tipo_pago_idx (id_tipo_pago ASC) VISIBLE,
  INDEX FK_to_revista_idx (id_revista ASC) VISIBLE,
  INDEX FK_to_usuario_idx (id_usuario ASC) VISIBLE,
  CONSTRAINT PK_suscripcion PRIMARY KEY (id_revista, id_usuario),
  CONSTRAINT FK_to_tipo_pago FOREIGN KEY (id_tipo_pago) REFERENCES TIPO_PAGO (id_tipo_pago),
  CONSTRAINT FK_to_revista_of_suscripcion FOREIGN KEY (id_revista) REFERENCES REVISTA (id_revista),
  CONSTRAINT FK_to_usuario_of_suscripcion FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario)
); 

CREATE TABLE CATEGORIA (
  id_categoria INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_categoria PRIMARY KEY (id_categoria)
); 

CREATE TABLE ANUNCIO (
  id_anuncio INT NOT NULL,
  contenido BLOB NOT NULL,
  activado TINYINT NOT NULL,
  CONSTRAINT PK_anuncio PRIMARY KEY (id_anuncio)
); 

CREATE TABLE ETIQUETA (
  id_etiqueta INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_etiqueta PRIMARY KEY (id_etiqueta)
); 

CREATE TABLE ETIQUETA_ANUNCIO (
  id_etiqueta_anuncio INT NOT NULL,
  id_anuncio INT NOT NULL,
  id_etiqueta INT NOT NULL,
  CONSTRAINT PK_etiqueta_anuncio PRIMARY KEY (id_etiqueta_anuncio),
  INDEX FK_to_anuncio_idx (id_anuncio ASC) VISIBLE,
  INDEX FK_to_etiqueta_idx (id_etiqueta ASC) VISIBLE,
  CONSTRAINT FK_to_anuncio FOREIGN KEY (id_anuncio) REFERENCES ANUNCIO (id_anuncio),
  CONSTRAINT FK_to_etiqueta FOREIGN KEY (id_etiqueta) REFERENCES ETIQUETA (id_etiqueta)
); 

CREATE TABLE EMPRESA_ANUNCIANTE (
  id_anunciante INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT PK_empresa_anunciante PRIMARY KEY (id_anunciante)
); 

CREATE TABLE PAGO_ANUNCIO (
  id_pago INT NOT NULL,
  id_anunciante INT NOT NULL,
  fecha_compra DATE NOT NULL,
  id_anuncio INT NOT NULL,
  costo DECIMAL NOT NULL,
  fecha_activacion DATE NOT NULL,
  cantidad_dias INT NOT NULL,
  CONSTRAINT PK_pago_anuncio PRIMARY KEY (id_pago),
  INDEX FK_to_anunciante_idx (id_anunciante ASC) VISIBLE,
  INDEX FK_to_anuncio_idx (id_anuncio ASC) VISIBLE,
  CONSTRAINT FK_to_anunciante FOREIGN KEY (id_anunciante) REFERENCES EMPRESA_ANUNCIANTE (id_anunciante),
  CONSTRAINT FK_to_anuncio_of_pago_anuncio FOREIGN KEY (id_anuncio) REFERENCES ANUNCIO (id_anuncio)
); 

CREATE TABLE PAGINA (
  id_pagina INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  url VARCHAR(100) NOT NULL,
  CONSTRAINT PK_pagina PRIMARY KEY (id_pagina)
); 

CREATE TABLE APARICION (
  id_aparicion INT NOT NULL,
  id_anuncio INT NOT NULL,
  id_pagina INT NOT NULL,
  CONSTRAINT PK_aparicion PRIMARY KEY (id_aparicion),
  INDEX FK_to_anuncio_idx (id_anuncio ASC) VISIBLE,
  INDEX FK_to_pagina_idx (id_pagina ASC) VISIBLE,
  CONSTRAINT FK_to_anuncio_of_aparicion FOREIGN KEY (id_anuncio) REFERENCES ANUNCIO (id_anuncio),
  CONSTRAINT FK_to_pagina FOREIGN KEY (id_pagina) REFERENCES PAGINA (id_pagina)
); 

CREATE TABLE CATEGORIA_REVISTA (
  id_categoria_revista INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  id_revista INT NOT NULL,
  CONSTRAINT PK_categoria_revista PRIMARY KEY (id_categoria_revista),
  INDEX FK_to_revista_idx (id_revista ASC) VISIBLE,
  INDEX FK_to_categoria_idx (id_categoria ASC) VISIBLE,
  CONSTRAINT FK_to_revista_of_categoria_revista FOREIGN KEY (id_revista) REFERENCES REVISTA (id_revista),
  CONSTRAINT FK_to_categoria_of_categoria_revista FOREIGN KEY (id_categoria) REFERENCES CATEGORIA (id_categoria)
); 

CREATE TABLE ETIQUETA_REVISTA (
  id_etiqueta_revista INT NOT NULL,
  id_etiqueta INT NOT NULL,
  id_revista INT NOT NULL,
  CONSTRAINT PK_etiqueta_revista PRIMARY KEY (id_etiqueta_revista),
  INDEX FK_to_etiqueta_idx (id_etiqueta ASC) VISIBLE,
  INDEX FK_to_revista_idx (id_revista ASC) VISIBLE,
  CONSTRAINT FK_to_etiqueta_of_etiqueta_revista FOREIGN KEY (id_etiqueta) REFERENCES ETIQUETA (id_etiqueta),
  CONSTRAINT FK_to_revista_of_etiqueta_revista FOREIGN KEY (id_revista) REFERENCES REVISTA (id_revista)
); 

CREATE TABLE CATEGORIA_ANUNCIO (
  id_categoria_anuncio INT NOT NULL,
  id_anuncio INT NOT NULL,
  id_categoria INT NOT NULL,
  CONSTRAINT PK_categoria_anuncio PRIMARY KEY (id_categoria_anuncio),
  INDEX FK_to_anuncio_idx (id_anuncio ASC) VISIBLE,
  CONSTRAINT FK_to_anuncio_of_categoria_anuncio FOREIGN KEY (id_anuncio) REFERENCES ANUNCIO (id_anuncio),
  CONSTRAINT FK_to_categoria_of_categoria_anuncio FOREIGN KEY (id_categoria) REFERENCES CATEGORIA (id_categoria)
);