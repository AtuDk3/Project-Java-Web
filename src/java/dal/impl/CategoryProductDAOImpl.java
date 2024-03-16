package dal.impl;

import dal.CategoryProductDAO;
import java.util.ArrayList;
import java.util.List;
import model.CategoryProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CategoryProductDAOImpl extends DBContext implements CategoryProductDAO {

    public List<CategoryProduct> getAll() {
        List<CategoryProduct> listCategoryProduct = new ArrayList<>();
        String sql = "SELECT * FROM tab_category_product";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryProduct c = new CategoryProduct(rs.getInt("id_category_product"),
                        rs.getString("title_category_product"),
                        rs.getString("desc_category_product"));
                listCategoryProduct.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCategoryProduct;
    }

    public List<CategoryProduct> getByDescCategoryProduct(String descCategoryProduct) {
        List<CategoryProduct> listCategoryProduct = new ArrayList<>();
        String sql = "SELECT * FROM tab_category_product WHERE desc_category_product = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, descCategoryProduct);

            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryProduct c = new CategoryProduct(
                        rs.getInt("id_category_product"),
                        rs.getString("title_category_product"),
                        rs.getString("desc_category_product")
                );
                listCategoryProduct.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCategoryProduct;
    }

    public CategoryProduct getCategoryProductByID(int cateID) {
        String sql = "select * from tab_category_product where id_category_product = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, cateID);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                CategoryProduct c = new CategoryProduct(rs.getInt("id_category_product"),
                        rs.getString("title_category_product"),
                        rs.getString("desc_category_product"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void insert(CategoryProduct categoryProduct) {
        String sql = "insert into tab_category_product(title_category_product, desc_category_product) values(?, ?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryProduct.getTitleCategoryProduct());
            ps.setString(2, categoryProduct.getDescCategoryProduct());
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(CategoryProduct categoryProduct) {
        String sql = "update tab_category_product set title_category_product = ?, desc_category_product = ? where id_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryProduct.getTitleCategoryProduct());
            ps.setString(2, categoryProduct.getDescCategoryProduct());
            ps.setInt(3, categoryProduct.getIdCategoryProduct());
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int idCategoryProduct) {
        String sql = "delete from tab_category_product where id_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCategoryProduct);
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public CategoryProduct get(int idCategoryProduct) {
        String sql = "select * from tab_category_product where id_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCategoryProduct);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                CategoryProduct categoryProduct = new CategoryProduct();
                
                categoryProduct.setIdCategoryProduct(rs.getInt("id_category_product"));
                categoryProduct.setTitleCategoryProduct(rs.getString("title_category_product"));
                categoryProduct.setDescCategoryProduct(rs.getString("desc_category_product"));
                
                return categoryProduct;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public CategoryProduct get(String titleCategoryProduct) {
        String sql = "select * from tab_category_product where title_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, titleCategoryProduct);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                CategoryProduct categoryProduct = new CategoryProduct();
                
                categoryProduct.setIdCategoryProduct(rs.getInt("id_category_product"));
                categoryProduct.setTitleCategoryProduct(rs.getString("title_category_product"));
                categoryProduct.setDescCategoryProduct(rs.getString("desc_category_product"));
                
                return categoryProduct;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CategoryProduct> search(String txtSearch) {
        List<CategoryProduct> listCategoryProduct = new ArrayList<>();
        
        String sql = "select * from tab_category_product where title_category_product like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, '%' + txtSearch + '%');
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                CategoryProduct categoryProduct = new CategoryProduct();
                
                categoryProduct.setIdCategoryProduct(rs.getInt("id_category_product"));
                categoryProduct.setTitleCategoryProduct(rs.getString("title_category_product"));
                categoryProduct.setDescCategoryProduct(rs.getString("desc_category_product"));
                
                listCategoryProduct.add(categoryProduct);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCategoryProduct;
    }
    
    @Override
    public Map<String, Integer> getCategoryProductsAndNumberProducts() {
        Map<String, Integer> categoryProductMap = new HashMap<>();
        String sql = "SELECT c.title_category_product, COUNT(p.id_product) AS product_count\n"
                + "FROM tab_product AS p\n"
                + "INNER JOIN tab_category_product AS c ON p.id_category_product = c.id_category_product\n"
                + "GROUP BY c.title_category_product;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String titleCategoryProduct = rs.getString("title_category_product");
                int productCount = rs.getInt("product_count");
                categoryProductMap.put(titleCategoryProduct, productCount);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categoryProductMap;
    }
    
    
    public static void main(String[] args) {
        CategoryProductDAOImpl dao = new CategoryProductDAOImpl();
        System.out.println(dao.getCategoryProductsAndNumberProducts().toString());
        
    }
    
    
}
