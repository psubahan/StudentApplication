<%@page import="java.util.Iterator"%>
<%@page import="com.student.dto.student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.dao.StudentDAOimpl"%>
<%@page import="com.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #007bff, #6c757d);
            color: #fff;
            font-family: Arial, sans-serif;
        }
        table {
            margin: 20px auto;
            width: 90%;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .back-btn {
            margin: 20px 0;
            display: block;
            width: 120px;
            padding: 10px;
            background-color: #6c757d;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4">Student Management Dashboard</h1>

        <!-- Success Message -->
        <%String success=(String)request.getAttribute("success");
        if(success!= null){
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <%= success %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%} %>

        <!-- Failure Message -->
        <%String failure=(String)request.getAttribute("failure");
        if(failure!= null){
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <%= failure %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%} %>
        
        <a href="Dashboard.jsp" class="back-btn">Back</a>
        
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Branch</th>
                    <th>Location</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    StudentDao sdao = new StudentDAOimpl();
                    ArrayList<student> students = (ArrayList<student>) sdao.getStudent();
                    Iterator<student> it = students.iterator();
                    while (it.hasNext()) {
                        student s = it.next();
                %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getName() %></td>
                    <td><%= s.getPhone() %></td>
                    <td><%= s.getMailId() %></td>
                    <td><%= s.getBranch() %></td>
                    <td><%= s.getLocation() %></td>
                    <td>
                        <form action="deleteStudent" method="post">
                            <input type="hidden" name="eid" value="<%= s.getId() %>">
                            <input type="submit" name="delete" value="Delete" class="btn btn-danger">
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS (for alert dismissal) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
