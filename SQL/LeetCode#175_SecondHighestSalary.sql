--Write a SQL query to get the second highest salary from the Employee table.
--
--+----+--------+
--| Id | Salary |
--+----+--------+
--| 1  | 100    |
--| 2  | 200    |
--| 3  | 300    |
--+----+--------+
--For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.
--
--+---------------------+
--| SecondHighestSalary |
--+---------------------+
--| 200                 |
--+---------------------+

-- SQL Under Oracle/ Hive
-- Option 1
select
case when emp.id is not null then max(salary) end as SecondHighestSalary
from
(select * from Employee) emp
where salary not in (select max(salary) as max_salary as max_salary) max_salary
;

-- Option 2:
-- offset n: The general syntax to exclude first n records
select
(select distinct salary
from Employee
order by salary desc
limit 1 offset 1) as SecondHighestSalary
;