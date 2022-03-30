/*Answer 1*/

USE ap;
SELECT CONCAT(vendor_name) AS 'Vendor', CONCAT('Phone #: ',vendor_phone) AS 'Phone Number', vendor_city,
CONCAT(vendor_address1) AS 'Address'
  FROM vendors
WHERE vendor_state = 'CA'
ORDER BY vendor_city;

/*Answer 2*/

USE om;
	SELECT order_date, shipped_date, customer_state, customer_address, 
		CONCAT(customer_first_name, ' ', customer_last_name) AS customer_full_name 
	FROM customers c JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE shipped_date IS NOT NULL
UNION
	SELECT order_date, 'Not Yet Shipped' AS shipped_date, customer_state, customer_address, 
		CONCAT(customer_first_name, ' ', customer_last_name) AS customer_full_name
	FROM customers c JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE shipped_date IS NULL
ORDER BY order_date DESC, customer_state DESC;

/*Answer 3*/
USE ap;
    SELECT DISTINCT invoice_number, invoice_total, vendor_name, 
    CONCAT(first_name, ' ', last_name) AS vendor_contact_name , vendor_phone, vendor_address1
    FROM vendors v
    LEFT JOIN vendor_contacts vc
		ON vc.vendor_id = v.vendor_id
    LEFT JOIN invoices i
		ON v.vendor_id = i.vendor_id
	WHERE invoice_total IS NOT NULL OR v.vendor_id = vc.vendor_id
UNION
	SELECT DISTINCT invoice_number, invoice_total, vendor_name, NULL, vendor_phone, vendor_address1
    FROM vendors v
    LEFT JOIN vendor_contacts vc
		ON vc.vendor_id = v.vendor_id
    LEFT JOIN invoices i
		ON v.vendor_id = i.vendor_id
	WHERE invoice_total IS NULL
ORDER BY vendor_name;

/*Answer 4*/
USE ap;
SELECT * FROM invoices;
SELECT * FROM vendors;
	SELECT vendor_name, CONCAT(vendor_city, ', ', vendor_state) AS 'vendor_city/state',
	invoice_number, payment_total, invoice_date, invoice_due_date
    FROM invoices i JOIN vendors v
        ON i.vendor_id = v.vendor_id
    WHERE MONTH(invoice_due_date) = 6
ORDER BY DAY(invoice_due_date), invoice_number, MONTH(invoice_date);
