package com.shopping.service;

import com.shopping.entity.Product;

import java.util.List;

/**
 * Created by wyl on 2018/3/1.
 */
public interface ProductService {
    public Product getProduct(int id);

    public Product getProduct(String name);

    public int addProduct(Product product);

    public boolean deleteProduct(int id);

    public boolean updateProduct(Product product);

    public List<Product> getProductsByKeyWord(String searchKeyWord);

    public List<Product> getProductsByType(int type);

    public List<Product> getAllProduct();

    public List<Product> getUnBuyProducts();
}
