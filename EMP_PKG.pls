create or replace PACKAGE EMP_PKG AS 


  /*Procedure to add new employee
  Employee id, last name, email, job id and hire data are 
  required to add a new employee.
  */
Procedure ADD_EMP(
    p_fname IN employees.first_name%TYPE,
    p_lname IN employees.last_name%TYPE,
    p_email IN employees.email%TYPE,   
    p_jobid IN employees.job_id%TYPE
    );

/*Procedure to update employee information
Employee id is required to update department id and 
job id
*/
Procedure UP_EMPLOYEE(
    p_id IN employees.employee_id%TYPE,
    p_dept IN employees.department_id%TYPE,
    p_jobid IN employees.job_id%TYPE);

/* Procedure to delete employee
Employee Id is required to delete the employee
*/
Procedure DEL_EMPLOYEE(
    p_id IN employees.employee_id%TYPE);





END EMP_PKG;