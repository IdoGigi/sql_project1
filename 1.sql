USE farm2u;

SELECT CONCAT(FullName.FirstName, ' ' , FullName.LastName) AS "Full Name", clients.id
FROM clients JOIN FullName 
ON clients.id = FullName.client_id;


SELECT  clients.id, CONCAT(FullName.FirstName, ' ' , FullName.LastName) AS "Full Name",clients.date_join
FROM clients JOIN FullName 
ON clients.id = FullName.client_id
WHERE clients.date_join  >= (CURDATE() - INTERVAL 30 DAY)
ORDER BY clients.date_join DESC; 


SELECT * from clients;
DELETE FROM clients;