
public class SearchUtils {
    public static Product linearSearch(Product[] products, String targetProductId) {
        for (Product product : products) {
            if (product.getProductId().equals(targetProductId)) {
                return product;
            }
        }
        return null; // Not found
    }
}
