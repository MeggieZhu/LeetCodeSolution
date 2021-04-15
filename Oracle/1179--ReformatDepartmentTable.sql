/*
1179. Reformat Department Table
Table: Department
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| revenue       | int     |
| month         | varchar |
+---------------+---------+
(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

The query result format is in the following example:
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Result table:
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Note that the result table has 13 columns (1 for the department id + 12 for the months).
*/

#solution1 decode
SELECT ID,
    MAX(DECODE(MONTH, 'Jan', REVENUE)) AS JAN_REVENUE,
    MAX(DECODE(MONTH, 'Feb', REVENUE)) AS FEB_REVENUE,
    MAX(DECODE(MONTH, 'Mar', REVENUE)) AS MAR_REVENUE,
    MAX(DECODE(MONTH, 'Apr', REVENUE)) AS APR_REVENUE,
    MAX(DECODE(MONTH, 'May', REVENUE)) AS MAY_REVENUE,
    MAX(DECODE(MONTH, 'Jun', REVENUE)) AS JUN_REVENUE,
    MAX(DECODE(MONTH, 'Jul', REVENUE)) AS JUL_REVENUE,
    MAX(DECODE(MONTH, 'Aug', REVENUE)) AS AUG_REVENUE,
    MAX(DECODE(MONTH, 'Sep', REVENUE)) AS SEP_REVENUE,
    MAX(DECODE(MONTH, 'Oct', REVENUE)) AS OCT_REVENUE,
    MAX(DECODE(MONTH, 'Nov', REVENUE)) AS NOV_REVENUE,
    MAX(DECODE(MONTH, 'Dec', REVENUE)) AS DEC_REVENUE
FROM DEPARTMENT
GROUP BY ID

#solution2 case when
SELECT ID,
    MAX(CASE WHEN MONTH = 'Jan' THEN REVENUE END) AS JAN_REVENUE,
    MAX(CASE WHEN MONTH = 'Feb' THEN REVENUE END) AS FEB_REVENUE,
    MAX(CASE WHEN MONTH = 'Mar' THEN REVENUE END) AS MAR_REVENUE,
    MAX(CASE WHEN MONTH = 'Apr' THEN REVENUE END) AS APR_REVENUE,
    MAX(CASE WHEN MONTH = 'May' THEN REVENUE END) AS MAY_REVENUE,
    MAX(CASE WHEN MONTH = 'Jun' THEN REVENUE END) AS JUN_REVENUE,
    MAX(CASE WHEN MONTH = 'Jul' THEN REVENUE END) AS JUL_REVENUE,
    MAX(CASE WHEN MONTH = 'Aug' THEN REVENUE END) AS AUG_REVENUE,
    MAX(CASE WHEN MONTH = 'Sep' THEN REVENUE END) AS SEP_REVENUE,
    MAX(CASE WHEN MONTH = 'Oct' THEN REVENUE END) AS OCT_REVENUE,
    MAX(CASE WHEN MONTH = 'Nov' THEN REVENUE END) AS NOV_REVENUE,
    MAX(CASE WHEN MONTH = 'Dec' THEN REVENUE END) AS DEC_REVENUE
FROM DEPARTMENT
GROUP BY ID

#solution3 pivot
SELECT * FROM DEPARTMENT
    PIVOT(SUM(REVENUE) FOR MONTH IN(
        'Jan' AS JAN_REVENUE,
        'Feb' AS FEB_REVENUE,
        'Mar' AS MAR_REVENUE,
        'Apr' AS APR_REVENUE,
        'May' AS MAY_REVENUE,
        'Jun' AS JUN_REVENUE,
        'Jul' AS JUL_REVENUE,
        'Aug' AS AUG_REVENUE,
        'Sep' AS SEP_REVENUE,
        'Oct' AS OCT_REVENUE,
        'Nov' AS NOV_REVENUE,
        'Dec' AS DEC_REVENUE)
        )
