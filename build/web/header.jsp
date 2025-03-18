<%-- 
    Document   : header
    Created on : Feb 21, 2025, 11:06:03 AM
    Author     : hungt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="css/header.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus Jakarta Sans:wght@800&display=swap" />

    </head>
    <body>
        <nav class="navbar navbar-expand-lg header">
            <div class="container-fluid">
                <a class="logo-text ms-3" href="index.jsp">Logo</a>
                <div class="d-flex align-items-center me-3">
    <a href="auth/login.jsp" class="btn btn-primary">Đăng nhập</a>
    <a href="auth/signup.jsp" class="btn btn-primary">Đăng ký</a>
</div>

            </div>
        </nav>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>
