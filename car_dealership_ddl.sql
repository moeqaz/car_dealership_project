CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	address VARCHAR(100),
	email VARCHAR(50),
	phone VARCHAR(15),
	previous_customer BOOLEAN DEFAULT FALSE
);

SELECT *
FROM customer;

CREATE TABLE dealership(
	store_id SERIAL PRIMARY KEY,
	store_name VARCHAR(50) NOT NULL,
	address VARCHAR(150),
	email VARCHAR(100),
	phone VARCHAR(15)
);

SELECT *
FROM dealership;


CREATE TABLE cars(
	product_id SERIAL PRIMARY KEY,
	year_ INTEGER NOT NULL,
	vin_number VARCHAR(20) NOT NULL,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	color VARCHAR(10),
	price NUMERIC(7,2) NOT NULL,
	dealer_cost NUMERIC(7,2),
	new_vehicle BOOLEAN DEFAULT TRUE,
	store_id INTEGER,
	FOREIGN KEY(store_id) REFERENCES dealership(store_id)
);

SELECT *
FROM cars;


CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_number VARCHAR(30) NOT NULL,
	invoice_date TIMESTAMP NOT NULL,
	product_id INTEGER,
	FOREIGN KEY(product_id) REFERENCES cars(product_id)
);

SELECT *
FROM invoice;

ALTER TABLE invoice
ADD COLUMN customer_id INTEGER;

ALTER TABLE invoice 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);


CREATE TABLE salesperson(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	invoice_id INTEGER,
	FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id)
);

SELECT *
FROM salesperson;

ALTER TABLE cars
ADD COLUMN employee_id INTEGER;

ALTER TABLE cars 
ADD FOREIGN KEY(employee_id) REFERENCES salesperson(employee_id);

SELECT *
FROM cars;


CREATE TABLE service_vehicle(
	vehicle_id SERIAL PRIMARY KEY,
	vin_number VARCHAR(20) NOT NULL,
	year_ INTEGER NOT NULL,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL
);


CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(15) NOT NULL
);


CREATE TABLE service_ticket(
	service_id SERIAL PRIMARY KEY,
	ticket_number VARCHAR(30) NOT NULL,
	maintenance_date TIMESTAMP NOT NULL,
	maintenance_type VARCHAR(50) NOT NULL,
	price NUMERIC(5,2) NOT NULL,
	mechanic_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	vehicle_id INTEGER,
	FOREIGN KEY(vehicle_id) REFERENCES service_vehicle(vehicle_id)
);

SELECT *
FROM service_ticket;

ALTER TABLE service_vehicle 
ADD COLUMN service_id INTEGER;

ALTER TABLE service_vehicle  
ADD FOREIGN KEY(service_id) REFERENCES service_ticket(service_id);













