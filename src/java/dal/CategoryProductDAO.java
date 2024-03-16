/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.List;
import java.util.Map;
import model.CategoryProduct;

/**
 *
 * @author Lenovo
 */
public interface CategoryProductDAO {
    void insert(CategoryProduct categoryProduct);
    
    void update(CategoryProduct categoryProduct);
    
    void delete(int idCategoryProduct);
    
    CategoryProduct get(int idCategoryProduct);
    
    CategoryProduct get(String titleCategoryProduct);
    
    List<CategoryProduct> getAll();
    
    List<CategoryProduct> search(String txtSearch);
    
    List<CategoryProduct> getByDescCategoryProduct(String descCategoryProduct);
    
    Map<String, Integer> getCategoryProductsAndNumberProducts();
    
    
}
