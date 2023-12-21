/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.impl;

import dal.ProductDao;
import dal.impl.ProductDAOImpl;
import java.util.List;
import model.Product;
import service.ProductService;

/**
 *
 * @author Lenovo
 */
public class ProductServiceImpl implements ProductService {
    
    ProductDao productDao = new ProductDAOImpl();

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> getProductByCateID(int cateID) {
        return productDao.getProductByCateID(cateID);
    }

    @Override
    public Product getProductByID(int productID) {
        return productDao.getProductByID(productID);
    }

    @Override
    public List<Product> getProductModel() {
        return productDao.getProductModel();
    }

    @Override
    public List<Product> searchProductByName(String txtSearch) {
        return productDao.searchProductByName(txtSearch);
    }
    
}
