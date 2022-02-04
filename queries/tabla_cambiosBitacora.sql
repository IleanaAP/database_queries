use issste;
CREATE TABLE bitacora_cambios (
id INT(11) NOT NULL,
fecha_cambio DATE NOT NULL,
sueldo_issste_anterior DECIMAL(7,2) NOT NULL,
sueldo_issste_nuevo DECIMAL(7,2) NOT NULL,
PRIMARY KEY(id, fecha_cambio, sueldo_issste_anterior, sueldo_issste_nuevo)
);

select * from bitacora_cambios;