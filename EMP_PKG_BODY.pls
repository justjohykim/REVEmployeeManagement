create or replace PACKAGE BODY EMP_PKG AS


/*
Body of Add employee procedure
hire date is a local variable assigned the value SYSDATE 
which is required to add an employee to the table
Email has to be unique
*/
Procedure ADD_EMP(
    p_fname IN employees.first_name%TYPE,
    p_lname IN employees.last_name%TYPE,
    p_email IN employees.email%TYPE,
    p_jobid IN employees.job_id%TYPE
    ) IS
    p_hiredate DATE;
    var_rows NUMBER;
BEGIN
    p_hiredate := SYSDATE;
    INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id)
    VALUES (employees_seq.nextval, p_fname, p_lname, p_email, p_hiredate, p_jobid);
    var_rows := SQL%ROWCOUNT;
    dbms_output.put_line(var_rows || ' row was added');
    dbms_output.put_line('Your id is: ' || employees_seq.currval);
--To get some feedback to the user if a row was added, the procedure prints
--out that a row was added to the table
    Exception
    WHEN dup_val_on_index THEN
    dbms_output.put_line('This email is taken');
    WHEN value_error THEN
    DBMS_Output.put_line('Wrong value type was added');
    WHEN others THEN
    dbms_output.put_line('An error has occured');
  END ADD_EMP;

Procedure UP_EMPLOYEE(
    p_id IN employees.employee_id%TYPE,
    p_dept IN employees.department_id%TYPE,
    p_jobid IN employees.job_id%TYPE) AS
    var_rows NUMBER;
    BEGIN
        Update employees
        SET department_id = p_dept, job_id = p_jobid
        WHERE employee_id = p_id;
        
       --To give feedback to the user, either "0 or 1 row(s) were updated"
       --should be displayed to the user
        var_rows := SQL%ROWCOUNT;
        dbms_output.put_line(var_rows || ' row(s) was/were updated');
        
        
    Exception
    WHEN no_data_found THEN
    dbms_output.put_line('No employee with this id is found');
    WHEN value_error THEN
    DBMS_Output.put_line('Wrong value type was added');
    WHEN others THEN
    dbms_output.put_line('An error has occured');
  END UP_EMPLOYEE;

  procedure DEL_EMPLOYEE(
    p_id IN employees.employee_id%TYPE) AS
    var_rows NUMBER;
    BEGIN
        Delete From employees 
        WHERE employee_id = p_id;
        var_rows := SQL%ROWCOUNT;
        dbms_output.put_line(var_rows || ' row(s) was/were deleted');
       --To give feedback to the user, either "0 or 1 row(s) were deleted"
       --should be displayed to the user
    Exception

    WHEN no_data_found THEN
    dbms_output.put_line('No employee with this id is found');
    WHEN value_error THEN
    DBMS_Output.put_line('Wrong value type was added');
    WHEN others THEN
    dbms_output.put_line('An error has occured');
  END DEL_EMPLOYEE;
  



END EMP_PKG;