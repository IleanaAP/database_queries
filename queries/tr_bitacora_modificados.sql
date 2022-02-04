DELIMITER |
CREATE TRIGGER tr_bitacora_modificados
AFTER UPDATE ON activos
FOR EACH ROW
BEGIN
	INSERT INTO activos_bitacora_modificados
    (id, anio, mes, apellido_paterno, apellido_materno, nombre,
    tno_cve, nombramiento, sexo, sueldo_issste, mult_sdo_issste,
    fecha_alta, fecha_ingreso, antig, num_ramo, ramo, entidad,
    mod_cve, modalidad, sector)
	VALUES
    (OLD.id, OLD.anio, OLD.mes, OLD.apellido_paterno, OLD.apellido_materno, OLD.nombre,
    OLD.tno_cve, OLD.nombramiento, OLD.sexo, OLD.sueldo_issste, OLD.mult_sdo_issste,
    OLD.fecha_alta, OLD.fecha_ingreso, OLD.antig, OLD.num_ramo, OLD.ramo, OLD.entidad,
    OLD.mod_cve, OLD.modalidad, OLD.sector);

END |
DELIMITER ;