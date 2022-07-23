SELECT * FROM hr.employees;

SELECT
    CONCAT(Employee.first_name, " ", Employee.last_name) AS "Nome da Pessoa Colaboradora",
    CONCAT(Manager.first_name, " ", Manager.last_name) AS "Nome Gerente"
FROM
	employees AS Employee
INNER JOIN
	employees AS Manager ON Employee.manager_id = Manager.employee_id;
    
SELECT * FROM hr.employees
WHERE manager_id = employee_id;    