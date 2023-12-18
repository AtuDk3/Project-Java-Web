/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name="LoginServlet", urlPatterns={"/login"})
public class LoginServlet extends HttpServlet {
    
    public  static final String COOKIE_REMEMBER = "userName";
    public  static final String SESSION_USERNAME = "userName";
   
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
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
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
        //CHECK SESSION
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null){
            response.sendRedirect(request.getContextPath() + "/waiting");
            return;
        }
        
        //CHECK COOKIE
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("userName")){
                    session = request.getSession(true);
                    session.setAttribute("userName", cookie.getValue());
                    response.sendRedirect(request.getContextPath() + "/waiting");
                    return;
                }
            }
        }
        request.getRequestDispatcher("view/login.jsp").forward(request, response);
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
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        boolean isRememberMe = false;
        String remember = request.getParameter("remember");
        if ("on".equals(remember)){
            isRememberMe = true;
        }
        String alertMsg = "";
        
        if (userName.isEmpty() || password.isEmpty()){
            alertMsg = "Account information or password is incorrect!";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
            return;
        }
        
        UserService service = new UserServiceImpl();
        Account account = service.login(userName, password);
        
        if (account != null) {
            HttpSession session = request.getSession();
            
            session.setAttribute("account", account);
            if (isRememberMe){
                saveRememberMe(response, userName);
            }
            response.sendRedirect(request.getContextPath() + "/waiting");
        }
        else {
            alertMsg = "Account information or password is incorrect!";
            request.setAttribute("alert", alertMsg);
            request.setAttribute("uName", userName);
            request.setAttribute("uPass", password);
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void saveRememberMe(HttpServletResponse response, String userName) {
        Cookie cookie = new Cookie(COOKIE_REMEMBER, userName);
        cookie.setMaxAge(30*60);
        response.addCookie(cookie);
    }

}
