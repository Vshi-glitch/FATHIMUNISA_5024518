public class StrategyPatternTest {
    public static void main(String[] args) {
       
        PaymentStrategy creditCardPayment = new CreditCardPayment("1234-5678-9876-5432", "John Doe", "123", "12/24");
        PaymentStrategy payPalPayment = new PayPalPayment("johndoe@example.com", "securepassword");

        
        PaymentContext paymentContext = new PaymentContext(creditCardPayment);
        paymentContext.executePayment(250.0);

        paymentContext = new PaymentContext(payPalPayment);
        paymentContext.executePayment(100.0);
    }
}
