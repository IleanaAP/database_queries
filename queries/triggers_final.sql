-- TRIGGERS
-- se crea una bitacora de cambios

DROP TABLE IF EXISTS cambios_pensionados;
CREATE TABLE cambios_pensionados (
id INT(11) NOT NULL,
fecha_cambio DATE NOT NULL,
accion VARCHAR(10) NOT NULL,
apellido_pat VARCHAR(45) NOT NULL,
apellido_mat VARCHAR(45) NOT NULL,
nombre VARCHAR(45) NOT NULL,
PRIMARY KEY(id, fecha_cambio, accion, apellido_pat, apellido_mat, nombre)
);

-- trigger cambios en pensionados
DROP TRIGGER IF EXISTS tr_cambios_pensionado;
DELIMITER |
CREATE TRIGGER tr_cambios_pensionado
AFTER UPDATE ON pensionados
FOR EACH ROW
BEGIN
	INSERT INTO cambios_pensionados
    (id, fecha_cambio, accion, apellido_pat, apellido_mat, nombre)
    VALUES (NEW.id, NOW(), 'UPDATE', NEW.paterno, NEW.materno, NEW.nombre);
END |
DELIMITER ;

-- trigger cuando se agrega un pensionado nuevo
DROP TRIGGER IF EXISTS tr_nuevo_pensionado;
DELIMITER |
CREATE TRIGGER tr_nuevo_pensionado
AFTER INSERT ON pensionados
FOR EACH ROW
BEGIN
	INSERT INTO cambios_pensionados
    (id, fecha_cambio, accion, apellido_pat, apellido_mat, nombre)
    VALUES (NEW.id, NOW(), 'INSERT', NEW.paterno, NEW.materno, NEW.nombre);
END |
DELIMITER ;

-- trigger eliminar pensionado
DROP TRIGGER IF EXISTS tr_baja_pensionado;
DELIMITER |
CREATE TRIGGER tr_baja_pensionado
BEFORE DELETE ON pensionados
FOR EACH ROW
BEGIN
	INSERT INTO cambios_pensionados
    (id, fecha_cambio, accion, apellido_pat, apellido_mat, nombre)
    VALUES (OLD.id, NOW(), 'DELETE', OLD.paterno, OLD.materno, OLD.nombre);
END |
DELIMITER ;

-- querys
UPDATE pensionados SET paterno = 'TALONE' WHERE id = '84247717';

DELETE FROM pensionados WHERE id = '1';

INSERT INTO pensionados
	(id, anio, mes, nombre, paterno, materno, sexo, primer_ramo, primer_ramo_des, 
    primera_fecha, ult_ramo, ult_ramo_des, ult_fecha, tiempo_serv_trab, tiempo_serv, 
    ent_pen, ent_pen_des, tip_pen_org, tip_pen_org_des, porcentaje, tip_pen_act, 
    tip_pen_act_des, fecha_inidi, alta_nomina, ent_pago, ent_pago_des, importe_pen, 
    importe_msm, neto_pagar)
    VALUES (1, 2020,	10,	'LUCIA',	'GARCIA',	'MORENO',	'MUJER',	11, 'SECRETARIA DE EDUCACION PUBLICA', 
    1972-01-01 00:00:00,	11912,	'INSTITUTO DE EDUCACION BASICA Y NORMAL DE GUERRERO',	2005-05-31 00:00:00,	
    330500,	33,	12,	'DELEGACION ESTATAL EN GUERRERO',	101,	'JUBILACION',	
    100.00,	101,	'JUBILACION',	2005-06-01 00:00:00,	2005-12-01 00:00:00,	
    12,	'DELEGACION ESTATAL EN GUERRERO',	15658.80,	4,	14377.90);