/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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

        List<CategoryProduct> listCategory = categoryProductService.getAll();
        request.setAttribute("categoryProduct", listCategory);

        List<CategoryProduct> listCategoryAccessories = categoryProductService.getByDescCategoryProduct("Accessories");
        request.setAttribute("categoryAccessories", listCategoryAccessories);
        List<CategoryProduct> listCategoryPosters = categoryProductService.getByDescCategoryProduct("Posters");
        request.setAttribute("categoryPosters", listCategoryPosters);
        List<CategoryProduct> listCategoryFiguresToys = categoryProductService.getByDescCategoryProduct("Figures & Toys");
        request.setAttribute("categoryFiguresToys", listCategoryFiguresToys);
        List<CategoryProduct> listCategoryClothers = categoryProductService.getByDescCategoryProduct("Clothers");
        request.setAttribute("categoryClothers", listCategoryClothers);

        // product
//        String cID = request.getParameter("cid");
//        int idCate = Integer.parseInt(cID);
//        List<Product> listProduct = productService.getProductByCateID(idCate);
//        request.setAttribute("product", listProduct);

        // Paging
        String index = request.getParameter("index");
        if (index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);

        int countProduct = productService.countProduct();

        int endPage = countProduct / 8;
        if (countProduct % 8 != 0) {
            endPage++;
        }

        List<Product> listProduct = productService.pagingProduct(indexPage);
request.setAttribute("product", listProduct);
        request.setAttribute("endPage", endPage);

        request.setAttribute("tag", indexPage);
        request.getRequestDispatcher("view/products.jsp").forward(request, response);
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
        processRequest(request, response);
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
