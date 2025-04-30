--  TABLA CLIENTES
CREATE TABLE clientes(
	id_card INTEGER PRIMARY KEY, 
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL, 
	age INTEGER NOT NULL CHECK(age>0),
	registration_date TIMESTAMP NOT NULL,
	city VARCHAR(20) NOT NULL
);

-- TABLA SUCURSALES
CREATE TABLE sucursal(
	branch_id SERIAL PRIMARY KEY,
	city VARCHAR(20) NOT NULL,
	address VARCHAR(20) NOT NULL,
	phone_number VARCHAR(10) NOT NULL
);

--  TABLA  VEHICULOS
CREATE TABLE vehiculo(
	license_plate VARCHAR(6),
	brand VARCHAR(20) NOT NULL,
	year INTEGER CHECK (year BETWEEN 1950 AND 2050),
	color VARCHAR(20) NOT NULL,
	wheel_drive INT DEFAULT 2 CHECK (wheel_drive IN(2,4)),
	available BOOLEAN DEFAULT TRUE,
	branch INTEGER,
	PRIMARY KEY(license_plate),
	FOREIGN KEY(branch) REFERENCES sucursal(branch_id)
	ON UPDATE CASCADE 
	ON DELETE SET NULL
);

--  TABLA  ALQUILERES
CREATE TABLE alquiler(
	rental_id SERIAL PRIMARY KEY,
	client_id INTEGER,
	vehicle_plate VARCHAR(6),
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP NOT NULL,
	active_rental BOOLEAN DEFAULT TRUE,
	CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES clientes(id_card) 
	ON UPDATE CASCADE 
	ON DELETE CASCADE,
	CONSTRAINT fk_vehicle_plate FOREIGN KEY (vehicle_plate) REFERENCES vehiculo(license_plate) 
	ON UPDATE CASCADE 
	ON DELETE SET NULL
);

-- TABLA DE PAGOS
CREATE TABLE pago(
	payment_id SERIAL PRIMARY KEY,
	rental_id INTEGER,
	amount DECIMAL(10,2) NOT NULL CHECK(amount > 0),
	FOREIGN KEY(rental_id) REFERENCES alquiler(rental_id)
	ON DELETE SET NULL
);
