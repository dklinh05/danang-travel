<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt Tour Thất Bại</title>
        <link rel="stylesheet" href="css/content.css"> <!-- Link file CSS nếu có -->
    </head>
    <body>
            <jsp:include page="header.jsp"/>
        <div class="container">
            <h2 style="color: red;">Đặt tour thất bại!</h2>
            <p>Xin lỗi, có lỗi xảy ra khi đặt tour. Vui lòng thử lại.</p>
            <a href="index.jsp" class="btn">Quay lại trang chủ</a>
            <a href="confirmBooking.jsp" class="btn">Thử lại</a>
        </div>
        
            <jsp:include page="footer.jsp"/>
    </body>
</html>
