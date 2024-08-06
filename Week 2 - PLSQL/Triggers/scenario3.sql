CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
   IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > (SELECT balance FROM accounts WHERE account_id = :NEW.AccountID) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance for withdrawal.');
   ELSIF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'Deposit amount must be positive.');
   END IF;
END CheckTransactionRules;
/
