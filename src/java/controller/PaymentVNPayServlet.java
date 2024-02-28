/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "PaymentVNPayServlet", urlPatterns = {"/member/payment_vnp"})
public class PaymentVNPayServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentVNPayServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentVNPayServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Các biến cơ bản
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String orderType = request.getParameter("ordertype");

        // Sinh số giao dịch ngẫu nhiên
        String vnp_TxnRef = String.format("%08d", new Random().nextInt(100000000));

        // Địa chỉ IP của client
        String vnp_IpAddr = request.getRemoteAddr();

        // Mã cửa hàng
        String vnp_TmnCode = "KL7Q2C0H";

        // Số tiền thanh toán (đơn vị là VND)
        int amount = 10000;

        // Các tham số gửi đến VNPay
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        // Ngôn ngữ
        String locate = request.getParameter("language");
        vnp_Params.put("vnp_Locale", (locate != null && !locate.isEmpty()) ? locate : "vn");

        // URL trả về sau thanh toán
        vnp_Params.put("vnp_ReturnUrl", "http://localhost:8080/Ecommer_Website/thanks");

        // Ngày tạo giao dịch và ngày hết hạn
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        vnp_Params.put("vnp_CreateDate", formatter.format(cld.getTime()));
        cld.add(Calendar.MINUTE, 15);
        vnp_Params.put("vnp_ExpireDate", formatter.format(cld.getTime()));

        // Thông tin thanh toán và billing
        vnp_Params.put("vnp_Bill_Mobile", request.getParameter("txt_billing_mobile"));
        vnp_Params.put("vnp_Bill_Email", request.getParameter("txt_billing_email"));
        String fullNameParam = request.getParameter("txt_billing_fullname");
        String fullName = (fullNameParam != null) ? fullNameParam.trim() : "";
        if (!fullName.isEmpty()) {
            int idx = fullName.indexOf(' ');
            vnp_Params.put("vnp_Bill_FirstName", fullName.substring(0, idx));
            vnp_Params.put("vnp_Bill_LastName", fullName.substring(fullName.lastIndexOf(' ') + 1));
        }

        // Tình trạng hóa đơn và thông tin invoice
        if (request.getParameter("txt_bill_state") != null && !request.getParameter("txt_bill_state").isEmpty()) {
            vnp_Params.put("vnp_Bill_State", request.getParameter("txt_bill_state"));
        }
        vnp_Params.put("vnp_Inv_Phone", request.getParameter("txt_inv_mobile"));
        vnp_Params.put("vnp_Inv_Email", request.getParameter("txt_inv_email"));
        vnp_Params.put("vnp_Inv_Customer", request.getParameter("txt_inv_customer"));
        vnp_Params.put("vnp_Inv_Address", request.getParameter("txt_inv_addr1"));
        vnp_Params.put("vnp_Inv_Company", request.getParameter("txt_inv_company"));
        vnp_Params.put("vnp_Inv_Taxcode", request.getParameter("txt_inv_taxcode"));
        vnp_Params.put("vnp_Inv_Type", request.getParameter("cbo_inv_type"));

        // Xây dựng data để hash và querystring
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        for (String fieldName : fieldNames) {
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString())).append('&');
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString())).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString())).append('&');
            }
        }

        // Thêm chữ ký bảo mật và tạo URL thanh toán
        String vnp_HashSecret = "AEUBYNCHWCKEYRJMSAEDWPKIXRVSCOCR";
        String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/Transaction/PaymentMethod.html";
        String vnp_SecureHash = hmacSHA512(vnp_HashSecret, hashData.toString());
        query.append("vnp_SecureHash=").append(vnp_SecureHash);
        String paymentUrl = vnp_PayUrl + "?" + query.toString();

        // Trả về kết quả dưới dạng JSON và thực hiện chuyển hướng
        JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);

// Thực hiện chuyển hướng từ phía máy chủ
        response.sendRedirect(paymentUrl);
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

    public String hmacSHA512(String secretKey, String data) {
        try {
            Mac sha512_HMAC = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            sha512_HMAC.init(secretKeySpec);

            byte[] hashBytes = sha512_HMAC.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            return null;
        }
    }

}
