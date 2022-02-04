-- STORED PROCEDURES
-- ejecutamos para ver 
SELECT * FROM issste.pensionados WHERE YEAR(primera_fecha) = 2007 AND importe_pen > 20000.00;

-- creamos el sp
DROP PROCEDURE IF EXISTS SP_AUMENTO_PENSION;
DELIMITER |
CREATE PROCEDURE SP_AUMENTO_PENSION (
	IN par_primera_fecha tinyint(4),
    IN par_importe decimal(10,2),
    IN par_aumento decimal(10,2),
    OUT par_total int
)
BEGIN
	SELECT COUNT(*) INTO par_total FROM issste.pensionados 
    WHERE YEAR(primera_fecha) = par_primera_fecha AND importe_pen > par_importe;
    
    UPDATE issste.pensionados
    SET importe_pen = (importe_pen + par_aumento)
    WHERE YEAR(primera_fecha) = par_primera_fecha
    AND importe_pen > par_importe;
END |
DELIMITER ;

-- llamamos al sp
CALL SP_AUMENTO_PENSION(2007, 20000.00, 1000.00, @total);

select @total;