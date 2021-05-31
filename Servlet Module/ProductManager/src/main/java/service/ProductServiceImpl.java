package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements iProductService{
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Airpod",100,"Made in China","Apple"));
        products.put(2, new Product(2, "Sh125", 5000, "5 products left", "Honda"));
        products.put(3, new Product(3, "T-shirt", 20, "New model", "Adidas"));
        products.put(4, new Product(4, "iPhone 12", 2000, "with Play Store", "Apples"));
        products.put(5, new Product(5, "SToy",100 , "20cm","Ahihi"));
    }

    @Override
    public List<Product> findAll(){
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void create() {
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public Product findByName(String name) {
        for (Product product: products.values()) {
            if (product.getName().equals(name)){
                return product;
            }
        }
        return null;
    }
}
