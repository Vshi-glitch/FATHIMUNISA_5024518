CREATE OR REPLACE PROCEDURE AddNewCustomer(
   p_customer_id IN NUMBER,
   p_name IN VARCHAR2,
   p_dob IN DATE
) IS
BEGIN
   INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
   VALUES (p_customer_id, p_name, p_dob, 0, SYSDATE);

   COMMIT;
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Error: Customer with ID ' || p_customer_id || ' already exists.');
   WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END AddNewCustomer;
/
