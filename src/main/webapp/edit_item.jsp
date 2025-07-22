<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.model.Item" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Item</title>

  <div class="top-actions">
    <a href="dashboard.jsp">BACK</a>
  </div>

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

    input[type="text"], input[type="number"] {
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
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
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
<%
  Item item = (Item) request.getAttribute("item");
%>
<div class="form-container">
  <h2>Edit Item</h2>
  <form action="items?action=edit" method="post">
    <input type="hidden" name="id" value="<%= item != null ? item.getId() : "" %>">

    <label for="name">Name</label>
    <input type="text" id="name" name="name"
           value="<%= item != null ? item.getName() : "" %>"
           required>

    <label for="category">Category</label>
    <input type="text" id="category" name="category"
           value="<%= item != null ? item.getCategory() : "" %>"
           required>

    <label for="stock_quantity">Stock Quantity</label>
    <input type="number" id="stock_quantity" name="stock_quantity"
           value="<%= item != null ? item.getStockQuantity() : "" %>"
           required>

    <label for="price_per_unit">Price Per Unit</label>
    <input type="number" step="0.01" id="price_per_unit" name="price_per_unit"
           value="<%= item != null ? item.getPricePerUnit() : "" %>"
           required>

    <input type="submit" value="Update Item">
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
