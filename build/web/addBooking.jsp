<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Booking</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            /* Pastel gradient background for a colorful look */
            body {
                background: linear-gradient(120deg, #a1ffce 0%, #faffd1 100%);
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }
            .page-title {
                margin-top: 40px;
                margin-bottom: 20px;
                text-align: center;
                font-weight: 600;
                color: #343a40;
                text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            }
            .card {
                background: #ffffff; /* White background inside card */
                border: none;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.15);
                padding: 25px;
            }
            .card-header {
                background: #e0f7fa; /* Light teal background for header */
                border-radius: 8px 8px 0 0;
                padding: 15px;
                text-align: center;
                margin: -25px -25px 20px -25px;
            }
            .card-header h2 {
                margin: 0;
                color: #006064;
                font-weight: 700;
            }
            label {
                font-weight: 500;
                color: #495057;
            }
            .form-control {
                border-radius: 5px;
            }
            .btn-custom {
                border-radius: 25px;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            .btn-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }
            .btn-success {
                background-color: #69c779;
                border-color: #59b26a;
            }
            .btn-success:hover {
                background-color: #56a567;
                border-color: #4a945d;
            }
            .btn-secondary {
                background-color: #bbb;
                border-color: #aaa;
            }
            .btn-secondary:hover {
                background-color: #aaa;
                border-color: #999;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="page-title">Add New Booking</h1>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <!-- Colored header inside card -->
                        <div class="card-header">
                            <h2>Add Booking Details</h2>
                        </div>
                        <form action="addBooking" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tourId">Tour ID:</label>
                                    <input type="number" class="form-control" id="tourId" name="tourId" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="name">Full Name:</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Phone:</label>
                                    <input type="text" class="form-control" id="phone" name="phone" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="gender">Gender:</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khác">Khác</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="dob">Date of Birth:</label>
                                    <input type="date" class="form-control" id="dob" name="dob" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address:</label>
                                    <input type="text" class="form-control" id="address" name="address" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="adultCount">Adults:</label>
                                    <input type="number" class="form-control" id="adultCount" name="adultCount" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="childCount">Children:</label>
                                    <input type="number" class="form-control" id="childCount" name="childCount" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="infantCount">Infants:</label>
                                    <input type="number" class="form-control" id="infantCount" name="infantCount" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="totalPrice">Total Price:</label>
                                    <input type="number" class="form-control" id="totalPrice" name="totalPrice" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bookingDate">Booking Date:</label>
                                    <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between mt-3">
                                <button type="submit" class="btn btn-success btn-custom">Add Booking</button>
                                <a href="adminDashboard" class="btn btn-secondary btn-custom">Back</a>
                            </div>
                        </form>
                    </div> <!-- end card -->
                </div> <!-- end col-md-8 -->
            </div> <!-- end row -->
        </div> <!-- end container -->

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
