CREATE OR REPLACE PROCEDURE SafeTransferFunds(
   p_from_account_id IN NUMBER,
   p_to_account_id IN NUMBER,
   p_amount IN NUMBER
) IS
   v_balance NUMBER;
BEGIN
   -- Check if the from account has sufficient funds
   SELECT balance INTO v_balance FROM Accounts WHERE AccountID = p_from_account_id FOR UPDATE;
   
   IF v_balance < p_amount THEN
      RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance.');
   END IF;

   -- Perform the transfer
   UPDATE Accounts
   SET balance = balance - p_amount
   WHERE AccountID = p_from_account_id;

   UPDATE Accounts
   SET balance = balance + p_amount
   WHERE AccountID = p_to_account_id;

   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SafeTransferFunds;
/
