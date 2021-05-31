package service;

import model.Product;

import java.beans.Customizer;
import java.util.List;

public interface iProductService {
    List<Product> findAll();

    void create();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    Product findByName(String name);
}
