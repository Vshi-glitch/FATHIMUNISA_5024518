public class ProxyPatternTest {
    public static void main(String[] args) {
        
        Image image1 = new ProxyImage("http://example.com/image1.jpg");
        Image image2 = new ProxyImage("http://example.com/image2.jpg");

        
        image1.display(); 
        image1.display(); 

        image2.display(); 
        image2.display(); 
    }
}
