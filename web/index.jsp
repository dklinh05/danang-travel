<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.Tour" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danang Trip Planner</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@800&display=swap" />
</head>
<body>
    <% if (request.getAttribute("tours") == null) {
        response.sendRedirect("TourListServlet");
        return;
    } %>

        <div class="header">

           <% if (session.getAttribute("userID") != null) { %>
        <form action="LogoutServlet" method="post" class="logout-form">
            <button type="submit" class="btn-logout">Đăng xuất</button>
        </form>
    <% } %>

        </div>

    <div class="carousel">
        <button id="prevBtn">❮</button>
        <img id="carouselImage" src="img/beach.png" alt="Beach">
        <p class="welcome-text">
            Chào mừng, <%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : "Khách" %>
        </p>
        <button id="nextBtn">❯</button>
    </div>

    <script>
        const images = ["img/beach.png", "img/dragon-bridge.png", "img/bana-hills.png"];
        let currentIndex = 0;
        setInterval(function () {
            currentIndex = (currentIndex + 1) % images.length;
            document.getElementById("carouselImage").src = images[currentIndex];
        }, 3000);

        document.getElementById("nextBtn").addEventListener("click", function () {
            currentIndex = (currentIndex + 1) % images.length;
            document.getElementById("carouselImage").src = images[currentIndex];
        });

        document.getElementById("prevBtn").addEventListener("click", function () {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            document.getElementById("carouselImage").src = images[currentIndex];
        });
    </script>

    <div class="gradient-banner">
        <div class="banner-text">Địa điểm dành cho bạn</div>
    </div>

    <div class="row justify-content-center g-3">
        <% List<Tour> tours = (List<Tour>) request.getAttribute("tours");
           if (tours != null && !tours.isEmpty()) {
               for (Tour tour : tours) { %>
            <div class="col-lg-3 col-md-4 col-sm-6 d-flex justify-content-center p-3">
                <div class="tour-card">
                    <img src="<%= tour.getImageUrl() %>" alt="<%= tour.getTourName() %>">
                    <div class="tour-title"><%= tour.getTourName() %></div>
                    <p><%= tour.getDescription() %></p>
                    <p><strong>Giá vé:</strong></p>
                    <ul>
                        <li>Người lớn: <%= tour.getPriceAdult() %> VND</li>
                        <li>Trẻ em: <%= tour.getPriceChild() %> VND</li>
                        <li>Trẻ nhỏ: <%= tour.getPriceInfant() %> VND</li>
                    </ul>
                    <a href="bookTour?tourId=<%= tour.getTourId() %>" class="btn-book">Đặt Tour</a>
                </div>
            </div>
        <% }} else { %>
            <p>Không có tour nào để hiển thị.</p>
        <% } %>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>
