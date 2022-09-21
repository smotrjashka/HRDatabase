CREATE TABLE SALARY (
s_empl_id CHAR(6),
s_salary BIGINT,
primary key (s_empl_id)
);

CREATE TABLE JOBS (
j_job_id SERIAL,
j_job_title VARCHAR(25),
primary key (j_job_id)
);

CREATE TABLE LOCATION (
l_location_name VARCHAR(15),
l_location_key SERIAL,
primary key (l_location_name)
);

CREATE TABLE CITY (
c_city_k SERIAL,
c_city_name VARCHAR(35),
c_state_name CHAR(2),
primary key (c_city_k)
);

CREATE TABLE EDUCATION (
e_education_key SERIAL,
e_education_level VARCHAR(40),
primary key (e_education_key)
);

CREATE TABLE DEPARTMENT (
d_department_key SERIAL,
d_department_name VARCHAR(30),
d_mananger_key int4,
primary key (d_department_key)
);

CREATE TABLE EMPLOYEE (
e_employee_key SERIAL,
e_empl_name VARCHAR(50),
e_empl_email varchar(320),
e_job_title INT4,
e_department_key INT4,
e_location_id INT4,
e_address VARCHAR(350),
e_city_key INT4,
e_education_level INT4,
e_hire_date DATE,
e_start_date DATE,
e_end_date DATE,
primary key (e_employee_key)
);