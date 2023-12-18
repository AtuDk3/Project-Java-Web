package dal.impl;

import java.util.ArrayList;
import java.util.List;
import model.CategoryProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Product;

public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from tab_product";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                Product p = new Product(rs.getInt("id_product"),
                        rs.getString("title_product"),
                        rs.getDouble("price_product"),
                        rs.getString("desc_product"),
                        rs.getInt("quantity_product"),
                        rs.getString("img_product"),
                        rs.getInt("hot_product"),
                        c);
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public List<Product> getProductByCateID(int cateID) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from tab_product where 1=1 ";
        if (cateID != 0) {
            sql += "and id_category_product = " + cateID;
        }
        try {
            PreparedStatement pt = connection.prepareStatement(sql);

            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();

                p.setIdProduct(rs.getInt("id_product"));
                p.setTitleProduct(rs.getString("title_product"));
                p.setPriceProduct(rs.getDouble("price_product"));
                p.setDescProduct(rs.getString("desc_product"));
                p.setQuantityProduct(rs.getInt("quantity_product"));
                p.setImgProduct(rs.getString("img_product"));
                p.setHotProduct(rs.getInt("hot_product"));
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                p.setCategoryProduct(c);
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public Product getProductByID(int productID) {
        String sql = "select * from tab_product where id_product = ? ";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();

                p.setIdProduct(rs.getInt("id_product"));
                p.setTitleProduct(rs.getString("title_product"));
                p.setPriceProduct(rs.getDouble("price_product"));
                p.setDescProduct(rs.getString("desc_product"));
                p.setQuantityProduct(rs.getInt("quantity_product"));
                p.setImgProduct(rs.getString("img_product"));
                p.setHotProduct(rs.getInt("hot_product"));
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                p.setCategoryProduct(c);
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductModel() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT TOP 5 p.*, c.* "
                + "FROM tab_product AS p "
                + "INNER JOIN tab_category_product AS c ON p.id_category_product = c.id_category_product "
                + "WHERE c.title_category_product = 'Figurine'";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryProduct c = new CategoryProduct();
                c.setIdCategoryProduct(rs.getInt("id_category_product"));
                c.setTitleCategoryProduct(rs.getString("title_category_product"));
                c.setDescCategoryProduct(rs.getString("desc_category_product"));

                Product p = new Product();
                p.setIdProduct(rs.getInt("id_product"));
                p.setTitleProduct(rs.getString("title_product"));
                p.setPriceProduct(rs.getDouble("price_product"));
                p.setDescProduct(rs.getString("desc_product"));
                p.setQuantityProduct(rs.getInt("quantity_product"));
                p.setImgProduct(rs.getString("img_product"));
                p.setHotProduct(rs.getInt("hot_product"));
                p.setCategoryProduct(c);

                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }
    
    public List<Product> searchProductByName(String txtSearch) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from tab_product where title_product like ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, '%' + txtSearch + '%');
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();

                p.setIdProduct(rs.getInt("id_product"));
                p.setTitleProduct(rs.getString("title_product"));
                p.setPriceProduct(rs.getDouble("price_product"));
                p.setDescProduct(rs.getString("desc_product"));
                p.setQuantityProduct(rs.getInt("quantity_product"));
                p.setImgProduct(rs.getString("img_product"));
                p.setHotProduct(rs.getInt("hot_product"));
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                p.setCategoryProduct(c);
                listProduct.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }
    
    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
    List<Product> p = pdao.searchProductByName("gear");
        System.out.println(p.toString());
    }
    

//    public Customer getCustomerByID(int id) {
//        String sql = "select * from Customer where customerID = ?";
//        try {
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setInt(1, id);
//            ResultSet rs = pt.executeQuery();
//            if (rs.next()) {
//                Customer c = new Customer(rs.getInt("customerID"),
//                        rs.getString("lastName"),
//                        rs.getString("firstName"),
//                        rs.getString("phone"),
//                        rs.getString("address"),
//                        rs.getString("city"),
//                        rs.getString("country"));
//                return c;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
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

    public ProductDAO() {
    }
}
