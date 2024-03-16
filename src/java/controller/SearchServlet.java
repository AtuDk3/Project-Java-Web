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
@WebServlet(name="SearchAjaxServlet", urlPatterns={"/search"})
public class SearchServlet extends HttpServlet {
   ProductService productService = new ProductServiceImpl();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SearchAjaxServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchAjaxServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // category
        CategoryProductService categoryProductService = new CategoryProductServiceImpl();
        
        List<CategoryProduct> listCategory = categoryProductService.getAll();
        request.setAttribute("categoryProduct", listCategory);

        // product      
        String txtSearch = request.getParameter("txtSearch");
        List<Product> listProduct = productService.searchProductByName(txtSearch);
        request.setAttribute("productList", listProduct);
        request.setAttribute("txtS", txtSearch);
        
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String minPrice = request.getParameter("minPrice");
        float min = Float.parseFloat(minPrice);
        String maxPrice = request.getParameter("maxPrice");
        float max = Float.parseFloat(maxPrice);
        String sort = request.getParameter("sort");
        String order = request.getParameter("order");
        List<Product> filteredProducts = productService.getProductFilter(min, max, sort, order);
        
        request.setAttribute("productList", filteredProducts);
        
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
