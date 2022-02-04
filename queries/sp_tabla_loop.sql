DELIMITER $$

CREATE PROCEDURE SP_TABLA_LOOP(IN par_numero int)
BEGIN
	DECLARE contador int DEFAULT 1;
    
    ciclo: LOOP
		SELECT contador*par_numero;
        SET contador=contador+1;
        
        IF contador=11 THEN
	END LOOP ciclo;
    
END $$

DELIMITER ;

CALL SP_TABLA_LOOP(5);