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

@WebServlet("/addTour")
public class AddTourServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tourName = request.getParameter("tourName");
        String description = request.getParameter("description");
        int priceAdult = Integer.parseInt(request.getParameter("priceAdult"));
        int priceChild = Integer.parseInt(request.getParameter("priceChild"));
        int priceInfant = Integer.parseInt(request.getParameter("priceInfant"));
        String imageUrl = request.getParameter("imageUrl");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO tours (tour_name, description, price_adult, price_child, price_infant, image_url) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, tourName);
                stmt.setString(2, description);
                stmt.setInt(3, priceAdult);
                stmt.setInt(4, priceChild);
                stmt.setInt(5, priceInfant);
                stmt.setString(6, imageUrl);
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminDashboard");
    }
}
