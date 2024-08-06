BEGIN
   FOR customer_rec IN (SELECT CustomerID, SYSDATE - DOB AS age FROM Customers) LOOP
      IF customer_rec.age > 60 THEN
         UPDATE Loans
         SET InterestRate = InterestRate - 1
         WHERE CustomerID = customer_rec.CustomerID;
      END IF;
   END LOOP;
   COMMIT;
END;
/
