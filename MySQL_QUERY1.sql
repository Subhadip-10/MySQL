
select * from department;

-- get name, mail of the employees whose department id is 1000

select ename, email from  employee where dept_id in(select dept_id from department where dept_id  = 1000);

select e.ename, e.email from employee e, department d where e.eid = d.eid and e.dept_id = 1000;

-- get name, salary, Manager_id of the employees whose salary is greater than average salary.

select ename, salary, Manager_id from employee where salary > (select AVG(salary) from employee);

-- get the third highest salary from the employees.

select ename, salary from employee order by salary desc limit 2,1;

-- get the employee name whose salary is greater than their managers.

select e.ename, e.salary from employee e where salary > (select c.salary from employee c where c.eid = e.Manager_id);

-- get the total number of employees per project.

select count(eid), pid from project GROUP BY pid;

-- get the total number of employees per project and maximum salary and name of each department.

select count(e.eid), p.pid, e.ename, max(e.salary) from employee e, project p 
where e.eid = p.eid GROUP BY pid;

-- get the employees whose name is same but salary is different.

select e.ename, c.salary from employee e, employee c 
where e.ename = c.ename && e.salary != c.salary;

-- get the names of the employees who are not currently in a project.

select e.ename from employee e, project p where e.eid = p.eid and p.pid is null;

