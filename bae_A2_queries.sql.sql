USE my_guitar_shop;

/* Answer 1 
	CREATE TABLE for customers_copy, products_copy, and addresses_copy
*/
DROP TABLE IF EXISTS customers_copy;		-- DROP clause used if there exists previous copy of customers
CREATE TABLE customers_copy LIKE customers;
INSERT INTO customers_copy
SELECT * FROM customers;
DROP TABLE IF EXISTS products_copy;			-- DROP clause used if there exists previous copy of products
CREATE TABLE products_copy LIKE products;
INSERT INTO products_copy
SELECT * FROM products;
DROP TABLE IF EXISTS addresses_copy;		-- DROP clause used if there exists previous copy of addresses
CREATE TABLE addresses_copy LIKE addresses;
INSERT INTO addresses_copy
SELECT * FROM addresses;

/* Answer 2 
	INSERT clause used in customers_copy table to include the following row
*/
SELECT * FROM customers_copy c;
INSERT INTO customers_copy
	(customer_id, email_address, password, first_name, last_name, 
    shipping_address_id, billing_address_id)
VALUES (NULL, 'vdiker@murach.com', '7a718fbd768d2378z511f8249b54897f940e9023', 'Vedat', 'Diker', 10, 1);
SELECT * FROM customers_copy;

/* Answer 3 
	INSERT clause used in products_copy table to include the following row
*/
SELECT * FROM products_copy;
INSERT INTO products_copy
(product_id, category_id, product_code, product_name, description, 
list_price, discount_percent, date_added)
VALUES (11, 4, 'Y_PK100', 'Yamaha PK-100', 'The Yamaha PK-100 88-key weighted action 
digital piano has a Graded Hammer Standard Action, 192-note Polyphony, 24 Sounds, 
Stereo Sound System, EQ, and Drum Patterns/Virtual Accompaniment - Black', 800.00, 20.00,
NOW());
SELECT * FROM products_copy;

/* Answer 4 
	UPDATE claused used in products_copy table to set
	list_price = 689.99 and discount_percent = 40 and 
	sets SQL_SAFE_UPDATES = 0, because list_price and 
	discount_percent are neither primary key nor foreign key.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE products_copy
SET
	list_price = 689.99,
	discount_percent = 40
WHERE product_id = 11;
SELECT * FROM products_copy;

/* Answer 5 
	UPDATE claused used in addresses_copy table to
	set disabled = 1 and sets SQL_SAFE_UPDATES = 0,
	because disabled is neither primary key nor foreign key.
*/

SELECT * FROM addresses_copy;
SET SQL_SAFE_UPDATES = 0;
UPDATE addresses_copy
SET
	disabled = 1
WHERE state = 'CA' OR state = 'OR';
SELECT * FROM addresses_copy;

/* Answer 6 
	Using WITH to implement Common Table Expressions (CTE) as non-recursive
*/
WITH total AS
(
-- Using subquery to define WITH statement that locates total price that is required
-- to be calculated from. It also includes order_id and product_id.
	SELECT
    SUM(((item_price - discount_amount) * quantity) - ship_amount - tax_amount) AS total_price,
    o.order_id, o_item.product_id
	FROM order_items o_item
-- order_items table JOIN with products table and orders table
		JOIN products p
			USING(product_id)
		JOIN orders o
			USING(order_id)
	WHERE product_id = 1
	GROUP BY o.order_id, o_item.product_id
	ORDER BY o_item.product_id
)
-- Main query
SELECT 
	CONCAT(first_name, last_name) AS 'name', 
	CONCAT(line1, line2, city, state, zip_code) AS 'address',
    o.order_id, total_price, ship_date
FROM orders o
	JOIN total t
		USING(order_id)
	JOIN customers c
		USING (customer_id)
	JOIN addresses a
		USING (customer_id)
GROUP BY o.order_id, total_price, ship_date
ORDER BY o.order_id;

-- DELETE statement on products_copy table for the product 'Fender Stratocaster'
SELECT * FROM products_copy;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM products_copy
WHERE product_name = 'Fender Stratocaster';
SELECT * FROM products_copy;

-- DELETE statement on order_items table when product_id = 1
SELECT * FROM order_items;
DELETE FROM order_items
WHERE product_id = 1;
SELECT * FROM order_items;

-- DELETE statement on order_items table when order_id = 9
SELECT * FROM orders;
DELETE FROM orders
WHERE
    order_id = 9;
SELECT * FROM orders;