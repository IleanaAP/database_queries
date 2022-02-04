USE issste;
DELIMITER |
CREATE TRIGGER tr_activos_nombre
BEFORE UPDATE ON activos
FOR EACH ROW
BEGIN
	SET NEW.apellido_paterno = TRIM(UCASE(NEW.apellido_paterno));
    SET NEW.apellido_materno = TRIM(UCASE(NEW.apellido_materno));
    SET NEW.nombre = TRIM(UCASE(NEW.nombre));
END
|
DELIMITER ;