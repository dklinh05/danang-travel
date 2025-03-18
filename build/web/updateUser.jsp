<!-- File: WebContent/updateUser.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("id");
    String password = "";
    String role = "";
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:sqlserver://127.0.0.1:1435;databaseName=TourBookingDB;encrypt=true;trustServerCertificate=true;", "sa", "123");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE userID = ?");
        ps.setString(1, userId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            password = rs.getString("password");
            role = rs.getString("role");
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
        <title>Update User</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h1>Update User</h1>
            <form action="UpdateUserServlet" method="post">
                <input type="hidden" name="userId" value="<%= userId %>" />
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" class="form-control" name="password" id="password" value="<%= password %>" required />
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select class="form-control" name="role" id="role">
                        <option value="admin" <%= "admin".equals(role) ? "selected" : "" %>>admin</option>
                        <option value="user" <%= "user".equals(role) ? "selected" : "" %>>user</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Update User</button>
            </form>
        </div>
    </body>
</html>
