DELIMITER |
CREATE TRIGGER tr_bitacora_nuevos
AFTER INSERT ON activos
FOR EACH ROW
BEGIN
	INSERT INTO activos_bitacora_nuevos
    (id, anio, mes, apellido_paterno, apellido_materno, nombre,
    tno_cve, nombramiento, sexo, sueldo_issste, mult_sdo_issste,
    fecha_alta, fecha_ingreso, antig, num_ramo, ramo, entidad,
    mod_cve, modalidad, sector)
	VALUES
    (NEW.id, NEW.anio, NEW.mes, NEW.apellido_paterno, NEW.apellido_materno, NEW.nombre,
    NEW.tno_cve, NEW.nombramiento, NEW.sexo, NEW.sueldo_issste, NEW.mult_sdo_issste,
    NEW.fecha_alta, NEW.fecha_ingreso, NEW.antig, NEW.num_ramo, NEW.ramo, NEW.entidad,
    NEW.mod_cve, NEW.modalidad, NEW.sector);

END |
DELIMITER ;