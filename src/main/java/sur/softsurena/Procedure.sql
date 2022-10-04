SET TERM ^ ;
ALTER PROCEDURE ADMIN_HABILITAR_TURNO (
    IDUSUARIO D_IDUSUARIO )
AS
begin
    insert into V_TURNOS (IDUSUARIO)
    values (:IDUSUARIO);
end
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE PRO_PERMISOS (
    CONSULTAR D_BOOLEAN_F,
    INSERTAR D_BOOLEAN_F,
    ACTUALIZAR D_BOOLEAN_F,
    BORRAR D_BOOLEAN_F,
    REFERENCIA D_BOOLEAN_F,
    VISTA D_VARCHAR_45,
    LOGINUSER D_IDUSUARIO )
AS
begin
     /*Procedimiento actualizado el 22 de abril del 2022*/
     execute statement 'revoke all on '||:VISTA||' from '||:loginUser;
     
     if (:INSERTAR) then
     begin
      execute statement 'grant insert on '||:VISTA||' to '||:loginUser;
     end

     if (:CONSULTAR) then
     begin
      execute statement 'grant select on '||:VISTA||' to '||:loginUser;
     end

     if (:ACTUALIZAR) then
     begin
      execute statement 'grant update on '||:VISTA||' to '||:loginUser;
     end

     if (:BORRAR) then
     begin
      execute statement 'grant delete on '||:VISTA||' to '||:loginUser;
     end
     
     if (:REFERENCIA) then
     begin
      execute statement 'grant REFERENCES on '||:VISTA||' to '||:loginUser;
     end
end
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_DELETE_ARS (
    V_ID D_ID,
    ESTADO D_BOOLEAN_T )
AS
BEGIN
     /*Procedimiento actualizado el 22 de abril 2022*/
     
     DELETE FROM V_ARS a WHERE a.ID = :V_ID;

     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'V_ARS', :ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_ARS');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_DELETE_CATEGORIAS (
    V_ID D_ID,
    ESTADO D_BOOLEAN_T )
AS
BEGIN
     /*Procedimiento revizado el 22 de abril 2022*/
     DELETE FROM V_CATEGORIAS a WHERE a.ID = :V_ID;

     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'V_CATEGORIAS', :ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_CATEGORIAS');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_DELETE_CLIENTE_SB (
    V_ID D_ID,
    I_ESTADO D_BOOLEAN_T )
AS
BEGIN
     DELETE FROM V_CONTACTS_TEL c WHERE c.ID_PERSONA = :V_ID;
     
     DELETE FROM V_CONTACTS_EMAIL e WHERE e.ID_PERSONA = :V_ID;
     
     DELETE FROM V_CLIENTES a WHERE a.ID = :V_ID;
     
     DELETE FROM V_DIRECCIONES a WHERE a.ID_PERSONA = :V_ID;
     
     DELETE FROM V_GENERALES a WHERE a.ID_PERSONA = :V_ID;
     
     DELETE FROM V_PERSONAS a WHERE a.ID = :V_ID;

     
     /*Guardamos cantidad de registros por estado*/
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'V_PERSONAS'||' '||:I_ESTADO) > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'V_PERSONAS', :I_ESTADO);
          
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'GET_CLIENTES_ESTADO_SB'||' '||:I_ESTADO) > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'GET_CLIENTES_ESTADO_SB', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'V_PERSONAS') > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_PERSONAS');
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'V_CLIENTES') > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_CLIENTES');
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'V_GENERALES') > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_GENERALES');
     IF((SELECT CANTIDAD FROM V_RECCOUNT WHERE TABLA LIKE 'V_DIRECCIONES') > 0)THEN
          EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_DIRECCIONES');
     
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_DELETE_ESTUDIANTE (
    V_ID D_ID,
    I_ESTADO D_BOOLEAN_T )
AS
BEGIN
     DELETE FROM V_ESTUDIANTES e WHERE e.ID = :V_ID;
     DELETE FROM V_ASEGURADOS a WHERE a.ID_PERSONA = :V_ID;
     DELETE FROM V_GENERALES g WHERE g.ID_PERSONA = :V_ID;
     DELETE FROM V_PERSONAS p WHERE p.ID = :V_ID;

     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('D', 'V_ESTUDIANTES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_ASEGURADOS');
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_GENERALES');
     EXECUTE PROCEDURE SP_RECCOUNT('D', 'V_ESTUDIANTES');
     
     
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_DELETE_PACIENTE (
    V_ID D_ID,
    I_ESTADO D_BOOLEAN_T )
AS
BEGIN          
          
     DELETE FROM V_PACIENTES p WHERE p.ID = :V_ID;
     DELETE FROM V_ASEGURADOS a WHERE a.ID_PERSONA = :V_ID;
     DELETE FROM V_GENERALES g WHERE g.ID_PERSONA = :V_ID;
     DELETE FROM V_PERSONAS p WHERE p.ID = :V_ID;
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PACIENTES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_ASEGURADOS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_GENERALES');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PACIENTES');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_ARS (
    DESCRIPCION D_VARCHAR_45,
    COVER_CONSULTA_POR_C D_DESCUENTO,
    ESTADO D_BOOLEAN_T )
AS
DECLARE VARIABLE V_ID D_ID;
BEGIN
     /*Procedimiento actualizado el 22 de abril 2022*/
     
     INSERT INTO V_ARS (DESCRIPCION, COVERCONSULTAPORC, ESTADO)
     VALUES (:DESCRIPCION, :COVER_CONSULTA_POR_C, :ESTADO);
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_ARS', :ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_ARS');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_CATEGORIAS (
    DESCRIPCION D_VARCHAR_25,
    IMAGEN_TEXTO D_BLOB_TEXTO,
    ESTADO D_BOOLEAN_T )
RETURNS (
    V_ID D_ID )
AS
BEGIN
     /*Procedimiento revizado el 22 de abril 2022*/
     INSERT INTO V_CATEGORIAS (ID, DESCRIPCION, IMAGEN_TEXTO, ESTADO)
     VALUES (:V_ID,:DESCRIPCION, :IMAGEN_TEXTO, :ESTADO);
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_CATEGORIAS', :ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_CATEGORIAS');
     
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_CLIENTE (
    I_ID D_ID,
    I_ESTADO D_BOOLEAN_T )
AS
BEGIN
     --Ingresando el cliente
     INSERT INTO V_CLIENTES(ID) VALUES(:I_ID);
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_CLIENTES', :I_ESTADO);
     
     --Guardamos la cantidad de registro por tabla.
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_CLIENTES');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_CLIENTE_SB (
    I_PERSONA D_PERSONA,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T,
    I_ESTADO_CIVIL D_ESTADO_CIVIL )
RETURNS (
    V_ID D_ID )
AS
BEGIN
     /*Validaciones de insercion*/
     INSERT INTO V_PERSONAS (ID, PERSONA, PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
     FECHA_NACIMIENTO, ESTADO)
     VALUES (
     0,
       :i_PERSONA,
       :i_PNOMBRE,
       :i_SNOMBRE,
       :i_APELLIDOS,
       :i_SEXO,
       :i_FECHA_NACIMIENTO,
       :i_ESTADO) 
     RETURNING ID
     INTO :V_ID ;
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);   
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     
     /*
     --Ingresando el cliente
     INSERT INTO V_CLIENTES(ID) VALUES(:I_ID);
     
     --Guardamos cantidad de registros por estado
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_CLIENTES', :I_ESTADO);
     
     --Guardamos la cantidad de registro por tabla.
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_CLIENTES');
     
     --Ingresando el cliente
     INSERT INTO V_GENERALES(ID_PERSONA, CEDULA, ID_TIPO_SANGRE, ESTADO_CIVIL) 
     VALUES(
          :I_ID_PERSONA,
          :I_CEDULA,
          :I_ID_TIPO_SANGRE,
          :I_ESTADO_CIVIL
     );
     
     --Guardamos cantidad de registros por estado
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_GENERALES', :I_ESTADO_CIVIL);
     
     --Guardamos la cantidad de registro por tabla.
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_GENERALES');*/
     
     
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_DIRECCIONES (
    I_ID_PERSONA D_ID,
    I_ID_PROVINCIA D_ID,
    I_ID_MUNICIPIO D_ID,
    I_ID_DISTRITO_MUNICIPAL D_ID,
    I_ID_CODIGO_POSTAL D_ID,
    I_DIRECCION D_VARCHAR_255 )
RETURNS (
    O_ID D_ID )
AS
BEGIN
     /*Obtenemos el ID de la tabla */
     O_ID = GEN_ID(G_ID_DIRECCIONES, 1);
     
     INSERT INTO V_DIRECCIONES (ID, ID_PERSONA, ID_PROVINCIA, ID_MUNICIPIO,
          ID_DISTRITO_MUNICIPAL, ID_CODIGO_POSTAL, DIRECCION)
     VALUES (
          :O_ID,
          :I_ID_PERSONA, 
          :I_ID_PROVINCIA, 
          :I_ID_MUNICIPIO, 
          :I_ID_DISTRITO_MUNICIPAL, 
          :I_ID_CODIGO_POSTAL, 
          :I_DIRECCION
     );
     
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_DOCTOR (
    I_IDUSUARIO D_IDUSUARIO,
    I_CLAVE D_CLAVE,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_ROL D_ROL,
    I_COD_EXEQUATUR D_VARCHAR_70,
    I_ESPECIALIDAD D_VARCHAR_70,
    I_ESTADO D_BOOLEAN_T,
    I_ADMINISTRADOR D_BOOLEAN_F )
RETURNS (
    O_SQL D_BLOB_TEXTO )
AS
DECLARE VARIABLE V_ID D_ID; 
DECLARE VARIABLE V_SQL D_VARCHAR_255;
BEGIN
     IF((SELECT DISTINCT (1) FROM SP_SELECT_USUARIOS_TAGS (TRIM(:I_IDUSUARIO))) = 1)THEN
          EXCEPTION ERROR 'Usuario registrado!';
     
     IF((SELECT r.ROL FROM GET_ROLES r WHERE TRIM(r.ROL) like TRIM(:i_rol)) IS NULL)THEN
          EXCEPTION ERROR 'Rol no encontrado';
     
     V_ID = GEN_ID(G_ID_PERSONA, 1);
          
     V_SQL = 'CREATE USER '||:i_idusuario||' PASSWORD '''||i_clave||''' FIRSTNAME '''||i_pnombre||''' MIDDLENAME '''||i_snombre||''' LASTNAME '''||i_apellidos||''''||
     
     iif(i_estado, ' ACTIVE',' INACTIVE') ||
     
     iif(i_administrador, ' GRANT ',' REVOKE ') || 
     ' ADMIN ROLE USING PLUGIN Srp '||
     'TAGS(id='''||v_id||''', gui=''0'', uid=''0'', rol='''||TRIM(i_rol)||''', exe='''||i_cod_exequatur||''', esp='''||i_especialidad||''');';
     
     
     EXECUTE STATEMENT V_SQL;
     
     O_SQL = :V_ID;
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_ENTRADA_PRODUCTOS (
    ID_PROVEEDOR D_ID,
    COD_FACTURA D_CODIGO,
    LINEA D_ID,
    ID_PRODUCTO D_ID,
    ENTRADA D_DINERO,
    FECHA_VECIMIENTO D_FECHA )
AS
BEGIN
     
     INSERT INTO ENTRADA_PRODUCTOS (IDPROVEDOR, COD_FACTURA, LINEA, IDPRODUCTO,
     ENTRADA, FECHAVECIMIENTO)
     VALUES (:ID_PROVEEDOR, :COD_FACTURA, :LINEA, :ID_PRODUCTO, :ENTRADA, 
          :FECHA_VECIMIENTO
     );
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_ESTUDIANTE (
    I_ID_ARS D_ID,
    I_NO_NSS D_VARCHAR_25,
    I_ID_TIPO_SANGRE D_ID,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T,
    I_MATRICULA D_VARCHAR_15,
    I_ID_PADRE D_ID,
    I_ID_MADRE D_ID,
    I_ID_TUTOR D_ID,
    I_JCB_PARENTESCO D_ID )
AS
DECLARE VARIABLE V_ID D_ID; 
BEGIN
     /*Obtenemos el ID de la tabla */
     V_ID = GEN_ID(G_ID_PERSONA, 1);
     
     --Campos de quedeberia de tener los estudiantes agregado.
     -- ID_ARS, NONSS, :I_ID_ARS, :I_NO_NSS, 
     
     INSERT INTO V_PERSONAS (ID, PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
           FECHA_NACIMIENTO, ESTADO)
     VALUES (
          :V_ID, 
          :I_PNOMBRE, 
          :I_SNOMBRE, 
          :I_APELLIDOS, 
          :I_SEXO, 
          :I_FECHA_NACIMIENTO, 
          :I_ESTADO
     );
     
     INSERT INTO V_GENERALES (ID_PERSONA, CEDULA, ID_TIPO_SANGRE)
     VALUES (
          :V_ID, 
          :I_CEDULA, 
          :I_ID_TIPO_SANGRE
     );

     
     INSERT INTO V_ASEGURADOS (ID_PERSONA, ID_ARS, NO_NSS)
     VALUES (
          :V_ID, 
          :I_ID_ARS,
          :I_NO_NSS
     );
     
     /*Ingresar identificador en ESTUDIANTE*/
     INSERT INTO V_ESTUDIANTES (ID, MATRICULA, ID_PADRE, ID_MADRE, ID_TUTOR, 
               JCB_PARENTESCO)
     VALUES (
          :V_ID, 
          :I_MATRICULA, 
          :I_ID_PADRE, 
          :I_ID_MADRE,
          :I_ID_TUTOR, 
          :I_JCB_PARENTESCO
     );

     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_ESTUDIANTES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_ESTUDIANTES');
     
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_GENERALES (
    I_ID_PERSONA D_ID,
    I_CEDULA D_CEDULA,
    I_ID_TIPO_SANGRE D_ID,
    I_ESTADO_CIVIL D_ESTADO_CIVIL )
AS
BEGIN
     --Ingresando el cliente
     INSERT INTO V_GENERALES(ID_PERSONA, CEDULA, ID_TIPO_SANGRE, ESTADO_CIVIL) 
     VALUES(
          :I_ID_PERSONA,
          :I_CEDULA,
          :I_ID_TIPO_SANGRE,
          :I_ESTADO_CIVIL
     );
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_GENERALES', :I_ESTADO_CIVIL);
     
     --Guardamos la cantidad de registro por tabla.
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_GENERALES');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_PACIENTE (
    I_ID_PADRE D_ID,
    I_ID_MADRE D_ID,
    I_ID_ARS D_ID,
    I_NO_NSS D_VARCHAR_25,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ID_TIPO_SANGRE D_ID,
    I_ESTADO D_BOOLEAN_T )
RETURNS (
    V_ID D_ID )
AS
BEGIN
     /*Obtenemos el ID de la tabla...*/
     V_ID = GEN_ID(G_ID_PERSONA, 1);
     
     /*Ingresando los datos general en persona...*/
     INSERT INTO V_PERSONAS (ID,  PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
          FECHA_NACIMIENTO, ESTADO)
     VALUES (
          :V_ID,
           
          :I_PNOMBRE, 
          :I_SNOMBRE, 
          :I_APELLIDOS, 
          :I_SEXO, 
          :I_FECHA_NACIMIENTO,
          :I_ESTADO
     );
     
     INSERT INTO V_GENERALES (ID_PERSONA, ID_TIPO_SANGRE, CEDULA) 
     VALUES (
          :V_ID,
          :I_ID_TIPO_SANGRE, 
          :I_CEDULA
     );
     
     INSERT INTO V_ASEGURADOS (ID_PERSONA, ID_ARS, NO_NSS)
     VALUES (
          :V_ID, 
          :I_ID_ARS, 
          :I_NO_NSS
     );
     
     /*Insertamos en la vista de pacientes*/
     INSERT INTO V_PACIENTES (ID, ID_MADRE, ID_PADRE)
     VALUES (
          :V_ID, 
          :I_ID_MADRE, 
          :I_ID_PADRE
     );
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PACIENTES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PACIENTES');
     
     SUSPEND;

END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_PADRES (
    I_ID_PROVINCIA D_ID,
    I_ID_MUNICIPIO D_ID,
    I_ID_DISTRITO_MUNICIPAL D_ID,
    I_ID_CODIGOPOSTAL D_ID,
    I_ID_TIPO_SANGRE D_ID,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_DIRECCION D_VARCHAR_70,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T,
    I_ESTADO_CIVIL D_ESTADO_CIVIL )
RETURNS (
    O_ID D_ID )
AS
BEGIN
     /*Obtenemos el ID de la tabla */
     O_ID = GEN_ID(G_ID_PERSONA, 1);
     
     /*Alguna validacion antes de insertar*/
     INSERT INTO V_PERSONAS(ID, PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
          FECHA_NACIMIENTO, ESTADO)
     VALUES(
          :O_ID,
          :I_PNOMBRE, 
          :I_SNOMBRE, 
          :I_APELLIDOS, 
          :I_SEXO,
          :I_FECHA_NACIMIENTO, 
          :I_ESTADO 
     );
     
     INSERT INTO V_GENERALES (ID_PERSONA, ID_TIPO_SANGRE, CEDULA, ESTADO_CIVIL)
     VALUES (
          :O_ID,
          :I_ID_TIPO_SANGRE, 
          :I_CEDULA,
          :I_ESTADO_CIVIL
     );
     
     INSERT INTO V_DIRECCIONES (ID_PERSONA, ID_PROVINCIA, ID_MUNICIPIO,
     ID_DISTRITO_MUNICIPAL, ID_CODIGO_POSTAL, DIRECCION)
     VALUES (
          :O_ID,  
          :I_ID_PROVINCIA, 
          :I_ID_MUNICIPIO, 
          :I_ID_DISTRITO_MUNICIPAL, 
          :I_ID_CODIGOPOSTAL,  
          :I_DIRECCION
     );

     /*Ingresar identificador en padres*/
     INSERT INTO V_PADRES(ID) VALUES (:O_ID);
     SUSPEND;
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PADRES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PADRES');
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_PERSONA (
    I_PERSONA D_PERSONA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T )
RETURNS (
    V_ID D_ID )
AS
BEGIN
     /*Validaciones de insercion*/
     INSERT INTO V_PERSONAS (ID, PERSONA, PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
     FECHA_NACIMIENTO, ESTADO)
     VALUES (
     0,
       :i_PERSONA,
       :i_PNOMBRE,
       :i_SNOMBRE,
       :i_APELLIDOS,
       :i_SEXO,
       :i_FECHA_NACIMIENTO,
       :i_ESTADO) 
     RETURNING ID
     INTO :V_ID ;
     
     /*Aqui se insertaba en la vista V_CLIENTES y en V_GENERALES*/
     
     
     /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_PROVEEDOR (
    I_ID_PROVINCIA D_ID,
    I_ID_MUNICIPIO D_ID,
    I_PERSONA D_PERSONA,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_DIRECCION D_VARCHAR_255,
    I_ESTADO D_BOOLEAN_T,
    I_CODIGO_PROVEEDOR D_CODIGO )
RETURNS (
    V_ID D_ID )
AS
BEGIN
     /*Obtenemos el ID de la tabla */
     V_ID = GEN_ID(G_ID_PERSONA, 1);
     
     --La entidad persona que almacena datos generales.
     INSERT INTO V_PERSONAS (ID, PERSONA, PNOMBRE, SNOMBRE, APELLIDOS, SEXO, 
          ESTADO)
     VALUES (
          :V_ID, 
          :i_persona, 
          :i_pnombre, 
          :i_snombre, 
          :i_apellidos, 
          :i_sexo, 
          :i_estado
     );
          
     INSERT INTO V_GENERALES (ID_PERSONA, CEDULA) 
     VALUES (
          :V_ID,
          :i_cedula
     );
     
     --Direcion del proveedor.
     INSERT INTO V_DIRECCIONES (ID_PERSONA, ID_PROVINCIA, ID_MUNICIPIO, DIRECCION)
     VALUES (:V_ID, :i_id_provincia, :i_id_municipio, :i_direccion);
     
     --Almacenamos datos solo del proveedor. 
     INSERT INTO V_PROVEEDORES (ID, CODIGO_PROVEEDOR)
     VALUES (:V_ID, :i_codigo_proveedor);

      /*Guardamos cantidad de registros por estado*/
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PERSONAS', :I_ESTADO);
     EXECUTE PROCEDURE SP_RECCOUNT_ESTADO('I', 'V_PROVEEDORES', :I_ESTADO);
     
     /*Guardamos cantidad total de los registros en padres*/
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PERSONAS');
     EXECUTE PROCEDURE SP_RECCOUNT('I', 'V_PROVEEDORES');
     
     SUSPEND;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_INSERT_USUARIOS (
    I_IDUSUARIO D_IDUSUARIO,
    I_CLAVE D_CLAVE,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_ESTADO D_BOOLEAN_T,
    I_ADMINISTRADOR D_BOOLEAN_F,
    I_DESCRIPCION D_BLOB_TEXTO )
AS
DECLARE VARIABLE V_SQL D_VARCHAR_255;
BEGIN
     IF((SELECT (1) FROM SEC$USERS r WHERE TRIM(r.SEC$USER_NAME) LIKE TRIM(:I_IDUSUARIO)) = 1)THEN
          EXCEPTION ERROR 'Usuario registrado!';
     
          
     V_SQL = 'CREATE USER '||:i_idusuario 
          ||' PASSWORD '''||:i_clave
          ||''' FIRSTNAME '''||:i_pnombre
          ||''' MIDDLENAME '''||:i_snombre
          ||''' LASTNAME '''||:i_apellidos
          ||''''|| iif(:i_estado, ' ACTIVE ',' INACTIVE ') 
          || iif(:i_administrador, ' GRANT ',' REVOKE ') 
          || ' ADMIN ROLE USING PLUGIN Srp;';
          
     
     EXECUTE STATEMENT V_SQL;
     
     EXECUTE STATEMENT 'COMMENT ON USER '||:i_idusuario||' is '''||:I_DESCRIPCION||'''';
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_RECCOUNT (
    TCOPERAC TYPE OF D_INSERT_DELETE,
    TCTABLAX TYPE OF D_VARCHAR_45 )
AS
declare variable LCCOMANDO D_VARCHAR_255;
declare variable LNCANTIDADFILAS D_ID;
DECLARE VARIABLE v_id D_ID;
BEGIN
/*
     Este RECCOUNT agrega la tabla tomando encuentra el estado del registro.
*/
     --Nos aseguramos que sea una operacion definida
     IF (tcOperac <> 'I' and tcOperac <> 'D') THEN
      EXCEPTION error 'Operacion no definida';--FIN
     
     --Se trata de actualizar la tabla de RECCOUNT
     UPDATE V_RECCOUNT r
     SET
       r.CANTIDAD = r.CANTIDAD + IIF(:tcOperac = 'I', 1, -1)
     WHERE r.TABLA = :tcTablax;

 
     IF (ROW_COUNT = 0) THEN BEGIN -- No se encontró la tabla en RECCOUNT, por lo tanto hay que agregarla
      lcComando = 'SELECT COUNT(*) FROM ' || tcTablax;
      EXECUTE STATEMENT (lcComando) INTO :lnCantidadFilas;
      INSERT INTO V_RECCOUNT(tabla, cantidad)
          VALUES (:tcTablax, :lnCantidadFilas);
     END
 
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_RECCOUNT_ESTADO (
    TCOPERAC TYPE OF D_INSERT_DELETE,
    TCTABLAX TYPE OF D_VARCHAR_45,
    ESTADO TYPE OF D_BOOLEAN_F )
AS
declare variable LCCOMANDO D_VARCHAR_255;
declare variable LNCANTIDADFILAS D_ID;
BEGIN
/*
     Este RECCOUNT agrega la tabla tomando encuentra el estado del registro.
*/
     --Nos aseguramos que sea una operacion definida
     IF (tcOperac <> 'I' and tcOperac <> 'D') THEN
      EXCEPTION error 'Operacion no definida';--FIN

     --Se trata de actualizar la tabla de RECCOUNT
     UPDATE V_RECCOUNT r
     SET
       r.CANTIDAD = r.CANTIDAD + IIF(:tcOperac = 'I', 1, -1)
     WHERE r.TABLA = :tcTablax||' '||:ESTADO;--FIN

     -- No se encontró la tabla en RECCOUNT, por lo tanto hay que agregarla
     IF (ROW_COUNT = 0) THEN BEGIN 
      lcComando = 'SELECT COUNT(*) FROM ' || tcTablax ||' WHERE ESTADO IS '||ESTADO;
      EXECUTE STATEMENT (lcComando) INTO :lnCantidadFilas;
      INSERT INTO V_RECCOUNT(tabla, cantidad)
          VALUES (:tcTablax||' '||:ESTADO , :lnCantidadFilas);
     END
 
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_SELECT_USUARIOS_TAGS (
    I_USER_NAME D_IDUSUARIO NOT NULL DEFAULT 'all' )
RETURNS (
    O_USER_NAME D_IDUSUARIO,
    O_PRIMER_NOMBRE D_NOMBRES,
    O_SEGUNDO_NOMBRE D_NOMBRES,
    O_APELLIDOS D_APELLIDOS,
    O_ESTADO_ACTIVO D_BOOLEAN_T,
    O_ADMINISTRADOR D_BOOLEAN_T,
    O_TAG_NOMBRE D_VARCHAR_255,
    O_TAG_VALOR D_VARCHAR_255 )
AS
DECLARE VARIABLE V_USER_NAME       D_IDUSUARIO;
     DECLARE VARIABLE V_PRIMER_NOMBRE   D_NOMBRES;
     DECLARE VARIABLE V_SEGUNDO_NOMBRE  D_NOMBRES;
     DECLARE VARIABLE V_APELLIDOS       D_APELLIDOS;
     DECLARE VARIABLE V_ESTADO_ACTIVO   D_BOOLEAN_T;
     DECLARE VARIABLE V_ADMINISTRADOR   D_BOOLEAN_T;
     DECLARE VARIABLE V_TAG_NOMBRE      D_VARCHAR_255;
     DECLARE VARIABLE V_TAG_VALOR       D_VARCHAR_255;
BEGIN
     /*Validacion no está funcionando. Debeido al Dominio del campo no permite 
     Nulos.*/
     if(I_USER_NAME IS NULL) THEN I_USER_NAME = 'all';
     
     FOR SELECT 
            CAST(U.SEC$USER_NAME AS D_IDUSUARIO) AS USUARIO,
            U.SEC$FIRST_NAME                  AS PRIMER_NOMBRE,
            U.SEC$MIDDLE_NAME                 AS SEGUNDO_NOMBRE,
            U.SEC$LAST_NAME                   AS APELLIDO,
            U.SEC$ACTIVE                      AS ESTA_ACTIVO,
            U.SEC$ADMIN                       AS ES_ADMIN,
            '-' AS NoValor1, '-' AS NoValor2
          FROM 
            SEC$USERS U --Tabla que nos permite obtener los usuarios del sistema.
          WHERE TRIM(U.SEC$USER_NAME) = TRIM(UPPER(:i_user_name)) OR 
                TRIM(:i_user_name) = 'all'
          INTO o_user_name, o_primer_nombre, o_segundo_nombre, o_apellidos, 
               o_estado_activo, o_administrador, o_tag_nombre, o_tag_valor
               
          DO BEGIN
               SUSPEND;
                         
               FOR SELECT r.SEC$USER_NAME,  r.SEC$KEY AS TAG_NOMBRE, 
                         r.SEC$VALUE AS TAG_VALOR
                    FROM SEC$USER_ATTRIBUTES r /*Tabla que nos brinda la informacion o
                    Atributos de los usuarios.*/
                    WHERE TRIM(r.SEC$USER_NAME) = TRIM(:o_user_name)
                    INTO v_user_name, v_tag_nombre, v_tag_valor
                    DO BEGIN
                         o_user_name         = v_user_name;
                         o_primer_nombre     = 'TAGS';
                         o_segundo_nombre    = 'TAGS';
                         o_apellidos         = 'TAGS';
                         o_estado_activo     = FALSE;
                         o_administrador     = FALSE;
                         o_tag_nombre        = v_tag_nombre;
                         o_tag_valor         = v_tag_valor;
                         SUSPEND;
                    END
               o_user_name         = '';
               o_primer_nombre     = '';
               o_segundo_nombre    = '';
               o_apellidos         = '';
               o_estado_activo     = NULL;
               o_administrador     = NULL;
               o_tag_nombre        = '';
               o_tag_valor         = '';
               SUSPEND;
          END

END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_CANTIDAD_FILAS (
    TNCODSUC D_ID )
AS
DECLARE VARIABLE lcNombreTabla D_VARCHAR_25;
   DECLARE VARIABLE lnCantidadFilas D_ID;
   DECLARE VARIABLE lcComando D_VARCHAR_255; 
BEGIN
  FOR
      SELECT
         RDB$RELATION_NAME
      FROM
         RDB$RELATIONS
      WHERE
         RDB$SYSTEM_FLAG = 0 AND
         RDB$RELATION_TYPE = 0
      ORDER BY
         RDB$RELATION_NAME
      INTO
         :lcNombreTabla
   DO BEGIN
      lcComando = 'SELECT COUNT(*) FROM ' || lcNombreTabla ;
      EXECUTE STATEMENT (lcComando) INTO :lnCantidadFilas ;
      UPDATE OR INSERT INTO V_RECCOUNT
               (ID, TABLA, CANTIDAD)
        VALUES (:tnCodSuc , :lcNombreTabla, :lnCantidadFilas)
      MATCHING (TABLA);
   END
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_CLIENTE_SB (
    I_ID D_ID,
    I_PERSONA D_PERSONA,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T,
    I_ESTADO_CIVIL D_ESTADO_CIVIL )
AS
BEGIN
     /*Entidad PERSONA*/
     UPDATE V_PERSONAS a SET 
          a.PERSONA = :I_PERSONA, 
          a.PNOMBRE = :I_PNOMBRE, 
          a.SNOMBRE = :I_SNOMBRE, 
          a.APELLIDOS = :I_APELLIDOS, 
          a.SEXO = :I_SEXO, 
          a.FECHA_NACIMIENTO = :I_FECHA_NACIMIENTO, 
          a.ESTADO = :I_ESTADO
     WHERE
          a.ID = :I_ID;
     
     --Atributo GENERALES
     UPDATE V_GENERALES a SET 
          a.CEDULA = :I_CEDULA, 
          a.ID_TIPO_SANGRE = 0, 
          a.ESTADO_CIVIL = :I_ESTADO_CIVIL 
     WHERE
          a.ID_PERSONA = :I_ID;
     
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_DEUDA_ESTADO (
    E_ID_DEUDA D_ID NOT NULL,
    E_OBJ D_ESTADO_C_I_P_A_N_T NOT NULL )
RETURNS (
    S_SALIDA D_VARCHAR_15 )
AS
BEGIN
    
    IF((SELECT (1) FROM V_DEUDAS d WHERE d.ID = :e_id_Deuda) IS NULL)THEN
    BEGIN
          s_salida = 'No encontrada;';
          SUSPEND;
          EXCEPTION ERROR 'Deuda no encontrada...';
    END
    
    IF(:e_obj = 'i')THEN
    BEGIN
        UPDATE V_DEUDAS a
        SET 
            a.ESTADO = 'i'
        WHERE
            a.ID = :e_id_Deuda;
        s_salida = 'Iniciada';
        SUSPEND;
    END
    
    IF(:e_obj = 'p')THEN
    BEGIN
        UPDATE V_DEUDAS a
        SET 
            a.ESTADO = 'p'
        WHERE
            a.ID = :e_id_Deuda;
        s_salida = 'Pagada';
        SUSPEND;
    END
    
    IF(:e_obj = 'a')THEN
    BEGIN
        UPDATE V_DEUDAS a
        SET 
            a.ESTADO = 'a'
        WHERE
            a.ID = :e_id_Deuda;
        s_salida = 'Abonada';
        SUSPEND;
    END
    
    IF(:e_obj = 'n')THEN
    BEGIN
        UPDATE V_DEUDAS a
        SET 
            a.ESTADO = 'n'
        WHERE
            a.ID = :e_id_Deuda;
        s_salida = 'Nulada';
        SUSPEND;
    END
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_ESTUDIANTE (
    I_ID D_ID,
    I_ID_PADRE D_ID,
    I_ID_MADRE D_ID,
    I_ID_TUTOR D_ID,
    I_JCB_PARENTESCO D_ID,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T )
AS
BEGIN
     UPDATE V_PERSONAS a SET 
          a.PNOMBRE = :I_PNOMBRE, 
          a.SNOMBRE = :I_SNOMBRE, 
          a.APELLIDOS = :I_APELLIDOS, 
          a.SEXO = :I_SEXO, 
          a.FECHA_NACIMIENTO = :I_FECHA_NACIMIENTO, 
          a.ESTADO = :I_ESTADO
     WHERE
          a.ID = :I_ID;
     
     UPDATE V_ESTUDIANTES a SET 
          a.ID_PADRE = :I_ID_PADRE, 
          a.ID_MADRE = :I_ID_MADRE, 
          a.ID_TUTOR = :I_ID_TUTOR, 
          a.JCB_PARENTESCO = :I_JCB_PARENTESCO
     WHERE
          a.ID = :I_ID;
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_PADRES (
    I_ID D_ID,
    I_ID_PROVINCIA D_ID,
    I_ID_MUNICIPIO D_ID,
    I_ID_DISTRITO_MUNICIPAL D_ID,
    I_ID_CODIGOPOSTAL D_ID,
    I_ID_TIPO_SANGRE D_ID,
    I_CEDULA D_CEDULA,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_SEXO D_SEXO,
    I_DIRECCION D_VARCHAR_70,
    I_FECHA_NACIMIENTO D_FECHA,
    I_ESTADO D_BOOLEAN_T,
    I_ESTADO_CIVIL D_ESTADO_CIVIL )
AS
BEGIN

     UPDATE V_PERSONAS a
     SET  
          a.PNOMBRE = :I_PNOMBRE, 
          a.SNOMBRE = :I_SNOMBRE, 
          a.APELLIDOS = :I_APELLIDOS, 
          a.SEXO = :I_SEXO, 
          a.FECHA_NACIMIENTO = :I_FECHA_NACIMIENTO, 
          a.ESTADO = :I_ESTADO
     WHERE
          a.ID = :I_ID;
          
     UPDATE V_GENERALES a
     SET
          a.ID_TIPO_SANGRE = :I_ID_TIPO_SANGRE, 
          a.CEDULA = :I_CEDULA, 
          a.ESTADO_CIVIL = :I_ESTADO_CIVIL
     WHERE
          a.ID_PERSONA = :I_ID;
          
     UPDATE V_DIRECCIONES a
     SET 
          a.ID_PROVINCIA = :I_ID_PROVINCIA, 
          a.ID_MUNICIPIO = :I_ID_MUNICIPIO, 
          a.ID_DISTRITO_MUNICIPAL = :I_ID_DISTRITO_MUNICIPAL, 
          a.ID_CODIGO_POSTAL = :I_ID_CODIGOPOSTAL,  
          a.DIRECCION = :I_DIRECCION
     WHERE
          a.ID_PERSONA = :I_ID;
     
END
^
SET TERM ; ^


SET TERM ^ ;
ALTER PROCEDURE SP_UPDATE_USUARIOS (
    I_IDUSUARIO D_IDUSUARIO,
    I_CLAVE D_CLAVE,
    I_PNOMBRE D_NOMBRES,
    I_SNOMBRE D_NOMBRES,
    I_APELLIDOS D_APELLIDOS,
    I_ESTADO D_BOOLEAN_T,
    I_ADMINISTRADOR D_BOOLEAN_F,
    I_DESCRIPCION D_BLOB_TEXTO )
AS
DECLARE VARIABLE V_ID D_ID; 
DECLARE VARIABLE V_SQL D_VARCHAR_255;
BEGIN
     /*Validando que el usuario este registrado en la app*/
     IF((SELECT (1) FROM SEC$USERS r WHERE TRIM(r.SEC$USER_NAME) LIKE (TRIM(:I_IDUSUARIO))) IS NULL)THEN
          EXCEPTION ERROR 'Usuario NO registrado!';
     
          
     V_SQL = 'ALTER USER '||:I_IDUSUARIO||
     ' FIRSTNAME '''||i_pnombre||
     ''' MIDDLENAME '''||i_snombre||
     ''' LASTNAME '''||i_apellidos||
     ''''||iif(i_estado, ' ACTIVE ',' INACTIVE ') ||
     iif(i_administrador, ' GRANT ',' REVOKE ') || 
     ' ADMIN ROLE USING PLUGIN Srp ';
     
     EXECUTE STATEMENT V_SQL;
     
     IF(I_CLAVE != NULL)THEN
     BEGIN
          V_SQL = 'ALTER USER '||:I_IDUSUARIO||' PASSWORD '''||i_clave;
          EXECUTE STATEMENT V_SQL;
     END
     
     EXECUTE STATEMENT 'COMMENT ON USER '||:i_idusuario||' is '''||:I_DESCRIPCION||'''';
     /*
     Se actualizo el dia 19 05 2022, Nota: se quito el atributo PASSWORD de el 
     V_SQL porque modificaba el PASSWORD del usuario si venia, la linea 39 se 
     encargar de hacer esa actualizacion. 
     */
END
^
SET TERM ; ^





SET TERM ^ ;
ALTER PROCEDURE SYSTEM_SET_LICENCIA (
    E_FCHV CHAR(10),
    E_IDMAC VARCHAR(80),
    CLAVE1 CHAR(7),
    CLAVE2 CHAR(7) )
AS
declare variable V_FCHA varchar(20);
declare variable V_FCHI char(10);
BEGIN
    V_FCHI = (SELECT * FROM SYSTEM_ENCRIPTAR(current_date, 'E', :clave1, :clave2));
    V_FCHA = (SELECT * 
              FROM SYSTEM_ENCRIPTAR( 
              EXTRACT(DAY FROM CURRENT_DATE)||'.'||
              EXTRACT(MONTH FROM CURRENT_DATE)||'.'||
              EXTRACT(YEAR FROM CURRENT_DATE),
              'E',
              :clave1,
              :clave2));
    E_FCHV = (SELECT * FROM SYSTEM_ENCRIPTAR(:E_FCHV, 'E', :clave1, :clave2));
    E_IDMAC = (SELECT * FROM SYSTEM_ENCRIPTAR(:E_IDMAC, 'E', :clave1, :clave2));
    
    --Condicion necesaria para insertar el dato correctamente
    IF ((SELECT COUNT(*) FROM E_S_SYS) = 0) THEN
    BEGIN
        INSERT INTO E_S_SYS(ID_E_S_SYS, FCHI, FCHA, FCHV, IDMAC)
        VALUES(1, :V_FCHI, :V_FCHA, :E_FCHV, :E_IDMAC);
    END ELSE BEGIN
        UPDATE E_S_SYS a
        SET a.FCHI = :V_FCHI,
            a.FCHA = :V_FCHA,
            a.FCHV = :E_FCHV,
            a.IDMAC = :E_IDMAC;
    END
    
END
^
SET TERM ; ^
