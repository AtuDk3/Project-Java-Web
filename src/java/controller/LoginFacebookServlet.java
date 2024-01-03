/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import model.Account;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "LoginFacebookServlet", urlPatterns = {"/login_facebook"})
public class LoginFacebookServlet extends HttpServlet {

    private String FACEBOOK_APP_ID = "777265654415501";
    private String FACEBOOK_APP_SECRET = "bb57e7cf470cec44694151934c51badc";
    private String FACEBOOK_REDIRECT_URI = "http://localhost:8080/Ecommer_Website/login_facebook";

    UserService userService = new UserServiceImpl();

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
            out.println("<title>Servlet LoginFacebookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginFacebookServlet at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập Facebook
            String facebookLoginURL = "https://www.facebook.com/v12.0/dialog/oauth?"
                    + "client_id=" + FACEBOOK_APP_ID
                    + "&redirect_uri=" + FACEBOOK_REDIRECT_URI
                    + "&scope=email+public_profile"; // Thêm phạm vi cần

            response.sendRedirect(facebookLoginURL);
        } else {
            // Người dùng đã đăng nhập, xử lý mã code để lấy thông tin người dùng
            String accessToken = getAccessToken(code);
            Account facebookAccount = getUserProfile(accessToken);

            // Xử lý thông tin người dùng, ví dụ: lưu vào session
            HttpSession session = request.getSession(false);

            boolean emailExists = userService.checkExitsEmail(facebookAccount.getEmail());
            boolean phoneExists = userService.checkExitsPhone(facebookAccount.getPhone());

            if (!emailExists && !phoneExists) {
                long millis = System.currentTimeMillis();
                java.sql.Date createDate = new java.sql.Date(millis);
                facebookAccount.setCreateDate(createDate);
                session.setAttribute("account", facebookAccount);
                userService.insert(facebookAccount);
                response.sendRedirect(request.getContextPath() + "/waiting");
                return;
            } else if (emailExists) {
                Account account = userService.getEmail(facebookAccount.getEmail());
                session.setAttribute("account", account);
                response.sendRedirect(request.getContextPath() + "/waiting");
                return;
            } else if (phoneExists) {
                Account account = userService.getPhone(facebookAccount.getPhone());
                session.setAttribute("account", account);
                response.sendRedirect(request.getContextPath() + "/waiting");
                return;
            }
        }
    }

    private String getAccessToken(String code) throws IOException {
        String accessTokenURL = "https://graph.facebook.com/v12.0/oauth/access_token?"
                + "client_id=" + FACEBOOK_APP_ID
                + "&redirect_uri=" + FACEBOOK_REDIRECT_URI
                + "&client_secret=" + FACEBOOK_APP_SECRET
                + "&code=" + code;

        String response = makeRequest(accessTokenURL);
        JsonObject jsonResponse = JsonParser.parseString(response).getAsJsonObject();

        return jsonResponse.get("access_token").getAsString();
    }

    private Account getUserProfile(String accessToken) throws IOException {
        String userProfileURL = "https://graph.facebook.com/v12.0/me?fields=id,name,email&access_token=" + accessToken;
        String jsonResponse = makeRequest(userProfileURL);

        JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();

        Account facebookAccount = new Account();
        facebookAccount.setUserName(jsonObject.get("name").getAsString());
        if (jsonObject.has("email") && !jsonObject.get("email").isJsonNull()) {
            facebookAccount.setEmail(jsonObject.get("email").getAsString());
        }

        // Kiểm tra xem trường phone có tồn tại trong JSON response hay không
        if (jsonObject.has("phone") && !jsonObject.get("phone").isJsonNull()) {
            facebookAccount.setPhone(jsonObject.get("phone").getAsString());
        }
        String userId = jsonObject.get("id").getAsString();
        String avatarUrl = "https://graph.facebook.com/" + userId + "/picture?type=large";
        facebookAccount.setAvatar(avatarUrl);
        facebookAccount.setRoleID(2);

        return facebookAccount;
    }

    private String makeRequest(String url) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        con.setRequestMethod("GET");

        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8))) {
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            return URLDecoder.decode(response.toString(), StandardCharsets.UTF_8.name());
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
