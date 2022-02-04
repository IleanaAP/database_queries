-- esto lo usamos para revisr si tenemos activas las particiones
SHOW PLUGINS

use issste;
SELECT * FROM activos;

-- PARTICION RANGE
SELECT MIN(fecha_ingreso), MAX(fecha_ingreso) FROM issste.activos WHERE fecha_ingreso > '0000-00-00';

-- vamos a revisar por año
SELECT YEAR(fecha_ingreso), COUNT(*) FROM issste.activos GROUP BY YEAR(fecha_ingreso) ORDER BY 1 desc;

-- querys para la nueva tabla particionada
INSERT INTO activos_particionado SELECT * FROM activos WHERE YEAR(fecha_ingreso) > 0 and YEAR(fecha_alta) > 0;

SELECT * FROM issste.activos_particionado WHERE YEAR(fecha_ingreso) = 1972;
SELECT * FROM issste.activos WHERE YEAR(fecha_ingreso) = 1972;

-- PARTICION LIST
select tno_cve, count(*) from issste.activos group by tno_cve;

INSERT INTO activos_particionado_list SELECT * FROM activos WHERE YEAR(fecha_ingreso) > 0 and YEAR(fecha_alta) > 0;
SELECT * FROM issste.activos WHERE tno_cve = 25;
SELECT * FROM issste.activos_particionado_list WHERE tno_cve = 25;

-- PARTICION HASH
select * from activos_particionado_hash;
INSERT INTO activos_particionado_hash SELECT * FROM activos WHERE YEAR(fecha_ingreso) > 0 and YEAR(fecha_alta) > 0;

SELECT * FROM issste.activos WHERE tno_cve = 80;
SELECT * FROM issste.activos_particionado_hash WHERE tno_cve = 80;