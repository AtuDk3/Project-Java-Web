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
import model.Account;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name="UpdateAccountServlet", urlPatterns={"/admin/account/update"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class UpdateAccountServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
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
            out.println("<title>Servlet UpdateAccountServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath () + "</h1>");
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
        String aid = request.getParameter("aid");
        int idAccount = Integer.parseInt(aid);

        Account account = userService.get(idAccount);
        request.setAttribute("account", account);

        request.getRequestDispatcher("/view/admin/account/update_account.jsp").forward(request, response);
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
        // Đọc các tham số từ form
        String aid = request.getParameter("aid");
        String userName = request.getParameter("userName");
        String fullName = request.getParameter("fullName");
        Part imagePart = request.getPart("avatar");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String roleID = request.getParameter("roleID");
        String address = request.getParameter("address");

        // Chuyển đổi các giá trị cần thiết sang kiểu dữ liệu phù hợp
        int idAccount = Integer.parseInt(aid);
        int idRole = Integer.parseInt(roleID);

        // Xử lý upload ảnh (nếu có)
        String fileName = ""; // Tên file ảnh mặc định
        if (imagePart != null && imagePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + "/assets/images/uploads/avatar";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            fileName = "avatar_" + System.currentTimeMillis() + "_" + Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            imagePart.write(filePath);
        }

        // Tạo đối tượng Product và cập nhật dữ liệu
        Account account = userService.get(idAccount);

        account.setUserName(userName);
        account.setFullName(fullName);
        if (!fileName.isEmpty()) {
            account.setAvatar(fileName);
        }
        account.setEmail(email);
        account.setPassword(password);
        account.setPhone(phone);
        account.setRoleID(idRole);
        account.setAddress(address);
        long millis = System.currentTimeMillis();
        java.sql.Date createDate = new java.sql.Date(millis);
        account.setCreateDate(createDate);

//         Gọi phương thức cập nhật trong UserService
        userService.updateAdmmin(account);

        // Chuyển hướng về trang danh sách sản phẩm
        response.sendRedirect(request.getContextPath() + "/admin/account/list");
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
