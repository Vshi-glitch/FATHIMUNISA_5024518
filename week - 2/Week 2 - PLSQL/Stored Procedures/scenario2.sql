CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
   p_department IN VARCHAR2,
   p_bonus_percentage IN NUMBER
) IS
BEGIN
   UPDATE employees
   SET salary = salary + (salary * p_bonus_percentage / 100)
   WHERE department = p_department;
   
   COMMIT;
END UpdateEmployeeBonus;
/
