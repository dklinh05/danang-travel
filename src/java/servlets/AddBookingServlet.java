package servlets;

import com.controller.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet("/addBooking")
public class AddBookingServlet extends HttpServlet {

    private static final String DB_URL ="jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tourId = Integer.parseInt(request.getParameter("tourId"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String address = request.getParameter("address");
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        Timestamp bookingDate = Timestamp.valueOf(request.getParameter("bookingDate") + " 00:00:00");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO bookings (tour_id, name, phone, gender, dob, address, adult_count, child_count, infant_count, total_price, booking_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, tourId);
                stmt.setString(2, name);
                stmt.setString(3, phone);
                stmt.setString(4, gender);
                stmt.setDate(5, dob);
                stmt.setString(6, address);
                stmt.setInt(7, adultCount);
                stmt.setInt(8, childCount);
                stmt.setInt(9, infantCount);
                stmt.setInt(10, totalPrice);
                stmt.setTimestamp(11, bookingDate);
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminDashboard");
    }
}
