DROP TRIGGER IF EXISTS tr_primer_empleo;

DELIMITER |
CREATE TRIGGER tr_primer_empleo
AFTER INSERT ON activos
FOR EACH ROW
BEGIN
	INSERT INTO cambios_empleados
    (id, fecha_ingreso, nuevo_ingreso, apellido_pat, apellido_mat, nombre)
    VALUES (NEW.id, NOW(), 'SI', NEW.apellido_paterno, NEW.apellido_materno, NEW.nombre);
END |

DELIMITER ;