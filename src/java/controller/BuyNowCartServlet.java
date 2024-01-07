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
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Product;
import service.CartItemService;
import service.CartService;
import service.ProductService;
import service.impl.CartItemServiceImpl;
import service.impl.CartServiceImpl;
import service.impl.ProductServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "BuyNowServlet", urlPatterns = {"/member/cart/buy"})
public class BuyNowCartServlet extends HttpServlet {

    CartService cartService = new CartServiceImpl();
    CartItemService cartItemService = new CartItemServiceImpl();
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
            out.println("<title>Servlet BuyNowServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyNowServlet at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("/view/payment_methods.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account buyer = (Account) session.getAttribute("account");

        // Retrieve the cart data as a HashMap
        HashMap<Integer, CartItem> cartData = (HashMap<Integer, CartItem>) session.getAttribute("cart");

        if (buyer != null && cartData != null) {
            // Reconstruct the Cart object from the HashMap
            Cart cart = new Cart();
            String idCart = generateIDCart();
            cart.setIdCart(idCart);
            cart.setBuyer(buyer);

            long millis = System.currentTimeMillis();
            java.sql.Timestamp buyDate = new java.sql.Timestamp(millis);
            cart.setBuyDate(buyDate);
            cart.setStatusOrder(0);

            // Call the insert method from your DAO
            cartService.insert(cart);
            //out.print(cartService.insert(cart));

            for (Map.Entry<Integer, CartItem> entry : cartData.entrySet()) {
                int productId = entry.getKey(); // Lấy ra id của product
                CartItem cartItem = entry.getValue(); // Lấy ra đối tượng CartItem

                // Lấy ra quantity từ đối tượng CartItem
                int quantity = cartItem.getQuantity();

                double price = cartItem.getProduct().getPriceProduct();

                cartItem.setQuantity(quantity);
                cartItem.setUnitPrice(price);
                Product product = productService.getProductByID(productId);
                cartItem.setProduct(product);
                cartItem.setCart(cart);

                cartItemService.insert(cartItem);
            }

            session.removeAttribute("cart");

            // Redirect the user to a thank-you page or any other appropriate page
            response.sendRedirect(request.getContextPath() + "/thanks");
        } else {
            // Handle the case where either the user or the cart is not available
            response.sendRedirect(request.getContextPath() + "/member/cart");
        }
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

    private Map<Integer, CartItem> extracted(Object obj) {
        return (Map<Integer, CartItem>) obj;
    }

    private String generateIDCart() {
        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000; // Sinh số ngẫu nhiên từ 100000 đến 999999
        String randomString = "TRANS" + randomNumber;
        return randomString;
    }
}
