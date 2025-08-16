<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.dto.UserDTO" %>
<%
    UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;

    if (user == null) {
        // Redirect to login if no user is found
        response.sendRedirect("login");
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
            background-color: #ffffff;
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
        .dashboard-btn {
            margin: 15px 10px 0;
            display: inline-block;
            background-color: #39024e;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }
        .dashboard-btn:hover {
            background-color: #c242f4;
        }
    </style>
</head>
<body>
<div class="dashboard-box">
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <p>You have successfully logged in.</p>

    <a class="dashboard-btn" href="customers?action=new">Add Customer</a>
    <a class="dashboard-btn" href="customers">List Customers</a>

    <a class="dashboard-btn" href="items?action=new">Add Item</a>
    <a class="dashboard-btn" href="items">List Items</a>

    <a class="dashboard-btn" href="bills?action=new">Add Bill</a>
    <a class="dashboard-btn" href="bills">List Bills</a>
    <a class="dashboard-btn" href="customers?action=search">Account Details</a>

    <a class="dashboard-btn" href="help">Help</a>


    <a class="dashboard-btn" href="logout">Logout</a>

</div>
</body>
</html>
