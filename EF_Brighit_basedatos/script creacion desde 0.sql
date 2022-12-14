drop table if exists usuario;
create table usuario(
	id int unsigned auto_increment primary key,
	nombre varchar(64) default '',
	apellido varchar(64) default '',
	correo varchar(64) default '',
	clave varchar(128) default '',
	tipo varchar(16) default ''
);

INSERT INTO usuario  (nombre, apellido, correo, clave, tipo)
VALUES ('admin','admin','admin@admin.com','admin123','');


drop table if exists servicio;
create table servicio(
	id int unsigned auto_increment primary key,
	id_usuario int unsigned default 0,
	tipo varchar(16) default '', -- IMPRESION3D, CORTELASER, ESCANEO3D
	s1_densidadpieza varchar(16) default '',
	s1_grosor varchar(16) default '',
	s1_alturacapa varchar(16) default '',
	s1_material varchar(16) default '',
	s1_urlimage varchar(16) default '',
	s1_autoservicio varchar(16) default '',
    s2_grosorlinea varchar(16) default '',
	s2_colorlinea varchar(16) default '',
	s2_material varchar(16) default '',
	s2_dim1 varchar(16) default '',
	s2_dim2 varchar(16) default '',
	s2_ulrimagen varchar(16) default '',
    s3_largo varchar(16) default '',
	s3_ancho varchar(16) default '', 
	s3_alto varchar(16) default '', 
	s3_resolucion varchar(16) default '',
    fecha date null,
	estado varchar(16) default 'NUEVO',
	motivo_rechazo text null
);