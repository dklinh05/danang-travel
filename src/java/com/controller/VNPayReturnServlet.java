package com.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.connect.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(name = "VNPayReturnServlet", urlPatterns = {"/VNPayReturnServlet"})
public class VNPayReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Lấy tất cả tham số trả về từ VNPay
    Map<String, String> vnp_Params = new HashMap<>();
    Enumeration<String> paramNames = request.getParameterNames();

    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        String paramValue = request.getParameter(paramName);
        vnp_Params.put(paramName, paramValue);
    }

    // Kiểm tra xem VNPay có gửi dữ liệu không
    if (vnp_Params.isEmpty()) {
        request.setAttribute("message", "Lỗi: Không nhận được phản hồi từ VNPay.");
        request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
        return;
    }

    // Lấy các tham số quan trọng
    String vnp_TxnRef = vnp_Params.get("vnp_TxnRef"); // Mã đặt tour (booking_id)
    String vnp_ResponseCode = vnp_Params.get("vnp_ResponseCode"); // Mã trạng thái thanh toán
    String vnp_SecureHash = vnp_Params.get("vnp_SecureHash");

    // Kiểm tra giá trị null hoặc rỗng
    if (vnp_TxnRef == null || vnp_ResponseCode == null || vnp_SecureHash == null) {
        request.setAttribute("message", "Lỗi: Thiếu dữ liệu từ VNPay.");
        request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
        return;
    }

    // Kiểm tra chữ ký bảo mật
    vnp_Params.remove("vnp_SecureHash");
    String secureHash = Config.hmacSHA512(Config.vnp_HashSecret, buildQueryString(vnp_Params));
    boolean isValidSignature = secureHash.equalsIgnoreCase(vnp_SecureHash);

    // Nếu thanh toán thành công, cập nhật database
    if ("00".equals(vnp_ResponseCode) && isValidSignature) {
        updateBookingStatus(vnp_TxnRef, "complete");

        request.setAttribute("transaction_id", vnp_TxnRef);
        request.setAttribute("response_code", vnp_ResponseCode);
        request.setAttribute("message", "✅ Giao dịch thành công!");
        request.setAttribute("is_valid_signature", isValidSignature);
    } else {
        request.setAttribute("transaction_id", vnp_TxnRef);
        request.setAttribute("response_code", vnp_ResponseCode);
        request.setAttribute("message", "❌ Thanh toán thất bại.");
        request.setAttribute("is_valid_signature", isValidSignature);
    }

    // Chuyển hướng về paymentSuccess.jsp với thông tin kết quả
    request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
}


    private String buildQueryString(Map<String, String> params) {
        StringBuilder sb = new StringBuilder();
        params.entrySet().stream().sorted(Map.Entry.comparingByKey())
                .forEach(entry -> sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&"));
        return sb.substring(0, sb.length() - 1);
    }

    private String getMessageFromResponseCode(String responseCode) {
        switch (responseCode) {
            case "00": return "Giao dịch thành công";
            case "07": return "Giao dịch bị nghi ngờ gian lận";
            case "09": return "Thẻ/Tài khoản không hợp lệ";
            case "10": return "Khách hàng xác nhận giao dịch thất bại";
            case "24": return "Giao dịch bị từ chối vì sai thông tin";
            default: return "Lỗi không xác định";
        }
    }

   private void updateBookingStatus(String bookingId, String status) {
    try (   
            Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement("UPDATE bookings SET payment_status = ? WHERE booking_id = ?")) {
        
        ps.setString(1, status);
        ps.setInt(2, Integer.parseInt(bookingId));
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Booking ID " + bookingId + " updated successfully!");
        } else {
            System.out.println("No booking found with ID: " + bookingId);
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
