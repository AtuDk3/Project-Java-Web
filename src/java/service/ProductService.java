/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.Product;

/**
 *
 * @author Lenovo
 */
public interface ProductService {
    List<Product> getAll();
    
    List<Product> getProductByCateID(int cateID);
    
    Product getProductByID(int productID);
    
    List<Product> getProductModel();
    
    List<Product> searchProductByName(String txtSearch);
    
    void insert(Product product);
    
     void update(Product product);
     
      void delete(int idProduct);
}
