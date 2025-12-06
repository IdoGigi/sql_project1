USE farm2u;

-- Q1
SELECT clients.id, CONCAT(clients.FirstName, " ", clients.LastName) AS "Full Name", clients.date_join 
	FROM clients
	WHERE date_join >= (CURRENT_DATE() - INTERVAL 30 DAY)
    ORDER BY date_join DESC;

-- Q2
SELECT 
    Item.name AS Item_name, 
    Farms.id AS farm_id, 
    Item.category
FROM Item
JOIN Farms ON Item.farm_id = Farms.id
WHERE Item.amount_left = 0;

-- Q3

SELECT 
    Pickup.pickuppoint_id,
    COUNT(*) AS total_orders
FROM Pickup
JOIN Orders ON Pickup.order_id = Orders.id
WHERE Orders.date_created >= CURDATE() - INTERVAL 30 DAY
GROUP BY Pickup.pickuppoint_id
HAVING COUNT(*) >= 10;

-- Q4   
SELECT 
    id, name,
    CASE 
        WHEN kosher_expiry_date IS NULL THEN 'No Certificate'
        WHEN kosher_expiry_date >= CURDATE() THEN 'Valid'
        ELSE 'Expired'
    END AS certificate_status
FROM Farms;
