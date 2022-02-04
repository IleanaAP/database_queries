DROP TRIGGER IF EXISTS tr_cambios_empleado;

DELIMITER |
CREATE TRIGGER tr_cambios_empleado
AFTER UPDATE ON activos
FOR EACH ROW
BEGIN
	INSERT INTO cambios_empleados
    (id, fecha_ingreso, fecha_cambio, cambio_trabajo, apellido_pat, apellido_mat, nombre)
    VALUES (NEW.id, OLD.fecha_ingreso, NOW(), 'SI', NEW.apellido_paterno, NEW.apellido_materno, NEW.nombre);
END |
DELIMITER ;