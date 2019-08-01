USE lab_mysql_vinicius;

### Color
INSERT INTO color (name_color) VALUES ('Blue'),('Red'),('White'),('Silver'), ('Gray');

### Manufacturer
INSERT INTO manufacturer (name_manufacturer) VALUES ('Volkswagen'),('Peugeot'),('Ford'),('Toyota'), ('Volvo');

### Model
INSERT INTO model (id_manufacturer, name_model) VALUES (1, 'Tiguan'),(2,'Rifter'),(3,'Fusion'),(4,'RAV4'), (5,'V60');

### Cars
INSERT INTO vehicle (id_vin, id_manufacturer, id_model, vehicle_year, id_color) 
VALUES 	('3K096I98581DHSNUP' ,1,1, '2019', 1),
		('ZM8G7BEUQZ97IH46V' ,2,2, '2019', 2),
        ('RKXVNNIHLVVZOUB4M' ,3,3, '2018', 3),
        ('HKNDGS7CU31E9Z7JW' ,4,4, '2018', 4), 
        ('DAM41UDN3CHU2WVF6' ,5,5, '2019', 5),
		('DAM41UDN3CHU2WVF6' ,5,5, '2019', 5);


### Customers
INSERT INTO customer (id_cust, name_cust, phone_number, email_cust, address_cust, city_cust, state_cust, country_cust, postalcode_cust) 
VALUES 	(10001 ,'Pablo Picasso','+34 636 17 63 82',null, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid',  'Spain', 28045),
		(20001 ,'Abraham Lincoln','+1 305 907 7086',null, '120 SW 8th St', 'Miami', 'Florida',  'United States', 33130),
        (30001 ,' Napoléon Bonaparte','+33 1 79 75 40 00',null, '40 Rue du Colisée', 'Paris', 'Île-de-France',  'France', 75008);
     
### Store

INSERT INTO store (id_store, city_store, country_store) 
VALUES 	(01,'Madrid',   'Spain'),
		(02,'Barcelona',   'Spain'),
        (03, 'Berlin',   'Germany'),
        (04, 'Paris',   'France'),
        (05,'Miami',  'USA'),
        (06, 'Mexico City',  'Mexico'),
        (07, 'Amsterdam',  'Netherlands'),
        (08, 'São Paulo',  'Brazil');


### Salespersons
INSERT INTO salesperson (id_salesperson, name_salesperson, id_store)
VALUES 	(00001, 'Petey Cruiser', 1), 
		(00002, 'Anna Sthesia', 2),
        (00003, 'Paul Molive', 3),
        (00004, 'Gail Forcewind', 4),
        (00005, 'Paige Turner', 5),
        (00006, 'Bob Frapples', 6),
        (00007, 'Walter Melon', 7),
        (00008, 'Shonda Leer', 8);
        

### Invoices
INSERT INTO invoice (id_invoice_nr, date_invoice, id_vehicle, id_cust, id_salesperson)
VALUES 	(852399038 , '2018-08-22' , 1 , 2 , 4 ),
		(731166526 , '2018-12-31' , 4 , 1 , 6 ),
        (271135104 , '2019-01-22' , 3 , 3 , 8 );
