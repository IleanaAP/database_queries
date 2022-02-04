DROP TABLE IF EXISTS activos_particionado_list;

CREATE TABLE `activos_particionado_list` (
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
  PRIMARY KEY (`id`, tno_cve)
)
PARTITION BY LIST (tno_cve) (
	PARTITION p0 VALUES IN (0,1),
    PARTITION p1 VALUES IN (10),
    PARTITION p2 VALUES IN (20,25),
    PARTITION p3 VALUES IN (30),
    PARTITION p4 VALUES IN (40),
    PARTITION p5 VALUES IN (50),
    PARTITION p6 VALUES IN (60),
    PARTITION p7 VALUES IN (70),
    PARTITION p8 VALUES IN (80,85),
    PARTITION p9 VALUES IN (90,95)
);