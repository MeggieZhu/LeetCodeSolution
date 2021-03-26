/*
178. Rank Scores
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

For example, given the above Scores table, your query should generate the following report (order by highest score):
+-------+---------+
| score | Rank    |
+-------+---------+
| 4.00  | 1       |
| 4.00  | 1       |
| 3.85  | 2       |
| 3.65  | 3       |
| 3.65  | 3       |
| 3.50  | 4       |
+-------+---------+
Important Note: For MySQL solutions, to escape reserved words used as column names, you can use an apostrophe before and after the keyword. For example `Rank`.
*/

/* Write your PL/SQL query statement below */

#solution1. calculating the rank first, and then connect the table
SELECT A.SCORE, B.RANK
FROM SCORES A
LEFT JOIN (
	SELECT SCORE, ROWNUM AS RANK
	FROM (
		SELECT DISTINCT SCORE
		FROM SCORES
		ORDER BY SCORE DESC
		)
) B
ON A.SCORE = B.SCORE
ORDER BY RANK



#solution2
SELECT A.SCORE AS SCORE, (SELECT COUNT(DISTINCT B.SCORE) FROM SCORES B WHERE B.SCORE >= A.SCORE) AS RANK
FROM SCORES A
ORDER BY A.SCORE DESC
