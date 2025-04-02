--What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years? 

SELECT 
  DATE_TRUNC(orders.purchase_ts, QUARTER) AS quarter, 
  COUNT(orders.id) AS order_count, 
  ROUND(SUM(orders.usd_price),2) AS sales,
  ROUND(AVG(usd_price),2) AS AOV
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country_code
WHERE LOWER(orders.product_name) LIKE '%macbook%'
AND geo_lookup.region = 'NA'
GROUP BY 1
ORDER BY 1 DESC;

--What is the average quarterly order count and total sales for Macbooks sold in North America? 
--For North America Macbooks, average of 98.13 units sold per quarter and 155,362.09 in dollar sales per quarter.

WITH quarterly_metric AS (
  SELECT 
    DATE_TRUNC(orders.purchase_ts, QUARTER) AS purchase_quarter,
    COUNT(DISTINCT orders.id) AS order_count,
    SUM(orders.usd_price) AS total_sales
  FROM core.orders
  LEFT JOIN core.customers
    ON customers.id = orders.customer_id
  LEFT JOIN core.geo_lookup
    ON customers.country_code = geo_lookup.country_code
  WHERE geo_lookup.region = 'NA' 
  AND LOWER(orders.product_name) LIKE '%macbook%'
  GROUP BY 1
  ORDER BY 1 DESC
)

SELECT 
  ROUND(AVG(order_count),2) AS avg_order_count,
  ROUND(AVG(total_sales),2) AS avg_total_sales
FROM quarterly_metric;


--For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 
--For EMEA, average time to delivery is 7.54 days.

SELECT 
  geo_lookup.region, 
  ROUND(AVG(DATE_DIFF(orders_status.delivery_ts, orders_status.purchase_ts, DAY)),2) AS days_to_delivery
FROM core.orders
LEFT JOIN core.orders_status
  ON orders.id = orders_status.order_id
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website')
OR (orders.purchase_platform = 'mobile app')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--For products is website purchases made in 2022 or Samsung purchases made in 2021, expressing time to deliver in weeks instead of days.
SELECT 
  geo_lookup.region, 
  ROUND(AVG(DATE_DIFF(orders_status.delivery_ts, orders_status.purchase_ts, WEEK)),2) AS days_to_delivery
FROM core.orders
LEFT JOIN core.orders_status
  ON orders.id = orders_status.order_id
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website')
OR (EXTRACT(YEAR FROM orders.purchase_ts) = 2021 AND LOWER(orders.product_name) LIKE '%samsung%')
GROUP BY 1
ORDER BY 2 DESC;

--What was the refund rate and refund count for each product overall? 

SELECT CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE orders.product_name END AS product_name,
  ROUND(AVG(CASE WHEN orders_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END)*100,2) AS refund_rate, 
  SUM(CASE WHEN orders_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_count
FROM core.orders
LEFT JOIN core.orders_status
  ON orders.id = orders_status.order_id
GROUP BY 1
ORDER BY 2 DESC;

--What was the refund rate and refund count for each product per year?

SELECT EXTRACT(YEAR FROM orders.purchase_ts) AS year,
  CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE orders.product_name END AS product_name,
  ROUND(AVG(CASE WHEN orders_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END),2) AS refund_rate, 
  SUM(CASE WHEN orders_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_count
FROM core.orders
LEFT JOIN core.orders_status
  ON orders.id = orders_status.order_id
GROUP BY 1,2
ORDER BY 3 DESC;

--Within each region, what is the most popular product? 

WITH sales_by_product AS(
  SELECT 
    geo_lookup.region AS region, 
    CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE orders.product_name END AS product_name, 
    COUNT(DISTINCT orders.id) AS order_count,
    RANK() OVER(PARTITION BY geo_lookup.region ORDER BY COUNT(DISTINCT orders.id) DESC) as rnk
  FROM core.geo_lookup
  LEFT JOIN core.customers
  ON geo_lookup.country_code = customers.country_code
  LEFT JOIN core.orders
  ON orders.customer_id = customers.id 
  GROUP BY 1,2
)

SELECT 
  region, 
  product_name, 
  order_count
FROM sales_by_product
WHERE rnk = 1;

--How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers? 
--loyalty program: 49.3days; non-loyalty program: 70.5 days
SELECT 
  customers.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)),1) AS days_to_purchase
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
GROUP BY 1;

--split the time to purchase per loyalty program, per purchase platform. Return the number of records to benchmark the severity of nulls.

SELECT 
  customers.loyalty_program, 
  orders.purchase_platform,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, DAY)),1) AS days_to_purchase,
  COUNT(*) AS row_count
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
GROUP BY 1,2
ORDER BY 1 DESC;
