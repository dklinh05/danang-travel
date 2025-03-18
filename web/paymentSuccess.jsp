<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả thanh toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .success {
            color: green;
            font-size: 20px;
            font-weight: bold;
        }
        .failed {
            color: red;
            font-size: 20px;
            font-weight: bold;
        }
        .container {
            padding: 20px;
            border: 1px solid #ddd;
            width: 50%;
            margin: auto;
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Kết quả thanh toán</h2>
        <p>Mã giao dịch: <strong><%= request.getAttribute("transaction_id") %></strong></p>
        <p>Mã phản hồi: <strong><%= request.getAttribute("response_code") %></strong></p>
        <p>Thông điệp: <strong><%= request.getAttribute("message") %></strong></p>
        <p>Chữ ký hợp lệ: <strong><%= request.getAttribute("is_valid_signature") %></strong></p>

        <% if ("00".equals(request.getAttribute("response_code"))) { %>
            <p class="success">🎉 Thanh toán thành công!</p>
        <% } else { %>
            <p class="failed">❌ Thanh toán thất bại.</p>
        <% } %>

        <a href="index.jsp">Quay về trang chủ</a>
    </div>
</body>
</html>
