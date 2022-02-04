-- PARTICIONAMIENTO RANGE, HASH, LIST 

-- para ver que valores tiene
SELECT MIN(DATE(primera_fecha)), MAX(DATE(primera_fecha)) FROM issste.pensionados WHERE DATE(primera_fecha)
 > '0000-00-00';

-- revisamos por año
SELECT YEAR(primera_fecha), COUNT(*) FROM issste.pensionados GROUP BY YEAR(primera_fecha) ORDER BY 1 DESC;

-- tabla
DROP TABLE IF EXISTS pensionados_particionado;
CREATE TABLE `pensionados_particionado` (
  `id` int(11) NOT NULL,
  `anio` smallint(4) unsigned NOT NULL,
  `mes` tinyint(2) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) DEFAULT NULL,
  `sexo` varchar(6) NOT NULL,
  `primer_ramo` int(6) NOT NULL,
  `primer_ramo_des` varchar(45) NOT NULL,
  `primera_fecha` datetime NOT NULL,
  `ult_ramo` int(6) NOT NULL,
  `ult_ramo_des` varchar(45) NOT NULL,
  `ult_fecha` datetime NOT NULL,
  `tiempo_serv_trab` int(6) NOT NULL,
  `tiempo_serv` tinyint(2) unsigned NOT NULL,
  `ent_pen` tinyint(2) unsigned NOT NULL,
  `ent_pen_des` varchar(45) NOT NULL,
  `tip_pen_org` tinyint(3) unsigned NOT NULL,
  `tip_pen_org_des` varchar(45) NOT NULL,
  `porcentaje` decimal(3,2) NOT NULL,
  `tip_pen_act` tinyint(3) unsigned NOT NULL,
  `tip_pen_act_des` varchar(45) NOT NULL,
  `fecha_inidi` datetime NOT NULL,
  `alta_nomina` datetime NOT NULL,
  `ent_pago` tinyint(2) unsigned NOT NULL,
  `ent_pago_des` varchar(45) NOT NULL,
  `importe_pen` decimal(10,2) NOT NULL,
  `importe_msm` tinyint(2) unsigned NOT NULL,
  `neto_pagar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`, primera_fecha)
) 
PARTITION BY RANGE ( YEAR(primera_fecha) ) (
	PARTITION p0 VALUES LESS THAN (1950),
    PARTITION p1 VALUES LESS THAN (1960),
    PARTITION p2 VALUES LESS THAN (1970),
    PARTITION p3 VALUES LESS THAN (1980),
    PARTITION p4 VALUES LESS THAN (1990),
    PARTITION p5 VALUES LESS THAN (2000),
    PARTITION p6 VALUES LESS THAN (2010),
    PARTITION p7 VALUES LESS THAN (2020),
    PARTITION p8 VALUES LESS THAN MAXVALUE
);

-- insertamos los datos de la tabla original en la particionada
INSERT INTO pensionados_particionado SELECT * FROM pensionados WHERE YEAR(primera_fecha) > 0 and YEAR(ult_fecha) > 0;

-- Comparamos los tiempos de las tablas
SELECT * FROM issste.pensionados_particionado WHERE YEAR(primera_fecha) = 1972;
SELECT * FROM issste.pensionados WHERE YEAR(primera_fecha) = 1972; 

-- PARTICION LIST
-- revisamos los valores del campo por el que deseamos particionar
select * from pensionados;
SELECT DISTINCT importe_msm FROM pensionados ORDER BY 1;

-- TABLA LIST
DROP TABLE IF EXISTS pensionados_list;
CREATE TABLE `pensionados_list` (
  `id` int(11) NOT NULL,
  `anio` smallint(4) unsigned NOT NULL,
  `mes` tinyint(2) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) DEFAULT NULL,
  `sexo` varchar(6) NOT NULL,
  `primer_ramo` int(6) NOT NULL,
  `primer_ramo_des` varchar(45) NOT NULL,
  `primera_fecha` datetime NOT NULL,
  `ult_ramo` int(6) NOT NULL,
  `ult_ramo_des` varchar(45) NOT NULL,
  `ult_fecha` datetime NOT NULL,
  `tiempo_serv_trab` int(6) NOT NULL,
  `tiempo_serv` tinyint(2) unsigned NOT NULL,
  `ent_pen` tinyint(2) unsigned NOT NULL,
  `ent_pen_des` varchar(45) NOT NULL,
  `tip_pen_org` tinyint(3) unsigned NOT NULL,
  `tip_pen_org_des` varchar(45) NOT NULL,
  `porcentaje` decimal(3,2) NOT NULL,
  `tip_pen_act` tinyint(3) unsigned NOT NULL,
  `tip_pen_act_des` varchar(45) NOT NULL,
  `fecha_inidi` datetime NOT NULL,
  `alta_nomina` datetime NOT NULL,
  `ent_pago` tinyint(2) unsigned NOT NULL,
  `ent_pago_des` varchar(45) NOT NULL,
  `importe_pen` decimal(10,2) NOT NULL,
  `importe_msm` tinyint(2) unsigned NOT NULL,
  `neto_pagar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`, importe_msm)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
PARTITION BY LIST ( importe_msm )
( PARTITION VAL_00 VALUES IN (1, 2, 3, 4, 5, 6, 7, 8, 9),
PARTITION VAL_10 VALUES IN (10, 11, 12, 13, 14, 15, 16, 17, 18, 19),
PARTITION VAL_20 VALUES IN (20, 21, 22, 23, 24, 29),
PARTITION VAL_30 VALUES IN (31, 38),
PARTITION VAL_40 VALUES IN (45, 57, 66)
);

-- llenamos la tabla con datos
INSERT INTO pensionados_list SELECT * FROM pensionados WHERE YEAR(primera_fecha) > 0 AND YEAR(ult_fecha) > 0;

-- Comparamos la velocidad de respuesta
SELECT * FROM issste.pensionados_list WHERE importe_msm = 5;
SELECT * FROM issste.pensionados WHERE importe_msm = 5;

-- PARTICION HASH
-- creamos la tabla
DROP TABLE IF EXISTS pensionados_hash;
CREATE TABLE `pensionados_hash` (
  `id` int(11) NOT NULL,
  `anio` smallint(4) unsigned NOT NULL,
  `mes` tinyint(2) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) DEFAULT NULL,
  `sexo` varchar(6) NOT NULL,
  `primer_ramo` int(6) NOT NULL,
  `primer_ramo_des` varchar(45) NOT NULL,
  `primera_fecha` datetime NOT NULL,
  `ult_ramo` int(6) NOT NULL,
  `ult_ramo_des` varchar(45) NOT NULL,
  `ult_fecha` datetime NOT NULL,
  `tiempo_serv_trab` int(6) NOT NULL,
  `tiempo_serv` tinyint(2) unsigned NOT NULL,
  `ent_pen` tinyint(2) unsigned NOT NULL,
  `ent_pen_des` varchar(45) NOT NULL,
  `tip_pen_org` tinyint(3) unsigned NOT NULL,
  `tip_pen_org_des` varchar(45) NOT NULL,
  `porcentaje` decimal(3,2) NOT NULL,
  `tip_pen_act` tinyint(3) unsigned NOT NULL,
  `tip_pen_act_des` varchar(45) NOT NULL,
  `fecha_inidi` datetime NOT NULL,
  `alta_nomina` datetime NOT NULL,
  `ent_pago` tinyint(2) unsigned NOT NULL,
  `ent_pago_des` varchar(45) NOT NULL,
  `importe_pen` decimal(10,2) NOT NULL,
  `importe_msm` tinyint(2) unsigned NOT NULL,
  `neto_pagar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`, primera_fecha)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
PARTITION BY HASH ( YEAR(primera_fecha) )
PARTITIONS 10;

-- insertamos datos
INSERT INTO pensionados_hash SELECT * FROM pensionados WHERE YEAR(primera_fecha) > 0 AND YEAR(ult_fecha) > 0;

-- ejecutamos los querys para ver la velocidad de respuesta
SELECT * FROM issste.pensionados_hash WHERE YEAR(primera_fecha) = 1972;
SELECT * FROM issste.pensionados WHERE YEAR(primera_fecha) = 1972;