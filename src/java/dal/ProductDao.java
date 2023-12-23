/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Product;

/**
 *
 * @author Lenovo
 */
public interface ProductDao {
    List<Product> getAll();
    
    List<Product> getProductByCateID(int cateID);
    
    Product getProductByID(int productID);
    
    List<Product> getProductModel();
    
    List<Product> searchProductByName(String txtSearch);
    
    void insert(Product product);

    void update(Product product);

    void delete(int idProduct);
    
    int countProduct();

    int countCategoryProduct(int idCategoryProduct);
    
    List<Product> pagingProduct(int indexPage); 
}
