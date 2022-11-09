SET TERM ^ ;

CREATE PROCEDURE SP_UPDATE_PACIENTE 
 ( I_ID_PACIENTE D_ID,
   I_ID_PADRE D_ID,
   I_ID_MADRE D_ID,
   I_CEDULA D_CEDULA, 
   I_PNOMBRE D_NOMBRES,
   I_SNOMBRE D_NOMBRES,
   I_APELLIDOS D_APELLIDOS,
   I_SEXO D_SEXO,
   I_FECHA_NACIMIENTO D_FECHA,
   I_ID_TIPO_SANGRE D_ID,
   I_ID_ARS D_ID,
   I_NONSS D_VARCHAR_25,
   I_ESTADO D_BOOLEAN_T,
   I_ESTADO_ARS D_BOOLEAN_T) 
AS 
BEGIN
     --Se actualizan los campos de la vista V_PERSONAS
     UPDATE V_PERSONAS a
     SET 
          a.PNOMBRE = :I_PNOMBRE, 
          a.SNOMBRE = :I_SNOMBRE, 
          a.APELLIDOS = :I_APELLIDOS, 
          a.SEXO = :I_SEXO, 
          a.FECHA_NACIMIENTO = :I_FECHA_NACIMIENTO, 
          a.ESTADO = :I_ESTADO
     WHERE
          a.ID = :I_ID_PACIENTE;
     
     --Se actualizan los campos de la vista V_PACIENTES
     UPDATE V_PACIENTES a
     SET 
          a.ID_MADRE = :I_ID_PADRE, 
          a.ID_PADRE = :I_ID_MADRE
     WHERE
          a.ID = :I_ID_PACIENTE;
     
     --Se actualizan los campos de la vista V_GENERALES
     UPDATE V_GENERALES a
     SET 
          a.CEDULA = :I_CEDULA, 
          a.ID_TIPO_SANGRE = :I_ID_TIPO_SANGRE 
     WHERE
          a.ID_PERSONA = :I_ID_PACIENTE;
     
     --Se actualizan los campos de la vista V_ASEGURADOS
     UPDATE V_ASEGURADOS a
     SET 
          a.ID_ARS = :I_ID_ARS, 
          a.NO_NSS = :I_NONSS, 
          a.ESTADO = :I_ESTADO_ARS
     WHERE
          a.ID_PERSONA = :I_ID_PACIENTE;

  
END^

SET TERM ; ^
