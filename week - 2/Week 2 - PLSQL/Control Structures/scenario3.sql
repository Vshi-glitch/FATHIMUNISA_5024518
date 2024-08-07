BEGIN
   FOR loan_rec IN (SELECT CustomerID, EndDate FROM Loans WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30) LOOP
      DBMS_OUTPUT.PUT_LINE('Reminder: Loan for Customer ' || loan_rec.CustomerID || ' is due on ' || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY'));
   END LOOP;
END;
/
