package com.controller;

import com.connect.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/confirmBooking")
public class ConfirmBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tourId = request.getParameter("tourId");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");

        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));

        int priceAdult = Integer.parseInt(request.getParameter("priceAdult"));
        int priceChild = Integer.parseInt(request.getParameter("priceChild"));
        int priceInfant = Integer.parseInt(request.getParameter("priceInfant"));

        int totalPrice = (adultCount * priceAdult) + (childCount * priceChild) + (infantCount * priceInfant);

        if (tourId == null || tourId.isEmpty()) {
            request.setAttribute("error", "Tour ID is missing!");
            request.getRequestDispatcher("bookingFailed.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            DBContext dbContext = new DBContext();
            conn = dbContext.getConnection();

            // Thêm dữ liệu vào bảng bookings và lấy booking_id vừa tạo
            String sql = "INSERT INTO bookings (tour_id, name, phone, gender, dob, address, adult_count, child_count, infant_count, total_price) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, Integer.parseInt(tourId));
            ps.setString(2, fullName);
            ps.setString(3, phone);
            ps.setString(4, gender);
            ps.setDate(5, java.sql.Date.valueOf(dob));
            ps.setString(6, address);
            ps.setInt(7, adultCount);
            ps.setInt(8, childCount);
            ps.setInt(9, infantCount);
            ps.setInt(10, totalPrice);

            int result = ps.executeUpdate();

            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int bookingId = rs.getInt(1);
                    response.sendRedirect("bookingSuccess.jsp?bookingId=" + bookingId);
                    return;
                }
            }

            request.getRequestDispatcher("bookingFailed.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi insert vào database: " + e.getMessage());
            request.getRequestDispatcher("bookingFailed.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}