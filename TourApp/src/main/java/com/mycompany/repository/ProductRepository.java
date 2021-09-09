/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;


import com.mycompany.pojos.Product;
import java.util.List;

/**
 *
 * @author PC
 */
public interface ProductRepository {
    List<Product> getProducts(String kw, int page);
    long countProudct ();
    boolean addorUpdate(Product product);

    Product getProductById(int productId);

}
