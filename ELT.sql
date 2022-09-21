INSERT INTO LOCATION (SELECT DISTINCT location FROM proj_stg);

INSERT INTO CITY (c_city_name, c_state_name) (SELECT DISTINCT city, state FROM proj_stg);

INSERT INTO EDUCATION (e_education_level) (SELECT DISTINCT education_lvl FROM proj_stg);

INSERT INTO DEPARTMENT (SELECT DISTINCT department_nm, manager FROM proj_stg);

INSERT INTO JOBS (SELECT DISTINCT job_title FROM proj_stg);

INSERT INTO SALARY (SELECT Emp_ID, salary FROM proj_stg);

INSERT INTO EMPLOYEE (SELECT proj_stg.Emp_ID, proj_stg.Emp_NM, proj_stg.Email, 
JOBS.j_job_title, proj_stg.department_nm  FROM proj_stg JOIN JOBS ON proj_stg.job_title=JOBS.j_job_title JOIN DEPARTMENT.d_department_name=proj_stg.department_nm);


