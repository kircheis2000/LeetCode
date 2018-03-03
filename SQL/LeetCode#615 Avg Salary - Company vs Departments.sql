# Given two tables as below, write a query to display the comparison result (higher/lower/same) of the average salary of
# employees in a department to the company's average salary.
# Table: salary
# | id | employee_id | amount | pay_date   |
# |----|-------------|--------|------------|
# | 1  | 1           | 9000   | 2017-03-31 |
# | 2  | 2           | 6000   | 2017-03-31 |
# | 3  | 3           | 10000  | 2017-03-31 |
# | 4  | 1           | 7000   | 2017-02-28 |
# | 5  | 2           | 6000   | 2017-02-28 |
# | 6  | 3           | 8000   | 2017-02-28 |
# The employee_id column refers to the employee_id in the following table employee.
# | employee_id | department_id |
# |-------------|---------------|
# | 1           | 1             |
# | 2           | 2             |
# | 3           | 2             |
# So for the sample data above, the result is:
# | pay_month | department_id | comparison  |
# |-----------|---------------|-------------|
# | 2017-03   | 1             | higher      |
# | 2017-03   | 2             | lower       |
# | 2017-02   | 1             | same        |
# | 2017-02   | 2             | same        |
# Explanation
# In March, the company's average salary is (9000+6000+10000)/3 = 8333.33...
# The average salary for department '1' is 9000, which is the salary of employee_id '1' since there is only
# one employee in this department. So the comparison result is 'higher' since 9000 > 8333.33 obviously.
# The average salary of department '2' is (6000 + 10000)/2 = 8000, which is the average of employee_id '2' and '3'.
# So the comparison result is 'lower' since 8000 < 8333.33.
# With he same formula for the average salary comparison in February, the result is 'same' since both
# the department '1' and '2' have the same average salary with the company, which is 7000.

select
dept.pay_month
, dept.department_id
, case when dept.dept_amount > comp.company_avg then "higher"
        when dept.dept_amount = comp.company_avg then "same"
        when dept.dept_amount < comp.company_avg then "lower"
    end as comparison
from
(select
    emp.department_id
    , date_format(pay_date,"%Y-%m") as pay_month
    , avg(amount) as dept_amount
 from salary s
    left join employee emp
    on s.employee_id = emp.employee_id
    group by emp.department_id, date_format(pay_date,"%Y-%m") as pay_month) dept
left join
(select date_format(pay_date,"%Y-%m") as pay_month
        , avg(amount) as company_avg
        from salary s
        group by date_format(pay_date,"%Y-%m") as pay_month) comp
on dept.pay_month = comp.pay_month