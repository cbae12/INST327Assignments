/*Answer 1*/
USE ap;
DROP VIEW IF EXISTS late_invoices;
CREATE VIEW late_invoices AS
	SELECT invoice_id, vendor_name, invoice_number, 
    DATE_FORMAT(invoice_due_date, "%M %D") AS invoice_due_date, 
    DATE_FORMAT(payment_date, "%M %D") AS payment_date,
    DATEDIFF(payment_date, invoice_due_date) AS 'days_late',
    CONCAT('$', invoice_total) AS invoice_total
    FROM invoices
		JOIN vendors
			USING (vendor_id)
	WHERE payment_date > invoice_due_date OR
    payment_date IS NULL
	ORDER BY invoice_total;
SELECT * FROM late_invoices;
