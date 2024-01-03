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
    
    List<Product> getTop4RelatedProducts(int idProduct, int idCategoryProduct);
    
    List<Product> getNext4RelatedProducts(int idProduct, int idCategoryProduct, int amount);

    int countProduct();

    int countCategoryProduct(int idCategoryProduct);
    
    List<Product> pagingProduct(int indexP, int indexP1); 
    
    List<Product> pagingProduct(int idCategoryProduct, int pageIndex, int pageSize);
    
    List<Product> getTop4ProductsByCategory();
    
    List<Product> getTop5HotProduct();
}
