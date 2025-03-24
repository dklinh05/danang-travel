<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="css/admin.css" />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Custom Admin JavaScript -->
        <script src="js/admin.js"></script>

        <style>
            /* Preloader styles */
            #preloader {
                position: fixed;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
                display: none; /* We'll show it with jQuery */
            }
            #preloader img {
                width: 90%;
                margin-left: 6%;
                margin-top: -11%;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Preloader fade in/out
                $("#preloader").fadeIn(1000, function () {
                    setTimeout(function () {
                        $("#preloader").fadeOut(1500, function () {
                            $("#mainContent").fadeIn(500);
                        });
                    }, 3000);
                });
            });
        </script>
    </head>
    <body>
        <!-- Preloader -->
        <div id="preloader">
            <img src="img/preLoadingAdmin.gif" alt="Loading..." />
        </div>

        <!-- Main content is initially hidden -->
        <div id="mainContent" style="display: none;">
            <div class="header">
                <% if (session.getAttribute("userID") != null) { %>
                <form action="LogoutServlet" method="post" class="logout-form">
                    <button type="submit" class="btn-logout">Đăng xuất</button>
                </form>
                <% } %>
            </div>

            <div class="container mt-4">
                <h1><br>Admin Dashboard</h1>

                <!-- Users Section -->
                <h3>Users</h3>
                <a href="addUser.jsp" class="btn btn-success mb-2">Add User</a>
                <table class="table table-bordered table-hover fade-in" id="usersTable">
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
                                    <a href="updateUser.jsp?id=${user.userId}" class="btn btn-sm btn-primary">Edit</a>
                                    <a
                                        href="adminDashboard?action=deleteUser&id=${user.userId}"
                                        class="btn btn-sm btn-danger"
                                        onclick="return confirm('Are you sure to delete this user?');"
                                        >Delete</a
                                    >
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="usersTable-pagination"></div>

                <!-- Tours Section -->
                <h3>Tours</h3>
                <a href="addTour.jsp" class="btn btn-success mb-2">Add Tour</a>
                <table class="table table-bordered table-hover fade-in" id="toursTable">
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
                                <td><img src="${tour.imageUrl}" alt="${tour.tourName}" style="width:100px;" /></td>
                                <td>
                                    <a href="updateTour.jsp?id=${tour.tourId}" class="btn btn-sm btn-primary">Edit</a>
                                    <a
                                        href="adminDashboard?action=deleteTour&id=${tour.tourId}"
                                        class="btn btn-sm btn-danger"
                                        onclick="return confirm('Are you sure to delete this tour?');"
                                        >Delete</a
                                    >
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="toursTable-pagination"></div>

                <!-- Bookings Section -->
                <h3>Bookings</h3>
                <a href="addBooking.jsp" class="btn btn-success mb-2">Add Booking</a>
                <table class="table table-bordered table-hover fade-in" id="bookingsTable">
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
                                    <a href="updateBooking.jsp?id=${booking.bookingId}" class="btn btn-sm btn-primary">Edit</a>
                                    <a
                                        href="adminDashboard?action=deleteBooking&id=${booking.bookingId}"
                                        class="btn btn-sm btn-danger"
                                        onclick="return confirm('Are you sure to delete this booking?');"
                                        >Delete</a
                                    >
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="bookingsTable-pagination"></div>
            </div>
        </div>
    </body>
</html>
