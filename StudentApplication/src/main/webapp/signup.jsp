<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign-Up Page</title>
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
            background-image: url("https://nalandaopenuniversity.cloudhostdns.net/themes/student/global/img/login/1.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        .form {
            background: #fff;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            max-width: 90%;
            text-align: center;
            position: relative;
 			top:55px ;
        }
        .form h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            text-align: left;
        }
        .form input, .form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form button:hover {
            background-color: #218838;
        }
        .form h4 {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }
        .form h4 a {
            color: #FF1A00;
            text-decoration: none;
        }
        .form h4 a:hover {
            text-decoration: underline;
        }
        .success {
            color: green;
            font-size: 16px;
            margin-bottom: 15px;
        }
        .failure {
            color: red;
            font-size: 16px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form action="signup" class="form" method="POST">
        <h1>Welcome to the Student Application Form</h1>
        
        <%-- Display success or failure messages dynamically --%>
        <% String success = (String) request.getAttribute("success"); 
           if (success != null) { %>
           <div class="success"><%= success %></div>
        <% } %>
        
        <% String failure = (String) request.getAttribute("failure"); 
           if (failure != null) { %>
           <div class="failure"><%= failure %></div>
        <% } %>

      <label for="name">Full Name:</label>
		<input type="text" id="name" name="name" placeholder="Enter your name" pattern="[A-Za-z\s]+" title="Please enter a valid name with only letters and spaces" required>

        
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phoneNumber" placeholder="1234567890" min="10" maxlength="10" required>
        
        <label for="email">Email Address:</label>
        <input type="email" id="email" name="email" placeholder="example@mail.com" required>
        
        <label for="branch">Branch:</label>
        <select id="branch" name="branch" required>
            <option value="" disabled selected>Select your branch</option>
            <option>Computer Science</option>
            <option>Information Technology</option>
            <option>Electronics and Communication</option>
            <option>Mechanical Engineering</option>
            <option>Civil Engineering</option>
            <option>Electrical Engineering</option>
        </select>

        <label for="location">Location:</label>
        <select id="location" name="location" required>
            <option value="" disabled selected>Select your location</option>
            <option>Bengaluru</option>
            <option>Mysore</option>
            <option>Kolar</option>
            <option>Hyderabad</option>
            <option>Nellore</option>
            <option>Ongole</option>
            <option>Mumbai</option>
            <option>Kadapa</option>
        </select>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Create a password" required>
        
        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm-password" name="confirm_password" placeholder="Re-enter your password" required>

        <button type="submit">Sign Up</button>
        
        <h4>Already have an account? <a href="login.jsp">Log In</a></h4>
    </form>
</body>
</html>
