package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.entity.User;
import com.entity.Tour;
import com.entity.Booking;

/**
 *
 * @author ASUS
 */


 
@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    // Cấu hình kết nối
    private static final String DB_URL =  "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu có yêu cầu hành động (xóa) thì thực thi trước
        String action = request.getParameter("action");
        if (action != null) {
            if ("deleteTour".equals(action)) {
                // Luôn chuyển hướng tới trang xác nhận xóa tour
                performDeleteTour(request, response);
                return;
            } else {
                performDelete(request, action);
                response.sendRedirect("adminDashboard");
                return;
            }
        }

        List<User> users = new ArrayList<>();
        List<Tour> tours = new ArrayList<>();
        List<Booking> bookings = new ArrayList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Lấy dữ liệu từ bảng users
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {
                    while (rs.next()) {
                        User user = new User();
                        user.setUserId(rs.getString("userID"));
                        // Dùng trường userName để hiển thị role từ DB
                        user.setUserName(rs.getString("role"));
                        users.add(user);
                    }
                }
                // Lấy dữ liệu từ bảng tours
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM tours")) {
                    while (rs.next()) {
                        Tour tour = new Tour();
                        tour.setTourId(rs.getInt("tour_id"));
                        tour.setTourName(rs.getString("tour_name"));
                        tour.setImageUrl(rs.getString("image_url"));
                        tours.add(tour);
                    }
                }
                // Lấy dữ liệu từ bảng bookings – sử dụng constructor phụ chỉ lấy các thuộc tính cần hiển thị
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM bookings")) {
                    while (rs.next()) {
                        Booking booking = new Booking(
                                rs.getInt("booking_id"),
                                rs.getInt("tour_id"),
                                rs.getString("name"),
                                rs.getInt("total_price"),
                                rs.getTimestamp("booking_date")
                        );
                        bookings.add(booking);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đẩy dữ liệu lên request để hiển thị trong admin.jsp
        request.setAttribute("users", users);
        request.setAttribute("tours", tours);
        request.setAttribute("bookings", bookings);

        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
    }

    // Xử lý xóa các đối tượng không cần kiểm tra phụ thuộc (users, bookings)
    private void performDelete(HttpServletRequest request, String action) {
        String id = request.getParameter("id");
        String sql = null;
        if ("deleteUser".equals(action)) {
            sql = "DELETE FROM users WHERE userID = '" + id + "'";
        } else if ("deleteBooking".equals(action)) {
            sql = "DELETE FROM bookings WHERE booking_id = " + id;
        }
        if (sql != null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); Statement stmt = conn.createStatement()) {
                    stmt.executeUpdate(sql);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Xử lý xóa tour: luôn chuyển hướng tới trang xác nhận xóa
    private void performDeleteTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String confirm = request.getParameter("confirm");  // Lấy tham số xác nhận từ form xác nhận
        int count = 0;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Đếm số booking liên quan tới tour
                PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) as count FROM bookings WHERE tour_id = ?");
                ps.setInt(1, Integer.parseInt(id));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("count");
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Nếu chưa có xác nhận, luôn chuyển hướng tới trang deleteTourConfirm.jsp
        if (confirm == null || !"true".equals(confirm)) {
            request.setAttribute("tourId", id);
            request.setAttribute("bookingCount", count);
            RequestDispatcher rd = request.getRequestDispatcher("/deleteTourConfirm.jsp");
            rd.forward(request, response);
            return;
        } else {
            // Nếu đã xác nhận, thực hiện xóa các booking liên quan và xóa tour
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); Statement stmt = conn.createStatement()) {
                    stmt.executeUpdate("DELETE FROM bookings WHERE tour_id = " + id);
                    stmt.executeUpdate("DELETE FROM tours WHERE tour_id = " + id);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("adminDashboard");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
