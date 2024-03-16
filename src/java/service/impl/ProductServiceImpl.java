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

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        Product oldProduct = productDao.getProductByID(product.getIdProduct());
        
        oldProduct.setTitleProduct(product.getTitleProduct());
        oldProduct.setPriceProduct((float) product.getPriceProduct());
        oldProduct.setDescProduct(product.getDescProduct());
        oldProduct.setQuantityProduct(product.getQuantityProduct());
        oldProduct.setImgProduct(product.getImgProduct());
        oldProduct.setHotProduct(product.getHotProduct());
        oldProduct.setCategoryProduct(product.getCategoryProduct());
        
        productDao.update(oldProduct);
    }

    @Override
    public void delete(int idProduct) {
        productDao.delete(idProduct);
    }

    @Override
    public int countProduct() {
        return productDao.countProduct();
    }
    
    @Override
    public int countProductByCategory(int idCategoryProduct) {
        return productDao.countProductByCategory(idCategoryProduct);
    }

    @Override
    public List<Product> pagingProduct(int indexP, int indexP1) {
        return productDao.pagingProduct(indexP, indexP1);
    }

    @Override
    public List<Product> pagingProduct(int idCategoryProduct, int indexP, int indexP1) {
        return productDao.pagingProduct(idCategoryProduct, indexP, indexP1);
    }

    // ajax load more related product
    @Override
    public List<Product> getTop4RelatedProducts(int idProduct, int idCategoryProduct) {
        return productDao.getTop4RelatedProducts(idProduct, idCategoryProduct);
    }

    @Override
    public List<Product> getNext4RelatedProducts(int idProduct, int idCategoryProduct, int amount) {
        return productDao.getNext4RelatedProducts(idProduct, idCategoryProduct, amount);
    }

    // Top 4 product in home
    @Override
    public List<Product> getTop4ProductsByCategory() {
        return productDao.getTop4ProductsByCategory();
    }

    @Override
    public List<Product> getTop5HotProduct() {
        return productDao.getTop5HotProduct();
    }
    
    @Override
    public List<Product> getHotProduct() {
        return productDao.getHotProduct();
    }

    @Override
    public List<Product> getTop5BestSellerProduct() {
        return productDao.getTop5BestSellerProduct();
    }

    @Override
    public List<Product> getProductFilter(float minPrice, float maxPrice, String sortBy, String sortOrder) {
        return productDao.getProductFilter(minPrice, maxPrice, sortBy, sortOrder);
    }

    


    
}
