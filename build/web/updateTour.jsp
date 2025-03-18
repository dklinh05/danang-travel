<!-- File: WebContent/updateTour.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.entity.Tour" %>
<%
    String tourIdStr = request.getParameter("id");
    int tourId = Integer.parseInt(tourIdStr);
    Tour tour = new Tour();
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;", "sa", "123");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM tours WHERE tour_id = ?");
        ps.setInt(1, tourId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            tour.setTourId(rs.getInt("tour_id"));
            tour.setTourName(rs.getString("tour_name"));
            tour.setDescription(rs.getString("description"));
            tour.setPriceAdult(rs.getInt("price_adult"));
            tour.setPriceChild(rs.getInt("price_child"));
            tour.setPriceInfant(rs.getInt("price_infant"));
            tour.setImageUrl(rs.getString("image_url"));
        }
        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Tour</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h1>Update Tour</h1>
            <form action="UpdateTourServlet" method="post">
                <input type="hidden" name="tourId" value="<%= tour.getTourId() %>" />
                <div class="form-group">
                    <label for="tourName">Tour Name</label>
                    <input type="text" class="form-control" name="tourName" id="tourName" value="<%= tour.getTourName() %>" required />
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" name="description" id="description" required><%= tour.getDescription() %></textarea>
                </div>
                <div class="form-group">
                    <label for="priceAdult">Price Adult</label>
                    <input type="number" class="form-control" name="priceAdult" id="priceAdult" value="<%= tour.getPriceAdult() %>" required />
                </div>
                <div class="form-group">
                    <label for="priceChild">Price Child</label>
                    <input type="number" class="form-control" name="priceChild" id="priceChild" value="<%= tour.getPriceChild() %>" required />
                </div>
                <div class="form-group">
                    <label for="priceInfant">Price Infant</label>
                    <input type="number" class="form-control" name="priceInfant" id="priceInfant" value="<%= tour.getPriceInfant() %>" required />
                </div>
                <div class="form-group">
                    <label for="imageUrl">Image URL</label>
                    <input type="text" class="form-control" name="imageUrl" id="imageUrl" value="<%= tour.getImageUrl() %>" required />
                </div>
                <button type="submit" class="btn btn-primary">Update Tour</button>
            </form>
        </div>
    </body>
</html>
