/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.impl;

import dal.CategoryProductDAO;
import dal.impl.CategoryProductDAOImpl;
import java.util.List;
import model.CategoryProduct;
import service.CategoryProductService;

/**
 *
 * @author Lenovo
 */
public class CategoryProductServiceImpl implements CategoryProductService {

    CategoryProductDAO cDao = new CategoryProductDAOImpl();

    @Override
    public void insert(CategoryProduct categoryProduct) {
        cDao.insert(categoryProduct);
    }

    @Override
    public void update(CategoryProduct categoryProduct) {
        CategoryProduct oldCategoryProduct = cDao.get(categoryProduct.getIdCategoryProduct());
        oldCategoryProduct.setTitleCategoryProduct(categoryProduct.getTitleCategoryProduct());
        oldCategoryProduct.setDescCategoryProduct(categoryProduct.getDescCategoryProduct());
        cDao.update(oldCategoryProduct);
    }

    @Override
    public void delete(int idCategoryProduct) {
        cDao.delete(idCategoryProduct);
    }

    @Override
    public CategoryProduct get(int id) {
        return cDao.get(id);
    }

    @Override
    public CategoryProduct get(String titleCategoryProduct) {
        return cDao.get(titleCategoryProduct);
    }

    @Override
    public List<CategoryProduct> getAll() {
        return cDao.getAll();
    }

    @Override
    public List<CategoryProduct> search(String txtSearch) {
        return cDao.search(txtSearch);
    }

    @Override
    public List<CategoryProduct> getByDescCategoryProduct(String descCategoryProduct) {
        return cDao.getByDescCategoryProduct(descCategoryProduct);
    }

}
