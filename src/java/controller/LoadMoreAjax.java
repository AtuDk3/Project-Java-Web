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
import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "LoadMoreAjax", urlPatterns = {"/load"})
public class LoadMoreAjax extends HttpServlet {

    ProductService productService = new ProductServiceImpl();

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
            out.println("<title>Servlet LoadMoreAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadMoreAjax at " + request.getContextPath() + "</h1>");
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
        String amount = request.getParameter("exits");
        String cid = request.getParameter("cid");
        String pid = request.getParameter("pid");
        int intAmount = Integer.parseInt(amount);
        int idCategoryProduct = Integer.parseInt(cid);
        int idProduct = Integer.parseInt(pid);

        List<Product> listProductLoadMore = productService.getNext4RelatedProducts(idProduct, idCategoryProduct, intAmount);
        PrintWriter out = response.getWriter();

        for (Product p : listProductLoadMore) {
            out.println(
                    "<div class=\"showcase product_related\">\n"
                    + "\n"
                    + "                                    <div class=\"showcase-banner\">\n"
                    + "                                        <img src=\"" + request.getContextPath() + "/assets/images/uploads/product/" + p.getImgProduct() + "\" alt=\"" + p.getTitleProduct() + "\" class=\"product-img default\"\n"
                    + "                                             width=\"300\" style=\"object-fit: cover; height: 250px\">\n"
                    + "                                        <img src=\"" + request.getContextPath() + "/assets/images/uploads/product/" + p.getImgProduct() + "\" alt=\"" + p.getTitleProduct() + "\" class=\"product-img hover\"\n"
                    + "                                             width=\"300\" style=\"object-fit: cover; height: 250px\">\n"
                    + "\n");
            if (p.getHotProduct() == 1) {
                out.println("<p class=\"showcase-badge angle black\">hot</p>");
            } else {
                out.println("<p class=\"showcase-badge angle pink\">sale</p>");
            }
            out.println(
                    "\n"
                    + "                                        <div class=\"showcase-actions\">\n"
                    + "                                            <a href=\"#\">\n"
                    + "                                            <button class=\"btn-action\">\n"
                    + "                                                <ion-icon name=\"heart-outline\"></ion-icon>\n"
                    + "                                            </button></a>\n"
                    + "                                            \n"
                    + "                                            <a href=\"" + request.getContextPath() + "/product_details?pid=" + p.getIdProduct() + "&cid=" + p.getCategoryProduct().getIdCategoryProduct() + "\">\n"
                    + "                                            <button class=\"btn-action\">\n"
                    + "                                                <ion-icon name=\"eye-outline\"></ion-icon>\n"
                    + "                                            </button></a>\n"
                    + "\n"
                    + "                                            <a href=\"#\">\n"
                    + "                                            <button class=\"btn-action\">\n"
                    + "                                                <ion-icon name=\"repeat-outline\"></ion-icon>\n"
                    + "                                            </button></a>\n"
                    + "\n"
                    + "                                            <a href=\"" + request.getContextPath() + "/member/cart_add?pid=" + p.getIdProduct() + "&quantity=1\"><button class=\"btn-action\">\n"
                    + "                                                <ion-icon name=\"bag-add-outline\"></ion-icon>\n"
                    + "                                            </button></a>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "\n"
                    + "\n"
                    + "                                    <div class=\"showcase-content\">\n"
                    + "                                        <a href=\"#\" class=\"showcase-category\">" + p.getCategoryProduct().getTitleCategoryProduct() + "</a>\n"
                    + "\n"
                    + "                                        <h3>\n"
                    + "                                            <a href=\"#\" class=\"showcase-title\">" + p.getTitleProduct() + "</a>\n"
                    + "                                        </h3>\n"
                    + "\n"
                    + "                                        <div class=\"showcase-rating\">\n"
                    + "                                            <ion-icon name=\"star\"></ion-icon>\n"
                    + "                                            <ion-icon name=\"star\"></ion-icon>\n"
                    + "                                            <ion-icon name=\"star\"></ion-icon>\n"
                    + "                                            <ion-icon name=\"star\"></ion-icon>\n"
                    + "                                            <ion-icon name=\"star\"></ion-icon>\n"
                    + "                                        </div>\n"
                    + "\n"
                    + "                                        <div class=\"price-box\">\n"
                    + "                                            <p class=\"price\"><fmt:formatNumber type=\"currency\" value=\"" + p.getPriceProduct() * 0.9 + "\" pattern=\"###,###đ\" /></p>\n"
                    + "                                            <del><fmt:formatNumber type=\"currency\" value=\"" + p.getPriceProduct() + "\" pattern=\"###,###đ\" /></del>\n"
                    + "                                        </div>\n"
                    + "\n"
                    + "                                    </div>\n"
                    + "\n"
                    + "                                </div>"
            );
        }
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
