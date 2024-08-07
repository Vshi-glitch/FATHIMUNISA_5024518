CREATE OR REPLACE PACKAGE EmployeeManagement IS
   PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2);
   PROCEDURE UpdateEmployeeDetails(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2);
   FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement IS
   PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2) IS
   BEGIN
      INSERT INTO employees (employee_id, name, position, salary, department, hiredate)
      VALUES (p_employee_id, p_name, p_position, p_salary, p_department, SYSDATE);
   END HireEmployee;
   
   PROCEDURE UpdateEmployeeDetails(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2) IS
   BEGIN
      UPDATE employees
      SET name = p_name, position = p_position, salary = p_salary, department = p_department
      WHERE employee_id = p_employee_id;
   END UpdateEmployeeDetails;
   
   FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER IS
      v_annual_salary NUMBER;
   BEGIN
      SELECT salary * 12 INTO v_annual_salary FROM employees WHERE employee_id = p_employee_id;
      RETURN v_annual_salary;
   END CalculateAnnualSalary;
END EmployeeManagement;
/
