INSERT INTO issste.activos
   (id, anio, mes, apellido_paterno, apellido_materno, nombre,
    tno_cve, nombramiento, sexo, sueldo_issste, mult_sdo_issste,
    fecha_alta, fecha_ingreso, antig, num_ramo, ramo, entidad,
    mod_cve, modalidad, sector)
   VALUES (1, 2020, 8, 'PATERNO', 'MATERNO', 'NOMBRE', 10, 'BASE',
		   'M', 4674.50, 1, '2010-11-16', '2010-11-16', 10, 11910,
           'SECRETARIA DE EDUCACION DEL ESTADO DE DURANGO', 'DURANGO',
           1, 'TODOS LOS SEGUROS, PRESTACIONES Y SERVICIOS',
           'ORGANISMO DESCENTRALIZADO');
           
DELETE FROM activos WHERE id = 252799738;

UPDATE activos SET apellido_paterno = 'NAJERA' WHERE id = 252798931;