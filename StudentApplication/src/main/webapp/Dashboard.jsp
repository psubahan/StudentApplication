<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Application Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero-section {
            background: linear-gradient(to right, #00796b, #004d40);
            color: white;
            padding: 50px 0;
        }
        .hero-section h1 {
            font-size: 2.5rem;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
        }
        .card:hover {
            transform: translateY(-5px);
            transition: 0.3s ease-in-out;
        }
        footer a {
            color: #fff;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<% student s = (student) session.getAttribute("student"); %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">EduLMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <% if (s.getId() == 1) { %>
                <li class="nav-item"><a href="viewusers.jsp" class="nav-link">View All Data</a></li>
                <% } %>
                <li class="nav-item"><a href="forgotpassword.jsp" class="nav-link">Reset Pin</a></li>
                <li class="nav-item"><a href="Update.jsp" class="nav-link">Update Profile</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Notifications</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Help</a></li>
            </ul>
            <form action="logout" method="post">
                <input type="submit" name="logout" value="Logout" class="btn btn-sm ms-3" style="color : white; font-weight : bold; font-size : 16px; left : 0px; padding: 12px; ">
            </form>         
         </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1>Welcome, <%= s.getName() %></h1>
    </div>
</section>

<!-- Main Content -->
<main class="container my-5">
    <div class="row">
        <!-- Data Cards -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Your Details</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>ID:</strong> <%= s.getId() %></li>
                        <li class="list-group-item"><strong>Name:</strong> <%= s.getName() %></li>
                        <li class="list-group-item"><strong>Phone:</strong> <%= s.getPhone() %></li>
                        <li class="list-group-item"><strong>Email:</strong> <%= s.getMailId() %></li>
                        <li class="list-group-item"><strong>Branch:</strong> <%= s.getBranch() %></li>
                        <li class="list-group-item"><strong>Location:</strong> <%= s.getLocation() %></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Actions Card -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Quick Actions</h5>
                    <a href="Update.jsp" class="btn btn-primary mb-2">Update Information</a>
                    <a href="forgotpassword.jsp" class="btn btn-secondary mb-2">Reset PIN</a>
                    <a href="#" class="btn btn-info mb-2">Notifications</a>
                    <a href="#" class="btn btn-warning mb-2">Help</a>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
    <div class="container">
        <p class="mb-1">&copy; 2024 EduLMS. All Rights Reserved.</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            <li class="list-inline-item"><a href="#">Terms of Service</a></li>
            <li class="list-inline-item"><a href="#">Contact Us</a></li>
            <li class="list-inline-item"><a href="#">eduLMS@gmail.in</a></li>
        </ul>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
