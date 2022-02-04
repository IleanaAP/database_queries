SELECT YEAR(fecha_ingreso) AS AÑO_INGRESO, COUNT(fecha_ingreso) AS TOTAL
FROM activos
GROUP BY YEAR(fecha_ingreso)
ORDER BY COUNT(fecha_ingreso) DESC
LIMIT 5;