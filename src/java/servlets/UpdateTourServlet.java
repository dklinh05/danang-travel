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

@WebServlet("/UpdateTourServlet")
public class UpdateTourServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tourIdStr = request.getParameter("tourId");
        String tourName = request.getParameter("tourName");
        String description = request.getParameter("description");
        String priceAdultStr = request.getParameter("priceAdult");
        String priceChildStr = request.getParameter("priceChild");
        String priceInfantStr = request.getParameter("priceInfant");
        String imageUrl = request.getParameter("imageUrl");
        
        int tourId = Integer.parseInt(tourIdStr);
        int priceAdult = Integer.parseInt(priceAdultStr);
        int priceChild = Integer.parseInt(priceChildStr);
        int priceInfant = Integer.parseInt(priceInfantStr);
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "UPDATE tours SET tour_name = ?, description = ?, price_adult = ?, price_child = ?, price_infant = ?, image_url = ? WHERE tour_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, tourName);
                    ps.setString(2, description);
                    ps.setInt(3, priceAdult);
                    ps.setInt(4, priceChild);
                    ps.setInt(5, priceInfant);
                    ps.setString(6, imageUrl);
                    ps.setInt(7, tourId);
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //response.sendRedirect(request.getContextPath() + "/adminDashboard");
        //request.getRequestDispatcher("admin.jsp").forward(request, response);
        response.sendRedirect("adminDashboard");
    }
}
