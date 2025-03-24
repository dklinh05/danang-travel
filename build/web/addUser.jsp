<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Add User</title>
        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <style>
            body {
                background: linear-gradient(120deg, #a1ffce, #faffd1);
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
                background: #ffffff;
                border: none;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
                padding: 25px;
                margin-bottom: 30px;
            }
            .card-header {
                background: #e0f7fa;
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
            <h1 class="page-title">Add New User</h1>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h2>User Details</h2>
                        </div>
                        <form action="addUser" method="post">
                            <div class="form-group">
                                <label for="userId">User ID:</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="userId"
                                    name="userId"
                                    required
                                    />
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    name="password"
                                    required
                                    />
                            </div>
                            <div class="form-group">
                                <label for="role">Role:</label>
                                <select class="form-control" id="role" name="role">
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                </select>
                            </div>
                            <div class="d-flex justify-content-between mt-3">
                                <button type="submit" class="btn btn-success btn-custom">
                                    Add User
                                </button>
                                <a href="adminDashboard" class="btn btn-secondary btn-custom">
                                    Back
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
