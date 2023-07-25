CREATE DATABASE car_dealership;
USE car_dealership;

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    VIN VARCHAR(17),
    Manufacturer VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(50) NOT NULL
);

INSERT INTO Cars (CarID, VIN, Manufacturer, Model, Year, Color)
VALUES 
    (1, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
    (2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
    (3, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
    (4, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'), 
    (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'); 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(100),
    StateProvince VARCHAR(100),
    Country VARCHAR(100),
    ZipPostalCode VARCHAR(20)
);

INSERT INTO Customers (CustomerID, Name, PhoneNumber, Email, Address, City, StateProvince, Country, ZipPostalCode)
VALUES 
    (1, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
    (2, 'Hedy Lamarr', '+43 1 514442250', '-', 'Weiglgasse 10', 'Vienna', 'Vienna', 'Austria', '1150'),
    (3, 'Katherine Johnson', '+1 202 358 0000', '-', '300 E St SW', 'Washington, DC', 'Washington', 'United States', '20546');





CREATE TABLE Salespersons (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Store VARCHAR(255) NOT NULL
);
INSERT INTO Salespersons (StaffID, Name, Store)
VALUES 
    (1, 'Petey Cruiser', 'Madrid'),
    (2, 'Anna Sthesia', 'Barcelona'),
    (3, 'Paul Molive', 'Berlin'),
    (4, 'Gail Forcewind', 'Paris'),
    (5, 'Paige Turner', 'Miami'),
    (6, 'Bob Frapples', 'Mexico City'),
    (7, 'Walter Melon', 'Amsterdam'),
    (8, 'Shonda Leer', 'São Paulo');
    
    
CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceNumber VARCHAR(20) NOT NULL,
    Date DATE NOT NULL,
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    SalespersonID INT NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID) ON CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(StaffID)
);
INSERT INTO Invoices (InvoiceID, InvoiceNumber, Date, CarID, CustomerID, SalespersonID)
VALUES 
    (1, '852399038', '2018-08-22', 1, 1, 3),
    (2, '731166526', '2018-12-31', 4, 2, 5),
    (3, '271135104', '2019-01-22', 3, 3, 7);


