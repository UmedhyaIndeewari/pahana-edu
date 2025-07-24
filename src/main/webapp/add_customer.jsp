<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 40px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background-color: #100571;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #68d7ea;
        }

        .message {
            text-align: center;
            color: green;
            margin-top: 15px;
        }

        .error {
            text-align: center;
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="top-actions">
    <a href="dashboard">BACK</a>
</div>
<div class="form-container">
    <h2>Add Customer</h2>
    <form action="customers?action=add" method="post">

        <label for="name">Account Number</label>
        <input type="text" id="account_number" name="account_number" required>

        <label for="name">Name</label>
        <input type="text" id="name" name="name">

        <label for="address">Address</label>
        <input type="text" id="address" name="address">

        <label for="phone">Telephone</label>
        <input type="text" id="telephone" name="telephone">

        <label for="units_consumed">Units Consumed</label>
        <input type="text" id="units_consumed" name="units_consumed">

        <input type="submit" value="Add Customer">
    </form>

    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (message != null) {
    %>
    <div class="message"><%= message %></div>
    <% } else if (error != null) { %>
    <div class="error"><%= error %></div>
    <% } %>
</div>
</body>
</html>


