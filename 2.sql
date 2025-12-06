INSERT INTO Clients (id, email, phone_number, FirstName, LastName, date_join) VALUES
(1, 'yossi.c@gmail.com', '050-0000001', 'Yossi', 'Cohen', '2024-01-01'),
(2, 'sarah.l@yahoo.com', '052-0000002', 'Sarah', 'Levi', '2024-02-15'),
(3, 'david.m@outlook.com', '054-0000003', 'David', 'Mizrachi', '2024-03-10'),
(4, 'michal.p@gmail.com', '053-0000004', 'Michal', 'Peretz', '2024-04-05'),
(5, 'daniel.b@gmail.com', '050-0000005', 'Daniel', 'Biton', '2024-05-20'),
(6, 'rachel.k@yahoo.com', '052-0000006', 'Rachel', 'Katz', '2024-06-01'),
(7, 'tom.s@gmail.com', '054-0000007', 'Tom', 'Shahar', '2024-07-15'),
(8, 'gal.g@outlook.com', '053-0000008', 'Gal', 'Golan', '2024-08-10'),
(9, 'noam.a@gmail.com', '050-0000009', 'Noam', 'Azoulay', '2024-09-01'),
(10, 'shira.t@yahoo.com', '052-0000010', 'Shira', 'Tal', '2024-09-20'),
(11, 'omer.f@gmail.com', '054-0000011', 'Omer', 'Friedman', '2024-10-01'),
(12, 'adi.b@outlook.com', '053-0000012', 'Adi', 'Bar', '2024-10-15'),
(13, 'idan.s@gmail.com', '050-0000013', 'Idan', 'Shapiro', '2024-11-01'),
(14, 'maya.a@yahoo.com', '052-0000014', 'Maya', 'Avraham', '2024-11-05'),
(15, 'ben.g@gmail.com', '054-0000015', 'Ben', 'Gur', '2024-11-05'),
-- NEW USERS (Last 30 days relative to Dec 6)
(16, 'new.guy1@gmail.com', '050-9999991', 'Lior', 'Newman', '2025-11-20'),
(17, 'new.girl2@yahoo.com', '052-9999992', 'Noa', 'Fresh', '2025-11-25'),
(18, 'brand.new@outlook.com', '054-9999993', 'Adam', 'Hadash', '2025-12-01'),
(19, 'just.joined@gmail.com', '053-9999994', 'Dana', 'Akhshav', '2025-12-03'),
(20, 'welcome.user@gmail.com', '050-9999995', 'Ron', 'Haver', '2025-12-05');

-- FARMS (6 Farms)
-- Satisfies "With and Without Certificate"
INSERT INTO Farms (id, name, address, phone_number, specialty, kosher_expiry_date) VALUES
(1, 'Golan Orchard', 'Katzrin', '04-6960001', 'Fruits', '2026-12-31'),    -- Valid
(2, 'Negev Roots', 'Nevatim', '08-6230002', 'Vegetables', '2024-01-01'),  -- Expired
(3, 'Sharon Greens', 'Kfar Saba', '09-7650003', 'Greens', NULL),          -- No Cert
(4, 'Galil Bio', 'Rosh Pina', '04-6990004', 'Organic', '2025-12-31'),     -- Valid
(5, 'Arava Peppers', 'Ein Yahav', '08-6580005', 'Peppers', '2025-01-01'), -- Expired
(6, 'Emek Hefer Dairy', 'Emek Hefer', '09-8880006', 'Dairy', NULL);       -- No Cert

-- ITEMS (30 Items)
-- Satisfies "Items with 0 amount" (IDs 105, 115, 125, 130)
INSERT INTO Item (id, name, price, amount_left, category, farm_id) VALUES
-- Farm 1 (Fruits)
(101, 'Red Apples', 12.90, 100, 'Fruits', 1),
(102, 'Green Grapes', 18.50, 50, 'Fruits', 1),
(103, 'Pears', 14.90, 80, 'Fruits', 1),
(104, 'Watermelon', 25.00, 20, 'Fruits', 1),
(105, 'Nectarines', 16.00, 0, 'Fruits', 1), -- EMPTY
-- Farm 2 (Roots)
(106, 'Potatoes', 5.90, 500, 'Vegetables', 2),
(107, 'Carrots', 4.50, 300, 'Vegetables', 2),
(108, 'Onions', 4.90, 400, 'Vegetables', 2),
(109, 'Sweet Potato', 8.90, 150, 'Vegetables', 2),
(110, 'Garlic', 12.00, 100, 'Vegetables', 2),
-- Farm 3 (Greens)
(111, 'Lettuce', 6.00, 150, 'Greens', 3),
(112, 'Spinach', 7.50, 100, 'Greens', 3),
(113, 'Kale', 8.00, 60, 'Greens', 3),
(114, 'Arugula', 7.00, 70, 'Greens', 3),
(115, 'Bok Choy', 9.00, 0, 'Greens', 3), -- EMPTY
-- Farm 4 (Organic)
(116, 'Org. Cucumber', 9.90, 80, 'Organic', 4),
(117, 'Org. Zucchini', 10.90, 70, 'Organic', 4),
(118, 'Org. Tomato', 16.90, 60, 'Organic', 4),
(119, 'Org. Eggplant', 11.50, 40, 'Organic', 4),
(120, 'Org. Pepper', 18.00, 50, 'Organic', 4),
-- Farm 5 (Peppers)
(121, 'Red Pepper', 11.90, 200, 'Vegetables', 5),
(122, 'Yellow Pepper', 11.90, 180, 'Vegetables', 5),
(123, 'Green Pepper', 10.90, 150, 'Vegetables', 5),
(124, 'Chili Pepper', 15.00, 100, 'Vegetables', 5),
(125, 'Habanero', 20.00, 0, 'Vegetables', 5), -- EMPTY
-- Farm 6 (Dairy)
(126, 'Goat Cheese', 25.00, 40, 'Dairy', 6),
(127, 'Yogurt', 8.00, 100, 'Dairy', 6),
(128, 'Milk 1L', 6.50, 200, 'Dairy', 6),
(129, 'Butter', 15.00, 80, 'Dairy', 6),
(130, 'Cream', 12.00, 0, 'Dairy', 6); -- EMPTY

-- LOGISTICS HUBS
INSERT INTO PickupPoint (id, name, address) VALUES
(1, 'TLV Mega Center', 'Dizengoff 100'),  -- Target for >10 Orders
(2, 'Haifa Hub', 'Herzl 50'),
(3, 'Jerusalem Point', 'Jaffa 20');

INSERT INTO Carrier (id, name, phone, service_area) VALUES
(1, 'FastShip', '03-1231234', 'Central'),
(2, 'North Log', '04-9879876', 'North'),
(3, 'JeruExpress', '02-5555555', 'Jerusalem');

INSERT INTO OpeningHours (pickuppoint_id, day_of_week, open_time, close_time) VALUES
(1, 'Sunday', '08:00', '22:00'), (1, 'Monday', '08:00', '22:00'),
(2, 'Sunday', '09:00', '18:00'), (2, 'Monday', '09:00', '18:00'),
(3, 'Sunday', '10:00', '16:00');

-- =======================================================
-- 3. CREATE TRANSACTIONS (ORDERS)
-- =======================================================

-- BATCH 1: RECENT PICKUP ORDERS FOR "TLV MEGA CENTER" (ID 1)
-- Creating 15 orders (ID 1001-1015) in Nov/Dec 2025 to satisfy ">10 rule"
INSERT INTO Orders (id, client_id, date_created, status, supply_date) VALUES
(1001, 1, '2025-11-20 09:00:00', 'PickedUp', '2025-11-22'),
(1002, 2, '2025-11-21 10:00:00', 'PickedUp', '2025-11-23'),
(1003, 3, '2025-11-22 11:00:00', 'Paid', '2025-11-24'),
(1004, 4, '2025-11-23 12:00:00', 'Created', '2025-11-25'),
(1005, 5, '2025-11-24 13:00:00', 'PickedUp', '2025-11-26'),
(1006, 6, '2025-11-25 14:00:00', 'Paid', '2025-11-27'),
(1007, 7, '2025-11-26 15:00:00', 'Created', '2025-11-28'),
(1008, 8, '2025-11-27 16:00:00', 'PickedUp', '2025-11-29'),
(1009, 16, '2025-11-28 17:00:00', 'Created', '2025-11-30'), -- New User
(1010, 17, '2025-11-29 18:00:00', 'Paid', '2025-12-01'), -- New User
(1011, 1, '2025-12-01 08:30:00', 'Created', '2025-12-03'),
(1012, 2, '2025-12-01 09:30:00', 'Created', '2025-12-03'),
(1013, 18, '2025-12-02 10:30:00', 'Paid', '2025-12-04'), -- New User
(1014, 19, '2025-12-03 11:30:00', 'Created', '2025-12-05'), -- New User
(1015, 20, '2025-12-04 12:30:00', 'Created', '2025-12-06'); -- New User

-- BATCH 2: DELIVERY ORDERS (Various Dates & Statuses)
-- IDs 1016-1040
INSERT INTO Orders (id, client_id, date_created, status, supply_date) VALUES
(1016, 9, '2025-10-01 10:00:00', 'PickedUp', '2025-10-03'), -- Old
(1017, 10, '2025-10-15 11:00:00', 'PickedUp', '2025-10-17'), -- Old
(1018, 11, '2025-11-10 12:00:00', 'Cancelled', '2025-11-12'),
(1019, 12, '2025-11-15 13:00:00', 'PickedUp', '2025-11-17'),
(1020, 13, '2025-11-25 09:00:00', 'Paid', '2025-11-27'),
(1021, 14, '2025-11-26 10:00:00', 'Created', '2025-11-28'),
(1022, 15, '2025-11-27 11:00:00', 'Paid', '2025-11-29'),
(1023, 1, '2025-12-01 12:00:00', 'Created', '2025-12-03'),
(1024, 2, '2025-12-02 13:00:00', 'Created', '2025-12-04'),
(1025, 3, '2025-12-03 14:00:00', 'Paid', '2025-12-05'),
(1026, 4, '2025-12-04 15:00:00', 'Created', '2025-12-06'),
(1027, 5, '2025-12-05 08:00:00', 'Created', '2025-12-07'),
(1028, 6, '2025-12-05 09:00:00', 'Cancelled', '2025-12-07'),
(1029, 7, '2025-12-06 10:00:00', 'Created', '2025-12-08'),
(1030, 8, '2025-12-06 11:00:00', 'Created', '2025-12-08'),
(1031, 9, '2025-12-06 12:00:00', 'Created', '2025-12-09'),
(1032, 10, '2025-12-06 13:00:00', 'Created', '2025-12-09'),
(1033, 11, '2025-12-06 14:00:00', 'Created', '2025-12-10'),
(1034, 12, '2025-12-06 15:00:00', 'Created', '2025-12-10'),
(1035, 13, '2025-12-06 16:00:00', 'Created', '2025-12-11');

-- BATCH 3: SMALL PICKUP ORDERS (Haifa/Jerusalem)
-- IDs 1041-1050 (Just a few orders, so they don't reach 10 count)
INSERT INTO Orders (id, client_id, date_created, status, supply_date) VALUES
(1041, 14, '2025-12-01 09:00:00', 'Paid', '2025-12-03'),
(1042, 15, '2025-12-02 10:00:00', 'Paid', '2025-12-04'),
(1043, 16, '2025-12-03 11:00:00', 'Created', '2025-12-05'),
(1044, 17, '2025-12-04 12:00:00', 'Created', '2025-12-06'),
(1045, 18, '2025-12-05 13:00:00', 'Created', '2025-12-07');


-- =======================================================
-- 4. LINKING & LOGISTICS
-- =======================================================

-- POPULATE ORDER ITEMS (Random mix)
INSERT INTO OrderItems (order_id, item_id, amount) VALUES
-- TLV Pickups (Batch 1)
(1001, 101, 3), (1001, 126, 1),
(1002, 106, 5), (1002, 107, 2),
(1003, 111, 2), (1003, 112, 2),
(1004, 116, 1), (1004, 117, 1),
(1005, 121, 3), (1005, 122, 3),
(1006, 128, 2), (1006, 129, 1),
(1007, 102, 2), (1007, 103, 2),
(1008, 108, 5),
(1009, 101, 10), -- Bulk
(1010, 113, 1), (1010, 114, 1),
(1011, 118, 2), (1011, 119, 2),
(1012, 123, 2), (1012, 124, 1),
(1013, 127, 5),
(1014, 104, 2),
(1015, 109, 3), (1015, 110, 2),
-- Delivery Orders (Batch 2)
(1016, 101, 2), (1016, 102, 2),
(1017, 106, 10),
(1018, 120, 5),
(1019, 111, 3),
(1020, 101, 5), (1020, 106, 5),
(1021, 128, 4),
(1022, 126, 2), (1022, 129, 2),
(1023, 116, 5),
(1024, 121, 4),
(1025, 103, 6),
(1026, 108, 10),
(1027, 101, 1),
(1028, 111, 1),
(1029, 122, 5),
(1030, 123, 5),
(1031, 127, 10),
(1032, 104, 2),
(1033, 105, 1), -- Nectarines (Will show in history even if stock is now 0)
(1034, 115, 1), -- Bok Choy
(1035, 130, 1), -- Cream
-- Other Pickups (Batch 3)
(1041, 101, 2),
(1042, 102, 2),
(1043, 106, 2),
(1044, 111, 2),
(1045, 116, 2);

-- LINK PICKUPS
-- Important: Orders 1001-1015 MUST go to Pickuppoint 1 to verify your query.
INSERT INTO Pickup (order_id, pickuppoint_id) VALUES
(1001, 1), (1002, 1), (1003, 1), (1004, 1), (1005, 1),
(1006, 1), (1007, 1), (1008, 1), (1009, 1), (1010, 1),
(1011, 1), (1012, 1), (1013, 1), (1014, 1), (1015, 1),
-- Smaller Hubs
(1041, 2), (1042, 2), (1043, 3), (1044, 2), (1045, 3);

-- LINK DELIVERIES
-- The rest of the orders go here
INSERT INTO Delivery (order_id, delivery_address, carrier_id) VALUES
(1016, 'Addr 1', 1), (1017, 'Addr 2', 1), (1018, 'Addr 3', 1),
(1019, 'Addr 4', 1), (1020, 'Addr 5', 1), (1021, 'Addr 6', 1),
(1022, 'Addr 7', 2), (1023, 'Addr 8', 2), (1024, 'Addr 9', 2),
(1025, 'Addr 10', 2), (1026, 'Addr 11', 2), (1027, 'Addr 12', 3),
(1028, 'Addr 13', 3), (1029, 'Addr 14', 3), (1030, 'Addr 15', 3),
(1031, 'Addr 16', 1), (1032, 'Addr 17', 1), (1033, 'Addr 18', 1),
(1034, 'Addr 19', 2), (1035, 'Addr 20', 2);