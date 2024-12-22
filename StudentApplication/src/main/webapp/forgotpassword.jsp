<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% student s = (student) session.getAttribute("student"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #007bff, #6c757d); /* Matching the dashboard gradient background */
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        fieldset {
            border: none;
            padding: 0;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"] {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="reset"] {
            background-color: #dc3545;
            color: white;
            margin-top: 10px;
        }

        input[type="reset"]:hover {
            background-color: #c82333;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .alert {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="forgot-password" method="POST">
        <h1>Forgot Password</h1>
        
        <% String success = (String) request.getAttribute("success"); 
           if (success != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= success %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        
        <% String failure = (String) request.getAttribute("failure"); 
           if (failure != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= failure %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <fieldset>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" disabled="disabled" value="<%=s.getMailId() %>" placeholder="Enter your email" required>
            
            <label for="phone">Phone Number:</label>
            <input type="text" name="phone" disabled="disabled" value="<%=s.getPhone()%>" placeholder="Enter your phone number" required>

            <label for="new-password">New Password:</label>
            <input type="password" id="new-password" name="new_password" placeholder="Enter new password" required>

            <label for="confirm-password">Confirm Password:</label>
            <input type="password" id="confirm-password" name="confirm_password" placeholder="Confirm your password" required>
            
            <div style="margin-top: 20px;">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </div>
        </fieldset>

        <a href="login.jsp" class="back-link">Back to Login</a>
    </form>

    <!-- Bootstrap JS (for alert dismissal) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
