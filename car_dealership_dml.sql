-- Add dealerships

CREATE OR REPLACE PROCEDURE add_dealership(
	store_name VARCHAR(50),
	address VARCHAR(150),
	email VARCHAR(100),
	phone VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO dealership(store_name, address, email, phone)
	VALUES(store_name, address, email, phone);
END;
$$;

CALL add_dealership('Honda', '9701 Reisterstown Road', 'honda@dealership.com', '410-449-1418');

CALL add_dealership('INFINITI', '4545 Chantilly Circle', 'getfiniti@dealer.com', '470-895-4520');

SELECT *
FROM dealership;

-- Add cars

-- Stored procedure to add Hondas

CREATE OR REPLACE PROCEDURE add_cars(
	year_ INTEGER,
	vin_number VARCHAR(20),
	make VARCHAR(25),
	model VARCHAR(25),
	color VARCHAR(10),
	price NUMERIC(7,2),
	dealer_cost NUMERIC(7,2),
	new_vehicle BOOLEAN DEFAULT TRUE,
	store_id INTEGER DEFAULT 1
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO cars(year_, vin_number, make, model, color, price, dealer_cost, new_vehicle, store_id)
	VALUES(year_, vin_number, make, model, color, price, dealer_cost, TRUE, 1);
END;
$$;


CALL add_cars(2019, '5BRTH32NDH6512', 'INFINITI', 'QX60', 'Black', 45820.00, 38420.00, FALSE, 2);

SELECT *
FROM cars;



-- Store procedure to add INFINITIs
CREATE OR REPLACE PROCEDURE add_cars(
	year_ INTEGER,
	vin_number VARCHAR(20),
	make VARCHAR(25),
	model VARCHAR(25),
	color VARCHAR(10),
	price NUMERIC(7,2),
	dealer_cost NUMERIC(7,2),
	new_vehicle BOOLEAN DEFAULT TRUE,
	store_id INTEGER DEFAULT 2
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO cars(year_, vin_number, make, model, color, price, dealer_cost, new_vehicle, store_id)
	VALUES(year_, vin_number, make, model, color, price, dealer_cost, TRUE, 1);
END;
$$;


-- Stored procedure to add customer rows

CREATE OR REPLACE PROCEDURE add_customer(
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	address VARCHAR(100),
	email VARCHAR(50),
	phone VARCHAR(15),
	previous_customer BOOLEAN DEFAULT FALSE
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, address, email, phone)
	VALUES(first_name, last_name, address, email, phone);
END;
$$;


CALL add_customer('Sam', 'Sabeeh', '1 Snow Street', 'sams@email.com', '410-364-8466', TRUE);

SELECT *
FROM customer;

-- Insert invoices

INSERT INTO invoice(
	invoice_number,
	invoice_date,
	product_id 
) VALUES (
	'5632154',
	NOW(),
	3
);

SELECT *
FROM invoice;


-- Insert salesperson info

INSERT INTO salesperson(
	first_name,
	last_name,
	invoice_id 
) VALUES (
	'Guillaume',
	'Mimoun',
	3
);


SELECT *
FROM salesperson;


-- Add vehicles in service

INSERT INTO service_vehicle(
	vin_number,
	year_,
	make,
	model
) VALUES (
	'6HDTE654YTRH9854',
	2019,
	'Honda',
	'Odyssey'
);

SELECT *
FROM service_vehicle;


-- Add mechanics rows

INSERT INTO mechanic(
	first_name,
	last_name 
) VALUES (
	'Randy',
	'Sandburg'
);
 
SELECT *
FROM mechanic;


-- Add service ticket rows

INSERT INTO service_ticket(
	ticket_number,
	maintenance_date,
	maintenance_type,
	price,
	mechanic_id
) VALUES (
	'S9458721',
	NOW(),
	'Alignment',
	95.15,
	2
);

SELECT *
FROM service_ticket














