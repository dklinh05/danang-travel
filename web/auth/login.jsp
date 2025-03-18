<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Đăng nhập</title>
          <link rel="stylesheet" href="../css/content.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!--    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">-->
</head>
<body>


    <div class="container">
        <div class="login-container">
            <h2 class="text-center">Đăng nhập</h2>
            <form action="<%= request.getContextPath() %>/auth/LoginServlet" method="post">
                <div class="mb-3">
                    <label for="userID" class="form-label">User ID:</label>
                    <input type="text" id="userID" name="userID" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="text-danger text-center mt-3"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </div>
    </div>

    <%--<jsp:include page="../footer.jsp"/>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
