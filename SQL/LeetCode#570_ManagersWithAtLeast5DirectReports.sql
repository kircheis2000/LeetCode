--The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
--
--+------+----------+-----------+----------+
--|Id    |Name 	  |Department |ManagerId |
--+------+----------+-----------+----------+
--|101   |John 	  |A 	      |null      |
--|102   |Dan 	  |A 	      |101       |
--|103   |James 	  |A 	      |101       |
--|104   |Amy 	  |A 	      |101       |
--|105   |Anne 	  |A 	      |101       |
--|106   |Ron 	  |B 	      |101       |
--+------+----------+-----------+----------+
--Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:
--
--+-------+
--| Name  |
--+-------+
--| John  |
--+-------+
--Note:
--No one would report to himself.


select
ep1.Name
from
(select mng.ManagerID
from employee mng
group by mng.managerId
having (count mng.id) >= 5) slt
inner join employee ep1
on ep1.id = slt.id
;