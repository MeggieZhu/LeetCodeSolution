/*
185. Department Top Three Salaries
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+

The Department table holds all departments of the company.
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+

Explanation:
In IT department, Max earns the highest salary, both Randy and Joe earn the second highest salary, and Will earns the third highest salary. There are only two employees in the Sales department, Henry earns the highest salary while Sam earns the second highest salary.
*/

SELECT B.NAME AS DEPARTMENT, A.NAME AS EMPLOYEE, A.SALARY AS SALARY
FROM (
    SELECT NAME, DEPARTMENTID, SALARY, ROW_NUMBER() OVER(PARTITION BY DEPARTMENTID ORDER BY SALARY) AS RANKNO
    FROM EMPLOYEE
    GROUP BY DEPARTMENTID, SALARY, NAME
    ORDER BY DEPARTMENTID, SALARY DESC
) A
INNER JOIN DEPARTMENT B
ON A.DEPARTMENTID = B.ID
WHERE A.RANKNO < 4
ORDER BY A.DEPARTMENTID, A.SALARY DESC, A.NAME
