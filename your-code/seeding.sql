USE `InvoicesCars` ;

INSERT INTO customers ( `CUSTOMERID`, `name`, `phone number`, `email`, `address`, `city`, `zipcode`, `state`, `country`)
VALUES 
(10001,	'Pablo Picasso',	'+34 636176382',	'-',	'Paseo de la Chopera 14',	'Madrid',	28045, 'Madrid',	'Spain'), 
(20001,	'Hedy Lamarr',	'+43 1514442250',	'-',	'Weiglgasse 10',	'Viena',	1150, 'Vienna',	'Austria'),
(30001, 'Katherine Johnson',	'+12 023580000',	'-',	'300 E St SW',	'Washington DC',	20546, 'Washington',	'United States');

INSERT INTO sales_persons ( `StaffID`, `name`, `store`)
VALUES
('00001',	'Petey Cruiser',	'Madrid'),
('00002',	'Anna Sthesia',	'Barcelona'),
('00003',	'Paul Molive',	'Berlin'),
('00004',	'Gail Forcewind',	'Paris'),
('00005',	'Paige Turner',	'Mimia'),
('00006',	'Bob Frapples',	'Mexico City'),
('00007',	'Walter Melon',	'Amsterdam'),
('00008',	'Shonda Leer',	'São Paulo');

INSERT INTO cars (`VID`, `manufacturer`, `model`, `year`,`color`)
VALUES 
('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'), 
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO invoices (`InvoiceNumber`, `Date`,Car, Customer, SalesPerson)
VALUES 
(852399038, '2018-08-22', 1, 1, 4), 
(731166526, '2018-12-31', 4, 4, 6),
(271135104, '2019-01-22', 3, 2, 8);