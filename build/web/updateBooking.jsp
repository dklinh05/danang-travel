<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.entity.Booking" %>
<%
    String id = request.getParameter("id");
    Booking booking = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;", "sa", "123");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM bookings WHERE booking_id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            booking = new Booking(
                rs.getInt("booking_id"),
                rs.getInt("tour_id"),
                rs.getString("name"),
                rs.getInt("total_price"),
                rs.getTimestamp("booking_date")
            );
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Booking</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1>Update Booking</h1>
            <form action="<%= request.getContextPath() %>/UpdateBookingServlet" method="post">
                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>" />
                <div class="form-group">
                    <label for="tourId">Tour ID</label>
                    <input type="text" class="form-control" name="tourId" id="tourId" value="<%= booking.getTourId() %>" readonly />
                </div>
                <div class="form-group">
                    <label for="name">Customer Name</label>
                    <input type="text" class="form-control" name="name" id="name" value="<%= booking.getName() %>" required />
                </div>
                <div class="form-group">
                    <label for="totalPrice">Total Price</label>
                    <input type="number" class="form-control" name="totalPrice" id="totalPrice" value="<%= booking.getTotalPrice() %>" required />
                </div>
                <button type="submit" class="btn btn-primary">Update Booking</button>
            </form>
        </div>
    </body>
</html>
