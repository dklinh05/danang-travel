<%@page import="java.sql.*"%>
<%@page import="com.connect.DBContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link rel="stylesheet" href="../css/content.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <h2>Đăng ký tài khoản</h2>
            <form action="signup.jsp" method="post">
                <div class="mb-3">
                    <label for="userID" class="form-label">Tên đăng nhập:</label>
                    <input type="text" class="form-control" id="userID" name="userID" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Vai trò:</label>
                    <select class="form-select" id="role" name="role" required>
                        <option value="user">Người dùng</option>
                        <option value="admin">Quản trị viên</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Đăng ký</button>
            </form>

            <%-- Xử lý đăng ký người dùng --%>
            <%
                if (request.getMethod().equals("POST")) {
                    String userID = request.getParameter("userID");
                    String password = request.getParameter("password");
                    String role = request.getParameter("role");
                    
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    DBContext dbContext = new DBContext();
                    try {
                        conn = dbContext.getConnection();
                        
                        String sql = "INSERT INTO users (userID, password, role) VALUES (?, ?, ?)";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, userID);
                        pstmt.setString(2, password);
                        pstmt.setString(3, role);
                        
                        int rows = pstmt.executeUpdate();
                        if (rows > 0) {
                            out.println("<p class='text-success'>Đăng ký thành công!</p>");
                        } else {
                            out.println("<p class='text-danger'>Đăng ký thất bại!</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p class='text-danger'>Lỗi: " + e.getMessage() + "</p>");
                    } finally {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                }
            %>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>