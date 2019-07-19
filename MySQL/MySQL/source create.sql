CREATE DATABASE lab_mysql_vinicius;
USE lab_mysql_vinicius;

CREATE TABLE color (
	id int NOT NULL AUTO_INCREMENT,
    id_color INT ,
    name_color varchar(20),
    PRIMARY KEY (id)
);

CREATE TABLE manufacturer (
	id int NOT NULL AUTO_INCREMENT,
    id_manufacturer int,
    name_manufacturer varchar(20),
    PRIMARY KEY (id)
);

CREATE TABLE model (
	id int NOT NULL AUTO_INCREMENT,
    id_model INT ,
    id_manufacturer int, 
    name_model varchar(20),
    PRIMARY KEY (id), 
    FOREIGN KEY (id_manufacturer) references manufacturer(id)
); 

CREATE TABLE store (
	id int NOT NULL AUTO_INCREMENT,
    id_store INT ,
    city_store varchar(50),
    country_store varchar(30),
    PRIMARY KEY (id)
); 

CREATE TABLE salesperson (
	id int NOT NULL AUTO_INCREMENT,
    id_salesperson INT ,
    name_salesperson varchar(100), 
    id_store int, 
    PRIMARY KEY (id),
    FOREIGN KEY (id_store) references store(id)
); 

CREATE TABLE customer (
	id int NOT NULL AUTO_INCREMENT,
    id_cust INT ,
    name_cust varchar(100), 
    phone_number varchar(20),
    email_cust varchar(100), 
    address_cust varchar(120),
    city_cust varchar(50),
    state_cust varchar(40),
    country_cust varchar(30),
    postalcode_cust int(5),
    PRIMARY KEY (id)
); 

CREATE TABLE vehicle (
	id int NOT NULL AUTO_INCREMENT,
    id_vin VARCHAR(17) ,
    id_manufacturer int, 
    id_model int,
    vehicle_year char(4),
    id_color int,
    PRIMARY KEY (id), 
    FOREIGN KEY (id_manufacturer) references manufacturer(id),
    FOREIGN KEY (id_model) references model(id),
	FOREIGN KEY (id_color) references color(id)
); 

CREATE TABLE invoice (
	id int NOT NULL AUTO_INCREMENT,
    id_invoice_nr INT ,
    date_invoice date, 
    id_vehicle int,
    id_cust int, 
    id_salesperson int, 
    PRIMARY KEY (id),
    FOREIGN KEY (id_vehicle) references vehicle(id),
    FOREIGN KEY (id_cust) references customer(id),
    FOREIGN KEY (id_salesperson) references salesperson(id)
); 


