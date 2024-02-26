-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP TYPE public.almacenes;

CREATE TYPE public.almacenes AS (
	id d_id,
	nombre d_varchar_70,
	ubicacion d_varchar_255,
	estado d_boolean_t);

-- DROP TYPE public.antecedentes;

CREATE TYPE public.antecedentes AS (
	id d_id,
	id_consulta d_id,
	descripcion d_varchar_1024);

-- DROP TYPE public.ars;

CREATE TYPE public.ars AS (
	id d_id,
	descripcion d_varchar_45,
	coverconsultaporc d_descuento,
	estado d_boolean_t,
	cantidad_registro d_id,
	user_name d_user_name,
	rol d_rol);

-- DROP TYPE public.asegurados;

CREATE TYPE public.asegurados AS (
	id_persona d_id,
	id_ars d_id,
	no_nss d_varchar_25,
	estado d_boolean_t);

-- DROP TYPE public.cartones_bingo;

CREATE TYPE public.cartones_bingo AS (
	id d_id,
	carton_hash d_id,
	fecha_creaccion d_fecha_hora,
	matriz_obj d_blob_texto,
	estado d_boolean_t);

-- DROP TYPE public.categorias;

CREATE TYPE public.categorias AS (
	id d_id,
	descripcion d_varchar_25,
	imagen_texto d_blob_texto,
	fecha_creacion d_fecha,
	estado d_boolean_t,
	user_name d_user_name);

-- DROP TYPE public.codigos_postales;

CREATE TYPE public.codigos_postales AS (
	id d_id,
	idprovincia d_id,
	localidad d_varchar_45,
	codigo_postal d_id);

-- DROP TYPE public.consultas;

CREATE TYPE public.consultas AS (
	id d_id,
	id_paciente d_id,
	id_control_consulta d_id,
	fecha d_fecha,
	turno d_turno,
	estado d_boolean_t,
	user_name d_user_name);

-- DROP TYPE public.consultas_aprobadas;

CREATE TYPE public.consultas_aprobadas AS (
	id d_id,
	cod_autorizacion d_varchar_15,
	costo d_dinero,
	descuento d_descuento,
	user_name d_user_name);

-- DROP TYPE public.contactos_direcciones;

CREATE TYPE public.contactos_direcciones AS (
	id d_id,
	id_persona d_id,
	id_provincia d_id,
	id_municipio d_id,
	id_distrito_municipal d_id,
	id_codigo_postal d_id,
	direccion d_varchar_255,
	fecha d_fecha,
	estado d_boolean_f,
	por_defecto d_boolean_f);

-- DROP TYPE public.contactos_email;

CREATE TYPE public.contactos_email AS (
	id d_id,
	id_persona d_id,
	email d_correo,
	fecha d_fecha,
	estado d_boolean_t,
	por_defecto d_boolean_t);

-- DROP TYPE public.contactos_tel;

CREATE TYPE public.contactos_tel AS (
	id d_id,
	id_persona d_id,
	telefono d_telefono,
	tipo d_varchar_15,
	fecha d_fecha,
	estado d_boolean_t,
	por_defecto d_boolean_t);

-- DROP TYPE public.control_consulta;

CREATE TYPE public.control_consulta AS (
	id d_id,
	user_name d_user_name,
	cantidadpaciente d_turno,
	dia d_dia,
	inicial d_hora,
	"final" d_hora,
	estado d_boolean_t,
	user_name_ d_user_name);

-- DROP DOMAIN public."d_abreviatura";

CREATE DOMAIN public."d_abreviatura" AS character(1)
	COLLATE "default"
	DEFAULT 'S'::bpchar
	CONSTRAINT d_abreviatura_check CHECK (VALUE = ANY (ARRAY['S'::bpchar, 'I'::bpchar, 'U'::bpchar, 'D'::bpchar, 'G'::bpchar, 'M'::bpchar, 'X'::bpchar, 'R'::bpchar]));
-- DROP TYPE public.d_analisis;

CREATE TYPE public.d_analisis AS (
	id d_id,
	id_m_analisis d_id,
	linea d_id,
	id_t_analitica d_id,
	otro d_varchar_1024);

-- DROP DOMAIN public."d_apellidos";

CREATE DOMAIN public."d_apellidos" AS character varying(40)
	COLLATE "default"
	DEFAULT ''::character varying
	CONSTRAINT d_apellidos_check CHECK (VALUE::text ~ similar_to_escape('[[:ALPHA:]-'' .ÑñÁáÉéÍíÓóÚú]*'::text, '@'::text));
-- DROP DOMAIN public.d_blob_binario;

CREATE DOMAIN public.d_blob_binario AS bytea;
-- DROP DOMAIN public."d_blob_texto";

CREATE DOMAIN public."d_blob_texto" AS text
	COLLATE "default";
-- DROP DOMAIN public."d_boolean_f";

CREATE DOMAIN public."d_boolean_f" AS boolean
	DEFAULT false;
-- DROP DOMAIN public."d_boolean_t";

CREATE DOMAIN public."d_boolean_t" AS boolean
	DEFAULT true;
-- DROP DOMAIN public."d_cedula";

CREATE DOMAIN public."d_cedula" AS character(13)
	COLLATE "default"
	CONSTRAINT d_cedula_check CHECK (VALUE ~ similar_to_escape('[[:DIGIT:]]{3}[-][[:DIGIT:]]{7}[-][[:DIGIT:]]{1}'::text));
COMMENT ON TYPE public."d_cedula" IS 'Esto es una cedula por ejemplo: 000-0012345-2';
-- DROP DOMAIN public."d_clave";

CREATE DOMAIN public."d_clave" AS character varying(30)
	COLLATE "default";
-- DROP DOMAIN public."d_codigo";

CREATE DOMAIN public."d_codigo" AS character varying(20)
	COLLATE "default";
-- DROP DOMAIN public."d_codigo_cuenta_contable";

CREATE DOMAIN public."d_codigo_cuenta_contable" AS character varying(14)
	COLLATE "default"
	DEFAULT '-1'::character varying;
-- DROP DOMAIN public."d_codigo_pai";

CREATE DOMAIN public."d_codigo_pai" AS character(7)
	COLLATE "default";
-- DROP DOMAIN public."d_correo";

CREATE DOMAIN public."d_correo" AS character varying(100)
	COLLATE "default"
	CONSTRAINT d_correo_check CHECK (TRIM(BOTH FROM VALUE) ~ similar_to_escape('[[:ALNUM:]-_.]*@[[:ALNUM:]-_]*.[[:ALPHA:].]*'::text) AND ascii_val(SUBSTRING(VALUE FROM 1 FOR 1)::character varying) > 65 AND ascii_val(SUBSTRING(VALUE FROM 1 FOR 1)::character varying) < 90 OR ascii_val(SUBSTRING(VALUE FROM 1 FOR 1)::character varying) > 97 AND ascii_val(SUBSTRING(VALUE FROM 1 FOR 1)::character varying) < 122);
-- DROP DOMAIN public."d_dedo";

CREATE DOMAIN public."d_dedo" AS character(2)
	COLLATE "default"
	DEFAULT 'IN'::bpchar
	CONSTRAINT d_dedo_check CHECK (VALUE = ANY (ARRAY['PU'::bpchar, 'IN'::bpchar, 'MA'::bpchar, 'AN'::bpchar, 'ME'::bpchar]));
-- DROP DOMAIN public."d_descuento";

CREATE DOMAIN public."d_descuento" AS numeric(5,2)
	DEFAULT 0.00
	CONSTRAINT d_descuento_check CHECK (VALUE >= 0::numeric AND VALUE <= 100::numeric);
-- DROP TYPE public.d_deudas_pagas;

CREATE TYPE public.d_deudas_pagas AS (
	id d_id,
	id_deudas d_id,
	monto_pago d_dinero,
	fecha_hora d_fecha_hora);

-- DROP DOMAIN public."d_dia";

CREATE DOMAIN public."d_dia" AS character(2)
	COLLATE "default"
	DEFAULT 'LU'::bpchar
	CONSTRAINT d_dia_check CHECK (VALUE = ANY (ARRAY['LU'::bpchar, 'MA'::bpchar, 'MI'::bpchar, 'JU'::bpchar, 'VI'::bpchar, 'SA'::bpchar, 'DO'::bpchar]));
-- DROP DOMAIN public."d_dinero";

CREATE DOMAIN public."d_dinero" AS numeric(18,2)
	DEFAULT 0.00;
-- DROP DOMAIN public."d_doble_presicion";

CREATE DOMAIN public."d_doble_presicion" AS double precision;
-- DROP DOMAIN public."d_edad";

CREATE DOMAIN public."d_edad" AS smallint
	DEFAULT 0
	CONSTRAINT d_edad_check CHECK (VALUE >= 0);
COMMENT ON TYPE public."d_edad" IS 'Dominio que se encarga de asegurar que las edades sean mayores a 0.';
-- DROP TYPE public.d_entrada_producto;

CREATE TYPE public.d_entrada_producto AS (
	id_m_entrada_producto d_id,
	linea d_id,
	id_producto d_id,
	entrada d_medida,
	costo d_dinero,
	precio d_dinero,
	fecha_vecimiento d_fecha,
	observacion d_varchar_1024);

-- DROP DOMAIN public."d_estado_c_i_p_a_n_t";

CREATE DOMAIN public."d_estado_c_i_p_a_n_t" AS character(1)
	COLLATE "default"
	DEFAULT 'i'::bpchar
	CONSTRAINT d_estado_c_i_p_a_n_t_check CHECK (lower(VALUE::text) = ANY (ARRAY['c'::text, 'i'::text, 'p'::text, 'a'::text, 'n'::text, 't'::text]));
COMMENT ON TYPE public."d_estado_c_i_p_a_n_t" IS '
	Estado si es Deuda Inicial (i), Pagada (p), Abonada (a), Nulada (n), Temporal (t), Credito (c).
';
-- DROP DOMAIN public."d_estado_civil";

CREATE DOMAIN public."d_estado_civil" AS character(1)
	COLLATE "default"
	DEFAULT 'S'::bpchar
	CONSTRAINT d_estado_civil_check CHECK (VALUE = ANY (ARRAY['S'::bpchar, 'C'::bpchar, 'D'::bpchar, 'V'::bpchar, 'U'::bpchar, 'X'::bpchar]));
COMMENT ON TYPE public."d_estado_civil" IS '
El dominio D_ESTADO_CIVIL admitirá una sola letra mayúscula la cual puede ser:
S(soltero)
C(casado)
D(divorciado)
V(viudo)
U(Union Libre)
X(Desconocido)
';
-- DROP DOMAIN public."d_estado_mensajes";

CREATE DOMAIN public."d_estado_mensajes" AS character(1)
	COLLATE "default"
	DEFAULT 'N'::bpchar
	CONSTRAINT d_estado_mensajes_check CHECK (VALUE = ANY (ARRAY['N'::bpchar, 'L'::bpchar, 'R'::bpchar, 'B'::bpchar]));
-- DROP TYPE public.d_facturas;

CREATE TYPE public.d_facturas AS (
	id_factura d_id,
	id_linea d_id,
	id_producto d_id,
	precio d_dinero,
	cantidad d_dinero);

-- DROP DOMAIN public."d_fecha";

CREATE DOMAIN public."d_fecha" AS date
	DEFAULT CURRENT_DATE;
-- DROP DOMAIN public."d_fecha_hora";

CREATE DOMAIN public."d_fecha_hora" AS timestamp without time zone
	DEFAULT CURRENT_TIMESTAMP;
-- DROP TYPE public.d_guia_vigilancia_desarrollo;

CREATE TYPE public.d_guia_vigilancia_desarrollo AS (
	id_gvd d_id,
	id_paciente d_id,
	fecha d_fecha_hora);

-- DROP DOMAIN public."d_hora";

CREATE DOMAIN public."d_hora" AS time without time zone
	DEFAULT CURRENT_TIME;
-- DROP DOMAIN public."d_id";

CREATE DOMAIN public."d_id" AS integer
	CONSTRAINT d_id_check CHECK (VALUE >= '-1'::integer);
-- DROP DOMAIN public."d_insert_delete";

CREATE DOMAIN public."d_insert_delete" AS character(1)
	COLLATE "default"
	DEFAULT 'I'::bpchar
	CONSTRAINT d_insert_delete_check CHECK (upper(VALUE::text) = ANY (ARRAY['I'::text, 'D'::text]));
-- DROP DOMAIN public."d_medida";

CREATE DOMAIN public."d_medida" AS numeric(18,2)
	DEFAULT 0.00;
-- DROP TYPE public.d_motivo_consulta;

CREATE TYPE public.d_motivo_consulta AS (
	idconsulta d_id,
	idmconsulta d_id);

-- DROP DOMAIN public."d_nivel_cuenta";

CREATE DOMAIN public."d_nivel_cuenta" AS character(1)
	COLLATE "default"
	DEFAULT 'X'::bpchar
	CONSTRAINT d_nivel_cuenta_check CHECK (VALUE = ANY (ARRAY['D'::bpchar, 'G'::bpchar]));
-- DROP DOMAIN public."d_nombres";

CREATE DOMAIN public."d_nombres" AS character varying(40)
	COLLATE "default"
	DEFAULT ''::character varying
	CONSTRAINT d_nombres_check CHECK (VALUE::text ~ similar_to_escape('[[:ALPHA:]-'' .ÑñÁáÉéÍíÓóÚú]*'::text, '@'::text));
-- DROP DOMAIN public."d_persona";

CREATE DOMAIN public."d_persona" AS character(1)
	COLLATE "default"
	DEFAULT 'F'::bpchar
	CONSTRAINT d_persona_check CHECK (VALUE = ANY (ARRAY['F'::bpchar, 'J'::bpchar, 'X'::bpchar]));
-- DROP DOMAIN public."d_punto_cardinales";

CREATE DOMAIN public."d_punto_cardinales" AS character varying(5)
	COLLATE "default"
	DEFAULT 'N/A'::character varying
	CONSTRAINT d_punto_cardinales_check CHECK (VALUE::text = ANY (ARRAY['Norte'::character varying, 'Este'::character varying, 'Sur'::character varying, 'Oeste'::character varying, 'N/A'::character varying]::text[]));
-- DROP TYPE public.d_recetas;

CREATE TYPE public.d_recetas AS (
	id_receta d_id,
	linea d_turno,
	id_medicamento d_id,
	cantidad d_medida,
	d_dosis d_varchar_255);

-- DROP DOMAIN public."d_rol";

CREATE DOMAIN public."d_rol" AS character(31)
	COLLATE "default"
	DEFAULT CURRENT_ROLE;
-- DROP DOMAIN public."d_sangre_simbolos";

CREATE DOMAIN public."d_sangre_simbolos" AS character varying(3)
	COLLATE "default"
	DEFAULT 'N/A'::character varying
	CONSTRAINT d_sangre_simbolos_check CHECK (VALUE::text = ANY (ARRAY['N/A'::character varying, 'O-'::character varying, 'O+'::character varying, 'A-'::character varying, 'A+'::character varying, 'B-'::character varying, 'B+'::character varying, 'AB-'::character varying, 'AB+'::character varying]::text[]));
-- DROP DOMAIN public."d_sexo";

CREATE DOMAIN public."d_sexo" AS character(1)
	COLLATE "default"
	DEFAULT 'M'::bpchar
	CONSTRAINT d_sexo_check CHECK (upper(VALUE::text) = 'M'::text OR upper(VALUE::text) = 'F'::text OR upper(VALUE::text) = 'X'::text);
-- DROP DOMAIN public."d_telefono";

CREATE DOMAIN public."d_telefono" AS character(16)
	COLLATE "default"
	CONSTRAINT d_telefono_check CHECK (VALUE ~ similar_to_escape('[+][1][(][[:digit:]]{3}[)][ ][[:digit:]]{3}[-][[:digit:]]{4}'::text));
-- DROP DOMAIN public."d_tiempo_gestacion";

CREATE DOMAIN public."d_tiempo_gestacion" AS numeric(4,2)
	DEFAULT 4
	CONSTRAINT d_tiempo_gestacion_check CHECK (VALUE > 1::numeric AND VALUE < 10::numeric);
-- DROP DOMAIN public."d_tipo_cuentas";

CREATE DOMAIN public."d_tipo_cuentas" AS character varying(2)
	COLLATE "default"
	DEFAULT 'XX'::character varying
	CONSTRAINT d_tipo_cuentas_check CHECK (VALUE::text = ANY (ARRAY['A'::character varying, 'PA'::character varying, 'PT'::character varying, 'I'::character varying, 'G'::character varying, 'CC'::character varying, 'CO'::character varying]::text[]));
-- DROP DOMAIN public."d_turno";

CREATE DOMAIN public."d_turno" AS smallint
	DEFAULT 0
	CONSTRAINT d_turno_check CHECK (VALUE >= 0);
-- DROP DOMAIN public."d_user_name";

CREATE DOMAIN public."d_user_name" AS character varying(63)
	COLLATE "default"
	DEFAULT CURRENT_USER;
-- DROP DOMAIN public."d_varchar_1024";

CREATE DOMAIN public."d_varchar_1024" AS character varying(1024)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_15";

CREATE DOMAIN public."d_varchar_15" AS character varying(15)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_25";

CREATE DOMAIN public."d_varchar_25" AS character varying(25)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_255";

CREATE DOMAIN public."d_varchar_255" AS character varying(255)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_45";

CREATE DOMAIN public."d_varchar_45" AS character varying(45)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_70";

CREATE DOMAIN public."d_varchar_70" AS character varying(70)
	COLLATE "default";
-- DROP DOMAIN public."d_varchar_max";

CREATE DOMAIN public."d_varchar_max" AS character varying(32765)
	COLLATE "default";
-- DROP TYPE public.deudas;

CREATE TYPE public.deudas AS (
	id d_id,
	id_cliente d_id,
	id_factura d_id,
	concepto d_varchar_255,
	monto d_dinero,
	fecha d_fecha,
	hora d_hora,
	estado d_estado_c_i_p_a_n_t);

-- DROP TYPE public.distritos_municipales;

CREATE TYPE public.distritos_municipales AS (
	id d_id,
	nombre d_varchar_45,
	idmunicipio d_id);

-- DROP TYPE public.e_s_sys;

CREATE TYPE public.e_s_sys AS (
	id d_id,
	nombre_empresa d_nombres,
	fchi d_fecha,
	fcha d_fecha,
	fchv d_fecha,
	telefonos d_telefono,
	direccion d_varchar_255,
	mensaje_footer d_varchar_255,
	logo d_blob_texto,
	urldb d_varchar_255);

-- DROP TYPE public.generales;

CREATE TYPE public.generales AS (
	id_persona d_id,
	cedula d_cedula,
	id_tipo_sangre d_id,
	estado_civil d_estado_civil);

-- DROP TYPE public.guia_vigilancia_desarrollo;

CREATE TYPE public.guia_vigilancia_desarrollo AS (
	id d_id,
	edad d_edad,
	caract_desarr_evaluar d_varchar_255);

-- DROP TYPE public.huellas;

CREATE TYPE public.huellas AS (
	id d_id,
	tipo_dedo d_dedo,
	imagen_texto d_blob_texto);

-- DROP TYPE public.inscripciones;

CREATE TYPE public.inscripciones AS (
	id d_id,
	id_estudiante d_id,
	id_tanda d_id,
	pago d_dinero,
	fecha_inscripcion d_fecha_hora,
	rol d_rol,
	user_name d_user_name);

-- DROP TYPE public.m_analisis;

CREATE TYPE public.m_analisis AS (
	id d_id,
	id_paciente d_id,
	fecha_hora_creada d_fecha_hora,
	fecha_hora_vista d_fecha_hora,
	rol d_rol,
	user_name d_user_name);

-- DROP TYPE public.m_entrada_productos;

CREATE TYPE public.m_entrada_productos AS (
	id d_id,
	idprovedor d_id,
	id_almacen d_id,
	cod_factura d_codigo,
	fecha_entrada d_fecha_hora,
	user_name d_user_name,
	rol d_rol);

-- DROP TYPE public.m_facturas;

CREATE TYPE public.m_facturas AS (
	id d_id,
	id_cliente d_id,
	id_contactos_tel d_id,
	id_contactos_direcciones d_id,
	id_contactos_email d_id,
	id_turno d_id,
	fecha_hora d_fecha_hora,
	total d_dinero,
	efectivo d_dinero,
	estado_factura d_estado_c_i_p_a_n_t,
	nombre_temp d_nombres,
	user_name d_user_name);

-- DROP TYPE public.mensajes;

CREATE TYPE public.mensajes AS (
	id d_id,
	id_doctor d_user_name,
	id_paciente d_id,
	hora d_hora,
	fecha d_fecha,
	mensaje d_blob_texto,
	estado d_estado_mensajes);

-- DROP TYPE public.metricas;

CREATE TYPE public.metricas AS (
	id d_id,
	idconsulta d_id,
	fecha d_fecha_hora,
	pesokg d_medida,
	estaturametro d_medida,
	escefalo d_medida,
	enf_detect d_varchar_255,
	hallazgos_pos d_varchar_255,
	id_diag d_varchar_255,
	tx d_varchar_255,
	complemento d_varchar_255,
	imagen_texto d_blob_texto,
	user_name d_user_name);

-- DROP TYPE public.motivo_consulta;

CREATE TYPE public.motivo_consulta AS (
	id d_id,
	descripcion d_varchar_45);

-- DROP TYPE public.municipios;

CREATE TYPE public.municipios AS (
	id d_id,
	nombre d_varchar_45,
	idprovincia d_id);

-- DROP TYPE public.personas;

CREATE TYPE public.personas AS (
	id d_id,
	persona d_persona,
	pnombre d_nombres,
	snombre d_nombres,
	apellidos d_apellidos,
	sexo d_sexo,
	fecha_nacimiento d_fecha,
	fecha_ingreso d_fecha_hora,
	fecha_hora_ultimo_update d_fecha_hora,
	estado d_boolean_t,
	user_name d_user_name,
	rol_usuario d_rol);

-- DROP TYPE public.personas_clientes;

CREATE TYPE public.personas_clientes AS (
	id d_id);

-- DROP TYPE public.personas_clientes_atr;

CREATE TYPE public.personas_clientes_atr AS (
	id d_id,
	total_facturado d_dinero,
	total_deuda d_dinero,
	cantidad_factura d_id,
	fecha_ultima_compra d_fecha,
	saldo d_dinero);

-- DROP TYPE public.personas_estudiantes;

CREATE TYPE public.personas_estudiantes AS (
	id d_id);

-- DROP TYPE public.personas_estudiantes_atr;

CREATE TYPE public.personas_estudiantes_atr AS (
	id d_id,
	matricula d_varchar_15);

-- DROP TYPE public.personas_pacientes;

CREATE TYPE public.personas_pacientes AS (
	id d_id);

-- DROP TYPE public.personas_pacientes_atr;

CREATE TYPE public.personas_pacientes_atr AS (
	id_paciente d_id,
	peso_nacimiento_kg d_medida,
	altura d_medida,
	perimetro_cefalico d_medida,
	cesarea d_boolean_t,
	tiempo_gestacion d_tiempo_gestacion,
	user_name d_user_name);

-- DROP TYPE public.personas_padres;

CREATE TYPE public.personas_padres AS (
	id d_id);

-- DROP TYPE public.personas_proveedores;

CREATE TYPE public.personas_proveedores AS (
	id d_id);

-- DROP TYPE public.personas_proveedores_atr;

CREATE TYPE public.personas_proveedores_atr AS (
	id d_id,
	codigo d_codigo);

-- DROP TYPE public.plan_cuenta_contable;

CREATE TYPE public.plan_cuenta_contable AS (
	id d_id,
	pais d_varchar_15,
	codigo_cuenta_contable d_codigo_cuenta_contable,
	nombre_cuenta d_varchar_255,
	tipo_cuenta d_tipo_cuentas,
	nivel_cuenta d_nivel_cuenta,
	usa_tercero d_boolean_f,
	centro_costos d_boolean_f,
	porcentaje_base d_descuento,
	monto_base_min d_dinero,
	detalle_cuenta d_blob_texto);

-- DROP TYPE public.productos;

CREATE TYPE public.productos AS (
	id d_id,
	id_categoria d_id,
	codigo d_varchar_25,
	descripcion d_varchar_70,
	existencia d_medida,
	imagen_texto d_blob_texto,
	estado d_boolean_t,
	fecha_creacion d_fecha,
	nota d_varchar_1024,
	user_name d_user_name,
	rol d_rol);

-- DROP TYPE public.provincias;

CREATE TYPE public.provincias AS (
	id d_id,
	nombre d_varchar_45,
	zona d_punto_cardinales);

-- DROP TYPE public.reccount;

CREATE TYPE public.reccount AS (
	id d_id,
	tabla d_varchar_45,
	cantidad d_id);

-- DROP TYPE public.recetas;

CREATE TYPE public.recetas AS (
	id d_id,
	idconsulta d_id,
	fecha d_fecha_hora,
	user_name d_user_name);

-- DROP TYPE public.relacion_padre_estudiante;

CREATE TYPE public.relacion_padre_estudiante AS (
	id_padre_o_madre d_id,
	id_estudiante d_id);

-- DROP TYPE public.relacion_padre_paciente;

CREATE TYPE public.relacion_padre_paciente AS (
	id_padre_o_madre d_id,
	id_paciente d_id);

-- DROP TYPE public.sintomas;

CREATE TYPE public.sintomas AS (
	id d_id,
	id_paciente d_id,
	sintomas d_varchar_255,
	fecha d_fecha,
	hora d_hora,
	nota d_varchar_255,
	user_name d_user_name);

-- DROP TYPE public.t_analisis;

CREATE TYPE public.t_analisis AS (
	id d_id,
	nombre_corto_analisis d_varchar_70,
	nombre_analisis d_varchar_70,
	nota d_varchar_1024);

-- DROP TYPE public.tandas;

CREATE TYPE public.tandas AS (
	id d_id,
	anno_inicial d_fecha,
	anno_final d_fecha,
	hora_inicio d_hora,
	hora_final d_hora,
	lunes d_boolean_f,
	martes d_boolean_f,
	miercoles d_boolean_f,
	jueves d_boolean_f,
	viernes d_boolean_f,
	sabados d_boolean_f,
	domingos d_boolean_f,
	cantidad_estudiantes d_turno,
	con_edad d_boolean_t,
	edad_minima d_turno,
	edad_maxima d_turno,
	estado d_boolean_t);

-- DROP TYPE public.tipos_sangre;

CREATE TYPE public.tipos_sangre AS (
	id d_id,
	descripcion d_sangre_simbolos);

-- DROP TYPE public.turnos;

CREATE TYPE public.turnos AS (
	id d_id,
	id_almacen d_id,
	turno_usuario d_user_name,
	fecha_hora_inicio d_fecha_hora,
	fecha_hora_final d_fecha_hora,
	estado d_boolean_t,
	monto_facturado d_dinero,
	monto_devuelto d_dinero,
	monto_efectivo d_dinero,
	monto_credito d_dinero,
	rol d_rol,
	user_name d_user_name);

-- DROP TYPE public."_almacenes";

CREATE TYPE public."_almacenes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.almacenes,
	DELIMITER = ',');

-- DROP TYPE public."_antecedentes";

CREATE TYPE public."_antecedentes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.antecedentes,
	DELIMITER = ',');

-- DROP TYPE public."_ars";

CREATE TYPE public."_ars" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.ars,
	DELIMITER = ',');

-- DROP TYPE public."_asegurados";

CREATE TYPE public."_asegurados" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.asegurados,
	DELIMITER = ',');

-- DROP TYPE public."_cartones_bingo";

CREATE TYPE public."_cartones_bingo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.cartones_bingo,
	DELIMITER = ',');

-- DROP TYPE public."_categorias";

CREATE TYPE public."_categorias" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.categorias,
	DELIMITER = ',');

-- DROP TYPE public."_codigos_postales";

CREATE TYPE public."_codigos_postales" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.codigos_postales,
	DELIMITER = ',');

-- DROP TYPE public."_consultas";

CREATE TYPE public."_consultas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.consultas,
	DELIMITER = ',');

-- DROP TYPE public."_consultas_aprobadas";

CREATE TYPE public."_consultas_aprobadas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.consultas_aprobadas,
	DELIMITER = ',');

-- DROP TYPE public."_contactos_direcciones";

CREATE TYPE public."_contactos_direcciones" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.contactos_direcciones,
	DELIMITER = ',');

-- DROP TYPE public."_contactos_email";

CREATE TYPE public."_contactos_email" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.contactos_email,
	DELIMITER = ',');

-- DROP TYPE public."_contactos_tel";

CREATE TYPE public."_contactos_tel" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.contactos_tel,
	DELIMITER = ',');

-- DROP TYPE public."_control_consulta";

CREATE TYPE public."_control_consulta" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.control_consulta,
	DELIMITER = ',');

-- DROP TYPE public."_d_abreviatura";

CREATE TYPE public."_d_abreviatura" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_abreviatura",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_analisis";

CREATE TYPE public."_d_analisis" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_analisis,
	DELIMITER = ',');

-- DROP TYPE public."_d_apellidos";

CREATE TYPE public."_d_apellidos" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_apellidos",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_blob_binario";

CREATE TYPE public."_d_blob_binario" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_blob_binario,
	DELIMITER = ',');

-- DROP TYPE public."_d_blob_texto";

CREATE TYPE public."_d_blob_texto" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_blob_texto",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_boolean_f";

CREATE TYPE public."_d_boolean_f" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_boolean_f",
	DELIMITER = ',');

-- DROP TYPE public."_d_boolean_t";

CREATE TYPE public."_d_boolean_t" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_boolean_t",
	DELIMITER = ',');

-- DROP TYPE public."_d_cedula";

CREATE TYPE public."_d_cedula" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_cedula",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_clave";

CREATE TYPE public."_d_clave" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_clave",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_codigo";

CREATE TYPE public."_d_codigo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_codigo",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_codigo_cuenta_contable";

CREATE TYPE public."_d_codigo_cuenta_contable" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_codigo_cuenta_contable",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_codigo_pai";

CREATE TYPE public."_d_codigo_pai" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_codigo_pai",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_correo";

CREATE TYPE public."_d_correo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_correo",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_dedo";

CREATE TYPE public."_d_dedo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_dedo",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_descuento";

CREATE TYPE public."_d_descuento" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_descuento",
	DELIMITER = ',');

-- DROP TYPE public."_d_deudas_pagas";

CREATE TYPE public."_d_deudas_pagas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_deudas_pagas,
	DELIMITER = ',');

-- DROP TYPE public."_d_dia";

CREATE TYPE public."_d_dia" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_dia",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_dinero";

CREATE TYPE public."_d_dinero" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_dinero",
	DELIMITER = ',');

-- DROP TYPE public."_d_doble_presicion";

CREATE TYPE public."_d_doble_presicion" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_doble_presicion",
	DELIMITER = ',');

-- DROP TYPE public."_d_edad";

CREATE TYPE public."_d_edad" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_edad",
	DELIMITER = ',');

-- DROP TYPE public."_d_entrada_producto";

CREATE TYPE public."_d_entrada_producto" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_entrada_producto,
	DELIMITER = ',');

-- DROP TYPE public."_d_estado_c_i_p_a_n_t";

CREATE TYPE public."_d_estado_c_i_p_a_n_t" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_estado_c_i_p_a_n_t",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_estado_civil";

CREATE TYPE public."_d_estado_civil" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_estado_civil",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_estado_mensajes";

CREATE TYPE public."_d_estado_mensajes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_estado_mensajes",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_facturas";

CREATE TYPE public."_d_facturas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_facturas,
	DELIMITER = ',');

-- DROP TYPE public."_d_fecha";

CREATE TYPE public."_d_fecha" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_fecha",
	DELIMITER = ',');

-- DROP TYPE public."_d_fecha_hora";

CREATE TYPE public."_d_fecha_hora" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_fecha_hora",
	DELIMITER = ',');

-- DROP TYPE public."_d_guia_vigilancia_desarrollo";

CREATE TYPE public."_d_guia_vigilancia_desarrollo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_guia_vigilancia_desarrollo,
	DELIMITER = ',');

-- DROP TYPE public."_d_hora";

CREATE TYPE public."_d_hora" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_hora",
	DELIMITER = ',');

-- DROP TYPE public."_d_id";

CREATE TYPE public."_d_id" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_id",
	DELIMITER = ',');

-- DROP TYPE public."_d_insert_delete";

CREATE TYPE public."_d_insert_delete" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_insert_delete",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_medida";

CREATE TYPE public."_d_medida" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_medida",
	DELIMITER = ',');

-- DROP TYPE public."_d_motivo_consulta";

CREATE TYPE public."_d_motivo_consulta" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_motivo_consulta,
	DELIMITER = ',');

-- DROP TYPE public."_d_nivel_cuenta";

CREATE TYPE public."_d_nivel_cuenta" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_nivel_cuenta",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_nombres";

CREATE TYPE public."_d_nombres" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_nombres",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_persona";

CREATE TYPE public."_d_persona" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_persona",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_punto_cardinales";

CREATE TYPE public."_d_punto_cardinales" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_punto_cardinales",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_recetas";

CREATE TYPE public."_d_recetas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.d_recetas,
	DELIMITER = ',');

-- DROP TYPE public."_d_rol";

CREATE TYPE public."_d_rol" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_rol",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_sangre_simbolos";

CREATE TYPE public."_d_sangre_simbolos" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_sangre_simbolos",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_sexo";

CREATE TYPE public."_d_sexo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_sexo",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_telefono";

CREATE TYPE public."_d_telefono" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_telefono",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_tiempo_gestacion";

CREATE TYPE public."_d_tiempo_gestacion" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_tiempo_gestacion",
	DELIMITER = ',');

-- DROP TYPE public."_d_tipo_cuentas";

CREATE TYPE public."_d_tipo_cuentas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_tipo_cuentas",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_turno";

CREATE TYPE public."_d_turno" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_turno",
	DELIMITER = ',');

-- DROP TYPE public."_d_user_name";

CREATE TYPE public."_d_user_name" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_user_name",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_1024";

CREATE TYPE public."_d_varchar_1024" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_1024",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_15";

CREATE TYPE public."_d_varchar_15" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_15",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_25";

CREATE TYPE public."_d_varchar_25" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_25",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_255";

CREATE TYPE public."_d_varchar_255" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_255",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_45";

CREATE TYPE public."_d_varchar_45" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_45",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_70";

CREATE TYPE public."_d_varchar_70" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_70",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_d_varchar_max";

CREATE TYPE public."_d_varchar_max" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public."d_varchar_max",
	DELIMITER = ',',
	COLLATABLE = true);

-- DROP TYPE public."_deudas";

CREATE TYPE public."_deudas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.deudas,
	DELIMITER = ',');

-- DROP TYPE public."_distritos_municipales";

CREATE TYPE public."_distritos_municipales" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.distritos_municipales,
	DELIMITER = ',');

-- DROP TYPE public."_e_s_sys";

CREATE TYPE public."_e_s_sys" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.e_s_sys,
	DELIMITER = ',');

-- DROP TYPE public."_generales";

CREATE TYPE public."_generales" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.generales,
	DELIMITER = ',');

-- DROP TYPE public."_guia_vigilancia_desarrollo";

CREATE TYPE public."_guia_vigilancia_desarrollo" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.guia_vigilancia_desarrollo,
	DELIMITER = ',');

-- DROP TYPE public."_huellas";

CREATE TYPE public."_huellas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.huellas,
	DELIMITER = ',');

-- DROP TYPE public."_inscripciones";

CREATE TYPE public."_inscripciones" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.inscripciones,
	DELIMITER = ',');

-- DROP TYPE public."_m_analisis";

CREATE TYPE public."_m_analisis" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.m_analisis,
	DELIMITER = ',');

-- DROP TYPE public."_m_entrada_productos";

CREATE TYPE public."_m_entrada_productos" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.m_entrada_productos,
	DELIMITER = ',');

-- DROP TYPE public."_m_facturas";

CREATE TYPE public."_m_facturas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.m_facturas,
	DELIMITER = ',');

-- DROP TYPE public."_mensajes";

CREATE TYPE public."_mensajes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.mensajes,
	DELIMITER = ',');

-- DROP TYPE public."_metricas";

CREATE TYPE public."_metricas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.metricas,
	DELIMITER = ',');

-- DROP TYPE public."_motivo_consulta";

CREATE TYPE public."_motivo_consulta" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.motivo_consulta,
	DELIMITER = ',');

-- DROP TYPE public."_municipios";

CREATE TYPE public."_municipios" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.municipios,
	DELIMITER = ',');

-- DROP TYPE public."_personas";

CREATE TYPE public."_personas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas,
	DELIMITER = ',');

-- DROP TYPE public."_personas_clientes";

CREATE TYPE public."_personas_clientes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_clientes,
	DELIMITER = ',');

-- DROP TYPE public."_personas_clientes_atr";

CREATE TYPE public."_personas_clientes_atr" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_clientes_atr,
	DELIMITER = ',');

-- DROP TYPE public."_personas_estudiantes";

CREATE TYPE public."_personas_estudiantes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_estudiantes,
	DELIMITER = ',');

-- DROP TYPE public."_personas_estudiantes_atr";

CREATE TYPE public."_personas_estudiantes_atr" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_estudiantes_atr,
	DELIMITER = ',');

-- DROP TYPE public."_personas_pacientes";

CREATE TYPE public."_personas_pacientes" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_pacientes,
	DELIMITER = ',');

-- DROP TYPE public."_personas_pacientes_atr";

CREATE TYPE public."_personas_pacientes_atr" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_pacientes_atr,
	DELIMITER = ',');

-- DROP TYPE public."_personas_padres";

CREATE TYPE public."_personas_padres" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_padres,
	DELIMITER = ',');

-- DROP TYPE public."_personas_proveedores";

CREATE TYPE public."_personas_proveedores" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_proveedores,
	DELIMITER = ',');

-- DROP TYPE public."_personas_proveedores_atr";

CREATE TYPE public."_personas_proveedores_atr" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.personas_proveedores_atr,
	DELIMITER = ',');

-- DROP TYPE public."_plan_cuenta_contable";

CREATE TYPE public."_plan_cuenta_contable" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.plan_cuenta_contable,
	DELIMITER = ',');

-- DROP TYPE public."_productos";

CREATE TYPE public."_productos" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.productos,
	DELIMITER = ',');

-- DROP TYPE public."_provincias";

CREATE TYPE public."_provincias" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.provincias,
	DELIMITER = ',');

-- DROP TYPE public."_reccount";

CREATE TYPE public."_reccount" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.reccount,
	DELIMITER = ',');

-- DROP TYPE public."_recetas";

CREATE TYPE public."_recetas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.recetas,
	DELIMITER = ',');

-- DROP TYPE public."_relacion_padre_estudiante";

CREATE TYPE public."_relacion_padre_estudiante" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.relacion_padre_estudiante,
	DELIMITER = ',');

-- DROP TYPE public."_relacion_padre_paciente";

CREATE TYPE public."_relacion_padre_paciente" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.relacion_padre_paciente,
	DELIMITER = ',');

-- DROP TYPE public."_sintomas";

CREATE TYPE public."_sintomas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.sintomas,
	DELIMITER = ',');

-- DROP TYPE public."_t_analisis";

CREATE TYPE public."_t_analisis" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.t_analisis,
	DELIMITER = ',');

-- DROP TYPE public."_tandas";

CREATE TYPE public."_tandas" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.tandas,
	DELIMITER = ',');

-- DROP TYPE public."_tipos_sangre";

CREATE TYPE public."_tipos_sangre" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.tipos_sangre,
	DELIMITER = ',');

-- DROP TYPE public."_turnos";

CREATE TYPE public."_turnos" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.turnos,
	DELIMITER = ',');
-- public.almacenes definition

-- Drop table

-- DROP TABLE public.almacenes;

CREATE TABLE public.almacenes (
	id public."d_id" NOT NULL,
	nombre public."d_varchar_70" NULL,
	ubicacion public."d_varchar_255" NULL,
	estado public."d_boolean_t" NULL,
	CONSTRAINT pk_almacenes_0 PRIMARY KEY (id),
	CONSTRAINT unq_almacenes_0 UNIQUE (nombre)
);

-- Permissions

ALTER TABLE public.almacenes OWNER TO postgres;
GRANT ALL ON TABLE public.almacenes TO postgres;


-- public.antecedentes definition

-- Drop table

-- DROP TABLE public.antecedentes;

CREATE TABLE public.antecedentes (
	id public."d_id" NOT NULL,
	id_consulta public."d_id" NOT NULL,
	descripcion public."d_varchar_1024" NOT NULL,
	CONSTRAINT pk_antecedentes_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.antecedentes OWNER TO postgres;
GRANT ALL ON TABLE public.antecedentes TO postgres;


-- public.ars definition

-- Drop table

-- DROP TABLE public.ars;

CREATE TABLE public.ars (
	id public."d_id" NOT NULL,
	descripcion public."d_varchar_45" NOT NULL,
	coverconsultaporc public."d_descuento" NOT NULL,
	estado public."d_boolean_t" NOT NULL,
	cantidad_registro public."d_id" NULL,
	user_name public."d_user_name" NULL,
	rol public."d_rol" NOT NULL,
	CONSTRAINT pk_ars_0 PRIMARY KEY (id),
	CONSTRAINT unq_ars_0 UNIQUE (descripcion)
);

-- Permissions

ALTER TABLE public.ars OWNER TO postgres;
GRANT ALL ON TABLE public.ars TO postgres;


-- public.asegurados definition

-- Drop table

-- DROP TABLE public.asegurados;

CREATE TABLE public.asegurados (
	id_persona public."d_id" NOT NULL,
	id_ars public."d_id" NULL,
	no_nss public."d_varchar_25" NULL,
	estado public."d_boolean_t" NOT NULL,
	CONSTRAINT pk_asegurados_0 PRIMARY KEY (id_persona),
	CONSTRAINT unq_asegurados_0 UNIQUE (no_nss)
);

-- Permissions

ALTER TABLE public.asegurados OWNER TO postgres;
GRANT ALL ON TABLE public.asegurados TO postgres;


-- public.cartones_bingo definition

-- Drop table

-- DROP TABLE public.cartones_bingo;

CREATE TABLE public.cartones_bingo (
	id public."d_id" NOT NULL,
	carton_hash public."d_id" NOT NULL,
	fecha_creaccion public."d_fecha_hora" NOT NULL,
	matriz_obj public."d_blob_texto" NOT NULL,
	estado public."d_boolean_t" NULL,
	CONSTRAINT pk_cartones_bingo_0 PRIMARY KEY (id),
	CONSTRAINT unq_cartones_bingo_0 UNIQUE (carton_hash)
);

-- Permissions

ALTER TABLE public.cartones_bingo OWNER TO postgres;
GRANT ALL ON TABLE public.cartones_bingo TO postgres;


-- public.categorias definition

-- Drop table

-- DROP TABLE public.categorias;

CREATE TABLE public.categorias (
	id public."d_id" NOT NULL,
	descripcion public."d_varchar_25" NOT NULL,
	imagen_texto public."d_blob_texto" NULL,
	fecha_creacion public."d_fecha" NOT NULL,
	estado public."d_boolean_t" NOT NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_categorias_0 PRIMARY KEY (id),
	CONSTRAINT unq_categorias_0 UNIQUE (descripcion)
);

-- Permissions

ALTER TABLE public.categorias OWNER TO postgres;
GRANT ALL ON TABLE public.categorias TO postgres;


-- public.codigos_postales definition

-- Drop table

-- DROP TABLE public.codigos_postales;

CREATE TABLE public.codigos_postales (
	id public."d_id" NOT NULL,
	idprovincia public."d_id" NULL,
	localidad public."d_varchar_45" NULL,
	codigo_postal public."d_id" NULL,
	CONSTRAINT pk_codigos_postales_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.codigos_postales OWNER TO postgres;
GRANT ALL ON TABLE public.codigos_postales TO postgres;


-- public.consultas definition

-- Drop table

-- DROP TABLE public.consultas;

CREATE TABLE public.consultas (
	id public."d_id" NOT NULL,
	id_paciente public."d_id" NULL,
	id_control_consulta public."d_id" NULL,
	fecha public."d_fecha" NULL,
	turno public."d_turno" NULL,
	estado public."d_boolean_t" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_consultas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.consultas OWNER TO postgres;
GRANT ALL ON TABLE public.consultas TO postgres;


-- public.consultas_aprobadas definition

-- Drop table

-- DROP TABLE public.consultas_aprobadas;

CREATE TABLE public.consultas_aprobadas (
	id public."d_id" NOT NULL,
	cod_autorizacion public."d_varchar_15" NOT NULL,
	costo public."d_dinero" NOT NULL,
	descuento public."d_descuento" NOT NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_consultas_aprobadas_0 PRIMARY KEY (id),
	CONSTRAINT unq_consultas_aprobadas_0 UNIQUE (cod_autorizacion)
);

-- Permissions

ALTER TABLE public.consultas_aprobadas OWNER TO postgres;
GRANT ALL ON TABLE public.consultas_aprobadas TO postgres;


-- public.contactos_direcciones definition

-- Drop table

-- DROP TABLE public.contactos_direcciones;

CREATE TABLE public.contactos_direcciones (
	id public."d_id" NOT NULL,
	id_persona public."d_id" NOT NULL,
	id_provincia public."d_id" NOT NULL DEFAULT 0,
	id_municipio public."d_id" NOT NULL DEFAULT 0,
	id_distrito_municipal public."d_id" NOT NULL DEFAULT 0,
	id_codigo_postal public."d_id" NOT NULL DEFAULT 0,
	direccion public."d_varchar_255" NULL DEFAULT 'Sin direccion ingresada'::character varying,
	fecha public."d_fecha" NOT NULL,
	estado public."d_boolean_f" NOT NULL,
	por_defecto public."d_boolean_f" NOT NULL,
	CONSTRAINT pk_contactos_direcciones_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.contactos_direcciones OWNER TO postgres;
GRANT ALL ON TABLE public.contactos_direcciones TO postgres;


-- public.contactos_email definition

-- Drop table

-- DROP TABLE public.contactos_email;

CREATE TABLE public.contactos_email (
	id public."d_id" NOT NULL,
	id_persona public."d_id" NOT NULL,
	email public."d_correo" NOT NULL,
	fecha public."d_fecha" NOT NULL,
	estado public."d_boolean_t" NOT NULL,
	por_defecto public."d_boolean_t" NOT NULL,
	CONSTRAINT pk_contactos_email_0 PRIMARY KEY (id),
	CONSTRAINT unq_contactos_email_0 UNIQUE (id_persona, email),
	CONSTRAINT unq_contactos_email_1 UNIQUE (email)
);

-- Permissions

ALTER TABLE public.contactos_email OWNER TO postgres;
GRANT ALL ON TABLE public.contactos_email TO postgres;


-- public.contactos_tel definition

-- Drop table

-- DROP TABLE public.contactos_tel;

CREATE TABLE public.contactos_tel (
	id public."d_id" NOT NULL,
	id_persona public."d_id" NOT NULL,
	telefono public."d_telefono" NOT NULL,
	tipo public."d_varchar_15" NOT NULL,
	fecha public."d_fecha" NOT NULL,
	estado public."d_boolean_t" NOT NULL,
	por_defecto public."d_boolean_t" NOT NULL,
	CONSTRAINT pk_contactos_tel_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.contactos_tel OWNER TO postgres;
GRANT ALL ON TABLE public.contactos_tel TO postgres;


-- public.control_consulta definition

-- Drop table

-- DROP TABLE public.control_consulta;

CREATE TABLE public.control_consulta (
	id public."d_id" NOT NULL,
	user_name public."d_user_name" NULL,
	cantidadpaciente public."d_turno" NULL,
	dia public."d_dia" NULL,
	inicial public."d_hora" NULL,
	"final" public."d_hora" NULL,
	estado public."d_boolean_t" NULL,
	user_name_ public."d_user_name" NULL,
	CONSTRAINT pk_control_consulta_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.control_consulta OWNER TO postgres;
GRANT ALL ON TABLE public.control_consulta TO postgres;


-- public.d_analisis definition

-- Drop table

-- DROP TABLE public.d_analisis;

CREATE TABLE public.d_analisis (
	id public."d_id" NOT NULL,
	id_m_analisis public."d_id" NOT NULL,
	linea public."d_id" NOT NULL,
	id_t_analitica public."d_id" NOT NULL,
	otro public."d_varchar_1024" NULL,
	CONSTRAINT pk_d_analisis_0 PRIMARY KEY (id, id_m_analisis, linea, id_t_analitica)
);

-- Permissions

ALTER TABLE public.d_analisis OWNER TO postgres;
GRANT ALL ON TABLE public.d_analisis TO postgres;


-- public.d_deudas_pagas definition

-- Drop table

-- DROP TABLE public.d_deudas_pagas;

CREATE TABLE public.d_deudas_pagas (
	id public."d_id" NOT NULL,
	id_deudas public."d_id" NOT NULL,
	monto_pago public."d_dinero" NOT NULL,
	fecha_hora public."d_fecha_hora" NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT pk_d_deudas_pagas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.d_deudas_pagas OWNER TO postgres;
GRANT ALL ON TABLE public.d_deudas_pagas TO postgres;


-- public.d_entrada_producto definition

-- Drop table

-- DROP TABLE public.d_entrada_producto;

CREATE TABLE public.d_entrada_producto (
	id_m_entrada_producto public."d_id" NOT NULL,
	linea public."d_id" NOT NULL,
	id_producto public."d_id" NOT NULL,
	entrada public."d_medida" NOT NULL,
	costo public."d_dinero" NOT NULL,
	precio public."d_dinero" NOT NULL,
	fecha_vecimiento public."d_fecha" NULL,
	observacion public."d_varchar_1024" NULL,
	CONSTRAINT pk_d_entrada_producto_0 PRIMARY KEY (id_m_entrada_producto, linea, id_producto)
);

-- Permissions

ALTER TABLE public.d_entrada_producto OWNER TO postgres;
GRANT ALL ON TABLE public.d_entrada_producto TO postgres;


-- public.d_facturas definition

-- Drop table

-- DROP TABLE public.d_facturas;

CREATE TABLE public.d_facturas (
	id_factura public."d_id" NOT NULL,
	id_linea public."d_id" NOT NULL,
	id_producto public."d_id" NOT NULL,
	precio public."d_dinero" NOT NULL,
	cantidad public."d_dinero" NOT NULL,
	CONSTRAINT pk_d_facturas_01 PRIMARY KEY (id_factura, id_linea)
);

-- Permissions

ALTER TABLE public.d_facturas OWNER TO postgres;
GRANT ALL ON TABLE public.d_facturas TO postgres;


-- public.d_guia_vigilancia_desarrollo definition

-- Drop table

-- DROP TABLE public.d_guia_vigilancia_desarrollo;

CREATE TABLE public.d_guia_vigilancia_desarrollo (
	id_gvd public."d_id" NOT NULL,
	id_paciente public."d_id" NOT NULL,
	fecha public."d_fecha_hora" NULL,
	CONSTRAINT pk_d_guia_vigilancia_desarrollo_0 PRIMARY KEY (id_gvd, id_paciente)
);

-- Permissions

ALTER TABLE public.d_guia_vigilancia_desarrollo OWNER TO postgres;
GRANT ALL ON TABLE public.d_guia_vigilancia_desarrollo TO postgres;


-- public.d_motivo_consulta definition

-- Drop table

-- DROP TABLE public.d_motivo_consulta;

CREATE TABLE public.d_motivo_consulta (
	idconsulta public."d_id" NOT NULL,
	idmconsulta public."d_id" NOT NULL,
	CONSTRAINT pk_d_motivo_consulta_0 PRIMARY KEY (idconsulta, idmconsulta)
);

-- Permissions

ALTER TABLE public.d_motivo_consulta OWNER TO postgres;
GRANT ALL ON TABLE public.d_motivo_consulta TO postgres;


-- public.d_recetas definition

-- Drop table

-- DROP TABLE public.d_recetas;

CREATE TABLE public.d_recetas (
	id_receta public."d_id" NOT NULL,
	linea public."d_turno" NOT NULL,
	id_medicamento public."d_id" NOT NULL,
	cantidad public."d_medida" NULL,
	d_dosis public."d_varchar_255" NULL,
	CONSTRAINT con_detallerecetas PRIMARY KEY (id_receta, linea)
);

-- Permissions

ALTER TABLE public.d_recetas OWNER TO postgres;
GRANT ALL ON TABLE public.d_recetas TO postgres;


-- public.deudas definition

-- Drop table

-- DROP TABLE public.deudas;

CREATE TABLE public.deudas (
	id public."d_id" NOT NULL,
	id_cliente public."d_id" NOT NULL,
	id_factura public."d_id" NOT NULL,
	concepto public."d_varchar_255" NOT NULL,
	monto public."d_dinero" NOT NULL DEFAULT 0.00,
	fecha public."d_fecha" NOT NULL,
	hora public."d_hora" NOT NULL,
	estado public."d_estado_c_i_p_a_n_t" NOT NULL,
	CONSTRAINT pk_deudas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.deudas OWNER TO postgres;
GRANT ALL ON TABLE public.deudas TO postgres;


-- public.distritos_municipales definition

-- Drop table

-- DROP TABLE public.distritos_municipales;

CREATE TABLE public.distritos_municipales (
	id public."d_id" NOT NULL,
	nombre public."d_varchar_45" NULL,
	idmunicipio public."d_id" NULL,
	CONSTRAINT pk_distritos_municipales_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.distritos_municipales OWNER TO postgres;
GRANT ALL ON TABLE public.distritos_municipales TO postgres;


-- public.e_s_sys definition

-- Drop table

-- DROP TABLE public.e_s_sys;

CREATE TABLE public.e_s_sys (
	id public."d_id" NOT NULL,
	nombre_empresa public."d_nombres" NULL,
	fchi public."d_fecha" NOT NULL,
	fcha public."d_fecha" NOT NULL,
	fchv public."d_fecha" NOT NULL,
	telefonos public."d_telefono" NULL,
	direccion public."d_varchar_255" NULL,
	mensaje_footer public."d_varchar_255" NULL,
	logo public."d_blob_texto" NULL,
	urldb public."d_varchar_255" NOT NULL,
	CONSTRAINT pk_e_s_sys_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.e_s_sys OWNER TO postgres;
GRANT ALL ON TABLE public.e_s_sys TO postgres;


-- public.generales definition

-- Drop table

-- DROP TABLE public.generales;

CREATE TABLE public.generales (
	id_persona public."d_id" NOT NULL,
	cedula public."d_cedula" NOT NULL,
	id_tipo_sangre public."d_id" NULL,
	estado_civil public."d_estado_civil" NULL,
	CONSTRAINT pk_generales_0 PRIMARY KEY (id_persona),
	CONSTRAINT unq_generales_0 UNIQUE (id_persona, cedula)
);

-- Permissions

ALTER TABLE public.generales OWNER TO postgres;
GRANT ALL ON TABLE public.generales TO postgres;


-- public.guia_vigilancia_desarrollo definition

-- Drop table

-- DROP TABLE public.guia_vigilancia_desarrollo;

CREATE TABLE public.guia_vigilancia_desarrollo (
	id public."d_id" NOT NULL,
	edad public."d_edad" NULL,
	caract_desarr_evaluar public."d_varchar_255" NULL,
	CONSTRAINT pk_guia_vigilancia_desarrollo_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.guia_vigilancia_desarrollo OWNER TO postgres;
GRANT ALL ON TABLE public.guia_vigilancia_desarrollo TO postgres;


-- public.huellas definition

-- Drop table

-- DROP TABLE public.huellas;

CREATE TABLE public.huellas (
	id public."d_id" NOT NULL,
	tipo_dedo public."d_dedo" NOT NULL,
	imagen_texto public."d_blob_texto" NULL,
	CONSTRAINT pk_huellas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.huellas OWNER TO postgres;
GRANT ALL ON TABLE public.huellas TO postgres;


-- public.inscripciones definition

-- Drop table

-- DROP TABLE public.inscripciones;

CREATE TABLE public.inscripciones (
	id public."d_id" NOT NULL,
	id_estudiante public."d_id" NOT NULL,
	id_tanda public."d_id" NOT NULL,
	pago public."d_dinero" NOT NULL,
	fecha_inscripcion public."d_fecha_hora" NOT NULL,
	rol public."d_rol" NOT NULL,
	user_name public."d_user_name" NOT NULL,
	CONSTRAINT pk_inscripciones_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.inscripciones OWNER TO postgres;
GRANT ALL ON TABLE public.inscripciones TO postgres;


-- public.m_analisis definition

-- Drop table

-- DROP TABLE public.m_analisis;

CREATE TABLE public.m_analisis (
	id public."d_id" NOT NULL,
	id_paciente public."d_id" NOT NULL DEFAULT 0,
	fecha_hora_creada public."d_fecha_hora" NOT NULL,
	fecha_hora_vista public."d_fecha_hora" NOT NULL,
	rol public."d_rol" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_m_analisis_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.m_analisis OWNER TO postgres;
GRANT ALL ON TABLE public.m_analisis TO postgres;


-- public.m_entrada_productos definition

-- Drop table

-- DROP TABLE public.m_entrada_productos;

CREATE TABLE public.m_entrada_productos (
	id public."d_id" NOT NULL,
	idprovedor public."d_id" NOT NULL,
	id_almacen public."d_id" NOT NULL,
	cod_factura public."d_codigo" NOT NULL,
	fecha_entrada public."d_fecha_hora" NOT NULL,
	user_name public."d_user_name" NOT NULL,
	rol public."d_rol" NULL,
	CONSTRAINT pk_m_entrada_productos_0 PRIMARY KEY (id),
	CONSTRAINT unq_m_entrada_productos_0 UNIQUE (id, idprovedor, id_almacen, cod_factura)
);

-- Permissions

ALTER TABLE public.m_entrada_productos OWNER TO postgres;
GRANT ALL ON TABLE public.m_entrada_productos TO postgres;


-- public.m_facturas definition

-- Drop table

-- DROP TABLE public.m_facturas;

CREATE TABLE public.m_facturas (
	id public."d_id" NOT NULL,
	id_cliente public."d_id" NOT NULL,
	id_contactos_tel public."d_id" NULL,
	id_contactos_direcciones public."d_id" NULL,
	id_contactos_email public."d_id" NULL,
	id_turno public."d_id" NOT NULL,
	fecha_hora public."d_fecha_hora" NOT NULL,
	total public."d_dinero" NULL,
	efectivo public."d_dinero" NOT NULL,
	estado_factura public."d_estado_c_i_p_a_n_t" NULL,
	nombre_temp public."d_nombres" NULL DEFAULT 'N A'::character varying,
	user_name public."d_user_name" NOT NULL,
	CONSTRAINT pk_m_facturas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.m_facturas OWNER TO postgres;
GRANT ALL ON TABLE public.m_facturas TO postgres;


-- public.mensajes definition

-- Drop table

-- DROP TABLE public.mensajes;

CREATE TABLE public.mensajes (
	id public."d_id" NOT NULL,
	id_doctor public."d_user_name" NOT NULL,
	id_paciente public."d_id" NOT NULL DEFAULT 0,
	hora public."d_hora" NOT NULL,
	fecha public."d_fecha" NOT NULL,
	mensaje public."d_blob_texto" NOT NULL,
	estado public."d_estado_mensajes" NOT NULL,
	CONSTRAINT pk_mensajes_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.mensajes OWNER TO postgres;
GRANT ALL ON TABLE public.mensajes TO postgres;


-- public.metricas definition

-- Drop table

-- DROP TABLE public.metricas;

CREATE TABLE public.metricas (
	id public."d_id" NOT NULL,
	idconsulta public."d_id" NULL,
	fecha public."d_fecha_hora" NULL,
	pesokg public."d_medida" NULL,
	estaturametro public."d_medida" NULL,
	escefalo public."d_medida" NULL,
	enf_detect public."d_varchar_255" NULL,
	hallazgos_pos public."d_varchar_255" NULL,
	id_diag public."d_varchar_255" NULL,
	tx public."d_varchar_255" NULL,
	complemento public."d_varchar_255" NULL,
	imagen_texto public."d_blob_texto" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_metricas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.metricas OWNER TO postgres;
GRANT ALL ON TABLE public.metricas TO postgres;


-- public.motivo_consulta definition

-- Drop table

-- DROP TABLE public.motivo_consulta;

CREATE TABLE public.motivo_consulta (
	id public."d_id" NOT NULL,
	descripcion public."d_varchar_45" NOT NULL,
	CONSTRAINT pk_motivo_consulta_0 PRIMARY KEY (id),
	CONSTRAINT unq_motivo_consulta_0 UNIQUE (descripcion)
);

-- Permissions

ALTER TABLE public.motivo_consulta OWNER TO postgres;
GRANT ALL ON TABLE public.motivo_consulta TO postgres;


-- public.municipios definition

-- Drop table

-- DROP TABLE public.municipios;

CREATE TABLE public.municipios (
	id public."d_id" NOT NULL,
	nombre public."d_varchar_45" NULL,
	idprovincia public."d_id" NULL,
	CONSTRAINT pk_municipios_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.municipios OWNER TO postgres;
GRANT ALL ON TABLE public.municipios TO postgres;


-- public.personas definition

-- Drop table

-- DROP TABLE public.personas;

CREATE TABLE public.personas (
	id public."d_id" NOT NULL,
	persona public."d_persona" NOT NULL,
	pnombre public."d_nombres" NOT NULL,
	snombre public."d_nombres" NOT NULL,
	apellidos public."d_apellidos" NOT NULL,
	sexo public."d_sexo" NOT NULL,
	fecha_nacimiento public."d_fecha" NOT NULL,
	fecha_ingreso public."d_fecha_hora" NOT NULL,
	fecha_hora_ultimo_update public."d_fecha_hora" NOT NULL,
	estado public."d_boolean_t" NOT NULL,
	user_name public."d_user_name" NULL,
	rol_usuario public."d_rol" NOT NULL,
	CONSTRAINT pk_personas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas OWNER TO postgres;
GRANT ALL ON TABLE public.personas TO postgres;


-- public.personas_clientes definition

-- Drop table

-- DROP TABLE public.personas_clientes;

CREATE TABLE public.personas_clientes (
	id public."d_id" NOT NULL,
	CONSTRAINT pk_personas_clientes_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_clientes OWNER TO postgres;
GRANT ALL ON TABLE public.personas_clientes TO postgres;


-- public.personas_clientes_atr definition

-- Drop table

-- DROP TABLE public.personas_clientes_atr;

CREATE TABLE public.personas_clientes_atr (
	id public."d_id" NOT NULL,
	total_facturado public."d_dinero" NULL,
	total_deuda public."d_dinero" NULL,
	cantidad_factura public."d_id" NULL,
	fecha_ultima_compra public."d_fecha" NULL,
	saldo public."d_dinero" NULL,
	CONSTRAINT pk_personas_clientes_atr_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_clientes_atr OWNER TO postgres;
GRANT ALL ON TABLE public.personas_clientes_atr TO postgres;


-- public.personas_estudiantes definition

-- Drop table

-- DROP TABLE public.personas_estudiantes;

CREATE TABLE public.personas_estudiantes (
	id public."d_id" NOT NULL,
	CONSTRAINT pk_personas_estudiantes_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_estudiantes OWNER TO postgres;
GRANT ALL ON TABLE public.personas_estudiantes TO postgres;


-- public.personas_estudiantes_atr definition

-- Drop table

-- DROP TABLE public.personas_estudiantes_atr;

CREATE TABLE public.personas_estudiantes_atr (
	id public."d_id" NOT NULL,
	matricula public."d_varchar_15" NOT NULL,
	CONSTRAINT pk_personas_estudiantes_atr_0 PRIMARY KEY (id),
	CONSTRAINT unq_personas_estudiantes_0 UNIQUE (matricula)
);

-- Permissions

ALTER TABLE public.personas_estudiantes_atr OWNER TO postgres;
GRANT ALL ON TABLE public.personas_estudiantes_atr TO postgres;


-- public.personas_pacientes definition

-- Drop table

-- DROP TABLE public.personas_pacientes;

CREATE TABLE public.personas_pacientes (
	id public."d_id" NOT NULL,
	CONSTRAINT pk_personas_pacientes_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_pacientes OWNER TO postgres;
GRANT ALL ON TABLE public.personas_pacientes TO postgres;


-- public.personas_pacientes_atr definition

-- Drop table

-- DROP TABLE public.personas_pacientes_atr;

CREATE TABLE public.personas_pacientes_atr (
	id_paciente public."d_id" NOT NULL,
	peso_nacimiento_kg public."d_medida" NULL,
	altura public."d_medida" NULL,
	perimetro_cefalico public."d_medida" NULL,
	cesarea public."d_boolean_t" NULL,
	tiempo_gestacion public."d_tiempo_gestacion" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_personas_pacientes_art_0 PRIMARY KEY (id_paciente)
);

-- Permissions

ALTER TABLE public.personas_pacientes_atr OWNER TO postgres;
GRANT ALL ON TABLE public.personas_pacientes_atr TO postgres;


-- public.personas_padres definition

-- Drop table

-- DROP TABLE public.personas_padres;

CREATE TABLE public.personas_padres (
	id public."d_id" NOT NULL,
	CONSTRAINT pk_personas_padres_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_padres OWNER TO postgres;
GRANT ALL ON TABLE public.personas_padres TO postgres;


-- public.personas_proveedores definition

-- Drop table

-- DROP TABLE public.personas_proveedores;

CREATE TABLE public.personas_proveedores (
	id public."d_id" NOT NULL,
	CONSTRAINT pk_personas_proveedores_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.personas_proveedores OWNER TO postgres;
GRANT ALL ON TABLE public.personas_proveedores TO postgres;


-- public.personas_proveedores_atr definition

-- Drop table

-- DROP TABLE public.personas_proveedores_atr;

CREATE TABLE public.personas_proveedores_atr (
	id public."d_id" NOT NULL,
	codigo public."d_codigo" NOT NULL,
	CONSTRAINT pk_personas_proveedores_atr_0 PRIMARY KEY (id),
	CONSTRAINT unq_personas_proveedores_atr_0 UNIQUE (codigo)
);

-- Permissions

ALTER TABLE public.personas_proveedores_atr OWNER TO postgres;
GRANT ALL ON TABLE public.personas_proveedores_atr TO postgres;


-- public.plan_cuenta_contable definition

-- Drop table

-- DROP TABLE public.plan_cuenta_contable;

CREATE TABLE public.plan_cuenta_contable (
	id public."d_id" NOT NULL,
	pais public."d_varchar_15" NOT NULL,
	codigo_cuenta_contable public."d_codigo_cuenta_contable" NULL,
	nombre_cuenta public."d_varchar_255" NOT NULL,
	tipo_cuenta public."d_tipo_cuentas" NOT NULL,
	nivel_cuenta public."d_nivel_cuenta" NOT NULL,
	usa_tercero public."d_boolean_f" NOT NULL,
	centro_costos public."d_boolean_f" NOT NULL,
	porcentaje_base public."d_descuento" NOT NULL DEFAULT 0,
	monto_base_min public."d_dinero" NOT NULL DEFAULT 0,
	detalle_cuenta public."d_blob_texto" NULL DEFAULT 'NO PROPORCIONADO'::text,
	CONSTRAINT pk_plan_cuenta_contable_0 PRIMARY KEY (id),
	CONSTRAINT unq_plan_cuenta_contable_0 UNIQUE (pais, codigo_cuenta_contable)
);

-- Permissions

ALTER TABLE public.plan_cuenta_contable OWNER TO postgres;
GRANT ALL ON TABLE public.plan_cuenta_contable TO postgres;


-- public.productos definition

-- Drop table

-- DROP TABLE public.productos;

CREATE TABLE public.productos (
	id public."d_id" NOT NULL,
	id_categoria public."d_id" NOT NULL,
	codigo public."d_varchar_25" NOT NULL,
	descripcion public."d_varchar_70" NOT NULL,
	existencia public."d_medida" NOT NULL,
	imagen_texto public."d_blob_texto" NULL,
	estado public."d_boolean_t" NOT NULL,
	fecha_creacion public."d_fecha" NOT NULL,
	nota public."d_varchar_1024" NULL DEFAULT 'N/A'::character varying,
	user_name public."d_user_name" NULL,
	rol public."d_rol" NULL,
	CONSTRAINT pk_productos_0 PRIMARY KEY (id),
	CONSTRAINT unq_productos_0 UNIQUE (codigo),
	CONSTRAINT unq_productos_1 UNIQUE (descripcion)
);

-- Permissions

ALTER TABLE public.productos OWNER TO postgres;
GRANT ALL ON TABLE public.productos TO postgres;


-- public.provincias definition

-- Drop table

-- DROP TABLE public.provincias;

CREATE TABLE public.provincias (
	id public."d_id" NOT NULL,
	nombre public."d_varchar_45" NOT NULL,
	zona public."d_punto_cardinales" NULL,
	CONSTRAINT pk_provincias_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.provincias OWNER TO postgres;
GRANT ALL ON TABLE public.provincias TO postgres;


-- public.reccount definition

-- Drop table

-- DROP TABLE public.reccount;

CREATE TABLE public.reccount (
	id public."d_id" NOT NULL,
	tabla public."d_varchar_45" NOT NULL,
	cantidad public."d_id" NOT NULL,
	CONSTRAINT pk_reccount_0 PRIMARY KEY (id),
	CONSTRAINT unq_reccount_0 UNIQUE (tabla)
);

-- Permissions

ALTER TABLE public.reccount OWNER TO postgres;
GRANT ALL ON TABLE public.reccount TO postgres;


-- public.recetas definition

-- Drop table

-- DROP TABLE public.recetas;

CREATE TABLE public.recetas (
	id public."d_id" NOT NULL,
	idconsulta public."d_id" NOT NULL,
	fecha public."d_fecha_hora" NOT NULL,
	user_name public."d_user_name" NOT NULL,
	CONSTRAINT pk_recetas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.recetas OWNER TO postgres;
GRANT ALL ON TABLE public.recetas TO postgres;


-- public.relacion_padre_estudiante definition

-- Drop table

-- DROP TABLE public.relacion_padre_estudiante;

CREATE TABLE public.relacion_padre_estudiante (
	id_padre_o_madre public."d_id" NOT NULL DEFAULT 0,
	id_estudiante public."d_id" NOT NULL DEFAULT 0,
	CONSTRAINT pk_relacion_padre_estudiante_0 PRIMARY KEY (id_padre_o_madre, id_estudiante)
);

-- Permissions

ALTER TABLE public.relacion_padre_estudiante OWNER TO postgres;
GRANT ALL ON TABLE public.relacion_padre_estudiante TO postgres;


-- public.relacion_padre_paciente definition

-- Drop table

-- DROP TABLE public.relacion_padre_paciente;

CREATE TABLE public.relacion_padre_paciente (
	id_padre_o_madre public."d_id" NOT NULL DEFAULT 0,
	id_paciente public."d_id" NOT NULL DEFAULT 0,
	CONSTRAINT pk_relacion_padre_paciente_0 PRIMARY KEY (id_padre_o_madre, id_paciente)
);

-- Permissions

ALTER TABLE public.relacion_padre_paciente OWNER TO postgres;
GRANT ALL ON TABLE public.relacion_padre_paciente TO postgres;


-- public.sintomas definition

-- Drop table

-- DROP TABLE public.sintomas;

CREATE TABLE public.sintomas (
	id public."d_id" NOT NULL,
	id_paciente public."d_id" NOT NULL DEFAULT 0,
	sintomas public."d_varchar_255" NULL,
	fecha public."d_fecha" NULL,
	hora public."d_hora" NULL,
	nota public."d_varchar_255" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_sintomas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.sintomas OWNER TO postgres;
GRANT ALL ON TABLE public.sintomas TO postgres;


-- public.t_analisis definition

-- Drop table

-- DROP TABLE public.t_analisis;

CREATE TABLE public.t_analisis (
	id public."d_id" NOT NULL,
	nombre_corto_analisis public."d_varchar_70" NULL,
	nombre_analisis public."d_varchar_70" NULL,
	nota public."d_varchar_1024" NULL,
	CONSTRAINT pk_t_analisis_0 PRIMARY KEY (id),
	CONSTRAINT unq_t_analisis_0 UNIQUE (nombre_corto_analisis),
	CONSTRAINT unq_t_analisis_1 UNIQUE (nombre_analisis)
);

-- Permissions

ALTER TABLE public.t_analisis OWNER TO postgres;
GRANT ALL ON TABLE public.t_analisis TO postgres;


-- public.tandas definition

-- Drop table

-- DROP TABLE public.tandas;

CREATE TABLE public.tandas (
	id public."d_id" NOT NULL,
	anno_inicial public."d_fecha" NOT NULL DEFAULT CURRENT_DATE,
	anno_final public."d_fecha" NOT NULL,
	hora_inicio public."d_hora" NOT NULL,
	hora_final public."d_hora" NOT NULL,
	lunes public."d_boolean_f" NULL,
	martes public."d_boolean_f" NULL,
	miercoles public."d_boolean_f" NULL,
	jueves public."d_boolean_f" NULL,
	viernes public."d_boolean_f" NULL,
	sabados public."d_boolean_f" NULL,
	domingos public."d_boolean_f" NULL,
	cantidad_estudiantes public."d_turno" NULL,
	con_edad public."d_boolean_t" NULL,
	edad_minima public."d_turno" NULL,
	edad_maxima public."d_turno" NULL,
	estado public."d_boolean_t" NULL,
	CONSTRAINT pk_tandas_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.tandas OWNER TO postgres;
GRANT ALL ON TABLE public.tandas TO postgres;


-- public.tipos_sangre definition

-- Drop table

-- DROP TABLE public.tipos_sangre;

CREATE TABLE public.tipos_sangre (
	id public."d_id" NOT NULL,
	descripcion public."d_sangre_simbolos" NULL,
	CONSTRAINT pk_tipos_sangre_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.tipos_sangre OWNER TO postgres;
GRANT ALL ON TABLE public.tipos_sangre TO postgres;


-- public.turnos definition

-- Drop table

-- DROP TABLE public.turnos;

CREATE TABLE public.turnos (
	id public."d_id" NOT NULL,
	id_almacen public."d_id" NOT NULL DEFAULT 0,
	turno_usuario public."d_user_name" NULL,
	fecha_hora_inicio public."d_fecha_hora" NOT NULL,
	fecha_hora_final public."d_fecha_hora" NULL,
	estado public."d_boolean_t" NOT NULL,
	monto_facturado public."d_dinero" NULL,
	monto_devuelto public."d_dinero" NULL,
	monto_efectivo public."d_dinero" NULL,
	monto_credito public."d_dinero" NULL,
	rol public."d_rol" NULL,
	user_name public."d_user_name" NULL,
	CONSTRAINT pk_turnos_0 PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.turnos OWNER TO postgres;
GRANT ALL ON TABLE public.turnos TO postgres;



-- DROP FUNCTION public.ascii_val(varchar);

CREATE OR REPLACE FUNCTION public.ascii_val(string character varying DEFAULT ''::character varying)
 RETURNS smallint
 LANGUAGE sql
RETURN ascii((string)::text)
;

-- Permissions

ALTER FUNCTION public.ascii_val(varchar) OWNER TO postgres;
GRANT ALL ON FUNCTION public.ascii_val(varchar) TO postgres;


-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;