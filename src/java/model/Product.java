package model;

public class Product {
    private int idProduct;
    private String titleProduct;
    private double priceProduct;
    private String descProduct;
    private int quantityProduct;
    private String imgProduct;
    private int hotProduct;
    private CategoryProduct categoryProduct;

    public Product() {
    }

    public Product(int idProduct, String titleProduct, double priceProduct, String descProduct, int quantityProduct, String imgProduct, int hotProduct, CategoryProduct categoryProduct) {
        this.idProduct = idProduct;
        this.titleProduct = titleProduct;
        this.priceProduct = priceProduct;
        this.descProduct = descProduct;
        this.quantityProduct = quantityProduct;
        this.imgProduct = imgProduct;
        this.hotProduct = hotProduct;
        this.categoryProduct = categoryProduct;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getTitleProduct() {
        return titleProduct;
    }

    public void setTitleProduct(String titleProduct) {
        this.titleProduct = titleProduct;
    }

    public double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getDescProduct() {
        return descProduct;
    }

    public void setDescProduct(String descProduct) {
        this.descProduct = descProduct;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }

    public String getImgProduct() {
        return imgProduct;
    }

    public void setImgProduct(String imgProduct) {
        this.imgProduct = imgProduct;
    }

    public int getHotProduct() {
        return hotProduct;
    }

    public void setHotProduct(int hotProduct) {
        this.hotProduct = hotProduct;
    }

    public CategoryProduct getCategoryProduct() {
        return categoryProduct;
    }

    public void setCategoryProduct(CategoryProduct categoryProduct) {
        this.categoryProduct = categoryProduct;
    }

    @Override
    public String toString() {
        return "Product{" + "idProduct=" + idProduct + ", titleProduct=" + titleProduct + ", priceProduct=" + priceProduct + ", descProduct=" + descProduct + ", quantityProduct=" + quantityProduct + ", imgProduct=" + imgProduct + ", hotProduct=" + hotProduct + ", categoryProduct=" + categoryProduct + '}';
    }
    
    
}
