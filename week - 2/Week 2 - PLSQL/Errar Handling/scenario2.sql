CREATE OR REPLACE PROCEDURE UpdateSalary(
   p_employee_id IN NUMBER,
   p_percentage IN NUMBER
) IS
BEGIN
   UPDATE Employees
   SET Salary = Salary + (Salary * p_percentage / 100)
   WHERE EmployeeID = p_employee_id;

   IF SQL%NOTFOUND THEN
      RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.');
   END IF;

   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSalary;
/
