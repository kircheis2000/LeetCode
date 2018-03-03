--The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.
--
--+----+-------+--------+--------------+
--| Id | Name  | Salary | DepartmentId |
--+----+-------+--------+--------------+
--| 1  | Joe   | 70000  | 1            |
--| 2  | Henry | 80000  | 2            |
--| 3  | Sam   | 60000  | 2            |
--| 4  | Max   | 90000  | 1            |
--| 5  | Janet | 69000  | 1            |
--| 6  | Randy | 85000  | 1            |
--+----+-------+--------+--------------+
--The Department table holds all departments of the company.
--
--+----+----------+
--| Id | Name     |
--+----+----------+
--| 1  | IT       |
--| 2  | Sales    |
--+----+----------+
--Write a SQL query to find employees who earn the top three salaries in each of the department.
--For the above tables, your SQL query should return the following rows.
--
--+------------+----------+--------+
--| Department | Employee | Salary |
--+------------+----------+--------+
--| IT         | Max      | 90000  |
--| IT         | Randy    | 85000  |
--| IT         | Joe      | 70000  |
--| Sales      | Henry    | 80000  |
--| Sales      | Sam      | 60000  |
--+------------+----------+--------+

select
dpt.Name as Department
, emp.Name as Employee
, emp.Salary as Salary

from
(select ep1.id
 from employee ep1
 inner join employee ep2
 on ep1.Salary <= ep2.Salary and ep1.DepartmentId = ep2.DepartmentId
 group by e1.id
 having count(distinct ep2.salary) <= 3
 ) slt
inner join employee emp
on emp.id = slt.id
left join departments dpt
on dpt.id = employee.DepartmentId and rank <= 3