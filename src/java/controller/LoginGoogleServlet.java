/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "LoginGoogle", urlPatterns = {"/login_google"})
public class LoginGoogleServlet extends HttpServlet {

    public String GOOGLE_CLIENT_ID = "288596023635-pb9seo9cn3ntnb6927ap5tr6diclgnq3.apps.googleusercontent.com";

    public String GOOGLE_CLIENT_SECRET = "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";

    public String GOOGLE_REDIRECT_URI = "http://localhost:8080/Ecommer_Website/login_google";

    public String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public String GOOGLE_GRANT_TYPE = "authorization_code";

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

    }

    public String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public Account getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);

        // Loại bỏ trường "id" từ đối tượng JSON
        if (jsonObject.has("id")) {
            jsonObject.remove("id");
        }

        Account googleAccount = new Gson().fromJson(jsonObject, Account.class);
        googleAccount.setEmail(jsonObject.get("email").getAsString());
        googleAccount.setUserName(jsonObject.get("name").getAsString());
        googleAccount.setFullName(jsonObject.get("given_name").getAsString());
        googleAccount.setAvatar(jsonObject.get("picture").getAsString());
        googleAccount.setRoleID(2);

        return googleAccount;
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
    private String getJsonStringFromGoogleApi(String accessToken) throws IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        return Request.Get(link).execute().returnContent().asString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        Account googleAccount = getUserInfo(accessToken);

        boolean emailExists = userService.checkExitsEmail(googleAccount.getEmail());
        boolean userNameExists = userService.checkExitsUserName(googleAccount.getUserName());
        boolean phoneExists = userService.checkExitsPhone(googleAccount.getPhone());
        
        HttpSession session = request.getSession(false);

        if (!emailExists && !userNameExists && !phoneExists) {
            session.setAttribute("account", googleAccount);
            userService.insert(googleAccount);
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        else if (emailExists){
            Account account = userService.getEmail(googleAccount.getEmail());
            session.setAttribute("account", account);
            response.sendRedirect(request.getContextPath() + "/waiting");
            return;
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
