<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS for animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <style>
        body {
            background-image: url("https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080");
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            color: #333;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .form-container:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.3);
        }
        .form-container h1 {
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
        }
        .form-container input {
            margin-bottom: 15px;
        }
        .form-container .btn {
            width: 100%;
            background: linear-gradient(90deg, #007bff, #0056b3);
            color: #fff;
        }
        .form-container .btn:hover {
            background: linear-gradient(90deg, #0056b3, #003c7a);
        }
        .form-container .links {
            text-align: center;
            margin-top: 10px;
        }
        .form-container .links a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .form-container .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container" data-aos="fade-up">
        <h1>Login</h1>
        <% String success = (String) request.getAttribute("success");
           if (success != null) { %>
            <div class="alert alert-success" role="alert">
                <%= success %>
            </div>
        <% } %>
        <% String failure = (String) request.getAttribute("failure");
           if (failure != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= failure %>
            </div>
        <% } %>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="mailid" class="form-label">Student Mail ID:</label>
                <input type="email" name="mailid" class="form-control" placeholder="example@gmail.com" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Enter Password:</label>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="links mt-3">
            <a href="forgotpassword.jsp">Forgot Password?</a> | 
            <a href="signup.jsp">Sign Up</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AOS JS for animations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            easing: 'ease-in-out',
        });
    </script>
</body>
</html>
