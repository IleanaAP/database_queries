CREATE TABLE `activos_particionado` (
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
  PRIMARY KEY (`id`, fecha_ingreso)
)
PARTITION BY RANGE ( YEAR(fecha_ingreso) ) (
	PARTITION p0 VALUES LESS THAN (1980),
    PARTITION p1 VALUES LESS THAN (1990),
    PARTITION p2 VALUES LESS THAN (2000),
    PARTITION p3 VALUES LESS THAN (2010),
    PARTITION p4 VALUES LESS THAN (2020),
    PARTITION p5 VALUES LESS THAN MAXVALUE
);
