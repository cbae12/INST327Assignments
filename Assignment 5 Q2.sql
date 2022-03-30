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