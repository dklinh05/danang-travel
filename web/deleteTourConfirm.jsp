<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Xác nhận xóa Tour</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-danger">Cảnh báo!</h2>
            <p>Tour có ID <strong><%= request.getAttribute("tourId") %></strong> đang có <strong><%= request.getAttribute("bookingCount") %></strong> booking liên quan.</p>
            <p>Bạn có chắc chắn muốn xóa tour này và tất cả các booking liên quan không?</p>

            <%-- Hiển thị danh sách booking liên quan --%>
            <%
                String tourIdStr = (String) request.getAttribute("tourId");
                if(tourIdStr == null) {
                    tourIdStr = request.getParameter("id");
                }
                if(tourIdStr != null) {
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String DB_URL =  "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;";
                        String DB_USER = "sa";
                        String DB_PASSWORD = "123";
                        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                        PreparedStatement ps = conn.prepareStatement("SELECT booking_id, name, total_price, booking_date FROM bookings WHERE tour_id = ?");
                        ps.setInt(1, Integer.parseInt(tourIdStr));
                        ResultSet rs = ps.executeQuery();
                        
                        out.println("<h4>Danh sách Booking liên quan:</h4>");
                        out.println("<table class='table table-bordered'>");
                        out.println("<thead><tr><th>Booking ID</th><th>Tên khách</th><th>Total Price</th><th>Booking Date</th></tr></thead>");
                        out.println("<tbody>");
                        while(rs.next()){
                           out.println("<tr>");
                           out.println("<td>" + rs.getInt("booking_id") + "</td>");
                           out.println("<td>" + rs.getString("name") + "</td>");
                           out.println("<td>" + rs.getInt("total_price") + "</td>");
                           out.println("<td>" + rs.getTimestamp("booking_date") + "</td>");
                           out.println("</tr>");
                        }
                        out.println("</tbody></table>");
                        rs.close();
                        ps.close();
                        conn.close();
                    } catch(Exception ex) {
                        ex.printStackTrace();
                    }
                }
            %>

            <form action="<%= request.getContextPath() %>/adminDashboard" method="get">
                <input type="hidden" name="action" value="deleteTour">
                <input type="hidden" name="id" value="<%= request.getAttribute("tourId") %>">
                <input type="hidden" name="confirm" value="true">
                <button type="submit" class="btn btn-danger">Có, xóa luôn</button>
                <a href="<%= request.getContextPath() %>/adminDashboard" class="btn btn-secondary">Không, quay lại</a>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
