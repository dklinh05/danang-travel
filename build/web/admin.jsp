<!-- File: WebContent/admin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <!-- Sử dụng Bootstrap để tạo giao diện đẹp -->
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body>
        <div class="header">

            <% if (session.getAttribute("userID") != null) { %>
            <form action="LogoutServlet" method="post" class="logout-form">
                <button type="submit" class="btn-logout">Đăng xuất</button>
            </form>
            <% } %>

        </div>

        <div class="container mt-4">
            <h1>Admin Dashboard</h1>

            <!-- Bảng Users -->
            <h3>Users</h3>
            <table class="table table-bordered table-hover fade-in">
                <thead class="thead-dark">
                    <tr>
                        <th>UserID</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>
                                <a href="updateUser.jsp?id=${user.userId}" class="btn btn-sm btn-primary action-btn">Edit</a>
                                <a href="adminDashboard?action=deleteUser&id=${user.userId}" class="btn btn-sm btn-danger action-btn" 
                                   onclick="return confirm('Are you sure to delete this user?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Bảng Tours -->
            <h3>Tours</h3>
            <table class="table table-bordered table-hover fade-in">
                <thead class="thead-dark">
                    <tr>
                        <th>Tour ID</th>
                        <th>Tour Name</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tour" items="${tours}">
                        <tr>
                            <td>${tour.tourId}</td>
                            <td>${tour.tourName}</td>
                            <td><img src="${tour.imageUrl}" alt="${tour.tourName}" style="width:100px;"></td>
                            <td>
                                <a href="updateTour.jsp?id=${tour.tourId}" class="btn btn-sm btn-primary action-btn">Edit</a>
                                <a href="adminDashboard?action=deleteTour&id=${tour.tourId}" class="btn btn-sm btn-danger action-btn"
                                   onclick="return confirm('Are you sure to delete this tour?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Bảng Bookings -->
            <h3>Bookings</h3>
            <table class="table table-bordered table-hover fade-in">
                <thead class="thead-dark">
                    <tr>
                        <th>Booking ID</th>
                        <th>Tour ID</th>
                        <th>Name</th>
                        <th>Total Price</th>
                        <th>Booking Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.bookingId}</td>
                            <td>${booking.tourId}</td>
                            <td>${booking.name}</td>
                            <td>${booking.totalPrice}</td>
                            <td>${booking.bookingDate}</td>
                            <td>
                                <a href="updateBooking.jsp?id=${booking.bookingId}" class="btn btn-sm btn-primary action-btn">Edit</a>
                                <a href="adminDashboard?action=deleteBooking&id=${booking.bookingId}" class="btn btn-sm btn-danger action-btn"
                                   onclick="return confirm('Are you sure to delete this booking?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Các script cần thiết của Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
