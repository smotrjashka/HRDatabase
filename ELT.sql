INSERT INTO LOCATION (SELECT DISTINCT location FROM proj_stg);

INSERT INTO CITY (c_city_name, c_state_name) (SELECT DISTINCT city, state FROM proj_stg);

INSERT INTO EDUCATION (e_education_level) (SELECT DISTINCT education_lvl FROM proj_stg);

INSERT INTO JOBS (j_job_title) (SELECT DISTINCT job_title FROM proj_stg);


INSERT INTO DEPARTMENT (d_department_name, d_mananger_key) (SELECT A.department_nm, proj_stg.Emp_ID FROM 
                                                           (SELECT DISTINCT department_nm, manager FROM proj_stg) A 
                                                            FULL OUTER JOIN proj_stg ON proj_stg.Emp_NM = A.manager
                                                            );

INSERT INTO EMPLOYEE (SELECT proj_stg.Emp_ID, proj_stg.Emp_NM, proj_stg.Email, 
proj_stg.address, CITY.c_city_k, EDUCATION.e_education_key, proj_stg.hire_dt
                      FROM proj_stg 
                      JOIN CITY ON (CITY.c_city_name=proj_stg.city AND CITY.c_state_name=proj_stg.state)
                      JOIN EDUCATION ON EDUCATION.e_education_level=proj_stg.education_lvl
                     ) on conflict (e_employee_key) do nothing;


INSERT INTO POSITION (e_employee_key, e_job_title, e_department_key, e_location_id, e_start_date, e_end_date, d_mananger_key)
(SELECT proj_stg.Emp_ID, JOBS.j_job_id, DEPARTMENT.d_department_key, LOCATION.l_location_key, proj_stg.start_dt, proj_stg.end_dt
                      FROM proj_stg JOIN JOBS ON proj_stg.job_title=JOBS.j_job_title
                      JOIN DEPARTMENT ON DEPARTMENT.d_department_name=proj_stg.department_nm 
                      JOIN LOCATION ON LOCATION.l_location_name=proj_stg.location
                      LEFT JOIN EMPOLYEE ON proj_stg.manager=EMPLOYEE.e_empl_name
                     );
                     
                     
INSERT INTO SALARY (SELECT POSITION.p_job_position_id, A.salary (SELECT proj_stg.Emp_ID, JOBS.j_job_id, proj_stg.salary 
                    FROM proj_stg JOIN JOBS ON proj_stg.job_title = JOBS.j_job_title) A JOIN POSITION
                    ON POSITION.e_employee_key=A.Emp_ID AND POSITION.e_job_title=A.j_job_id
                   );
