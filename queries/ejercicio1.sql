use issste;
select * from activos;
select id from activos where id = 88888881;

DROP TABLE IF EXISTS salarios_update;
CREATE TABLE salarios_update (
    id INT(11) NOT NULL,
    sueldo_issste decimal(7,2),
    sueldo_nuevo decimal(7,2),
	PRIMARY KEY(id)
);

DROP TRIGGER IF EXISTS tr_salario_cero;

DELIMITER |
CREATE TRIGGER tr_salario_cero
BEFORE UPDATE ON activos 
FOR EACH ROW
BEGIN
	IF NEW.sueldo_issste > 0 THEN
		SET NEW.sueldo_issste = NEW.sueldo_issste;
	ELSE
		SET NEW.sueldo_issste = OLD.sueldo_issste;
	END IF;
END |
DELIMITER ;

UPDATE activos
SET sueldo_issste = 5100.00
WHERE id = 252798931;