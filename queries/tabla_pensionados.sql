use issste;

DROP TABLE IF EXISTS pensionados;
CREATE TABLE pensionados (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1

SELECT * FROM pensionados;