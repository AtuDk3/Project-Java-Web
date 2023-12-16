/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class CategoryProduct {
    private int idCategoryProduct;
    private String titleCategoryProduct, descCategoryProduct;

    public CategoryProduct() {
    }

    public CategoryProduct(int idCategoryProduct, String titleCategoryProduct, String descCategoryProduct) {
        this.idCategoryProduct = idCategoryProduct;
        this.titleCategoryProduct = titleCategoryProduct;
        this.descCategoryProduct = descCategoryProduct;
    }

    public int getIdCategoryProduct() {
        return idCategoryProduct;
    }

    public void setIdCategoryProduct(int idCategoryProduct) {
        this.idCategoryProduct = idCategoryProduct;
    }

    public String getTitleCategoryProduct() {
        return titleCategoryProduct;
    }

    public void setTitleCategoryProduct(String titleCategoryProduct) {
        this.titleCategoryProduct = titleCategoryProduct;
    }

    public String getDescCategoryProduct() {
        return descCategoryProduct;
    }

    public void setDescCategoryProduct(String descCategoryProduct) {
        this.descCategoryProduct = descCategoryProduct;
    }

    @Override
    public String toString() {
        return "CategoryProduct{" + "idCategoryProduct=" + idCategoryProduct + ", titleCategoryProduct=" + titleCategoryProduct + ", descCategoryProduct=" + descCategoryProduct + '}';
    }
    
    
}
