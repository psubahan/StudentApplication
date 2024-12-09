<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
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
            background-image:url("https://www.iaepnetwork.org/uploads/1/1/8/6/118657739/dec-2-2020-webinar-image-1_orig.jpg");
        	background-repeat: no-repeat;
			background-size: cover;
        
        }
        .form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 10px 60px;
        }
        .form h1 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            text-decoration: underline;
        }
        .form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form input[type="text"], .form input[type="password"], .form input[type="email"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }
        .form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .form .links {
            text-align: center;
            margin-top: 10px;
        }
        .form .links a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
            margin: 0 10px;
        }
        .form .links a:hover {
            text-decoration: underline;
        }
       
    </style>
</head>
<body>
    <form action="login" class="form" method="post">
    
        <h1>Login</h1>
        <%String success=(String)request.getAttribute("success");
    	if(success!=null){%>
    	<h1 class="succuss" style="color: red"><%=success%></h1>
    	<% }%>
        <%String failure=(String)request.getAttribute("failure");
    	if(failure!=null){%>
    	<h1 class="failuremsg" style="color: red"><%=failure%></h1>
    	<% }%>
        <label for="mailid">Student Mail ID:</label>
        <input type="email"  name="mailid" placeholder="examp@gmail.com" required>
        <label for="password">Enter Password:</label>
        <input type="password" name="password" placeholder="create password" required>
        <input type="submit" value="Login">
        
        <div class="links">
            <a href="forgotpassword.jsp">Forgot Password?</a>
            <a href="signup.jsp">Sign Up</a>
        </div>
    </form>
</body>
</html>