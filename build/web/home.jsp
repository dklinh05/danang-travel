<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.entity.Tour" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/content.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@800&display=swap" />
    </head>
    <jsp:include page="/header.jsp"/>

        <!-- Phần Giới Thiệu Đà Nẵng -->
        <section class="about-section">
            <h1>Khám phá Đà Nẵng</h1>
            <p>
                Đà Nẵng, thành phố đáng sống nhất Việt Nam, nổi tiếng với những bãi biển tuyệt đẹp, các cây cầu độc đáo 
                và ẩm thực phong phú. Nơi đây có những điểm du lịch nổi bật như Cầu Rồng, Bà Nà Hills, 
                bán đảo Sơn Trà, và nhiều danh lam thắng cảnh hấp dẫn khác.
            </p>
        </section>

        <!-- Phần Carousel -->
<!--        <div class="carousel">
            <button id="prevBtn">❮</button>
            <img id="carouselImage" src="img/beach.png" alt="Bãi biển Đà Nẵng">
            <p class="welcome-text">Chào mừng đến với Đà Nẵng</p>
            <button id="nextBtn">❯</button>
        </div>

        <script>
            const images = ["img/beach.png", "img/dragon-bridge.png", "img/bana-hills.png", "img/chua-linh-ung.png","img/bao-tang-cham.png"];
            let currentIndex = 0;

            setInterval(function() {
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
        </script>-->


        <!-- Phần Ẩm Thực Đà Nẵng -->
        <section class="food-section">
            <h2>Ẩm thực Đà Nẵng</h2>
            <div class="food-list">
                <div class="food-item">
                    <img src="img/mi-quang.jpg" alt="Mì Quảng">
                    <p>Mì Quảng - Món ăn đặc sản của Đà Nẵng với nước dùng đậm đà.</p>
                </div>
                <div class="food-item">
                    <img src="img/banh-xeo.jpg" alt="Bánh Xèo">
                    <p>Bánh Xèo - Vỏ giòn rụm, nhân tôm thịt béo ngậy.</p>
                </div>
                <div class="food-item">
                    <img src="img/banh-trang-cuon-thit-heo.jpg" alt="Bánh Tráng Cuốn Thịt Heo">
                    <p>Bánh Tráng Cuốn Thịt Heo - Cuốn cùng rau sống và chấm nước mắm đặc biệt.</p>
                </div>
            </div>
        </section>
        
        
        <section class="activities-section">
    <h2>Hoạt động nổi bật</h2>
    <div class="activities-list">
        <div class="activity-item">
            <img src="img/cable-car.jpg" alt="Cáp Treo Bà Nà Hills">
            <p>Trải nghiệm cáp treo dài nhất thế giới tại Bà Nà Hills.</p>
        </div>
        <div class="activity-item">
            <img src="img/snorkeling.jpg" alt="Lặn Biển">
            <p>Lặn biển khám phá rạn san hô tuyệt đẹp ở Sơn Trà.</p>
        </div>
        <div class="activity-item">
            <img src="img/night-market.jpg" alt="Chợ Đêm">
            <p>Khám phá chợ đêm Đà Nẵng với vô số món ăn hấp dẫn.</p>
        </div>
    </div>
</section>

        
        <section class="reviews-section">
    <h2>Đánh giá từ du khách</h2>
    <div class="review-list">
        <div class="review-item">
            <p>"Đà Nẵng là thành phố tuyệt vời! Ẩm thực ngon, biển đẹp và con người thân thiện!"</p>
            <span>- Minh Nguyễn</span>
        </div>
        <div class="review-item">
            <p>"Tôi đã có một kỳ nghỉ đáng nhớ ở Đà Nẵng. Bà Nà Hills quá đẹp!"</p>
            <span>- Emily Tran</span>
        </div>
    </div>
</section>
        
        
        <section class="map-section">
    <h2>Bản đồ du lịch Đà Nẵng</h2>
    <div class="map-container">
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d125110.14818089252!2d108.12184524442043!3d16.04724835964237!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219f5b5ecf289%3A0xa0a89b324c1c8f85!2zxJDhuqFpIE7DoW5n!5e0!3m2!1sen!2s!4v1617932389679!5m2!1sen!2s"
            width="100%"
            height="400"
            style="border:0;"
            allowfullscreen=""
            loading="lazy">
        </iframe>
    </div>
</section>



        <jsp:include page="footer.jsp"/>
    
</html>
