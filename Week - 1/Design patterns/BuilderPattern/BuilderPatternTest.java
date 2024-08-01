public class BuilderPatternTest {
    public static void main(String[] args) {
        Computer gamingPC = new Computer.Builder()
            .setCPU("Intel Core i9")
            .setRAM("32GB")
            .setStorage("1TB SSD")
            .setGraphicsCard("NVIDIA RTX 3080")
            .setPowerSupply("750W")
            .setMotherboard("Asus ROG")
            .build();

        Computer officePC = new Computer.Builder()
            .setCPU("Intel Core i5")
            .setRAM("16GB")
            .setStorage("512GB SSD")
            .build();

        System.out.println(gamingPC);
        System.out.println(officePC);
    }
}
