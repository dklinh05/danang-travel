package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        String name = request.getParameter("name");
        String totalPriceStr = request.getParameter("totalPrice");

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            int totalPrice = Integer.parseInt(totalPriceStr);

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "UPDATE bookings SET name = ?, total_price = ? WHERE booking_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, name);
                    ps.setInt(2, totalPrice);
                    ps.setInt(3, bookingId);
                    int rowsUpdated = ps.executeUpdate();

                    if (rowsUpdated > 0) {
                        System.out.println("Booking updated successfully!");
                    } else {
                        System.out.println("No booking found with ID: " + bookingId);
                    }
                }
            }

            response.sendRedirect("adminDashboard");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=Invalid input format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=Database error");
        }
    }
}
