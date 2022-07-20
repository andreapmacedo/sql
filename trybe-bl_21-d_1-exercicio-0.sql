-- employees do banco de dados hr
SELECT * FROM hr.employees;

-- 1 - Escreva uma query que exiba o maior salário da tabela.
SELECT MAX(salary) FROM hr.employees;

-- Escreva uma query que exiba a diferença entre o maior e o menor salário.
SELECT MAX(salary) - MIN(salary) FROM hr.employees;

-- Escreva uma query que exiba a média salarial de cada job_id, ordenando pela média salarial em ordem decrescente.
SELECT job_id, AVG(salary) as average_salary
	FROM hr.employees
	GROUP BY job_id
	ORDER BY average_salary DESC;

-- Escreva uma query que exiba a quantidade de dinheiro necessária para realizar o pagamento de todas as pessoas funcionárias.
SELECT SUM(salary)
	FROM hr.employees;

-- Escreva uma query que exiba quatro informações: o maior salário, o menor salário, a soma de todos os salários e a média dos salários. Todos os valores devem ser formatados para ter apenas duas casas decimais.
SELECT ROUND(MAX(salary),2), ROUND(MIN(salary),2), ROUND(AVG(salary),2), ROUND(SUM(salary),2) FROM hr.employees;

-- Escreva uma query que exiba a quantidade de pessoas que trabalham como pessoas programadoras (it_prog).
SELECT job_id, COUNT(job_id) from hr.employees
	GROUP BY job_id
	HAVING job_id = 'it_prog';

-- Escreva uma query que exiba a quantidade de dinheiro necessária para efetuar o pagamento de cada profissão (job_id).
SELECT job_id, SUM(salary) from hr.employees
	GROUP BY job_id;

-- Utilizando a query anterior, faça as alterações para que seja exibido somente a quantidade de dinheiro necessária para cobrir a folha de pagamento das pessoas programadoras (it_prog).
SELECT job_id, SUM(salary) from hr.employees
	GROUP BY job_id
	HAVING job_id = 'it_prog';

-- Escreva uma query que exiba em ordem decrescente a média salarial de todos os cargos, exceto das pessoas programadoras (it_prog).
SELECT job_id, AVG(salary) from hr.employees
	GROUP BY job_id
	HAVING job_id <> 'it_prog'
	ORDER BY AVG(salary) DESC;

-- Escreva um query que exiba média salarial e o número de funcionários de todos os departamentos com mais de dez funcionários. Dica: agrupe pelo department_id.
SELECT department_id, AVG(salary), COUNT(employee_id) FROM hr.employees
GROUP BY department_id
HAVING COUNT(employee_id) > 10;

-- Escreva uma query que atualize a coluna phone_number, de modo que todos os telefones iniciados por 515 agora devem iniciar com 777.
UPDATE hr.employees
	SET phone_number = REPLACE(phone_number, '515', '777')
	WHERE phone_number LIKE '515%';

-- Escreva uma query que só exiba as informações dos funcionários cujo o primeiro nome tenha oito ou mais caracteres.
SELECT first_name FROM hr.employees
	WHERE CHAR_LENGTH(first_name) >= 8;

-- Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e ano no qual foi contratado (exiba somente o ano).
SELECT employee_id, first_name, YEAR(hire_date)
	FROM hr.employees;

-- Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e dia do mês no qual foi contratado (exiba somente o dia).
SELECT employee_id, first_name, DAY(hire_date)
	FROM hr.employees;

-- Escreva uma query que exiba as seguintes informações de cada funcionário: id, primeiro nome e mês no qual foi contratado (exiba somente o mês).
SELECT employee_id, first_name, MONTH(hire_date)
	FROM hr.employees;

-- Escreva uma query que exiba os nomes dos funcionários em letra maiúscula.
SELECT CONCAT(UCASE(first_name), ' ', UCASE(last_name)) AS full_name
	FROM hr.employees;

-- Escreva uma query que exiba o sobrenome e a data de contratação de todos os funcionário contratados em julho de 1987.
SELECT last_name, hire_date
	FROM hr.employees
	WHERE YEAR(hire_date) = 1987 AND MONTH(hire_date) = 7;

-- Escreva uma query que exiba as seguintes informações de cada funcionário: nome, sobrenome, tempo que trabalha na empresa (em dias).
SELECT first_name, last_name, DATEDIFF(CURRENT_DATE(), hire_date) AS 'days_worked'
	FROM hr.employees;