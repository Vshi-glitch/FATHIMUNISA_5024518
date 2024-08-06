DECLARE
   CURSOR monthly_statements_cur IS
      SELECT customer_id, transaction_date, amount, transaction_type
      FROM transactions
      WHERE transaction_date BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE);
BEGIN
   FOR transaction_rec IN monthly_statements_cur LOOP
      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || transaction_rec.customer_id || 
                           ', Date: ' || TO_CHAR(transaction_rec.transaction_date, 'DD-MON-YYYY') ||
                           ', Amount: ' || transaction_rec.amount || 
                           ', Type: ' || transaction_rec.transaction_type);
   END LOOP;
END;
/
