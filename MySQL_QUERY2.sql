
-- get the latest hired employees from each department.

select e.ename, e.join_date, e.dept_id from employee e where join_date in  
(select max(c.join_date) from employee c where e.dept_id = c.dept_id)
order by join_date desc;

-- get average salary of each department where count of employees > 3.

select e.ename, e.salary, d.dept_id from employee e, department d WHERE
e.eid = d.eid GROUP BY dept_id having count(e.eid) > 3;


select * from employee ORDER BY ename;

-- get the employees who are also managers.

select distinct e.eid, e.ename from employee e inner join employee h on 
e.eid = h.Manager_id;