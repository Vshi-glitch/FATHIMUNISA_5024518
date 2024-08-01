// Step 4: Implement the proxy class
public class ProxyImage implements Image {
    private String imageUrl;
    private RealImage realImage;

    public ProxyImage(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public void display() {
        if (realImage == null) {
            realImage = new RealImage(imageUrl); // Lazy initialization
        }
        realImage.display(); // Forward the display request to the real image
    }
}
