/*Answer 1*/
-- Using recursive CTE to develop display the desired table.

-- Recursive CTE
WITH RECURSIVE management_cte AS(
	SELECT employee_id, CONCAT(first_name, ' ', last_name) AS employee_name,
	department_number, manager_id
	FROM employees
	WHERE manager_id IS NULL
UNION ALL
	SELECT e.employee_id, CONCAT(first_name, ' ', last_name),
    e.department_number, e.manager_id
    FROM employees e
		INNER JOIN management_cte mc
			ON mc.employee_id = e.manager_id
)
-- SELECT statement to display the required table
SELECT mc.employee_id, mc.employee_name AS manager_name,
department_name, CONCAT(first_name, ' ', last_name) AS employee_name
FROM management_cte mc
	LEFT JOIN departments
		USING(department_number)
	LEFT JOIN employees e
		ON mc.manager_id = e.employee_id;

/*Answer 2*/
-- System variable setting with following instructions to set variables
SET SQL_SAFE_UPDATES = 0;
SET GLOBAL maximum_connections = 60;
SET SESSION AUTOCOMMIT = 0;
SET SESSION AUTOCOMMIT = 1;
SET GLOBAL threshold = 10;
SET SESSION recursion_CTE = 300;
SHOW VARIABLES LIKE "SQL_SAFE_UPDATES";
SHOW VARIABLES LIKE "maximum_connections";
SHOW VARIABLES LIKE "AUTOCOMMIT";
SHOW VARIABLES LIKE "threshold";
SHOW VARIABLES LIKE "recursion_CTE";
SHOW VARIABLES;
SELECT @@GLOBAL.SQL_SAFE_UPDATES, @@GLOBAL.maximum_connections,
@@SESSION.AUTOCOMMIT, @@GLOBAL.threshold, @@SESSION.recursion_CTE;

/*Answer 3*/
-- Creates the following user with the passwords, then rename a specific user and change password.
CREATE USER IF NOT EXISTS falcon@localhost IDENTIFIED BY "cap" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS bucky_barnes@localhost IDENTIFIED BY "longing_rusted_seventeen" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS john_walker@localhost IDENTIFIED BY "battlestar" PASSWORD EXPIRE INTERVAL 60 DAY;
CREATE USER IF NOT EXISTS flag_smasher@localhost IDENTIFIED BY "Karli" PASSWORD EXPIRE INTERVAL 60 DAY;
RENAME USER falcon@localhost TO captain_america@localhost;
SET PASSWORD FOR captain_america@localhost = "redwing";
DROP USER IF EXISTS john_walker@localhost;