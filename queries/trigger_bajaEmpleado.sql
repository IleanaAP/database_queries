DROP TRIGGER IF EXISTS tr_baja_empleado;

DELIMITER |
CREATE TRIGGER tr_baja_empleado
BEFORE DELETE ON activos
FOR EACH ROW
BEGIN
	INSERT INTO cambios_empleados
    (id, fecha_ingreso, fecha_eliminado, baja_laboral, apellido_pat, apellido_mat, nombre)
    VALUES (OLD.id, OLD.fecha_ingreso, NOW(), 'SI', OLD.apellido_paterno, OLD.apellido_materno, OLD.nombre);
END |
DELIMITER ;