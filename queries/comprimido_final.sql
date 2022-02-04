-- COMPRESION DE TABLA
-- se crea una tabla con opciones de compresion

DROP TABLE IF EXISTS pensionados_comprimido;

SET GLOBAL innodb_file_per_table=1;
SET GLOBAL innodb_file_format=Barracuda;
CREATE TABLE pensionados_comprimido (
	id int(11) NOT NULL,
    anio smallint(4) unsigned NOT NULL,
    mes tinyint(2) unsigned NOT NULL,
    nombre varchar(45) NOT NULL,
    paterno varchar(45) NOT NULL,
    materno varchar(45) DEFAULT NULL,
    sexo varchar(6) NOT NULL,
    primer_ramo int(6) NOT NULL,
    primer_ramo_des varchar(45) NOT NULL,
    primera_fecha datetime NOT NULL,
    ult_ramo int(6) NOT NULL,
    ult_ramo_des varchar(45) NOT NULL,
    ult_fecha datetime NOT NULL,
    tiempo_serv_trab int(6) NOT NULL,
    tiempo_serv tinyint(2) unsigned NOT NULL,
    ent_pen tinyint(2) unsigned NOT NULL,
    ent_pen_des varchar(45) NOT NULL,
    tip_pen_org tinyint(3) unsigned NOT NULL,
    tip_pen_org_des varchar(45) NOT NULL,
    porcentaje decimal(3,2) NOT NULL,
    tip_pen_act tinyint(3) unsigned NOT NULL,
    tip_pen_act_des varchar(45) NOT NULL,
    fecha_inidi datetime NOT NULL,
    alta_nomina datetime NOT NULL,
    ent_pago tinyint(2) unsigned NOT NULL,
    ent_pago_des varchar(45) NOT NULL,
    importe_pen decimal(10,2) NOT NULL,
    importe_msm tinyint(2) unsigned NOT NULL,
    neto_pagar decimal(10,2) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=INNODB
DEFAULT CHARSET=latin1
ROW_FORMAT=COMPRESSED
KEY_BLOCK_SIZE=4;

-- insertamos los datos de la tabla original en la tabla comprimida
INSERT INTO pensionados_comprimido SELECT * FROM pensionados WHERE YEAR(primera_fecha) > 0 AND YEAR(ult_fecha) > 0;

-- probando algunos querys para probar rapidez entre tablas
SELECT * FROM issste.pensionados WHERE YEAR(primera_fecha) = 2007;
SELECT * FROM issste.pensionados_comprimido WHERE YEAR(primera_fecha) = 2007;

