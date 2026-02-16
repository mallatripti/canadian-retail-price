-- Show all data from table
SELECT * FROM retail_prices;


-- Shows all values where Value is null or zero 
SELECT * FROM retail_prices
where  VALUE IS Null or VALUE<=0;

-- Shows all values where value is greater than 10
SELECT * FROM retail_prices
WHERE VALUE >10;

-- Shows all the taxable products
SELECT * from retail_prices
WHERE Taxable = 'Yes';

-- Shows products and it's average retail price from top average price
SELECT Products,
round(avg(value),2) as avg_retail_price
from retail_prices
GROUP by Products
ORDER by avg_retail_price DESC;

-- Shows the province with highest tax rate
SELECT GEO
FROM retail_prices
order by "Total tax rate" DESC
LIMIT 1;

-- Find all essential products in Province 1 in 2024
SELECT products, VALUE, Month
FROM retail_prices
where GEO = 'Province 1' AND
Essential = 'Essential'
AND Year = 2024;

-- List 10 expensive meat Products
SELECT Products, VALUE, GEO
from retail_prices WHERE
"Product Category" = 'Meat & Poultry'
ORDER by VALUE DESC;

-- Average price of products by category in 2025
SELECT "Product Category", round(avg(value),2) as avg_price
FROM retail_prices
WHERE Year = '2025'
GROUP by "Product Category"
ORDER by avg_price DESC;

-- Count of Taxable vs. Non-Taxable items per Province
SELECT GEO, Taxable, count(*) AS item_count
from retail_prices
GROUP by GEO, Taxable;


