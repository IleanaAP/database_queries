SELECT (YEAR(NOW()) - YEAR(fecha_ingreso) + 18) AS EDAD
FROM activos
WHERE sueldo_issste > 40000
ORDER BY EDAD ASC
LIMIT 1;