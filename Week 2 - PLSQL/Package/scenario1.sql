CREATE OR REPLACE PACKAGE CustomerManagement IS
   PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE);
   PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE);
   FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement IS
   PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE) IS
   BEGIN
      INSERT INTO customers (customer_id, name, dob, balance, lastmodified)
      VALUES (p_customer_id, p_name, p_dob, 0, SYSDATE);
   END AddNewCustomer;
   
   PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE) IS
   BEGIN
      UPDATE customers
      SET name = p_name, dob = p_dob, lastmodified = SYSDATE
      WHERE customer_id = p_customer_id;
   END UpdateCustomerDetails;
   
   FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
      v_balance NUMBER;
   BEGIN
      SELECT balance INTO v_balance FROM customers WHERE customer_id = p_customer_id;
      RETURN v_balance;
   END GetCustomerBalance;
END CustomerManagement;
/
