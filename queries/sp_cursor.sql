DELIMITER $$

CREATE PROCEDURE SP_CURSOR()
BEGIN
	DECLARE listo INT DEFAULT FALSE;
    DECLARE identificador INT;
    DECLARE cur1 CURSOR FOR SELECT id FROM issste.activos WHERE sueldo_issste > 40500;
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

call sp_cursor();