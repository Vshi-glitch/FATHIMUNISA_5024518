CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
   :NEW.lastmodified := SYSDATE;
END UpdateCustomerLastModified;
/
