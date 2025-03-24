<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.connect.DBContext" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đặt Tour Thành Công</title>
        <link rel="stylesheet" href="css/content.css">
    </head>
    <body>
        <style>
            /* Loại bỏ gạch đầu dòng của danh sách */
            ul {
                list-style-type: none; /* Ẩn dấu đầu dòng */
                padding: 0; /* Loại bỏ padding mặc định */
                margin: 0; /* Loại bỏ margin mặc định */
            }

            /* CSS cho nút btn-primary */
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                cursor: pointer;
                border: none;
            }

            .btn-primary {
                background-color: #007bff; /* Màu xanh dương */
                color: white; /* Chữ màu trắng */
            }

            .btn-primary:hover {
                background-color: #0056b3; /* Màu xanh dương đậm khi hover */
            }

        </style>
        <%--<jsp:include page="header.jsp"/>--%>

        <div class="container">
            <h2>Đặt Tour Thành Công!</h2>
            <p>Cảm ơn bạn đã đặt tour với chúng tôi. Dưới đây là thông tin đặt tour của bạn:</p>

            <%
                String bookingId = request.getParameter("bookingId");
                int totalPrice = 0;

                if (bookingId == null || bookingId.isEmpty()) {
                    out.println("<p>Lỗi: Không tìm thấy thông tin đặt tour.</p>");
                } else {
                    try (Connection conn = new com.connect.DBContext().getConnection();
                         PreparedStatement ps = conn.prepareStatement("SELECT * FROM bookings WHERE booking_id = ?")) {
                    
                        ps.setInt(1, Integer.parseInt(bookingId));
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                totalPrice = rs.getInt("total_price");
            %>
            <ul>
                <li><strong>Mã Tour:</strong> <%= rs.getInt("booking_id") %></li>
                <li><strong>Mã Tour:</strong> <%= rs.getInt("tour_id") %></li>
                <li><strong>Họ và tên:</strong> <%= rs.getString("name") %></li>
                <li><strong>Số điện thoại:</strong> <%= rs.getString("phone") %></li>
                <li><strong>Giới tính:</strong> <%= rs.getString("gender") %></li>
                <li><strong>Ngày sinh:</strong> <%= rs.getDate("dob") %></li>
                <li><strong>Địa chỉ:</strong> <%= rs.getString("address") %></li>
                <li><strong>Người lớn:</strong> <%= rs.getInt("adult_count") %></li>
                <li><strong>Trẻ em:</strong> <%= rs.getInt("child_count") %></li>
                <li><strong>Trẻ nhỏ:</strong> <%= rs.getInt("infant_count") %></li>
                <li><strong>Tổng tiền:</strong> <%= totalPrice %> VND</li>
            </ul>

            <!-- Nút Thanh Toán VNPay -->
            <form action="VNPayPaymentServlet" method="POST">
                <input type="hidden" name="bookingId" value="<%= rs.getInt("booking_id") %>">
                <input type="hidden" name="amount" value="<%= totalPrice %>">
                <button type="submit" class="btn btn-primary">Thanh toán với VNPay</button>
            </form>

            <%
                            } else {
                                out.println("<p>Không tìm thấy thông tin đặt tour!</p>");
                            }
                        }
                    } catch (Exception e) {
                        out.println("<p>Lỗi khi truy vấn dữ liệu!</p>");
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </body>
</html>
