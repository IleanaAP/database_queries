DELIMITER |

CREATE TRIGGER tr_bitacora_cambios
AFTER UPDATE ON activos
FOR EACH ROW
BEGIN
	INSERT INTO bitacora_cambios
    (id, fecha_cambio, sueldo_issste_anterior, sueldo_issste_nuevo)
    VALUES (OLD.id, NOW(), OLD.sueldo_issste, NEW.sueldo_issste);
END |

DELIMITER ;