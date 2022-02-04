-- CURSOR EN STORED PROCEDURE
-- cursor que muestre los id de aquellos registros que su pension sea mayor a 20500
DROP PROCEDURE IF EXISTS SP_CURSOR_PENSION;
DELIMITER $$
CREATE PROCEDURE SP_CURSOR_PENSION()
BEGIN
	DECLARE listo INT DEFAULT FALSE;
    DECLARE identificador INT;
    DECLARE cur1 CURSOR FOR SELECT id FROM issste.pensionados WHERE importe_pen > 20500.00;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cur1;
    
    read_loop: LOOP
		FETCH cur1 INTO identificador;
        
        IF listo THEN
			LEAVE read_loop;
		END IF;
        
        SELECT identificador;
	END LOOP;
    
    CLOSE cur1;
END $$

DELIMITER ;

call sp_cursor_pension();
