SELECT EMPLOYEE.e_empl_name, POSITION.e_job_title , DEPARTMENT.d_department_name
FROM EMPLOYEE LEFT JOIN POSITION
ON POSITION.e_employee_key = EMPLOYEE.e_employee_key
LEFT JOIN DEPARTMENT
ON DEPARTMENT.d_department_key = POSITION.e_department_key
WHERE POSITION.e_end_date IS NULL;

