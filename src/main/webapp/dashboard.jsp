<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.dto.UserDTO" %>
<%
    UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;

    if (user == null) {
        // Redirect to login if no user is found
        response.sendRedirect("LoginServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 40px;
        }
        .dashboard-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #333;
        }
        .logout-btn {
            margin-top: 20px;
            display: inline-block;
            background-color: #74d94f;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #74d94f;
        }
    </style>
</head>
<body>
<div class="dashboard-box">
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <p>You have successfully logged in.</p>

    <a class="logout-btn" href="logout">Logout</a>
</div>
</body>
</html>
