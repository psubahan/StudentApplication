<%@page import="com.student.dto.student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Student Application DashBoard</title>
	<style type="text/css">
		body, h1, h2, h3, p, ul, li {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		
		body {
			font-family: Arial, sans-serif;
			background: linear-gradient(to right, #e0f7fa, #80deea);
			color: #333;
		}
		
		.header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 1rem;
			background: #004d40;
			color: white;
		}
		
		
		.logo {
			font-size: 1.5rem;
			font-weight: bold;
		}
		
		.nav ul {
			display: flex;
			list-style: none;
		}
		
		.nav ul li {
			margin: 0 1rem;
		}
		
		.nav ul li a {
			color: white;
			text-decoration: none;
		}
		
		.container {
			display: flex;
			flex-wrap: wrap;
		}
		
		.sidebar, .right-sidebar {
			background: #e8f5e9;
			padding: 1rem;
			flex: 1 1 20%;
			min-width: 200px;
		}
		
		.main-content {
			height: 100vh;
			flex: 1 1 60%;
			padding: 1rem;
			background: white;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.welcome{
			display:flex;
			justify-content:center;
			align-content: center;
		}
		
		.sidebar ul, .right-sidebar ul {
			list-style: none;
		}
		
		.sidebar ul li, .right-sidebar ul li {
			margin: 1rem 0;
		}
		
		.sidebar ul li a, .right-sidebar ul li a {
			text-decoration: none;
			color: #0078d7;
		}
		
		.logout {
			margin-top: 2rem;
			padding: 0.5rem;
			background: #d9534f;
			color: white;
			border: none;
			cursor: pointer;
		}
		
		button {
			padding: 0.5rem;
			background: #004d40;
			color: white;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		
		button:hover {
			background: #00695c;
		}
		
		.footer {
			text-align: center;
			padding: 1rem;
			background: #00796b;
			color: white;
			margin-top: 1rem;
		}
		.table-container {
        overflow-x: auto;
        margin: 1rem 0;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }

    .table th, .table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    .table th {
        background-color: #004d40;
        color: white;
        text-transform: uppercase;
        font-weight: bold;
    }

    .table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .table tr:hover {
        background-color: #d0f0c0;
    }

    .table td {
        color: #333;
    }

    @media (max-width: 768px) {
        .table th, .table td {
            font-size: 0.9rem;
        }
    }
	</style>
<body>
<%student s=(student)session.getAttribute("student"); %>
<header class="header">
	<div class="logo">welcome to EduLMS</div>
	<nav class="nav">
		<ul>
		<%if(s.getId()==1) {%>
			<li><a href="#">view all Data</a></li>
			<%} %>
			<li><a href="forgotpassword.jsp">Reset Pin</a></li>
			<li><a href="#">Profile</a></li>
			<li><a href="Update.jsp">update</a></li>
			<li><a href="#">Notifications</a></li>
			<li><a href="#">Help</a></li>
		</ul>
		<form action="logout" method="post">
				
					<input type="submit" name="logout" value="Logout">
		</form>
	</nav>
</header>

<main class="container">
	<aside class="sidebar">
		<ul>
			<li><a href="#">DashBoard</a></li>
			<li><a href="#">view</a></li>
			
		</ul>
	</aside>
	<section class="main-content">
    <h2 class="welcome">Welcome, [<%=s.getName() %>]</h2>
    <div class="row">
        <div class="col-md-12">
            <h3>View Your Data</h3>
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Mail ID</th>
                            <th>Branch</th>
                            <th>Location</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%=s.getId()%></td>
                            <td><%=s.getName()%></td>
                            <td><%=s.getPhone()%></td>
                            <td><%=s.getMailId()%></td>
                            <td><%=s.getBranch()%></td>
                            <td><%=s.getLocation()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

</main>

<footer class="footer">
	<p>&copy; 2024 EduLMS. All Rights Reserved.</p>
</footer>
</body>
</html>