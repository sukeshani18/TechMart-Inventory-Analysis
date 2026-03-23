DROP TABLE IF EXISTS Stock_Transactions;
CREATE TABLE stock_transactions (
Transaction_ID varchar(50),
Warehouse varchar(50),
City varchar(50),
Material varchar(50),
Movement_Type varchar(50),
Vendor varchar(50),
Customer varchar(50),
Inbound_Qty int,
Outbound_Qty int,
Opening_Stock int,
Transaction_Date date, 
Closing_stock int,
Net_quantity int
);
SELECT * FROM stock_transactions;

-- validate data
select count(*) from stock_transactions;

--Business Metrics (KPIs)
select sum(inbound_qty) as total_in_quantity
from stock_transactions;

select sum(outbound_qty) as total_out_quantity
from stock_transactions;

--Business Insights
-- top selling materials 
SELECT material,
SUM(outbound_qty) AS total_sales
FROM stock_transactions
GROUP BY material
ORDER BY total_sales DESC;

--Prepare Clean Data for Dashboard
-- warehouse performance
SELECT
warehouse,
SUM(inbound_qty) AS inbound,
SUM(outbound_qty) AS outbound
FROM stock_transactions
GROUP BY warehouse;

--Inventory Movement (Inbound vs Outbound)
SELECT
movement_type,
SUM(inbound_qty) AS total_inbound,
SUM(outbound_qty) AS total_outbound
FROM stock_transactions
GROUP BY movement_type;

-- top5 selling materials
SELECT
material,
SUM(outbound_qty) AS total_sold
FROM stock_transactions
GROUP BY material
ORDER BY total_sold DESC
LIMIT 5;

-- warehouse performance
SELECT
warehouse,
SUM(inbound_qty) AS total_inbound,
SUM(outbound_qty) AS total_outbound
FROM stock_transactions
GROUP BY warehouse
ORDER BY total_outbound DESC;

--City-wise Sales
SELECT
city,
SUM(outbound_qty) AS total_sales
FROM stock_transactions
GROUP BY city
ORDER BY total_sales DESC;

--Stock Health (Negative Stock)
SELECT
transaction_id,
material,
warehouse,
closing_stock
FROM stock_transactions
WHERE closing_stock < 0;

-- Top 10 Transactions
SELECT *
FROM stock_transactions
LIMIT 10;

SELECT vendor, customer, inbound_qty, outbound_qty
FROM stock_transactions
LIMIT 5;

SELECT *
FROM stock_transactions
LIMIT 1;