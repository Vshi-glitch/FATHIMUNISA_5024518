public class FinancialForecasting {

    
    public static double calculateFutureValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue; 
        } else {
            
            return calculateFutureValue(currentValue * (1 + growthRate), growthRate, years - 1);
        }
    }

    public static void main(String[] args) {
        double initialInvestment = 1000.0; 
        double annualGrowthRate = 0.05; 
        int forecastYears = 10; 

        double futureValue = calculateFutureValue(initialInvestment, annualGrowthRate, forecastYears);
        System.out.println("Future Value: " + futureValue);
    }
}
