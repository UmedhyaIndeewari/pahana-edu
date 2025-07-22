<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.ItemDTO" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #eef2f3;
      padding: 40px;
    }

    .table-container {
      max-width: 900px;
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

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 12px 15px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #0d4708;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .action-btn {
      padding: 6px 12px;
      margin: 2px;
      background-color: #100571;
      color: white;
      border: none;
      border-radius: 4px;
      text-decoration: none;
    }

    .action-btn:hover {
      background-color: #100571;
    }

    .delete-btn {
      background-color: #dc3545;
    }

    .delete-btn:hover {
      background-color: #bd2130;
    }
  </style>
</head>
<body>
<div class="table-container">
  <h2>Item List</h2>

  <div class="top-actions">
    <a href="dashboard.jsp">BACK</a>
  </div>

  <table>
    <thead>
    <tr>
      <th>Item ID</th>
      <th>Name</th>
      <th>Category</th>
      <th>Stock Quantity</th>
      <th>Price Per Unit</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
      if (items != null && !items.isEmpty()) {
        for (ItemDTO item : items) {
    %>
    <tr>
      <td><%= item.getId() %></td>
      <td><%= item.getName() %></td>
      <td><%= item.getCategory() %></td>
      <td><%= item.getStockQuantity() %></td>
      <td><%= item.getPricePerUnit() %></td>
      <td>
        <a class="action-btn" href="items?action=edit&id=<%= item.getId() %>">Edit</a>
        <!-- Delete Button -->
        <form action="items" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this item?');">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="id" value="<%= item.getId() %>">
          <input type="submit" class="action-btn delete-btn" value="Delete">
        </form>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="6">No items found.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>

