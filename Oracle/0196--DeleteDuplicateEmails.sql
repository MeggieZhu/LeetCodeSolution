/*
196. Delete Duplicate Emails
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.

For example, after running your query, the above Person table should have the following rows:
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

Note:
Your output is the whole Person table after executing your sql. Use delete statement.
*/

#solution1
DELETE A FROM PERSON A, PERSON B
WHERE A.EMAIL = B.EMAIL
  AND A.ID > B.ID

#solution2
DELETE FROM PERSON
WHERE ID IN(
    SELECT ID FROM (
        SELECT ID, ROW_NUMBER() OVER(PARTITION BY EMAIL ORDER BY ID) ROWNUMBER
        FROM PERSON
    ) A
    WHERE A.ROWNUMBER > 1
)
