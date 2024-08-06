DECLARE
   CURSOR loans_cur IS
      SELECT loan_id, interest_rate FROM loans;
   v_new_interest_rate NUMBER := 4.5; -- New interest rate policy
BEGIN
   FOR loan_rec IN loans_cur LOOP
      UPDATE loans
      SET interest_rate = v_new_interest_rate
      WHERE loan_id = loan_rec.loan_id;
   END LOOP;
   COMMIT;
END;
/
