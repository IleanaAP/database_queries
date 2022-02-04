SELECT * FROM activos_bitacora_nuevos;
SELECT * FROM activos;
SELECT * FROM activos_bitacora_borrados;
SELECT * FROM activos_bitacora_modificados;

use issste;
SELECT * FROM issste.activos WHERE antig = 50 AND sueldo_issste < 5000;

#llamamos al procedimiento
CALL SP_AUMENTO_SUELDO(50, 5000, 0.00, @total);

select @total;

drop trigger tr_bitacora_cambios;

select * from issste.bitacora_cambios;