# A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
# | name   | continent |
# |--------|-----------|
# | Jack   | America   |
# | Pascal | Europe    |
# | Xi     | Asia      |
# | Jane   | America   |
# Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent.
# The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than
# either Asia or Europe.
# For the sample input, the output is:
# | America | Asia | Europe |
# |---------|------|--------|
# | Jack    | Xi   | Pascal |
# | Jane    |      |        |
# Follow-up: If it is unknown which continent has the most students, can you write a query to generate the student report?



select
America,
Asia,
Europe
from
(select name as America, row_number() over (parition by continent order by name) as rn from student where continent = 'America') amc
,(select name as Asia, row_number() over (parition by continent order by name) as rn from student where continent = 'Asia') asia
, (select name as Europe, row_number() over (partition by continent order by name) as rn from student where continent = "Europe") eu
where amc.rn = asia.rn and amc.rn = eu.rn
;