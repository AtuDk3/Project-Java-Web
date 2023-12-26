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
@WebServlet(name = "ProductServlet", urlPatterns = {"/product/list"})
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

        String indexPage = request.getParameter("index");
        String indexPage1 = request.getParameter("index1");
        String cID = request.getParameter("cid");

        int idCate = (cID == null) ? 0 : Integer.valueOf(cID);
        int indexP = (indexPage == null) ? 1 : Integer.valueOf(indexPage);
        int indexP1 = (indexPage1 == null) ? 0 : Integer.valueOf(indexPage1);

        int countProduct = productService.countProduct();
        int countCid = productService.countCategoryProduct(idCate);

        int pageSize = 0;

        switch (indexP1) {
            case 8:
                pageSize = 8;
                break;
            case 12:
                pageSize = 12;
                break;
            case 16:
                pageSize = 16;
                break;
            case -2:
                pageSize = 8;
                break;
            default:
                pageSize = 8; // Giả sử mặc định là 8 nếu không khớp
                break;
        }

        int endPage = (countProduct / pageSize) + ((countProduct % pageSize != 0) ? 1 : 0);

        List<Product> listProductPagination;

        if ("-1".equals(indexPage1)) {
            listProductPagination = productService.getAll();
        } else if ("-2".equals(indexPage1)) {
            listProductPagination = productService.pagingProduct(idCate, indexP, pageSize);
        } else {
            listProductPagination = productService.pagingProduct(indexP, pageSize);
        }

        request.setAttribute("productList", listProductPagination);
        request.setAttribute("endPage", endPage);
        request.setAttribute("tag", indexP);
        request.setAttribute("tag1", indexP1);
        request.setAttribute("indexP2", indexPage1);

        if (idCate == 0) {
            request.setAttribute("countProductAll", countProduct);
        } else {
            request.setAttribute("countProductAll", countCid);
        }

        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
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
