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

    // Ajax load more by Category Product
    public List<Product> getTop4RelatedProducts(int idProduct, int idCategoryProduct) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select top 4 * from tab_product where id_product != ? and id_category_product = ? order by id_product";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idProduct);
            ps.setInt(2, idCategoryProduct);
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

    public List<Product> getNext4RelatedProducts(int idProduct, int idCategoryProduct, int amount) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from tab_product where id_product != ? and id_category_product = ? order by id_product offset ? rows fetch next 4 rows only";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idProduct);
            ps.setInt(2, idCategoryProduct);
            // Set vị trí cho product
            ps.setInt(3, amount);
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
    public int countProductByCategory(int idCategoryProduct) {
        String sql = "select count(*) from tab_product where id_category_product = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCategoryProduct);
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
    public List<Product> pagingProduct(int indexP, int indexP1) {
        List<Product> listProduct = new ArrayList<>();

        String sql = "select p.*, c.* from tab_product as p inner join tab_category_product as c on p.id_category_product = c.id_category_product \n"
                + "order by p.price_product offset ? rows fetch next ? rows only";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (indexP - 1) * indexP1);
            ps.setInt(2, indexP1);
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

    @Override
    public List<Product> pagingProduct(int idCategoryProduct, int pageIndex, int pageSize) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.*, c.* FROM tab_product AS p "
                + "INNER JOIN tab_category_product AS c ON p.id_category_product = c.id_category_product "
                + "WHERE p.id_category_product = ? "
                + "ORDER BY p.price_product OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCategoryProduct);
            ps.setInt(2, (pageIndex - 1) * pageSize);
            ps.setInt(3, pageSize);
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

    // home
    public List<Product> getTop4ProductsByCategory() {
        List<Product> top4ProductsHomePage = new ArrayList<>();
        String sql = "SELECT * FROM ( "
                + "SELECT ROW_NUMBER() OVER (PARTITION BY id_category_product ORDER BY id_product desc) as row_num, "
                + "id_product, title_product, price_product, desc_product, quantity_product, img_product, hot_product, id_category_product "
                + "FROM tab_product) AS numbered "
                + "WHERE row_num <= 4";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
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

                top4ProductsHomePage.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return top4ProductsHomePage;
    }

    // top 5 hot product in home
    public List<Product> getTop5HotProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select top 5 * from tab_product where hot_product = 1 order by id_product desc";

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

    public List<Product> getHotProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from tab_product where hot_product = 1 order by id_product desc";

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

    // Best Seller
    public List<Product> getTop5BestSellerProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT TOP 5 p.id_product, p.title_product, p.price_product, p.quantity_product, p.img_product, p.hot_product, p.id_category_product\n"
                + "FROM tab_product AS p INNER JOIN tab_cart_item AS c ON p.id_product = c.id_product\n"
                + "GROUP BY\n"
                + "    p.id_product, p.title_product, p.price_product, p.quantity_product, p.img_product, p.hot_product, p.id_category_product\n"
                + "ORDER BY SUM(c.quantity) DESC, p.id_product DESC;";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryProductDAOImpl cDAO = new CategoryProductDAOImpl();
                CategoryProduct c = cDAO.getCategoryProductByID(rs.getInt("id_category_product"));
                Product p = new Product(rs.getInt("id_product"),
                        rs.getString("title_product"),
                        rs.getFloat("price_product"),
                        "",
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

    public List<Product> getProductFilter(float minPrice, float maxPrice, String sortBy, String sortOrder) {
        List<Product> filteredProducts = new ArrayList<>();
        String sql = "SELECT * FROM tab_product WHERE price_product >= ? AND price_product <= ?";

        // Nếu có yêu cầu sắp xếp, thêm vào câu SQL ORDER BY
        if (sortBy != null && !sortBy.isEmpty()) {
            sql += " ORDER BY " + sortBy;
            if (sortOrder != null && !sortOrder.isEmpty()) {
                sql += " " + sortOrder;
            }
        }

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setFloat(1, minPrice);
            pt.setFloat(2, maxPrice);
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
                filteredProducts.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return filteredProducts;
    }

    public static void main(String[] args) {
        ProductDAOImpl dao = new ProductDAOImpl();
        List<Product> filteredProducts = dao.getProductFilter(0, 1000000, "price_product", "ASC");

        // In ra kết quả
        for (Product product : filteredProducts) {
            System.out.println("ID: " + product.getIdProduct());
            System.out.println("Title: " + product.getTitleProduct());
            System.out.println("Price: " + product.getPriceProduct());
            System.out.println("Description: " + product.getDescProduct());
            System.out.println("Quantity: " + product.getQuantityProduct());
            System.out.println("Image: " + product.getImgProduct());
            System.out.println("Hot: " + product.getHotProduct());
            System.out.println("Category ID: " + product.getCategoryProduct().getIdCategoryProduct());
            System.out.println("Category Title: " + product.getCategoryProduct().getTitleCategoryProduct());
            System.out.println();
        }
    }

}
