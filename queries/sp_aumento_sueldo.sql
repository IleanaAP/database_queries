DROP PROCEDURE IF EXISTS SP_AUMENTO_SUELDO;

DELIMITER $$
CREATE PROCEDURE SP_AUMENTO_SUELDO(
	IN par_antig tinyint(2),
    IN par_sueldo_issste decimal(7,2),
    IN par_aumento decimal(7,2),
	OUT par_total int
)
BEGIN
	SELECT COUNT(*) INTO par_total
	FROM issste.activos
    WHERE antig = par_antig
    AND sueldo_issste < par_sueldo_issste;
    
    UPDATE issste.activos
    SET
		sueldo_issste = (sueldo_issste + par_aumento)
	WHERE
		antig = par_antig AND sueldo_issste < par_sueldo_issste;
END $$
DELIMITER ;