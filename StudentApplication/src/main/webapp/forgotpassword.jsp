<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%student s=(student)session.getAttribute("student"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image:url("https://t3.ftcdn.net/jpg/04/96/42/98/360_F_496429891_8ZeKLLiE4odZMjPiUSzW68ZjGHAWHff9.jpg");
        	background-repeat: no-repeat;
			background-size: cover;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        fieldset {
            border: none;
            padding: 0;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], 
        input[type="email"], 
        input[type="password"], 
        input[type="number"], 
        input[type="tel"] {
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
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        input[type="reset"] {
            background-color: #dc3545;
            color: #fff;
        }
        input[type="reset"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <form action="forgot-password" method="POST">
        <h1>Forgot Password</h1>
        <% String success = (String) request.getAttribute("success"); 
           if (success != null) { %>
           <h1 style="color: green"><%= success %></h1>
        <% } %>
        
        <% String failure = (String) request.getAttribute("failure"); 
           if (failure != null) { %>
           <h1 style="color: red"><%= failure %></h1>
        <% } %>
        <hr>
        <fieldset>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" disabled="disabled" value="<%=s.getMailId() %>" placeholder="Enter your email" required>
            
             <label for="username">phone number:</label>
             <input type="text" name="phone" disabled="disabled" value="<%=s.getPhone()%>" placeholder="Enter your phone number" required>

            <label for="new-password">New Password:</label>
            <input type="password" id="new-password" name="new_password" "placeholder="Enter new password" required>

            <label for="confirm-password">Confirm Password:</label>
            <input type="password" id="confirm-password" name="confirm_password" placeholder="Confirm your password" required>
            
            <div style="margin-top: 20px;">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </div>
        </fieldset>
        <a href="login.jsp">login</a>
    </form>
</body>
</html>