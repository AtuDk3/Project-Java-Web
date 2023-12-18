package dal.impl;

import dal.CategoryProductDAO;
import java.util.ArrayList;
import java.util.List;
import model.CategoryProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

//    public static void main(String[] args) {
//        CategoryProductDAOImpl customerDAO = new CategoryProductDAOImpl();
//        List<Customer> listCustomers = customerDAO.getAll();
//        System.out.println(listCustomers.get(0).getLastName() + listCustomers.get(0).getFirstName());
//    }
//    public void insert(Customer cus) {
//        String sql = "insert into Customer(customerID, lastName, firstName, phone, address, city, country) values(?,?,?,?,?,?,?)";
//        try {
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setInt(1, cus.getCustomerID());
//            pt.setString(2, cus.getLastName());
//            pt.setString(3, cus.getFirstName());
//            pt.setString(4, cus.getPhone());
//            pt.setString(5, cus.getAddress());
//            pt.setString(6, cus.getCity());
//            pt.setString(7, cus.getCountry());
//            pt.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    public void delete(int id) {
//        String sql = "delete from Customer where customerID=?";
//        try {
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setInt(1, id);
//            pt.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//    }
//
//    public void update(Customer cus) {
//        String sql = "UPDATE [dbo].[Customer]"
//                + "   SET [LastName] = ?"
//                + "      ,[FirstName] = ?"
//                + "      ,[Phone] = ?"
//                + "      ,[Address] = ?"
//                + "      ,[City] = ?"
//                + "      ,[Country] = ?"
//                + " WHERE customerID=?";
//        try {
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setString(1, cus.getLastName());
//            pt.setString(2, cus.getFirstName());
//            pt.setString(3, cus.getPhone());
//            pt.setString(4, cus.getAddress());
//            pt.setString(5, cus.getCity());
//            pt.setString(6, cus.getCountry());
//            pt.setInt(7, cus.getCustomerID());
//            pt.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//    
//    public List<Product> getProductByCustomer(int cusID) {
//        String sql = "select * from Product_New where customerID = ?";
//        List<Product> list = new ArrayList<>();
//        try {
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setInt(1, cusID);
//            ResultSet rs = pt.executeQuery();
//            if (rs.next()) {
//                Customer cus = getCustomerByID(cusID);
//                Product p = new Product();
//                p.setProduct_id(rs.getInt("product_id"));
//                p.setName(rs.getString("name"));
//                p.setQuantity(rs.getInt("quantity"));
//                p.setPrice(rs.getDouble("price"));
//                p.setImage(rs.getString("image"));
//                p.setCustomer(cus);
//                list.add(p);
//                return list;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }

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
                
                return categoryProduct;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
