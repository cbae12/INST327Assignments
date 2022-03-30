-- Q2 Solved
-- Partial script for the stored procedure 'owed_to_state_vendors'

-- HINT: This stored procedure is built around a CTE and SELECT query.
-- You may also build a (correalated) subquery along with the CTE 
-- and SELECT query if this makes writing the procedure easier. 
-- You may want to first build the query, and then plug it into the code below.
-- See the hints below, right after the BEGIN line, for help with the CTE and SELECT query.

USE ap;

DROP PROCEDURE IF EXISTS owed_to_state_vendors;

DELIMITER //
CREATE PROCEDURE owed_to_state_vendors (
	vendor_state_param VARCHAR(50)
	)
-- --> The CREATE statement goes here. Remember to add the parameter 
-- --- (in parentheses); its data type should be VARCHAR(50)

BEGIN
	WITH states AS(
		SELECT vendor_name, vendor_state, SUM(invoice_total - payment_total - credit_total) AS total_invoice
		FROM vendors
			JOIN invoices
				USING (vendor_id)
		HAVING total_invoice > 0
    )
    SELECT vendor_state, vendor_name, total_invoice
    FROM states
    WHERE vendor_state = vendor_state_param
    HAVING total_invoice = MAX(total_invoice);
-- --> For the CTE:
-- --> You need to add a SELECT query here to retrieve the vendor_names 
-- --- from the given state and the total amount owed to each of them.
-- --- Make sure to also include the vendor_state here as well 
-- --- In the query, you will need to JOIN two tables,
-- --- and you will need to aggregate the total invoice amounts for each vendor, 
-- --- and you will need a filtering condition that will keep only the vendors 
-- --- whose invoice totals are greater than zero.
-- --- You may want order the result set in the CTE as well
-- --- Note that you can use the GROUP BY, HAVING and ORDER BY clauses in the CTE

-- --> For the main/outer query: 
-- --> You need the vendor_state, vendor_name, and the total amount owed
-- --- from the CTE, and need to find the highest total amount owed per state.
-- --- You will need a filtering condition that will keep only the vendors 
-- --- from the given state, which was passed as the parameter value.
-- --- Make sure to aggregate/group your output/rows depending on your implementation.
END //

DELIMITER ;

-- --> TEST YOUR CODE:
-- --- Run this statement: CALL owed_to_state_vendors('CA');
-- --- Do you see the row with the following values?
-- --- 
-- --- 'CA', 'Ford Motor Credit Company', '503.20'
-- --- 
-- --- If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.
CALL owed_to_state_vendors('CA');

