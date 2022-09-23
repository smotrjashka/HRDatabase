SELECT EMPLOYEE.e_empl_name, POSITION.e_job_title , DEPARTMENT.d_department_name
FROM EMPLOYEE LEFT JOIN POSITION
ON POSITION.e_employee_key = EMPLOYEE.e_employee_key
LEFT JOIN DEPARTMENT
ON DEPARTMENT.d_department_key = POSITION.e_department_key
WHERE POSITION.e_end_date IS NULL;

INSERT INTO JOBS (j_job_title) VALUES ('Web Programmer');

UPDATE JOBS SET j_job_title='Web Developer' WHERE j_job_title='Web Programmer';

DELETE FROM JOBS WHERE j_job_title='Web Developer';


SELECT A.EMPL_NUMBER, DEPARTMENT.d_department_name
FROM (SELECT COUNT(POSITION.e_department_key) AS EMPL_NUMBER, POSITION.e_department_key AS DEP_K
      FROM POSITION WHERE POSITION.e_end_date IS NULL 
      GROUP BY e_department_key) A
JOIN DEPARTMENT ON DEPARTMENT.d_department_key = A.DEP_K;

SELECT B.e_empl_name, JOBS.j_job_title, DEPARTMENT.d_department_name, EMPLOYEE.e_empl_name, B.e_start_date, B.e_end_date
FROM
(SELECT A.e_empl_name, POSITION.e_job_title, POSITION.e_department_key, 
 POSITION.d_mananger_key, POSITION.e_start_date, POSITION.e_end_date
(SELECT e_employee_key, e_empl_name 
FROM EMPLOYEE WHERE e_empl_name='Toni Lembeck') A
JOIN LEFT POSITION
ON POSITION.e_employee_key=A.e_employee_key) B
LEFT JOIN EMPLOYEE
ON B.d_mananger_key=EMPLOYEE.e_employee_key
LEFT JOIN  DEPARTMENT
ON  DEPARTMENT.d_department_key=B.e_department_key
JOIN LEFT JOBS
ON JOBS.j_job_id=B.e_job_title;
