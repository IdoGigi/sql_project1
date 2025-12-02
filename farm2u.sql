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

-- יצירת טבלת Farms
CREATE TABLE IF NOT EXISTS Farms (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(50),
    specialty VARCHAR(255)
);

-- יצירת טבלת Kosher_certificate
CREATE TABLE IF NOT EXISTS Kosher_certificate (
    Farms_id INT PRIMARY KEY,
    expiry_date DATE,
    FOREIGN KEY (Farms_id) REFERENCES Farms(id)
);

---

-- יצירת טבלת Item
CREATE TABLE IF NOT EXISTS Item (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    amount_left INT,
    category VARCHAR(255),
    farm_id INT,
    FOREIGN KEY (farm_id) REFERENCES Farms(id)
);

-- יצירת טבלת Order
-- הערה: משתמשים בגרשיים (`) כדי להתגבר על מילת המפתח השמורה 'ORDER' ב-SQL.
CREATE TABLE IF NOT EXISTS `Order` (
    id INT PRIMARY KEY,
    client_id INT,
    date_created DATETIME,
    status VARCHAR(50),
    supply_dated DATE,
    item_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- יצירת טבלת Delivery
CREATE TABLE IF NOT EXISTS Delivery (
    delivery_address VARCHAR(255),
    Order_id INT PRIMARY KEY,
    FOREIGN KEY (Order_id) REFERENCES `Order`(id)
);

-- יצירת טבלת Carrier
CREATE TABLE IF NOT EXISTS Carrier (
    id INT PRIMARY KEY,
    delivery_address VARCHAR(255),
    name VARCHAR(255),
    phone VARCHAR(50),
    service_area VARCHAR(255)
);


-- יצירת טבלת Pickup
CREATE TABLE IF NOT EXISTS Pickup (
    id INT PRIMARY KEY,
    Order_id INT,
    name VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (Order_id) REFERENCES `Order`(id)
);

CREATE TABLE OpeningHours (
    pickup_id INT,             
    day_of_week VARCHAR(10),     
    open_time TIME,            
    close_time TIME,            	
    FOREIGN KEY (pickup_id) REFERENCES Pickup(id)
);

-- Note: IDs are manually inserted here. If you use AUTO_INCREMENT, you can omit the ID column in the INSERT statement.