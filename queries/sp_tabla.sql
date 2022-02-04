use issste;
DELIMITER $$

CREATE PROCEDURE SP_TABLA( IN par_numero int)
BEGIN
	SELECT 1*par_numero UNION ALL
    SELECT 2*par_numero UNION ALL
    SELECT 3*par_numero UNION ALL
    SELECT 4*par_numero UNION ALL
    SELECT 5*par_numero UNION ALL
    SELECT 6*par_numero UNION ALL
    SELECT 7*par_numero UNION ALL
    SELECT 8*par_numero UNION ALL
    SELECT 9*par_numero UNION ALL
    SELECT 10*par_numero;
END $$

DELIMITER ;

CALL SP_TABLA(5);