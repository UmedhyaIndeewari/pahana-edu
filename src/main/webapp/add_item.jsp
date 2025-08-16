<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
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

        input[type="text"],
        input[type="number"] {
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
    <h2>Add Item</h2>
    <form action="items?action=add" method="post">

        <label for="name">Item Name</label>
        <input type="text" id="name" name="name" required>

        <label for="category">Category</label>
        <input type="text" id="category" name="category" required>

        <label for="stockQuantity">Stock Quantity</label>
        <input type="number" id="stockQuantity" name="stock_quantity" required>

        <label for="pricePerUnit">Price Per Unit</label>
        <input type="number" step="0.01" id="pricePerUnit" name="price_per_unit" required>

        <input type="submit" value="Add Item">
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
