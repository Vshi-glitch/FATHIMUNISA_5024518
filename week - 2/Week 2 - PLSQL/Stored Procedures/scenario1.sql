CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
   FOR account_rec IN (SELECT account_id, balance FROM accounts WHERE account_type = 'Savings') LOOP
      UPDATE accounts
      SET balance = balance + (balance * 0.01)
      WHERE account_id = account_rec.account_id;
   END LOOP;
   COMMIT;
END ProcessMonthlyInterest;
/
