UPDATE salespersons
SET Store = 'Miami'
WHERE idSalesPersons = 4;

UPDATE CUSTOMERS
SET Email = 'ppicasso@gmail.com'
WHERE idCustomers = 0;

UPDATE CUSTOMERS
SET Email = 'lamarr_hd@hollywood.com'
WHERE Name = 'Hedy Lamarr'
LIMIT 1;

UPDATE CUSTOMERS
SET Email = 'hello@nasa.gov'
WHERE Name = 'Katherine Johnson'
LIMIT 1;