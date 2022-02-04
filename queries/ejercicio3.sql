select * from activos;

DROP PROCEDURE IF EXISTS SPC_AUMENTO_SUELDO;

DELIMITER $$
CREATE PROCEDURE SPC_AUMENTO_SUELDO()
BEGIN
BEGIN
	DECLARE listo INT DEFAULT FALSE;
	DECLARE identificador INT;
    DECLARE sueldo_ant double;
    DECLARE cur_aumento CURSOR FOR SELECT id, sueldo_issste FROM issste.activos where (YEAR(CURDATE())-YEAR(fecha_ingreso)) >= 10 and (YEAR(CURDATE())-YEAR(fecha_ingreso))<=19;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cur_aumento;

    read_loop: LOOP
		FETCH cur_aumento INTO identificador, sueldo_ant;
        
        IF listo THEN
			LEAVE read_loop;
		end if;
        update activos Set sueldo_issste = (sueldo_ant+(sueldo_ant *.01)) where id = identificador;
		
        
	END LOOP;
		CLOSE cur_aumento;
		END;
BEGIN
	DECLARE listo INT DEFAULT FALSE;
	DECLARE identificador int;
    DECLARE sueldo_ant double;
    DECLARE cur_aumento CURSOR FOR SELECT id, sueldo_issste FROM issste.activos where (YEAR(CURDATE())-YEAR(fecha_ingreso)) >= 20 and (YEAR(CURDATE())-YEAR(fecha_ingreso))<=29;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cur_aumento;

    read_loop: LOOP
		FETCH cur_aumento INTO identificador, sueldo_ant;

        
        IF listo THEN
			LEAVE read_loop;
		end if;
        update activos Set sueldo_issste = (sueldo_ant+(sueldo_ant *.05)) where id = identificador;
		
        
	END LOOP;
		CLOSE cur_aumento;
		END; 
BEGIN
	DECLARE listo INT DEFAULT FALSE;
	DECLARE identificador int;
    DECLARE sueldo_ant double;
    DECLARE cur_aumento CURSOR FOR SELECT id, sueldo_issste FROM issste.activos where (YEAR(CURDATE())-YEAR(fecha_ingreso)) >= 30 and (YEAR(CURDATE())-YEAR(fecha_ingreso))<=39;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cur_aumento;

    read_loop: LOOP
		FETCH cur_aumento INTO identificador, sueldo_ant;
        
        IF listo THEN
			LEAVE read_loop;
		end if;
        update activos Set sueldo_issste = (sueldo_ant+(sueldo_ant *.07)) where id = identificador;
        
	END LOOP;
		CLOSE cur_aumento;
		END;
BEGIN
    DECLARE listo INT DEFAULT FALSE;
	DECLARE identificador int;
    DECLARE sueldo_ant double;
    DECLARE cur_aumento CURSOR FOR SELECT id, sueldo_issste FROM issste.activos where (YEAR(CURDATE())-YEAR(fecha_ingreso)) >= 40;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET listo = TRUE;
    
    OPEN cur_aumento;

    read_loop: LOOP
		FETCH cur_aumento INTO identificador, sueldo_ant;
        IF listo THEN
		LEAVE read_loop;
		end if;
			update activos Set sueldo_issste = (sueldo_ant+(sueldo_ant *.1)) where id = identificador;
		
	END LOOP;
		CLOSE cur_aumento;
		END;
  
END $$
DELIMITER ;

call SPC_AUMENTO_SUELDO();
select * from activos where id = 252798931;