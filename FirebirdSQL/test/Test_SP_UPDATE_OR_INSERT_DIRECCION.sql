SELECT O_ID
FROM SP_UPDATE_OR_INSERT_DIRECCION (
     194, --IDENT. Direccion. 
     1,  --IDENT. PERSONA
     1, --IDENT. PROVINCIA
     2, --IDENT. MUNICIPIO
     3, --IDENT. DISTRITO MUNICIPAL
     2169, --IDENT. CODIGO POSTAL
     'Prueba desde flamenRobin',  --Direccion
     TRUE, --Estado
     FALSE --Direccion Por defeto.
);
