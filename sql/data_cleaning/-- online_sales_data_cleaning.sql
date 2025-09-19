-- online_sales_data_cleaning.sql

SELECT * FROM online_sales;

-- Create a Staging Data to Avoid Tampering With the Original Dataset
CREATE TABLE online_sales1 AS SELECT * FROM online_sales
WHERE 1 = 0;
INSERT INTO online_sales1 SELECT * FROM online_sales;
SELECT * FROM online_sales1;

-- Check for Duplicates
SELECT DISTINCT invoice_no FROM online_sales1;

SELECT *, ROW_NUMBER() OVER(PARTITION BY invoice_no, stock_code, description, units_sold, invoice_date,
unit_price, customer_id, country, discount, payment_method, shipping_cost,
category, sales_channel, return_status, shipment_provider,
warehouse_location, order_priority) AS row_num FROM online_sales1;

SELECT stock_code, COUNT(*) FROM online_sales1 GROUP BY stock_code HAVING COUNT(*) >1;
SELECT customer_id, COUNT(*) FROM online_sales1 GROUP BY customer_id HAVING COUNT(*) > 1;

SELECT * FROM online_sales1 WHERE invoice_no = 738471;
SELECT * FROM online_sales1 WHERE stock_code = 'SKU_1439';
SELECT * FROM online_sales1 WHERE customer_id = 96868;

-- Standardizing Data and Handling Null/Blank Values
SELECT DISTINCT description FROM online_sales1;

SELECT * FROM online_sales1 WHERE customer_id IS NULL;

SELECT DISTINCT country FROM online_sales1 ORDER BY 1;

SELECT * FROM online_sales1 WHERE discount <= 0;
SELECT * FROM online_sales1 WHERE discount IS NULL;

SELECT DISTINCT payment_method FROM online_sales1;
SELECT * FROM online_sales1 WHERE payment_method LIKE '%Pay%';
UPDATE online_sales1 SET payment_method = 'PayPal' WHERE payment_method = 'paypall';

SELECT * FROM online_sales1 WHERE shipping_cost IS NULL AND warehouse_location IS NULL;

SELECT DISTINCT category FROM online_sales1;

SELECT DISTINCT sales_channel FROM online_sales1;
SELECT * FROM online_sales1 WHERE sales_channel IS NULL;

SELECT DISTINCT return_status FROM online_sales1;
SELECT * FROM online_sales1 WHERE return_status IS NULL;

SELECT DISTINCT shipment_provider FROM online_sales1;
SELECT * FROM online_sales1 WHERE shipment_provider IS NULL;

SELECT DISTINCT warehouse_location FROM online_sales1;
SELECT * FROM online_sales1 WHERE warehouse_location IS NULL;

SELECT DISTINCT order_priority FROM online_sales1;
SELECT * FROM online_sales1 WHERE order_priority IS NULL;

SELECT ABS(units_sold) AS unit_sold FROM online_sales1;
UPDATE online_sales1 SET units_sold = ABS(units_sold);

SELECT ABS(unit_price) AS unit_price FROM online_sales1;
UPDATE online_sales1 SET unit_price = ABS(unit_price);
SELECT * FROM online_sales1 WHERE invoice_no = 318969;
