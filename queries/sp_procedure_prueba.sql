use issste;
select * from activos;

DELIMITER $$
DROP PROCEDURE IF EXISTS SP_CURSOR_PRUEBA $$
CREATE PROCEDURE SP_CURSOR_PRUEBA()
BEGIN
	DECLARE listo INT DEFAULT FALSE;
    DECLARE identificador INT;
    DECLARE apellido_p varchar(100);
    DECLARE nombre_p varchar(100);
    DECLARE cursor1 CURSOR FOR SELECT id, apellido_paterno, nombre FROM issste.activos WHERE apellido_paterno = 'SILIS' AND sueldo_issste > 15000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cursor1;
    
    read_loop: LOOP
		FETCH cursor1 INTO identificador, apellido_p, nombre_p;
        
        IF listo THEN
			LEAVE read_loop;
		END IF;
        
        SELECT identificador, apellido_p, nombre_p;
	END LOOP;
    
    CLOSE cursor1;
END $$
DELIMITER ;

call SP_CURSOR_PRUEBA();