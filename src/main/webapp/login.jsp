<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Pahana Edu Bookshop</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      height: 100vh;
      align-items: center;
      justify-content: center;
    }
    .login-container {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      width: 300px;
    }
    .login-container h2 {
      margin-bottom: 20px;
      text-align: center;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px 8px;
      margin: 8px 0 16px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    input[type="submit"] {
      width: 100%;
      background-color: #74d94f;
      color: white;
      border: none;
      padding: 10px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }
    input[type="submit"]:hover {
      background-color: #74d94f;
    }
    .error-message {
      color: red;
      font-size: 0.9em;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h2>Pahana Edu Bookshop</h2>
  <form action="login" method="post">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>

    <input type="submit" value="Login">
  </form>

  <%-- Display error message if present --%>
  <%
    String error = (String) request.getAttribute("error");
    if (error != null) {
  %>
  <div class="error-message"><%= error %></div>
  <%
    }
  %>
</div>
</body>
</html>
