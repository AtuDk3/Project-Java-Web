package dal.impl;

import dal.ProductDao;
import java.util.ArrayList;
import java.util.List;
import model.CategoryProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Product;

public class ProductDAOImpl extends DBContext implements ProductDao {

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
                        rs.getFloat("price_product"),
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
                p.setPriceProduct(rs.getFloat("price_product"));
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
                p.setPriceProduct(rs.getFloat("price_product"));
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
                p.setPriceProduct(rs.getFloat("price_product"));
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
                p.setPriceProduct(rs.getFloat("price_product"));
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

    @Override
    public void insert(Product product) {
        String sql = "insert into tab_product(title_product, price_product, desc_product, quantity_product, img_product, hot_product, id_category_product) values(?, ?, ?, ?, ?, ?, ?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, product.getTitleProduct());
            ps.setDouble(2, product.getPriceProduct());
            ps.setString(3, product.getDescProduct());
            ps.setInt(4, product.getQuantityProduct());
            ps.setString(5, product.getImgProduct());
            ps.setInt(6, product.getHotProduct());
            ps.setInt(7, product.getCategoryProduct().getIdCategoryProduct());

            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Product product) {
        String sql = "update tab_product set title_product = ?, price_product = ?, desc_product = ?, quantity_product = ?, img_product = ?, hot_product = ?, id_category_product = ?"
                + " where id_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, product.getTitleProduct());
            ps.setDouble(2, product.getPriceProduct());
            ps.setString(3, product.getDescProduct());
            ps.setInt(4, product.getQuantityProduct());
            ps.setString(5, product.getImgProduct());
            ps.setInt(6, product.getHotProduct());
            ps.setInt(7, product.getCategoryProduct().getIdCategoryProduct());
            ps.setInt(8, product.getIdProduct());

            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int idProduct) {
        String sql = "delete from tab_product where id_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public int countProduct() {
        String sql = "select count(*) from tab_product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 return rs.getInt(1);              
            }
          
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    

    @Override
    public int countCategoryProduct(int idCategoryProduct) {
        String sql = "select count(*) from tab_product where id_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCategoryProduct);
            ResultSet rs = ps.executeQuery();
            
            return rs.getInt(1);

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public List<Product> pagingProduct(int indexPage) {
        List<Product> listProduct = new ArrayList<>();
  
        String sql = "select p.*, c.* from tab_product as p inner join tab_category_product as c on p.id_category_product = c.id_category_product \n"
                + "order by p.price_product offset ? rows fetch next 8 rows only";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (indexPage-1)*8);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                Product p = new Product(rs.getInt("id_product"),
                        rs.getString("title_product"),
                        rs.getFloat("price_product"),
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
    
    public static void main(String[] args) {
        ProductDAOImpl productDAOImpl = new ProductDAOImpl();
        List<Product> list = productDAOImpl.pagingProduct(1);
        System.out.println(list.toString());
    }

}
