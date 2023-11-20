CREATE TABLE ANALISIS
(--Si Serial
  ID SERIAL,
  ID_PACIENTE D_ID DEFAULT 0 NOT NULL,
  FECHA_HORA_CREADA D_FECHA_HORA NOT NULL,
  FECHA_HORA_VISTA D_FECHA_HORA NOT NULL,
  T_BHCG D_BOOLEAN_F,
  T_EMB_ORINA D_BOOLEAN_F,
  T_EMB_SANGRE D_BOOLEAN_F,
  T_ANT_AUSTRALIANO_BBSAG D_BOOLEAN_F,
  T_CLAMIDIA_IGA D_BOOLEAN_F,
  T_FTA_ABS D_BOOLEAN_F,
  T_HIV D_BOOLEAN_F,
  T_VDRL D_BOOLEAN_F,
  T_ACIDO_URICO D_BOOLEAN_F,
  T_ANT_FEBRILES D_BOOLEAN_F,
  T_ASO_LATEX D_BOOLEAN_F,
  T_BILIRRUBINA D_BOOLEAN_F,
  T_COLESTEROL_TOTAL D_BOOLEAN_F,
  T_COLESTEROL_HDL D_BOOLEAN_F,
  T_COLESTEROL_HDL_LDL D_BOOLEAN_F,
  T_COPROLOGICO D_BOOLEAN_F,
  T_CREATININA_SUERO D_BOOLEAN_F,
  T_CULTIVO_FARINGE D_BOOLEAN_F,
  T_CULTIVO_HECES D_BOOLEAN_F,
  T_CULTIVO_HERIDA_AEROBICO D_BOOLEAN_F,
  T_CULTIVO_OIDO D_BOOLEAN_F,
  T_CULTIVO_SANGRE D_BOOLEAN_F,
  T_CULTIVO_SEMEN D_BOOLEAN_F,
  T_CULTIVO_URETRA D_BOOLEAN_F,
  T_CULTIVO_VAGINA D_BOOLEAN_F,
  T_ELECTRO_HEMOGLOBINA D_BOOLEAN_F,
  T_ERITROSEDIMENTACION D_BOOLEAN_F,
  T_ESPERMATOGRAMA D_BOOLEAN_F,
  T_ESTRADIOL D_BOOLEAN_F,
  T_ESTROGENO_TOTALES D_BOOLEAN_F,
  T_FACTOR_REUMATOIDE D_BOOLEAN_F,
  T_FALCEMIA D_BOOLEAN_F,
  T_FOSFATASA_ALCALINA D_BOOLEAN_F,
  T_FSH D_BOOLEAN_F,
  T_GLICEMIA D_BOOLEAN_F,
  T_HEMOGLO_GLUCOSILADA D_BOOLEAN_F,
  T_HEMOGRAMA D_BOOLEAN_F,
  T_HEPATITIS_A D_BOOLEAN_F,
  T_HEPATITIS_C D_BOOLEAN_F,
  T_KOH D_BOOLEAN_F,
  T_LH D_BOOLEAN_F,
  T_ORINA D_BOOLEAN_F,
  T_PCR D_BOOLEAN_F,
  T_PROGESTERONA D_BOOLEAN_F,
  T_PROLACTINA D_BOOLEAN_F,
  T_PROTEINAS_TOTALES D_BOOLEAN_F,
  T_PSA_TOTAL D_BOOLEAN_F,
  T_PSA_LIBRE D_BOOLEAN_F,
  T_SANG_OCULT_HECES D_BOOLEAN_F,
  T_SGOT_TGO D_BOOLEAN_F,
  T_SGOT_TGP D_BOOLEAN_F,
  T_T3 D_BOOLEAN_F,
  T_T4 D_BOOLEAN_F,
  T_T4_LIBRE D_BOOLEAN_F,
  T_COOMBS_DIRECTO D_BOOLEAN_F,
  T_COOMBS_INDIRECTO D_BOOLEAN_F,
  T_TESTOSTERONA D_BOOLEAN_F,
  T_TIPIFICACION_SANGUINEA D_BOOLEAN_F,
  T_TOXOPLAS_IGG D_BOOLEAN_F,
  T_TOXOPLAS_IGM D_BOOLEAN_F,
  T_TRIGLICERIDOS D_BOOLEAN_F,
  T_TSH D_BOOLEAN_F,
  T_TUBERCULINA D_BOOLEAN_F,
  T_UREA D_BOOLEAN_F,
  OTROS D_VARCHAR_255,
  ROL D_ROL,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2397 PRIMARY KEY (ID)
);

CREATE TABLE ANTECEDENTES
(--Si Serial
  ID SERIAL,
  ID_PACIENTE D_ID NOT NULL,
  ID_DOCTOR D_ID DEFAULT 0 NOT NULL,
  FECHA D_FECHA NOT NULL,
  DESCRIPCION D_VARCHAR_255 NOT NULL,
  USUARIO D_IDUSUARIO,
  ROL D_ROL,
  CONSTRAINT INTEG_2401 PRIMARY KEY (ID)
);

CREATE TABLE ARS
(--Si Serial
  ID SERIAL,
  DESCRIPCION D_VARCHAR_45 NOT NULL,
  COVERCONSULTAPORC D_DESCUENTO NOT NULL,
  ESTADO D_BOOLEAN_T NOT NULL,
  ROL D_ROL NOT NULL,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2404 PRIMARY KEY (ID),
  CONSTRAINT INTEG_2405 UNIQUE (DESCRIPCION)
);

CREATE TABLE ASEGURADOS
(--Si Serial
  ID SERIAL,
  ID_PERSONA D_ID,
  ID_ARS D_ID,
  NO_NSS D_VARCHAR_25,
  ESTADO D_BOOLEAN_T NOT NULL,
  CONSTRAINT PK_ASEGURADOS_0 PRIMARY KEY (ID),
  CONSTRAINT UNQ_ASEGURADOS_0 UNIQUE (NO_NSS)
);

CREATE TABLE CATEGORIAS
(--Si Serial
  ID SERIAL,
  DESCRIPCION D_VARCHAR_25 NOT NULL,
  IMAGEN_TEXTO D_BLOB_TEXTO,
  FECHA_CREACION D_FECHA NOT NULL,
  ESTADO D_BOOLEAN_T NOT NULL,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2410 PRIMARY KEY (ID),
  CONSTRAINT UNQ_CATEGORIAS_0 UNIQUE (DESCRIPCION)
);

CREATE TABLE CLIENTES
(--No Serial
  ID D_ID NOT NULL,
  CONSTRAINT PK_CLIENTES_0 PRIMARY KEY (ID)
);

CREATE TABLE CODIGOS_POSTALES
(--Si Serial
  ID SERIAL,
  IDPROVINCIA D_ID,
  LOCALIDAD D_VARCHAR_45,
  CODIGO_POSTAL D_ID,
  CONSTRAINT INTEG_2414 PRIMARY KEY (ID)
);

CREATE TABLE CONSULTAS
(--Si Serial
  ID SERIAL,
  ID_PACIENTE D_ID,
  ID_MOTIVO_CONSULTA D_ID DEFAULT 0 NOT NULL,
  ID_CONTROL_CONSULTA D_ID,
  FECHA D_FECHA,
  TURNO D_TURNO,
  ESTADO D_BOOLEAN_T,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2415 PRIMARY KEY (ID)
);

CREATE TABLE CONSULTAS_APROBADAS
(--Si Serial
  ID SERIAL,
  COD_AUTORIZACION D_VARCHAR_15 NOT NULL,
  COSTO D_DINERO NOT NULL,
  DESCUENTO D_DESCUENTO NOT NULL,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2416 PRIMARY KEY (ID),
  CONSTRAINT INTEG_2417 UNIQUE (COD_AUTORIZACION)
);

CREATE TABLE CONTACTOS_EMAIL
(--Si Serial
  ID SERIAL,
  ID_PERSONA D_ID NOT NULL,
  EMAIL D_CORREO NOT NULL,
  FECHA D_FECHA NOT NULL,
  CONSTRAINT INTEG_1093 PRIMARY KEY (ID)
);

CREATE TABLE CONTACTOS_TEL
(--Si Serial
  ID SERIAL,
  ID_PERSONA D_ID NOT NULL,
  TELEFONO D_TELEFONO NOT NULL,
  TIPO D_VARCHAR_15 NOT NULL,
  FECHA D_FECHA NOT NULL,
  CONSTRAINT INTEG_1092 PRIMARY KEY (ID)
);

CREATE TABLE CONTROL_CONSULTA
(--Si Serial
  ID SERIAL,
  USER_NAME D_IDUSUARIO,
  CANTIDADPACIENTE D_TURNO,
  DIA D_DIA,
  INICIAL D_HORA,
  FINAL D_HORA,
  IDUSUARIO D_IDUSUARIO,
  ESTADO D_BOOLEAN_T,
  CONSTRAINT INTEG_2422 PRIMARY KEY (ID)
);

CREATE TABLE DATOS_NACIMIENTO
(--No Serial
  ID D_ID NOT NULL,
  PESONACIMIENTOKG D_MEDIDA,
  ALTURA D_MEDIDA,
  PERIMETRO_CEFALICO D_MEDIDA,
  CESAREA D_BOOLEAN_T,
  TIEMPOGESTACION D_MEDIDA,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2423 PRIMARY KEY (ID)
);

CREATE TABLE DETALLE_FACTURA
(--No Serial
  ID D_ID NOT NULL,
  IDLINEA D_ID NOT NULL,
  IDPRODUCTO D_ID NOT NULL,
  PRECIO D_DINERO NOT NULL,
  CANTIDAD D_DINERO NOT NULL,
  CONSTRAINT PK_DETALLEFACTURA_01 PRIMARY KEY (ID,IDLINEA)
);

CREATE TABLE DEUDAS
(--Si Serial
  ID SERIAL,
  ID_PERSONA D_ID NOT NULL,
  ID_FACTURA D_ID DEFAULT 0 NOT NULL,
  CONCEPTO D_VARCHAR_255 NOT NULL,
  MONTO D_DINERO NOT NULL,
  FECHA D_FECHA NOT NULL,
  HORA D_HORA NOT NULL,
  ESTADO D_ESTADO_C_I_P_A_N_T NOT NULL,
  CONSTRAINT INTEG_2432 PRIMARY KEY (ID)
);

CREATE TABLE DIRECCIONES
(
  ID SERIAL,
  ID_PERSONA D_ID NOT NULL,
  ID_PROVINCIA D_ID DEFAULT 0 NOT NULL,
  ID_MUNICIPIO D_ID DEFAULT 0 NOT NULL,
  ID_DISTRITO_MUNICIPAL D_ID DEFAULT 0 NOT NULL,
  ID_CODIGO_POSTAL D_ID DEFAULT 0 NOT NULL,
  DIRECCION D_VARCHAR_255 DEFAULT 'Sin direccion ingresada',
  FECHA D_FECHA NOT NULL,
  CONSTRAINT INTEG_2574 PRIMARY KEY (ID)
);

CREATE TABLE DISTRITOS_MUNICIPALES
(
  ID SERIAL,
  NOMBRE D_VARCHAR_45,
  IDMUNICIPIO D_ID,
  CONSTRAINT INTEG_2439 PRIMARY KEY (ID)
);

CREATE TABLE D_DEUDAS_PAGAS
(
  ID D_ID NOT NULL,
  ID_DEUDAS D_ID NOT NULL,
  MONTO_PAGO D_DINERO NOT NULL,
  FECHA_HORA D_FECHA_HORA DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT D_DEUDAS_PAGAS_PK PRIMARY KEY (ID)
);

CREATE TABLE D_FACTURAS
(
  ID_FACTURA D_ID NOT NULL,
  ID_LINEA D_ID NOT NULL,
  ID_PRODUCTO D_ID NOT NULL,
  PRECIO D_DINERO NOT NULL,
  CANTIDAD D_DINERO NOT NULL,
  CONSTRAINT PK_D_FACTURAS_01 PRIMARY KEY (ID_FACTURA,ID_LINEA)
);

CREATE TABLE D_GUIA_VIGILANCIA_DESARROLLO
(
  ID_GVD D_ID NOT NULL,
  ID_PACIENTE D_ID NOT NULL,
  FECHA D_FECHA_HORA,
  CONSTRAINT INTEG_96 PRIMARY KEY (ID_GVD,ID_PACIENTE)
);

CREATE TABLE D_MOTIVO_CONSULTA
(
  IDCONSULTA D_ID NOT NULL,
  TURNO D_ID NOT NULL,
  IDMCONSULTA D_ID NOT NULL,
  CONSTRAINT PK_TABLE209 PRIMARY KEY (IDCONSULTA,TURNO,IDMCONSULTA)
);

CREATE TABLE D_RECETAS
(
  ID_RECETA D_ID NOT NULL,
  LINEA D_TURNO NOT NULL,
  ID_MEDICAMENTO D_ID NOT NULL,
  CANTIDAD D_MEDIDA,
  D_DOSIS D_VARCHAR_255,
  CONSTRAINT CON_DETALLERECETAS PRIMARY KEY (ID_RECETA,LINEA)
);

CREATE TABLE ENTRADA_PRODUCTOS
(
  ID SERIAL,
  IDPROVEDOR D_ID NOT NULL,
  COD_FACTURA D_CODIGO NOT NULL,
  LINEA D_ID NOT NULL,
  IDPRODUCTO D_ID NOT NULL,
  ENTRADA D_DINERO NOT NULL,
  FECHAVECIMIENTO D_FECHA,
  ESTADO D_BOOLEAN_T NOT NULL,
  USUARIO D_IDUSUARIO NOT NULL,
  ROL D_ROL,
  CONSTRAINT INTEG_2440 PRIMARY KEY (ID),
  CONSTRAINT UNQ_ENTRADA_PRODUCTOS_0 UNIQUE (IDPROVEDOR,COD_FACTURA,IDPRODUCTO)
);

CREATE TABLE ESTUDIANTE
(
  ID D_ID NOT NULL,
  MATRICULA D_VARCHAR_15 NOT NULL,
  ID_PADRE D_ID NOT NULL,
  ID_MADRE D_ID NOT NULL,
  ID_TUTOR D_ID NOT NULL,
  JCB_PARENTESCO D_ID NOT NULL,
  CONSTRAINT INTEG_1059 PRIMARY KEY (ID),
  CONSTRAINT UNQ_MATRICULA UNIQUE (MATRICULA)
);

CREATE TABLE E_S_SYS
(
  ID_E_S_SYS SERIAL,
  FCHI D_VARCHAR_25 NOT NULL,
  FCHA D_VARCHAR_25 NOT NULL,
  FCHV D_VARCHAR_25 NOT NULL,
  IDMAC D_VARCHAR_70 NOT NULL,
  LOGO D_BLOB_TEXTO,
  CONSTRAINT INTEG_1405 PRIMARY KEY (ID_E_S_SYS)
);

CREATE TABLE FACTURAS
(
  ID SERIAL,
  ID_CLIENTE D_ID NOT NULL,
  IDTURNO D_ID NOT NULL,
  EFECTIVO D_DINERO NOT NULL,
  CAMBIO D_DINERO NOT NULL,
  FECHA D_FECHA NOT NULL,
  HORA D_HORA NOT NULL,
  ESTADO_FACTURA D_ESTADO_C_I_P_A_N_T,
  IDUSUARIO D_IDUSUARIO NOT NULL,
  NOMBRE_TEMP D_NOMBRES NOT NULL,
  CONSTRAINT INTEG_2447 PRIMARY KEY (ID)
);

CREATE TABLE GENERALES
(
  ID_PERSONA D_ID NOT NULL,
  CEDULA D_CEDULA NOT NULL,
  ID_TIPO_SANGRE D_ID,
  ESTADO_CIVIL D_ESTADO_CIVIL,
  CONSTRAINT PK_GENERALES_0 PRIMARY KEY (ID_PERSONA)
);

CREATE TABLE GUIA_VIGILANCIA_DESARROLLO
(
  ID SERIAL,
  EDAD D_EDAD,
  CARACT_DESARR_EVALUAR D_VARCHAR_255,
  CONSTRAINT INTEG_2568 PRIMARY KEY (ID)
);

CREATE TABLE HISTORIAL_CAMBIOS_PERSONA
(
  ID SERIAL,
  ID_PERSONA D_ID NOT NULL,
  FECHA_HORA_ULTIMO_UPDATE D_FECHA_HORA NOT NULL,
  CONSTRAINT INTEG_2639 PRIMARY KEY (ID)
);

CREATE TABLE HUELLAS
(
  ID SERIAL,
  TIPO_DEDO D_DEDO NOT NULL,
  IMAGEN_TEXTO D_BLOB_TEXTO,
  CONSTRAINT HUELLAS_PK PRIMARY KEY (ID,TIPO_DEDO)
);

CREATE TABLE INSCRIPCION
(
  ID SERIAL,
  ID_ESTUDIANTE D_ID NOT NULL,
  ID_PADRE_TUTOR D_ID NOT NULL,
  ID_TANDA D_ID NOT NULL,
  PAGO D_DINERO NOT NULL,
  FECHA_INSCRIPCION D_FECHA_HORA NOT NULL,
  IDUSUARIO D_IDUSUARIO NOT NULL,
  CONSTRAINT INTEG_1076 PRIMARY KEY (ID)
);

CREATE TABLE MEDICAMENTOS
(
  ID SERIAL,
  ID_PROVEEDOR INTEGER,
  DESCRIPCION D_VARCHAR_70,
  IMAGEN_TEXTO D_BLOB_TEXTO,
  ESTADO D_BOOLEAN_T,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2558 PRIMARY KEY (ID)
);

CREATE TABLE MENSAJES
(
  ID SERIAL,
  ID_DOCTOR D_ID NOT NULL,
  ID_PACIENTE D_ID DEFAULT 0 NOT NULL,
  HORA D_HORA NOT NULL,
  FECHA D_FECHA NOT NULL,
  MENSAJE D_BLOB_TEXTO NOT NULL,
  ESTADO D_ESTADO_MENSAJES NOT NULL,
  CONSTRAINT INTEG_2631 PRIMARY KEY (ID)
);

CREATE TABLE METRICAS
(
  ID SERIAL,
  IDCONSULTA D_ID,
  FECHA D_FECHA_HORA,
  PESOKG D_MEDIDA,
  ESTATURAMETRO D_MEDIDA,
  ESCEFALO D_MEDIDA,
  ENF_DETECT D_VARCHAR_255,
  HALLAZGOS_POS D_VARCHAR_255,
  ID_DIAG D_VARCHAR_255,
  TX D_VARCHAR_255,
  COMPLEMENTO D_VARCHAR_255,
  IMAGEN_TEXTO D_BLOB_TEXTO,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2512 PRIMARY KEY (ID)
);

CREATE TABLE MOTIVO_CONSULTA
(
  ID SERIAL,
  DESCRIPCION D_VARCHAR_45 NOT NULL,
  CONSTRAINT INTEG_2563 PRIMARY KEY (ID),
  CONSTRAINT INTEG_2565 UNIQUE (DESCRIPCION)
);

CREATE TABLE MUNICIPIOS
(
  ID SERIAL,
  NOMBRE D_VARCHAR_45,
  IDPROVINCIA D_ID,
  CONSTRAINT INTEG_2456 PRIMARY KEY (ID)
);

CREATE TABLE PACIENTES
(
  ID D_ID NOT NULL,
  ID_MADRE D_ID DEFAULT 0 NOT NULL,
  ID_PADRE D_ID DEFAULT 0 NOT NULL,
  CONSTRAINT INTEG_2548 PRIMARY KEY (ID)
);

CREATE TABLE PADRES
(
  ID D_ID NOT NULL,
  CONSTRAINT PK_PADRES_0 PRIMARY KEY (ID)
);

CREATE TABLE PERSONAS
(
  ID SERIAL,
  PERSONA D_PERSONA NOT NULL,
  PNOMBRE D_NOMBRES NOT NULL,
  SNOMBRE D_NOMBRES NOT NULL,
  APELLIDOS D_APELLIDOS NOT NULL,
  SEXO D_SEXO NOT NULL,
  FECHA_NACIMIENTO D_FECHA NOT NULL,
  FECHA_INGRESO D_FECHA_HORA NOT NULL,
  FECHA_HORA_ULTIMO_UPDATE D_FECHA_HORA NOT NULL,
  ESTADO D_BOOLEAN_T NOT NULL,
  IDUSUARIO D_IDUSUARIO,
  ROL_USUARIO D_ROL NOT NULL,
  CONSTRAINT INTEG_2457 PRIMARY KEY (ID)
);

CREATE TABLE PRODUCTOS
(
  ID SERIAL,
  IDCATEGORIA D_ID NOT NULL,
  CODIGO D_VARCHAR_25 NOT NULL,
  DESCRIPCION D_VARCHAR_70 NOT NULL,
  IMAGEN_TEXTO D_BLOB_TEXTO,
  NOTA D_VARCHAR_255 DEFAULT 'N/A',
  FECHA_CREACION D_FECHA,
  ESTADO D_BOOLEAN_T,
  IDUSUARIO D_IDUSUARIO,
  ROL D_ROL,
  CONSTRAINT INTEG_2474 PRIMARY KEY (ID),
  CONSTRAINT INTEG_2475 UNIQUE (CODIGO),
  CONSTRAINT INTEG_2477 UNIQUE (DESCRIPCION)
);

CREATE TABLE PROVEEDORES
(
  ID D_ID NOT NULL,
  CODIGO_PROVEEDOR D_CODIGO NOT NULL,
  CONSTRAINT INTEG_2481 PRIMARY KEY (ID),
  CONSTRAINT INTEG_2482 UNIQUE (CODIGO_PROVEEDOR)
);

CREATE TABLE PROVINCIAS
(
  ID SERIAL,
  NOMBRE D_VARCHAR_45 NOT NULL,
  ZONA D_PUNTO_CARDINALES,
  CONSTRAINT INTEG_2485 PRIMARY KEY (ID)
);

CREATE TABLE RECCOUNT
(
  ID SERIAL,
  TABLA D_VARCHAR_45 NOT NULL,
  CANTIDAD D_ID NOT NULL,
  CONSTRAINT INTEG_2572 PRIMARY KEY (ID),
  CONSTRAINT UNQ_RECCOUNT_0 UNIQUE (TABLA)
);

CREATE TABLE RECETAS
(
  ID SERIAL,
  IDCONSULTA D_ID NOT NULL,
  FECHA D_FECHA_HORA NOT NULL,
  IDUSUARIO D_IDUSUARIO NOT NULL,
  CONSTRAINT INTEG_2487 PRIMARY KEY (ID)
);

CREATE TABLE SINTOMAS
(
  ID SERIAL,
  ID_PACIENTE D_ID DEFAULT 0 NOT NULL,
  SINTOMAS D_VARCHAR_255,
  FECHA D_FECHA,
  HORA D_HORA,
  NOTA D_VARCHAR_255,
  IDUSUARIO D_IDUSUARIO,
  CONSTRAINT INTEG_2491 PRIMARY KEY (ID)
);

CREATE TABLE TANDAS
(
  ID SERIAL,
  ANNO_INICIAL D_FECHA DEFAULT CURRENT_DATE NOT NULL,
  ANNO_FINAL D_FECHA NOT NULL,
  HORA_INICIO D_HORA NOT NULL,
  HORA_FINAL D_HORA NOT NULL,
  LUNES D_BOOLEAN_F,
  MARTES D_BOOLEAN_F,
  MIERCOLES D_BOOLEAN_F,
  JUEVES D_BOOLEAN_F,
  VIERNES D_BOOLEAN_F,
  SABADOS D_BOOLEAN_F,
  DOMINGOS D_BOOLEAN_F,
  CANTIDAD_ESTUDIANTES D_TURNO,
  EDAD_MINIMA D_TURNO,
  EDAD_MAXIMA D_TURNO,
  CON_EDAD D_TURNO,
  ESTADO D_BOOLEAN_T,
  CONSTRAINT INTEG_1068 PRIMARY KEY (ID)
);

CREATE TABLE TIPOS_SANGRE
(--Si Serial
  ID SERIAL,
  DESCRIPCION D_SANGRE_SIMBOLOS,
  CONSTRAINT INTEG_2492 PRIMARY KEY (ID)
);

CREATE TABLE TURNOS
(--Si Serial
  ID SERIAL,
  FECHAINICIO D_FECHA NOT NULL,
  HORAINICIO D_HORA NOT NULL,
  FECHAFINAL D_FECHA,
  HORAFINAL D_HORA,
  ESTADO D_BOOLEAN_T,
  IDUSUARIO D_IDUSUARIO,
  ROL D_ROL,
  CONSTRAINT INTEG_2493 PRIMARY KEY (ID)
);