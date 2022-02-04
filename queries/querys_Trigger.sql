SELECT * FROM cambios_empleados;

INSERT INTO activos (id, anio, mes, apellido_paterno, apellido_materno, nombre, tno_cve, nombramiento, sexo, sueldo_issste, mult_sdo_issste, fecha_alta, fecha_ingreso, antig, num_ramo, ramo, entidad, mod_cve, modalidad, sector) VALUES (88888888, 2000, 8, 'AGUILAR', 'PERALTA', 'ILEANA', 1, 'CONFIANZA', 'M', 7000, 3, '2014-09-01', '2010-11-16', 4, 11, 'SECRETARIA DE SEGURIDAD Y PROTECCION CIUDADANA', 'SONORA', 1, 'TODOS LOS SEGUROS, PRESTACIONES Y SERVICIOS', 'ORGANO DESCONCENTRADO
');
UPDATE activos SET apellido_paterno = 'NARANJO' WHERE id = 252798931;
DELETE FROM activos WHERE id = 252798997;