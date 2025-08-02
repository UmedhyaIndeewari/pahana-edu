<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.CustomerDTO" %>
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
            background-color: #100571;
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
    <title>Customers</title>
</head>
<body>
<div class="table-container">
    <h2>Customer List</h2>

    <div class="top-actions">
        <a href="dashboard">BACK</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Units Consumed</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");
            if (customers != null && !customers.isEmpty()) {
                for (CustomerDTO customer : customers) {
        %>
        <tr>
            <td><%= customer.getAccountNumber() %></td>
            <td><%= customer.getName() %></td>
            <td><%= customer.getAddress() %></td>
            <td><%= customer.getTelephone() %></td>
            <td><%= customer.getUnitsConsumed() %></td>
            <td>
                <a class="action-btn" href="customers?account_number=<%= customer.getAccountNumber() %>">Edit</a>
                <!-- Delete Button -->
                <form action="customers" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this customer?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="account_number" value="<%= customer.getAccountNumber() %>">
                    <input type="submit" class="action-btn delete-btn" value="Delete">
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No customers found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

