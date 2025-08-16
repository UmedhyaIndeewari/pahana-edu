<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.dto.CustomerDTO" %>

<%
    CustomerDTO customer = (CustomerDTO) request.getAttribute("customer");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Customer</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css' />">
    <style>
        .search-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #f5f5f5;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .search-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .result-box {
            margin-top: 30px;
            padding: 20px;
            background-color: #e1e1e1;
            border-radius: 10px;
        }

        .result-box p {
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="top-actions">
    <a href="dashboard">BACK</a>
</div>

<div class="search-container">
    <h2>Search Customer by Account Number</h2>
    <form action="customers" method="get">
        <div class="form-group">
            <label for="account_number">Account Number:</label>
            <input type="text" name="account_number" id="account_number" required />
            <input type="hidden" name="action" value="searched"/>
        </div>
        <button type="submit">Search</button>
    </form>

    <% if (message != null) { %>
    <div class="result-box">
        <p><%= message %></p>
    </div>
    <% } else if (customer != null) { %>
    <div class="result-box">
        <h4>Customer Details</h4>
        <p><strong>Account Number:</strong> <%= customer.getAccountNumber() %></p>
        <p><strong>Name:</strong> <%= customer.getName() %></p>
        <p><strong>Address:</strong> <%= customer.getAddress() %></p>
        <p><strong>Telephone:</strong> <%= customer.getTelephone() %></p>
    </div>
    <% } %>
</div>

</body>
</html>

