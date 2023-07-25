-- Insert into CARS
INSERT INTO CARS (cars_id, model, brand, year)
VALUES (1, 'ford', 'fiesta', 2018),
       (2, 'ford', 'didu', 2018),
       (3, 'yamaha', 'culi', 2012),
       (4, 'volvo', 'subaru', 1995);

-- Insert into CUSTOMER
INSERT INTO CUSTOMER (cust_id, name, surname, zip)
VALUES (1, 'James', 'Fonda', 'CB1 3SN'),
       (2, 'Martina', 'Zejudo', 'LN4 5BS'),
       (3, 'Gorka', 'Zurrapamendi', '28203'),
       (4, 'Sara', 'Jevo', '3452');

-- Insert into INVOICE
INSERT INTO INVOICE (inv_id, DATE, CARS_cars_id, CUSTOMER_cust_id, SALESPERSON_id_sales)
VALUES (1, '2020-12-20', 3, 2, 1),
       (2, '2020-12-20', 4, 2, 1);

-- Insert into SALESPERSON
INSERT INTO SALESPERSON (id_sales, name, surname)
VALUES (1, 'John', 'Doe');