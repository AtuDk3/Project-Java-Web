/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.CategoryProduct;

/**
 *
 * @author Lenovo
 */
public interface CategoryProductService {
    void insert(CategoryProduct categoryProduct);
    
    void update(CategoryProduct categoryProduct);
    
    void delete(int idCategoryProduct);
    
    CategoryProduct get(int id);
    
    CategoryProduct get(String titleCategoryProduct);
    
    List<CategoryProduct> getAll();
    
    List<CategoryProduct> search(String txtSearch);
}
