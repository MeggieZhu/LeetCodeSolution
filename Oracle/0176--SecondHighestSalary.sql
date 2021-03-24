/*176. Second Highest Salary
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. 
If there is no second highest salary, then the query should return null.
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/

#null and '' is a difficult point, so it must be added select ... from dual
select (
	select salary
	from (
		select Salary, rownum as no
		from(
			select Salary
			from Employee
			group by Salary
            order by Salary desc
			)
		)
	where no = 2
) as SecondHighestSalary
from dual

#another solution
select max(Salary) as SecondHighestSalary
from Employee
where salary != (Select max(Salary) from Employee)
