CREATE SCHEMA IF NOT EXISTS farm2u;
DROP DATABASE farm2u;
CREATE DATABASE farm2u;
USE farm2u;

CREATE TABLE IF NOT EXISTS Clients (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    phone_number VARCHAR(50),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    date_join DATE
);

CREATE TABLE IF NOT EXISTS Farms (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(50),
    specialty VARCHAR(255),
    kosher_expiry_date DATE
);

CREATE TABLE IF NOT EXISTS Item (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    amount_left INT,
    category VARCHAR(255),
    farm_id INT,
    FOREIGN KEY (farm_id) REFERENCES Farms(id)
);

CREATE TABLE IF NOT EXISTS Orders (
    id INT PRIMARY KEY,
    client_id INT,
    date_created DATETIME,
    status VARCHAR(20) CHECK (status IN ('PickedUp', 'Paid', 'Created', 'Cancelled')),
    supply_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(id)
);

CREATE TABLE IF NOT EXISTS OrderItems (
	order_id INT,
    item_id INT,
    amount INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE TABLE IF NOT EXISTS Carrier (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    phone VARCHAR(50),
    service_area VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS PickupPoint (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Pickup (
    order_id INT PRIMARY KEY,
    pickuppoint_id INT,
	FOREIGN KEY (Order_id) REFERENCES Orders(id),
    FOREIGN KEY (pickuppoint_id) REFERENCES pickuppoint(id)
);

CREATE TABLE IF NOT EXISTS Delivery (
    delivery_address VARCHAR(255),
    Order_id INT PRIMARY KEY,
    carrier_id INT,
    FOREIGN KEY (carrier_id) REFERENCES carrier(id),
    FOREIGN KEY (Order_id) REFERENCES Orders(id)
);
CREATE TABLE OpeningHours (
    pickuppoint_id INT,             
    day_of_week VARCHAR(10),     
    open_time TIME,            
    close_time TIME,            	
    FOREIGN KEY (pickuppoint_id) REFERENCES pickuppoint(id)
);

