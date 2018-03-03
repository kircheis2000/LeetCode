--Write a SQL query to find all numbers that appear at least three times consecutively.
--
--+----+-----+
--| Id | Num |
--+----+-----+
--| 1  |  1  |
--| 2  |  1  |
--| 3  |  1  |
--| 4  |  2  |
--| 5  |  1  |
--| 6  |  2  |
--| 7  |  2  |
--+----+-----+
--For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.
--
--+-----------------+
--| ConsecutiveNums |
--+-----------------+
--| 1               |
--+-----------------+


select
distinct log.num as ConsecutiveNums
from log base
inner join log plus1
on plus1.id = base.id + 1 and plus1.num = base.num
inner join log plus2
on plus2.id = base.id + 2 and plus2.num = base.num;