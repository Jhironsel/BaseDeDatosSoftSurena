COMMENT ON TABLE FACTURAS IS 'El campo estado puede ser  p=Pagado, c=credito, a=abono.';
COMMENT ON COLUMN CONTROL_CONSULTA.USER_NAME IS 'Este campo es utilizando para guardar el usuario que va a tener consultas programadas cierto dias.';
COMMENT ON COLUMN CONTROL_CONSULTA.IDUSUARIO IS 'Este campo guarda el usuario que realizó el registro. ';
COMMENT ON COLUMN DEUDAS.ID IS 'Identificador de la deuda.';
COMMENT ON COLUMN DEUDAS.ID_PERSONA IS 'Identificador del Cliente';
COMMENT ON COLUMN DEUDAS.CONCEPTO IS 'Concepto por el cual se registra la deuda.';
COMMENT ON COLUMN DEUDAS.MONTO IS 'El monto de la deuda';
COMMENT ON COLUMN DEUDAS.FECHA IS 'La fecha de la deuda, se inserta SOLA';
COMMENT ON COLUMN DEUDAS.HORA IS 'La Hora tambien se Inserta SOLA';
COMMENT ON COLUMN DEUDAS.ESTADO IS 'Estado si es Deuda Inicial (i), Pagada (p), Abonada (a), Nulada (n).';
COMMENT ON TABLE D_DEUDAS_PAGAS IS 'En esta tabla llevamos los pagos de los cliente a las deudas registrada en la tabla de Deudas.';
COMMENT ON COLUMN FACTURAS.ID IS 'Identificador de la tabla facturas.';
COMMENT ON COLUMN FACTURAS.ID_CLIENTE IS 'Identificador del cliente';
COMMENT ON COLUMN FACTURAS.IDTURNO IS 'Turno que tiene asignado el cajero para realizar las operaciones de factura.';
COMMENT ON COLUMN FACTURAS.EFECTIVO IS 'Es el dinero que entrega el cliente al cajero.';
COMMENT ON COLUMN FACTURAS.CAMBIO IS 'Es el cambio que debe entregarle el cajero al cliente.';
COMMENT ON COLUMN FACTURAS.FECHA IS 'Fecha en la que se crea la factura.';
COMMENT ON COLUMN FACTURAS.HORA IS 'La hora en que se realiza la factura en el sistema.';
COMMENT ON COLUMN FACTURAS.ESTADO_FACTURA IS 'Este campo sirve para ver el estado de la factura que puede ser:
c = Contado
i = Iniciada
p = Pagado
a = Credito
n = nula
t = temporal';
COMMENT ON COLUMN FACTURAS.NOMBRE_TEMP IS 'Nombre utilizado de manera temporal de la factura, para indentificar el cliente.';
COMMENT ON COLUMN GUIA_VIGILANCIA_DESARROLLO.ID IS 'Identificador para indentificar las caracteristicas del niño a su edad.';
COMMENT ON COLUMN GUIA_VIGILANCIA_DESARROLLO.EDAD IS 'Las edades que registran aqui son en meses';
COMMENT ON COLUMN GUIA_VIGILANCIA_DESARROLLO.CARACT_DESARR_EVALUAR IS 'Describe el comportamiento de niño a su edad.';
COMMENT ON COLUMN PERSONAS.ID IS 'Identificador de la Persona en el sistema';
COMMENT ON COLUMN PERSONAS.PERSONA IS 'Identidad de una persona F Fisica o J Juridica.';
COMMENT ON COLUMN PERSONAS.APELLIDOS IS 'Apellidos Paternos + Maternos';
COMMENT ON COLUMN PERSONAS.SEXO IS 'El sexo solo se define como Masculino y Femenino';
COMMENT ON COLUMN PERSONAS.FECHA_NACIMIENTO IS 'Fecha de nacimiento, este campo debe ser actualizado por una persona autorizada.';
COMMENT ON COLUMN PERSONAS.FECHA_INGRESO IS 'Este campo nadie deberia de modificarlo.';
COMMENT ON COLUMN PERSONAS.FECHA_HORA_ULTIMO_UPDATE IS 'Este campo debe ser actualizado cada vez que el registro se actualice. ';
COMMENT ON COLUMN PERSONAS.ESTADO IS 'Este campo hace referencia a estado en el sistema de la persona, si es true activo o false inactivo.';
COMMENT ON COLUMN PERSONAS.IDUSUARIO IS 'Ident. del usuario que registro a la persona al sistema.';
COMMENT ON COLUMN PERSONAS.ROL_USUARIO IS 'Conocer el rol que tenia ese usuario cuando registro esta persona.';


