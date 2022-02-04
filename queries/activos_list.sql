select distinct mod_cve from activos order by 1;

CREATE TABLE activos_list (
	`id` int(11) NOT NULL,
  `anio` smallint(4) unsigned NOT NULL,
  `mes` tinyint(2) unsigned NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `tno_cve` tinyint(2) unsigned NOT NULL,
  `nombramiento` varchar(45) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `sueldo_issste` decimal(7,2) NOT NULL,
  `mult_sdo_issste` tinyint(2) unsigned NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `antig` tinyint(2) NOT NULL,
  `num_ramo` mediumint(5) unsigned NOT NULL,
  `ramo` varchar(70) NOT NULL,
  `entidad` varchar(20) NOT NULL,
  `mod_cve` tinyint(2) unsigned NOT NULL,
  `modalidad` varchar(70) NOT NULL,
  `sector` varchar(40) NOT NULL,
  PRIMARY KEY (`id`, mod_cve)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
PARTITION BY LIST( mod_cve ) (
	PARTITION VAL_00 VALUES IN ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
	PARTITION VAL_10 VALUES IN (10,11,12,13,14,15,16,17,18,19),
    PARTITION VAL_20 VALUES IN (20,21,22,23,24,25,26,27,28,29),
    PARTITION VAL_30 VALUES IN (30,31,32,33,34,35,36,37,38,39),
    PARTITION VAL_40 VALUES IN (40,41,42,43,44,45,46,47,48,49),
    PARTITION VAL_50 VALUES IN (50,51,52,53,54,55,56,57,58,59),
    PARTITION VAL_60 VALUES IN (60,61,62,63,64,65,66,67,68,69),
    PARTITION VAL_70 VALUES IN (70,71,72,73,74,75,76,77,78,79),
    PARTITION VAL_80 VALUES IN (80,81,82,83,84,85,86,87,88,89),
    PARTITION VAL_90 VALUES IN (90,91,92,93,94,95,96,97,98,99)
);

INSERT INTO activos_list SELECT * FROM activos WHERE YEAR(fecha_ingreso) > 0 AND YEAR(fecha_alta) > 0;

SELECT * FROM issste.activos WHERE mod_cve = 2;
SELECT * FROM issste.activos_list WHERE mod_cve = 2;

SELECT mod_cve, COUNT(*) FROM activos GROUP BY mod_cve ORDER BY 1;

SELECT mod_cve, COUNT(mod_cve <= 9) AS val_00 FROM activos;