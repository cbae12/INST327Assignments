USE my_guitar_shop;

/*Answer 1*/
SELECT product_name AS "Product Name" , category_name AS "Category Name",
COUNT(product_id) AS "Number Purchased" , 
CONCAT(MAX(discount_percent), '%') AS "Maximum Discount", 
CONCAT('$', SUM(list_price * quantity - discount_amount * quantity)) AS "Discounted Order Total"
FROM products
	JOIN categories
		USING (category_id)
	JOIN order_items
		USING (product_id)
GROUP BY product_name WITH ROLLUP;

/*Answer 2*/
SELECT CONCAT(first_name,' ', last_name) AS "Customer Name", 
email_address AS "Customer Email", CONCAT(line1, ' ', line2) AS "Customer Address", 
CONCAT(city, ', ', state, ' ',zip_code) AS "Customer City/State/Zip"
FROM customers
	JOIN addresses
		USING(customer_id)
WHERE last_name IN
	(SELECT last_name
		FROM customers
			WHERE last_name = 'Brown' OR last_name = 'Goldstein' OR last_name = 'Sherwood'
			OR last_name = 'Valentino' OR last_name = 'Wilson' OR last_name = 'Zimmer'
	)
GROUP BY last_name
ORDER BY last_name;

/*Answer 3*/
WITH valid_card_cte AS (					-- WITH statement for CTE application as named valid_card_cte
	SELECT CONCAT(first_name, ' ', last_name) AS "customer_name",			-- SELECT statement for when card_type != 'American Express' AND 'Discover'
	order_id, card_number, card_type, card_expires
	FROM orders
		JOIN customers
			USING (customer_id)
	WHERE card_type NOT IN ('American Express', 'Discover')					-- WHERE clause when card_type is not 'American Express' AND 'Discover'
	UNION
		SELECT CONCAT(first_name, ' ', last_name) AS "customer_name",		-- SELECT statement for when card_type IS 'American Express' OR 'Discover'
		order_id, card_number, 'Invalid Card Type' AS card_type, card_expires
		FROM orders
			JOIN customers
				USING (customer_id)
		WHERE card_type IN ('American Express', 'Discover')					-- WHERE clause for when card_type is 'American Express' OR 'Discover'
),
product_info AS (															-- Made another CTE statement named product_info to combine attributes
	SELECT order_id, product_name, item_price								-- FROM order_items and products USING product_id
		FROM order_items
			JOIN products
				USING (product_id)
)
SELECT customer_name, order_id, product_name, CONCAT('$', item_price) AS item_price,
card_number, card_type, card_expires
	FROM valid_card_cte
		JOIN product_info
			USING (order_id)
ORDER BY customer_name;