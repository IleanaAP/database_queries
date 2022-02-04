use issste;

DROP TABLE IF EXISTS cambios_empleados;

CREATE TABLE cambios_empleados (
id INT(11) NOT NULL,
fecha_cambio DATE DEFAULT NULL,
fecha_ingreso DATE,
fecha_eliminado DATE,
nuevo_ingreso VARCHAR(2),
cambio_trabajo VARCHAR(2),
baja_laboral VARCHAR(2),
apellido_pat VARCHAR(45) NOT NULL,
apellido_mat VARCHAR(45) NOT NULL,
nombre VARCHAR(45) NOT NULL,
PRIMARY KEY(id, apellido_pat, apellido_mat, nombre)
);