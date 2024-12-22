<!DOCTYPE html>
<%@page import="com.student.dto.student"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Information</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #007bff, #6c757d);
            color: #fff;
            font-family: Arial, sans-serif;
        }

        form {
            width: 50%;
            margin: 2rem auto;
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        fieldset {
            border: none;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        label {
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #333;
        }

        input[type="text"],
        input[type="tel"],
        input[type="email"] {
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            font-size: 1rem;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #0078d7;
        }

        button {
            padding: 0.7rem;
            background-color: #0078d7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        button:hover {
            background-color: #005cb2;
        }

        .form-title {
            text-align: center;
            margin-bottom: 1rem;
            font-size: 1.5rem;
            color: #333;
        }

        .back-btn {
            padding: 0.7rem;
            background-color: #6c757d;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            font-size: 1rem;
            display: inline-block;
            width: 120px;
            margin-top: 10px;
            text-align: center;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <% student s = (student) session.getAttribute("student"); %>
    <form action="update" method="post">
        <div class="form-title">Update Student Information</div>

        <!-- Success Message -->
        <% String success = (String) request.getAttribute("success");
           if (success != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= success %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <!-- Failure Message -->
        <% String failure = (String) request.getAttribute("failure");
           if (failure != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= failure %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <fieldset>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%=s.getName()%>" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="<%=s.getPhone()%>" pattern="[0-9]{10}" required>

            <label for="mail">Mail:</label>
            <input type="email" id="mail" name="mail" value="<%=s.getMailId()%>" required>

            <label for="branch">Branch:</label>
            <input type="text" id="branch" name="branch" value="<%=s.getBranch()%>" required>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="<%=s.getLocation()%>" required>

            <button type="submit">Update Account</button>

            <!-- Back Button Inside the Form -->
            <a href="Dashboard.jsp" class="back-btn">Back</a>
        </fieldset>
    </form>

    <!-- Bootstrap JS (for alert dismissal) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
