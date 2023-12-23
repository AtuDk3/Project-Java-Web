/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import model.CategoryProduct;
import model.Product;
import service.CategoryProductService;
import service.ProductService;
import service.impl.CategoryProductServiceImpl;
import service.impl.ProductServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/admin/product/update"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class UpdateProductServlet extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryProductService categoryProductService = new CategoryProductServiceImpl();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        int idProduct = Integer.parseInt(pid);

        Product product = productService.getProductByID(idProduct);
        request.setAttribute("product", product);

        List<CategoryProduct> listCategory = categoryProductService.getAll();
        request.setAttribute("categoryProduct", listCategory);

        request.getRequestDispatcher("/view/admin/product/update_product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đọc các tham số từ form
        String pid = request.getParameter("pid");
        String titleProduct = request.getParameter("titleProduct");
        Part imagePart = request.getPart("imageProduct");
        String priceProduct = request.getParameter("priceProduct");
        String quantityProduct = request.getParameter("quantityProduct");
        String hotProduct = request.getParameter("hotProduct");
        String idCategoryProduct = request.getParameter("idCategoryProduct");
        String descProduct = request.getParameter("descProduct");

        // Chuyển đổi các giá trị cần thiết sang kiểu dữ liệu phù hợp
        int idProduct = Integer.parseInt(pid);
        int quantity = Integer.parseInt(quantityProduct);
        int hot = Integer.parseInt(hotProduct);
        int cid = Integer.parseInt(idCategoryProduct);
        float price = Float.parseFloat(priceProduct);

        // Xử lý upload ảnh (nếu có)
        String fileName = ""; // Tên file ảnh mặc định
        if (imagePart != null && imagePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + "/assets/images/uploads/product";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            fileName = "product_" + System.currentTimeMillis() + "_" + Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            imagePart.write(filePath);
        }

        // Tạo đối tượng Product và cập nhật dữ liệu
        Product product = productService.getProductByID(idProduct);
        CategoryProduct categoryProduct = categoryProductService.get(cid);

        product.setTitleProduct(titleProduct);
        if (!fileName.isEmpty()) {
            product.setImgProduct(fileName);
        }
        product.setPriceProduct(price);
        product.setQuantityProduct(quantity);
        product.setHotProduct(hot);
        product.setCategoryProduct(categoryProduct);
        product.setDescProduct(descProduct);

//         Gọi phương thức cập nhật trong ProductService
        productService.update(product);

        // Chuyển hướng về trang danh sách sản phẩm
        response.sendRedirect(request.getContextPath() + "/admin/product/list");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
