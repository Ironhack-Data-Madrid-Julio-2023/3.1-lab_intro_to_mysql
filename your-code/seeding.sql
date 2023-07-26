INSERT INTO CLIENTES (`idCLIENTES`, `N. DE CLIENTES`, `NOMBRE`, `TELEFONO`, `CORREO ELECTRONICO`, `DIRECCION`, `CIUDAD`, `C.P.`, `PROVINCIA`, `PAIS`)
VALUES 
(0,	10001,	'Pablo Picasso',	'+34 636176382',	'-',	'Paseo de la Chopera 14',	'Madrid',	28045, 'Madrid',	'Spain'), 
(1,	20001,	'Hedy Lamarr',	'+43 1514442250',	'-',	'Weiglgasse 10',	'Viena',	1150, 'Vienna',	'Austria'),
(2,	30001, 'Katherine Johnson',	'+12 023580000',	'-',	'300 E St SW',	'Washington DC',	20546, 'Washington',	'United States');

INSERT INTO VENDEDORES (`idVENDEDORES`, `N. DE VENDEDOR`, `NOMBRE`, `OFICINA`)
VALUES
(0,	00001,	'Petey Cruiser',	'Madrid'),
(1,	00002,	'Anna Sthesia',	'Barcelona'),
(2,	00003,	'Paul Molive',	'Berlin'),
(3,	00004,	'Gail Forcewind',	'Paris'),
(4,	00005,	'Paige Turner',	'Mimia'),
(5,	00006,	'Bob Frapples',	'Mexico City'),
(6,	00007,	'Walter Melon',	'Amsterdam'),
(7,	00008,	'Shonda Leer',	'São Paulo');

INSERT INTO VEHICULO (`idVehículos`, `VIN`, `FABRICANTE`, `MODELO`, `AÑO`, `COLOR`)
VALUES 
(0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'), 
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO FACTURAS (`idFACTURAS`, `N. DE FACTURA`, `FECHA`,VEHICULO_idVehículos, CLIENTES_idCLIENTES, VENDEDORES_idVENDEDORES)
VALUES 
(0, 852399038, '2018-08-22', 0, 1, 3), 
(1, 731166526, '2018-12-31', 3, 0, 5),
(2, 271135104, '2019-01-22', 2, 2, 7);