USE farm2u;

-- 1. Clear existing data to prevent duplicates
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Pickup;
TRUNCATE TABLE Delivery;
TRUNCATE TABLE `Order`;
TRUNCATE TABLE Item;
TRUNCATE TABLE Kosher_certificate;
TRUNCATE TABLE Farms;
TRUNCATE TABLE FullName;
TRUNCATE TABLE Clients;
TRUNCATE TABLE Carrier;
SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- 2. Insert Farms
-- ==========================================
INSERT INTO Farms (id, name, address, phone_number, specialty) VALUES
(100, 'Green Valley Farm', '12 Valley Rd', '050-1111111', 'Vegetables'),
(101, 'Sunrise Dairy', '5 Mountain View', '050-2222222', 'Dairy Products'),
(102, 'Orchard Hill', '88 Fruit St', '050-3333333', 'Fruits');

-- Insert Kosher Certificates
INSERT INTO Kosher_certificate (Farms_id, expiry_date) VALUES
(100, DATE_ADD(NOW(), INTERVAL 1 YEAR)), 
(101, DATE_ADD(NOW(), INTERVAL 6 MONTH));

-- ==========================================
-- 3. Insert Items
-- ==========================================
INSERT INTO Item (id, name, price, amount_left, category, farm_id) VALUES
(501, 'Cherry Tomatoes', 12.50, 100, 'Vegetables', 100), -- In stock
(502, 'Carrots', 8.90, 50, 'Vegetables', 100),         -- In stock
(503, 'Goat Milk', 18.00, 20, 'Dairy', 101),           -- In stock
(504, 'Sheep Yogurt', 22.00, 0, 'Dairy', 101),         -- Out of stock (0)
(505, 'Fresh Oranges', 6.50, 200, 'Fruit', 102);       -- In stock

-- ==========================================
-- 4. Insert Clients & Names
-- ==========================================
-- Old client (Joined 60 days ago) - Should NOT appear in the query result
INSERT INTO Clients (id, email, phone_number, date_join) VALUES 
(1, 'old_user@example.com', '052-1111111', DATE_SUB(NOW(), INTERVAL 60 DAY));
INSERT INTO FullName (client_id, FirstName, LastName) VALUES (1, 'John', 'Doe');

-- New clients (Joined in the last 30 days) - Should appear in the query result
INSERT INTO Clients (id, email, phone_number, date_join) VALUES 
(2, 'alice@example.com', '052-2222222', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(3, 'bob@example.com', '052-3333333', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(4, 'charlie@example.com', '052-4444444', DATE_SUB(NOW(), INTERVAL 20 DAY));

INSERT INTO FullName (client_id, FirstName, LastName) VALUES 
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Jones'),
(4, 'Charlie', 'Brown');

-- ==========================================
-- 5. Insert Orders
-- ==========================================
-- Creating multiple orders in the last 15 days
-- This is needed to satisfy the ">= 10 orders" requirement for the Pickup query

INSERT INTO `Order` (id, client_id, date_created, status, supply_dated, item_id) VALUES
(2001, 2, DATE_SUB(NOW(), INTERVAL 15 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 14 DAY), 501),
(2002, 3, DATE_SUB(NOW(), INTERVAL 14 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 13 DAY), 502),
(2003, 4, DATE_SUB(NOW(), INTERVAL 13 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 12 DAY), 505),
(2004, 2, DATE_SUB(NOW(), INTERVAL 12 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 11 DAY), 501),
(2005, 3, DATE_SUB(NOW(), INTERVAL 11 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 10 DAY), 503),
(2006, 4, DATE_SUB(NOW(), INTERVAL 10 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 9 DAY), 505),
(2007, 2, DATE_SUB(NOW(), INTERVAL 9 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 8 DAY), 501),
(2008, 3, DATE_SUB(NOW(), INTERVAL 8 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 7 DAY), 502),
(2009, 4, DATE_SUB(NOW(), INTERVAL 7 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 6 DAY), 503),
(2010, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 5 DAY), 505),
(2011, 3, DATE_SUB(NOW(), INTERVAL 5 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 4 DAY), 501),
(2012, 4, DATE_SUB(NOW(), INTERVAL 4 DAY), 'Completed', DATE_SUB(NOW(), INTERVAL 3 DAY), 502);

-- ==========================================
-- 6. Insert Pickup Locations
-- ==========================================
-- Note: All these pickup entries point to the same location name "City Center Market"
-- This ensures the location has 12 orders total

INSERT INTO Pickup (id, Order_id, name, address, days_open) VALUES
(101, 2001, 'City Center Market', 'Main St 100', '09:00-22:00'),
(102, 2002, 'City Center Market', 'Main St 100', '09:00-22:00'),
(103, 2003, 'City Center Market', 'Main St 100', '09:00-22:00'),
(104, 2004, 'City Center Market', 'Main St 100', '09:00-22:00'),
(105, 2005, 'City Center Market', 'Main St 100', '09:00-22:00'),
(106, 2006, 'City Center Market', 'Main St 100', '09:00-22:00'),
(107, 2007, 'City Center Market', 'Main St 100', '09:00-22:00'),
(108, 2008, 'City Center Market', 'Main St 100', '09:00-22:00'),
(109, 2009, 'City Center Market', 'Main St 100', '09:00-22:00'),
(110, 2010, 'City Center Market', 'Main St 100', '09:00-22:00'),
(111, 2011, 'City Center Market', 'Main St 100', '09:00-22:00'),
(112, 2012, 'City Center Market', 'Main St 100', '09:00-22:00');

-- ==========================================
-- 7. Insert Carrier
-- ==========================================
INSERT INTO Carrier (id, delivery_address, name, phone, service_area) VALUES
(900, 'Warehouse A', 'Fast Delivery Co', '054-0000000', 'Central District');