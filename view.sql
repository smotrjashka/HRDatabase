CREATE VIEW initial_exel AS 
SELECT A.e_employee_key, A.e_empl_name, A.e_empl_email, A.e_hire_date, 
A.s_salary, A.d_department_name, EMPLOYEE.e_empl_name, A.e_start_date,
A.e_end_date, A.l_location_name, A.e_address, CITY.c_city_name, CITY.c_state_name, EDUCATION.e_education_level
FROM
(SELECT EMPLOYEE.e_employee_key, EMPLOYEE.e_empl_name, EMPLOYEE.e_empl_email, EMPLOYEE.e_hire_date, 
SALARY.s_salary, DEPARTMENT.d_department_name, POSITION.d_mananger_key, POSITION.e_start_date,
POSITION.e_end_date, LOCATION.l_location_name, EMPLOYEE.e_address, EMPLOYEE.e_city_key, EMPLOYEE.e_education_level
FROM POSITION
LEFT JOIN EMPLOYEE ON POSITION.e_employee_key=EMPLOYE.e_employee_key
JOIN SALARY ON POSITION.p_job_position_id=SALARY.s_job_id
JOIN DEPARTMENT ON DEPARTMENT.d_department_key=POSITION.e_department_key
JOIN LOCATION ON POSITION.e_location_id=LOCATION.l_location_key) A
JOIN EMPLOYEE ON A.d_mananger_key=EMPLOYEE.e_employee_key
JOIN CITY ON EMPLOYEE.e_city_key=CITY.c_city_k
JOIN EDUCATION ON EMPLOYEE.e_education_level=EDUCATION.e_education_key;
